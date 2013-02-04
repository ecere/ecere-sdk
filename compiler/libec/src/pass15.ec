import "ecdefs"

#define uint _uint
#include <stdlib.h>  // For strtoll
#undef uint

// UNTIL IMPLEMENTED IN GRAMMAR
#define ACCESS_CLASSDATA(_class, baseClass) \
   (_class ? ((void *)(((char *)_class.data) + baseClass.offsetClass)) : null)

#define YYLTYPE Location
#include "grammar.h"

extern OldList * ast;
extern int returnCode;
extern Expression parsedExpression;
extern bool yydebug;
public void SetYydebug(bool b) { yydebug = b; }
extern bool echoOn;

void resetScanner();

// TODO: Reset this to 0 on reinitialization
int propWatcherID;

int expression_yyparse();
static Statement curCompound;
External curExternal, afterExternal;
static Type curSwitchType;
static Class currentClass;
Class thisClass;
public void SetThisClass(Class c) { thisClass = c; } public Class GetThisClass() { return thisClass; }
static char * thisNameSpace;
/*static */Class containerClass;
bool thisClassParams = true;

uint internalValueCounter;

#ifdef _DEBUG
Time findSymbolTotalTime;
#endif

// WARNING: PrintExpression CONCATENATES to string. Please initialize.
/*static */public void PrintExpression(Expression exp, char * string)
{
   //if(inCompiler)
   {
      TempFile f { };
      int count;

      if(exp)
         OutputExpression(exp, f);
      f.Seek(0, start);
      count = strlen(string);
      count += f.Read(string + count, 1, 1023);
      string[count] = '\0';
      delete f;
   }
}

int64 _strtoi64(char * string, char ** endString, int base)
{
   int64 value = 0;
   int sign = 1;
   int c;
   char ch;
   for(c = 0; (ch = string[c]) && isspace(ch); c++);
   if(ch =='+') c++;
   else if(ch == '-') { sign = -1; c++; };
   if(!base)
   {
      if(ch == 0 && string[c+1] == 'x')
      {
         base = 16;
         c+=2;
      }
      else if(ch == '0')
      {
         base = 8;
         c++;
      }
      else
         base = 10;
   }
   for( ;(ch = string[c]); c++)
   {
      if(ch == '0')
         ch = 0;
      else if(ch >= '1' && ch <= '9')
         ch -= '1';
      else if(ch >= 'a' && ch <= 'z') 
         ch -= 'a'; 
      else if(ch >= 'A' && ch <= 'Z') 
         ch -= 'A';
      else
      {
         if(endString)
            *endString = string + c;
         // Invalid character
         break;
      }
      if(ch < base)
      {
         value *= base;
         value += ch;
      }
      else
      {
         if(endString)
            *endString = string + c;
         // Invalid character
         break;
      }
   }
   return sign*value;
}

uint64 _strtoui64(char * string, char ** endString, int base)
{
   uint64 value = 0;
   int sign = 1;
   int c;
   char ch;
   for(c = 0; (ch = string[c]) && isspace(ch); c++);
   if(ch =='+') c++;
   else if(ch == '-') { sign = -1; c++; };
   if(!base)
   {
      if(ch == 0 && string[c+1] == 'x')
      {
         base = 16;
         c+=2;
      }
      else if(ch == '0')
      {
         base = 8;
         c++;
      }
      else
         base = 10;
   }
   for( ;(ch = string[c]); c++)
   {
      if(ch == '0')
         ch = 0;
      else if(ch >= '1' && ch <= '9')
         ch -= '1';
      else if(ch >= 'a' && ch <= 'z') 
         ch -= 'a'; 
      else if(ch >= 'A' && ch <= 'Z') 
         ch -= 'A';
      else
      {
         if(endString) *endString = string + c;
         // Invalid character
         break;
      }
      if(ch < base)
      {
         value *= base;
         value += ch;
      }
      else
      {
         if(endString)
            *endString = string + c;
         // Invalid character
         break;
      }
   }
   return sign*value;
}

Type ProcessTemplateParameterType(TemplateParameter param)
{
   if(param && param.type == TemplateParameterType::type && (param.dataType || param.dataTypeString))
   {
      // TOFIX: Will need to free this Type
      if(!param.baseType)
      {
         if(param.dataTypeString)
            param.baseType = ProcessTypeString(param.dataTypeString, false);
         else
            param.baseType = ProcessType(param.dataType.specifiers, param.dataType.decl);
      }
      return param.baseType;
   }
   return null;
}

bool NeedCast(Type type1, Type type2)
{
   if(!type1 || !type2 || type1.keepCast || type2.keepCast) return true;

   if(type1.kind == templateType && type2.kind == int64Type && type2.passAsTemplate == false)
   {
      return false;
   }

   if(type1.kind == type2.kind)
   {
      switch(type1.kind)
      {
         case charType:
         case shortType:
         case intType:
         case int64Type:
         case intPtrType:
            if(type1.passAsTemplate && !type2.passAsTemplate)
               return true;
            return type1.isSigned != type2.isSigned;
         case classType:
            return type1._class != type2._class;
         case pointerType:
            return NeedCast(type1.type, type2.type);
         default:
            return true; //false; ????
      }
   }
   return true;
}

static void ReplaceClassMembers(Expression exp, Class _class)
{
   if(exp.type == identifierExp && exp.identifier)
   {
      Identifier id = exp.identifier;
      Context ctx;
      Symbol symbol = null;
      if(!id._class || !id._class.name || strcmp(id._class.name, "property"))
      {
         // First, check if the identifier is declared inside the function
         for(ctx = curContext; ctx != topContext.parent && !symbol; ctx = ctx.parent)
         {
            symbol = (Symbol)ctx.symbols.FindString(id.string);
            if(symbol) break;
         }
      }

      // If it is not, check if it is a member of the _class
      if(!symbol && ((!id._class || (id._class.name && !strcmp(id._class.name, "property"))) || (id.classSym && eClass_IsDerived(_class, id.classSym.registered))))
      {
         Property prop = eClass_FindProperty(_class, id.string, privateModule);
         Method method = null;
         DataMember member = null;
         ClassProperty classProp = null;
         if(!prop)
         {
            method = eClass_FindMethod(_class, id.string, privateModule);
         }
         if(!prop && !method)
            member = eClass_FindDataMember(_class, id.string, privateModule, null, null);
         if(!prop && !method && !member)
         {
            classProp = eClass_FindClassProperty(_class, id.string);
         }
         if(prop || method || member || classProp)
         {
            // Replace by this.[member]
            exp.type = memberExp;
            exp.member.member = id;
            exp.member.memberType = unresolvedMember;
            exp.member.exp = QMkExpId("this");
            //exp.member.exp.loc = exp.loc;
            exp.addedThis = true;
         }
         else if(_class && _class.templateParams.first)
         {
            Class sClass;
            for(sClass = _class; sClass; sClass = sClass.base)
            {
               if(sClass.templateParams.first)
               {
                  ClassTemplateParameter param;
                  for(param = sClass.templateParams.first; param; param = param.next)
                  {
                     if(param.type == expression && !strcmp(param.name, id.string))
                     {
                        Expression argExp = GetTemplateArgExpByName(param.name, _class, TemplateParameterType::expression);

                        if(argExp)
                        {
                           Declarator decl;
                           OldList * specs = MkList();

                           FreeIdentifier(exp.member.member);

                           ProcessExpressionType(argExp);

                           decl = SpecDeclFromString(param.dataTypeString, specs, null);

                           exp.expType = ProcessType(specs, decl);

                           // *[expType] *[argExp]
                           exp.type = bracketsExp;
                           exp.list = MkListOne(MkExpOp(null, '*',
                              MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), MkExpOp(null, '&', argExp))));
                        }
                     }
                  }
               }
            }
         }
      }
   }
}

////////////////////////////////////////////////////////////////////////
// PRINTING ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

public char * PrintInt(int64 result)
{
   char temp[100];
   if(result > MAXINT64)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64XLL"*/, result);
   else
      sprintf(temp, FORMAT64DLL /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintUInt(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64XLL"*/, result);
   else if(result > MAXINT)
      sprintf(temp, FORMAT64HEX /*"0x%I64X"*/, result);
   else
      sprintf(temp, FORMAT64D /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintInt64(int64 result)
{
   char temp[100];
   sprintf(temp, FORMAT64DLL /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintUInt64(uint64 result)
{
   char temp[100];
   if(result > MAXINT64)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64XLL"*/, result);
   else
      sprintf(temp, FORMAT64DLL /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintHexUInt(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64xLL"*/, result);
   else
      sprintf(temp, FORMAT64HEX /*"0x%I64x"*/, result);
   return CopyString(temp);
}

public char * PrintHexUInt64(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64xLL"*/, result);
   else
      sprintf(temp, FORMAT64HEX /*"0x%I64x"*/, result);
   return CopyString(temp);
}

public char * PrintShort(short result)
{
   char temp[100];
   sprintf(temp, "%d", (unsigned short)result);
   return CopyString(temp);
}

public char * PrintUShort(unsigned short result)
{
   char temp[100];
   if(result > 32767)
      sprintf(temp, "0x%X", (int)result);
   else
      sprintf(temp, "%d", result);
   return CopyString(temp);
}

public char * PrintChar(char result)
{
   char temp[100];
   if(result > 0 && isprint(result))
      sprintf(temp, "'%c'", result);
   else if(result < 0)
      sprintf(temp, "%d", result);
   else
      //sprintf(temp, "%#X", result);
      sprintf(temp, "0x%X", (unsigned char)result);
   return CopyString(temp);
}

public char * PrintUChar(unsigned char result)
{
   char temp[100];
   sprintf(temp, "0x%X", result);
   return CopyString(temp);
}

public char * PrintFloat(float result)
{
   char temp[350];
   sprintf(temp, "%.16ff", result);
   return CopyString(temp);
}

public char * PrintDouble(double result)
{
   char temp[350];
   sprintf(temp, "%.16f", result);
   return CopyString(temp);
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

//public Operand GetOperand(Expression exp);

#define GETVALUE(name, t) \
   public bool Get##name(Expression exp, t * value2) \
   {                                                        \
      Operand op2 = GetOperand(exp);                        \
      if(op2.kind == intType && op2.type.isSigned) *value2 = (t) op2.i; \
      else if(op2.kind == intType) *value2 = (t) op2.ui;                 \
      if(op2.kind == int64Type && op2.type.isSigned) *value2 = (t) op2.i64; \
      else if(op2.kind == int64Type) *value2 = (t) op2.ui64;                 \
      else if(op2.kind == intPtrType && op2.type.isSigned) *value2 = (t) op2.iptr; \
      else if(op2.kind == intPtrType) *value2 = (t) op2.uiptr;                 \
      else if(op2.kind == shortType && op2.type.isSigned) *value2 = (t) op2.s;   \
      else if(op2.kind == shortType) *value2 = (t) op2.us;                        \
      else if(op2.kind == charType && op2.type.isSigned) *value2 = (t) op2.c;    \
      else if(op2.kind == charType) *value2 = (t) op2.uc;                         \
      else if(op2.kind == floatType) *value2 = (t) op2.f;                         \
      else if(op2.kind == doubleType) *value2 = (t) op2.d;                        \
      else if(op2.kind == pointerType) *value2 = (t) op2.ui;                        \
      else                                                                          \
         return false;                                                              \
      return true;                                                                  \
   }

GETVALUE(Int, int);
GETVALUE(UInt, unsigned int);
GETVALUE(Int64, int64);
GETVALUE(UInt64, uint64);
GETVALUE(IntPtr, intptr);
GETVALUE(UIntPtr, uintptr);
GETVALUE(Short, short);
GETVALUE(UShort, unsigned short);
GETVALUE(Char, char);
GETVALUE(UChar, unsigned char);
GETVALUE(Float, float);
GETVALUE(Double, double);

void ComputeExpression(Expression exp);

void ComputeClassMembers(Class _class, bool isMember)
{
   DataMember member = isMember ? (DataMember) _class : null;
   Context context = isMember ? null : SetupTemplatesContext(_class);
   if(member || ((_class.type == bitClass || _class.type == normalClass || _class.type == structClass || _class.type == noHeadClass) && 
                 (_class.type == bitClass || _class.structSize == _class.offset) && _class.computeSize))
   {
      int c;
      int unionMemberOffset = 0;
      int bitFields = 0;

      if(!member && _class.destructionWatchOffset)
         _class.memberOffset += sizeof(OldList);

      // To avoid reentrancy...
      //_class.structSize = -1;

      {
         DataMember dataMember;
         for(dataMember = member ? member.members.first : _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
         {
            if(!dataMember.isProperty)
            {
               if(dataMember.type == normalMember && dataMember.dataTypeString && !dataMember.dataType)
               {
                  /*if(dataMember.dataType)
                     printf("");*/
                  dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
                  /*if(!dataMember.dataType)
                     dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
                     */
               }
            }
         }
      }

      {
         DataMember dataMember;
         for(dataMember = member ? member.members.first : _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
         {
            if(!dataMember.isProperty && (dataMember.type != normalMember || dataMember.dataTypeString))
            {
               if(!isMember && _class.type == bitClass && dataMember.dataType)
               {
                  BitMember bitMember = (BitMember) dataMember;
                  uint64 mask = 0;
                  int d;

                  ComputeTypeSize(dataMember.dataType);

                  if(bitMember.pos == -1) bitMember.pos = _class.memberOffset;
                  if(!bitMember.size) bitMember.size = dataMember.dataType.size * 8;

                  _class.memberOffset = bitMember.pos + bitMember.size;
                  for(d = 0; d<bitMember.size; d++)
                  {
                     if(d)
                        mask <<= 1;
                     mask |= 1;
                  }
                  bitMember.mask = mask << bitMember.pos;
               }
               else if(dataMember.type == normalMember && dataMember.dataType)
               {
                  int size;
                  int alignment = 0;

                  // Prevent infinite recursion
                  if(dataMember.dataType.kind != classType || 
                     ((!dataMember.dataType._class || !dataMember.dataType._class.registered || dataMember.dataType._class.registered != _class ||
                     _class.type != structClass)))
                     ComputeTypeSize(dataMember.dataType);

                  if(dataMember.dataType.bitFieldCount)
                  {
                     bitFields += dataMember.dataType.bitFieldCount;
                     size = 0;
                  }
                  else
                  {
                     if(bitFields)
                     {
                        int size = (bitFields + 7) / 8;

                        if(isMember)
                        {
                           // TESTING THIS PADDING CODE
                           if(alignment)
                           {
                              member.structAlignment = Max(member.structAlignment, alignment);

                              if(member.memberOffset % alignment)
                                 member.memberOffset += alignment - (member.memberOffset % alignment);
                           }

                           dataMember.offset = member.memberOffset;
                           if(member.type == unionMember)
                              unionMemberOffset = Max(unionMemberOffset, dataMember.dataType.size);
                           else
                           {
                              member.memberOffset += size;
                           }
                        }
                        else
                        {
                           // TESTING THIS PADDING CODE
                           if(alignment)
                           {
                              _class.structAlignment = Max(_class.structAlignment, alignment);

                              if(_class.memberOffset % alignment)
                                 _class.memberOffset += alignment - (_class.memberOffset % alignment);
                           }

                           dataMember.offset = _class.memberOffset;
                           _class.memberOffset += size;
                        }
                        bitFields = 0;
                     }
                     size = dataMember.dataType.size;
                     alignment = dataMember.dataType.alignment;
                  }

#ifdef _DEBUG
                  if(!size)
                  {
                     // printf("");
                  }
#endif
                  if(isMember)
                  {
                     // TESTING THIS PADDING CODE
                     if(alignment)
                     {
                        member.structAlignment = Max(member.structAlignment, alignment);

                        if(member.memberOffset % alignment)
                           member.memberOffset += alignment - (member.memberOffset % alignment);
                     }

                     dataMember.offset = member.memberOffset;
                     if(member.type == unionMember)
                        unionMemberOffset = Max(unionMemberOffset, dataMember.dataType.size);
                     else
                     {
                        member.memberOffset += size;
                     }
                  }
                  else
                  {
                     // TESTING THIS PADDING CODE
                     if(alignment)
                     {
                        _class.structAlignment = Max(_class.structAlignment, alignment);

                        if(_class.memberOffset % alignment)
                           _class.memberOffset += alignment - (_class.memberOffset % alignment);
                     }

                     dataMember.offset = _class.memberOffset;
                     _class.memberOffset += size;
                  }
               }
               else
               {
                  ComputeClassMembers((Class)dataMember, true);

                  if(isMember)
                  {
                     // THERE WASN'T A MAX HERE ? member.structAlignment = dataMember.structAlignment;
                     member.structAlignment = Max(member.structAlignment, dataMember.structAlignment);
                     dataMember.offset = member.memberOffset;
                     if(member.type == unionMember)
                        unionMemberOffset = Max(unionMemberOffset, dataMember.memberOffset);
                     else
                        member.memberOffset += dataMember.memberOffset;
                  }
                  else
                  {
                     _class.structAlignment = Max(_class.structAlignment, dataMember.structAlignment);
                     dataMember.offset = _class.memberOffset;
                     _class.memberOffset += dataMember.memberOffset;
                  }
               }
            }
         }
         if(bitFields)
         {
            int alignment = 0;
            int size = (bitFields + 7) / 8;

            if(isMember)
            {
               // TESTING THIS PADDING CODE
               if(alignment)
               {
                  member.structAlignment = Max(member.structAlignment, alignment);

                  if(member.memberOffset % alignment)
                     member.memberOffset += alignment - (member.memberOffset % alignment);
               }

               if(member.type == unionMember)
                  unionMemberOffset = Max(unionMemberOffset, dataMember.dataType.size);
               else
               {
                  member.memberOffset += size;
               }
            }
            else
            {
               // TESTING THIS PADDING CODE
               if(alignment)
               {
                  _class.structAlignment = Max(_class.structAlignment, alignment);

                  if(_class.memberOffset % alignment)
                     _class.memberOffset += alignment - (_class.memberOffset % alignment);
               }
               _class.memberOffset += size;
            }
            bitFields = 0;
         }
      }
      if(member && member.type == unionMember)
      {
         member.memberOffset = unionMemberOffset;
      }
      
      if(!isMember)
      {
         /*if(_class.type == structClass)
            _class.size = _class.memberOffset;
         else
         */

         if(_class.type != bitClass)
         {
            _class.structSize = (_class.base ? (_class.base.templateClass ? _class.base.templateClass.structSize : _class.base.structSize) : 0) + _class.memberOffset;
            if(!member)
            {
               Property prop;
               for(prop = _class.membersAndProperties.first; prop; prop = prop.next)
               {
                  if(prop.isProperty && prop.isWatchable)
                  {
                     prop.watcherOffset = _class.structSize;
                     _class.structSize += sizeof(OldList);
                  }
               }
            }

            // Fix Derivatives
            {
               OldLink derivative;
               for(derivative = _class.derivatives.first; derivative; derivative = derivative.next)
               {
                  Class deriv = derivative.data;

                  if(deriv.computeSize)
                  {
                     // TESTING THIS NEW CODE HERE... TRYING TO FIX ScrollBar MEMBERS DEBUGGING
                     deriv.offset = /*_class.offset + */_class.structSize;
                     deriv.memberOffset = 0;
                     // ----------------------

                     deriv.structSize = deriv.offset;

                     ComputeClassMembers(deriv, false);
                  }
               }
            }
         }
      }
   }
   if(context)
      FinishTemplatesContext(context);
}

public void ComputeModuleClasses(Module module)
{
   Class _class;
   OldLink subModule;
   
   for(subModule = module.modules.first; subModule; subModule = subModule.next)
      ComputeModuleClasses(subModule.data);
   for(_class = module.classes.first; _class; _class = _class.next)
      ComputeClassMembers(_class, false);
}


public int ComputeTypeSize(Type type)
{
   uint size = type ? type.size : 0;
   if(!size && type && !type.computing)
   {
      type.computing = true;
      switch(type.kind)
      {
         case charType: type.alignment = size = sizeof(char); break;
         case intType: type.alignment = size = sizeof(int); break;
         case int64Type: type.alignment = size = sizeof(int64); break;
         case intPtrType: type.alignment = size = sizeof(intptr); break;
         case longType: type.alignment = size = sizeof(long); break;
         case shortType: type.alignment = size = sizeof(short); break;
         case floatType: type.alignment = size = sizeof(float); break;
         case doubleType: type.alignment = size = sizeof(double); break;
         case classType:
         {
            Class _class = type._class ? type._class.registered : null;

            if(_class && _class.type == structClass)
            {
               // Ensure all members are properly registered
               ComputeClassMembers(_class, false);
               type.alignment = _class.structAlignment;
               size = _class.structSize;
               if(type.alignment && size % type.alignment)
                  size += type.alignment - (size % type.alignment);

            }
            else if(_class && (_class.type == unitClass || 
                   _class.type == enumClass || 
                   _class.type == bitClass))
            {
               if(!_class.dataType)
                  _class.dataType = ProcessTypeString(_class.dataTypeString, false);
               size = type.alignment = ComputeTypeSize(_class.dataType);
            }
            else
               size = type.alignment = sizeof(Instance *);
            break;
         }
         case pointerType: case subClassType: size = type.alignment = sizeof(void *); break;
         case arrayType: 
            if(type.arraySizeExp)
            {
               ProcessExpressionType(type.arraySizeExp);
               ComputeExpression(type.arraySizeExp);
               if(!type.arraySizeExp.isConstant || (type.arraySizeExp.expType.kind != intType && type.arraySizeExp.expType.kind != enumType && 
                  (type.arraySizeExp.expType.kind != classType || !type.arraySizeExp.expType._class.registered || type.arraySizeExp.expType._class.registered.type != enumClass)))
               {
                  Location oldLoc = yylloc;
                  // bool isConstant = type.arraySizeExp.isConstant;
                  char expression[10240];
                  expression[0] = '\0';
                  type.arraySizeExp.expType = null;
                  yylloc = type.arraySizeExp.loc;
                  if(inCompiler)
                     PrintExpression(type.arraySizeExp, expression);
                  Compiler_Error($"Array size not constant int (%s)\n", expression);
                  yylloc = oldLoc;
               }
               GetInt(type.arraySizeExp, &type.arraySize);
#ifdef _DEBUG
               if(!type.arraySize)
               {
                  printf("");
               }
#endif
            }
            else if(type.enumClass)
            {
               if(type.enumClass && type.enumClass.registered && type.enumClass.registered.type == enumClass)
               {
                  type.arraySize = eClass_GetProperty(type.enumClass.registered, "enumSize");
               }
               else
                  type.arraySize = 0;
            }
            else
            {
               // Unimplemented auto size
               type.arraySize = 0;
            }

            size = ComputeTypeSize(type.type) * type.arraySize;
            type.alignment = type.type.alignment;
            
            break;
         case structType:
         {
            Type member;
            for(member = type.members.first; member; member = member.next)
            {
               uint addSize = ComputeTypeSize(member);

               member.offset = size;
               if(member.alignment && size % member.alignment)
                  member.offset += member.alignment - (size % member.alignment);
               size = member.offset;

               type.alignment = Max(type.alignment, member.alignment);
               size += addSize;
            }
            if(type.alignment && size % type.alignment)
               size += type.alignment - (size % type.alignment);
            break;
         }
         case unionType:
         {
            Type member;
            for(member = type.members.first; member; member = member.next)
            {
               uint addSize = ComputeTypeSize(member);
               
               member.offset = size;
               if(member.alignment && size % member.alignment)
                  member.offset += member.alignment - (size % member.alignment);
               size = member.offset;

               type.alignment = Max(type.alignment, member.alignment);
               size = Max(size, addSize);
            }
            if(type.alignment && size % type.alignment)
               size += type.alignment - (size % type.alignment);
            break;
         }
         case templateType:
         {
            TemplateParameter param = type.templateParameter;
            Type baseType = ProcessTemplateParameterType(param);
            if(baseType)
               size = ComputeTypeSize(baseType);
            else
               size = sizeof(uint64);
            break;
         }
         case enumType:
         {
            size = sizeof(enum { test });
            break;
         }
         case thisClassType:
         {
            size = sizeof(void *);
            break;
         }
      }
      type.size = size;
      type.computing = false;
   }
   return size;
}


/*static */int AddMembers(OldList * declarations, Class _class, bool isMember, uint * retSize, Class topClass)
{
   // This function is in need of a major review when implementing private members etc.
   DataMember topMember = isMember ? (DataMember) _class : null;
   uint totalSize = 0;
   uint maxSize = 0;
   int alignment, size;
   DataMember member;
   Context context = isMember ? null : SetupTemplatesContext(_class);

   if(!isMember && _class.base)
   {
      maxSize = _class.structSize;
      //if(_class.base.type != systemClass) // Commented out with new Instance _class
      {
         // DANGER: Testing this noHeadClass here...
         if(_class.type == structClass || _class.type == noHeadClass)
            /*totalSize = */AddMembers(declarations, _class.base, false, &totalSize, topClass);
         else
            maxSize -= _class.base.templateClass ? _class.base.templateClass.structSize : _class.base.structSize;
      }
   }

   for(member = isMember ? topMember.members.first : _class.membersAndProperties.first; member; member = member.next)
   {
      if(!member.isProperty)
      {
         switch(member.type)
         {
            case normalMember:
            {
               if(member.dataTypeString)
               {
                  OldList * specs = MkList(), * decls = MkList();
                  Declarator decl;

                  decl = SpecDeclFromString(member.dataTypeString, specs, 
                     MkDeclaratorIdentifier(MkIdentifier(member.name)));
                  ListAdd(decls, MkStructDeclarator(decl, null));
                  ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, decls, null)));

                  if(!member.dataType)
                     member.dataType = ProcessType(specs, decl);

                  ReplaceThisClassSpecifiers(specs, topClass /*member._class*/);

                  {
                     Type type = ProcessType(specs, decl);
                     DeclareType(member.dataType, false, false);
                     FreeType(type);
                  }
                  /*
                  if(member.dataType && member.dataType.kind == classType && member.dataType._class &&
                     member.dataType._class.registered && member.dataType._class.registered.type == structClass)
                     DeclareStruct(member.dataType._class.string, false);
                  */

                  ComputeTypeSize(member.dataType);
                  size = member.dataType.size;
                  alignment = member.dataType.alignment;

                  if(alignment)
                  {
                     if(totalSize % alignment)
                        totalSize += alignment - (totalSize % alignment);
                  }
                  totalSize += size;
               }
               break;
            }
            case unionMember:
            case structMember:
            {
               OldList * specs = MkList(), * list = MkList();
               
               size = 0;
               AddMembers(list, (Class)member, true, &size, topClass);
               ListAdd(specs, 
                  MkStructOrUnion((member.type == unionMember)?unionSpecifier:structSpecifier, null, list));
               ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, null, null)));
               alignment = member.structAlignment;

               if(alignment)
               {
                  if(totalSize % alignment)
                     totalSize += alignment - (totalSize % alignment);
               }
               totalSize += size;
               break;
            }
         }
      }
   }
   if(retSize)
   {
      if(topMember && topMember.type == unionMember)
         *retSize = Max(*retSize, totalSize);
      else
         *retSize += totalSize;
   }
   else if(totalSize < maxSize && _class.type != systemClass)
   {
      char sizeString[50];
      sprintf(sizeString, "%d", maxSize - totalSize);
      ListAdd(declarations, 
         MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(CHAR)), 
         MkListOne(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("__ecere_padding")), MkExpConstant(sizeString))), null)));
   }
   if(context)
      FinishTemplatesContext(context);
   return topMember ? topMember.memberID : _class.memberID;
}

static int DeclareMembers(Class _class, bool isMember)
{
   DataMember topMember = isMember ? (DataMember) _class : null;
   uint totalSize = 0;
   DataMember member;
   Context context = isMember ? null : SetupTemplatesContext(_class);
   
   if(!isMember && (_class.type == structClass || _class.type == noHeadClass) && _class.base.type != systemClass)
      DeclareMembers(_class.base, false);

   for(member = isMember ? topMember.members.first : _class.membersAndProperties.first; member; member = member.next)
   {
      if(!member.isProperty)
      {
         switch(member.type)
         {
            case normalMember:
            {
               /*
               if(member.dataType && member.dataType.kind == classType && member.dataType._class &&
                  member.dataType._class.registered && member.dataType._class.registered.type == structClass)
                  DeclareStruct(member.dataType._class.string, false);
                  */
               if(!member.dataType && member.dataTypeString)
                  member.dataType = ProcessTypeString(member.dataTypeString, false);
               if(member.dataType)
                  DeclareType(member.dataType, false, false);
               break;
            }
            case unionMember:
            case structMember:
            {
               DeclareMembers((Class)member, true);
               break;
            }
         }
      }
   }
   if(context)
      FinishTemplatesContext(context);

   return topMember ? topMember.memberID : _class.memberID;
}

void DeclareStruct(char * name, bool skipNoHead)
{
   External external = null;
   Symbol classSym = FindClass(name);

   if(!inCompiler || !classSym) return null;

   // We don't need any declaration for bit classes...
   if(classSym.registered && 
      (classSym.registered.type == bitClass || classSym.registered.type == unitClass || classSym.registered.type == enumClass))
      return null;

   /*if(classSym.registered.templateClass)
      return DeclareStruct(classSym.registered.templateClass.fullName, skipNoHead);
   */

   if(classSym.registered && classSym.imported && !classSym.declaredStructSym)
   {
      // Add typedef struct
      Declaration decl;
      OldList * specifiers, * declarators;
      OldList * declarations = null;
      char structName[1024];
      external = (classSym.registered && classSym.registered.type == structClass) ? 
         classSym.pointerExternal : classSym.structExternal;

      // TEMPORARY HACK: Pass 3 will move up struct declarations without moving members
      // Moved this one up because DeclareClass done later will need it

      classSym.declaring++;

      if(strchr(classSym.string, '<'))
      {
         if(classSym.registered.templateClass)
         {
            DeclareStruct(classSym.registered.templateClass.fullName, skipNoHead);
            classSym.declaring--;
         }
         return null;
      }
      
      //if(!skipNoHead)
         DeclareMembers(classSym.registered, false);

      structName[0] = 0;
      FullClassNameCat(structName, name, false);

      /*if(!external)      
         external = MkExternalDeclaration(null);*/

      if(!skipNoHead)
      {
         classSym.declaredStructSym = true;

         declarations = MkList();

         AddMembers(declarations, classSym.registered, false, null, classSym.registered);

         //ListAdd(specifiers, MkSpecifier(TYPEDEF));
         //ListAdd(specifiers, MkStructOrUnion(structSpecifier, null, declarations));

         if(!declarations->count)
         {
            FreeList(declarations, null);
            declarations = null;
         }
      }
      if(skipNoHead || declarations)
      {
         if(external && external.declaration)
         {
            ((Specifier)external.declaration.specifiers->first).definitions = declarations;

            if(curExternal && curExternal.symbol && curExternal.symbol.idCode < classSym.id)
            {
               // TODO: Fix this
               //ast->Move(classSym.structExternal ? classSym.structExternal : classSym.pointerExternal, curExternal.prev);

               // DANGER
               if(classSym.structExternal)
                  ast->Move(classSym.structExternal, curExternal.prev);
               ast->Move(classSym.pointerExternal, curExternal.prev);

               classSym.id = curExternal.symbol.idCode;
               classSym.idCode = curExternal.symbol.idCode;
               // external = classSym.pointerExternal;
               //external = classSym.structExternal ? classSym.structExternal : classSym.pointerExternal;
            }
         }
         else
         {
            if(!external)      
               external = MkExternalDeclaration(null);

            specifiers = MkList();
            declarators = MkList();
            ListAdd(specifiers, MkStructOrUnion(structSpecifier, MkIdentifier(structName), declarations));

            /*
            d = MkDeclaratorIdentifier(MkIdentifier(structName));
            ListAdd(declarators, MkInitDeclarator(d, null));
            */
            external.declaration = decl = MkDeclaration(specifiers, declarators);
            if(decl.symbol && !decl.symbol.pointerExternal)
               decl.symbol.pointerExternal = external;

            // For simple classes, keep the declaration as the external to move around
            if(classSym.registered && classSym.registered.type == structClass)
            {
               char className[1024];
               strcpy(className, "__ecereClass_");
               FullClassNameCat(className, classSym.string, true);
               MangleClassName(className);

               // Testing This
               DeclareClass(classSym, className);

               external.symbol = classSym;
               classSym.pointerExternal = external;
               classSym.id = (curExternal && curExternal.symbol) ? curExternal.symbol.idCode : 0;
               classSym.idCode = (curExternal && curExternal.symbol) ? curExternal.symbol.idCode : 0;
            }
            else
            {
               char className[1024];
               strcpy(className, "__ecereClass_");
               FullClassNameCat(className, classSym.string, true);
               MangleClassName(className);

               // TOFIX: TESTING THIS...
               classSym.structExternal = external;
               DeclareClass(classSym, className);
               external.symbol = classSym;
            }

            //if(curExternal)
               ast->Insert(curExternal ? curExternal.prev : null, external);
         }
      }

      classSym.declaring--;
   }
   else if(curExternal && curExternal.symbol && curExternal.symbol.idCode < classSym.id)
   {
      // TEMPORARY HACK: Pass 3 will move up struct declarations without moving members
      // Moved this one up because DeclareClass done later will need it

      // TESTING THIS:
      classSym.declaring++;

      //if(!skipNoHead)
      {
         if(classSym.registered)
            DeclareMembers(classSym.registered, false);
      }

      if(classSym.registered && (classSym.registered.type == structClass || classSym.registered.type == noHeadClass))
      {
         // TODO: Fix this
         //ast->Move(classSym.structExternal ? classSym.structExternal : classSym.pointerExternal, curExternal.prev);

         // DANGER
         if(classSym.structExternal)
            ast->Move(classSym.structExternal, curExternal.prev);
         ast->Move(classSym.pointerExternal, curExternal.prev);

         classSym.id = curExternal.symbol.idCode;
         classSym.idCode = curExternal.symbol.idCode;
         // external = classSym.pointerExternal;
         // external = classSym.structExternal ? classSym.structExternal : classSym.pointerExternal;
      }

      classSym.declaring--;
   }
   //return external;
}

void DeclareProperty(Property prop, char * setName, char * getName)
{
   Symbol symbol = prop.symbol;
   char propName[1024];

   strcpy(setName, "__ecereProp_");
   FullClassNameCat(setName, prop._class.fullName, false);
   strcat(setName, "_Set_");
   // strcat(setName, prop.name);
   FullClassNameCat(setName, prop.name, true);

   strcpy(getName, "__ecereProp_");
   FullClassNameCat(getName, prop._class.fullName, false);
   strcat(getName, "_Get_");
   FullClassNameCat(getName, prop.name, true);
   // strcat(getName, prop.name);

   strcpy(propName, "__ecereProp_");
   FullClassNameCat(propName, prop._class.fullName, false);
   strcat(propName, "_");
   FullClassNameCat(propName, prop.name, true);
   // strcat(propName, prop.name);

   // To support "char *" property
   MangleClassName(getName);
   MangleClassName(setName);
   MangleClassName(propName);

   if(prop._class.type == structClass)
      DeclareStruct(prop._class.fullName, false);

   if(!symbol || curExternal.symbol.idCode < symbol.id)
   {
      bool imported = false;
      bool dllImport = false;
      if(!symbol || symbol._import)
      {
         if(!symbol)
         {
            Symbol classSym;
            if(!prop._class.symbol)
               prop._class.symbol = FindClass(prop._class.fullName);
            classSym = prop._class.symbol;
            if(classSym && !classSym._import)
            {
               ModuleImport module;

               if(prop._class.module)
                  module = FindModule(prop._class.module);
               else
                  module = mainModule;

               classSym._import = ClassImport
               {
                  name = CopyString(prop._class.fullName);
                  isRemote = prop._class.isRemote;
               };
               module.classes.Add(classSym._import);
            }
            symbol = prop.symbol = Symbol { };
            symbol._import = (ClassImport)PropertyImport
            {
               name = CopyString(prop.name);
               isVirtual = false; //prop.isVirtual;
               hasSet = prop.Set ? true : false;
               hasGet = prop.Get ? true : false;
            };
            if(classSym)
               classSym._import.properties.Add(symbol._import);
         }
         imported = true;
         if(prop._class.module != privateModule && prop._class.module.importType != staticImport)
            dllImport = true;
      }

      if(!symbol.type)
      {
         Context context = SetupTemplatesContext(prop._class);
         symbol.type = ProcessTypeString(prop.dataTypeString, false);
         FinishTemplatesContext(context);
      }

      // Get
      if(prop.Get)
      {
         if(!symbol.externalGet || symbol.externalGet.type == functionExternal)
         {
            Declaration decl;
            OldList * specifiers, * declarators;
            Declarator d;
            OldList * params;
            Specifier spec;
            External external;
            Declarator typeDecl;
            bool simple = false;

            specifiers = MkList();
            declarators = MkList();
            params = MkList();

            ListAdd(params, MkTypeName(MkListOne(MkSpecifierName /*MkClassName*/(prop._class.fullName)), 
               MkDeclaratorIdentifier(MkIdentifier("this"))));

            d = MkDeclaratorIdentifier(MkIdentifier(getName));
            //if(imported)
            if(dllImport)
               d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), d));

            {
               Context context = SetupTemplatesContext(prop._class);
               typeDecl = SpecDeclFromString(prop.dataTypeString, specifiers, null);
               FinishTemplatesContext(context);
            }

            // Make sure the simple _class's type is declared
            for(spec = specifiers->first; spec; spec = spec.next)
            {
               if(spec.type == nameSpecifier /*SpecifierClass*/)
               {
                  if((!typeDecl || typeDecl.type == identifierDeclarator))
                  {
                     Symbol classSym = spec.symbol; // FindClass(spec.name);
                     symbol._class = classSym.registered;
                     if(classSym.registered && classSym.registered.type == structClass)
                     {
                        DeclareStruct(spec.name, false);
                        simple = true;
                     }
                  }
               }
            }

            if(!simple)
               d = PlugDeclarator(typeDecl, d);
            else
            {
               ListAdd(params, MkTypeName(specifiers, 
                  PlugDeclarator(typeDecl, MkDeclaratorIdentifier(MkIdentifier("value")))));
               specifiers = MkList();
            }

            d = MkDeclaratorFunction(d, params);
 
            //if(imported)
            if(dllImport)
               specifiers->Insert(null, MkSpecifier(EXTERN));
            else if(prop._class.symbol && ((Symbol)prop._class.symbol).isStatic)
               specifiers->Insert(null, MkSpecifier(STATIC));
            if(simple)
               ListAdd(specifiers, MkSpecifier(VOID));

            ListAdd(declarators, MkInitDeclarator(d, null));

            decl = MkDeclaration(specifiers, declarators);

            external = MkExternalDeclaration(decl);
            ast->Insert(curExternal.prev, external);
            external.symbol = symbol;
            symbol.externalGet = external;

            ReplaceThisClassSpecifiers(specifiers, prop._class);

            if(typeDecl)
               FreeDeclarator(typeDecl);
         }
         else
         {
            // Move declaration higher...
            ast->Move(symbol.externalGet, curExternal.prev);
         }
      }

      // Set
      if(prop.Set)
      {
         if(!symbol.externalSet || symbol.externalSet.type == functionExternal)
         {
            Declaration decl;
            OldList * specifiers, * declarators;
            Declarator d;
            OldList * params;
            Specifier spec;
            External external;
            Declarator typeDecl;

            declarators = MkList();
            params = MkList();

            // TESTING COMMENTING THIS FIRST LINE OUT, what was the problem? Trying to add noHeadClass here ...
            if(!prop.conversion || prop._class.type == structClass)
            {
               ListAdd(params, MkTypeName(MkListOne(MkSpecifierName/*MkClassName*/(prop._class.fullName)), 
                  MkDeclaratorIdentifier(MkIdentifier("this"))));
            }

            specifiers = MkList();

            {
               Context context = SetupTemplatesContext(prop._class);
               typeDecl = d = SpecDeclFromString(prop.dataTypeString, specifiers,
                  MkDeclaratorIdentifier(MkIdentifier("value")));
               FinishTemplatesContext(context);
            }
            ListAdd(params, MkTypeName(specifiers, d));

            d = MkDeclaratorIdentifier(MkIdentifier(setName));
            //if(imported)
            if(dllImport)
               d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), d));
            d = MkDeclaratorFunction(d, params);

            // Make sure the simple _class's type is declared
            for(spec = specifiers->first; spec; spec = spec.next)
            {
               if(spec.type == nameSpecifier /*SpecifierClass*/)
               {
                  if((!typeDecl || typeDecl.type == identifierDeclarator))
                  {
                     Symbol classSym = spec.symbol; // FindClass(spec.name);
                     symbol._class = classSym.registered;
                     if(classSym.registered && classSym.registered.type == structClass)
                        DeclareStruct(spec.name, false);
                  }
               }
            }

            ListAdd(declarators, MkInitDeclarator(d, null));

            specifiers = MkList();
            //if(imported)
            if(dllImport)
               specifiers->Insert(null, MkSpecifier(EXTERN));
            else if(prop._class.symbol && ((Symbol)prop._class.symbol).isStatic)
               specifiers->Insert(null, MkSpecifier(STATIC));

            // TESTING COMMENTING THIS FIRST LINE OUT, what was the problem? Trying to add noHeadClass here ...
            if(!prop.conversion || prop._class.type == structClass)
               ListAdd(specifiers, MkSpecifier(VOID));
            else
               ListAdd(specifiers, MkSpecifierName/*MkClassName*/(prop._class.fullName));

            decl = MkDeclaration(specifiers, declarators);

            external = MkExternalDeclaration(decl);
            ast->Insert(curExternal.prev, external);
            external.symbol = symbol;
            symbol.externalSet = external;

            ReplaceThisClassSpecifiers(specifiers, prop._class);
         }
         else
         {
            // Move declaration higher...
            ast->Move(symbol.externalSet, curExternal.prev);
         }
      }

      // Property (for Watchers)
      if(!symbol.externalPtr)
      {
         Declaration decl;
         External external;
         OldList * specifiers = MkList();

         if(imported)
            specifiers->Insert(null, MkSpecifier(EXTERN));
         else
            specifiers->Insert(null, MkSpecifier(STATIC));

         ListAdd(specifiers, MkSpecifierName("Property"));

         {
            OldList * list = MkList();
            ListAdd(list, MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), 
                  MkDeclaratorIdentifier(MkIdentifier(propName))), null));

            if(!imported)
            {
               strcpy(propName, "__ecerePropM_");
               FullClassNameCat(propName, prop._class.fullName, false);
               strcat(propName, "_");
               // strcat(propName, prop.name);
               FullClassNameCat(propName, prop.name, true);

               MangleClassName(propName);

               ListAdd(list, MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), 
                     MkDeclaratorIdentifier(MkIdentifier(propName))), null));
            }
            decl = MkDeclaration(specifiers, list);
         }

         external = MkExternalDeclaration(decl);
         ast->Insert(curExternal.prev, external);
         external.symbol = symbol;
         symbol.externalPtr = external;
      }
      else
      {
         // Move declaration higher...
         ast->Move(symbol.externalPtr, curExternal.prev);
      }

      symbol.id = curExternal.symbol.idCode;
   }
}

// ***************** EXPRESSION PROCESSING ***************************
public Type Dereference(Type source)
{
   Type type = null;
   if(source)
   {
      if(source.kind == pointerType || source.kind == arrayType)
      {
         type = source.type;
         source.type.refCount++;
      }
      else if(source.kind == classType && !strcmp(source._class.string, "String"))
      {
         type = Type
         {
            kind = charType;
            refCount = 1;
         };
      }
      // Support dereferencing of no head classes for now...
      else if(source.kind == classType && source._class && source._class.registered && source._class.registered.type == noHeadClass)
      {
         type = source;
         source.refCount++;
      }
      else
         Compiler_Error($"cannot dereference type\n");
   }
   return type;
}

static Type Reference(Type source)
{
   Type type = null;
   if(source)
   {
      type = Type
      {
         kind = pointerType;
         type = source;
         refCount = 1;
      };
      source.refCount++;
   }
   return type;
}

void ProcessMemberInitData(MemberInit member, Class _class, Class * curClass, DataMember * curMember, DataMember * subMemberStack, int * subMemberStackPos)
{
   Identifier ident = member.identifiers ? member.identifiers->first : null;
   bool found = false;
   DataMember dataMember = null;
   Method method = null;
   bool freeType = false;

   yylloc = member.loc;

   if(!ident)
   {
      if(curMember)
      {
         eClass_FindNextMember(_class, curClass, curMember, subMemberStack, subMemberStackPos);
         if(*curMember)
         {
            found = true;
            dataMember = *curMember;
         }
      }
   }
   else
   {
      DataMember thisMember = (DataMember)eClass_FindProperty(_class, ident.string, privateModule);
      DataMember _subMemberStack[256];
      int _subMemberStackPos = 0;

      // FILL MEMBER STACK
      if(!thisMember)
         thisMember = eClass_FindDataMember(_class, ident.string, privateModule, _subMemberStack, &_subMemberStackPos);
      if(thisMember)
      {
         dataMember = thisMember;
         if(curMember && thisMember.memberAccess == publicAccess)
         {
            *curMember = thisMember;
            *curClass = thisMember._class;
            memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
            *subMemberStackPos = _subMemberStackPos;
         }
         found = true;
      }
      else
      {
         // Setting a method
         method = eClass_FindMethod(_class, ident.string, privateModule);
         if(method && method.type == virtualMethod)
            found = true;
         else
            method = null;
      }
   }

   if(found)
   {
      Type type = null;
      if(dataMember)
      {
         if(!dataMember.dataType && dataMember.dataTypeString)
         {
            //Context context = SetupTemplatesContext(dataMember._class);
            Context context = SetupTemplatesContext(_class);
            dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
            FinishTemplatesContext(context);
         }
         type = dataMember.dataType;
      }
      else if(method)
      {
         // This is for destination type...
         if(!method.dataType)
            ProcessMethodType(method);
         //DeclareMethod(method);
         // method.dataType = ((Symbol)method.symbol)->type;
         type = method.dataType;
      }

      if(ident && ident.next)
      {
         for(ident = ident.next; ident && type; ident = ident.next)
         {
            if(type.kind == classType)
            {
               dataMember = (DataMember)eClass_FindProperty(type._class.registered, ident.string, privateModule);
               if(!dataMember)
                  dataMember = eClass_FindDataMember(type._class.registered, ident.string, privateModule, null, null);
               if(dataMember)
                  type = dataMember.dataType;
            }
            else if(type.kind == structType || type.kind == unionType)
            {
               Type memberType;
               for(memberType = type.members.first; memberType; memberType = memberType.next)
               {
                  if(!strcmp(memberType.name, ident.string))
                  {
                     type = memberType;
                     break;
                  }
               }
            }
         }
      }

      // *** WORKING CODE: TESTING THIS HERE FOR TEMPLATES ***
      if(type && type.kind == templateType && type.templateParameter.type == TemplateParameterType::type && _class.templateArgs /* TODO: Watch out for these _class.templateClass*/)
      {
         int id = 0;
         ClassTemplateParameter curParam = null;
         Class sClass;
         for(sClass = _class; sClass; sClass = sClass.base)
         {
            id = 0;
            if(sClass.templateClass) sClass = sClass.templateClass;
            for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
            {
               if(curParam.type == TemplateParameterType::type && !strcmp(type.templateParameter.identifier.string, curParam.name))
               {
                  for(sClass = sClass.base; sClass; sClass = sClass.base)
                  {
                     if(sClass.templateClass) sClass = sClass.templateClass;
                     id += sClass.templateParams.count;
                  }
                  break;
               }
               id++;
            }
            if(curParam) break;
         }

         if(curParam)
         {
            ClassTemplateArgument arg = _class.templateArgs[id];
            if(arg.dataTypeString)
            {
               // FreeType(type);
               type = ProcessTypeString(arg.dataTypeString, false);
               freeType = true;
               if(type && _class.templateClass)
                  type.passAsTemplate = true;
               if(type)
               {
                  // type.refCount++;
                  /*if(!exp.destType)
                  {
                     exp.destType = ProcessTypeString(arg.dataTypeString, false);
                     exp.destType.refCount++;
                  }*/
               }
            }
         }
      }
      if(type && type.kind == classType && type._class && type._class.registered && strchr(type._class.registered.fullName, '<'))
      {
         Class expClass = type._class.registered;
         Class cClass = null;
         int c;
         int paramCount = 0;
         int lastParam = -1;
         
         char templateString[1024];
         ClassTemplateParameter param;
         sprintf(templateString, "%s<", expClass.templateClass.fullName);
         for(cClass = expClass; cClass; cClass = cClass.base)
         {
            int p = 0;
            if(cClass.templateClass) cClass = cClass.templateClass;
            for(param = cClass.templateParams.first; param; param = param.next)
            {
               int id = p;
               Class sClass;
               ClassTemplateArgument arg;
               for(sClass = cClass.base; sClass; sClass = sClass.base) 
               {
                  if(sClass.templateClass) sClass = sClass.templateClass;
                  id += sClass.templateParams.count;
               }
               arg = expClass.templateArgs[id];

               for(sClass = _class /*expClass*/; sClass; sClass = sClass.base)
               {
                  ClassTemplateParameter cParam;
                  //int p = numParams - sClass.templateParams.count;
                  int p = 0;
                  Class nextClass;
                  if(sClass.templateClass) sClass = sClass.templateClass;

                  for(nextClass = sClass.base; nextClass; nextClass = nextClass.base) 
                  {
                     if(nextClass.templateClass) nextClass = nextClass.templateClass;
                     p += nextClass.templateParams.count;
                  }
                  
                  for(cParam = sClass.templateParams.first; cParam; cParam = cParam.next, p++)
                  {
                     if(cParam.type == TemplateParameterType::type && arg.dataTypeString && !strcmp(cParam.name, arg.dataTypeString))
                     {
                        if(_class.templateArgs && arg.dataTypeString && (!param.defaultArg.dataTypeString || strcmp(arg.dataTypeString, param.defaultArg.dataTypeString)))
                        {
                           arg.dataTypeString = _class.templateArgs[p].dataTypeString;
                           arg.dataTypeClass = _class.templateArgs[p].dataTypeClass;
                           break;
                        }
                     }
                  }
               }

               {
                  char argument[256];
                  argument[0] = '\0';
                  /*if(arg.name)
                  {
                     strcat(argument, arg.name.string);
                     strcat(argument, " = ");
                  }*/
                  switch(param.type)
                  {
                     case expression:
                     {
                        // THIS WHOLE THING IS A WILD GUESS... FIX IT UP
                        char expString[1024];
                        OldList * specs = MkList();
                        Declarator decl = SpecDeclFromString(param.dataTypeString, specs, null);
                        Expression exp;
                        char * string = PrintHexUInt64(arg.expression.ui64);
                        exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));

                        ProcessExpressionType(exp);
                        ComputeExpression(exp);
                        expString[0] = '\0';
                        PrintExpression(exp, expString);
                        strcat(argument, expString);
                        //delete exp;
                        FreeExpression(exp);
                        break;
                     }
                     case identifier:
                     {
                        strcat(argument, arg.member.name);
                        break;
                     }
                     case TemplateParameterType::type:
                     {
                        if(arg.dataTypeString && (!param.defaultArg.dataTypeString || strcmp(arg.dataTypeString, param.defaultArg.dataTypeString)))
                           strcat(argument, arg.dataTypeString);
                        break;
                     }
                  }
                  if(argument[0])
                  {
                     if(paramCount) strcat(templateString, ", ");
                     if(lastParam != p - 1)
                     {
                        strcat(templateString, param.name);
                        strcat(templateString, " = ");
                     }
                     strcat(templateString, argument);
                     paramCount++;
                     lastParam = p;
                  }
                  p++;
               }               
            }
         }
         {
            int len = strlen(templateString);
            if(templateString[len-1] == '<')
               len--;
            else
            {
               if(templateString[len-1] == '>')
                  templateString[len++] = ' ';
               templateString[len++] = '>';
            }
            templateString[len++] = '\0';
         }
         {
            Context context = SetupTemplatesContext(_class);
            if(freeType) FreeType(type);
            type = ProcessTypeString(templateString, false);
            freeType = true;
            FinishTemplatesContext(context);
         }
      }

      if(method && member.initializer && member.initializer.type == expInitializer && member.initializer.exp)
      {
         ProcessExpressionType(member.initializer.exp);
         if(!member.initializer.exp.expType)
         {
            if(inCompiler)
            {
               char expString[10240];
               expString[0] = '\0';
               PrintExpression(member.initializer.exp, expString);
               ChangeCh(expString, '\n', ' ');
               Compiler_Error($"unresolved symbol used as an instance method %s\n", expString);
            }
         }
         //else if(!MatchTypes(member.exp.expType, type, null, _class, null, true, true, false, false))
         else if(!MatchTypes(member.initializer.exp.expType, type, null, null, _class, true, true, false, false))
         {
            Compiler_Error($"incompatible instance method %s\n", ident.string);
         }
      }
      else if(member.initializer)
      {
         /*
         FreeType(member.exp.destType);
         member.exp.destType = type;
         if(member.exp.destType)
            member.exp.destType.refCount++;
         ProcessExpressionType(member.exp);
         */

         ProcessInitializer(member.initializer, type);
      }
      if(freeType) FreeType(type);
   }
   else
   {
      if(_class && _class.type == unitClass)
      {
         if(member.initializer)
         {
            /*
            FreeType(member.exp.destType);
            member.exp.destType = MkClassType(_class.fullName);
            ProcessExpressionType(member.initializer, type);
            */
            Type type = MkClassType(_class.fullName);
            ProcessInitializer(member.initializer, type);
            FreeType(type);
         }
      }
      else
      {
         if(member.initializer)
         {
            //ProcessExpressionType(member.exp);
            ProcessInitializer(member.initializer, null);
         }
         if(ident)
         {
            if(method)
            {
               Compiler_Error($"couldn't find virtual method %s in class %s\n", ident.string, _class.fullName);
            }
            else if(_class)
            {
               Compiler_Error($"couldn't find member %s in class %s\n", ident.string, _class.fullName);
               if(inCompiler)
                  eClass_AddDataMember(_class, ident.string, "int", 0, 0, publicAccess);
            }
         }
         else if(_class)
            Compiler_Error($"too many initializers for instantiation of class %s\n", _class.fullName);
      }
   }
}

void ProcessInstantiationType(Instantiation inst)
{
   yylloc = inst.loc;
   if(inst._class)
   {
      MembersInit members;
      Symbol classSym; // = inst._class.symbol; // FindClass(inst._class.name);
      Class _class;
      
      /*if(!inst._class.symbol)
         inst._class.symbol = FindClass(inst._class.name);*/
      classSym = inst._class.symbol;
      _class = classSym ? classSym.registered : null;

      // DANGER: Patch for mutex not declaring its struct when not needed
      if(!_class || _class.type != noHeadClass)
         DeclareStruct(inst._class.name, false); //_class && _class.type == noHeadClass);

      afterExternal = afterExternal ? afterExternal : curExternal;

      if(inst.exp)
         ProcessExpressionType(inst.exp);

      inst.isConstant = true;
      if(inst.members)
      {
         DataMember curMember = null;
         Class curClass = null;
         DataMember subMemberStack[256];
         int subMemberStackPos = 0;

         for(members = inst.members->first; members; members = members.next)
         {
            switch(members.type)
            {
               case methodMembersInit:
               {
                  char name[1024];
                  static uint instMethodID = 0;
                  External external = curExternal;
                  Context context = curContext;
                  Declarator declarator = members.function.declarator;
                  Identifier nameID = GetDeclId(declarator);
                  char * unmangled = nameID ? nameID.string : null;
                  Expression exp;
                  External createdExternal = null;

                  if(inCompiler)
                  {
                     char number[16];
                     //members.function.dontMangle = true;
                     strcpy(name, "__ecereInstMeth_");
                     FullClassNameCat(name, _class ? _class.fullName : "_UNKNOWNCLASS", false);
                     strcat(name, "_");
                     strcat(name, nameID.string);
                     strcat(name, "_");
                     sprintf(number, "_%08d", instMethodID++);
                     strcat(name, number);                     
                     nameID.string = CopyString(name);
                  }

                  // Do modifications here...
                  if(declarator)
                  {
                     Symbol symbol = declarator.symbol;
                     Method method = eClass_FindMethod(_class, unmangled, privateModule);
                                    
                     if(method && method.type == virtualMethod)
                     {
                        symbol.method = method;
                        ProcessMethodType(method);

                        if(!symbol.type.thisClass)
                        {
                           if(method.dataType.thisClass && currentClass && 
                              eClass_IsDerived(currentClass, method.dataType.thisClass.registered))
                           {
                              if(!currentClass.symbol)
                                 currentClass.symbol = FindClass(currentClass.fullName);
                              symbol.type.thisClass = currentClass.symbol;
                           }
                           else
                           {
                              if(!_class.symbol)
                                 _class.symbol = FindClass(_class.fullName);
                              symbol.type.thisClass = _class.symbol;
                           }
                        }
                        // TESTING THIS HERE:
                        DeclareType(symbol.type, true, true);

                     }
                     else if(classSym)
                     {
                        Compiler_Error($"couldn't find virtual method %s in class %s\n",
                           unmangled, classSym.string);
                     }
                  }

                  //declarator.symbol.id = declarator.symbol.idCode = curExternal.symbol.idCode;
                  createdExternal = ProcessClassFunction(classSym ? classSym.registered : null, members.function, ast, afterExternal, true);

                  if(nameID)
                  {
                     FreeSpecifier(nameID._class);
                     nameID._class = null;
                  }

                  if(inCompiler)
                  {

                     Type type = declarator.symbol.type;
                     External oldExternal = curExternal;

                     // *** Commented this out... Any negative impact? Yes: makes double prototypes declarations... Why was it commented out?
                     // *** It was commented out for problems such as
                     /*
                           class VirtualDesktop : Window
                           {
                              clientSize = Size { };
                              Timer timer
                              {
                                 bool DelayExpired()
                                 {
                                    clientSize.w;
                                    return true;
                                 }
                              };
                           }
                     */
                     // Commented Out: Good for bet.ec in Poker (Otherwise: obj\bet.c:187: error: `currentBet' undeclared (first use in this function))

                     declarator.symbol.id = declarator.symbol.idCode = curExternal.symbol.idCode;

                     /*
                     if(strcmp(declarator.symbol.string, name))
                     {
                        printf("TOCHECK: Look out for this\n");
                        delete declarator.symbol.string;
                        declarator.symbol.string = CopyString(name);
                     }
                     
                     if(!declarator.symbol.parent && globalContext.symbols.root != (BTNode)declarator.symbol)
                     {
                        printf("TOCHECK: Will this ever be in a list? Yes.\n");
                        excludedSymbols->Remove(declarator.symbol);
                        globalContext.symbols.Add((BTNode)declarator.symbol);
                        if(strstr(declarator.symbol.string), "::")
                           globalContext.hasNameSpace = true;

                     }
                     */
                  
                     //curExternal = curExternal.prev;
                     //afterExternal = afterExternal->next;

                     //ProcessFunction(afterExternal->function);

                     //curExternal = afterExternal;
                     {
                        External externalDecl;
                        externalDecl = MkExternalDeclaration(null);
                        ast->Insert(oldExternal.prev, externalDecl);

                        // Which function does this process?
                        if(createdExternal.function)
                        {
                           ProcessFunction(createdExternal.function);

                           //curExternal = oldExternal;

                           {
                              //Declaration decl = MkDeclaration(members.function.specifiers, MkListOne(MkInitDeclarator(CopyDeclarator(declarator), null)));

                              Declaration decl = MkDeclaration(CopyList(createdExternal.function.specifiers, CopySpecifier), 
                                 MkListOne(MkInitDeclarator(CopyDeclarator(declarator), null)));
                     
                              //externalDecl = MkExternalDeclaration(decl);
                        
                              //***** ast->Insert(external.prev, externalDecl);
                              //ast->Insert(curExternal.prev, externalDecl);
                              externalDecl.declaration = decl;
                              if(decl.symbol && !decl.symbol.pointerExternal)
                                 decl.symbol.pointerExternal = externalDecl;

                              // Trying this out...
                              declarator.symbol.pointerExternal = externalDecl;
                           }
                        }
                     }
                  }
                  else if(declarator)
                  {
                     curExternal = declarator.symbol.pointerExternal;
                     ProcessFunction((FunctionDefinition)members.function);
                  }
                  curExternal = external;
                  curContext = context;

                  if(inCompiler)
                  {
                     FreeClassFunction(members.function);

                     // In this pass, turn this into a MemberInitData
                     exp = QMkExpId(name);
                     members.type = dataMembersInit;
                     members.dataMembers = MkListOne(MkMemberInit(MkListOne(MkIdentifier(unmangled)), MkInitializerAssignment(exp)));

                     delete unmangled;
                  }
                  break;
               }
               case dataMembersInit:
               {
                  if(members.dataMembers && classSym)
                  {
                     MemberInit member;
                     Location oldyyloc = yylloc;
                     for(member = members.dataMembers->first; member; member = member.next)
                     {
                        ProcessMemberInitData(member, classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                        if(member.initializer && !member.initializer.isConstant)
                           inst.isConstant = false;
                     }
                     yylloc = oldyyloc;
                  }
                  break;
               }
            }
         }
      }
   }
}

static void DeclareType(Type type, bool declarePointers, bool declareParams)
{
   // OPTIMIZATIONS: TESTING THIS...
   if(inCompiler)
   {
      if(type.kind == functionType)
      {
         Type param;
         if(declareParams)
         {
            for(param = type.params.first; param; param = param.next)
               DeclareType(param, declarePointers, true);
         }
         DeclareType(type.returnType, declarePointers, true);
      }
      else if(type.kind == pointerType && declarePointers)
         DeclareType(type.type, declarePointers, false);
      else if(type.kind == classType)
      {
         if(type._class.registered && (type._class.registered.type == structClass || type._class.registered.type == noHeadClass) && !type._class.declaring)
            DeclareStruct(type._class.registered.fullName, type._class.registered.type == noHeadClass);
      }
      else if(type.kind == structType || type.kind == unionType)
      {
         Type member;
         for(member = type.members.first; member; member = member.next)
            DeclareType(member, false, false);
      }
      else if(type.kind == arrayType)
         DeclareType(type.arrayType, declarePointers, false);
   }
}

ClassTemplateArgument * FindTemplateArg(Class _class, TemplateParameter param)
{
   ClassTemplateArgument * arg = null;
   int id = 0;
   ClassTemplateParameter curParam = null;
   Class sClass;
   for(sClass = _class; sClass; sClass = sClass.base)
   {
      id = 0;
      if(sClass.templateClass) sClass = sClass.templateClass;
      for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
      {
         if(curParam.type == TemplateParameterType::type && !strcmp(param.identifier.string, curParam.name))
         {
            for(sClass = sClass.base; sClass; sClass = sClass.base)
            {
               if(sClass.templateClass) sClass = sClass.templateClass;
               id += sClass.templateParams.count;
            }
            break;
         }
         id++;
      }
      if(curParam) break;
   }
   if(curParam)
   {
      arg = &_class.templateArgs[id];
      if(arg && param.type == type)
         arg->dataTypeClass = eSystem_FindClass(_class.module, arg->dataTypeString);
   }
   return arg;
}

public Context SetupTemplatesContext(Class _class)
{
   Context context = PushContext();
   context.templateTypesOnly = true;
   if(_class.symbol && ((Symbol)_class.symbol).templateParams)
   {
      TemplateParameter param = ((Symbol)_class.symbol).templateParams->first;
      for(; param; param = param.next)
      {
         if(param.type == type && param.identifier)
         {
            TemplatedType type { key = (uintptr)param.identifier.string, param = param };
            curContext.templateTypes.Add((BTNode)type);
         }
      }
   }
   else if(_class)
   {
      Class sClass;
      for(sClass = _class; sClass; sClass = sClass.base)
      {
         ClassTemplateParameter p;
         for(p = sClass.templateParams.first; p; p = p.next)
         {
            //OldList * specs = MkList();
            //Declarator decl = null;
            //decl = SpecDeclFromString(p.dataTypeString, specs, null);
            if(p.type == type)
            {
               TemplateParameter param = p.param;
               TemplatedType type;
               if(!param)
               {
                  // ADD DATA TYPE HERE...
                  p.param = param = TemplateParameter
                  {
                     identifier = MkIdentifier(p.name), type = p.type, 
                     dataTypeString = p.dataTypeString /*, dataType = { specs, decl }*/
                  };
               }
               type = TemplatedType { key = (uintptr)p.name, param = param };
               curContext.templateTypes.Add((BTNode)type);
            }
         }
      }
   }
   return context;
}

public void FinishTemplatesContext(Context context)
{
   PopContext(context);
   FreeContext(context);
   delete context;
}

public void ProcessMethodType(Method method)
{
   if(!method.dataType)
   {
      Context context = SetupTemplatesContext(method._class);

      method.dataType = ProcessTypeString(method.dataTypeString, false);

      FinishTemplatesContext(context);

      if(method.type != virtualMethod && method.dataType)
      {
         if(!method.dataType.thisClass && !method.dataType.staticMethod)
         {
            if(!method._class.symbol)
               method._class.symbol = FindClass(method._class.fullName);
            method.dataType.thisClass = method._class.symbol;
         }
      }

      // Why was this commented out? Working fine without now...

      /*
      if(method.dataType.kind == functionType && !method.dataType.staticMethod && !method.dataType.thisClass)
         method.dataType.thisClass = method._class.symbol; // FindClass(method._class.fullName);
         */
   }

   /*
   if(type)
   {
      char * par = strstr(type, "(");
      char * classOp = null;
      int classOpLen = 0;
      if(par)
      {
         int c;
         for(c = par-type-1; c >= 0; c++)
         {
            if(type[c] == ':' && type[c+1] == ':')
            {
               classOp = type + c - 1;
               for(c = c-1; c >=0 && !isspace(type[c]); c--)
               {
                  classOp--;
                  classOpLen++;
               }
               break;
            }
            else if(!isspace(type[c]))
               break;
         }
      }
      if(classOp)
      {
         char temp[1024];
         int typeLen = strlen(type);
         memcpy(temp, classOp, classOpLen);
         temp[classOpLen] = '\0';
         if(temp[0])
            _class = eSystem_FindClass(module, temp);
         else
            _class = null;
         method.dataTypeString = new char[typeLen - classOpLen + 1];
         memcpy(method.dataTypeString, type, classOp - type);
         memcpy(method.dataTypeString + (classOp - type), classOp + classOpLen, typeLen - (classOp - type + classOpLen));
      }
      else
         method.dataTypeString = type;
   }
   */
}


public void ProcessPropertyType(Property prop)
{
   if(!prop.dataType)
   {
      Context context = SetupTemplatesContext(prop._class);
      prop.dataType = ProcessTypeString(prop.dataTypeString, false);
      FinishTemplatesContext(context);
   }
}

public void DeclareMethod(Method method, char * name)
{
   Symbol symbol = method.symbol;
   if(!symbol || (!symbol.pointerExternal && method.type == virtualMethod) || symbol.id > (curExternal ? curExternal.symbol.idCode : -1))
   {
      bool imported = false;
      bool dllImport = false;

      if(!method.dataType)
         method.dataType = ProcessTypeString(method.dataTypeString, false);

      if(!symbol || symbol._import || method.type == virtualMethod)
      {
         if(!symbol || method.type == virtualMethod)
         {
            Symbol classSym;
            if(!method._class.symbol)
               method._class.symbol = FindClass(method._class.fullName);
            classSym = method._class.symbol;
            if(!classSym._import)
            {
               ModuleImport module;
               
               if(method._class.module && method._class.module.name)
                  module = FindModule(method._class.module);
               else
                  module = mainModule;
               classSym._import = ClassImport
               {
                  name = CopyString(method._class.fullName);
                  isRemote = method._class.isRemote;
               };
               module.classes.Add(classSym._import);
            }
            if(!symbol)
            {
               symbol = method.symbol = Symbol { };
            }
            if(!symbol._import)
            {
               symbol._import = (ClassImport)MethodImport
               {
                  name = CopyString(method.name);
                  isVirtual = method.type == virtualMethod;
               };
               classSym._import.methods.Add(symbol._import);
            }
            if(!symbol)
            {
               // Set the symbol type
               /*
               if(!type.thisClass)
               {
                  type.thisClass = method._class.symbol; // FindClass(method._class.fullName);
               }
               else if(type.thisClass == (void *)-1)
               {
                  type.thisClass = null;
               }
               */
               // symbol.type = ProcessTypeString(method.dataTypeString, false);
               symbol.type = method.dataType;
               if(symbol.type) symbol.type.refCount++;
            }
            /*
            if(!method.thisClass || strcmp(method.thisClass, "void"))
               symbol.type.params.Insert(null, 
                  MkClassType(method.thisClass ? method.thisClass : method._class.fullName));
            */
         }
         if(!method.dataType.dllExport)
         {
            imported = true;
            if(method._class.module != privateModule && method._class.module.importType != staticImport)
               dllImport = true;
         }
      }

      /* MOVING THIS UP
      if(!method.dataType)
         method.dataType = ((Symbol)method.symbol).type;
         //ProcessMethodType(method);
      */

      if(method.type != virtualMethod && method.dataType)
         DeclareType(method.dataType, true, true);

      if(!symbol.pointerExternal || symbol.pointerExternal.type == functionExternal)
      {
         // We need a declaration here :)
         Declaration decl;
         OldList * specifiers, * declarators;
         Declarator d;
         Declarator funcDecl;
         External external;

         specifiers = MkList();
         declarators = MkList();

         //if(imported)
         if(dllImport)
            ListAdd(specifiers, MkSpecifier(EXTERN));
         else if(method._class.symbol && ((Symbol)method._class.symbol).isStatic)
            ListAdd(specifiers, MkSpecifier(STATIC));

         if(method.type == virtualMethod)
         {
            ListAdd(specifiers, MkSpecifier(INT));
            d = MkDeclaratorIdentifier(MkIdentifier(name));
         }
         else
         {
            d = MkDeclaratorIdentifier(MkIdentifier(name));
            //if(imported)
            if(dllImport)
               d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), d));
            {
               Context context = SetupTemplatesContext(method._class);
               d = SpecDeclFromString(method.dataTypeString, specifiers, d);
               FinishTemplatesContext(context);
            }
            funcDecl = GetFuncDecl(d);

            if(dllImport)
            {
               Specifier spec, next;
               for(spec = specifiers->first; spec; spec = next)
               {
                  next = spec.next;
                  if(spec.type == extendedSpecifier)
                  {
                     specifiers->Remove(spec);
                     FreeSpecifier(spec);
                  }
               }
            }

            // Add this parameter if not a static method
            if(method.dataType && !method.dataType.staticMethod)
            {
               if(funcDecl && funcDecl.function.parameters && funcDecl.function.parameters->count)
               {
                  Class _class = method.dataType.thisClass ? method.dataType.thisClass.registered : method._class;
                  TypeName thisParam = MkTypeName(MkListOne(
                     MkSpecifierName/*MkClassName*/(method.dataType.thisClass ? method.dataType.thisClass.string : method._class.fullName)), 
                     (_class && _class.type == systemClass) ? MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("this"))) : MkDeclaratorIdentifier(MkIdentifier("this")));
                  TypeName firstParam = ((TypeName)funcDecl.function.parameters->first);
                  Specifier firstSpec = firstParam.qualifiers ? firstParam.qualifiers->first : null;

                  if(firstSpec && firstSpec.type == baseSpecifier && firstSpec.specifier == VOID && !firstParam.declarator)
                  {
                     TypeName param = funcDecl.function.parameters->first;
                     funcDecl.function.parameters->Remove(param);
                     FreeTypeName(param);
                  }

                  if(!funcDecl.function.parameters)
                     funcDecl.function.parameters = MkList();
                  funcDecl.function.parameters->Insert(null, thisParam);
               }
            }
            // Make sure we don't have empty parameter declarations for static methods...
            /*
            else if(!funcDecl.function.parameters)
            {
               funcDecl.function.parameters = MkList();
               funcDecl.function.parameters->Insert(null, 
                  MkTypeName(MkListOne(MkSpecifier(VOID)),null));
            }*/
         }
         // TESTING THIS:
         ProcessDeclarator(d);

         ListAdd(declarators, MkInitDeclarator(d, null));

         decl = MkDeclaration(specifiers, declarators);

         ReplaceThisClassSpecifiers(specifiers, method._class);

         // Keep a different symbol for the function definition than the declaration...
         if(symbol.pointerExternal)
         {
            Symbol functionSymbol { };

            // Copy symbol
            {
               *functionSymbol = *symbol;
               functionSymbol.string = CopyString(symbol.string);
               if(functionSymbol.type)
                  functionSymbol.type.refCount++;
            }

            excludedSymbols->Add(functionSymbol);
            symbol.pointerExternal.symbol = functionSymbol;
         }
         external = MkExternalDeclaration(decl);
         if(curExternal)
            ast->Insert(curExternal ? curExternal.prev : null, external);
         external.symbol = symbol;
         symbol.pointerExternal = external;
      }
      else if(ast)
      {
         // Move declaration higher...
         ast->Move(symbol.pointerExternal, curExternal.prev);
      }

      symbol.id = curExternal ? curExternal.symbol.idCode : MAXINT;
   }
}

char * ReplaceThisClass(Class _class)
{
   if(thisClassParams && _class.templateParams.count && !_class.templateClass)
   {
      bool first = true;
      int p = 0;
      ClassTemplateParameter param;
      int lastParam = -1;
      
      char className[1024];
      strcpy(className, _class.fullName);
      for(param = _class.templateParams.first; param; param = param.next)
      {
         // if((!param.defaultArg.dataTypeString && !param.defaultArg.expression.ui64))
         {
            if(first) strcat(className, "<");
            if(!first) strcat(className, ", ");
            if(lastParam + 1 != p)
            {
               strcat(className, param.name);
               strcat(className, " = ");
            }
            strcat(className, param.name);
            first = false;
            lastParam = p;
         }
         p++;
      }
      if(!first)
      {
         int len = strlen(className);
         if(className[len-1] == '>') className[len++] = ' ';
         className[len++] = '>';
         className[len++] = '\0';
      }
      return CopyString(className);
   }
   else
      return CopyString(_class.fullName);   
}

Type ReplaceThisClassType(Class _class)
{
   if(thisClassParams && _class.templateParams.count && !_class.templateClass)
   {
      bool first = true;
      int p = 0;
      ClassTemplateParameter param;
      int lastParam = -1;
      char className[1024];
      strcpy(className, _class.fullName);
      
      for(param = _class.templateParams.first; param; param = param.next)
      {
         // if((!param.defaultArg.dataTypeString && !param.defaultArg.expression.ui64))
         {
            if(first) strcat(className, "<");
            if(!first) strcat(className, ", ");
            if(lastParam + 1 != p)
            {
               strcat(className, param.name);
               strcat(className, " = ");
            }
            strcat(className, param.name);
            first = false;
            lastParam = p;
         }
         p++;
      }
      if(!first)
      {
         int len = strlen(className);
         if(className[len-1] == '>') className[len++] = ' ';
         className[len++] = '>';
         className[len++] = '\0';
      }
      return MkClassType(className);
      //return ProcessTypeString(className, false);
   }
   else
   {
      return MkClassType(_class.fullName);
      //return ProcessTypeString(_class.fullName, false);
   }
}

void ReplaceThisClassSpecifiers(OldList specs, Class _class)
{
   if(specs != null && _class)
   {
      Specifier spec;
      for(spec = specs.first; spec; spec = spec.next)
      {
         if(spec.type == baseSpecifier && spec.specifier == THISCLASS)
         {
            spec.type = nameSpecifier;
            spec.name = ReplaceThisClass(_class);
            spec.symbol = FindClass(spec.name); //_class.symbol;
         }
      }
   }
}

// Returns imported or not
bool DeclareFunction(GlobalFunction function, char * name)
{
   Symbol symbol = function.symbol;
   if(curExternal && (!symbol || symbol.id > curExternal.symbol.idCode))
   {
      bool imported = false;
      bool dllImport = false;

      if(!function.dataType)
      {
         function.dataType = ProcessTypeString(function.dataTypeString, false);
         if(!function.dataType.thisClass)
            function.dataType.staticMethod = true;
      }

      if(inCompiler)
      {
         if(!symbol)
         {
            ModuleImport module = FindModule(function.module);
            // WARNING: This is not added anywhere...
            symbol = function.symbol = Symbol {  };

            if(module.name)
            {
               if(!function.dataType.dllExport)
               {
                  symbol._import = (ClassImport)FunctionImport { name = CopyString(function.name) };
                  module.functions.Add(symbol._import);
               }
            }
            // Set the symbol type
            {
               symbol.type = ProcessTypeString(function.dataTypeString, false);
               if(!symbol.type.thisClass)
                  symbol.type.staticMethod = true;
            }
         }
         imported = symbol._import ? true : false;
         if(imported && function.module != privateModule && function.module.importType != staticImport)
            dllImport = true;
      }

      DeclareType(function.dataType, true, true);

      if(inCompiler)
      {
         if(!symbol.pointerExternal || symbol.pointerExternal.type == functionExternal)
         {
            // We need a declaration here :)
            Declaration decl;
            OldList * specifiers, * declarators;
            Declarator d;
            Declarator funcDecl;
            External external;

            specifiers = MkList();
            declarators = MkList();

            //if(imported)
               ListAdd(specifiers, MkSpecifier(EXTERN));
            /*
            else
               ListAdd(specifiers, MkSpecifier(STATIC));
            */

            d = MkDeclaratorIdentifier(MkIdentifier(imported ? name : function.name));
            //if(imported)
            if(dllImport)
               d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), d));

            d = SpecDeclFromString(function.dataTypeString, specifiers, d);
            // TAKE OUT THE DLL EXPORT IF STATICALLY IMPORTED:
            if(function.module.importType == staticImport)
            {
               Specifier spec;
               for(spec = specifiers->first; spec; spec = spec.next)
                  if(spec.type == extendedSpecifier && spec.extDecl && spec.extDecl.type == extDeclString && !strcmp(spec.extDecl.s, "dllexport"))
                  {
                     specifiers->Remove(spec);
                     FreeSpecifier(spec);
                     break;
                  }
            }

            funcDecl = GetFuncDecl(d);

            // Make sure we don't have empty parameter declarations for static methods...
            if(funcDecl && !funcDecl.function.parameters)
            {
               funcDecl.function.parameters = MkList();
               funcDecl.function.parameters->Insert(null, 
                  MkTypeName(MkListOne(MkSpecifier(VOID)),null));
            }

            ListAdd(declarators, MkInitDeclarator(d, null));

            {
               Context oldCtx = curContext;
               curContext = globalContext;
               decl = MkDeclaration(specifiers, declarators);
               curContext = oldCtx;
            }

            // Keep a different symbol for the function definition than the declaration...
            if(symbol.pointerExternal)
            {
               Symbol functionSymbol { };
               // Copy symbol
               {
                  *functionSymbol = *symbol;
                  functionSymbol.string = CopyString(symbol.string);
                  if(functionSymbol.type)
                     functionSymbol.type.refCount++;
               }

               excludedSymbols->Add(functionSymbol);

               symbol.pointerExternal.symbol = functionSymbol;
            }
            external = MkExternalDeclaration(decl);
            if(curExternal)
               ast->Insert(curExternal.prev, external);
            external.symbol = symbol;
            symbol.pointerExternal = external;
         }
         else
         {
            // Move declaration higher...
            ast->Move(symbol.pointerExternal, curExternal.prev);
         }

         if(curExternal)
            symbol.id = curExternal.symbol.idCode;
      }
   }
   return (symbol && symbol._import && function.module != privateModule && function.module.importType != staticImport) ? true : false;
}

void DeclareGlobalData(GlobalData data)
{
   Symbol symbol = data.symbol;
   if(curExternal && (!symbol || symbol.id > curExternal.symbol.idCode))
   {
      if(inCompiler)
      {
         if(!symbol)
            symbol = data.symbol = Symbol { };
      }
      if(!data.dataType)
         data.dataType = ProcessTypeString(data.dataTypeString, false);
      DeclareType(data.dataType, true, true);
      if(inCompiler)
      {
         if(!symbol.pointerExternal)
         {
            // We need a declaration here :)
            Declaration decl;
            OldList * specifiers, * declarators;
            Declarator d;
            External external;

            specifiers = MkList();
            declarators = MkList();

            ListAdd(specifiers, MkSpecifier(EXTERN));
            d = MkDeclaratorIdentifier(MkIdentifier(data.fullName));
            d = SpecDeclFromString(data.dataTypeString, specifiers, d);

            ListAdd(declarators, MkInitDeclarator(d, null));

            decl = MkDeclaration(specifiers, declarators);
            external = MkExternalDeclaration(decl);
            if(curExternal)
               ast->Insert(curExternal.prev, external);
            external.symbol = symbol;
            symbol.pointerExternal = external;
         }
         else
         {
            // Move declaration higher...
            ast->Move(symbol.pointerExternal, curExternal.prev);
         }

         if(curExternal)
            symbol.id = curExternal.symbol.idCode;
      }
   }
}

class Conversion : struct
{
   Conversion prev, next;
   Property convert;
   bool isGet;
   Type resultType;
};

public bool MatchTypes(Type source, Type dest, OldList conversions, Class owningClassSource, Class owningClassDest, bool doConversion, bool enumBaseType, bool acceptReversedParams, bool isConversionExploration)
{
   if(source && dest)
   {
      // Property convert;

      if(source.kind == templateType && dest.kind != templateType)
      {
         Type type = ProcessTemplateParameterType(source.templateParameter);
         if(type) source = type;
      }

      if(dest.kind == templateType && source.kind != templateType)
      {
         Type type = ProcessTemplateParameterType(dest.templateParameter);
         if(type) dest = type;
      }

      if((dest.classObjectType == typedObject && source.classObjectType != anyObject) || (dest.classObjectType == anyObject && source.classObjectType != typedObject))
      {
         return true;
      }
      
      if(source.classObjectType == anyObject && dest.classObjectType != typedObject)
      {
         return true;
      }
      
      if((dest.kind == structType && source.kind == structType) ||
         (dest.kind == unionType && source.kind == unionType))
      {
         if((dest.enumName && source.enumName && !strcmp(dest.enumName, source.enumName)) ||
             (source.members.first && source.members.first == dest.members.first))
            return true;
      }

      if(dest.kind == ellipsisType && source.kind != voidType)
         return true;

      if(dest.kind == pointerType && dest.type.kind == voidType &&
         ((source.kind == classType && (!source._class || !source._class.registered || source._class.registered.type == structClass || source._class.registered.type == normalClass || source._class.registered.type == noHeadClass || source._class.registered.type == systemClass))
         || source.kind == subClassType || source.kind == pointerType || source.kind == arrayType || source.kind == functionType || source.kind == thisClassType)

         /*source.kind != voidType && source.kind != structType && source.kind != unionType  */
      
         /*&& (source.kind != classType /-*|| source._class.registered.type != structClass)*/)
         return true;
      if(!isConversionExploration && source.kind == pointerType && source.type.kind == voidType &&
         ((dest.kind == classType && (!dest._class || !dest._class.registered || dest._class.registered.type == structClass || dest._class.registered.type == normalClass || dest._class.registered.type == noHeadClass || dest._class.registered.type == systemClass))
         || dest.kind == subClassType || dest.kind == pointerType || dest.kind == arrayType || dest.kind == functionType || dest.kind == thisClassType)

         /* dest.kind != voidType && dest.kind != structType && dest.kind != unionType  */

         /*&& (dest.kind != classType || dest._class.registered.type != structClass)*/)
         return true;

      if(((source.kind == classType && dest.kind == classType) || (source.kind == subClassType && dest.kind == subClassType)) && source._class)
      {
         if(source._class.registered && source._class.registered.type == unitClass)
         {
            if(conversions != null)
            {
               if(source._class.registered == dest._class.registered)
                  return true;
            }
            else
            {
               Class sourceBase, destBase;
               for(sourceBase = source._class.registered; sourceBase && sourceBase.base.type != systemClass; sourceBase = sourceBase.base);
               for(destBase = dest._class.registered; destBase && destBase.base.type != systemClass; destBase = destBase.base);
               if(sourceBase == destBase)
                  return true;
            }
         }
         // Don't match enum inheriting from other enum if resolving enumeration values
         // TESTING: !dest.classObjectType
         else if(source._class && dest._class && (dest.classObjectType == source.classObjectType || !dest.classObjectType) &&
            (enumBaseType || 
               (!source._class.registered || source._class.registered.type != enumClass) || 
               (!dest._class.registered || dest._class.registered.type != enumClass)) && eClass_IsDerived(source._class.registered, dest._class.registered))
            return true;
         else
         {
            // Added this so that DefinedColor = Color doesn't go through ColorRGB property
            if(enumBaseType && 
               dest._class && dest._class.registered && dest._class.registered.type == enumClass &&
               source._class && source._class.registered && source._class.registered.type != enumClass)
            {
               if(eClass_IsDerived(dest._class.registered, source._class.registered))
               {
                  return true;
               }
            }
         }
      }

      // JUST ADDED THIS...
      if(source.kind == subClassType && dest.kind == classType && dest._class && !strcmp(dest._class.string, "ecere::com::Class"))
         return true;

      if(doConversion)
      {
         // Just added this for Straight conversion of ColorAlpha => Color
         if(source.kind == classType)
         {
            Class _class;
            for(_class = source._class ? source._class.registered : null; _class; _class = _class.base)
            {
               Property convert;
               for(convert = _class.conversions.first; convert; convert = convert.next)
               {
                  if(convert.memberAccess == publicAccess || _class.module == privateModule)
                  {
                     Conversion after = (conversions != null) ? conversions.last : null;

                     if(!convert.dataType)
                        convert.dataType = ProcessTypeString(convert.dataTypeString, false);
                     if(MatchTypes(convert.dataType, dest, conversions, null, null, false, true, false, true))
                     {
                        if(!conversions && !convert.Get)
                           return true;
                        else if(conversions != null)
                        {
                           if(_class.type == unitClass && convert.dataType.kind == classType && convert.dataType._class && 
                              convert.dataType._class.registered && _class.base == convert.dataType._class.registered.base && 
                              (dest.kind != classType || dest._class.registered != _class.base))
                              return true;
                           else
                           {
                              Conversion conv { convert = convert, isGet = true };
                              // conversions.Add(conv);
                              conversions.Insert(after, conv);
                              return true;
                           }
                        }
                     }
                  }
               }
            }
         }

         // MOVING THIS??

         if(dest.kind == classType)
         {
            Class _class;
            for(_class = dest._class ? dest._class.registered : null; _class; _class = _class.base)
            {
               Property convert;
               for(convert = _class.conversions.first; convert; convert = convert.next)
               {
                  if(convert.memberAccess == publicAccess || _class.module == privateModule)
                  {
                     // Conversion after = (conversions != null) ? conversions.last : null;

                     if(!convert.dataType)
                        convert.dataType = ProcessTypeString(convert.dataTypeString, false);
                     // Just added this equality check to prevent recursion.... Make it safer?
                     // Changed enumBaseType to false here to prevent all int-compatible enums to show up in AnchorValues
                     if(convert.dataType != dest && MatchTypes(source, convert.dataType, conversions, null, null, true, false /*true*/, false, true))
                     {
                        if(!conversions && !convert.Set)
                           return true;
                        else if(conversions != null)
                        {
                           if(_class.type == unitClass && convert.dataType.kind == classType && convert.dataType._class && 
                              convert.dataType._class.registered && _class.base == convert.dataType._class.registered.base && 
                              (source.kind != classType || source._class.registered != _class.base))
                              return true;
                           else
                           {
                              // *** Testing this! ***
                              Conversion conv { convert = convert };
                              conversions.Add(conv);
                              //conversions.Insert(after, conv);
                              return true;
                           }
                        }
                     }
                  }
               }
            }
            /*if(dest._class.registered && !strcmp(dest._class.registered.name, "bool"))
            {
               if(source.kind != voidType && source.kind != structType && source.kind != unionType && 
                  (source.kind != classType || source._class.registered.type != structClass))
                  return true;
            }*/

            // TESTING THIS... IS THIS OK??
            if(enumBaseType && dest._class && dest._class.registered && dest._class.registered.type == enumClass)
            {
               if(!dest._class.registered.dataType)
                  dest._class.registered.dataType = ProcessTypeString(dest._class.registered.dataTypeString, false);
               // Only support this for classes...
               if(dest._class.registered.dataType.kind == classType || source.truth || dest.truth/* ||
                  !strcmp(dest._class.registered.name, "bool") || (source.kind == classType && !strcmp(source._class.string, "bool"))*/)
               {
                  if(MatchTypes(source, dest._class.registered.dataType, conversions, null, null, true, true, false, false))
                  {
                     return true;
                  }
               }
            }
         }

         // Moved this lower
         if(source.kind == classType)
         {
            Class _class;
            for(_class = source._class ? source._class.registered : null; _class; _class = _class.base)
            {
               Property convert;
               for(convert = _class.conversions.first; convert; convert = convert.next)
               {
                  if(convert.memberAccess == publicAccess || _class.module == privateModule)
                  {
                     Conversion after = (conversions != null) ? conversions.last : null;

                     if(!convert.dataType)
                        convert.dataType = ProcessTypeString(convert.dataTypeString, false);
                     if(convert.dataType != source && MatchTypes(convert.dataType, dest, conversions, null, null, true, true, false, true))
                     {
                        if(!conversions && !convert.Get)
                           return true;
                        else if(conversions != null)
                        {
                           if(_class.type == unitClass && convert.dataType.kind == classType && convert.dataType._class && 
                              convert.dataType._class.registered && _class.base == convert.dataType._class.registered.base && 
                              (dest.kind != classType || dest._class.registered != _class.base))
                              return true;
                           else
                           {
                              Conversion conv { convert = convert, isGet = true };

                              // conversions.Add(conv);
                              conversions.Insert(after, conv);
                              return true;
                           }
                        }
                     }
                  }
               }
            }

            // TESTING THIS... IS THIS OK??
            if(enumBaseType && source._class && source._class.registered && source._class.registered.type == enumClass)
            {
               if(!source._class.registered.dataType)
                  source._class.registered.dataType = ProcessTypeString(source._class.registered.dataTypeString, false);
               if(MatchTypes(source._class.registered.dataType, dest, conversions, null, null, true, true, false, false))
               {
                  return true;
               }
            }
         }
      }

      if(source.kind == classType || source.kind == subClassType)
         ;
      else if(dest.kind == source.kind && 
         (dest.kind != structType && dest.kind != unionType &&
          dest.kind != functionType && dest.kind != arrayType && dest.kind != pointerType && dest.kind != methodType))
          return true;
      // RECENTLY ADDED THESE
      else if(dest.kind == doubleType && source.kind == floatType)
         return true;
      else if(dest.kind == shortType && source.kind == charType)
         return true;
      else if(dest.kind == intType && (source.kind == shortType || source.kind == charType))
         return true;
      else if(dest.kind == int64Type && (source.kind == shortType || source.kind == charType || source.kind == intType))
         return true;
      else if(dest.kind == intPtrType && (source.kind == shortType || source.kind == charType || source.kind == intType))
         return true;
      else if(source.kind == enumType &&
         (dest.kind == intType || dest.kind == shortType || dest.kind == charType || dest.kind == longType || dest.kind == int64Type || dest.kind == intPtrType))
          return true;
      else if(dest.kind == enumType &&
         (source.kind == intType || source.kind == shortType || source.kind == charType || source.kind == longType || source.kind == int64Type || source.kind == intPtrType))
          return true;
      else if((dest.kind == functionType || (dest.kind == pointerType && dest.type.kind == functionType) || dest.kind == methodType) && 
              ((source.kind == functionType || (source.kind == pointerType && source.type.kind == functionType) || source.kind == methodType)))
      {
         Type paramSource, paramDest;

         if(dest.kind == methodType)     
            owningClassDest = dest.methodClass ? dest.methodClass : dest.method._class;
         if(source.kind == methodType)   
            owningClassSource = source.methodClass ? source.methodClass : source.method._class;

         if(dest.kind == pointerType && dest.type.kind == functionType) dest = dest.type;
         if(source.kind == pointerType && source.type.kind == functionType) source = source.type;
         if(dest.kind == methodType) 
            dest = dest.method.dataType;
         if(source.kind == methodType) 
            source = source.method.dataType;

         paramSource = source.params.first;
         if(paramSource && paramSource.kind == voidType) paramSource = null;
         paramDest = dest.params.first;
         if(paramDest && paramDest.kind == voidType) paramDest = null;

     
         if((dest.staticMethod || (!dest.thisClass && !owningClassDest)) && 
            !(source.staticMethod || (!source.thisClass && !owningClassSource)))
         {
            // Source thisClass must be derived from destination thisClass
            if(!paramDest || (!(paramDest.kind == pointerType && paramDest.type && paramDest.type.kind == voidType) && (paramDest.kind != classType ||
               !eClass_IsDerived(source.thisClass ? source.thisClass.registered : owningClassSource,paramDest._class.registered))))
            {
               if(paramDest && paramDest.kind == classType)
                  Compiler_Error($"method class must be derived from %s\n", paramDest._class.string);
               else
                  Compiler_Error($"method class should not take an object\n");
               return false;
            }
            paramDest = paramDest.next;
         }
         else if(!dest.staticMethod && (dest.thisClass || owningClassDest))
         {
            if((source.staticMethod || (!source.thisClass && !owningClassSource)))
            {
               if(dest.thisClass)
               {
                  if(!paramSource || paramSource.kind != classType || !eClass_IsDerived(paramSource._class.registered,dest.thisClass.registered))
                  {
                     Compiler_Error($"method class must be derived from %s\n", dest.thisClass.string);
                     return false;
                  }
               }
               else
               {
                  // THIS WAS BACKWARDS:
                  // if(!paramSource || paramSource.kind != classType || (owningClassDest && !eClass_IsDerived(owningClassDest, paramSource._class.registered)))
                  if(!paramSource || paramSource.kind != classType || (owningClassDest && !eClass_IsDerived(paramSource._class.registered, owningClassDest)))
                  {
                     if(owningClassDest)
                       Compiler_Error($"%s expected to be derived from method class\n", owningClassDest.fullName);
                     else
                        Compiler_Error($"overriding class expected to be derived from method class\n");      
                     return false;
                  }
               }
               paramSource = paramSource.next;
            }
            else
            {
               if(dest.thisClass)
               {
                  // Source thisClass must be derived from destination thisClass
                  if(!eClass_IsDerived(source.thisClass ? source.thisClass.registered : owningClassSource, dest.thisClass.registered))
                  {
                     Compiler_Error($"method class must be derived from %s\n", dest.thisClass.string);
                     return false;
                  }
               }
               else
               {
                  // THIS WAS BACKWARDS TOO??
                  // if(source.thisClass && owningClassDest && !eClass_IsDerived(owningClassDest, source.thisClass.registered))
                  if(source.thisClass && source.thisClass.registered && owningClassDest && !eClass_IsDerived(source.thisClass.registered, owningClassDest))
                  {
                     //if(owningClass)
                        Compiler_Error($"%s expected to be derived from method class\n", /*owningClass.name*/ source.thisClass.registered.fullName);
                     //else
                        //Compiler_Error($"overriding class expected to be derived from method class\n");      
                     return false;
                  }
               }
            }
         }


         // Source return type must be derived from destination return type
         if(!MatchTypes(source.returnType, dest.returnType, null, null, null, true, true, false, false))
         {
            Compiler_Warning($"incompatible return type for function\n");
            return false;
         }

         // Check parameters
      
         for(; paramDest; paramDest = paramDest.next)
         {
            if(!paramSource)
            {
               //Compiler_Warning($"not enough parameters\n");
               Compiler_Error($"not enough parameters\n");
               return false;
            }
            {
               Type paramDestType = paramDest;
               Type paramSourceType = paramSource;
               Type type = paramDestType;

               // *** WORKING CODE: TESTING THIS HERE FOR TEMPLATES ***
               if(paramDest.kind == templateType && paramDest.templateParameter.type == TemplateParameterType::type && owningClassSource &&
                  paramSource.kind != templateType)
               {
                  int id = 0;
                  ClassTemplateParameter curParam = null;
                  Class sClass;
                  for(sClass = owningClassSource; sClass; sClass = sClass.base)
                  {
                     id = 0;
                     if(sClass.templateClass) sClass = sClass.templateClass;
                     for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
                     {
                        if(curParam.type == TemplateParameterType::type && !strcmp(type.templateParameter.identifier.string, curParam.name))
                        {
                           for(sClass = sClass.base; sClass; sClass = sClass.base)
                           {
                              if(sClass.templateClass) sClass = sClass.templateClass;
                              id += sClass.templateParams.count;
                           }
                           break;
                        }
                        id++;
                     }
                     if(curParam) break;
                  }

                  if(curParam)
                  {
                     ClassTemplateArgument arg = owningClassSource.templateArgs[id];
                     paramDestType = type = ProcessTypeString(arg.dataTypeString, false);
                  }
               }

               // paramDest must be derived from paramSource
               if(!MatchTypes(paramDestType, paramSourceType, null, null, null, true, true, false, false) && 
                  (!acceptReversedParams || !MatchTypes(paramSourceType, paramDestType, null, null, null, true, true, false, false)))
               {
                  char type[1024];
                  type[0] = 0;
                  PrintType(paramDest, type, false, true);
                  Compiler_Warning($"incompatible parameter %s (expected %s)\n", paramSource.name, type);
                  
                  if(paramDestType != paramDest)
                     FreeType(paramDestType);
                  return false;
               }
               if(paramDestType != paramDest)
                  FreeType(paramDestType);
            }
         
            paramSource = paramSource.next;
         }
         if(paramSource)
         {
            Compiler_Error($"too many parameters\n");
            return false;
         }
         return true;
      }
      else if((dest.kind == functionType || (dest.kind == pointerType && dest.type.kind == functionType) || dest.kind == methodType) && (source.kind == pointerType && source.type.kind == voidType))
      {
         return true;
      }
      else if((dest.kind == pointerType || dest.kind == arrayType) && 
         (source.kind == arrayType || source.kind == pointerType))
      {
         if(MatchTypes(source.type, dest.type, null, null, null, true, true, false, false))
            return true;
      }
   }
   return false;
}

static void FreeConvert(Conversion convert)
{
   if(convert.resultType)
      FreeType(convert.resultType);
}

bool MatchWithEnums_NameSpace(NameSpace nameSpace, Expression sourceExp, Type dest, 
                              char * string, OldList conversions)
{
   BTNamedLink link;

   for(link = (BTNamedLink)nameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
   {
      Class _class = link.data;
      if(_class.type == enumClass)
      {
         OldList converts { };
         Type type { };
         type.kind = classType;

         if(!_class.symbol)
            _class.symbol = FindClass(_class.fullName);
         type._class = _class.symbol;

         if(MatchTypes(type, dest, &converts, null, null, true, false, false, false))
         {
            NamedLink value;
            Class enumClass = eSystem_FindClass(privateModule, "enum");
            if(enumClass)
            {
               Class baseClass;
               for(baseClass = _class ; baseClass && baseClass.type == ClassType::enumClass; baseClass = baseClass.base)
               {
                  EnumClassData e = ACCESS_CLASSDATA(baseClass, enumClass);
                  for(value = e.values.first; value; value = value.next)
                  {
                     if(!strcmp(value.name, string))
                        break;
                  }
                  if(value)
                  {
                     FreeExpContents(sourceExp);
                     FreeType(sourceExp.expType);

                     sourceExp.isConstant = true;
                     sourceExp.expType = MkClassType(baseClass.fullName);
                     //if(inCompiler)
                     {
                        char constant[256];
                        sourceExp.type = constantExp;
                        if(!strcmp(baseClass.dataTypeString, "int"))
                           sprintf(constant, "%d",value.data);
                        else
                           sprintf(constant, "0x%X",value.data);
                        sourceExp.constant = CopyString(constant);
                        //for(;baseClass.base && baseClass.base.type != systemClass; baseClass = baseClass.base);
                     }
                  
                     while(converts.first)
                     {
                        Conversion convert = converts.first;
                        converts.Remove(convert);
                        conversions.Add(convert);
                     }
                     delete type;
                     return true;
                  }
               }
            }
         }
         if(converts.first)
            converts.Free(FreeConvert);
         delete type;
      }
   }
   for(nameSpace = (NameSpace *)nameSpace.nameSpaces.first; nameSpace != null; nameSpace = (NameSpace *)((BTNode)nameSpace).next)
      if(MatchWithEnums_NameSpace(nameSpace, sourceExp, dest, string, conversions))
         return true;
   return false;
}

public bool ModuleVisibility(Module searchIn, Module searchFor)
{
   SubModule subModule;
   
   if(searchFor == searchIn)
      return true;

   for(subModule = searchIn.modules.first; subModule; subModule = subModule.next)
   {
      if(subModule.importMode == publicAccess || searchIn == searchIn.application)
      {
         if(ModuleVisibility(subModule.module, searchFor))
            return true;
      }
   }
   return false;
}

bool MatchWithEnums_Module(Module mainModule, Expression sourceExp, Type dest, char * string, OldList conversions)
{
   Module module;

   if(MatchWithEnums_NameSpace(mainModule.application.systemNameSpace, sourceExp, dest, string, conversions))
      return true;
   if(MatchWithEnums_NameSpace(mainModule.application.privateNameSpace, sourceExp, dest, string, conversions))
      return true;
   if(MatchWithEnums_NameSpace(mainModule.application.publicNameSpace, sourceExp, dest, string, conversions))
      return true;

   for(module = mainModule.application.allModules.first; module; module = module.next)
   {
      if(ModuleVisibility(mainModule, module) && MatchWithEnums_NameSpace(module.publicNameSpace, sourceExp, dest, string, conversions))
         return true;
   }
   return false;
}

bool MatchTypeExpression(Expression sourceExp, Type dest, OldList conversions, bool skipUnitBla)
{
   Type source = sourceExp.expType;
   Type realDest = dest;

   if(dest.kind == pointerType && sourceExp.type == constantExp && !strtoul(sourceExp.constant, null, 0))
      return true;

   if(!skipUnitBla && source && dest && source.kind == classType && dest.kind == classType)
   {
       if(source._class && source._class.registered && source._class.registered.type == unitClass)
       {
          Class sourceBase, destBase;
          for(sourceBase = source._class.registered; 
              sourceBase && sourceBase.base && sourceBase.base.type != systemClass;
              sourceBase = sourceBase.base);
          for(destBase = dest._class.registered; 
              destBase && destBase.base && destBase.base.type != systemClass;
              destBase = destBase.base);
          //if(source._class.registered == dest._class.registered)
          if(sourceBase == destBase)
             return true;
       }
   }

   if(source)
   {
      OldList * specs;
      bool flag = false;
      int64 value = MAXINT;

      source.refCount++;
      dest.refCount++;

      if(sourceExp.type == constantExp)
      {
         if(source.isSigned)
            value = strtoll(sourceExp.constant, null, 0);
         else
            value = strtoull(sourceExp.constant, null, 0);
      }
      else if(sourceExp.type == opExp && sourceExp.op.op == '-' && !sourceExp.op.exp1 && sourceExp.op.exp2 && sourceExp.op.exp2.type == constantExp)
      {
         if(source.isSigned)
            value = -strtoll(sourceExp.op.exp2.constant, null, 0);
         else
            value = -strtoull(sourceExp.op.exp2.constant, null, 0);
      }

      if(dest.kind != classType && source.kind == classType && source._class && source._class.registered && 
         !strcmp(source._class.registered.fullName, "ecere::com::unichar"))
      {
         FreeType(source);
         source = Type { kind = intType, isSigned = false, refCount = 1 };
      }

      if(dest.kind == classType)
      {
         Class _class = dest._class ? dest._class.registered : null;

         if(_class && _class.type == unitClass)
         {
            if(source.kind != classType)
            {
               Type tempType { };
               Type tempDest, tempSource;

               for(; _class.base.type != systemClass; _class = _class.base);
               tempSource = dest;
               tempDest = tempType;

               tempType.kind = classType;
               if(!_class.symbol)
                  _class.symbol = FindClass(_class.fullName);

               tempType._class = _class.symbol;
               tempType.truth = dest.truth;
               if(tempType._class)
                  MatchTypes(tempSource, tempDest, conversions, null, null, true, true, false, false);

               FreeType(sourceExp.expType);
               sourceExp.expType = dest; dest.refCount++;

               //sourceExp.expType = MkClassType(_class.fullName);
               flag = true;            

               delete tempType;
            }
         }


         // Why wasn't there something like this?
         if(_class && _class.type == bitClass && source.kind != classType)
         {
            if(!dest._class.registered.dataType)
               dest._class.registered.dataType = ProcessTypeString(dest._class.registered.dataTypeString, false);
            if(MatchTypes(source, dest._class.registered.dataType, conversions, null, null, true, true, false, false))
            {
               FreeType(source);
               FreeType(sourceExp.expType);
               source = sourceExp.expType = MkClassType(dest._class.string);
               source.refCount++;
               
               //source.kind = classType;
               //source._class = dest._class;
            }
         }

         // Adding two enumerations
         /*
         if(_class && _class.type == enumClass && source.kind == classType && source._class && source._class.registered && source._class.registered.type == enumClass)
         {
            if(!source._class.registered.dataType)
               source._class.registered.dataType = ProcessTypeString(source._class.registered.dataTypeString, false);
            if(!dest._class.registered.dataType)
               dest._class.registered.dataType = ProcessTypeString(dest._class.registered.dataTypeString, false);

            if(MatchTypes(source._class.registered.dataType, dest._class.registered.dataType, conversions, null, null, true, false, false))
            {
               FreeType(source);
               source = sourceExp.expType = MkClassType(dest._class.string);
               source.refCount++;
               
               //source.kind = classType;
               //source._class = dest._class;
            }
         }*/

         if(_class && !strcmp(_class.fullName, "ecere::com::Class") && source.kind == pointerType && source.type && source.type.kind == charType && sourceExp.type == stringExp)
         {
            OldList * specs = MkList();
            Declarator decl;
            char string[1024];

            ReadString(string, sourceExp.string);
            decl = SpecDeclFromString(string, specs, null);

            FreeExpContents(sourceExp);
            FreeType(sourceExp.expType);

            sourceExp.type = classExp;
            sourceExp._classExp.specifiers = specs;
            sourceExp._classExp.decl = decl;
            sourceExp.expType = dest;
            dest.refCount++;

            FreeType(source);
            FreeType(dest);
            return true;
         }
      }
      else if(source.kind == classType)
      {
         Class _class = source._class ? source._class.registered : null;

         if(_class && (_class.type == unitClass || !strcmp(_class.fullName, "bool") || /*_class.type == enumClass || */_class.type == bitClass ))  // TOCHECK: enumClass, bitClass is new here...
         {
            /*
            if(dest.kind != classType)
            {
               // Testing this simpler piece of code... (Broke Units Conversion to no unit Logic)
               if(!source._class.registered.dataType)
                  source._class.registered.dataType = ProcessTypeString(source._class.registered.dataTypeString, false);
               
               FreeType(dest);
               dest = MkClassType(source._class.string);
               //if(MatchTypes(source._class.registered.dataType, dest, conversions, null, null, true, false, false))
               //   dest = MkClassType(source._class.string);
            }
            */
            
            if(dest.kind != classType)
            {
               Type tempType { };
               Type tempDest, tempSource;

               if(!source._class.registered.dataType)
                  source._class.registered.dataType = ProcessTypeString(source._class.registered.dataTypeString, false);

               for(; _class.base.type != systemClass; _class = _class.base);
               tempDest = source;
               tempSource = tempType;
               tempType.kind = classType;
               tempType._class = FindClass(_class.fullName);
               tempType.truth = source.truth;
               tempType.classObjectType = source.classObjectType;

               if(tempType._class)
                  MatchTypes(tempSource, tempDest, conversions, null, null, true, true, false, false);
               
               // PUT THIS BACK TESTING UNITS?
               if(conversions.last)
               {
                  ((Conversion)(conversions.last)).resultType = dest;
                  dest.refCount++;
               }
               
               FreeType(sourceExp.expType);
               sourceExp.expType = MkClassType(_class.fullName);
               sourceExp.expType.truth = source.truth;
               sourceExp.expType.classObjectType = source.classObjectType;

               // *** This if was commented out, put it back because "int a =^ Destroy()" shows up bool enum values in autocomplete ***

               if(!sourceExp.destType)
               {
                  FreeType(sourceExp.destType);
                  sourceExp.destType = sourceExp.expType;
                  if(sourceExp.expType)
                     sourceExp.expType.refCount++;
               }
               //flag = true;
               //source = _class.dataType;


               // TOCHECK: TESTING THIS NEW CODE
               if(!_class.dataType)
                  _class.dataType = ProcessTypeString(_class.dataTypeString, false);
               FreeType(dest);
               dest = MkClassType(source._class.string);
               dest.truth = source.truth;
               dest.classObjectType = source.classObjectType;
               
               FreeType(source);
               source = _class.dataType;
               source.refCount++;

               delete tempType;
            }
         }
      }

      if(!flag)
      {
         if(MatchTypes(source, dest, conversions, null, null, true, true, false, false))
         {
            FreeType(source);
            FreeType(dest);
            return true;
         }
      }

      // Implicit Casts
      /*
      if(source.kind == classType)
      {
         Class _class = source._class.registered;
         if(_class.type == unitClass)
         {
            if(!_class.dataType)
               _class.dataType = ProcessTypeString(_class.dataTypeString, false);
            source = _class.dataType;
         }
      }*/

      if(dest.kind == classType)
      {
         Class _class = dest._class ? dest._class.registered : null;
         if(_class && !dest.truth && (_class.type == unitClass || !strcmp(_class.fullName, "bool") || 
            (/*_class.type == enumClass*/_class.type != structClass && !value && source.kind == intType) || _class.type == bitClass))   // TOCHECK: enumClass, bitClass is new here...
         {
            if(_class.type == normalClass || _class.type == noHeadClass)
            {
               Expression newExp { };
               *newExp = *sourceExp;
               if(sourceExp.destType) sourceExp.destType.refCount++;
               if(sourceExp.expType)  sourceExp.expType.refCount++;
               sourceExp.type = castExp;
               sourceExp.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null), null));
               sourceExp.cast.exp = newExp;
               FreeType(sourceExp.expType);
               sourceExp.expType = null;
               ProcessExpressionType(sourceExp);

               // In Debugger, this helps with addresses (e.g. null pointers) that end up casted to a void *: keeps a classType instead of a pointerType
               if(!inCompiler)
               {
                  FreeType(sourceExp.expType);
                  sourceExp.expType = dest;
               }

               FreeType(source);
               if(inCompiler) FreeType(dest);

               return true;
            }

            if(!_class.dataType)
               _class.dataType = ProcessTypeString(_class.dataTypeString, false);
            FreeType(dest);
            dest = _class.dataType;
            dest.refCount++;
         }

         // Accept lower precision types for units, since we want to keep the unit type
         if(dest.kind == doubleType && 
            (source.kind == doubleType || source.kind == floatType || dest.kind == int64Type || source.kind == intType || source.kind == shortType ||
             source.kind == charType))
         {
            specs = MkListOne(MkSpecifier(DOUBLE));
         }
         else if(dest.kind == floatType && 
            (source.kind == floatType || dest.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == doubleType))
         {
            specs = MkListOne(MkSpecifier(FLOAT));
         }
         else if(dest.kind == int64Type && (source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(INT64));
         }
         else if(dest.kind == intType && (source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(INT));
         }
         else if(dest.kind == shortType && (source.kind == shortType || source.kind == charType || source.kind == intType ||
            source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(SHORT));
         }
         else if(dest.kind == charType && (source.kind == charType || source.kind == shortType || source.kind == intType ||
            source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(CHAR));
         }
         else
         {
            FreeType(source);
            FreeType(dest);
            return false;
         }
      }
      else if(dest.kind == doubleType && 
         (source.kind == doubleType || source.kind == floatType || source.kind == int64Type || source.kind == intType || source.kind == enumType || source.kind == shortType ||
          source.kind == charType))
      {
         specs = MkListOne(MkSpecifier(DOUBLE));
      }
      else if(dest.kind == floatType && 
         (source.kind == floatType || source.kind == enumType || source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType))
      {
         specs = MkListOne(MkSpecifier(FLOAT));
      }
      else if(dest.kind == charType && (source.kind == charType || source.kind == enumType || source.kind == shortType || source.kind == intType) && 
         (dest.isSigned ? (value >= -128 && value <= 127) : (value >= 0 && value <= 255)))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(CHAR));
      }
      else if(dest.kind == shortType && (source.kind == enumType || source.kind == charType || source.kind == shortType || 
         (source.kind == intType && (dest.isSigned ? (value >= -32768 && value <= 32767) : (value >= 0 && value <= 65535)))))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(SHORT));
      }
      else if(dest.kind == intType && (source.kind == enumType || source.kind == shortType || source.kind == charType || source.kind == intType))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(INT));
      }
      else if(dest.kind == int64Type && (source.kind == enumType || source.kind == shortType || source.kind == charType || source.kind == intType || source.kind == int64Type))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(INT64));
      }
      else if(dest.kind == enumType && 
         (source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType))
      {
         specs = MkListOne(MkEnum(MkIdentifier(dest.enumName), null));
      }
      else
      {
         FreeType(source);
         FreeType(dest);
         return false;
      }

      if(!flag)
      {
         Expression newExp { };
         *newExp = *sourceExp;
         newExp.prev = null;
         newExp.next = null;
         if(sourceExp.destType) sourceExp.destType.refCount++;
         if(sourceExp.expType)  sourceExp.expType.refCount++;

         sourceExp.type = castExp;
         if(realDest.kind == classType)
         {
            sourceExp.cast.typeName = QMkClass(realDest._class.string, null);
            FreeList(specs, FreeSpecifier);
         }
         else
            sourceExp.cast.typeName = MkTypeName(specs, null);
         if(newExp.type == opExp)
         {
            sourceExp.cast.exp = MkExpBrackets(MkListOne(newExp));
         }
         else
            sourceExp.cast.exp = newExp;
         
         FreeType(sourceExp.expType);
         sourceExp.expType = null;
         ProcessExpressionType(sourceExp);
      }
      else
         FreeList(specs, FreeSpecifier);

      FreeType(dest);
      FreeType(source);
      return true;
   }
   else
   {
      while((sourceExp.type == bracketsExp || sourceExp.type == extensionExpressionExp) && sourceExp.list) sourceExp = sourceExp.list->last;
      if(sourceExp.type == identifierExp)
      {
         Identifier id = sourceExp.identifier;
         if(dest.kind == classType)
         {
            if(dest._class && dest._class.registered && dest._class.registered.type == enumClass)
            {
               Class _class = dest._class.registered;
               Class enumClass = eSystem_FindClass(privateModule, "enum");
               if(enumClass)
               {
                  for( ; _class && _class.type == ClassType::enumClass; _class = _class.base)
                  {
                     NamedLink value;
                     EnumClassData e = ACCESS_CLASSDATA(_class, enumClass);
                     for(value = e.values.first; value; value = value.next)
                     {
                        if(!strcmp(value.name, id.string))
                           break;
                     }
                     if(value)
                     {
                        FreeExpContents(sourceExp);
                        FreeType(sourceExp.expType);

                        sourceExp.isConstant = true;
                        sourceExp.expType = MkClassType(_class.fullName);
                        //if(inCompiler)
                        {
                           char constant[256];
                           sourceExp.type = constantExp;
                           if(/*_class && */_class.dataTypeString && !strcmp(_class.dataTypeString, "int")) // _class cannot be null here!
                              sprintf(constant, "%d",value.data);
                           else
                              sprintf(constant, "0x%X",value.data);
                           sourceExp.constant = CopyString(constant);
                           //for(;_class.base && _class.base.type != systemClass; _class = _class.base);
                        }
                        return true;
                     }
                  }
               }
            }
         }

         // Loop through all enum classes
         if(dest.classObjectType != typedObject && dest.kind == classType /*!= ellipsisType */&& MatchWithEnums_Module(privateModule, sourceExp, dest, id.string, conversions))
            return true;
      }
   }
   return false;
}

#define TERTIARY(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1, Operand op2, Operand op3)   \
   {                                                              \
      exp.type = constantExp;                                    \
      exp.string = p(op1.m ? op2.m : op3.m);                     \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define BINARY(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1, Operand op2)   \
   {                                                              \
      t value2 = op2.m;                                           \
      exp.type = constantExp;                                    \
      exp.string = p(op1.m o value2);                     \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define BINARY_DIVIDE(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1, Operand op2)   \
   {                                                              \
      t value2 = op2.m;                                           \
      exp.type = constantExp;                                    \
      exp.string = p(value2 ? (op1.m o value2) : 0);             \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define UNARY(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1)                \
   {                                                              \
      exp.type = constantExp;                                    \
      exp.string = p(o op1.m);                                   \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define OPERATOR_ALL(macro, o, name) \
   macro(o, Int##name, i, int, PrintInt) \
   macro(o, UInt##name, ui, unsigned int, PrintUInt) \
   macro(o, Short##name, s, short, PrintShort) \
   macro(o, UShort##name, us, unsigned short, PrintUShort) \
   macro(o, Char##name, c, char, PrintChar) \
   macro(o, UChar##name, uc, unsigned char, PrintUChar) \
   macro(o, Float##name, f, float, PrintFloat) \
   macro(o, Double##name, d, double, PrintDouble)

#define OPERATOR_INTTYPES(macro, o, name) \
   macro(o, Int##name, i, int, PrintInt) \
   macro(o, UInt##name, ui, unsigned int, PrintUInt) \
   macro(o, Short##name, s, short, PrintShort) \
   macro(o, UShort##name, us, unsigned short, PrintUShort) \
   macro(o, Char##name, c, char, PrintChar) \
   macro(o, UChar##name, uc, unsigned char, PrintUChar)


// binary arithmetic
OPERATOR_ALL(BINARY, +, Add)
OPERATOR_ALL(BINARY, -, Sub)
OPERATOR_ALL(BINARY, *, Mul)
OPERATOR_ALL(BINARY_DIVIDE, /, Div)
OPERATOR_INTTYPES(BINARY_DIVIDE, %, Mod)

// unary arithmetic
OPERATOR_ALL(UNARY, -, Neg)

// unary arithmetic increment and decrement
OPERATOR_ALL(UNARY, ++, Inc)
OPERATOR_ALL(UNARY, --, Dec)

// binary arithmetic assignment
OPERATOR_ALL(BINARY, =, Asign)
OPERATOR_ALL(BINARY, +=, AddAsign)
OPERATOR_ALL(BINARY, -=, SubAsign)
OPERATOR_ALL(BINARY, *=, MulAsign)
OPERATOR_ALL(BINARY_DIVIDE, /=, DivAsign)
OPERATOR_INTTYPES(BINARY_DIVIDE, %=, ModAsign)

// binary bitwise
OPERATOR_INTTYPES(BINARY, &, BitAnd)
OPERATOR_INTTYPES(BINARY, |, BitOr)
OPERATOR_INTTYPES(BINARY, ^, BitXor)
OPERATOR_INTTYPES(BINARY, <<, LShift)
OPERATOR_INTTYPES(BINARY, >>, RShift)

// unary bitwise
OPERATOR_INTTYPES(UNARY, ~, BitNot)

// binary bitwise assignment
OPERATOR_INTTYPES(BINARY, &=, AndAsign)
OPERATOR_INTTYPES(BINARY, |=, OrAsign)
OPERATOR_INTTYPES(BINARY, ^=, XorAsign)
OPERATOR_INTTYPES(BINARY, <<=, LShiftAsign)
OPERATOR_INTTYPES(BINARY, >>=, RShiftAsign)

// unary logical negation
OPERATOR_INTTYPES(UNARY, !, Not)

// binary logical equality
OPERATOR_ALL(BINARY, ==, Equ)
OPERATOR_ALL(BINARY, !=, Nqu)

// binary logical
OPERATOR_ALL(BINARY, &&, And)
OPERATOR_ALL(BINARY, ||, Or)

// binary logical relational
OPERATOR_ALL(BINARY, >, Grt)
OPERATOR_ALL(BINARY, <, Sma)
OPERATOR_ALL(BINARY, >=, GrtEqu)
OPERATOR_ALL(BINARY, <=, SmaEqu)

// tertiary condition operator
OPERATOR_ALL(TERTIARY, ?, Cond)

//Add, Sub, Mul, Div, Mod,     , Neg,     Inc, Dec,    Asign, AddAsign, SubAsign, MulAsign, DivAsign, ModAsign,     BitAnd, BitOr, BitXor, LShift, RShift, BitNot,     AndAsign, OrAsign, XorAsign, LShiftAsign, RShiftAsign,     Not,     Equ, Nqu,     And, Or,     Grt, Sma, GrtEqu, SmaEqu
#define OPERATOR_TABLE_ALL(name, type) \
    OpTable name##Ops = { type##Add, type##Sub, type##Mul, type##Div, type##Mod, \
                          type##Neg, \
                          type##Inc, type##Dec, \
                          type##Asign, type##AddAsign, type##SubAsign, type##MulAsign, type##DivAsign, type##ModAsign, \
                          type##BitAnd, type##BitOr, type##BitXor, type##LShift, type##RShift, \
                          type##BitNot, \
                          type##AndAsign, type##OrAsign, type##XorAsign, type##LShiftAsign, type##RShiftAsign, \
                          type##Not, \
                          type##Equ, type##Nqu, \
                          type##And, type##Or, \
                          type##Grt, type##Sma, type##GrtEqu, type##SmaEqu, type##Cond \
                        }; \

#define OPERATOR_TABLE_INTTYPES(name, type) \
    OpTable name##Ops = { type##Add, type##Sub, type##Mul, type##Div, null, \
                          type##Neg, \
                          type##Inc, type##Dec, \
                          type##Asign, type##AddAsign, type##SubAsign, type##MulAsign, type##DivAsign, null, \
                          null, null, null, null, null, \
                          null, \
                          null, null, null, null, null, \
                          null, \
                          type##Equ, type##Nqu, \
                          type##And, type##Or, \
                          type##Grt, type##Sma, type##GrtEqu, type##SmaEqu \
                        }; \

OPERATOR_TABLE_ALL(int, Int)
OPERATOR_TABLE_ALL(uint, UInt)
OPERATOR_TABLE_ALL(short, Short)
OPERATOR_TABLE_ALL(ushort, UShort)
OPERATOR_TABLE_INTTYPES(float, Float)
OPERATOR_TABLE_INTTYPES(double, Double)
OPERATOR_TABLE_ALL(char, Char)
OPERATOR_TABLE_ALL(uchar, UChar)

//OpTable intOps =    {    IntAdd,    IntSub,    IntMul,    IntDiv,    IntMod,    IntExp,    IntNot,    IntBwn,    IntOr,    IntAnd,    IntEqu,    IntNqu,    IntGrt,    IntSma,    IntGrtEqu,    IntSmaEqu,    IntNeg,    IntLBitSft,    IntRBitSft };
//OpTable uintOps =   {   UIntAdd,   UIntSub,   UIntMul,   UIntDiv,   UIntMod,   UIntExp,   UIntNot,   UIntBwn,   UIntOr,   UIntAnd,   UIntEqu,   UIntNqu,   UIntGrt,   UIntSma,   UIntGrtEqu,   UIntSmaEqu,   UIntNeg,   UIntLBitSft,   UIntRBitSft };
//OpTable shortOps =  {  ShortAdd,  ShortSub,  ShortMul,  ShortDiv,  ShortMod,  ShortExp,  ShortNot,  ShortBwn,  ShortOr,  ShortAnd,  ShortEqu,  ShortNqu,  ShortGrt,  ShortSma,  ShortGrtEqu,  ShortSmaEqu,  ShortNeg,  ShortLBitSft,  ShortRBitSft };
//OpTable ushortOps = { UShortAdd, UShortSub, UShortMul, UShortDiv, UShortMod, UShortExp, UShortNot, UShortBwn, UShortOr, UShortAnd, UShortEqu, UShortNqu, UShortGrt, UShortSma, UShortGrtEqu, UShortSmaEqu, UShortNeg, UShortLBitSft, UShortRBitSft };
//OpTable floatOps =  {  FloatAdd,  FloatSub,  FloatMul,  FloatDiv,      null,      null,      null,      null,     null,      null,  FloatEqu,  FloatNqu,  FloatGrt,  FloatSma,  FloatGrtEqu,  FloatSmaEqu,  FloatNeg,          null,          null };
//OpTable doubleOps = { DoubleAdd, DoubleSub, DoubleMul, DoubleDiv,      null,      null,      null,      null,     null,      null, DoubleEqu, DoubleNqu, DoubleGrt, DoubleSma, DoubleGrtEqu, DoubleSmaEqu, DoubleNeg,          null,          null };
//OpTable charOps =   {   CharAdd,   CharSub,   CharMul,   CharDiv,   CharMod,   CharExp,   CharNot,   CharBwn,   CharOr,   CharAnd,   CharEqu,   CharNqu,   CharGrt,   CharSma,   CharGrtEqu,   CharSmaEqu,   CharNeg,   CharLBitSft,   CharRBitSft };
//OpTable ucharOps =  {  UCharAdd,  UCharSub,  UCharMul,  UCharDiv,  UCharMod,  UCharExp,  UCharNot,  UCharBwn,  UCharOr,  UCharAnd,  UCharEqu,  UCharNqu,  UCharGrt,  UCharSma,  UCharGrtEqu,  UCharSmaEqu,  UCharNeg,  UCharLBitSft,  UCharRBitSft };

public void ReadString(char * output,  char * string)
{
   int len = strlen(string);
   int c,d = 0;
   bool quoted = false, escaped = false;
   for(c = 0; c<len; c++)
   {
      char ch = string[c];
      if(escaped)
      {
         switch(ch)
         {
            case 'n': output[d] = '\n'; break;
            case 't': output[d] = '\t'; break;
            case 'a': output[d] = '\a'; break;
            case 'b': output[d] = '\b'; break;
            case 'f': output[d] = '\f'; break;
            case 'r': output[d] = '\r'; break;
            case 'v': output[d] = '\v'; break;
            case '\\': output[d] = '\\'; break;
            case '\"': output[d] = '\"'; break;
            default: output[d++] = '\\'; output[d] = ch;
            //default: output[d] = ch;
         }
         d++;
         escaped = false;
      }
      else 
      {
         if(ch == '\"') 
            quoted ^= true;
         else if(quoted)
         {
            if(ch == '\\')
               escaped = true;
            else
               output[d++] = ch;
         }
      }
   }
   output[d] = '\0';
}

public Operand GetOperand(Expression exp)
{
   Operand op { };
   Type type = exp.expType;
   if(type)
   {
      while(type.kind == classType && 
         type._class.registered && (type._class.registered.type == bitClass || type._class.registered.type == unitClass || type._class.registered.type == enumClass))
      {
         if(!type._class.registered.dataType)
            type._class.registered.dataType = ProcessTypeString(type._class.registered.dataTypeString, false);
         type = type._class.registered.dataType;
         
      }
      op.kind = type.kind;
      op.type = exp.expType;
      if(exp.isConstant && exp.type == constantExp)
      {
         switch(op.kind)
         {
            case charType:
            {
               if(exp.constant[0] == '\'')
                  op.c = exp.constant[1];
               else if(type.isSigned)
               {
                  op.c = (char)strtol(exp.constant, null, 0);
                  op.ops = charOps;
               }
               else
               {
                  op.uc = (unsigned char)strtoul(exp.constant, null, 0);
                  op.ops = ucharOps;
               }
               break;
            }
            case shortType:
               if(type.isSigned)
               {
                  op.s = (short)strtol(exp.constant, null, 0);
                  op.ops = shortOps;
               }
               else
               {
                  op.us = (unsigned short)strtoul(exp.constant, null, 0);
                  op.ops = ushortOps;
               }
               break;
            case intType:
            case longType:
               if(type.isSigned)
               {
                  op.i = (int)strtol(exp.constant, null, 0);
                  op.ops = intOps;
               }
               else
               {
                  op.ui = (unsigned int)strtoul(exp.constant, null, 0);
                  op.ops = uintOps;
               }
               op.kind = intType;
               break;
            case int64Type:
               if(type.isSigned)
               {
                  op.i64 = (int64)_strtoi64(exp.constant, null, 0);
                  op.ops = intOps;
               }
               else
               {
                  op.ui64 = (uint64)_strtoui64(exp.constant, null, 0);
                  op.ops = uintOps;
               }
               op.kind = intType;
               break;
            case intPtrType:
               if(type.isSigned)
               {
                  op.iptr = (intptr)_strtoi64(exp.constant, null, 0);
                  op.ops = intOps;
               }
               else
               {
                  op.uiptr = (uintptr)_strtoui64(exp.constant, null, 0);
                  op.ops = uintOps;
               }
               op.kind = intType;
               break;
            case floatType:
               op.f = (float)strtod(exp.constant, null);
               op.ops = floatOps;
               break;
            case doubleType:
               op.d = (double)strtod(exp.constant, null);
               op.ops = doubleOps;
               break;
            //case classType:    For when we have operator overloading...
            // Pointer additions
            //case functionType:
            case arrayType:
            case pointerType:
            case classType:
               op.p = (unsigned char *)strtoul(exp.constant, null, 0);
               op.kind = pointerType;
               op.ops = uintOps;
               // op.ptrSize = 
               break;
         }
      }
   }
   return op;
}

static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
}
default:
extern int __ecereVMethodID_class_OnGetString;
public:

static void PopulateInstanceProcessMember(Instantiation inst, OldList * memberList, DataMember parentDataMember, uint offset)
{
   DataMember dataMember;
   for(dataMember = parentDataMember.members.first; dataMember; dataMember = dataMember.next)
   {
      if(!dataMember.name && (dataMember.type == structMember || dataMember.type == unionMember))
         PopulateInstanceProcessMember(inst, memberList, dataMember, offset + dataMember.offset);
      else
      {
         Expression exp { };
         MemberInit member = MkMemberInit(MkListOne(MkIdentifier(dataMember.name)), MkInitializerAssignment(exp));
         Type type;
         void * ptr = inst.data + dataMember.offset + offset;
         char * result = null;
         exp.loc = member.loc = inst.loc;
         ((Identifier)member.identifiers->first).loc = inst.loc;

         if(!dataMember.dataType)
            dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
         type = dataMember.dataType;
         if(type.kind == classType)
         {
            Class _class = type._class.registered;
            if(_class.type == enumClass)
            {
               Class enumClass = eSystem_FindClass(privateModule, "enum");
               if(enumClass)
               {
                  EnumClassData e = ACCESS_CLASSDATA(_class, enumClass);
                  NamedLink item;
                  for(item = e.values.first; item; item = item.next)
                  {
                     if((int)item.data == *(int *)ptr)
                     {
                        result = item.name;
                        break;
                     }
                  }
                  if(result)
                  {
                     exp.identifier = MkIdentifier(result);
                     exp.type = identifierExp;
                     exp.destType = MkClassType(_class.fullName);
                     ProcessExpressionType(exp);
                  }
               }
            }
            if(_class.type == enumClass || _class.type == unitClass || _class.type == bitClass)
            {
               if(!_class.dataType)
                  _class.dataType = ProcessTypeString(_class.dataTypeString, false);
               type = _class.dataType;
            }
         }
         if(!result)
         {
            switch(type.kind)
            {
               case floatType:
               {
                  FreeExpContents(exp);

                  exp.constant = PrintFloat(*(float*)ptr);
                  exp.type = constantExp;
                  break;
               }
               case doubleType:
               {
                  FreeExpContents(exp);

                  exp.constant = PrintDouble(*(double*)ptr);
                  exp.type = constantExp;
                  break;
               }
               case intType:
               {
                  FreeExpContents(exp);

                  exp.constant = PrintInt(*(int*)ptr);
                  exp.type = constantExp;
                  break;
               }
               case int64Type:
               {
                  FreeExpContents(exp);

                  exp.constant = PrintInt64(*(int64*)ptr);
                  exp.type = constantExp;
                  break;
               }
               case intPtrType:
               {
                  FreeExpContents(exp);

                  exp.constant = PrintInt64((int64)*(intptr*)ptr);
                  exp.type = constantExp;
                  break;
               }
               default:
                  Compiler_Error($"Unhandled type populating instance\n");
            }
         }
         ListAdd(memberList, member);
      }

      if(parentDataMember.type == unionMember)
         break;
   }
}

void PopulateInstance(Instantiation inst)
{
   Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
   Class _class = classSym.registered;
   DataMember dataMember;
   OldList * memberList = MkList();
   inst.members = MkListOne(MkMembersInitList(memberList));
   for(dataMember = _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
   {
      if(!dataMember.isProperty)
      {
         if(!dataMember.name && (dataMember.type == structMember || dataMember.type == unionMember))
            PopulateInstanceProcessMember(inst, memberList, dataMember, dataMember.offset);
         else
         {
            Expression exp { };
            MemberInit member = MkMemberInit(MkListOne(MkIdentifier(dataMember.name)), MkInitializerAssignment(exp));
            Type type;
            void * ptr = inst.data + dataMember.offset;
            char * result = null;

            exp.loc = member.loc = inst.loc;
            ((Identifier)member.identifiers->first).loc = inst.loc;

            if(!dataMember.dataType)
               dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
            type = dataMember.dataType;
            if(type.kind == classType)
            {
               Class _class = type._class.registered;
               if(_class.type == enumClass)
               {
                  Class enumClass = eSystem_FindClass(privateModule, "enum");
                  if(enumClass)
                  {
                     EnumClassData e = ACCESS_CLASSDATA(_class, enumClass);
                     NamedLink item;
                     for(item = e.values.first; item; item = item.next)
                     {
                        if((int)item.data == *(int *)ptr)
                        {
                           result = item.name;
                           break;
                        }
                     }
                  }
                  if(result)
                  {
                     exp.identifier = MkIdentifier(result);
                     exp.type = identifierExp;
                     exp.destType = MkClassType(_class.fullName);
                     ProcessExpressionType(exp);
                  }                     
               }
               if(_class.type == enumClass || _class.type == unitClass || _class.type == bitClass)
               {
                  if(!_class.dataType)
                     _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                  type = _class.dataType;
               }
            }
            if(!result)
            {
               switch(type.kind)
               {
                  case floatType:
                  {
                     exp.constant = PrintFloat(*(float*)ptr);
                     exp.type = constantExp;
                     break;
                  }
                  case doubleType:
                  {
                     exp.constant = PrintDouble(*(double*)ptr);
                     exp.type = constantExp;
                     break;
                  }
                  case intType:
                  {
                     exp.constant = PrintInt(*(int*)ptr);
                     exp.type = constantExp;
                     break;
                  }
                  case int64Type:
                  {
                     exp.constant = PrintInt64(*(int64*)ptr);
                     exp.type = constantExp;
                     break;
                  }
                  case intPtrType:
                  {
                     exp.constant = PrintInt64((int64)*(intptr*)ptr);
                     exp.type = constantExp;
                     break;
                  }
                  default:
                     Compiler_Error($"Unhandled type populating instance\n");
               }
            }
            ListAdd(memberList, member);
         }
      }
   }
}

void ComputeInstantiation(Expression exp)
{
   Instantiation inst = exp.instance;
   MembersInit members;
   Symbol classSym = inst._class ? inst._class.symbol : null; // FindClass(inst._class.name);
   Class _class = classSym ? classSym.registered : null;
   DataMember curMember = null;
   Class curClass = null;
   DataMember subMemberStack[256];
   int subMemberStackPos = 0;
   uint64 bits = 0;

   if(_class && (_class.type == structClass || _class.type == normalClass || _class.type == noHeadClass ))
   {
      // Don't recompute the instantiation... 
      // Non Simple classes will have become constants by now
      if(inst.data) 
         return;

      if(_class.type == normalClass || _class.type == noHeadClass)
         inst.data = (byte *)eInstance_New(_class);
      else
         inst.data = new0 byte[_class.structSize];
   }

   if(inst.members)
   {
      for(members = inst.members->first; members; members = members.next)
      {
         switch(members.type)
         {
            case dataMembersInit:
            {
               if(members.dataMembers)
               {
                  MemberInit member;
                  for(member = members.dataMembers->first; member; member = member.next)
                  {
                     Identifier ident = member.identifiers ? member.identifiers->first : null;
                     bool found = false;

                     Property prop = null;
                     DataMember dataMember = null;
                     Method method = null;
                     uint dataMemberOffset;

                     if(!ident)
                     {
                        eClass_FindNextMember(_class, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                        if(curMember)
                        {
                           if(curMember.isProperty)
                              prop = (Property)curMember;
                           else
                           {
                              dataMember = curMember;
                              
                              // CHANGED THIS HERE
                              eClass_FindDataMemberAndOffset(_class, dataMember.name, &dataMemberOffset, privateModule, null, null);
                              // dataMemberOffset = dataMember.offset;
                           }
                           found = true;
                        }
                     }
                     else
                     {
                        prop = eClass_FindProperty(_class, ident.string, privateModule);
                        if(prop)
                        {
                           found = true;
                           if(prop.memberAccess == publicAccess)
                           {
                              curMember = (DataMember)prop;
                              curClass = prop._class;
                           }
                        }
                        else
                        {
                           DataMember _subMemberStack[256];
                           int _subMemberStackPos = 0;

                           // FILL MEMBER STACK
                           dataMember = eClass_FindDataMemberAndOffset(_class, ident.string, &dataMemberOffset, privateModule, _subMemberStack, &_subMemberStackPos);

                           if(dataMember)
                           {
                              found = true;
                              if(dataMember.memberAccess == publicAccess)
                              {
                                 curMember = dataMember;
                                 curClass = dataMember._class;
                                 memcpy(subMemberStack, _subMemberStack, sizeof(int) * _subMemberStackPos);
                                 subMemberStackPos = _subMemberStackPos;
                              }
                           }
                        }
                     }

                     if(found && member.initializer && member.initializer.type == expInitializer)
                     {
                        Expression value = member.initializer.exp;
                        Type type = null;
                        if(prop)
                        {
                           type = prop.dataType;
                        }
                        else if(dataMember)
                        {
                           if(!dataMember.dataType)
                              dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
                           
                           type = dataMember.dataType;
                        }

                        if(ident && ident.next)
                        {
                           // for(; ident && type; ident = ident.next)
                           for(ident = ident.next; ident && type; ident = ident.next)
                           {
                              if(type.kind == classType)
                              {
                                 prop = eClass_FindProperty(type._class.registered,
                                    ident.string, privateModule);
                                 if(prop)
                                    type = prop.dataType;
                                 else
                                 {
                                    dataMember = eClass_FindDataMemberAndOffset(type._class.registered, 
                                       ident.string, &dataMemberOffset, privateModule, null, null);
                                    if(dataMember)
                                       type = dataMember.dataType;
                                 }
                              }
                              else if(type.kind == structType || type.kind == unionType)
                              {
                                 Type memberType;
                                 for(memberType = type.members.first; memberType; memberType = memberType.next)
                                 {
                                    if(!strcmp(memberType.name, ident.string))
                                    {
                                       type = memberType;
                                       break;
                                    }
                                 }
                              }
                           }
                        }
                        if(value)
                        {
                           FreeType(value.destType);
                           value.destType = type;
                           if(type) type.refCount++;
                           ComputeExpression(value);
                        }
                        if(value && (_class.type == structClass || _class.type == normalClass || _class.type == noHeadClass /*&& value.expType.kind == type.kind*/))
                        {
                           if(type.kind == classType)
                           {
                              Class _class = type._class.registered;
                              if(_class.type == bitClass || _class.type == unitClass ||
                                 _class.type == enumClass)
                              {
                                 if(!_class.dataType)
                                    _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                                 type = _class.dataType;
                              }
                           }

                           if(dataMember)
                           {
                              void * ptr = inst.data + dataMemberOffset;
                              
                              if(value.type == constantExp)
                              {
                                 switch(type.kind)
                                 {
                                    case intType:
                                    {
                                       GetInt(value, (int*)ptr);
                                       break;
                                    }
                                    case int64Type:
                                    {
                                       GetInt64(value, (int64*)ptr);
                                       break;
                                    }
                                    case intPtrType:
                                    {
                                       GetIntPtr(value, (intptr*)ptr);
                                       break;
                                    }
                                    case floatType:
                                    {
                                       GetFloat(value, (float*)ptr);
                                       break;
                                    }
                                    case doubleType:
                                    {
                                       GetDouble(value, (double *)ptr);
                                       break;
                                    }
                                 }
                              }
                              else if(value.type == instanceExp)
                              {
                                 if(type.kind == classType)
                                 {
                                    Class _class = type._class.registered;
                                    if(_class.type == structClass)
                                    {
                                       ComputeTypeSize(type);
                                       if(value.instance.data)
                                          memcpy(ptr, value.instance.data, type.size);
                                    }
                                 }
                              }
                           }
                           else if(prop)
                           {
                              if(value.type == instanceExp && value.instance.data)
                              {
                                 void (*Set)(void *, void *) = (void *)prop.Set;
                                 Set(inst.data, value.instance.data);
                                 PopulateInstance(inst);
                              }
                              else if(value.type == constantExp)
                              {
                                 switch(type.kind)
                                 {
                                    case doubleType:
                                    {
                                       void (*Set)(void *, double) = (void *)prop.Set;
                                       Set(inst.data, strtod(value.constant, null) );
                                       break;
                                    }
                                    case floatType:
                                    {
                                       void (*Set)(void *, float) = (void *)prop.Set;
                                       Set(inst.data, (float)(strtod(value.constant, null)));
                                       break;
                                    }
                                    case intType:
                                    {
                                       void (*Set)(void *, int) = (void *)prop.Set;
                                       Set(inst.data, strtol(value.constant, null, 0));
                                       break;
                                    }
                                    case int64Type:
                                    {
                                       void (*Set)(void *, int64) = (void *)prop.Set;
                                       Set(inst.data, _strtoi64(value.constant, null, 0));
                                       break;
                                    }
                                    case intPtrType:
                                    {
                                       void (*Set)(void *, intptr) = (void *)prop.Set;
                                       Set(inst.data, (intptr)_strtoi64(value.constant, null, 0));
                                       break;
                                    }
                                 }
                              }
                              else if(value.type == stringExp)
                              {
                                 char temp[1024];
                                 ReadString(temp, value.string);
                                 prop.Set(inst.data, temp);
                              }
                           }
                        }
                        else if(_class.type == unitClass)
                        {
                           if(prop)
                           {
                              // Only support converting units to units for now...
                              if(value.type == constantExp)
                              {
                                 if(type.kind == classType)
                                 {
                                    Class _class = type._class.registered;
                                    if(_class.type == unitClass)
                                    {
                                       if(!_class.dataType)
                                          _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                                       type = _class.dataType;
                                    }
                                 }
                                 // TODO: Assuming same base type for units...
                                 switch(type.kind)
                                 {
                                    case floatType:
                                    {
                                       float fValue;
                                       float (*Set)(float) = (void *)prop.Set;
                                       GetFloat(member.initializer.exp, &fValue);
                                       exp.constant = PrintFloat(Set(fValue));
                                       exp.type = constantExp;
                                       break;
                                    }
                                    case doubleType:
                                    {
                                       double dValue;
                                       double (*Set)(double) = (void *)prop.Set;
                                       GetDouble(member.initializer.exp, &dValue);
                                       exp.constant = PrintDouble(Set(dValue));
                                       exp.type = constantExp;
                                       break;
                                    }
                                 }
                              }
                           }
                        }
                        else if(_class.type == bitClass)
                        {
                           if(prop)
                           {
                              if(value.type == instanceExp && value.instance.data)
                              {
                                 unsigned int (*Set)(void *) = (void *)prop.Set;
                                 bits = Set(value.instance.data);
                              }
                              else if(value.type == constantExp)
                              {
                              }
                           }
                           else if(dataMember)
                           {
                              BitMember bitMember = (BitMember) dataMember;
                              Type type;
                              int part = 0;
                              GetInt(value, &part);
                              bits = (bits & ~bitMember.mask);
                              if(!bitMember.dataType)
                                 bitMember.dataType = ProcessTypeString(bitMember.dataTypeString, false);

                              type = bitMember.dataType;

                              if(type.kind == classType && type._class && type._class.registered)
                              {
                                 if(!type._class.registered.dataType)
                                    type._class.registered.dataType = ProcessTypeString(type._class.registered.dataTypeString, false);                                    
                                 type = type._class.registered.dataType;
                              }

                              switch(type.kind)
                              {
                                 case charType:
                                    if(type.isSigned)
                                       bits |= ((char)part << bitMember.pos);
                                    else
                                       bits |= ((unsigned char)part << bitMember.pos);
                                    break;
                                 case shortType:
                                    if(type.isSigned)
                                       bits |= ((short)part << bitMember.pos);
                                    else
                                       bits |= ((unsigned short)part << bitMember.pos);
                                    break;
                                 case intType:
                                 case longType:
                                    if(type.isSigned)
                                       bits |= ((int)part << bitMember.pos);
                                    else
                                       bits |= ((unsigned int)part << bitMember.pos);
                                    break;
                                 case int64Type:
                                    if(type.isSigned)
                                       bits |= ((int64)part << bitMember.pos);
                                    else
                                       bits |= ((uint64)part << bitMember.pos);
                                    break;
                                 case intPtrType:
                                    if(type.isSigned)
                                       bits |= ((intptr)part << bitMember.pos);
                                    else
                                       bits |= ((uintptr)part << bitMember.pos);
                                    break;
                              }
                           }
                        }
                     }
                     else
                     {
                        if(_class && _class.type == unitClass)
                        {
                           ComputeExpression(member.initializer.exp);
                           exp.constant = member.initializer.exp.constant;
                           exp.type = constantExp;
                           
                           member.initializer.exp.constant = null;
                        }
                     }
                  }
               }
               break;
            }
         }
      }
   }
   if(_class && _class.type == bitClass)
   {
      exp.constant = PrintHexUInt(bits);
      exp.type = constantExp;
   }
   if(exp.type != instanceExp)
   {
      FreeInstance(inst);
   }
}

void CallOperator(Expression exp, Expression exp1, Expression exp2, Operand op1, Operand op2)
{
   if(exp.op.op == SIZEOF)
   {
      FreeExpContents(exp);
      exp.type = constantExp;
      exp.constant = PrintUInt(ComputeTypeSize(op1.type));
   }
   else
   {
      if(!exp.op.exp1)
      {
         switch(exp.op.op)
         {
            // unary arithmetic
            case '+':
            {
               // Provide default unary +
               Expression exp2 = exp.op.exp2;
               exp.op.exp2 = null;
               FreeExpContents(exp);
               FreeType(exp.expType);
               FreeType(exp.destType);
               *exp = *exp2;
               delete exp2;
               break;
            }
            case '-':
               if(op1.ops.Neg) { FreeExpContents(exp); op1.ops.Neg(exp, op1); }
               break;
            // unary arithmetic increment and decrement
                  //OPERATOR_ALL(UNARY, ++, Inc)
                  //OPERATOR_ALL(UNARY, --, Dec)
            // unary bitwise
            case '~':
               if(op1.ops.BitNot) { FreeExpContents(exp); op1.ops.BitNot(exp, op1); }
               break;
            // unary logical negation
            case '!':
               if(op1.ops.Not) { FreeExpContents(exp); op1.ops.Not(exp, op1); }
               break;
         }
      }
      else
      {
         switch(exp.op.op)
         {
            // binary arithmetic
            case '+':
               if(op1.ops.Add) { FreeExpContents(exp); op1.ops.Add(exp, op1, op2); }
               break;
            case '-':
               if(op1.ops.Sub) { FreeExpContents(exp); op1.ops.Sub(exp, op1, op2); }
               break;
            case '*':
               if(op1.ops.Mul) { FreeExpContents(exp); op1.ops.Mul(exp, op1, op2); }
               break;
            case '/':
               if(op1.ops.Div) { FreeExpContents(exp); op1.ops.Div(exp, op1, op2); }
               break;
            case '%':
               if(op1.ops.Mod) { FreeExpContents(exp); op1.ops.Mod(exp, op1, op2); }
               break;
            // binary arithmetic assignment
                  //OPERATOR_ALL(BINARY, =, Asign)
                  //OPERATOR_ALL(BINARY, +=, AddAsign)
                  //OPERATOR_ALL(BINARY, -=, SubAsign)
                  //OPERATOR_ALL(BINARY, *=, MulAsign)
                  //OPERATOR_ALL(BINARY, /=, DivAsign)
                  //OPERATOR_ALL(BINARY, %=, ModAsign)
            // binary bitwise
            case '&':
               if(exp.op.exp2)
               {
                  if(op1.ops.BitAnd) { FreeExpContents(exp); op1.ops.BitAnd(exp, op1, op2); }
               }
               break;
            case '|':
               if(op1.ops.BitOr) { FreeExpContents(exp); op1.ops.BitOr(exp, op1, op2); }
               break;
            case '^':
               if(op1.ops.BitXor) { FreeExpContents(exp); op1.ops.BitXor(exp, op1, op2); }
               break;
            case LEFT_OP:
               if(op1.ops.LShift) { FreeExpContents(exp); op1.ops.LShift(exp, op1, op2); }
               break;
            case RIGHT_OP:
               if(op1.ops.RShift) { FreeExpContents(exp); op1.ops.RShift(exp, op1, op2); }
               break;
            // binary bitwise assignment
                  //OPERATOR_INTTYPES(BINARY, &=, AndAsign)
                  //OPERATOR_INTTYPES(BINARY, |=, OrAsign)
                  //OPERATOR_INTTYPES(BINARY, ^=, XorAsign)
                  //OPERATOR_INTTYPES(BINARY, <<=, LShiftAsign)
                  //OPERATOR_INTTYPES(BINARY, >>=, RShiftAsign)
            // binary logical equality
            case EQ_OP:
               if(op1.ops.Equ) { FreeExpContents(exp); op1.ops.Equ(exp, op1, op2); }
               break;
            case NE_OP:
               if(op1.ops.Nqu) { FreeExpContents(exp); op1.ops.Nqu(exp, op1, op2); }
               break;
            // binary logical
            case AND_OP:
               if(op1.ops.And) { FreeExpContents(exp); op1.ops.And(exp, op1, op2); }
               break;
            case OR_OP:
               if(op1.ops.Or) { FreeExpContents(exp); op1.ops.Or(exp, op1, op2); }
               break;
            // binary logical relational
            case '>':
               if(op1.ops.Grt) { FreeExpContents(exp); op1.ops.Grt(exp, op1, op2); }
               break;
            case '<':
               if(op1.ops.Sma) { FreeExpContents(exp); op1.ops.Sma(exp, op1, op2); }
               break;
            case GE_OP:
               if(op1.ops.GrtEqu) { FreeExpContents(exp); op1.ops.GrtEqu(exp, op1, op2); }
               break;
            case LE_OP:
               if(op1.ops.SmaEqu) { FreeExpContents(exp); op1.ops.SmaEqu(exp, op1, op2); }
               break;
         }
      }
   }
}

void ComputeExpression(Expression exp)
{
   char expString[10240];
   expString[0] = '\0';
#ifdef _DEBUG
   PrintExpression(exp, expString);
#endif

   switch(exp.type)
   {
      case instanceExp:
      {
         ComputeInstantiation(exp);
         break;
      }
      /*
      case constantExp:
         break;
      */
      case opExp:
      {
         Expression exp1, exp2 = null;
         Operand op1 { };
         Operand op2 { };

         // We don't care about operations with only exp2 (INC_OP, DEC_OP...)
         if(exp.op.exp2)
            ComputeExpression(exp.op.exp2);
         if(exp.op.exp1)
         {
            ComputeExpression(exp.op.exp1);
            exp1 = exp.op.exp1;
            exp2 = exp.op.exp2;
            op1 = GetOperand(exp1);
            if(op1.type) op1.type.refCount++;
            if(exp2)
            {
               op2 = GetOperand(exp2);
               if(op2.type) op2.type.refCount++;
            }
         }
         else 
         {
            exp1 = exp.op.exp2;
            op1 = GetOperand(exp1);
            if(op1.type) op1.type.refCount++;
         }

         CallOperator(exp, exp1, exp2, op1, op2);
         /*
         switch(exp.op.op)
         {
            // Unary operators
            case '&':
               // Also binary
               if(exp.op.exp1 && exp.op.exp2)
               {
                  // Binary And
                  if(op1.ops.BitAnd)
                  {
                     FreeExpContents(exp);
                     op1.ops.BitAnd(exp, op1, op2);
                  }
               }
               break;
            case '*':
               if(exp.op.exp1)
               {
                  if(op1.ops.Mul)
                  {
                     FreeExpContents(exp);
                     op1.ops.Mul(exp, op1, op2);
                  }
               }
               break;
            case '+':
               if(exp.op.exp1)
               {
                  if(op1.ops.Add)
                  {
                     FreeExpContents(exp);
                     op1.ops.Add(exp, op1, op2);
                  }
               }
               else
               {
                  // Provide default unary +
                  Expression exp2 = exp.op.exp2;
                  exp.op.exp2 = null;
                  FreeExpContents(exp);
                  FreeType(exp.expType);
                  FreeType(exp.destType);

                  *exp = *exp2;
                  delete exp2;
               }
               break;
            case '-':
               if(exp.op.exp1)
               {
                  if(op1.ops.Sub) 
                  {
                     FreeExpContents(exp);
                     op1.ops.Sub(exp, op1, op2);
                  }
               }
               else
               {
                  if(op1.ops.Neg) 
                  {
                     FreeExpContents(exp);
                     op1.ops.Neg(exp, op1);
                  }
               }
               break;
            case '~':
               if(op1.ops.BitNot)
               {
                  FreeExpContents(exp);
                  op1.ops.BitNot(exp, op1);
               }
               break;
            case '!':
               if(op1.ops.Not)
               {
                  FreeExpContents(exp);
                  op1.ops.Not(exp, op1);
               }
               break;
            // Binary only operators
            case '/':
               if(op1.ops.Div) 
               {
                  FreeExpContents(exp);
                  op1.ops.Div(exp, op1, op2);
               }
               break;
            case '%':
               if(op1.ops.Mod)
               {
                  FreeExpContents(exp);
                  op1.ops.Mod(exp, op1, op2);
               }
               break;
            case LEFT_OP:
               break;
            case RIGHT_OP:
               break;
            case '<':
               if(exp.op.exp1)
               {
                  if(op1.ops.Sma)
                  {
                     FreeExpContents(exp);
                     op1.ops.Sma(exp, op1, op2);
                  }
               }
               break;
            case '>':
               if(exp.op.exp1)
               {
                  if(op1.ops.Grt)
                  {
                     FreeExpContents(exp);
                     op1.ops.Grt(exp, op1, op2);
                  }
               }
               break;
            case LE_OP:
               if(exp.op.exp1)
               {
                  if(op1.ops.SmaEqu)
                  {
                     FreeExpContents(exp);
                     op1.ops.SmaEqu(exp, op1, op2);
                  }
               }
               break;
            case GE_OP:
               if(exp.op.exp1)
               {
                  if(op1.ops.GrtEqu)
                  {
                     FreeExpContents(exp);
                     op1.ops.GrtEqu(exp, op1, op2);
                  }
               }
               break;
            case EQ_OP:
               if(exp.op.exp1)
               {
                  if(op1.ops.Equ)
                  {
                     FreeExpContents(exp);
                     op1.ops.Equ(exp, op1, op2);
                  }
               }
               break;
            case NE_OP:
               if(exp.op.exp1)
               {
                  if(op1.ops.Nqu)
                  {
                     FreeExpContents(exp);
                     op1.ops.Nqu(exp, op1, op2);
                  }
               }
               break;
            case '|':
               if(op1.ops.BitOr) 
               {
                  FreeExpContents(exp);
                  op1.ops.BitOr(exp, op1, op2);
               }
               break;
            case '^':
               if(op1.ops.BitXor) 
               {
                  FreeExpContents(exp);
                  op1.ops.BitXor(exp, op1, op2);
               }
               break;
            case AND_OP:
               break;
            case OR_OP:
               break;
            case SIZEOF:
               FreeExpContents(exp);
               exp.type = constantExp;
               exp.constant = PrintUInt(ComputeTypeSize(op1.type));
               break;
         }
         */
         if(op1.type) FreeType(op1.type);
         if(op2.type) FreeType(op2.type);
         break;
      }
      case bracketsExp:
      case extensionExpressionExp:
      {
         Expression e, n;
         for(e = exp.list->first; e; e = n)
         {
            n = e.next;
            if(!n)
            {
               OldList * list = exp.list;
               ComputeExpression(e);
               //FreeExpContents(exp);
               FreeType(exp.expType);
               FreeType(exp.destType);
               *exp = *e;
               delete e;
               delete list;
            }
            else
            {
               FreeExpression(e);
            }
         }
         break;
      }
      /*

      case ExpIndex:
      {
         Expression e;
         exp.isConstant = true;

         ComputeExpression(exp.index.exp);
         if(!exp.index.exp.isConstant)
            exp.isConstant = false;

         for(e = exp.index.index->first; e; e = e.next)
         {
            ComputeExpression(e);
            if(!e.next)
            {
               // Check if this type is int
            }
            if(!e.isConstant)
               exp.isConstant = false;
         }
         exp.expType = Dereference(exp.index.exp.expType);
         break;
      }
      */
      case memberExp:
      {
         Expression memberExp = exp.member.exp;
         Identifier memberID = exp.member.member;

         Type type;
         ComputeExpression(exp.member.exp);
         type = exp.member.exp.expType;
         if(type)
         {
            Class _class = (exp.member.member && exp.member.member.classSym) ? exp.member.member.classSym.registered : (((type.kind == classType || type.kind == subClassType) && type._class) ? type._class.registered : null);
            Property prop = null;
            DataMember member = null;
            Class convertTo = null;
            if(type.kind == subClassType && exp.member.exp.type == classExp)
               _class = eSystem_FindClass(privateModule, "ecere::com::Class");

            if(!_class)
            {
               char string[256];
               Symbol classSym;
               string[0] = '\0';
               PrintType(type, string, false, true);
               classSym = FindClass(string);
               _class = classSym ? classSym.registered : null;
            }

            if(exp.member.member)
            {
               prop = eClass_FindProperty(_class, exp.member.member.string, privateModule);
               if(!prop)
                  member = eClass_FindDataMember(_class, exp.member.member.string, privateModule, null, null);
            }
            if(!prop && !member && _class && exp.member.member)
            {
               Symbol classSym = FindClass(exp.member.member.string);
               convertTo = _class;
               _class = classSym ? classSym.registered : null;
               prop = eClass_FindProperty(_class, convertTo.fullName, privateModule);
            }
      
            if(prop)
            {
               if(prop.compiled)
               {
                  Type type = prop.dataType;
                  // TODO: Assuming same base type for units...
                  if(_class.type == unitClass)
                  {
                     if(type.kind == classType)
                     {
                        Class _class = type._class.registered;
                        if(_class.type == unitClass)
                        {
                           if(!_class.dataType)
                              _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                           type = _class.dataType;
                        }
                     }
                     switch(type.kind)
                     {
                        case floatType:
                        {
                           float value;
                           float (*Get)(float) = (void *)prop.Get;
                           GetFloat(exp.member.exp, &value);
                           exp.constant = PrintFloat(Get ? Get(value) : value);
                           exp.type = constantExp;
                           break;
                        }
                        case doubleType:
                        {
                           double value;
                           double (*Get)(double);
                           GetDouble(exp.member.exp, &value);
                     
                           if(convertTo)
                              Get = (void *)prop.Set;
                           else
                              Get = (void *)prop.Get;
                           exp.constant = PrintDouble(Get ? Get(value) : value);
                           exp.type = constantExp;
                           break;
                        }
                     }
                  }
                  else
                  {
                     if(convertTo)
                     {
                        Expression value = exp.member.exp;
                        Type type;
                        if(!prop.dataType)
                           ProcessPropertyType(prop);

                        type = prop.dataType;
                        if(!type)
                        {
                            // printf("Investigate this\n");
                        }
                        else if(_class.type == structClass)
                        {
                           switch(type.kind)
                           {
                              case classType:
                              {
                                 Class propertyClass = type._class.registered;
                                 if(propertyClass.type == structClass && value.type == instanceExp)
                                 {
                                    void (*Set)(void *, void *) = (void *)prop.Set;
                                    exp.instance = Instantiation { };
                                    exp.instance.data = new0 byte[_class.structSize];
                                    exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                    exp.instance.loc = exp.loc;
                                    exp.type = instanceExp;
                                    Set(exp.instance.data, value.instance.data);
                                    PopulateInstance(exp.instance);
                                 }
                                 break;
                              }
                              case intType:
                              {
                                 int intValue;
                                 void (*Set)(void *, int) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;
                              
                                 GetInt(value, &intValue);

                                 Set(exp.instance.data, intValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case int64Type:
                              {
                                 int64 intValue;
                                 void (*Set)(void *, int64) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;
                              
                                 GetInt64(value, &intValue);

                                 Set(exp.instance.data, intValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case intPtrType:
                              {
                                 // TOFIX:
                                 intptr intValue;
                                 void (*Set)(void *, intptr) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;
                              
                                 GetIntPtr(value, &intValue);

                                 Set(exp.instance.data, intValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case doubleType:
                              {
                                 double doubleValue;
                                 void (*Set)(void *, double) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;
                              
                                 GetDouble(value, &doubleValue);

                                 Set(exp.instance.data, doubleValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                           }
                        }
                        else if(_class.type == bitClass)
                        {
                           switch(type.kind)
                           {
                              case classType:
                              {
                                 Class propertyClass = type._class.registered;
                                 if(propertyClass.type == structClass && value.instance.data)
                                 {
                                    unsigned int (*Set)(void *) = (void *)prop.Set;
                                    unsigned int bits = Set(value.instance.data);
                                    exp.constant = PrintHexUInt(bits);
                                    exp.type = constantExp;
                                    break;
                                 }
                                 else if(_class.type == bitClass)
                                 {
                                    unsigned int value;
                                    unsigned int (*Set)(unsigned int) = (void *)prop.Set;
                                    unsigned int bits;

                                    GetUInt(exp.member.exp, &value);
                                    bits = Set(value);
                                    exp.constant = PrintHexUInt(bits);
                                    exp.type = constantExp;
                                 }
                              }
                           }
                        }
                     }
                     else
                     {
                        if(_class.type == bitClass)
                        {
                           unsigned int value;
                           GetUInt(exp.member.exp, &value);

                           switch(type.kind)
                           {
                              case classType:
                              {
                                 Class _class = type._class.registered;
                                 if(_class.type == structClass)
                                 {
                                    void (*Get)(unsigned int, void *) = (void *)prop.Get;

                                    exp.instance = Instantiation { };
                                    exp.instance.data = new0 byte[_class.structSize];
                                    exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                    exp.instance.loc = exp.loc;
                                    //exp.instance.fullSet = true;
                                    exp.type = instanceExp;
                                    Get(value, exp.instance.data);
                                    PopulateInstance(exp.instance);
                                 }
                                 else if(_class.type == bitClass)
                                 {
                                    unsigned int (*Get)(unsigned int) = (void *)prop.Get;
                                    uint64 bits = Get(value);
                                    exp.constant = PrintHexUInt64(bits);
                                    exp.type = constantExp;
                                 }
                                 break;
                              }
                           }
                        }
                        else if(_class.type == structClass)
                        {
                           char * value = (exp.member.exp.type == instanceExp ) ? exp.member.exp.instance.data : null;
                           switch(type.kind)
                           {
                              case classType:
                              {
                                 Class _class = type._class.registered;
                                 if(_class.type == structClass && value)
                                 {
                                    void (*Get)(void *, void *) = (void *)prop.Get;

                                    exp.instance = Instantiation { };
                                    exp.instance.data = new0 byte[_class.structSize];
                                    exp.instance._class = MkSpecifierName/*MkClassName*/(_class.fullName);
                                    exp.instance.loc = exp.loc;
                                    //exp.instance.fullSet = true;
                                    exp.type = instanceExp;
                                    Get(value, exp.instance.data);
                                    PopulateInstance(exp.instance);
                                 }
                                 break;
                              }
                           }
                        }
                        /*else
                        {
                           char * value = exp.member.exp.instance.data;
                           switch(type.kind)
                           {
                              case classType:
                              {
                                 Class _class = type._class.registered;
                                 if(_class.type == normalClass)
                                 {
                                    void *(*Get)(void *) = (void *)prop.Get;

                                    exp.instance = Instantiation { };
                                    exp.instance._class = MkSpecifierName(_class.fullName); //MkClassName(_class.fullName);
                                    exp.type = instanceExp;
                                    exp.instance.data = Get(value, exp.instance.data);
                                 }
                                 break;
                              }
                           }
                        }
                        */
                     }
                  }
               }
               else
               {
                  exp.isConstant = false;
               }
            }
            else if(member)
            {
            }
         }

         if(exp.type != ExpressionType::memberExp)
         {
            FreeExpression(memberExp);
            FreeIdentifier(memberID);
         }
         break;
      }
      case typeSizeExp:
      {
         Type type = ProcessType(exp.typeName.qualifiers, exp.typeName.declarator);
         FreeExpContents(exp);
         exp.constant = PrintUInt(ComputeTypeSize(type));
         exp.type = constantExp;         
         FreeType(type);
         break;
      }
      case classSizeExp:
      {
         Symbol classSym = exp._class.symbol; // FindClass(exp._class.name);
         if(classSym && classSym.registered)
         {
            if(classSym.registered.fixed)
            {
               FreeSpecifier(exp._class);
               exp.constant = PrintUInt(classSym.registered.templateClass ? classSym.registered.templateClass.structSize : classSym.registered.structSize);
               exp.type = constantExp;
            }
            else
            {
               char className[1024];
               strcpy(className, "__ecereClass_");
               FullClassNameCat(className, classSym.string, true);
               MangleClassName(className);

               FreeExpContents(exp);
               exp.type = pointerExp;
               exp.member.exp = MkExpIdentifier(MkIdentifier(className));
               exp.member.member = MkIdentifier("structSize");
            }
         }
         break;
      }
      case castExp:
      //case constantExp:
      {
         Type type;
         Expression e = exp;
         if(exp.type == castExp)
         {
            if(exp.cast.exp)
               ComputeExpression(exp.cast.exp);
            e = exp.cast.exp;
         }
         if(e && exp.expType)
         {
            /*if(exp.destType)
               type = exp.destType;
            else*/
               type = exp.expType;
            if(type.kind == classType)
            {
               Class _class = type._class.registered;
               if(_class && (_class.type == unitClass || _class.type == bitClass))
               {
                  if(!_class.dataType)
                     _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                  type = _class.dataType;
               }
            }
            
            switch(type.kind)
            {
               case charType:
                  if(type.isSigned)
                  {
                     char value;
                     GetChar(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintChar(value);
                     exp.type = constantExp;
                  }
                  else
                  {
                     unsigned char value;
                     GetUChar(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintUChar(value);
                     exp.type = constantExp;
                  }
                  break;
               case shortType:
                  if(type.isSigned)
                  {
                     short value;
                     GetShort(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintShort(value);
                     exp.type = constantExp;
                  }
                  else
                  {
                     unsigned short value;
                     GetUShort(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintUShort(value);
                     exp.type = constantExp;
                  }
                  break;
               case intType:
                  if(type.isSigned)
                  {
                     int value;
                     GetInt(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintInt(value);
                     exp.type = constantExp;
                  }
                  else
                  {
                     unsigned int value;
                     GetUInt(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintUInt(value);
                     exp.type = constantExp;
                  }
                  break;
               case int64Type:
                  if(type.isSigned)
                  {
                     int64 value;
                     GetInt64(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintInt64(value);
                     exp.type = constantExp;
                  }
                  else
                  {
                     uint64 value;
                     GetUInt64(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintUInt64(value);
                     exp.type = constantExp;
                  }
                  break;
               case intPtrType:
                  if(type.isSigned)
                  {
                     intptr value;
                     GetIntPtr(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintInt64((int64)value);
                     exp.type = constantExp;
                  }
                  else
                  {
                     uintptr value;
                     GetUIntPtr(e, &value);
                     FreeExpContents(exp);
                     exp.constant = PrintUInt64((uint64)value);
                     exp.type = constantExp;
                  }
                  break;
               case floatType:
               {
                  float value;
                  GetFloat(e, &value);
                  FreeExpContents(exp);
                  exp.constant = PrintFloat(value);
                  exp.type = constantExp;
                  break;
               }
               case doubleType:
               {  
                  double value;
                  GetDouble(e, &value);
                  FreeExpContents(exp);
                  exp.constant = PrintDouble(value);
                  exp.type = constantExp;
                  break;
               }
            }
         }
         break;
      }
      case conditionExp:
      {
         Operand op1 { };
         Operand op2 { };
         Operand op3 { };

         if(exp.cond.exp)
            // Caring only about last expression for now...
            ComputeExpression(exp.cond.exp->last);
         if(exp.cond.elseExp)
            ComputeExpression(exp.cond.elseExp);
         if(exp.cond.cond)
            ComputeExpression(exp.cond.cond);

         op1 = GetOperand(exp.cond.cond);
         if(op1.type) op1.type.refCount++;
         op2 = GetOperand(exp.cond.exp->last);
         if(op2.type) op2.type.refCount++;
         op3 = GetOperand(exp.cond.elseExp);
         if(op3.type) op3.type.refCount++;

         if(op1.ops.Cond) { FreeExpContents(exp); op1.ops.Cond(exp, op1, op2, op3); }
         if(op1.type) FreeType(op1.type);
         if(op2.type) FreeType(op2.type);
         if(op3.type) FreeType(op3.type);
         break;
      }  
   }
}

static bool CheckExpressionType(Expression exp, Type destType, bool skipUnitBla)
{
   bool result = true;
   if(destType)
   {
      OldList converts { };
      Conversion convert;

      if(destType.kind == voidType)
         return false;

      if(!MatchTypeExpression(exp, destType, &converts, skipUnitBla))
         result = false;
      if(converts.count)
      {
         // for(convert = converts.last; convert; convert = convert.prev)
         for(convert = converts.first; convert; convert = convert.next)
         {
            bool empty = !(convert.isGet ? (void *)convert.convert.Get : (void *)convert.convert.Set);
            if(!empty)
            {
               Expression newExp { };
               ClassObjectType objectType = exp.expType ? exp.expType.classObjectType : none;

               // TODO: Check this...
               *newExp = *exp;
               newExp.destType = null;

               if(convert.isGet)
               {
                  // [exp].ColorRGB
                  exp.type = memberExp;
                  exp.addedThis = true;
                  exp.member.exp = newExp;
                  FreeType(exp.member.exp.expType);

                  exp.member.exp.expType = MkClassType(convert.convert._class.fullName);
                  exp.member.exp.expType.classObjectType = objectType;
                  exp.member.member = MkIdentifier(convert.convert.dataTypeString);
                  exp.member.memberType = propertyMember;
                  exp.expType = convert.resultType ? convert.resultType : convert.convert.dataType;
                  // TESTING THIS... for (int)degrees
                  exp.needCast = true;
                  if(exp.expType) exp.expType.refCount++;
                  ApplyAnyObjectLogic(exp.member.exp);
               }
               else
               {
               
                  /*if(exp.isConstant)
                  {
                     // Color { ColorRGB = [exp] };
                     exp.type = instanceExp;
                     exp.instance = MkInstantiation(MkSpecifierName((convert.convert._class.fullName), //MkClassName(convert.convert._class.fullName),
                        null, MkListOne(MkMembersInitList(MkListOne(MkMemberInit(
                        MkListOne(MkIdentifier(convert.convert.dataTypeString)), newExp)))));
                  }
                  else*/
                  {
                     // If not constant, don't turn it yet into an instantiation
                     // (Go through the deep members system first)
                     exp.type = memberExp;
                     exp.addedThis = true;
                     exp.member.exp = newExp;

                     // ADDED THIS HERE TO SOLVE PROPERTY ISSUES WITH NOHEAD CLASSES
                     if(/*!notByReference && */newExp.expType && newExp.expType.kind == classType && newExp.expType._class && newExp.expType._class.registered &&
                        newExp.expType._class.registered.type == noHeadClass)
                     {
                        newExp.byReference = true;
                     }

                     FreeType(exp.member.exp.expType);
                     /*exp.member.exp.expType = convert.convert.dataType;
                     if(convert.convert.dataType) convert.convert.dataType.refCount++;*/
                     exp.member.exp.expType = null;
                     if(convert.convert.dataType)
                     {
                        exp.member.exp.expType = { };
                        CopyTypeInto(exp.member.exp.expType, convert.convert.dataType);
                        exp.member.exp.expType.refCount = 1;
                        exp.member.exp.expType.classObjectType = objectType;
                        ApplyAnyObjectLogic(exp.member.exp);
                     }

                     exp.member.member = MkIdentifier(convert.convert._class.fullName);
                     exp.member.memberType = reverseConversionMember;
                     exp.expType = convert.resultType ? convert.resultType :
                        MkClassType(convert.convert._class.fullName);
                     exp.needCast = true;
                     if(convert.resultType) convert.resultType.refCount++;
                  }
               }
            }
            else
            {
               FreeType(exp.expType);
               if(convert.isGet)
               {
                  exp.expType = convert.resultType ? convert.resultType : convert.convert.dataType;
                  exp.needCast = true;
                  if(exp.expType) exp.expType.refCount++;
               }
               else
               {
                  exp.expType = convert.resultType ? convert.resultType : MkClassType(convert.convert._class.fullName);
                  exp.needCast = true;
                  if(convert.resultType)
                     convert.resultType.refCount++;
               }
            }
         }
         if(exp.isConstant && inCompiler)
            ComputeExpression(exp);

         converts.Free(FreeConvert);
      }

      if(!result && exp.expType && converts.count)      // TO TEST: Added converts.count here to avoid a double warning with function type
      {
         result = MatchTypes(exp.expType, exp.destType, null, null, null, true, true, false, false);
      }
      if(!result && exp.expType && exp.destType)
      {
         if((exp.destType.kind == classType && exp.expType.kind == pointerType && 
             exp.expType.type.kind == classType && exp.expType.type._class == exp.destType._class && exp.destType._class.registered && exp.destType._class.registered.type == structClass) ||
            (exp.expType.kind == classType && exp.destType.kind == pointerType && 
            exp.destType.type.kind == classType && exp.destType.type._class == exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass))
            result = true;
      }
   }
   // if(result) CheckTemplateTypes(exp);
   return result;
}

void CheckTemplateTypes(Expression exp)
{
   if(exp.destType && exp.destType.passAsTemplate && exp.expType && exp.expType.kind != templateType && !exp.expType.passAsTemplate)
   {
      Expression newExp { };
      Statement compound;
      Context context;
      *newExp = *exp;
      if(exp.destType) exp.destType.refCount++;
      if(exp.expType)  exp.expType.refCount++;
      newExp.prev = null;
      newExp.next = null;

      switch(exp.expType.kind)
      {
         case doubleType:
            if(exp.destType.classObjectType)
            {
               // We need to pass the address, just pass it along (Undo what was done above)
               if(exp.destType) exp.destType.refCount--;
               if(exp.expType)  exp.expType.refCount--;
               delete newExp;
            }
            else
            {
               // If we're looking for value:
               // ({ union { double d; uint64 i; } u; u.i = [newExp]; u.d; })
               OldList * specs;
               OldList * unionDefs = MkList();
               OldList * statements = MkList();
               context = PushContext();
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(DOUBLE)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("d"))), null))); 
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), null)));
               specs = MkListOne(MkStructOrUnion(unionSpecifier, null, unionDefs ));
               exp.type = extensionCompoundExp;
               exp.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), null)))),statements);
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         default:
            exp.type = castExp;
            exp.cast.typeName = MkTypeName(MkListOne(MkSpecifierName("uint64")), null);
            exp.cast.exp = MkExpBrackets(MkListOne(newExp));
            break;
      }
   }
   else if(exp.expType && exp.expType.passAsTemplate && exp.destType && exp.usage.usageGet && exp.destType.kind != templateType && !exp.destType.passAsTemplate)
   {
      Expression newExp { };
      Statement compound;
      Context context;
      *newExp = *exp;
      if(exp.destType) exp.destType.refCount++;
      if(exp.expType)  exp.expType.refCount++;
      newExp.prev = null;
      newExp.next = null;

      switch(exp.expType.kind)
      {
         case doubleType:
            if(exp.destType.classObjectType)
            {
               // We need to pass the address, just pass it along (Undo what was done above)
               if(exp.destType) exp.destType.refCount--;
               if(exp.expType)  exp.expType.refCount--;
               delete newExp;
            }
            else
            {
               // If we're looking for value:
               // ({ union { double d; uint64 i; } u; u.i = [newExp]; u.d; })
               OldList * specs;
               OldList * unionDefs = MkList();
               OldList * statements = MkList();
               context = PushContext();
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(DOUBLE)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("d"))), null))); 
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), null)));
               specs = MkListOne(MkStructOrUnion(unionSpecifier, null, unionDefs ));
               exp.type = extensionCompoundExp;
               exp.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), null)))),statements);
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         case classType:
         {
            if(exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass)
            {
               exp.type = bracketsExp;
               exp.list = MkListOne(MkExpOp(null, '*', MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp.expType._class.string)),
                  MkDeclaratorPointer(MkPointer(null, null), null)), newExp)));
               ProcessExpressionType(exp.list->first);
               break;
            }
            else
            {
               exp.type = bracketsExp;
               exp.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp.expType._class.string)), null), newExp));
               newExp.needCast = true;
               ProcessExpressionType(exp.list->first);
               break;
            }
         }
         default:
         {
            if(exp.expType.kind == templateType)
            {
               Type type = ProcessTemplateParameterType(exp.expType.templateParameter);
               if(type)
               {
                  FreeType(exp.destType);
                  FreeType(exp.expType);
                  delete newExp;
                  break;
               }
            }
            if(newExp.type == memberExp && newExp.member.memberType == dataMember)
            {
               exp.type = opExp;
               exp.op.op = '*';
               exp.op.exp1 = null;
               exp.op.exp2 = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer(null, null), null)),
                  MkExpBrackets(MkListOne(MkExpOp(null, '&', newExp))));
            }
            else
            {
               char typeString[1024];
               Declarator decl;
               OldList * specs = MkList();
               typeString[0] = '\0';
               PrintType(exp.expType, typeString, false, false);
               decl = SpecDeclFromString(typeString, specs, null);
               
               exp.type = castExp;
               //exp.cast.typeName = MkTypeName(MkListOne(MkSpecifierName("uint64")), null);
               exp.cast.typeName = MkTypeName(specs, decl);
               exp.cast.exp = MkExpBrackets(MkListOne(newExp));
               exp.cast.exp.needCast = true;
            }
            break;
         }
      }
   }
}
// TODO: The Symbol tree should be reorganized by namespaces
// Name Space:
//    - Tree of all symbols within (stored without namespace)
//    - Tree of sub-namespaces

static Symbol ScanWithNameSpace(BinaryTree tree, char * nameSpace, char * name)
{
   int nsLen = strlen(nameSpace);
   Symbol symbol;
   // Start at the name space prefix
   for(symbol = (Symbol)tree.FindPrefix(nameSpace); symbol; symbol = (Symbol)((BTNode)symbol).next)
   {
      char * s = symbol.string;
      if(!strncmp(s, nameSpace, nsLen))
      {
         // This supports e.g. matching ecere::Socket to ecere::net::Socket
         int c;
         char * namePart;
         for(c = strlen(s)-1; c >= 0; c--)
            if(s[c] == ':')
               break;

         namePart = s+c+1;
         if(!strcmp(namePart, name))
         {
            // TODO: Error on ambiguity
            return symbol;
         }
      }
      else
         break;
   }
   return null;
}

static Symbol FindWithNameSpace(BinaryTree tree, char * name)
{
   int c;
   char nameSpace[1024];
   char * namePart;
   bool gotColon = false;

   nameSpace[0] = '\0';
   for(c = strlen(name)-1; c >= 0; c--)
      if(name[c] == ':')
      {
         gotColon = true;
         break;
      }

   namePart = name+c+1;
   while(c >= 0 && name[c] == ':') c--;
   if(c >= 0)
   {
      // Try an exact match first
      Symbol symbol = (Symbol)tree.FindString(name);
      if(symbol)
         return symbol;

      // Namespace specified
      memcpy(nameSpace, name, c + 1);
      nameSpace[c+1] = 0;

      return ScanWithNameSpace(tree, nameSpace, namePart);
   }
   else if(gotColon)
   {
      // Looking for a global symbol, e.g. ::Sleep()
      Symbol symbol = (Symbol)tree.FindString(namePart);
      return symbol;
   }
   else
   {
      // Name only (no namespace specified)
      Symbol symbol = (Symbol)tree.FindString(namePart);
      if(symbol)
         return symbol;
      return ScanWithNameSpace(tree, "", namePart);
   }
   return null;
}

static void ProcessDeclaration(Declaration decl);

/*static */Symbol FindSymbol(char * name, Context startContext, Context endContext, bool isStruct, bool globalNameSpace)
{
#ifdef _DEBUG
   //Time startTime = GetTime();
#endif
   // Optimize this later? Do this before/less?
   Context ctx;
   Symbol symbol = null;
   // First, check if the identifier is declared inside the function
   //for(ctx = curContext; ctx /*!= topContext.parent */&& !symbol; ctx = ctx.parent)

   for(ctx = startContext; ctx /*!= topContext.parent */&& !symbol; ctx = ctx.parent)
   {
      if(ctx == globalContext && !globalNameSpace && ctx.hasNameSpace)
      {
         symbol = null;
         if(thisNameSpace)
         {
            char curName[1024];
            strcpy(curName, thisNameSpace);
            strcat(curName, "::");
            strcat(curName, name);
            // Try to resolve in current namespace first
            symbol = FindWithNameSpace(isStruct ? ctx.structSymbols : ctx.symbols, curName);
         }
         if(!symbol)
            symbol = FindWithNameSpace(isStruct ? ctx.structSymbols : ctx.symbols, name);
      }
      else
         symbol = (Symbol)(isStruct ? ctx.structSymbols : ctx.symbols).FindString(name);

      if(symbol || ctx == endContext) break;
   }
   if(inCompiler && curExternal && symbol && ctx == globalContext && curExternal.symbol && symbol.id > curExternal.symbol.idCode && symbol.pointerExternal)
   {
      if(symbol.pointerExternal.type == functionExternal)
      {
         FunctionDefinition function = symbol.pointerExternal.function;

         // Modified this recently...
         Context tmpContext = curContext;
         curContext = null;         
         symbol.pointerExternal = MkExternalDeclaration(MkDeclaration(CopyList(function.specifiers, CopySpecifier), MkListOne(MkInitDeclarator(CopyDeclarator(function.declarator), null))));
         curContext = tmpContext;

         symbol.pointerExternal.symbol = symbol;

         // TESTING THIS:
         DeclareType(symbol.type, true, true);

         ast->Insert(curExternal.prev, symbol.pointerExternal);

         symbol.id = curExternal.symbol.idCode;

      }
      else if(symbol.pointerExternal.type == declarationExternal && curExternal.symbol.idCode < symbol.pointerExternal.symbol.id) // Added id comparison because Global Function prototypes were broken
      {
         ast->Move(symbol.pointerExternal, curExternal.prev);
         symbol.id = curExternal.symbol.idCode;
      }
   }
#ifdef _DEBUG
   //findSymbolTotalTime += GetTime() - startTime;
#endif
   return symbol;
}

static void GetTypeSpecs(Type type, OldList * specs)
{
   if(!type.isSigned && type.kind != intPtrType) ListAdd(specs, MkSpecifier(UNSIGNED));
   switch(type.kind)
   {
      case classType: 
      {
         if(type._class.registered)
         {
            if(!type._class.registered.dataType)
               type._class.registered.dataType = ProcessTypeString(type._class.registered.dataTypeString, false);
            GetTypeSpecs(type._class.registered.dataType, specs);
         }
         break;
      }
      case doubleType: ListAdd(specs, MkSpecifier(DOUBLE)); break;
      case floatType: ListAdd(specs, MkSpecifier(FLOAT)); break;
      case charType: ListAdd(specs, MkSpecifier(CHAR)); break;
      case shortType: ListAdd(specs, MkSpecifier(SHORT)); break;
      case int64Type: ListAdd(specs, MkSpecifier(INT64)); break;
      case intPtrType: ListAdd(specs, MkSpecifierName(type.isSigned ? "intptr" : "uintptr")); break;
      case intType: 
      default:
         ListAdd(specs, MkSpecifier(INT)); break;
   }
}

// WARNING : This function expects a null terminated string since it recursively concatenate...
static void _PrintType(Type type, char * string, bool printName, bool printFunction, bool fullName)
{
   if(type)
   {
      switch(type.kind)
      {
         case classType:
            if(type._class && type._class.string)
            {
               // TODO: typed_object does not fully qualify the type, as it may have taken up an actual class (Stored in _class) from overriding
               //       look into merging with thisclass ?
               if(type.classObjectType == typedObject)
                  strcat(string, "typed_object");
               else if(fullName)
                  strcat(string, type._class.string);
               else
               {
                  if(type._class.registered)
                     strcat(string, type._class.registered.name);
                  else
                     strcat(string, type._class.string);                     
               }
            }
            break;
         case pointerType:
         {
            /*Type funcType;
            for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
            if(funcType && funcType.kind == functionType)
            {
               Type param;
               PrintType(funcType.returnType, string, false, fullName);
               strcat(string, "(*");
               if(printName || funcType.thisClass)
               {
                  strcat(string, " ");
                  if(funcType.thisClass)
                  {
                     strcat(string, funcType.thisClass.string);
                     strcat(string, "::");
                  }
                  if(type.name)
                     strcat(string, type.name);
               }
               strcat(string, ")(");
               for(param = funcType.params.first; param; param = param.next)
               {
                  PrintType(param, string, false, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");               
            }
            else*/
            {
               _PrintType(type.type, string, false /*printName*/, printFunction, fullName);
               strcat(string, " *");
            }
            break;
         }
         case voidType: strcat(string, "void"); break;
         case intType:  strcat(string, type.isSigned ? "int" : "uint"); break;
         case int64Type:  strcat(string, type.isSigned ? "int64" : "uint64"); break;
         case intPtrType:  strcat(string, type.isSigned ? "intptr" : "uintptr"); break;
         case charType: strcat(string, type.isSigned ? "char" : "byte"); break;
         case shortType: strcat(string, type.isSigned ? "short" : "uint16"); break;
         case floatType: strcat(string, "float"); break;
         case doubleType: strcat(string, "double"); break;
         case structType:
            if(type.enumName)
            {
               strcat(string, "struct ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
            {
               /*
               strcat(string, "struct ");
               strcat(string,"(unnamed)");
               */
               Type member;
               strcat(string, "struct {");
               for(member = type.members.first; member; member = member.next)
               {
                  PrintType(member, string, true, fullName);
                  strcat(string,"; ");
               }
               strcat(string,"}");
            }
            break;
         case unionType:
            if(type.enumName)
            {
               strcat(string, "union ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
            {
               strcat(string, "union ");
               strcat(string,"(unnamed)");
            }
            break;
         case enumType:
            if(type.enumName)
            {
               strcat(string, "enum ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
               strcat(string, "enum");
            break;
         case functionType:
         {
            if(printFunction)
            {
               if(type.dllExport)
                  strcat(string, "dllexport ");
               PrintType(type.returnType, string, false, fullName);
               strcat(string, " ");
            }
            
            // DANGER: Testing This
            if(printName)
            {
               if(type.name)
               {
                  if(fullName)
                     strcat(string, type.name);
                  else
                  {
                     char * name = RSearchString(type.name, "::", strlen(type.name), true, false);
                     if(name) name += 2; else name = type.name;
                     strcat(string, name);
                  }
               }
#ifdef _DEBUG
               else
               {
                  printf("");
               }
#endif
            }

            if(printFunction)
            {
               Type param;
               strcat(string, "(");
               for(param = type.params.first; param; param = param.next)
               {
                  PrintType(param, string, true, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");
            }
            break;
         }
         case arrayType:
         {
            /*Type funcType;
            for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
            if(funcType && funcType.kind == functionType)
            {
               Type param;
               PrintType(funcType.returnType, string, false, fullName);
               strcat(string, "(*");
               if(printName || funcType.thisClass)
               {
                  strcat(string, " ");
                  if(funcType.thisClass)
                  {
                     strcat(string, funcType.thisClass.string);
                     strcat(string, "::");
                  }
                  if(type.name)
                     strcat(string, type.name);
               }
               strcat(string, ")(");
               for(param = funcType.params.first; param; param = param.next)
               {
                  PrintType(param, string, false, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");               
            }
            else*/
            {
               char baseType[1024], size[256];
               Type arrayType = type;
               baseType[0] = '\0';
               size[0] = '\0';

               while(arrayType.kind == TypeKind::arrayType)
               {
                  strcat(size, "[");
                  if(arrayType.enumClass)
                     strcat(size, arrayType.enumClass.string);
                  else if(arrayType.arraySizeExp)
                     PrintExpression(arrayType.arraySizeExp, size);
                  //sprintf(string, "%s[%s]", baseType, size); 
                  strcat(size, "]");

                  arrayType = arrayType.arrayType;
               }
               _PrintType(arrayType, baseType, printName, printFunction, fullName);
               strcat(string, baseType);
               strcat(string, size);
            }

            /*
               PrintType(type.arrayType, baseType, printName, fullName);
               if(type.enumClass)
                  strcpy(size, type.enumClass.string);
               else if(type.arraySizeExp)
                  PrintExpression(type.arraySizeExp, size);
               //sprintf(string, "%s[%s]", baseType, size); 
               strcat(string, baseType);
               strcat(string, "[");
               strcat(string, size); 
               strcat(string, "]");
               */

            printName = false;
            break;
         }
         case ellipsisType:
            strcat(string, "...");
            break;
         case methodType:
            _PrintType(type.method.dataType, string, false, printFunction, fullName);
            break;
         case subClassType:
            strcat(string, "subclass(");
            strcat(string, type._class ? type._class.string : "int");
            strcat(string, ")");                  
            break;
         case templateType:
            strcat(string, type.templateParameter.identifier.string);
            break;
         case thisClassType:
            strcat(string, "thisclass");
            break;
         case vaListType:
         strcat(string, "__builtin_va_list");
            break;
#ifdef _DEBUG
         default:
            printf("");
#endif
      }
      if(type.name && printName && type.kind != functionType && (type.kind != pointerType || type.type.kind != functionType))
      {
         strcat(string, " ");
         strcat(string, type.name);
      }
   }
}

// *****
// TODO: Add a max buffer size to avoid overflows. This function is used with static size char arrays.
// *****
void PrintType(Type type, char * string, bool printName, bool fullName)
{
   Type funcType;
   for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
   if(funcType && funcType.kind == functionType && type != funcType)
   {
      char typeString[1024];
      Type param;

      PrintType(funcType.returnType, string, false, fullName);
      strcat(string, "(");
      _PrintType(type, string, printName, false, fullName);
      strcat(string, ")");
      /*
      if(type.name)
         strcat(string, type.name);
      else
      {
         printf("");
      }
      */
      strcat(string, "(");
      for(param = funcType.params.first; param; param = param.next)
      {
         PrintType(param, string, true, fullName);
         if(param.next) strcat(string, ", ");
      }
      strcat(string, ")");
   }
   else
      _PrintType(type, string, printName, true, fullName);
   if(type.bitFieldCount)
   {
      char count[100];
      sprintf(count, ":%d", type.bitFieldCount);
      strcat(string, count);
   }
}

static Type FindMember(Type type, char * string)
{
   Type memberType;
   for(memberType = type.members.first; memberType; memberType = memberType.next)
   {
      if(!memberType.name)
      {
         Type subType = FindMember(memberType, string);
         if(subType)
            return subType;
      }
      else if(!strcmp(memberType.name, string))
         return memberType;
   }
   return null;
}

Type FindMemberAndOffset(Type type, char * string, uint * offset)
{
   Type memberType;
   for(memberType = type.members.first; memberType; memberType = memberType.next)
   {
      if(!memberType.name)
      {
         Type subType = FindMember(memberType, string);
         if(subType)
         {
            *offset += memberType.offset;
            return subType;
         }
      }
      else if(!strcmp(memberType.name, string))
      {
         *offset += memberType.offset;
         return memberType;
      }
   }
   return null;
}

Expression ParseExpressionString(char * expression)
{
   fileInput = TempFile { };
   fileInput.Write(expression, 1, strlen(expression));
   fileInput.Seek(0, start);

   echoOn = false;
   parsedExpression = null;
   resetScanner();
   expression_yyparse();
   delete fileInput;

   return parsedExpression;
}

static bool ResolveIdWithClass(Expression exp, Class _class, bool skipIDClassCheck)
{
   Identifier id = exp.identifier;
   Method method = null;
   Property prop = null;
   DataMember member = null;
   ClassProperty classProp = null;

   if(_class && _class.type == enumClass)
   {
      NamedLink value = null;
      Class enumClass = eSystem_FindClass(privateModule, "enum");
      if(enumClass)
      {
         Class baseClass;
         for(baseClass = _class; baseClass && baseClass.type == ClassType::enumClass; baseClass = baseClass.base)
         {
            EnumClassData e = ACCESS_CLASSDATA(baseClass, enumClass);
            for(value = e.values.first; value; value = value.next)
            {
               if(!strcmp(value.name, id.string))
                  break;
            }
            if(value)
            {
               char constant[256];

               FreeExpContents(exp);

               exp.type = constantExp;
               exp.isConstant = true;
               if(!strcmp(baseClass.dataTypeString, "int"))
                  sprintf(constant, "%d",value.data);
               else
                  sprintf(constant, "0x%X",value.data);
               exp.constant = CopyString(constant);
               //for(;_class.base && _class.base.type != systemClass; _class = _class.base);
               exp.expType = MkClassType(baseClass.fullName);
               break;
            }
         }
      }
      if(value)
         return true;
   }
   if((method = eClass_FindMethod(_class, id.string, privateModule)))
   {
      ProcessMethodType(method);
      exp.expType = Type
      {
         refCount = 1;
         kind = methodType;
         method = method;
         // Crash here?
         // TOCHECK: Put it back to what it was...
         // methodClass = _class;
         methodClass = (skipIDClassCheck || (id && id._class)) ? _class : null;
      };
      //id._class = null;
      return true;
   }
   else if((prop = eClass_FindProperty(_class, id.string, privateModule)))
   {
      if(!prop.dataType)
         ProcessPropertyType(prop);
      exp.expType = prop.dataType;
      if(prop.dataType) prop.dataType.refCount++;
      return true;
   }
   else if((member = eClass_FindDataMember(_class, id.string, privateModule, null, null)))
   {
      if(!member.dataType)
         member.dataType = ProcessTypeString(member.dataTypeString, false);
      exp.expType = member.dataType;
      if(member.dataType) member.dataType.refCount++;
      return true;
   }
   else if((classProp = eClass_FindClassProperty(_class, id.string)))
   {
      if(!classProp.dataType)
         classProp.dataType = ProcessTypeString(classProp.dataTypeString, false);

      if(classProp.constant)
      {
         FreeExpContents(exp);

         exp.isConstant = true;
         if(classProp.dataType.kind == pointerType && classProp.dataType.type.kind == charType)
         {
            //char constant[256];
            exp.type = stringExp;
            exp.constant = QMkString((char *)classProp.Get(_class));
         }
         else
         {
            char constant[256];
            exp.type = constantExp;
            sprintf(constant, "%d",classProp.Get(_class));
            exp.constant = CopyString(constant);
         }
      }
      else
      {
         // TO IMPLEMENT...
      }

      exp.expType = classProp.dataType;
      if(classProp.dataType) classProp.dataType.refCount++;
      return true;
   }
   return false;
}

static GlobalData ScanGlobalData(NameSpace nameSpace, char * name)
{
   BinaryTree * tree = &nameSpace.functions;
   GlobalData data = (GlobalData)tree->FindString(name);
   NameSpace * child;
   if(!data)
   {
      for(child = (NameSpace *)nameSpace.nameSpaces.first; child; child = (NameSpace *)((BTNode)child).next)
      {
         data = ScanGlobalData(child, name);
         if(data)
            break;
      }
   }
   return data;
}

static GlobalData FindGlobalData(char * name)
{
   int start = 0, c;
   NameSpace * nameSpace;
   nameSpace = globalData;
   for(c = 0; name[c]; c++)
   {
      if(name[c] == '.' || (name[c] == ':' && name[c+1] == ':'))
      {
         NameSpace * newSpace;
         char * spaceName = new char[c - start + 1];
         strncpy(spaceName, name + start, c - start);
         spaceName[c-start] = '\0';
         newSpace = (NameSpace *)nameSpace->nameSpaces.FindString(spaceName);
         delete spaceName;
         if(!newSpace)
            return null;
         nameSpace = newSpace;
         if(name[c] == ':') c++;
         start = c+1;
      }
   }
   if(c - start)
   {
      return ScanGlobalData(nameSpace, name + start);
   }
   return null;
}

static int definedExpStackPos;
static void * definedExpStack[512];

// This function makes checkedExp equivalent to newExp, ending up freeing newExp
void ReplaceExpContents(Expression checkedExp, Expression newExp)
{
   Expression prev = checkedExp.prev, next = checkedExp.next;

   FreeExpContents(checkedExp);
   FreeType(checkedExp.expType);
   FreeType(checkedExp.destType);

   *checkedExp = *newExp;

   delete newExp;

   checkedExp.prev = prev;
   checkedExp.next = next;
}

void ApplyAnyObjectLogic(Expression e)
{
   Type destType = /*(e.destType && e.destType.kind == ellipsisType) ? ellipsisDestType : */e.destType;
   if(destType && (/*destType.classObjectType == ClassObjectType::typedObject || */destType.classObjectType == anyObject))
   {
      //if(e.destType && e.destType.kind == ellipsisType) usedEllipsis = true;
      //ellipsisDestType = destType;
      if(e && e.expType)
      {
         Type type = e.expType;
         Class _class = null;
         //Type destType = e.destType;

         if(type.kind == classType && type._class && type._class.registered)
         {
            _class = type._class.registered;
         }
         else if(type.kind == subClassType)
         {
            _class = FindClass("ecere::com::Class").registered;
         }
         else
         {
            char string[1024] = "";
            Symbol classSym;

            PrintType(type, string, false, true);
            classSym = FindClass(string);
            if(classSym) _class = classSym.registered;
         }

         if((_class && (_class.type == enumClass || _class.type == unitClass || _class.type == bitClass || _class.type == systemClass) && strcmp(_class.fullName, "class") && strcmp(_class.fullName, "ecere::com::Class")) || // Patched so that class isn't considered SYSTEM...
            (!e.expType.classObjectType && (((type.kind != pointerType && type.kind != subClassType && (type.kind != classType || !type._class || !type._class.registered || type._class.registered.type == structClass))) ||
            destType.byReference)))
         {
            if(!_class || strcmp(_class.fullName, "char *"))     // TESTING THIS WITH NEW String class...
            {
               Expression checkedExp = e, newExp;

               while(((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp) && checkedExp.list) || checkedExp.type == castExp)
               {
                  if(checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp)
                  {
                     if(checkedExp.type == extensionCompoundExp)
                     {
                        checkedExp = ((Statement)checkedExp.compound.compound.statements->last).expressions->last;
                     }
                     else
                        checkedExp = checkedExp.list->last;
                  }
                  else if(checkedExp.type == castExp)
                     checkedExp = checkedExp.cast.exp;
               }

               if(checkedExp && checkedExp.type == opExp && checkedExp.op.op == '*' && !checkedExp.op.exp1)
               {
                  newExp = checkedExp.op.exp2;
                  checkedExp.op.exp2 = null;
                  FreeExpContents(checkedExp);
                  
                  if(e.expType && e.expType.passAsTemplate)
                  {
                     char size[100];
                     ComputeTypeSize(e.expType);
                     sprintf(size, "%d", e.expType.size);
                     newExp = MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)),
                        MkDeclaratorPointer(MkPointer(null, null), null)), newExp), '+',
                           MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne(MkExpConstant(size))))));
                  }

                  ReplaceExpContents(checkedExp, newExp);
                  e.byReference = true;
               }
               else if(!e.byReference || (_class && _class.type == noHeadClass))     // TESTING THIS HERE...
               {
                  Expression checkedExp, newExp;

                  {
                     // TODO: Move code from debugTools.ec for hasAddress flag, this is just temporary
                     bool hasAddress =
                        e.type == identifierExp ||
                        (e.type == ExpressionType::memberExp && e.member.memberType == dataMember) ||
                        (e.type == ExpressionType::pointerExp && e.member.memberType == dataMember) ||
                        (e.type == opExp && !e.op.exp1 && e.op.op == '*') ||
                        e.type == indexExp;

                     if(_class && _class.type != noHeadClass && _class.type != normalClass && _class.type != structClass && !hasAddress)
                     {
                        Context context = PushContext();
                        Declarator decl;
                        OldList * specs = MkList();
                        char typeString[1024];
                        Expression newExp { };

                        typeString[0] = '\0';
                        *newExp = *e;

                        //if(e.destType) e.destType.refCount++;
                        // if(exp.expType) exp.expType.refCount++;
                        newExp.prev = null;
                        newExp.next = null;
                        newExp.expType = null;

                        PrintType(e.expType, typeString, false, true);
                        decl = SpecDeclFromString(typeString, specs, null);
                        newExp.destType = ProcessType(specs, decl);

                        curContext = context;
                        e.type = extensionCompoundExp;

                        // We need a current compound for this
                        if(curCompound)
                        {
                           char name[100];
                           OldList * stmts = MkList();
                           sprintf(name, "__internalValue%03X", internalValueCounter++);
                           if(!curCompound.compound.declarations)
                              curCompound.compound.declarations = MkList();
                           curCompound.compound.declarations->Insert(null, MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(name)), null))));
                           ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier(name)), '=', newExp))));
                           ListAdd(stmts, MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier(name)))));
                           e.compound = MkCompoundStmt(null, stmts);
                        }
                        else
                           printf("libec: compiler error, curCompound is null in ApplyAnyObjectLogic\n");

                        /*
                        e.compound = MkCompoundStmt(
                           MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(
                              MkDeclaratorIdentifier(MkIdentifier("__internalValue")), MkInitializerAssignment(newExp))))), 

                           MkListOne(MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier("__internalValue"))))));
                        */
                        
                        {
                           Type type = e.destType;
                           e.destType = { };
                           CopyTypeInto(e.destType, type);
                           e.destType.refCount = 1;
                           e.destType.classObjectType = none;
                           FreeType(type);
                        }

                        e.compound.compound.context = context;
                        PopContext(context);
                        curContext = context.parent;
                     }
                  }

                  // TODO: INTEGRATE THIS WITH VERSION ABOVE WHICH WAS ADDED TO ENCOMPASS OTHER CASE (*pointer)
                  checkedExp = e;
                  while(((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp) && checkedExp.list) || checkedExp.type == castExp)
                  {
                     if(checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp)
                     {
                        if(checkedExp.type == extensionCompoundExp)
                        {
                           checkedExp = ((Statement)checkedExp.compound.compound.statements->last).expressions->last;
                        }
                        else
                           checkedExp = checkedExp.list->last;
                     }
                     else if(checkedExp.type == castExp)
                        checkedExp = checkedExp.cast.exp;
                  }
                  {
                     Expression operand { };
                     operand = *checkedExp;
                     checkedExp.destType = null;
                     checkedExp.expType = null;
                     checkedExp.Clear();
                     checkedExp.type = opExp;
                     checkedExp.op.op = '&';
                     checkedExp.op.exp1 = null;
                     checkedExp.op.exp2 = operand;

                     //newExp = MkExpOp(null, '&', checkedExp);
                  }
                  //ReplaceExpContents(checkedExp, newExp);
               }
            }
         }
      }
   }
   {
      // If expression type is a simple class, make it an address
      // FixReference(e, true);
   }
//#if 0
   if((!destType || destType.kind == ellipsisType || destType.kind == voidType) && e.expType && (e.expType.classObjectType == anyObject || e.expType.classObjectType == typedObject) && 
      (e.expType.byReference || (e.expType.kind == classType && e.expType._class && e.expType._class.registered &&
         (e.expType._class.registered.type == bitClass || e.expType._class.registered.type == enumClass || e.expType._class.registered.type == unitClass ) )))
   {
      if(e.expType.kind == classType && e.expType._class && e.expType._class.registered && !strcmp(e.expType._class.registered.name, "class"))
      {
         return;  // LEAVE THIS CASE (typed_object & :: methods 's this) TO PASS 2 FOR NOW
      }
      else
      {
         Expression thisExp { };

         *thisExp = *e;
         thisExp.prev = null;
         thisExp.next = null;
         e.Clear();

         e.type = bracketsExp;
         e.list = MkListOne(MkExpOp(null, '*', MkExpBrackets(MkListOne(thisExp))));
         if(thisExp.expType.kind == classType && thisExp.expType._class && thisExp.expType._class.registered && thisExp.expType._class.registered.type == noHeadClass)
            ((Expression)e.list->first).byReference = true;

         /*if(thisExp.expType.kind == classType && thisExp.expType._class && thisExp.expType._class.registered && !strcmp(thisExp.expType._class.registered.name, "class"))
         {
            e.expType = thisExp.expType;
            e.expType.refCount++;
         }
         else*/
         {
            e.expType = { };
            CopyTypeInto(e.expType, thisExp.expType);
            e.expType.byReference = false;
            e.expType.refCount = 1;

            if(e.expType.kind == classType && e.expType._class && e.expType._class.registered &&
               (e.expType._class.registered.type == bitClass || e.expType._class.registered.type == enumClass || e.expType._class.registered.type == unitClass))
            {
               e.expType.classObjectType = none;
            }
         }
      }
   }
// TOFIX: Try this for a nice IDE crash!
//#endif
   // The other way around
   else 
//#endif
   if(destType && e.expType && 
         //e.expType.kind == classType && e.expType._class && e.expType._class.registered && !strcmp(e.expType._class.registered.name, "class") &&
         (e.expType.classObjectType == anyObject || e.expType.classObjectType == typedObject) && 
         !destType.classObjectType && /*(destType.kind != pointerType || !destType.type || destType.type.kind != voidType) &&*/ destType.kind != voidType)
   {
      if(destType.kind == ellipsisType)
      {
         Compiler_Error($"Unspecified type\n");
      }
      else if(!(destType.truth && e.expType.kind == classType && e.expType._class && e.expType._class.registered && e.expType._class.registered.type == structClass))
      {
         bool byReference = e.expType.byReference;
         Expression thisExp { };
         Declarator decl;
         OldList * specs = MkList();
         char typeString[1024]; // Watch buffer overruns
         Type type;
         ClassObjectType backupClassObjectType;

         if(e.expType.kind == classType && e.expType._class && e.expType._class.registered && strcmp(e.expType._class.registered.name, "class"))
            type = e.expType;
         else
            type = destType;            

         backupClassObjectType = type.classObjectType;

         type.classObjectType = none;

         typeString[0] = '\0';
         PrintType(type, typeString, false, true);
         decl = SpecDeclFromString(typeString, specs, null);

         type.classObjectType = backupClassObjectType;

         *thisExp = *e;
         thisExp.prev = null;
         thisExp.next = null;
         e.Clear();

         if( ( type.kind == classType && type._class && type._class.registered && strcmp(type._class.registered.fullName, "ecere::com::Instance") &&
                   (type._class.registered.type == systemClass || type._class.registered.type == bitClass || 
                    type._class.registered.type == enumClass || type._class.registered.type == unitClass) ) ||
             (type.kind != pointerType && type.kind != arrayType && type.kind != classType) ||
             (!destType.byReference && byReference && (destType.kind != pointerType || type.kind != pointerType)))
         {
            e.type = opExp;
            e.op.op = '*';
            e.op.exp1 = null;
            e.op.exp2 = MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), thisExp);
         }
         else
         {
            e.type = castExp;
            e.cast.typeName = MkTypeName(specs, decl);
            e.cast.exp = thisExp;
            e.byReference = true;
         }
         e.expType = type;
         e.destType = destType;
         type.refCount++;
         destType.refCount++;
      }
   }
}

void ProcessExpressionType(Expression exp)
{
   bool unresolved = false;
   Location oldyylloc = yylloc;
   bool notByReference = false;
#ifdef _DEBUG   
   char debugExpString[4096];
   debugExpString[0] = '\0';
   PrintExpression(exp, debugExpString);
#endif
   if(!exp || exp.expType) 
      return;

   //eSystem_Logf("%s\n", expString);
   
   // Testing this here
   yylloc = exp.loc;
   switch(exp.type)
   {
      case identifierExp:
      {
         Identifier id = exp.identifier;
         if(!id) return;

         // DOING THIS LATER NOW...
         if(id._class && id._class.name)
         {
            id.classSym = id._class.symbol; // FindClass(id._class.name);
            /* TODO: Name Space Fix ups
            if(!id.classSym)
               id.nameSpace = eSystem_FindNameSpace(privateModule, id._class.name);
            */
         }

         /* WHY WAS THIS COMMENTED OUT? if(!strcmp(id.string, "__thisModule"))
         {
            exp.expType = ProcessTypeString("Module", true);
            break;
         }
         else */if(strstr(id.string, "__ecereClass") == id.string)
         {
            exp.expType = ProcessTypeString("ecere::com::Class", true);
            break;
         }
         else if(id._class && (id.classSym || (id._class.name && !strcmp(id._class.name, "property"))))
         {
            // Added this here as well
            ReplaceClassMembers(exp, thisClass);
            if(exp.type != identifierExp)
            {
               ProcessExpressionType(exp);
               break;
            }

            if(id.classSym && ResolveIdWithClass(exp, id.classSym.registered, false))
               break;
         }
         else
         {
            Symbol symbol = FindSymbol(id.string, curContext, topContext /*exp.destType ? topContext : globalContext*/, false, id._class && id._class.name == null);
            // Enums should be resolved here (Special pass in opExp to fix identifiers not seen as enum on the first pass)
            if(!symbol/* && exp.destType*/)
            {
               if(exp.destType && CheckExpressionType(exp, exp.destType, false))
                  break;
               else
               {
                  if(thisClass)
                  {
                     ReplaceClassMembers(exp, thisClass ? thisClass : currentClass);
                     if(exp.type != identifierExp)
                     {
                        ProcessExpressionType(exp);
                        break;
                     }
                  }
                  // Static methods called from inside the _class
                  else if(currentClass && !id._class)
                  {
                     if(ResolveIdWithClass(exp, currentClass, true))
                        break;
                  }
                  symbol = FindSymbol(id.string, topContext.parent, globalContext, false, id._class && id._class.name == null);
               }
            }

            // If we manage to resolve this symbol
            if(symbol)
            {
               Type type = symbol.type;
               Class _class = (type && type.kind == classType && type._class) ? type._class.registered : null;

               if(_class && !strcmp(id.string, "this") && !type.classObjectType)
               {
                  Context context = SetupTemplatesContext(_class);
                  type = ReplaceThisClassType(_class);
                  FinishTemplatesContext(context);
                  if(type) type.refCount = 0;   // We'll be incrementing it right below...
               }

               FreeSpecifier(id._class);
               id._class = null;
               delete id.string;
               id.string = CopyString(symbol.string);

               id.classSym = null;
               exp.expType = type;
               if(type)
                  type.refCount++;
               if(type && (type.kind == enumType || (_class && _class.type == enumClass)))
                  // Add missing cases here... enum Classes...
                  exp.isConstant = true;

               // TOCHECK: Why was !strcmp(id.string, "this") commented out?
               if(symbol.isParam || !strcmp(id.string, "this"))
               {
                  if(_class && _class.type == structClass)
                     exp.byReference = true;
                  
                  //TESTING COMMENTING THIS OUT IN FAVOR OF ApplyAnyObjectLogic
                  /*if(type && _class && (type.classObjectType == typedObject || type.classObjectType == anyObject) && 
                     ((_class.type == unitClass || _class.type == enumClass || _class.type == bitClass) || 
                     (type.byReference && (_class.type == normalClass || _class.type == noHeadClass))))
                  {
                     Identifier id = exp.identifier;
                     exp.type = bracketsExp;
                     exp.list = MkListOne(MkExpOp(null, '*', MkExpIdentifier(id)));
                  }*/
               }

               if(symbol.isIterator)
               {
                  if(symbol.isIterator == 3)
                  {
                     exp.type = bracketsExp;
                     exp.list = MkListOne(MkExpOp(null, '*', MkExpIdentifier(exp.identifier)));
                     ((Expression)exp.list->first).op.exp2.expType = exp.expType;
                     exp.expType = null;
                     ProcessExpressionType(exp);                     
                  }
                  else if(symbol.isIterator != 4)
                  {
                     exp.type = memberExp;
                     exp.member.exp = MkExpIdentifier(exp.identifier);
                     exp.member.exp.expType = exp.expType;
                     /*if(symbol.isIterator == 6)
                        exp.member.member = MkIdentifier("key");
                     else*/
                        exp.member.member = MkIdentifier("data");
                     exp.expType = null;
                     ProcessExpressionType(exp);
                  }
               }
               break;
            }
            else
            {
               DefinedExpression definedExp = null;
               if(thisNameSpace && !(id._class && !id._class.name))
               {
                  char name[1024];
                  strcpy(name, thisNameSpace);
                  strcat(name, "::");
                  strcat(name, id.string);
                  definedExp = eSystem_FindDefine(privateModule, name);
               }
               if(!definedExp)
                  definedExp = eSystem_FindDefine(privateModule, id.string);
               if(definedExp)
               {
                  int c;
                  for(c = 0; c<definedExpStackPos; c++)
                     if(definedExpStack[c] == definedExp)
                        break;
                  if(c == definedExpStackPos && c < sizeof(definedExpStack) / sizeof(void *))
                  {
                     Location backupYylloc = yylloc;
                     definedExpStack[definedExpStackPos++] = definedExp;
                     fileInput = TempFile { };
                     fileInput.Write(definedExp.value, 1, strlen(definedExp.value));
                     fileInput.Seek(0, start);

                     echoOn = false;
                     parsedExpression = null;
                     resetScanner();
                     expression_yyparse();
                     delete fileInput;

                     yylloc = backupYylloc;

                     if(parsedExpression)
                     {
                        FreeIdentifier(id);
                        exp.type = bracketsExp;
                        exp.list = MkListOne(parsedExpression);
                        parsedExpression.loc = yylloc;
                        ProcessExpressionType(exp);
                        definedExpStackPos--;
                        return;
                     }
                     definedExpStackPos--;
                  }
                  else
                  {
                     if(inCompiler)
                     {
                        Compiler_Error($"Recursion in defined expression %s\n", id.string);
                     }
                  }
               }
               else
               {
                  GlobalData data = null;
                  if(thisNameSpace && !(id._class && !id._class.name))
                  {
                     char name[1024];
                     strcpy(name, thisNameSpace);
                     strcat(name, "::");
                     strcat(name, id.string);
                     data = FindGlobalData(name);
                  }
                  if(!data)
                     data = FindGlobalData(id.string);
                  if(data)
                  {
                     DeclareGlobalData(data);
                     exp.expType = data.dataType;
                     if(data.dataType) data.dataType.refCount++;

                     delete id.string;
                     id.string = CopyString(data.fullName);
                     FreeSpecifier(id._class);
                     id._class = null;

                     break;
                  }
                  else
                  {
                     GlobalFunction function = null;
                     if(thisNameSpace && !(id._class && !id._class.name))
                     {
                        char name[1024];
                        strcpy(name, thisNameSpace);
                        strcat(name, "::");
                        strcat(name, id.string);
                        function = eSystem_FindFunction(privateModule, name);
                     }
                     if(!function)
                        function = eSystem_FindFunction(privateModule, id.string);
                     if(function)
                     {
                        char name[1024];
                        delete id.string;
                        id.string = CopyString(function.name);
                        name[0] = 0;

                        if(function.module.importType != staticImport && (!function.dataType || !function.dataType.dllExport))
                           strcpy(name, "__ecereFunction_");
                        FullClassNameCat(name, id.string, false); // Why is this using FullClassNameCat ?
                        if(DeclareFunction(function, name))
                        {
                           delete id.string;
                           id.string = CopyString(name);
                        }
                        exp.expType = function.dataType;
                        if(function.dataType) function.dataType.refCount++;

                        FreeSpecifier(id._class);
                        id._class = null;

                        break;
                     }
                  }
               }
            }
         }
         unresolved = true;
         break;
      }
      case instanceExp:
      {
         Class _class;
         // Symbol classSym;

         if(!exp.instance._class)
         {
            if(exp.destType && exp.destType.kind == classType && exp.destType._class)
            {
               exp.instance._class = MkSpecifierName(exp.destType._class.string);
            }
#ifdef _DEBUG
            else 
            {
               printf("");               
            }
#endif
         }

         //classSym = FindClass(exp.instance._class.fullName);
         //_class = classSym ? classSym.registered : null;

         ProcessInstantiationType(exp.instance);
         exp.isConstant = exp.instance.isConstant;

         /*
         if(_class.type == unitClass && _class.base.type != systemClass)
         {
            {
               Type destType = exp.destType;

               exp.destType = MkClassType(_class.base.fullName);
               exp.expType = MkClassType(_class.fullName);
               CheckExpressionType(exp, exp.destType, true);

               exp.destType = destType;
            }
            exp.expType = MkClassType(_class.fullName);
         }
         else*/
         if(exp.instance._class)
         {
            exp.expType = MkClassType(exp.instance._class.name);
            /*if(exp.expType._class && exp.expType._class.registered && 
               (exp.expType._class.registered.type == normalClass || exp.expType._class.registered.type == noHeadClass))
               exp.expType.byReference = true;*/
         }         
         break;
      }
      case constantExp:
      {
         if(!exp.expType)
         {
            Type type
            {
               refCount = 1;
               constant = true;
            };
            exp.expType = type;

            if(exp.constant[0] == '\'')
            {
               if((int)((byte *)exp.constant)[1] > 127)
               {
                  int nb;
                  unichar ch = UTF8GetChar(exp.constant + 1, &nb);
                  if(nb < 2) ch = exp.constant[1];
                  delete exp.constant;
                  exp.constant = PrintUInt(ch);
                  // type.kind = (ch > 0xFFFF) ? intType : shortType;
                  type.kind = classType; //(ch > 0xFFFF) ? intType : shortType;
                  type._class = FindClass("unichar");

                  type.isSigned = false;
               }
               else
               {
                  type.kind = charType;
                  type.isSigned = true;
               }
            }
            else if(strchr(exp.constant, '.'))
            {
               char ch = exp.constant[strlen(exp.constant)-1];
               if(ch == 'f')
                  type.kind = floatType;
               else
                  type.kind = doubleType;
               type.isSigned = true;
            }
            else
            {
               if(exp.constant[0] == '0' && exp.constant[1])
                  type.isSigned = false;
               else if(strchr(exp.constant, 'L') || strchr(exp.constant, 'l'))
                  type.isSigned = false;
               else if(strtoll(exp.constant, null, 0) > MAXINT)
                  type.isSigned = false;
               else
                  type.isSigned = true;
               type.kind = intType;
            }
            exp.isConstant = true;
         }
         break;
      }
      case stringExp:
      {
         exp.isConstant = true;      // Why wasn't this constant?
         exp.expType = Type
         {
            refCount = 1;
            kind = pointerType;
            type = Type
            {
               refCount = 1;
               kind = charType;
               constant = true;
            }
         };
         break;
      }
      case newExp:
      case new0Exp:
         ProcessExpressionType(exp._new.size);
         exp.expType = Type
         {
            refCount = 1;
            kind = pointerType;
            type = ProcessType(exp._new.typeName.qualifiers, exp._new.typeName.declarator);
         };
         DeclareType(exp.expType.type, false, false);
         break;
      case renewExp:
      case renew0Exp:
         ProcessExpressionType(exp._renew.size);
         ProcessExpressionType(exp._renew.exp);
         exp.expType = Type
         {
            refCount = 1;
            kind = pointerType;
            type = ProcessType(exp._renew.typeName.qualifiers, exp._renew.typeName.declarator);
         };
         DeclareType(exp.expType.type, false, false);
         break;
      case opExp:
      {
         bool assign = false, boolResult = false, boolOps = false;
         Type type1 = null, type2 = null;
         bool useDestType = false, useSideType = false;
         Location oldyylloc = yylloc;
         bool useSideUnit = false;

         // Dummy type to prevent ProcessExpression of operands to say unresolved identifiers yet
         Type dummy
         {
            count = 1;
            refCount = 1;
         };

         switch(exp.op.op)
         {
            // Assignment Operators
            case '=': 
            case MUL_ASSIGN:
            case DIV_ASSIGN:
            case MOD_ASSIGN:
            case ADD_ASSIGN:
            case SUB_ASSIGN:
            case LEFT_ASSIGN:
            case RIGHT_ASSIGN:
            case AND_ASSIGN:
            case XOR_ASSIGN:
            case OR_ASSIGN:
               assign = true;
               break;
            // boolean Operators
            case '!':
               // Expect boolean operators
               //boolOps = true;
               //boolResult = true;
               break;
            case AND_OP:
            case OR_OP:
               // Expect boolean operands
               boolOps = true;
               boolResult = true;
               break;
            // Comparisons
            case EQ_OP:
            case '<':
            case '>':
            case LE_OP:
            case GE_OP:
            case NE_OP:
               // Gives boolean result
               boolResult = true;
               useSideType = true;
               break;
            case '+':
            case '-':
               useSideUnit = true;

               // Just added these... testing
            case '|':
            case '&':
            case '^':

            // DANGER: Verify units
            case '/':
            case '%':
            case '*':
               
               if(exp.op.op != '*' || exp.op.exp1)
               {
                  useSideType = true;
                  useDestType = true;
               }
               break;

            /*// Implement speed etc.
            case '*':
            case '/':
               break;
            */
         }
         if(exp.op.op == '&')
         {
            // Added this here earlier for Iterator address as key
            if(!exp.op.exp1 && exp.op.exp2 && exp.op.exp2.type == identifierExp && exp.op.exp2.identifier)
            {
               Identifier id = exp.op.exp2.identifier;
               Symbol symbol = FindSymbol(id.string, curContext, topContext, false, id._class && id._class.name == null);
               if(symbol && symbol.isIterator == 2)
               {
                  exp.type = memberExp;
                  exp.member.exp = exp.op.exp2;
                  exp.member.member = MkIdentifier("key");
                  exp.expType = null;
                  exp.op.exp2.expType = symbol.type;
                  symbol.type.refCount++;
                  ProcessExpressionType(exp);
                  FreeType(dummy);
                  break;
               }
               // exp.op.exp2.usage.usageRef = true;
            }
         }

         //dummy.kind = TypeDummy;

         if(exp.op.exp1)
         {
            if(exp.destType && exp.destType.kind == classType &&
               exp.destType._class && exp.destType._class.registered && useDestType &&
               
              ((exp.destType._class.registered.type == unitClass && useSideUnit) || 
               exp.destType._class.registered.type == enumClass ||
               exp.destType._class.registered.type == bitClass
               )) 

              //(exp.destType._class.registered.type == unitClass || exp.destType._class.registered.type == enumClass) && useDestType)
            {
               if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
               exp.op.exp1.destType = exp.destType;
               if(exp.destType)
                  exp.destType.refCount++;
            }
            else if(!assign)
            {
               if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
               exp.op.exp1.destType = dummy;
               dummy.refCount++;               
            }

            // TESTING THIS HERE...
            if(exp.op.exp1.destType && exp.op.op != '=') exp.op.exp1.destType.count++;
            ProcessExpressionType(exp.op.exp1);
            if(exp.op.exp1.destType && exp.op.op != '=') exp.op.exp1.destType.count--;

            if(exp.op.exp1.destType == dummy)
            {
               FreeType(dummy);
               exp.op.exp1.destType = null;
            }
            type1 = exp.op.exp1.expType;
         }

         if(exp.op.exp2)
         {
            char expString[10240];
            expString[0] = '\0';
            if(exp.op.exp2.type == instanceExp && !exp.op.exp2.instance._class)
            {
               if(exp.op.exp1)
               {
                  exp.op.exp2.destType = exp.op.exp1.expType;
                  if(exp.op.exp1.expType)
                     exp.op.exp1.expType.refCount++;
               }
               else
               {
                  exp.op.exp2.destType = exp.destType;
                  if(exp.destType)
                     exp.destType.refCount++;
               }

               if(type1) type1.refCount++;
               exp.expType = type1;
            }
            else if(assign)
            {
               if(inCompiler)
                  PrintExpression(exp.op.exp2, expString);

               if(type1 && type1.kind == pointerType)
               {
                  if(exp.op.op == MUL_ASSIGN || exp.op.op == DIV_ASSIGN ||exp.op.op == MOD_ASSIGN ||exp.op.op == LEFT_ASSIGN ||exp.op.op == RIGHT_ASSIGN ||
                     exp.op.op == AND_ASSIGN || exp.op.op == OR_ASSIGN)
                     Compiler_Error($"operator %s illegal on pointer\n", exp.op.op);
                  else if(exp.op.op == '=')
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp2.destType = type1;
                     if(type1)
                        type1.refCount++;
                  }
               }
               else
               {
                  // Don't convert to the type for those... (e.g.: Degrees a; a /= 2;) 
                  if(exp.op.op == MUL_ASSIGN || exp.op.op == DIV_ASSIGN ||exp.op.op == MOD_ASSIGN ||exp.op.op == LEFT_ASSIGN ||exp.op.op == RIGHT_ASSIGN/* ||
                     exp.op.op == AND_ASSIGN || exp.op.op == OR_ASSIGN*/);
                  else
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp2.destType = type1;
                     if(type1)
                        type1.refCount++;
                  }
               }
               if(type1) type1.refCount++;
               exp.expType = type1;
            }
            else if(exp.destType && exp.destType.kind == classType &&
               exp.destType._class && exp.destType._class.registered && 
               
                  ((exp.destType._class.registered.type == unitClass && useDestType && useSideUnit) || 
                  (exp.destType._class.registered.type == enumClass && useDestType)) 
                  )
            {
               if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
               exp.op.exp2.destType = exp.destType;
               if(exp.destType)
                  exp.destType.refCount++;
            }
            else
            {
               if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
               exp.op.exp2.destType = dummy;
               dummy.refCount++;
            }

            // TESTING THIS HERE... (DANGEROUS)
            if(type1 && boolResult && useSideType && type1.kind == classType && type1._class && type1._class.registered && 
               (type1._class.registered.type == bitClass || type1._class.registered.type == enumClass))
            {
               FreeType(exp.op.exp2.destType);
               exp.op.exp2.destType = type1;
               type1.refCount++;
            }
            if(exp.op.exp2.destType && exp.op.op != '=') exp.op.exp2.destType.count++;
            ProcessExpressionType(exp.op.exp2);
            if(exp.op.exp2.destType && exp.op.op != '=') exp.op.exp2.destType.count--;

            if(assign && type1 && type1.kind == pointerType && exp.op.exp2.expType)
            {
               if(exp.op.exp2.expType.kind == intPtrType || exp.op.exp2.expType.kind == int64Type || exp.op.exp2.expType.kind == intType || exp.op.exp2.expType.kind == shortType || exp.op.exp2.expType.kind == charType)
               {
                  if(exp.op.op != '=' && type1.type.kind == voidType) 
                     Compiler_Error($"void *: unknown size\n");
               }
               else if(exp.op.exp2.expType.kind == pointerType || exp.op.exp2.expType.kind == arrayType || exp.op.exp2.expType.kind == functionType || exp.op.exp2.expType.kind == methodType|| 
                           (type1.type.kind == voidType && exp.op.exp2.expType.kind == classType && exp.op.exp2.expType._class.registered &&
                              (exp.op.exp2.expType._class.registered.type == normalClass || 
                              exp.op.exp2.expType._class.registered.type == structClass ||
                              exp.op.exp2.expType._class.registered.type == noHeadClass)))
               {
                  if(exp.op.op == ADD_ASSIGN)
                     Compiler_Error($"cannot add two pointers\n");                   
               }
               else if((exp.op.exp2.expType.kind == classType && type1.kind == pointerType && type1.type.kind == classType && 
                  type1.type._class == exp.op.exp2.expType._class && exp.op.exp2.expType._class.registered && exp.op.exp2.expType._class.registered.type == structClass))
               {
                  if(exp.op.op == ADD_ASSIGN)
                     Compiler_Error($"cannot add two pointers\n");                   
               }
               else if(inCompiler)
               {
                  char type1String[1024];
                  char type2String[1024];
                  type1String[0] = '\0';
                  type2String[0] = '\0';
                  
                  PrintType(exp.op.exp2.expType, type1String, false, true);
                  PrintType(type1, type2String, false, true);
                  ChangeCh(expString, '\n', ' ');
                  Compiler_Warning($"incompatible expression %s (%s); expected %s\n", expString, type1String, type2String);
               }
            }

            if(exp.op.exp2.destType == dummy)
            {
               FreeType(dummy);
               exp.op.exp2.destType = null;
            }

            type2 = exp.op.exp2.expType;
         }

         dummy.kind = voidType;

         if(exp.op.op == SIZEOF)
         {
            exp.expType = Type
            {
               refCount = 1;
               kind = intType;
            };
            exp.isConstant = true;
         }
         // Get type of dereferenced pointer
         else if(exp.op.op == '*' && !exp.op.exp1)
         {
            exp.expType = Dereference(type2);
            if(type2 && type2.kind == classType)
               notByReference = true;
         }
         else if(exp.op.op == '&' && !exp.op.exp1)
            exp.expType = Reference(type2);
         else if(!assign)
         {
            if(boolOps)
            {
               if(exp.op.exp1) 
               {
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  exp.op.exp1.destType = MkClassType("bool");
                  exp.op.exp1.destType.truth = true;
                  if(!exp.op.exp1.expType)
                     ProcessExpressionType(exp.op.exp1);
                  else
                     CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false);
                  FreeType(exp.op.exp1.expType);
                  exp.op.exp1.expType = MkClassType("bool");
                  exp.op.exp1.expType.truth = true;
               }
               if(exp.op.exp2) 
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  exp.op.exp2.destType = MkClassType("bool");
                  exp.op.exp2.destType.truth = true;
                  if(!exp.op.exp2.expType)
                     ProcessExpressionType(exp.op.exp2);
                  else
                     CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false);
                  FreeType(exp.op.exp2.expType);
                  exp.op.exp2.expType = MkClassType("bool");
                  exp.op.exp2.expType.truth = true;
               }
            }
            else if(exp.op.exp1 && exp.op.exp2 && 
               ((useSideType /*&& 
                     (useSideUnit || 
                        ((!type1 || type1.kind != classType || type1._class.registered.type != unitClass) &&
                         (!type2 || type2.kind != classType || type2._class.registered.type != unitClass)))*/) ||
                  ((!type1 || type1.kind != classType || !strcmp(type1._class.string, "String")) && 
                  (!type2 || type2.kind != classType || !strcmp(type2._class.string, "String")))))
            {
               if(type1 && type2 &&
                  // If either both are class or both are not class
                  ((type1.kind == classType && type1._class && strcmp(type1._class.string, "String")) == (type2.kind == classType && type2._class && strcmp(type2._class.string, "String"))))
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  exp.op.exp2.destType = type1;
                  type1.refCount++;
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  exp.op.exp1.destType = type2;
                  type2.refCount++;
                  // Warning here for adding Radians + Degrees with no destination type
                  if(!boolResult && type1.kind == classType && (!exp.destType || exp.destType.kind != classType) && 
                     type1._class.registered && type1._class.registered.type == unitClass && 
                     type2._class.registered && type2._class.registered.type == unitClass && 
                     type1._class.registered != type2._class.registered)
                     Compiler_Warning($"operating on %s and %s with an untyped result, assuming %s\n",
                        type1._class.string, type2._class.string, type1._class.string);

                  if(type1.kind == pointerType && type1.type.kind == templateType && type2.kind != pointerType)
                  {
                     Expression argExp = GetTemplateArgExp(type1.type.templateParameter, thisClass, true);
                     if(argExp)
                     {
                        Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

                        exp.op.exp1 = MkExpBrackets(MkListOne(MkExpCast(
                           MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)), 
                           exp.op.exp1)));

                        ProcessExpressionType(exp.op.exp1);

                        if(type2.kind != pointerType)
                        {
                           ProcessExpressionType(classExp);

                           exp.op.exp2 = MkExpBrackets(MkListOne(MkExpOp(exp.op.exp2, '*', 
                              // ((_class.type == noHeadClass || _class.type == normalClass) ? sizeof(void *) : type.size)
                              MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(
                                 // noHeadClass
                                 MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpConstant("5")),
                                    OR_OP, 
                                 // normalClass
                                 MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpConstant("0"))))),
                                    MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(
                                       MkPointer(null, null), null)))),                                  
                                       MkExpMember(classExp, MkIdentifier("typeSize"))))))));

                           if(!exp.op.exp2.expType)
                              type2 = exp.op.exp2.expType = ProcessTypeString("int", false);

                           ProcessExpressionType(exp.op.exp2);
                        }
                     }
                  }
                  
                  if(!boolResult && ((type1.kind == pointerType || type1.kind == arrayType || (type1.kind == classType && !strcmp(type1._class.string, "String"))) && (type2.kind == intPtrType || type2.kind == int64Type || type2.kind == intType || type2.kind == shortType || type2.kind == charType)))
                  {
                     if(type1.kind != classType && type1.type.kind == voidType) 
                        Compiler_Error($"void *: unknown size\n");
                     exp.expType = type1;
                     if(type1) type1.refCount++;
                  }
                  else if(!boolResult && ((type2.kind == pointerType || type2.kind == arrayType || (type2.kind == classType && !strcmp(type2._class.string, "String"))) && (type1.kind == intPtrType || type1.kind == int64Type || type1.kind == intType || type1.kind == shortType || type1.kind == charType)))
                  {
                     if(type2.kind != classType && type2.type.kind == voidType) 
                        Compiler_Error($"void *: unknown size\n");
                     exp.expType = type2;
                     if(type2) type2.refCount++;
                  }
                  else if((type1.kind == pointerType && type2.kind != pointerType && type2.kind != arrayType && type2.kind != functionType && type2.kind != methodType && type2.kind != classType && type2.kind != subClassType) ||
                          (type2.kind == pointerType && type1.kind != pointerType && type1.kind != arrayType && type1.kind != functionType && type1.kind != methodType && type1.kind != classType && type1.kind != subClassType))
                  {
                     Compiler_Warning($"different levels of indirection\n");
                  }
                  else 
                  {
                     bool success = false;
                     if(type1.kind == pointerType && type2.kind == pointerType)
                     {
                        if(exp.op.op == '+')
                           Compiler_Error($"cannot add two pointers\n");
                        else if(exp.op.op == '-')
                        {
                           // Pointer Subtraction gives integer
                           if(MatchTypes(type1.type, type2.type, null, null, null, false, false, false, false))
                           {
                              exp.expType = Type
                              {
                                 kind = intType;
                                 refCount = 1;
                              };
                              success = true;

                              if(type1.type.kind == templateType)
                              {
                                 Expression argExp = GetTemplateArgExp(type1.type.templateParameter, thisClass, true);
                                 if(argExp)
                                 {
                                    Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

                                    ProcessExpressionType(classExp);

                                    exp.type = bracketsExp;
                                    exp.list = MkListOne(MkExpOp(
                                       MkExpBrackets(MkListOne(MkExpOp(
                                             MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)), MkExpBrackets(MkListOne(exp.op.exp1)))
                                             , exp.op.op, 
                                             MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)), MkExpBrackets(MkListOne(exp.op.exp2)))))), '/', 
                                          
                                             //MkExpMember(classExp, MkIdentifier("typeSize"))

                                             // ((_class.type == noHeadClass || _class.type == normalClass) ? sizeof(void *) : type.size)
                                             MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(
                                                // noHeadClass
                                                MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("noHeadClass"))),
                                                   OR_OP, 
                                                // normalClass
                                                MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("normalClass")))))),
                                                   MkListOne(MkExpTypeSize(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(
                                                      MkPointer(null, null), null)))),                                  
                                                      MkExpMember(classExp, MkIdentifier("typeSize")))))

                                             
                                             ));
                                    
                                    ProcessExpressionType(((Expression)exp.list->first).op.exp2);
                                    FreeType(dummy);
                                    return;                                       
                                 }
                              }
                           }
                        }
                     }

                     if(!success && exp.op.exp1.type == constantExp)
                     {
                        // If first expression is constant, try to match that first
                        if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp1.destType;
                           if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                           success = true;
                        }
                        else if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp2.destType;
                           if(exp.op.exp2.destType) exp.op.exp2.destType.refCount++;
                           success = true;
                        }
                     }
                     else if(!success)
                     {
                        if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp2.destType;
                           if(exp.op.exp2.destType) exp.op.exp2.destType.refCount++;
                           success = true;
                        }
                        else if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp1.destType;
                           if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                           success = true;
                        }
                     }
                     if(!success)
                     {
                        char expString1[10240];
                        char expString2[10240];
                        char type1[1024];
                        char type2[1024];
                        expString1[0] = '\0';
                        expString2[0] = '\0';
                        type1[0] = '\0';
                        type2[0] = '\0';
                        if(inCompiler)
                        {
                           PrintExpression(exp.op.exp1, expString1);
                           ChangeCh(expString1, '\n', ' ');
                           PrintExpression(exp.op.exp2, expString2);
                           ChangeCh(expString2, '\n', ' ');
                           PrintType(exp.op.exp1.expType, type1, false, true);
                           PrintType(exp.op.exp2.expType, type2, false, true);
                        }

                        Compiler_Warning($"incompatible expressions %s (%s) and %s (%s)\n", expString1, type1, expString2, type2);
                     }
                  }
               }
               // ADDED THESE TWO FROM OUTSIDE useSideType CHECK
               else if(!boolResult && (!useSideUnit /*|| exp.destType*/) && type2 && type1 && type2.kind == classType && type1.kind != classType && type2._class && type2._class.registered && type2._class.registered.type == unitClass)
               {
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp1.destType = type2._class.registered.dataType;
                  if(type2._class.registered.dataType)
                     type2._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false);
                  exp.expType = type2;
                  if(type2) type2.refCount++;
               }
               else if(!boolResult && (!useSideUnit /*|| exp.destType*/) && type1 && type2 && type1.kind == classType && type2.kind != classType && type1._class && type1._class.registered && type1._class.registered.type == unitClass)
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp2.destType = type1._class.registered.dataType;
                  if(type1._class.registered.dataType)
                     type1._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false);
                  exp.expType = type1;
                  if(type1) type1.refCount++;
               }
               else if(type1)
               {
                  bool valid = false;

                  if(!boolResult && useSideUnit && type1 && type1.kind == classType && type1._class.registered && type1._class.registered.type == unitClass && type2 && type2.kind != classType)
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);

                     if(!type1._class.registered.dataType)
                        type1._class.registered.dataType = ProcessTypeString(type1._class.registered.dataTypeString, false);
                     exp.op.exp2.destType = type1._class.registered.dataType;
                     exp.op.exp2.destType.refCount++;

                     CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false);
                     type2 = exp.op.exp2.destType;

                     exp.expType = type2;
                     type2.refCount++;
                  }
                  
                  if(!boolResult && useSideUnit && type2 && type2.kind == classType && type2._class.registered && type2._class.registered.type == unitClass && type1 && type1.kind != classType)
                  {
                     if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);

                     if(!type2._class.registered.dataType)
                        type2._class.registered.dataType = ProcessTypeString(type2._class.registered.dataTypeString, false);
                     exp.op.exp1.destType = type2._class.registered.dataType;
                     exp.op.exp1.destType.refCount++;

                     CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false);
                     type1 = exp.op.exp1.destType;
                     exp.expType = type1;
                     type1.refCount++;
                  }

                  // TESTING THIS NEW CODE
                  if(!boolResult || exp.op.op == '>' || exp.op.op == '<')
                  {
                     if(type1.kind == classType && type1._class && type1._class.registered && type1._class.registered.type == enumClass && exp.op.exp2.expType)
                     {
                        if(CheckExpressionType(exp.op.exp1, exp.op.exp2.expType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp1.expType;
                           if(exp.op.exp2.expType) exp.op.exp1.expType.refCount++;
                           valid = true;
                        }
                     }

                     else if(type2 && (type2.kind == classType && type2._class && type2._class.registered && type2._class.registered.type == enumClass && exp.op.exp1.expType))
                     {
                        if(CheckExpressionType(exp.op.exp2, exp.op.exp1.expType, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp2.expType;
                           if(exp.op.exp2.expType) exp.op.exp2.expType.refCount++;
                           valid = true;
                        }
                     }
                  }

                  if(!valid)
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp2.destType = type1;
                     type1.refCount++;

                     /*
                     // Maybe this was meant to be an enum...
                     if(type1.kind == classType && type1._class && type1._class.registered && type1._class.registered.type == enumClass)
                     {
                        Type oldType = exp.op.exp2.expType;
                        exp.op.exp2.expType = null;
                        if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false))
                           FreeType(oldType);
                        else
                           exp.op.exp2.expType = oldType;
                     }
                     */

                     /*
                     // TESTING THIS HERE... LATEST ADDITION
                     if(type2 && type2.kind == classType && type2._class.registered && type2._class.registered.type == unitClass && type1 && type1.kind != classType)
                     {
                        if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                        exp.op.exp2.destType = type2._class.registered.dataType;
                        if(type2._class.registered.dataType)
                           type2._class.registered.dataType.refCount++;
                        CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false);
                        
                        //exp.expType = type2._class.registered.dataType; //type2;
                        //if(type2) type2.refCount++;
                     }

                     // TESTING THIS HERE... LATEST ADDITION
                     if(type1 && type1.kind == classType && type1._class.registered && type1._class.registered.type == unitClass && type2 && type2.kind != classType)
                     {
                        if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                        exp.op.exp1.destType = type1._class.registered.dataType;
                        if(type1._class.registered.dataType)
                           type1._class.registered.dataType.refCount++;
                        CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false);
                        exp.expType = type1._class.registered.dataType; //type1;
                        if(type1) type1.refCount++;
                     }
                     */

                     if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false))
                     {
                        if(exp.expType) FreeType(exp.expType);
                        exp.expType = exp.op.exp2.destType;
                        if(exp.op.exp2.destType) exp.op.exp2.destType.refCount++;
                     }
                     else if(type1 && type2)
                     {
                        char expString1[10240];
                        char expString2[10240];
                        char type1String[1024];
                        char type2String[1024];
                        expString1[0] = '\0';
                        expString2[0] = '\0';
                        type1String[0] = '\0';
                        type2String[0] = '\0';
                        if(inCompiler)
                        {
                           PrintExpression(exp.op.exp1, expString1);
                           ChangeCh(expString1, '\n', ' ');
                           PrintExpression(exp.op.exp2, expString2);
                           ChangeCh(expString2, '\n', ' ');
                           PrintType(exp.op.exp1.expType, type1String, false, true);
                           PrintType(exp.op.exp2.expType, type2String, false, true);
                        }

                        Compiler_Warning($"incompatible expressions %s (%s) and %s (%s)\n", expString1, type1String, expString2, type2String);

                        if(type1.kind == classType && type1._class && type1._class.registered && type1._class.registered.type == enumClass)
                        {
                           exp.expType = exp.op.exp1.expType;
                           if(exp.op.exp1.expType) exp.op.exp1.expType.refCount++;
                        }
                        else if(type2.kind == classType && type2._class && type2._class.registered && type2._class.registered.type == enumClass)
                        {
                           exp.expType = exp.op.exp2.expType;
                           if(exp.op.exp2.expType) exp.op.exp2.expType.refCount++;
                        }
                     }
                  }
               }
               else if(type2)
               {
                  // Maybe this was meant to be an enum...
                  if(type2.kind == classType && type2._class && type2._class.registered && type2._class.registered.type == enumClass)
                  {
                     Type oldType = exp.op.exp1.expType;
                     exp.op.exp1.expType = null;
                     if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false))
                        FreeType(oldType);
                     else
                        exp.op.exp1.expType = oldType;
                  }

                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  exp.op.exp1.destType = type2;
                  type2.refCount++;
                  /*
                  // TESTING THIS HERE... LATEST ADDITION
                  if(type1 && type1.kind == classType && type1._class.registered && type1._class.registered.type == unitClass && type2 && type2.kind != classType)
                  {
                     if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                     exp.op.exp1.destType = type1._class.registered.dataType;
                     if(type1._class.registered.dataType)
                        type1._class.registered.dataType.refCount++;
                  }

                  // TESTING THIS HERE... LATEST ADDITION
                  if(type2 && type2.kind == classType && type2._class.registered && type2._class.registered.type == unitClass && type1 && type1.kind != classType)
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp2.destType = type2._class.registered.dataType;
                     if(type2._class.registered.dataType)
                        type2._class.registered.dataType.refCount++;
                  }
                  */

                  if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false))
                  {
                     if(exp.expType) FreeType(exp.expType);
                     exp.expType = exp.op.exp1.destType;
                     if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                  }
               }
            }
            else if(type2 && (!type1 || (type2.kind == classType && type1.kind != classType)))
            {
               if(type1 && type2._class && type2._class.registered && type2._class.registered.type == unitClass)
               {
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp1.destType = type2._class.registered.dataType;
                  if(type2._class.registered.dataType)
                     type2._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false);
               }
               if(exp.op.op == '!')
               {
                  exp.expType = MkClassType("bool");
                  exp.expType.truth = true;
               }
               else
               {
                  exp.expType = type2;
                  if(type2) type2.refCount++;
               }
            }
            else if(type1 && (!type2 || (type1.kind == classType && type2.kind != classType)))
            {
               if(type2 && type1._class && type1._class.registered && type1._class.registered.type == unitClass)
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp2.destType = type1._class.registered.dataType;
                  if(type1._class.registered.dataType)
                     type1._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false);
               }
               exp.expType = type1;
               if(type1) type1.refCount++;
            }
         }
         
         yylloc = exp.loc;
         if(exp.op.exp1 && !exp.op.exp1.expType)
         {
            char expString[10000];
            expString[0] = '\0';
            if(inCompiler)
            {
               PrintExpression(exp.op.exp1, expString);
               ChangeCh(expString, '\n', ' ');
            }
            if(expString[0])
               Compiler_Error($"couldn't determine type of %s\n", expString);
         }
         if(exp.op.exp2 && !exp.op.exp2.expType)
         {
            char expString[10240];
            expString[0] = '\0';
            if(inCompiler)
            {
               PrintExpression(exp.op.exp2, expString);
               ChangeCh(expString, '\n', ' ');
            }
            if(expString[0])
               Compiler_Error($"couldn't determine type of %s\n", expString);
         }

         if(boolResult)
         {
            FreeType(exp.expType);
            exp.expType = MkClassType("bool");
            exp.expType.truth = true;
         }

         if(exp.op.op != SIZEOF)
            exp.isConstant = (!exp.op.exp1 || exp.op.exp1.isConstant) &&
               (!exp.op.exp2 || exp.op.exp2.isConstant);

         if(exp.op.op == SIZEOF && exp.op.exp2.expType)
         {
            DeclareType(exp.op.exp2.expType, false, false);
         }

         yylloc = oldyylloc;

         FreeType(dummy);
         break;
      }
      case bracketsExp:
      case extensionExpressionExp:
      {
         Expression e;
         exp.isConstant = true;
         for(e = exp.list->first; e; e = e.next)
         {
            bool inced = false;
            if(!e.next)
            {
               FreeType(e.destType);
               e.destType = exp.destType;
               if(e.destType) { exp.destType.refCount++; e.destType.count++; inced = true; }
            }
            ProcessExpressionType(e);
            if(inced)
               exp.destType.count--;
            if(!exp.expType && !e.next)
            {
               exp.expType = e.expType;
               if(e.expType) e.expType.refCount++;
            }
            if(!e.isConstant)
               exp.isConstant = false;
         }

         // In case a cast became a member...
         e = exp.list->first;
         if(!e.next && e.type == memberExp)
         {
            // Preserve prev, next
            Expression next = exp.next, prev = exp.prev;


            FreeType(exp.expType);
            FreeType(exp.destType);
            delete exp.list;
            
            *exp = *e;

            exp.prev = prev;
            exp.next = next;

            delete e;

            ProcessExpressionType(exp);
         }
         break;
      }
      case indexExp:
      {
         Expression e;
         exp.isConstant = true;

         ProcessExpressionType(exp.index.exp);
         if(!exp.index.exp.isConstant)
            exp.isConstant = false;

         if(exp.index.exp.expType)
         {
            Type source = exp.index.exp.expType;
            if(source.kind == classType && source._class && source._class.registered && source._class.registered != containerClass &&
               eClass_IsDerived(source._class.registered, containerClass) && 
               source._class.registered.templateArgs)
            {
               Class _class = source._class.registered;
               exp.expType = ProcessTypeString(_class.templateArgs[2].dataTypeString, false);

               if(exp.index.index && exp.index.index->last)
               {
                  ((Expression)exp.index.index->last).destType = ProcessTypeString(_class.templateArgs[1].dataTypeString, false);
               }
            }
         }

         for(e = exp.index.index->first; e; e = e.next)
         {
            if(!e.next && exp.index.exp.expType && exp.index.exp.expType.kind == arrayType && exp.index.exp.expType.enumClass)
            {
               if(e.destType) FreeType(e.destType);
               e.destType = MkClassType(exp.index.exp.expType.enumClass.string);
            }
            ProcessExpressionType(e);
            if(!e.next)
            {
               // Check if this type is int
            }
            if(!e.isConstant)
               exp.isConstant = false;
         }

         if(!exp.expType)
            exp.expType = Dereference(exp.index.exp.expType);
         if(exp.expType)
            DeclareType(exp.expType, false, false);
         break;
      }
      case callExp:
      {
         Expression e;
         Type functionType;
         Type methodType = null;
         char name[1024];
         name[0] = '\0';

         if(inCompiler)
         {
            PrintExpression(exp.call.exp,  name);
            if(exp.call.exp.expType && !exp.call.exp.expType.returnType)
            {
               //exp.call.exp.expType = null;
               PrintExpression(exp.call.exp,  name);
            }
         }
         if(exp.call.exp.type == identifierExp)
         {
            Expression idExp = exp.call.exp;
            Identifier id = idExp.identifier;
            if(!strcmp(id.string, "__ENDIAN_PAD"))
            {
               exp.expType = ProcessTypeString("int", true);
               if(exp.call.arguments && exp.call.arguments->first)
                  ProcessExpressionType(exp.call.arguments->first);
               break;
            }
            else if(!strcmp(id.string, "Max") ||
               !strcmp(id.string, "Min") ||
               !strcmp(id.string, "Sgn") ||
               !strcmp(id.string, "Abs"))
            {
               Expression a = null;
               Expression b = null;
               Expression tempExp1 = null, tempExp2 = null;
               if((!strcmp(id.string, "Max") ||
                  !strcmp(id.string, "Min")) && exp.call.arguments->count == 2)
               {
                  a = exp.call.arguments->first;
                  b = exp.call.arguments->last;
                  tempExp1 = a;
                  tempExp2 = b;
               }
               else if(exp.call.arguments->count == 1)
               {
                  a = exp.call.arguments->first;
                  tempExp1 = a;
               }
               
               if(a)
               {
                  exp.call.arguments->Clear();
                  idExp.identifier = null;

                  FreeExpContents(exp);

                  ProcessExpressionType(a);
                  if(b)
                     ProcessExpressionType(b);

                  exp.type = bracketsExp;
                  exp.list = MkList();

                  if(a.expType && (!b || b.expType))
                  {
                     if((!a.isConstant && a.type != identifierExp) || (b && !b.isConstant && b.type != identifierExp))
                     {
                        // Use the simpleStruct name/ids for now...
                        if(inCompiler)
                        {
                           OldList * specs = MkList();
                           OldList * decls = MkList();
                           Declaration decl;
                           char temp1[1024], temp2[1024];

                           GetTypeSpecs(a.expType, specs);

                           if(a && !a.isConstant && a.type != identifierExp)
                           {
                              sprintf(temp1, "__simpleStruct%d", curContext.simpleID++);
                              ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(temp1)), null));
                              tempExp1 = QMkExpId(temp1);
                              tempExp1.expType = a.expType;
                              if(a.expType)
                                 a.expType.refCount++;
                              ListAdd(exp.list, MkExpOp(CopyExpression(tempExp1), '=', a));
                           }
                           if(b && !b.isConstant && b.type != identifierExp)
                           {
                              sprintf(temp2, "__simpleStruct%d", curContext.simpleID++);
                              ListAdd(decls, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(temp2)), null));
                              tempExp2 = QMkExpId(temp2);
                              tempExp2.expType = b.expType;
                              if(b.expType)
                                 b.expType.refCount++;
                              ListAdd(exp.list, MkExpOp(CopyExpression(tempExp2), '=', b));
                           }                        

                           decl = MkDeclaration(specs, decls);
                           if(!curCompound.compound.declarations)
                              curCompound.compound.declarations = MkList();
                           curCompound.compound.declarations->Insert(null, decl);
                        }
                     }
                  }

                  if(!strcmp(id.string, "Max") || !strcmp(id.string, "Min"))
                  {
                     int op = (!strcmp(id.string, "Max")) ? '>' : '<';
                     ListAdd(exp.list, 
                        MkExpCondition(MkExpBrackets(MkListOne(
                           MkExpOp(CopyExpression(tempExp1), op, CopyExpression(tempExp2)))),
                           MkListOne(CopyExpression(tempExp1)), CopyExpression(tempExp2)));
                     exp.expType = a.expType;
                     if(a.expType)
                        a.expType.refCount++;
                  }
                  else if(!strcmp(id.string, "Abs"))
                  {
                     ListAdd(exp.list, 
                        MkExpCondition(MkExpBrackets(MkListOne(
                           MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))),
                           MkListOne(MkExpOp(null, '-', CopyExpression(tempExp1))), CopyExpression(tempExp1)));
                     exp.expType = a.expType;
                     if(a.expType)
                        a.expType.refCount++;
                  }
                  else if(!strcmp(id.string, "Sgn"))
                  {
                     // ((!(a))?(0):(((a)<0)?(-1):(1)))
                     ListAdd(exp.list, 
                        MkExpCondition(MkExpBrackets(MkListOne(
                           MkExpOp(null, '!', CopyExpression(tempExp1)))), MkListOne(MkExpConstant("0")),
                              MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(
                                 MkExpOp(CopyExpression(tempExp1), '<', MkExpConstant("0")))),
                                 MkListOne(MkExpConstant("-1")), MkExpConstant("1"))))));
                     exp.expType = ProcessTypeString("int", false);
                  }

                  FreeExpression(tempExp1);
                  if(tempExp2) FreeExpression(tempExp2);

                  FreeIdentifier(id);
                  break;
               }
            }
         }

         {
            Type dummy
            {
               count = 1;
               refCount = 1;
            };
            if(!exp.call.exp.destType)
            {
               exp.call.exp.destType = dummy;
               dummy.refCount++;
            }
            ProcessExpressionType(exp.call.exp);
            if(exp.call.exp.destType == dummy)
            {
               FreeType(dummy);
               exp.call.exp.destType = null;
            }
            FreeType(dummy);
         }

         // Check argument types against parameter types
         functionType = exp.call.exp.expType;

         if(functionType && functionType.kind == TypeKind::methodType)
         {
            methodType = functionType;
            functionType = methodType.method.dataType;
            
            //if(functionType.returnType && functionType.returnType.kind == thisClassType)
            // TOCHECK: Instead of doing this here could this be done per param?
            if(exp.call.exp.expType.usedClass)
            {
               char typeString[1024];
               typeString[0] = '\0';
               PrintType(functionType, typeString, true, true);
               if(strstr(typeString, "thisclass"))
               {
                  OldList * specs = MkList();
                  Declarator decl;
                  {
                     Context context = SetupTemplatesContext(exp.call.exp.expType.usedClass);

                     decl = SpecDeclFromString(typeString, specs, null);
                     
                     // SET THIS TO FALSE WHEN PROCESSING THISCLASS OUTSIDE THE CLASS
                     if(thisClass != (exp.call.exp.expType.usedClass.templateClass ? exp.call.exp.expType.usedClass.templateClass :
                        exp.call.exp.expType.usedClass))
                        thisClassParams = false;
                     
                     ReplaceThisClassSpecifiers(specs, exp.call.exp.expType.usedClass);
                     {
                        Class backupThisClass = thisClass;
                        thisClass = exp.call.exp.expType.usedClass;
                        ProcessDeclarator(decl);
                        thisClass = backupThisClass;
                     }

                     thisClassParams = true;

                     functionType = ProcessType(specs, decl);
                     functionType.refCount = 0;
                     FinishTemplatesContext(context);
                  }

                  FreeList(specs, FreeSpecifier);
                  FreeDeclarator(decl);
                }
            }
         }
         if(functionType && functionType.kind == pointerType && functionType.type && functionType.type.kind == TypeKind::functionType)
         {
            Type type = functionType.type;
            if(!functionType.refCount)
            {
               functionType.type = null;
               FreeType(functionType);
            }
            //methodType = functionType;
            functionType = type;
         }
         if(functionType && functionType.kind != TypeKind::functionType)
         {
            Compiler_Error($"called object %s is not a function\n", name);
         }
         else if(functionType)
         {
            bool emptyParams = false, noParams = false;
            Expression e = exp.call.arguments ? exp.call.arguments->first : null;
            Type type = functionType.params.first;
            Expression memberExp = (exp.call.exp.type == ExpressionType::memberExp) ? exp.call.exp : null;
            int extra = 0;
            Location oldyylloc = yylloc;

            if(!type) emptyParams = true;

            // WORKING ON THIS:
            if(functionType.extraParam && e)
            {
               e.destType = MkClassType(functionType.thisClass.string);
               e = e.next;
            }

            // WHY WAS THIS COMMENTED OUT ? Broke DisplaySystem::FontExtent(this ? displaySystem : null, font, text, len, width, height);
            if(!functionType.staticMethod)
            {
               if(memberExp && memberExp.member.exp && memberExp.member.exp.expType && memberExp.member.exp.expType.kind == subClassType && 
                  memberExp.member.exp.expType._class)
               {
                  type = MkClassType(memberExp.member.exp.expType._class.string);
                  if(e)
                  {
                     e.destType = type;
                     e = e.next;
                     type = functionType.params.first;
                  }
                  else
                     type.refCount = 0;
               }
               else if(!memberExp && (functionType.thisClass || (methodType && methodType.methodClass)))
               {
                  type = MkClassType(functionType.thisClass ? functionType.thisClass.string : (methodType ? methodType.methodClass.fullName : null));
                  if(e)
                  {
                     e.destType = type;
                     e = e.next;
                     type = functionType.params.first;
                  }
                  else
                     type.refCount = 0;
                  //extra = 1;
               }
            }

            if(type && type.kind == voidType)
            {
               noParams = true;
               if(!type.refCount) FreeType(type);
               type = null;
            }

            for( ; e; e = e.next)
            {
               if(!type && !emptyParams)
               {
                  yylloc = e.loc;
                  if(methodType && methodType.methodClass)
                     Compiler_Error($"too many arguments for method %s::%s (%d given, expected %d)\n",
                        methodType.methodClass.fullName, methodType.method.name, exp.call.arguments->count,
                        noParams ? 0 : functionType.params.count);
                  else
                     Compiler_Error($"too many arguments for function %s (%d given, expected %d)\n",
                        name /*exp.call.exp.identifier.string*/, exp.call.arguments->count,
                        noParams ? 0 : functionType.params.count);
                  break;
               }

               if(methodType && type && type.kind == templateType && type.templateParameter.type == TemplateParameterType::type)
               {
                  Type templatedType = null;
                  Class _class = methodType.usedClass;
                  ClassTemplateParameter curParam = null;
                  int id = 0;
                  if(_class && _class.templateArgs /*&& _class.templateClass*/)
                  {
                     Class sClass;
                     for(sClass = _class; sClass; sClass = sClass.base)
                     {
                        if(sClass.templateClass) sClass = sClass.templateClass;
                        id = 0;
                        for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
                        {
                           if(curParam.type == TemplateParameterType::type && !strcmp(type.templateParameter.identifier.string, curParam.name))
                           {
                              Class nextClass;
                              for(nextClass = sClass.base; nextClass; nextClass = nextClass.base)
                              {
                                 if(nextClass.templateClass) nextClass = nextClass.templateClass;
                                 id += nextClass.templateParams.count;
                              }
                              break;
                           }
                           id++;
                        }
                        if(curParam) break;
                     }
                  }
                  if(curParam && _class.templateArgs[id].dataTypeString)
                  {
                     ClassTemplateArgument arg = _class.templateArgs[id];
                     {
                        Context context = SetupTemplatesContext(_class);
                     
                        /*if(!arg.dataType)
                           arg.dataType = ProcessTypeString(arg.dataTypeString, false);*/
                        templatedType = ProcessTypeString(arg.dataTypeString, false);
                        FinishTemplatesContext(context);
                     }
                     e.destType = templatedType;
                     if(templatedType)
                     {
                        templatedType.passAsTemplate = true;
                        // templatedType.refCount++;
                     }
                  }
                  else
                  {
                     e.destType = type;
                     if(type) type.refCount++;
                  }
               }
               else
               {
                  e.destType = type;
                  if(type) type.refCount++;
               }
               // Don't reach the end for the ellipsis
               if(type && type.kind != ellipsisType)
               {
                  Type next = type.next;
                  if(!type.refCount) FreeType(type);
                  type = next;
               }
            }

            if(type && type.kind != ellipsisType)
            {
               if(methodType && methodType.methodClass)
                  Compiler_Warning($"not enough arguments for method %s::%s (%d given, expected %d)\n",
                     methodType.methodClass.fullName, methodType.method.name, exp.call.arguments ? exp.call.arguments->count : 0,
                     functionType.params.count + extra);
               else
                  Compiler_Warning($"not enough arguments for function %s (%d given, expected %d)\n",
                     name /*exp.call.exp.identifier.string*/, exp.call.arguments ? exp.call.arguments->count : 0,
                     functionType.params.count + extra);
            }
            yylloc = oldyylloc;
            if(type && !type.refCount) FreeType(type);
         }
         else
         {
            functionType = Type
            {
               refCount = 0;
               kind = TypeKind::functionType;
            };

            if(exp.call.exp.type == identifierExp)
            {
               char * string = exp.call.exp.identifier.string;
               if(inCompiler)
               {
                  Symbol symbol;
                  Location oldyylloc = yylloc;

                  yylloc = exp.call.exp.identifier.loc;
                  if(strstr(string, "__builtin_") == string);
                  else
                     Compiler_Warning($"%s undefined; assuming extern returning int\n", string);
                  symbol = Symbol { string = CopyString(string), type = ProcessTypeString("int()", true) };
                  globalContext.symbols.Add((BTNode)symbol);
                  if(strstr(symbol.string, "::"))
                     globalContext.hasNameSpace = true;

                  yylloc = oldyylloc;
               }
            }
            else if(exp.call.exp.type == memberExp)
            {
               /*Compiler_Warning($"%s undefined; assuming returning int\n",
                  exp.call.exp.member.member.string);*/
            }
            else
               Compiler_Warning($"callable object undefined; extern assuming returning int\n");

            if(!functionType.returnType)
            {
               functionType.returnType = Type
               {
                  refCount = 1;
                  kind = intType;
               };
            }
         }
         if(functionType && functionType.kind == TypeKind::functionType)
         {
            exp.expType = functionType.returnType;

            if(functionType.returnType)
               functionType.returnType.refCount++;

            if(!functionType.refCount)
               FreeType(functionType);
         }

         if(exp.call.arguments)
         {
            for(e = exp.call.arguments->first; e; e = e.next)
            {
               Type destType = e.destType;
               ProcessExpressionType(e);
            }
         }
         break;
      }
      case memberExp:
      {
         Type type;
         Location oldyylloc = yylloc;
         bool thisPtr = (exp.member.exp && exp.member.exp.type == identifierExp && !strcmp(exp.member.exp.identifier.string, "this"));
         exp.thisPtr = thisPtr;

         // DOING THIS LATER NOW...
         if(exp.member.member && exp.member.member._class && exp.member.member._class.name)
         {
            exp.member.member.classSym = exp.member.member._class.symbol; // FindClass(exp.member.member._class.name);
            /* TODO: Name Space Fix ups
            if(!exp.member.member.classSym)
               exp.member.member.nameSpace = eSystem_FindNameSpace(privateModule, exp.member.member._class.fullName);
            */
         }

         ProcessExpressionType(exp.member.exp);
         if(exp.member.exp.expType && exp.member.exp.expType.kind == classType && exp.member.exp.expType._class && 
            exp.member.exp.expType._class.registered && exp.member.exp.expType._class.registered.type == normalClass)
         {
            exp.isConstant = false;
         }
         else
            exp.isConstant = exp.member.exp.isConstant;
         type = exp.member.exp.expType;

         yylloc = exp.loc;

         if(type && (type.kind == templateType))
         {
            Class _class = thisClass ? thisClass : currentClass;
            ClassTemplateParameter param = null;
            if(_class)
            {
               for(param = _class.templateParams.first; param; param = param.next)
               {
                  if(param.type == identifier && exp.member.member && exp.member.member.string && !strcmp(param.name, exp.member.member.string))
                     break;
               }
            }
            if(param && param.defaultArg.member)
            {
               Expression argExp = GetTemplateArgExpByName(param.name, thisClass, TemplateParameterType::identifier);
               if(argExp)
               {
                  Expression expMember = exp.member.exp;
                  Declarator decl;
                  OldList * specs = MkList();
                  char thisClassTypeString[1024];

                  FreeIdentifier(exp.member.member);

                  ProcessExpressionType(argExp);

                  {
                     char * colon = strstr(param.defaultArg.memberString, "::");
                     if(colon)
                     {
                        char className[1024];
                        Class sClass;

                        memcpy(thisClassTypeString, param.defaultArg.memberString, colon - param.defaultArg.memberString);
                        thisClassTypeString[colon - param.defaultArg.memberString] = '\0';
                     }
                     else
                        strcpy(thisClassTypeString, _class.fullName);
                  }

                  decl = SpecDeclFromString(param.defaultArg.member.dataTypeString, specs, null);

                  exp.expType = ProcessType(specs, decl);
                  if(exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.templateClass)
                  {
                     Class expClass = exp.expType._class.registered;
                     Class cClass = null;
                     int c;
                     int paramCount = 0;
                     int lastParam = -1;
                     
                     char templateString[1024];
                     ClassTemplateParameter param;
                     sprintf(templateString, "%s<", expClass.templateClass.fullName);
                     for(cClass = expClass; cClass; cClass = cClass.base)
                     {
                        int p = 0;
                        for(param = cClass.templateParams.first; param; param = param.next)
                        {
                           int id = p;
                           Class sClass;
                           ClassTemplateArgument arg;
                           for(sClass = cClass.base; sClass; sClass = sClass.base) id += sClass.templateParams.count;
                           arg = expClass.templateArgs[id];

                           for(sClass = _class /*expClass*/; sClass; sClass = sClass.base)
                           {
                              ClassTemplateParameter cParam;
                              //int p = numParams - sClass.templateParams.count;
                              int p = 0;
                              Class nextClass;
                              for(nextClass = sClass.base; nextClass; nextClass = nextClass.base) p += nextClass.templateParams.count;
                              
                              for(cParam = sClass.templateParams.first; cParam; cParam = cParam.next, p++)
                              {
                                 if(cParam.type == TemplateParameterType::type && arg.dataTypeString && !strcmp(cParam.name, arg.dataTypeString))
                                 {
                                    if(_class.templateArgs && arg.dataTypeString && (!param.defaultArg.dataTypeString || strcmp(arg.dataTypeString, param.defaultArg.dataTypeString)))
                                    {
                                       arg.dataTypeString = _class.templateArgs[p].dataTypeString;
                                       arg.dataTypeClass = _class.templateArgs[p].dataTypeClass;
                                       break;
                                    }
                                 }
                              }
                           }

                           {
                              char argument[256];
                              argument[0] = '\0';
                              /*if(arg.name)
                              {
                                 strcat(argument, arg.name.string);
                                 strcat(argument, " = ");
                              }*/
                              switch(param.type)
                              {
                                 case expression:
                                 {
                                    // THIS WHOLE THING IS A WILD GUESS... FIX IT UP
                                    char expString[1024];
                                    OldList * specs = MkList();
                                    Declarator decl = SpecDeclFromString(param.dataTypeString, specs, null);
                                    Expression exp;
                                    char * string = PrintHexUInt64(arg.expression.ui64);
                                    exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));

                                    ProcessExpressionType(exp);
                                    ComputeExpression(exp);
                                    expString[0] = '\0';
                                    PrintExpression(exp, expString);
                                    strcat(argument, expString);
                                    // delete exp;
                                    FreeExpression(exp);
                                    break;
                                 }
                                 case identifier:
                                 {
                                    strcat(argument, arg.member.name);
                                    break;
                                 }
                                 case TemplateParameterType::type:
                                 {
                                    if(arg.dataTypeString && (!param.defaultArg.dataTypeString || strcmp(arg.dataTypeString, param.defaultArg.dataTypeString)))
                                    {
                                       if(!strcmp(arg.dataTypeString, "thisclass"))
                                          strcat(argument, thisClassTypeString);
                                       else
                                          strcat(argument, arg.dataTypeString);
                                    }
                                    break;
                                 }
                              }
                              if(argument[0])
                              {
                                 if(paramCount) strcat(templateString, ", ");
                                 if(lastParam != p - 1)
                                 {
                                    strcat(templateString, param.name);
                                    strcat(templateString, " = ");
                                 }
                                 strcat(templateString, argument);
                                 paramCount++;
                                 lastParam = p;
                              }
                              p++;
                           }               
                        }
                     }
                     {
                        int len = strlen(templateString);
                        if(templateString[len-1] == '>') templateString[len++] = ' ';
                        templateString[len++] = '>';
                        templateString[len++] = '\0';
                     }
                     {
                        Context context = SetupTemplatesContext(_class);
                        FreeType(exp.expType);
                        exp.expType = ProcessTypeString(templateString, false);
                        FinishTemplatesContext(context);
                     }                     
                  }

                  // *([expType] *)(((byte *)[exp.member.exp]) + [argExp].member.offset)
                  exp.type = bracketsExp;
                  exp.list = MkListOne(MkExpOp(null, '*',
                  /*opExp;
                  exp.op.op = '*';
                  exp.op.exp1 = null;
                  exp.op.exp2 = */
                  MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), MkExpBrackets(MkListOne(MkExpOp(
                     MkExpBrackets(MkListOne(
                        MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)), expMember))),
                           '+',  
                           MkExpOp(MkExpMember(MkExpMember(argExp, MkIdentifier("member")), MkIdentifier("offset")), 
                           '+',
                           MkExpMember(MkExpMember(MkExpMember(CopyExpression(argExp), MkIdentifier("member")), MkIdentifier("_class")), MkIdentifier("offset")))))))
                           
                           ));
               }
            }
            else if(type.templateParameter && type.templateParameter.type == TemplateParameterType::type && 
               (type.templateParameter.dataType || type.templateParameter.dataTypeString))
            {
               type = ProcessTemplateParameterType(type.templateParameter);
            }
         }

         if(type && (type.kind == templateType));
         else if(type && (type.kind == classType || type.kind == subClassType || type.kind == intType || type.kind == enumType))
         {
            Identifier id = exp.member.member;
            TypeKind typeKind = type.kind;
            Class _class = (id && (!id._class || id._class.name))? ( id.classSym ? id.classSym.registered : (type._class ? type._class.registered : null)) : null;
            if(typeKind == subClassType && exp.member.exp.type == classExp)
            {
               _class = eSystem_FindClass(privateModule, "ecere::com::Class");
               typeKind = classType;
            }

            if(id && (typeKind == intType || typeKind == enumType))
               _class = eSystem_FindClass(privateModule, "int");

            if(_class && id)
            {
               /*bool thisPtr = 
                  (exp.member.exp.type == identifierExp && 
                  !strcmp(exp.member.exp.identifier.string, "this"));*/
               Property prop = null;
               Method method = null;
               DataMember member = null;
               Property revConvert = null;
               ClassProperty classProp = null;

               if(id && id._class && id._class.name && !strcmp(id._class.name, "property"))
                  exp.member.memberType = propertyMember;

               if(id && id._class && type._class && !eClass_IsDerived(type._class.registered, _class))
                  Compiler_Error($"invalid class specifier %s for object of class %s\n", _class.fullName, type._class.string);

               if(typeKind != subClassType)
               {
                  // Prioritize data members over properties for "this"
                  if((exp.member.memberType == unresolvedMember && thisPtr) || exp.member.memberType == dataMember)
                  {
                     member = eClass_FindDataMember(_class, id.string, privateModule, null, null);
                     if(member && member._class != (_class.templateClass ? _class.templateClass : _class) && exp.member.memberType != dataMember)
                     {
                        prop = eClass_FindProperty(_class, id.string, privateModule);
                        if(prop)
                           member = null;
                     }
                     if(!member && !prop)
                        prop = eClass_FindProperty(_class, id.string, privateModule);
                     if((member && member._class == (_class.templateClass ? _class.templateClass : _class)) ||
                        (prop && prop._class == (_class.templateClass ? _class.templateClass : _class)))
                        exp.member.thisPtr = true;
                  }
                  // Prioritize properties over data members otherwise
                  else
                  {
                     // First look for Public Members (Unless class specifier is provided, which skips public priority)
                     if(!id.classSym)
                     {
                        prop = eClass_FindProperty(_class, id.string, null);
                        if(!id._class || !id._class.name || strcmp(id._class.name, "property"))
                           member = eClass_FindDataMember(_class, id.string, null, null, null);
                     }

                     if(!prop && !member)
                     {
                        method = eClass_FindMethod(_class, id.string, null);
                        if(!method)
                        {
                           prop = eClass_FindProperty(_class, id.string, privateModule);
                           if(!id._class || !id._class.name || strcmp(id._class.name, "property"))
                              member = eClass_FindDataMember(_class, id.string, privateModule, null, null);
                        }
                     }

                     if(member && prop)
                     {
                        if(member._class != prop._class && !id._class && eClass_IsDerived(member._class, prop._class))
                           prop = null;
                        else
                           member = null;
                     }
                  }
               }
               if(!prop && !member)
                  method = eClass_FindMethod(_class, id.string, privateModule);
               if(!prop && !member && !method)
               {
                  if(typeKind == subClassType)
                  {
                     classProp = eClass_FindClassProperty(type._class.registered, exp.member.member.string);
                     if(classProp)
                     {
                        exp.member.memberType = classPropertyMember;
                        exp.expType = ProcessTypeString(classProp.dataTypeString, false);
                     }
                     else
                     {
                        // Assume this is a class_data member
                        char structName[1024];
                        Identifier id = exp.member.member;
                        Expression classExp = exp.member.exp;
                        type.refCount++;

                        FreeType(classExp.expType);
                        classExp.expType = ProcessTypeString("ecere::com::Class", false);
                     
                        strcpy(structName, "__ecereClassData_");
                        FullClassNameCat(structName, type._class.string, false);
                        exp.type = pointerExp;
                        exp.member.member = id;

                        exp.member.exp = MkExpBrackets(MkListOne(MkExpCast(
                           MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)), MkDeclaratorPointer(MkPointer(null, null), null)), 
                              MkExpBrackets(MkListOne(MkExpOp(
                                 MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null,null), null)), 
                                    MkExpMember(classExp, MkIdentifier("data"))), '+',
                                       MkExpMember(MkExpClass(MkListOne(MkSpecifierName(type._class.string)), null), MkIdentifier("offsetClass")))))
                                 )));

                        FreeType(type);

                        ProcessExpressionType(exp);
                        return;
                     }
                  }
                  else
                  {
                     // Check for reverse conversion
                     // (Convert in an instantiation later, so that we can use
                     //  deep properties system)
                     Symbol classSym = FindClass(id.string);
                     if(classSym)
                     {
                        Class convertClass = classSym.registered;
                        if(convertClass)
                           revConvert = eClass_FindProperty(convertClass, _class.fullName, privateModule);
                     }
                  }
               }
      
               if(prop)
               {
                  exp.member.memberType = propertyMember;
                  if(!prop.dataType)
                     ProcessPropertyType(prop);
                  exp.expType = prop.dataType;                     
                  if(prop.dataType) prop.dataType.refCount++;
               }
               else if(member)
               {
                  if(exp.member.exp.expType.classObjectType == typedObject && !strcmp(exp.member.member.string, "_class"))
                  {
                     FreeExpContents(exp);
                     exp.type = identifierExp;
                     exp.identifier = MkIdentifier("class");
                     ProcessExpressionType(exp);
                     return;
                  }

                  exp.member.memberType = dataMember;
                  DeclareStruct(_class.fullName, false);
                  if(!member.dataType)
                  {
                     Context context = SetupTemplatesContext(_class);
                     member.dataType = ProcessTypeString(member.dataTypeString, false);
                     FinishTemplatesContext(context);
                  }
                  exp.expType = member.dataType;
                  if(member.dataType) member.dataType.refCount++;
               }
               else if(revConvert)
               {
                  exp.member.memberType = reverseConversionMember;
                  exp.expType = MkClassType(revConvert._class.fullName);
               }
               else if(method)
               {
                  if(inCompiler)
                  {
                     /*if(id._class)
                     {
                        exp.type = identifierExp;
                        exp.identifier = exp.member.member;
                     }
                     else*/
                        exp.member.memberType = methodMember;
                  }
                  if(!method.dataType)
                     ProcessMethodType(method);
                  exp.expType = Type
                  {
                     refCount = 1;
                     kind = methodType;
                     method = method;
                  };

                  // Tricky spot here... To use instance versus class virtual table
                  // Put it back to what it was... What did we break?

                  // Had to put it back for overriding Main of Thread global instance

                  //exp.expType.methodClass = _class;
                  exp.expType.methodClass = (id && id._class) ? _class : null;

                  // Need the actual class used for templated classes
                  exp.expType.usedClass = _class;
               }
               else if(!classProp)
               {
                  if(exp.member.exp.expType.classObjectType == typedObject && !strcmp(exp.member.member.string, "_class"))
                  {
                     FreeExpContents(exp);
                     exp.type = identifierExp;
                     exp.identifier = MkIdentifier("class");
                     ProcessExpressionType(exp);
                     return;
                  }
                  yylloc = exp.member.member.loc;
                  Compiler_Error($"couldn't find member %s in class %s\n", id.string, _class.fullName);
                  if(inCompiler)
                     eClass_AddDataMember(_class, id.string, "int", 0, 0, publicAccess);
               }

               if(_class && /*(_class.templateClass || _class.templateArgs) && */exp.expType)
               {
                  Class tClass;

                  tClass = _class;
                  while(tClass && !tClass.templateClass) tClass = tClass.base;

                  if(tClass && exp.expType.kind == templateType && exp.expType.templateParameter.type == TemplateParameterType::type)
                  {
                     int id = 0;
                     ClassTemplateParameter curParam = null;
                     Class sClass;

                     for(sClass = tClass; sClass; sClass = sClass.base)
                     {
                        id = 0;
                        if(sClass.templateClass) sClass = sClass.templateClass;
                        for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
                        {
                           if(curParam.type == TemplateParameterType::type && !strcmp(exp.expType.templateParameter.identifier.string, curParam.name))
                           {
                              for(sClass = sClass.base; sClass; sClass = sClass.base)
                                 id += sClass.templateParams.count;
                              break;
                           }
                           id++;
                        }
                        if(curParam) break;
                     }

                     if(curParam && tClass.templateArgs[id].dataTypeString)
                     {
                        ClassTemplateArgument arg = tClass.templateArgs[id];
                        Context context = SetupTemplatesContext(tClass);
                        /*if(!arg.dataType)
                           arg.dataType = ProcessTypeString(arg.dataTypeString, false);*/
                        FreeType(exp.expType);
                        exp.expType = ProcessTypeString(arg.dataTypeString, false);
                        if(exp.expType)
                        {
                           if(exp.expType.kind == thisClassType)
                           {
                              FreeType(exp.expType);
                              exp.expType = ReplaceThisClassType(_class);
                           }

                           if(tClass.templateClass)
                              exp.expType.passAsTemplate = true;
                           //exp.expType.refCount++;
                           if(!exp.destType)
                           {
                              exp.destType = ProcessTypeString(arg.dataTypeString, false);
                              //exp.destType.refCount++;

                              if(exp.destType.kind == thisClassType)
                              {
                                 FreeType(exp.destType);
                                 exp.destType = ReplaceThisClassType(_class);
                              }
                           }
                        }
                        FinishTemplatesContext(context);
                     }
                  }
                  // TODO: MORE GENERIC SUPPORT FOR DEEPER TYPES
                  else if(tClass && exp.expType.kind == pointerType && exp.expType.type && exp.expType.type.kind == templateType && exp.expType.type.templateParameter.type == TemplateParameterType::type)
                  {
                     int id = 0;
                     ClassTemplateParameter curParam = null;
                     Class sClass;

                     for(sClass = tClass; sClass; sClass = sClass.base)
                     {
                        id = 0;
                        if(sClass.templateClass) sClass = sClass.templateClass;
                        for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
                        {
                           if(curParam.type == TemplateParameterType::type && 
                              !strcmp(exp.expType.type.templateParameter.identifier.string, curParam.name))
                           {
                              for(sClass = sClass.base; sClass; sClass = sClass.base)
                                 id += sClass.templateParams.count;
                              break;
                           }
                           id++;
                        }
                        if(curParam) break;
                     }

                     if(curParam)
                     {
                        ClassTemplateArgument arg = tClass.templateArgs[id];
                        Context context = SetupTemplatesContext(tClass);
                        Type basicType;
                        /*if(!arg.dataType)
                           arg.dataType = ProcessTypeString(arg.dataTypeString, false);*/
                        
                        basicType = ProcessTypeString(arg.dataTypeString, false);
                        if(basicType)
                        {
                           if(basicType.kind == thisClassType)
                           {
                              FreeType(basicType);
                              basicType = ReplaceThisClassType(_class);
                           }

                           /*    DO WE REALLY WANT THIS HERE? IT SEEMS TO BE ONLY USED WITH Array::array which was causing bug 135
                           if(tClass.templateClass)
                              basicType.passAsTemplate = true;
                           */
                           
                           FreeType(exp.expType);

                           exp.expType = Type { refCount = 1, kind = pointerType, type = basicType };
                           //exp.expType.refCount++;
                           if(!exp.destType)
                           {
                              exp.destType = exp.expType;
                              exp.destType.refCount++;
                           }

                           {
                              Expression newExp { };
                              OldList * specs = MkList();
                              Declarator decl;
                              decl = SpecDeclFromString(arg.dataTypeString, specs, null);
                              *newExp = *exp;
                              if(exp.destType) exp.destType.refCount++;
                              if(exp.expType)  exp.expType.refCount++;
                              exp.type = castExp;
                              exp.cast.typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl));
                              exp.cast.exp = newExp;
                              //FreeType(exp.expType);
                              //exp.expType = null;
                              //ProcessExpressionType(sourceExp);
                           }
                        }
                        FinishTemplatesContext(context);
                     }
                  }
                  else if(tClass && exp.expType.kind == classType && exp.expType._class && strchr(exp.expType._class.string, '<'))
                  {
                     Class expClass = exp.expType._class.registered;
                     if(expClass)
                     {
                        Class cClass = null;
                        int c;
                        int p = 0;
                        int paramCount = 0;
                        int lastParam = -1;
                        char templateString[1024];
                        ClassTemplateParameter param;
                        sprintf(templateString, "%s<", expClass.templateClass.fullName);
                        while(cClass != expClass)
                        {
                           Class sClass;
                           for(sClass = expClass; sClass && sClass.base != cClass; sClass = sClass.base);
                           cClass = sClass;

                           for(param = cClass.templateParams.first; param; param = param.next)
                           {
                              Class cClassCur = null;
                              int c;
                              int cp = 0;
                              ClassTemplateParameter paramCur = null;
                              ClassTemplateArgument arg;
                              while(cClassCur != tClass && !paramCur)
                              {
                                 Class sClassCur;
                                 for(sClassCur = tClass; sClassCur && sClassCur.base != cClassCur; sClassCur = sClassCur.base);
                                 cClassCur = sClassCur;

                                 for(paramCur = cClassCur.templateParams.first; paramCur; paramCur = paramCur.next)
                                 {
                                    if(!strcmp(paramCur.name, param.name))
                                    {
                                       
                                       break;
                                    }
                                    cp++;
                                 }
                              }
                              if(paramCur && paramCur.type == TemplateParameterType::type)
                                 arg = tClass.templateArgs[cp];
                              else
                                 arg = expClass.templateArgs[p];

                              {
                                 char argument[256];
                                 argument[0] = '\0';
                                 /*if(arg.name)
                                 {
                                    strcat(argument, arg.name.string);
                                    strcat(argument, " = ");
                                 }*/
                                 switch(param.type)
                                 {
                                    case expression:
                                    {
                                       // THIS WHOLE THING IS A WILD GUESS... FIX IT UP
                                       char expString[1024];
                                       OldList * specs = MkList();
                                       Declarator decl = SpecDeclFromString(param.dataTypeString, specs, null);
                                       Expression exp;
                                       char * string = PrintHexUInt64(arg.expression.ui64);
                                       exp = MkExpCast(MkTypeName(specs, decl), MkExpConstant(string));

                                       ProcessExpressionType(exp);
                                       ComputeExpression(exp);
                                       expString[0] = '\0';
                                       PrintExpression(exp, expString);
                                       strcat(argument, expString);
                                       // delete exp;
                                       FreeExpression(exp);
                                       break;
                                    }
                                    case identifier:
                                    {
                                       strcat(argument, arg.member.name);
                                       break;
                                    }
                                    case TemplateParameterType::type:
                                    {
                                       if(arg.dataTypeString && (!param.defaultArg.dataTypeString || strcmp(arg.dataTypeString, param.defaultArg.dataTypeString)))
                                          strcat(argument, arg.dataTypeString);
                                       break;
                                    }
                                 }
                                 if(argument[0])
                                 {
                                    if(paramCount) strcat(templateString, ", ");
                                    if(lastParam != p - 1)
                                    {
                                       strcat(templateString, param.name);
                                       strcat(templateString, " = ");
                                    }                                       
                                    strcat(templateString, argument);
                                    paramCount++;
                                    lastParam = p;
                                 }
                              }
                              p++;
                           }
                        }
                        {
                           int len = strlen(templateString);
                           if(templateString[len-1] == '>') templateString[len++] = ' ';
                           templateString[len++] = '>';
                           templateString[len++] = '\0';
                        }

                        FreeType(exp.expType);
                        {
                           Context context = SetupTemplatesContext(tClass);
                           exp.expType = ProcessTypeString(templateString, false);
                           FinishTemplatesContext(context);
                        }
                     }
                  }
               }
            }
            else
               Compiler_Error($"undefined class %s\n", (id && (!id._class || id._class.name))? (id.classSym ? id.classSym.string : (type._class ? type._class.string : null)) : "(null)");
         }
         else if(type && (type.kind == structType || type.kind == unionType))
         {
            Type memberType = exp.member.member ? FindMember(type, exp.member.member.string) : null;
            if(memberType)
            {
               exp.expType = memberType;
               if(memberType)
                  memberType.refCount++;
            }
         }
         else 
         {
            char expString[10240];
            expString[0] = '\0';
            if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }
            Compiler_Error($"member operator on non-structure type expression %s\n", expString);
         }

         if(exp.expType && exp.expType.kind == thisClassType && (!exp.destType || exp.destType.kind != thisClassType))
         {
            if(type && (type.kind == classType || type.kind == subClassType || type.kind == intType || type.kind == enumType))
            {
               Identifier id = exp.member.member;
               Class _class = (id && (!id._class || id._class.name))? ( id.classSym ? id.classSym.registered : (type._class ? type._class.registered : null)) : null;
               if(_class)
               {
                  FreeType(exp.expType);
                  exp.expType = ReplaceThisClassType(_class);
               }
            }
         }         
         yylloc = oldyylloc;
         break;
      }
      // Convert x->y into (*x).y
      case pointerExp:
      {
         Type destType = exp.destType;

         // DOING THIS LATER NOW...
         if(exp.member.member && exp.member.member._class && exp.member.member._class.name)
         {
            exp.member.member.classSym = exp.member.member._class.symbol; // FindClass(exp.member.member._class.name);
            /* TODO: Name Space Fix ups
            if(!exp.member.member.classSym)
               exp.member.member.nameSpace = eSystem_FindNameSpace(privateModule, exp.member.member._class.name);
            */
         }

         exp.member.exp = MkExpBrackets(MkListOne(MkExpOp(null, '*', exp.member.exp)));
         exp.type = memberExp;
         if(destType)
            destType.count++;
         ProcessExpressionType(exp);
         if(destType)
            destType.count--;
         break;
      }
      case classSizeExp:
      {
         //ComputeExpression(exp);

         Symbol classSym = exp._class.symbol; // FindClass(exp._class.name);
         if(classSym && classSym.registered)
         {
            if(classSym.registered.type == noHeadClass)
            {
               char name[1024];
               name[0] = '\0';
               DeclareStruct(classSym.string, false);
               FreeSpecifier(exp._class);
               exp.type = typeSizeExp;
               FullClassNameCat(name, classSym.string, false);
               exp.typeName = MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(name), null)), null);
            }
            else
            {
               if(classSym.registered.fixed)
               {
                  FreeSpecifier(exp._class);
                  exp.constant = PrintUInt(classSym.registered.templateClass ? classSym.registered.templateClass.structSize : classSym.registered.structSize);
                  exp.type = constantExp;
               }
               else
               {
                  char className[1024];
                  strcpy(className, "__ecereClass_");
                  FullClassNameCat(className, classSym.string, true);
                  MangleClassName(className);

                  DeclareClass(classSym, className);

                  FreeExpContents(exp);
                  exp.type = pointerExp;
                  exp.member.exp = MkExpIdentifier(MkIdentifier(className));
                  exp.member.member = MkIdentifier("structSize");
               }
            }
         }

         exp.expType = Type
         {
            refCount = 1;
            kind = intType;
         };
         // exp.isConstant = true;
         break;
      }
      case typeSizeExp:
      {
         Type type = ProcessType(exp.typeName.qualifiers, exp.typeName.declarator);

         exp.expType = Type
         {
            refCount = 1;
            kind = intType;
         };
         exp.isConstant = true;

         DeclareType(type, false, false);
         FreeType(type);
         break;
      }
      case castExp:
      {
         Type type = ProcessType(exp.cast.typeName.qualifiers, exp.cast.typeName.declarator);
         type.count = 1;
         FreeType(exp.cast.exp.destType);
         exp.cast.exp.destType = type;
         type.refCount++;
         ProcessExpressionType(exp.cast.exp);
         type.count = 0;
         exp.expType = type;
         //type.refCount++;
         
         // if(!NeedCast(exp.cast.exp.expType, exp.cast.exp.destType))
         if(!exp.cast.exp.needCast && !NeedCast(exp.cast.exp.expType, type))
         {
            void * prev = exp.prev, * next = exp.next;
            Type expType = exp.cast.exp.destType;
            Expression castExp = exp.cast.exp;
            Type destType = exp.destType;

            if(expType) expType.refCount++;

            //FreeType(exp.destType);
            FreeType(exp.expType);
            FreeTypeName(exp.cast.typeName);
            
            *exp = *castExp;
            FreeType(exp.expType);
            FreeType(exp.destType);

            exp.expType = expType;
            exp.destType = destType;

            delete castExp;

            exp.prev = prev;
            exp.next = next;

         }
         else
         {
            exp.isConstant = exp.cast.exp.isConstant;
         }
         //FreeType(type);
         break;
      }
      case extensionInitializerExp:
      {
         Type type = ProcessType(exp.initializer.typeName.qualifiers, exp.initializer.typeName.declarator);
         type.refCount++;

         // We have yet to support this... ( { } initializers are currently processed inside ProcessDeclaration()'s initDeclaration case statement
         // ProcessInitializer(exp.initializer.initializer, type);
         exp.expType = type;
         break;
      }
      case vaArgExp:
      {
         Type type = ProcessType(exp.vaArg.typeName.qualifiers, exp.vaArg.typeName.declarator);
         ProcessExpressionType(exp.vaArg.exp);
         type.refCount++;
         exp.expType = type;
         break;
      }
      case conditionExp:
      {
         Expression e;
         exp.isConstant = true;

         FreeType(exp.cond.cond.destType);
         exp.cond.cond.destType = MkClassType("bool");
         exp.cond.cond.destType.truth = true;
         ProcessExpressionType(exp.cond.cond);
         if(!exp.cond.cond.isConstant)
            exp.isConstant = false;
         for(e = exp.cond.exp->first; e; e = e.next)
         {
            if(!e.next)
            {
               FreeType(e.destType);
               e.destType = exp.destType;
               if(e.destType) e.destType.refCount++;
            }
            ProcessExpressionType(e);
            if(!e.next)
            {
               exp.expType = e.expType;
               if(e.expType) e.expType.refCount++;
            }
            if(!e.isConstant)
               exp.isConstant = false;
         }

         FreeType(exp.cond.elseExp.destType);
         // Added this check if we failed to find an expType
         // exp.cond.elseExp.destType = exp.expType ? exp.expType : exp.destType;

         // Reversed it...
         exp.cond.elseExp.destType = exp.destType ? exp.destType : exp.expType;

         if(exp.cond.elseExp.destType)
            exp.cond.elseExp.destType.refCount++;
         ProcessExpressionType(exp.cond.elseExp);

         // FIXED THIS: Was done before calling process on elseExp
         if(!exp.cond.elseExp.isConstant)
            exp.isConstant = false;
         break;
      }
      case extensionCompoundExp:
      {
         if(exp.compound && exp.compound.compound.statements && exp.compound.compound.statements->last)
         {
            Statement last = exp.compound.compound.statements->last;
            if(last.type == expressionStmt && last.expressions && last.expressions->last)
            {
               ((Expression)last.expressions->last).destType = exp.destType;
               if(exp.destType)
                  exp.destType.refCount++;
            }
            ProcessStatement(exp.compound);
            exp.expType = ((Expression)last.expressions->last).expType;
            if(((Expression)last.expressions->last).expType)
               exp.expType.refCount++;
         }
         break;
      }
      case classExp:
      {
         Specifier spec = exp._classExp.specifiers->first;
         if(spec && spec.type == nameSpecifier)
         {
            exp.expType = MkClassType(spec.name);
            exp.expType.kind = subClassType;
            exp.byReference = true;
         }
         else
         {
            exp.expType = MkClassType("ecere::com::Class");
            exp.byReference = true;
         }
         break;
      }
      case classDataExp:
      {
         Class _class = thisClass ? thisClass : currentClass;
         if(_class)
         {
            Identifier id = exp.classData.id;
            char structName[1024];
            Expression classExp;
            strcpy(structName, "__ecereClassData_");
            FullClassNameCat(structName, _class.fullName, false);
            exp.type = pointerExp;
            exp.member.member = id;
            if(curCompound && FindSymbol("this", curContext, curCompound.compound.context, false, false))
               classExp = MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class"));
            else
               classExp = MkExpIdentifier(MkIdentifier("class"));

            exp.member.exp = MkExpBrackets(MkListOne(MkExpCast(
               MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)), MkDeclaratorPointer(MkPointer(null, null), null)), 
                  MkExpBrackets(MkListOne(MkExpOp(
                     MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null,null), null)), 
                        MkExpMember(classExp, MkIdentifier("data"))), '+',
                           MkExpMember(MkExpClass(MkListOne(MkSpecifierName(_class.fullName)), null), MkIdentifier("offsetClass")))))
                     )));

            ProcessExpressionType(exp);
            return;
         }
         break;
      }
      case arrayExp:
      {
         Type type = null;
         char * typeString = null;
         char typeStringBuf[1024];
         if(exp.destType && exp.destType.kind == classType && exp.destType._class && exp.destType._class.registered &&
            exp.destType._class.registered != containerClass && eClass_IsDerived(exp.destType._class.registered, containerClass))
         {
            Class templateClass = exp.destType._class.registered;
            typeString = templateClass.templateArgs[2].dataTypeString;
         }
         else if(exp.list)
         {
            // Guess type from expressions in the array
            Expression e;
            for(e = exp.list->first; e; e = e.next)
            {
               ProcessExpressionType(e);
               if(e.expType)
               {
                  if(!type) { type = e.expType; type.refCount++; }
                  else
                  {
                     // if(!MatchType(e.expType, type, null, null, null, false, false, false))
                     if(!MatchTypeExpression(e, type, null, false))
                     {
                        FreeType(type);
                        type = e.expType;
                        e.expType = null;
                        
                        e = exp.list->first;
                        ProcessExpressionType(e);
                        if(e.expType)
                        {
                           //if(!MatchTypes(e.expType, type, null, null, null, false, false, false))
                           if(!MatchTypeExpression(e, type, null, false))
                           {
                              FreeType(e.expType);
                              e.expType = null;
                              FreeType(type);
                              type = null;
                              break;
                           }                           
                        }
                     }
                  }
                  if(e.expType)
                  {
                     FreeType(e.expType);
                     e.expType = null;
                  }
               }
            }
            if(type)
            {
               typeStringBuf[0] = '\0';
               PrintType(type, typeStringBuf, false, true);
               typeString = typeStringBuf;
               FreeType(type);
               type = null;
            }
         }
         if(typeString)
         {
            /*
            (Container)& (struct BuiltInContainer)
            {
               ._vTbl = class(BuiltInContainer)._vTbl,
               ._class = class(BuiltInContainer),
               .refCount = 0,
               .data = (int[]){ 1, 7, 3, 4, 5 },
               .count = 5,
               .type = class(int),
            }
            */
            char templateString[1024];
            OldList * initializers = MkList();
            OldList * structInitializers = MkList();
            OldList * specs = MkList();
            Expression expExt;
            Declarator decl = SpecDeclFromString(typeString, specs, null);
            sprintf(templateString, "Container<%s>", typeString);

            if(exp.list)
            {
               Expression e;
               type = ProcessTypeString(typeString, false);
               while(e = exp.list->first)
               {
                  exp.list->Remove(e);
                  e.destType = type;
                  type.refCount++;
                  ProcessExpressionType(e);
                  ListAdd(initializers, MkInitializerAssignment(e));
               }
               FreeType(type);
               delete exp.list;
            }
            
            DeclareStruct("ecere::com::BuiltInContainer", false);

            ListAdd(structInitializers, /*MkIdentifier("_vTbl")*/    MkInitializerAssignment(MkExpMember(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), null), MkIdentifier("_vTbl"))));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            ListAdd(structInitializers, /*MkIdentifier("_class")*/   MkInitializerAssignment(MkExpClass(MkListOne(MkSpecifierName("BuiltInContainer")), null)));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            ListAdd(structInitializers, /*MkIdentifier("_refCount")*/MkInitializerAssignment(MkExpConstant("0")));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            ListAdd(structInitializers, /*MkIdentifier("data")*/     MkInitializerAssignment(MkExpExtensionInitializer(
               MkTypeName(specs, MkDeclaratorArray(decl, null)),
               MkInitializerList(initializers))));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            ListAdd(structInitializers, /*MkIdentifier("count")*/    MkInitializerAssignment({ type = constantExp, constant = PrintString(initializers->count) }));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            ListAdd(structInitializers, /*MkIdentifier("type")*/     MkInitializerAssignment(MkExpClass(CopyList(specs, CopySpecifier), CopyDeclarator(decl))));
               ProcessExpressionType(((Initializer)structInitializers->last).exp);
            exp.expType = ProcessTypeString(templateString, false);
            exp.type = bracketsExp;
            exp.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(templateString)), null),
               MkExpOp(null, '&',
               expExt = MkExpExtensionInitializer(MkTypeName(MkListOne(MkSpecifierName("BuiltInContainer")), null),
                  MkInitializerList(structInitializers)))));
            ProcessExpressionType(expExt);
         }
         else
         {
            exp.expType = ProcessTypeString("Container", false);
            Compiler_Error($"Couldn't determine type of array elements\n");
         }
         break;
      }
   }

   if(exp.expType && exp.expType.kind == thisClassType && thisClass && (!exp.destType || exp.destType.kind != thisClassType))
   {
      FreeType(exp.expType);
      exp.expType = ReplaceThisClassType(thisClass);
   }

   // Resolve structures here
   if(exp.expType && (exp.expType.kind == structType || exp.expType.kind == unionType || exp.expType.kind == enumType) && !exp.expType.members.first && exp.expType.enumName)
   {
      Symbol symbol = FindSymbol(exp.expType.enumName, curContext, globalContext, true, false);
      // TODO: Fix members reference...
      if(symbol)
      {
         if(exp.expType.kind != enumType)
         {
            Type member;
            String enumName = CopyString(exp.expType.enumName);

            // Fixed a memory leak on self-referencing C structs typedefs
            // by instantiating a new type rather than simply copying members
            // into exp.expType
            FreeType(exp.expType);
            exp.expType = Type { };
            exp.expType.kind = symbol.type.kind;
            exp.expType.refCount++;
            exp.expType.enumName = enumName;

            exp.expType.members = symbol.type.members;
            for(member = symbol.type.members.first; member; member = member.next)
               member.refCount++;
         }
         else
         {
            NamedLink member;
            for(member = symbol.type.members.first; member; member = member.next)
            {
               NamedLink value { name = CopyString(member.name) };
               exp.expType.members.Add(value);
            }
         }
      }
   }

   yylloc = exp.loc;
   if(exp.destType && (exp.destType.kind == voidType || exp.destType.kind == dummyType) );
   else if(exp.destType && !exp.destType.keepCast)
   {
      if(!CheckExpressionType(exp, exp.destType, false))
      {
         if(!exp.destType.count || unresolved)
         {
            if(!exp.expType)
            {
               yylloc = exp.loc;
               if(exp.destType.kind != ellipsisType)
               {
                  char type2[1024];
                  type2[0] = '\0';
                  if(inCompiler)
                  {
                     char expString[10240];
                     expString[0] = '\0';

                     PrintType(exp.destType, type2, false, true);

                     if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }
                     if(unresolved)
                        Compiler_Error($"unresolved identifier %s; expected %s\n", expString, type2);
                     else if(exp.type != dummyExp)
                        Compiler_Error($"couldn't determine type of %s; expected %s\n", expString, type2);
                  }
               }
               else
               {
                  char expString[10240] ;
                  expString[0] = '\0';
                  if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }

                  if(unresolved)
                     Compiler_Error($"unresolved identifier %s\n", expString);
                  else if(exp.type != dummyExp)
                     Compiler_Error($"couldn't determine type of %s\n", expString);
               }
            }
            else
            {
               char type1[1024];
               char type2[1024];
               type1[0] = '\0';
               type2[0] = '\0';
               if(inCompiler)
               {
                  PrintType(exp.expType, type1, false, true);
                  PrintType(exp.destType, type2, false, true);
               }

               //CheckExpressionType(exp, exp.destType, false);

               if(exp.destType.truth && exp.destType._class && exp.destType._class.registered && !strcmp(exp.destType._class.registered.name, "bool") &&
                  exp.expType.kind != voidType && exp.expType.kind != structType && exp.expType.kind != unionType && 
                  (exp.expType.kind != classType || exp.expType.classObjectType || (exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type != structClass)));
               else
               {
                  char expString[10240];
                  expString[0] = '\0';
                  if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }

#ifdef _DEBUG
                  CheckExpressionType(exp, exp.destType, false);
#endif
                  // Flex & Bison generate code that triggers this, so we ignore it for a quiet sdk build:
                  if(!sourceFile || (strcmp(sourceFile, "src\\lexer.ec") && strcmp(sourceFile, "src/lexer.ec") && strcmp(sourceFile, "src\\grammar.ec") && strcmp(sourceFile, "src/grammar.ec")))
                     Compiler_Warning($"incompatible expression %s (%s); expected %s\n", expString, type1, type2);

                  // TO CHECK: FORCING HERE TO HELP DEBUGGER
                  FreeType(exp.expType);
                  exp.destType.refCount++;
                  exp.expType = exp.destType;
               }
            }
         }
      }
      else if(exp.destType && exp.destType.kind == ellipsisType && exp.expType && exp.expType.passAsTemplate)
      {
         Expression newExp { };
         char typeString[1024];
         OldList * specs = MkList();
         Declarator decl;

         typeString[0] = '\0';

         *newExp = *exp;

         if(exp.expType)  exp.expType.refCount++;
         if(exp.expType)  exp.expType.refCount++;
         exp.type = castExp;
         newExp.destType = exp.expType;

         PrintType(exp.expType, typeString, false, false);
         decl = SpecDeclFromString(typeString, specs, null);
         
         exp.cast.typeName = MkTypeName(specs, decl);
         exp.cast.exp = newExp;
      }
   }
   else if(unresolved)
   {
      if(exp.identifier._class && exp.identifier._class.name)
         Compiler_Error($"unresolved identifier %s::%s\n", exp.identifier._class.name, exp.identifier.string);
      else if(exp.identifier.string && exp.identifier.string[0])
         Compiler_Error($"unresolved identifier %s\n", exp.identifier.string);
   }
   else if(!exp.expType && exp.type != dummyExp)
   {
      char expString[10240];
      expString[0] = '\0';
      if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }
      Compiler_Error($"couldn't determine type of %s\n", expString);
   }

   // Let's try to support any_object & typed_object here:
   ApplyAnyObjectLogic(exp);

   if(!notByReference && exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered &&
      exp.expType._class.registered.type == noHeadClass)
   {
      exp.byReference = true;
   }
   /*else if(!notByReference && exp.destType && exp.destType.kind == classType && exp.destType._class && exp.destType._class.registered &&
      exp.destType._class.registered.type == noHeadClass)
   {
      exp.byReference = true;
   }*/
   yylloc = oldyylloc;
}

static void FindNextDataMember(Class _class, Class * curClass, DataMember * curMember, DataMember * subMemberStack, int * subMemberStackPos)
{
   // THIS CODE WILL FIND NEXT MEMBER...
   if(*curMember) 
   {
      *curMember = (*curMember).next;

      if(subMemberStackPos && *subMemberStackPos > 0 && subMemberStack[*subMemberStackPos-1].type == unionMember)
      {
         *curMember = subMemberStack[--(*subMemberStackPos)];
         *curMember = (*curMember).next;
      }

      // SKIP ALL PROPERTIES HERE...
      while((*curMember) && (*curMember).isProperty)
         *curMember = (*curMember).next;

      if(subMemberStackPos)
      {
         while((*curMember) && !(*curMember).isProperty && !(*curMember).name && ((*curMember).type == structMember || (*curMember).type == unionMember))
         {
            subMemberStack[(*subMemberStackPos)++] = *curMember;

            *curMember = (*curMember).members.first;
            while(*curMember && (*curMember).isProperty)
               *curMember = (*curMember).next;                     
         }
      }
   }
   while(!*curMember)
   {
      if(!*curMember)
      {
         if(subMemberStackPos && *subMemberStackPos)
         {
            *curMember = subMemberStack[--(*subMemberStackPos)];
            *curMember = (*curMember).next;
         }
         else
         {
            Class lastCurClass = *curClass;

            if(*curClass == _class) break;     // REACHED THE END

            for(*curClass = _class; (*curClass).base != lastCurClass && (*curClass).base.type != systemClass; *curClass = (*curClass).base);
            *curMember = (*curClass).membersAndProperties.first;
         }

         while((*curMember) && (*curMember).isProperty)
            *curMember = (*curMember).next;
         if(subMemberStackPos)
         {
            while((*curMember) && !(*curMember).isProperty && !(*curMember).name && ((*curMember).type == structMember || (*curMember).type == unionMember))
            {
               subMemberStack[(*subMemberStackPos)++] = *curMember;

               *curMember = (*curMember).members.first;
               while(*curMember && (*curMember).isProperty)
                  *curMember = (*curMember).next;                     
            }
         }
      }
   }
}


static void ProcessInitializer(Initializer init, Type type)
{
   switch(init.type)
   {
      case expInitializer:
         if(!init.exp || init.exp.type != instanceExp || !init.exp.instance || init.exp.instance._class || !type || type.kind == classType)
         {
            // TESTING THIS FOR SHUTTING = 0 WARNING
            if(init.exp && !init.exp.destType)
            {
               FreeType(init.exp.destType);
               init.exp.destType = type;
               if(type) type.refCount++;
            }
            if(init.exp)
            {
               ProcessExpressionType(init.exp);
               init.isConstant = init.exp.isConstant;
            }
            break;
         }
         else
         {
            Expression exp = init.exp;
            Instantiation inst = exp.instance;
            MembersInit members;

            init.type = listInitializer;
            init.list = MkList();

            if(inst.members)
            {
               for(members = inst.members->first; members; members = members.next)
               {
                  if(members.type == dataMembersInit)
                  {
                     MemberInit member;
                     for(member = members.dataMembers->first; member; member = member.next)
                     {
                        ListAdd(init.list, member.initializer);
                        member.initializer = null;
                     }
                  }
                  // Discard all MembersInitMethod
               }
            }
            FreeExpression(exp);
         }
      case listInitializer:
      {
         Initializer i;
         Type initializerType = null;
         Class curClass = null;
         DataMember curMember = null;
         DataMember subMemberStack[256];
         int subMemberStackPos = 0;

         if(type && type.kind == arrayType)
            initializerType = Dereference(type);
         else if(type && (type.kind == structType || type.kind == unionType))
            initializerType = type.members.first;

         for(i = init.list->first; i; i = i.next)
         {
            if(type && type.kind == classType && type._class && type._class.registered)
            {
               // THIS IS FOR A C STYLE INSTANTIATION OF STRUCT CLASSES ONLY... WE ONLY CARE ABOUT DATA MEMBERS, AND ACTUAL MEMORY ORDER (PRIVATE MEMBERS ARE INCLUDED)
               FindNextDataMember(type._class.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
               // TODO: Generate error on initializing a private data member this way from another module...
               if(curMember)
               {
                  if(!curMember.dataType)
                     curMember.dataType = ProcessTypeString(curMember.dataTypeString, false);
                  initializerType = curMember.dataType;
               }
            }
            ProcessInitializer(i, initializerType);
            if(initializerType && type && (type.kind == structType || type.kind == unionType))
               initializerType = initializerType.next;
            if(!i.isConstant)
               init.isConstant = false;
         }

         if(type && type.kind == arrayType)
            FreeType(initializerType);

         if(type && type.kind != arrayType && type.kind != structType && type.kind != unionType && (type.kind != classType || !type._class.registered || type._class.registered.type != structClass))
         {
            Compiler_Error($"Assigning list initializer to non list\n");
         }
         break;
      }
   }
}

static void ProcessSpecifier(Specifier spec, bool declareStruct)
{
   switch(spec.type)
   {
      case baseSpecifier:
      {
         if(spec.specifier == THISCLASS)
         {
            if(thisClass)
            {
               spec.type = nameSpecifier;
               spec.name = ReplaceThisClass(thisClass);
               spec.symbol = FindClass(spec.name);
               ProcessSpecifier(spec, declareStruct);
            }
         }
         break;
      }
      case nameSpecifier:
      {
         Symbol symbol = FindType(curContext, spec.name);
         if(symbol)
            DeclareType(symbol.type, true, true);
         else if((symbol = spec.symbol /*FindClass(spec.name)*/) && symbol.registered && symbol.registered.type == structClass && declareStruct)
            DeclareStruct(spec.name, false);
         break;
      }
      case enumSpecifier:
      {
         Enumerator e;
         if(spec.list)
         {
            for(e = spec.list->first; e; e = e.next)
            {
               if(e.exp)
                  ProcessExpressionType(e.exp);
            }
         }
         break;
      }
      case structSpecifier:
      case unionSpecifier:
      {
         if(spec.definitions)
         {
            ClassDef def;
            Symbol symbol = spec.id ? FindClass(spec.id.string) : null;
            //if(symbol)
               ProcessClass(spec.definitions, symbol);
            /*else
            {
               for(def = spec.definitions->first; def; def = def.next)
               {
                  //if(def.type == declarationClassDef && def.decl && def.decl.type == DeclarationStruct)
                     ProcessDeclaration(def.decl);
               }
            }*/
         }
         break;
      }
      /*
      case classSpecifier:
      {
         Symbol classSym = FindClass(spec.name);
         if(classSym && classSym.registered && classSym.registered.type == structClass)
            DeclareStruct(spec.name, false);
         break;
      }
      */
   }
}


static void ProcessDeclarator(Declarator decl)
{
   switch(decl.type)
   {
      case identifierDeclarator:
         if(decl.identifier.classSym /* TODO: Name Space Fix ups  || decl.identifier.nameSpace*/)
         {
            FreeSpecifier(decl.identifier._class);
            decl.identifier._class = null;
         }
         break;
      case arrayDeclarator:
         if(decl.array.exp)
            ProcessExpressionType(decl.array.exp);
      case structDeclarator:
      case bracketsDeclarator:
      case functionDeclarator:
      case pointerDeclarator:
      case extendedDeclarator:
      case extendedDeclaratorEnd:
         if(decl.declarator)
            ProcessDeclarator(decl.declarator);
         if(decl.type == functionDeclarator)
         {
            Identifier id = GetDeclId(decl);
            if(id && id._class)
            {
               TypeName param
               {
                  qualifiers = MkListOne(id._class);
                  declarator = null;
               };
               if(!decl.function.parameters)
                  decl.function.parameters = MkList();               
               decl.function.parameters->Insert(null, param);
               id._class = null;
            }
            if(decl.function.parameters)
            {
               TypeName param;
               
               for(param = decl.function.parameters->first; param; param = param.next)
               {
                  if(param.qualifiers && param.qualifiers->first)
                  {
                     Specifier spec = param.qualifiers->first;
                     if(spec && spec.specifier == TYPED_OBJECT)
                     {
                        Declarator d = param.declarator;
                        TypeName newParam
                        {
                           qualifiers = MkListOne(MkSpecifier(VOID));
                           declarator = MkDeclaratorPointer(MkPointer(null,null), d);
                        };
                        
                        FreeList(param.qualifiers, FreeSpecifier);

                        param.qualifiers = MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));
                        param.declarator = MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("class")));

                        decl.function.parameters->Insert(param, newParam);
                        param = newParam;
                     }
                     else if(spec && spec.specifier == ANY_OBJECT)
                     {
                        Declarator d = param.declarator;
                        
                        FreeList(param.qualifiers, FreeSpecifier);

                        param.qualifiers = MkListOne(MkSpecifier(VOID));
                        param.declarator = MkDeclaratorPointer(MkPointer(null,null), d);                        
                     }
                     else if(spec.specifier == THISCLASS)
                     {
                        if(thisClass)
                        {
                           spec.type = nameSpecifier;
                           spec.name = ReplaceThisClass(thisClass);
                           spec.symbol = FindClass(spec.name);
                           ProcessSpecifier(spec, false);
                        }
                     }
                  }

                  if(param.declarator)
                     ProcessDeclarator(param.declarator);
               }
            }
         }
         break;
   }
}

static void ProcessDeclaration(Declaration decl)
{
   yylloc = decl.loc;
   switch(decl.type)
   {
      case initDeclaration:
      {
         bool declareStruct = false;
         /*
         lineNum = decl.pos.line;
         column = decl.pos.col;
         */

         if(decl.declarators)
         {
            InitDeclarator d;
         
            for(d = decl.declarators->first; d; d = d.next)
            {
               Type type, subType;
               ProcessDeclarator(d.declarator);

               type = ProcessType(decl.specifiers, d.declarator);

               if(d.initializer)
               {
                  ProcessInitializer(d.initializer, type);

                  // Change "ColorRGB a = ColorRGB { 1,2,3 } => ColorRGB a { 1,2,3 }                  
                  
                  if(decl.declarators->count == 1 && d.initializer.type == expInitializer &&
                     d.initializer.exp.type == instanceExp)
                  {
                     if(type.kind == classType && type._class == 
                        d.initializer.exp.expType._class)
                     {
                        Instantiation inst = d.initializer.exp.instance;
                        inst.exp = MkExpIdentifier(CopyIdentifier(GetDeclId(d.declarator)));
                        
                        d.initializer.exp.instance = null;
                        if(decl.specifiers)
                           FreeList(decl.specifiers, FreeSpecifier);
                        FreeList(decl.declarators, FreeInitDeclarator);

                        d = null;

                        decl.type = instDeclaration;
                        decl.inst = inst;
                     }
                  }
               }
               for(subType = type; subType;)
               {
                  if(subType.kind == classType)
                  {
                     declareStruct = true;
                     break;
                  }
                  else if(subType.kind == pointerType)
                     break;
                  else if(subType.kind == arrayType)
                     subType = subType.arrayType;
                  else
                     break;
               }

               FreeType(type);
               if(!d) break;
            }
         }

         if(decl.specifiers)
         {
            Specifier s;
            for(s = decl.specifiers->first; s; s = s.next)
            {
               ProcessSpecifier(s, declareStruct);
            }
         }
         break;
      }
      case instDeclaration:
      {
         ProcessInstantiationType(decl.inst);
         break;
      }
      case structDeclaration:
      {
         Specifier spec;
         Declarator d;
         bool declareStruct = false;

         if(decl.declarators)
         {
            for(d = decl.declarators->first; d; d = d.next)
            {
               Type type = ProcessType(decl.specifiers, d.declarator);
               Type subType;
               ProcessDeclarator(d);
               for(subType = type; subType;)
               {
                  if(subType.kind == classType)
                  {
                     declareStruct = true;
                     break;
                  }
                  else if(subType.kind == pointerType)
                     break;
                  else if(subType.kind == arrayType)
                     subType = subType.arrayType;
                  else
                     break;
               }
               FreeType(type);
            }
         }
         if(decl.specifiers)
         {
            for(spec = decl.specifiers->first; spec; spec = spec.next)
               ProcessSpecifier(spec, declareStruct);
         }
         break;
      }
   }
}

static FunctionDefinition curFunction;

static void CreateFireWatcher(Property prop, Expression object, Statement stmt)
{
   char propName[1024], propNameM[1024];
   char getName[1024], setName[1024];
   OldList * args;

   DeclareProperty(prop, setName, getName);

   // eInstance_FireWatchers(object, prop);
   strcpy(propName, "__ecereProp_");
   FullClassNameCat(propName, prop._class.fullName, false);
   strcat(propName, "_");
   // strcat(propName, prop.name);
   FullClassNameCat(propName, prop.name, true);
   MangleClassName(propName);

   strcpy(propNameM, "__ecerePropM_");
   FullClassNameCat(propNameM, prop._class.fullName, false);
   strcat(propNameM, "_");
   // strcat(propNameM, prop.name);
   FullClassNameCat(propNameM, prop.name, true);
   MangleClassName(propNameM);

   if(prop.isWatchable)
   {
      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
      ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));

      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
      ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireWatchers")), args));
   }

   
   {
      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
      ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args));

      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
      ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args));
   }
   
   if(curFunction.propSet && !strcmp(curFunction.propSet.string, prop.name) && 
      (!object || (object.type == identifierExp && !strcmp(object.identifier.string, "this"))))
      curFunction.propSet.fireWatchersDone = true;
}

static void ProcessStatement(Statement stmt)
{
   yylloc = stmt.loc;
   /*
   lineNum = stmt.pos.line;
   column = stmt.pos.col;
   */
   switch(stmt.type)
   {
      case labeledStmt:
         ProcessStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         // This expression should be constant...
         if(stmt.caseStmt.exp)
         {
            FreeType(stmt.caseStmt.exp.destType);
            stmt.caseStmt.exp.destType = curSwitchType;
            if(curSwitchType) curSwitchType.refCount++;
            ProcessExpressionType(stmt.caseStmt.exp);
            ComputeExpression(stmt.caseStmt.exp);
         }
         if(stmt.caseStmt.stmt)
            ProcessStatement(stmt.caseStmt.stmt);
         break;
      case compoundStmt:
      {
         if(stmt.compound.context)
         {
            Declaration decl;
            Statement s;

            Statement prevCompound = curCompound;
            Context prevContext = curContext;

            if(!stmt.compound.isSwitch)
            {
               curCompound = stmt;
               curContext = stmt.compound.context;
            }

            if(stmt.compound.declarations)
            {
               for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
                  ProcessDeclaration(decl);
            }
            if(stmt.compound.statements)
            {
               for(s = stmt.compound.statements->first; s; s = s.next)
                  ProcessStatement(s);
            }

            curContext = prevContext;
            curCompound = prevCompound;
         }
         break;
      }
      case expressionStmt:
      {
         Expression exp;
         if(stmt.expressions)
         {
            for(exp = stmt.expressions->first; exp; exp = exp.next)
               ProcessExpressionType(exp);
         }
         break;
      }
      case ifStmt:
      {
         Expression exp;

         FreeType(((Expression)stmt.ifStmt.exp->last).destType);
         ((Expression)stmt.ifStmt.exp->last).destType = MkClassType("bool");
         ((Expression)stmt.ifStmt.exp->last).destType.truth = true;
         for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
         {
            ProcessExpressionType(exp);
         }
         if(stmt.ifStmt.stmt)
            ProcessStatement(stmt.ifStmt.stmt);
         if(stmt.ifStmt.elseStmt)
            ProcessStatement(stmt.ifStmt.elseStmt);
         break;
      }
      case switchStmt:
      {
         Type oldSwitchType = curSwitchType;
         if(stmt.switchStmt.exp)
         {
            Expression exp;
            for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
            {
               if(!exp.next)
               {
                  /*
                  Type destType
                  {
                     kind = intType;
                     refCount = 1;
                  };
                  e.exp.destType = destType;
                  */

                  ProcessExpressionType(exp);
               }
               if(!exp.next)
                  curSwitchType = exp.expType;
            }
         }
         ProcessStatement(stmt.switchStmt.stmt);
         curSwitchType = oldSwitchType;
         break;
      }
      case whileStmt:
      {
         if(stmt.whileStmt.exp)
         {
            Expression exp;

            FreeType(((Expression)stmt.whileStmt.exp->last).destType);
            ((Expression)stmt.whileStmt.exp->last).destType = MkClassType("bool");
            ((Expression)stmt.whileStmt.exp->last).destType.truth = true;
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpressionType(exp);
            }
         }
         if(stmt.whileStmt.stmt)
            ProcessStatement(stmt.whileStmt.stmt);
         break;
      }
      case doWhileStmt:
      {
         if(stmt.doWhile.exp)
         {
            Expression exp;

            if(stmt.doWhile.exp->last)
            {
               FreeType(((Expression)stmt.doWhile.exp->last).destType);
               ((Expression)stmt.doWhile.exp->last).destType = MkClassType("bool");
               ((Expression)stmt.doWhile.exp->last).destType.truth = true;
            }
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               ProcessExpressionType(exp);
            }
         }
         if(stmt.doWhile.stmt)
            ProcessStatement(stmt.doWhile.stmt);
         break;
      }
      case forStmt:
      {
         Expression exp;
         if(stmt.forStmt.init)
            ProcessStatement(stmt.forStmt.init);

         if(stmt.forStmt.check && stmt.forStmt.check.expressions)
         {
            FreeType(((Expression)stmt.forStmt.check.expressions->last).destType);
            ((Expression)stmt.forStmt.check.expressions->last).destType = MkClassType("bool");
            ((Expression)stmt.forStmt.check.expressions->last).destType.truth = true;
         }

         if(stmt.forStmt.check)
            ProcessStatement(stmt.forStmt.check);
         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
               ProcessExpressionType(exp);
         }

         if(stmt.forStmt.stmt)
            ProcessStatement(stmt.forStmt.stmt);
         break;
      }
      case forEachStmt:
      {
         Identifier id = stmt.forEachStmt.id;
         OldList * exp = stmt.forEachStmt.exp;
         OldList * filter = stmt.forEachStmt.filter;
         Statement block = stmt.forEachStmt.stmt;
         char iteratorType[1024];
         Type source;
         Expression e;
         bool isBuiltin = exp && exp->last && 
            (((Expression)exp->last).type == ExpressionType::arrayExp || 
              (((Expression)exp->last).type == castExp && ((Expression)exp->last).cast.exp.type == ExpressionType::arrayExp));
         Expression arrayExp;
         char * typeString = null;
         int builtinCount = 0;

         for(e = exp ? exp->first : null; e; e = e.next)
         {
            if(!e.next)
            {
               FreeType(e.destType);
               e.destType = ProcessTypeString("Container", false);
            }
            if(!isBuiltin || e.next)
               ProcessExpressionType(e);
         }

         source = (exp && exp->last) ? ((Expression)exp->last).expType : null;
         if(isBuiltin || (source && source.kind == classType && source._class && source._class.registered && source._class.registered != containerClass &&
            eClass_IsDerived(source._class.registered, containerClass)))
         {
            Class _class = source ? source._class.registered : null;
            Symbol symbol;
            Expression expIt = null;
            bool isMap = false, isArray = false, isLinkList = false, isList = false, isCustomAVLTree = false, isAVLTree = false;
            Class arrayClass = eSystem_FindClass(privateModule, "Array");
            Class linkListClass = eSystem_FindClass(privateModule, "LinkList");
            Class customAVLTreeClass = eSystem_FindClass(privateModule, "CustomAVLTree");
            stmt.type = compoundStmt;
            
            stmt.compound.context = Context { };
            stmt.compound.context.parent = curContext;
            curContext = stmt.compound.context;

            if(source && eClass_IsDerived(source._class.registered, customAVLTreeClass))
            {
               Class mapClass = eSystem_FindClass(privateModule, "Map");
               Class avlTreeClass = eSystem_FindClass(privateModule, "AVLTree");
               isCustomAVLTree = true;
               if(eClass_IsDerived(source._class.registered, avlTreeClass))
                  isAVLTree = true;
               else if(eClass_IsDerived(source._class.registered, mapClass))
                  isMap = true;
            }
            else if(source && eClass_IsDerived(source._class.registered, arrayClass)) isArray = true;
            else if(source && eClass_IsDerived(source._class.registered, linkListClass)) 
            {
               Class listClass = eSystem_FindClass(privateModule, "List");
               isLinkList = true;
               isList = eClass_IsDerived(source._class.registered, listClass);
            }

            if(isArray)
            {
               Declarator decl;
               OldList * specs = MkList();
               decl = SpecDeclFromString(_class.templateArgs[2].dataTypeString, specs, 
                  MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(id)));
               stmt.compound.declarations = MkListOne(
                  MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, null))));
               ListAdd(stmt.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source._class.registered.fullName)),
                  MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalArray")), 
                     MkInitializerAssignment(MkExpBrackets(exp))))));
            }
            else if(isBuiltin)
            {
               Type type = null;
               char typeStringBuf[1024];
               
               // TODO: Merge this code?
               arrayExp = (((Expression)exp->last).type == ExpressionType::arrayExp) ? (Expression)exp->last : ((Expression)exp->last).cast.exp;
               if(((Expression)exp->last).type == castExp)
               {
                  TypeName typeName = ((Expression)exp->last).cast.typeName;
                  if(typeName)
                     arrayExp.destType = ProcessType(typeName.qualifiers, typeName.declarator);
               }

               if(arrayExp.destType && arrayExp.destType.kind == classType && arrayExp.destType._class && arrayExp.destType._class.registered &&
                  arrayExp.destType._class.registered != containerClass && eClass_IsDerived(arrayExp.destType._class.registered, containerClass) &&
                  arrayExp.destType._class.registered.templateArgs)
               {
                  Class templateClass = arrayExp.destType._class.registered;
                  typeString = templateClass.templateArgs[2].dataTypeString;
               }
               else if(arrayExp.list)
               {
                  // Guess type from expressions in the array
                  Expression e;
                  for(e = arrayExp.list->first; e; e = e.next)
                  {
                     ProcessExpressionType(e);
                     if(e.expType)
                     {
                        if(!type) { type = e.expType; type.refCount++; }
                        else
                        {
                           // if(!MatchType(e.expType, type, null, null, null, false, false, false))
                           if(!MatchTypeExpression(e, type, null, false))
                           {
                              FreeType(type);
                              type = e.expType;
                              e.expType = null;
                              
                              e = arrayExp.list->first;
                              ProcessExpressionType(e);
                              if(e.expType)
                              {
                                 //if(!MatchTypes(e.expType, type, null, null, null, false, false, false, false))
                                 if(!MatchTypeExpression(e, type, null, false))
                                 {
                                    FreeType(e.expType);
                                    e.expType = null;
                                    FreeType(type);
                                    type = null;
                                    break;
                                 }                           
                              }
                           }
                        }
                        if(e.expType)
                        {
                           FreeType(e.expType);
                           e.expType = null;
                        }
                     }
                  }
                  if(type)
                  {
                     typeStringBuf[0] = '\0';
                     PrintType(type, typeStringBuf, false, true);
                     typeString = typeStringBuf;
                     FreeType(type);
                  }
               }
               if(typeString)
               {
                  OldList * initializers = MkList();
                  Declarator decl;
                  OldList * specs = MkList();
                  if(arrayExp.list)
                  {
                     Expression e;

                     builtinCount = arrayExp.list->count;
                     type = ProcessTypeString(typeString, false);
                     while(e = arrayExp.list->first)
                     {
                        arrayExp.list->Remove(e);
                        e.destType = type;
                        type.refCount++;
                        ProcessExpressionType(e);
                        ListAdd(initializers, MkInitializerAssignment(e));
                     }
                     FreeType(type);
                     delete arrayExp.list;
                  }
                  decl = SpecDeclFromString(typeString, specs, MkDeclaratorIdentifier(id));
                  stmt.compound.declarations = MkListOne(MkDeclaration(CopyList(specs, CopySpecifier), 
                     MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), /*CopyDeclarator(*/decl/*)*/), null))));

                  ListAdd(stmt.compound.declarations, MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorArray(PlugDeclarator(
                     /*CopyDeclarator(*/decl/*)*/, MkDeclaratorIdentifier(MkIdentifier("__internalArray"))), null), MkInitializerList(initializers)))));
                  
                  FreeList(exp, FreeExpression);
               }
               else
               {
                  arrayExp.expType = ProcessTypeString("Container", false);
                  Compiler_Error($"Couldn't determine type of array elements\n");
               }

               /*
               Declarator decl;
               OldList * specs = MkList();

               decl = SpecDeclFromString(_class.templateArgs[2].dataTypeString, specs, 
                  MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(id)));
               stmt.compound.declarations = MkListOne(
                  MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, null))));
               ListAdd(stmt.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName("BuiltInContainer")),
                  MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(MkIdentifier("__internalArray"))), 
                     MkInitializerAssignment(MkExpBrackets(exp))))));
               */
            }
            else if(isLinkList && !isList)
            {
               Declarator decl;
               OldList * specs = MkList();
               decl = SpecDeclFromString(_class.templateArgs[3].dataTypeString, specs, MkDeclaratorIdentifier(id));
               stmt.compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, null))));
               ListAdd(stmt.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source._class.registered.fullName)),
                  MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalLinkList")), 
                     MkInitializerAssignment(MkExpBrackets(exp))))));
            }
            /*else if(isCustomAVLTree)
            {
               Declarator decl;
               OldList * specs = MkList();
               decl = SpecDeclFromString(_class.templateArgs[3].dataTypeString, specs, MkDeclaratorIdentifier(id));
               stmt.compound.declarations = MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(decl, null))));
               ListAdd(stmt.compound.declarations, MkDeclaration(MkListOne(MkSpecifierName(source._class.registered.fullName)),
                  MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalTree")), 
                     MkInitializerAssignment(MkExpBrackets(exp))))));
            }*/
            else if(_class.templateArgs)
            {
               if(isMap)
                  sprintf(iteratorType, "MapIterator<%s, %s >", _class.templateArgs[5].dataTypeString, _class.templateArgs[6].dataTypeString);
               else
                  sprintf(iteratorType, "Iterator<%s, %s >", _class.templateArgs[2].dataTypeString, _class.templateArgs[1].dataTypeString);

               stmt.compound.declarations = MkListOne(
                  MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)),
                  MkExpIdentifier(id), MkListOne(MkMembersInitList(MkListOne(MkMemberInit(isMap ? MkListOne(MkIdentifier("map")) : null, 
                  MkInitializerAssignment(MkExpBrackets(exp)))))))));
            }
            symbol = FindSymbol(id.string, curContext, curContext, false, false);

            if(block && block.type == compoundStmt && block.compound.context)
            {
               block.compound.context.parent = stmt.compound.context;
            }
            if(filter)
            {
               block = MkIfStmt(filter, block, null);
            }
            if(isArray)
            {
               stmt.compound.statements = MkListOne(MkForStmt(
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array"))))),
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', 
                     MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("array")), '+', MkExpMember(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("count")))))),
                  MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, null)),
                  block));
              ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.init);
              ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.check);
              ProcessExpressionType(((Statement)stmt.compound.statements->first).forStmt.increment->first);
            }
            else if(isBuiltin)
            {
               char count[128];
               //OldList * specs = MkList();
               // Declarator decl = SpecDeclFromString(typeString, specs, MkDeclaratorPointer(MkPointer(null, null), null));

               sprintf(count, "%d", builtinCount);

               stmt.compound.statements = MkListOne(MkForStmt(
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpIdentifier(MkIdentifier("__internalArray"))))),
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', 
                     MkExpOp(MkExpIdentifier(MkIdentifier("__internalArray")), '+', MkExpConstant(count))))),
                  MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, null)),
                  block));

               /*
               Declarator decl = SpecDeclFromString(_class.templateArgs[2].dataTypeString, specs, MkDeclaratorPointer(MkPointer(null, null), null));
               stmt.compound.statements = MkListOne(MkForStmt(
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpPointer(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("data"))))),
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '<', 
                     MkExpOp(MkExpCast(MkTypeName(specs, decl), MkExpPointer(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("data"))), '+', MkExpPointer(MkExpIdentifier(MkIdentifier("__internalArray")), MkIdentifier("count")))))),
                  MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), INC_OP, null)),
                  block));
              */
              ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.init);
              ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.check);
              ProcessExpressionType(((Statement)stmt.compound.statements->first).forStmt.increment->first);
            }
            else if(isLinkList && !isList)
            {
               Class typeClass = eSystem_FindClass(_class.module, _class.templateArgs[3].dataTypeString);
               Class listItemClass = eSystem_FindClass(_class.module, "ListItem");
               if(typeClass && eClass_IsDerived(typeClass, listItemClass) && _class.templateArgs[5].dataTypeString && 
                  !strcmp(_class.templateArgs[5].dataTypeString, "LT::link"))
               {
                  stmt.compound.statements = MkListOne(MkForStmt(
                     MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))),
                     MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))),
                     MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("next")))),
                     block));
               }
               else
               {
                  OldList * specs = MkList();
                  Declarator decl = SpecDeclFromString(_class.templateArgs[3].dataTypeString, specs, null);
                  stmt.compound.statements = MkListOne(MkForStmt(
                     MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("first"))))),
                     MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))),
                     MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpCast(MkTypeName(specs, decl), MkExpCall(
                        MkExpMember(MkExpIdentifier(MkIdentifier("__internalLinkList")), MkIdentifier("GetNext")),
                           MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("IteratorPointer")), null), MkExpIdentifier(CopyIdentifier(id)))))))),
                     block));
               }
               ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.init);
               ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.check);
               ProcessExpressionType(((Statement)stmt.compound.statements->first).forStmt.increment->first);
            }
            /*else if(isCustomAVLTree)
            {
               stmt.compound.statements = MkListOne(MkForStmt(
                  MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpMember(MkExpIdentifier(
                     MkIdentifier("__internalTree")), MkIdentifier("root")), MkIdentifier("minimum"))))),
                  MkExpressionStmt(MkListOne(MkExpIdentifier(CopyIdentifier(id)))),
                  MkListOne(MkExpOp(MkExpIdentifier(CopyIdentifier(id)), '=', MkExpMember(MkExpIdentifier(CopyIdentifier(id)), MkIdentifier("next")))),
                  block));

               ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.init);
               ProcessStatement(((Statement)stmt.compound.statements->first).forStmt.check);
               ProcessExpressionType(((Statement)stmt.compound.statements->first).forStmt.increment->first);
            }*/
            else
            {
               stmt.compound.statements = MkListOne(MkWhileStmt(MkListOne(MkExpCall(MkExpMember(expIt = MkExpIdentifier(CopyIdentifier(id)),
                  MkIdentifier("Next")), null)), block));
            }
            ProcessExpressionType(expIt);
            if(stmt.compound.declarations->first)
               ProcessDeclaration(stmt.compound.declarations->first);

            if(symbol) 
               symbol.isIterator = isMap ? 2 : ((isArray || isBuiltin) ? 3 : (isLinkList ? (isList ? 5 : 4) : (isCustomAVLTree ? 6 : 1)));

            ProcessStatement(stmt);
            curContext = stmt.compound.context.parent;
            break;
         }
         else
         {
            Compiler_Error($"Expression is not a container\n");
         }
         break;
      }
      case gotoStmt:
         break;
      case continueStmt:
         break;
      case breakStmt:
         break;
      case returnStmt:
      {
         Expression exp;
         if(stmt.expressions)
         {
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               if(!exp.next)
               {
                  if(curFunction && !curFunction.type)
                     curFunction.type = ProcessType(
                        curFunction.specifiers, curFunction.declarator);
                  FreeType(exp.destType);
                  exp.destType = (curFunction && curFunction.type && curFunction.type.kind == functionType) ? curFunction.type.returnType : null;
                  if(exp.destType) exp.destType.refCount++;
               }
               ProcessExpressionType(exp);
            }
         }
         break;
      }
      case badDeclarationStmt:
      {
         ProcessDeclaration(stmt.decl);
         break;
      }
      case asmStmt:
      {
         AsmField field;
         if(stmt.asmStmt.inputFields)
         {
            for(field = stmt.asmStmt.inputFields->first; field; field = field.next)
               if(field.expression)
                  ProcessExpressionType(field.expression);
         }
         if(stmt.asmStmt.outputFields)
         {
            for(field = stmt.asmStmt.outputFields->first; field; field = field.next)
               if(field.expression)
                  ProcessExpressionType(field.expression);
         }
         if(stmt.asmStmt.clobberedFields)
         {
            for(field = stmt.asmStmt.clobberedFields->first; field; field = field.next)
            {
               if(field.expression)
                  ProcessExpressionType(field.expression);
            }
         }
         break;
      }
      case watchStmt:
      {
         PropertyWatch propWatch;
         OldList * watches = stmt._watch.watches;
         Expression object = stmt._watch.object;
         Expression watcher = stmt._watch.watcher;
         if(watcher)
            ProcessExpressionType(watcher);
         if(object)
            ProcessExpressionType(object);

         if(inCompiler)
         {
            if(watcher || thisClass)
            {
               External external = curExternal;
               Context context = curContext;

               stmt.type = expressionStmt;
               stmt.expressions = MkList();

               curExternal = external.prev;

               for(propWatch = watches->first; propWatch; propWatch = propWatch.next)
               {
                  ClassFunction func;
                  char watcherName[1024];
                  Class watcherClass = watcher ? 
                     ((watcher.expType && watcher.expType.kind == classType && watcher.expType._class) ? watcher.expType._class.registered : null) : thisClass;
                  External createdExternal;

                  // Create a declaration above
                  External externalDecl = MkExternalDeclaration(null);
                  ast->Insert(curExternal.prev, externalDecl);

                  sprintf(watcherName,"__ecerePropertyWatcher_%d", propWatcherID++);
                  if(propWatch.deleteWatch)
                     strcat(watcherName, "_delete");
                  else
                  {
                     Identifier propID;
                     for(propID = propWatch.properties->first; propID; propID = propID.next)
                     {
                        strcat(watcherName, "_");
                        strcat(watcherName, propID.string);
                     }
                  }

                  if(object && object.expType && object.expType.kind == classType && object.expType._class && object.expType._class.registered)
                  {
                     // TESTING THIS STUFF... BEWARE OF SYMBOL ID ISSUES
                     func = MkClassFunction(MkListOne(MkSpecifier(VOID)), null, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)),
                        //MkListOne(MkTypeName(MkListOne(MkSpecifier(VOID)), null))), null);
                        MkListOne(MkTypeName(MkListOne(MkSpecifierName(object.expType._class.string)), MkDeclaratorIdentifier(MkIdentifier("value"))))), null);
                     ProcessClassFunctionBody(func, propWatch.compound);
                     propWatch.compound = null;

                     //afterExternal = afterExternal ? afterExternal : curExternal;

                     //createdExternal = ProcessClassFunction(watcherClass, func, ast, curExternal.prev);
                     createdExternal = ProcessClassFunction(watcherClass, func, ast, curExternal, true);
                     // TESTING THIS...
                     createdExternal.symbol.idCode = external.symbol.idCode;

                     curExternal = createdExternal;
                     ProcessFunction(createdExternal.function);


                     // Create a declaration above
                     {
                        Declaration decl = MkDeclaration(CopyList(createdExternal.function.specifiers, CopySpecifier), 
                           MkListOne(MkInitDeclarator(CopyDeclarator(createdExternal.function.declarator), null)));
                        externalDecl.declaration = decl;
                        if(decl.symbol && !decl.symbol.pointerExternal)
                           decl.symbol.pointerExternal = externalDecl;
                     }

                     if(propWatch.deleteWatch)
                     {
                        OldList * args = MkList();
                        ListAdd(args, CopyExpression(object));
                        ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                        ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));
                        ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_WatchDestruction")), args));
                     }
                     else
                     {
                        Class _class = object.expType._class.registered;
                        Identifier propID;

                        for(propID = propWatch.properties->first; propID; propID = propID.next)
                        {
                           char propName[1024];
                           Property prop = eClass_FindProperty(_class, propID.string, privateModule);
                           if(prop)
                           {
                              char getName[1024], setName[1024];
                              OldList * args = MkList();

                              DeclareProperty(prop, setName, getName);                              
                              
                              // eInstance_Watch(stmt.watch.object, prop, stmt.watch.watcher, callback);
                              strcpy(propName, "__ecereProp_");
                              FullClassNameCat(propName, prop._class.fullName, false);
                              strcat(propName, "_");
                              // strcat(propName, prop.name);
                              FullClassNameCat(propName, prop.name, true);

                              ListAdd(args, CopyExpression(object));
                              ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
                              ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                              ListAdd(args, MkExpIdentifier(MkIdentifier(watcherName)));

                              ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_Watch")), args));
                           }
                           else
                              Compiler_Error($"Property %s not found in class %s\n", prop.name, _class.fullName);
                        }
                     }
                  }
                  else
                     Compiler_Error($"Invalid watched object\n");
               }

               curExternal = external;
               curContext = context;

               if(watcher)
                  FreeExpression(watcher);
               if(object)
                  FreeExpression(object);
               FreeList(watches, FreePropertyWatch);
            }
            else
               Compiler_Error($"No observer specified and not inside a _class\n");
         }
         else
         {
            for(propWatch = watches->first; propWatch; propWatch = propWatch.next)
            {
               ProcessStatement(propWatch.compound);
            }

         }
         break;
      }
      case fireWatchersStmt:
      {
         OldList * watches = stmt._watch.watches;
         Expression object = stmt._watch.object;
         Class _class;
         // DEBUGGER BUG: Why doesn't watches evaluate to null??
         // printf("%X\n", watches);
         // printf("%X\n", stmt._watch.watches);
         if(object)
            ProcessExpressionType(object);

         if(inCompiler)
         {
            _class = object ? 
                  ((object.expType && object.expType.kind == classType && object.expType._class) ? object.expType._class.registered : null) : thisClass;

            if(_class)
            {
               Identifier propID;

               stmt.type = expressionStmt;
               stmt.expressions = MkList();

               // Check if we're inside a property set
               if(!watches && curFunction.propSet && (!object || (object.type == identifierExp && !strcmp(object.identifier.string, "this"))))
               {
                  watches = MkListOne(MkIdentifier(curFunction.propSet.string));
               }
               else if(!watches)
               {
                  //Compiler_Error($"No property specified and not inside a property set\n");
               }
               if(watches)
               {
                  for(propID = watches->first; propID; propID = propID.next)
                  {
                     Property prop = eClass_FindProperty(_class, propID.string, privateModule);
                     if(prop)
                     {
                        CreateFireWatcher(prop, object, stmt);
                     }
                     else
                        Compiler_Error($"Property %s not found in class %s\n", propID.string, _class.fullName);
                  }
               }
               else
               {
                  // Fire all properties!
                  Property prop;
                  Class base;
                  for(base = _class; base; base = base.base)
                  {
                     for(prop = base.membersAndProperties.first; prop; prop = prop.next)
                     {
                        if(prop.isProperty && prop.isWatchable)
                        {
                           CreateFireWatcher(prop, object, stmt);
                        }
                     }
                  }
               }

               if(object)
                  FreeExpression(object);
               FreeList(watches, FreeIdentifier);
            }
            else
               Compiler_Error($"Invalid object specified and not inside a class\n");
         }
         break;
      }
      case stopWatchingStmt:
      {
         OldList * watches = stmt._watch.watches;
         Expression object = stmt._watch.object;
         Expression watcher = stmt._watch.watcher;
         Class _class;
         if(object)
            ProcessExpressionType(object);
         if(watcher)
            ProcessExpressionType(watcher);
         if(inCompiler)
         {
            _class = (object && object.expType && object.expType.kind == classType && object.expType._class) ? object.expType._class.registered : null;

            if(watcher || thisClass)
            {
               if(_class)
               {
                  Identifier propID;

                  stmt.type = expressionStmt;
                  stmt.expressions = MkList();

                  if(!watches)
                  {
                     OldList * args;
                     // eInstance_StopWatching(object, null, watcher); 
                     args = MkList();
                     ListAdd(args, CopyExpression(object));
                     ListAdd(args, MkExpConstant("0"));
                     ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                     ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
                  }
                  else
                  {
                     for(propID = watches->first; propID; propID = propID.next)
                     {
                        char propName[1024];
                        Property prop = eClass_FindProperty(_class, propID.string, privateModule);
                        if(prop)
                        {
                           char getName[1024], setName[1024];
                           OldList * args = MkList();

                           DeclareProperty(prop, setName, getName);
         
                           // eInstance_StopWatching(object, prop, watcher); 
                           strcpy(propName, "__ecereProp_");
                           FullClassNameCat(propName, prop._class.fullName, false);
                           strcat(propName, "_");
                           // strcat(propName, prop.name);
                           FullClassNameCat(propName, prop.name, true);
                           MangleClassName(propName);

                           ListAdd(args, CopyExpression(object));
                           ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
                           ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                           ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
                        }
                        else
                           Compiler_Error($"Property %s not found in class %s\n", prop.name, _class.fullName);
                     }
                  }

                  if(object)
                     FreeExpression(object);
                  if(watcher)
                     FreeExpression(watcher);
                  FreeList(watches, FreeIdentifier);
               }
               else
                  Compiler_Error($"Invalid object specified and not inside a class\n");
            }
            else
               Compiler_Error($"No observer specified and not inside a class\n");
         }
         break;
      }
   }
}

static void ProcessFunction(FunctionDefinition function)
{
   Identifier id = GetDeclId(function.declarator);
   Symbol symbol = function.declarator ? function.declarator.symbol : null;
   Type type = symbol ? symbol.type : null;
   Class oldThisClass = thisClass;
   Context oldTopContext = topContext;

   yylloc = function.loc;
   // Process thisClass
   
   if(type && type.thisClass)
   {
      Symbol classSym = type.thisClass;
      Class _class = type.thisClass.registered;
      char className[1024];
      char structName[1024];
      Declarator funcDecl;
      Symbol thisSymbol;

      bool typedObject = false;

      if(_class && !_class.base)
      {
         _class = currentClass;
         if(_class && !_class.symbol)
            _class.symbol = FindClass(_class.fullName);
         classSym = _class ? _class.symbol : null;
         typedObject = true;
      }

      thisClass = _class;

      if(inCompiler && _class)
      {
         if(type.kind == functionType)
         {
            if(symbol.type.params.count == 1 && ((Type)symbol.type.params.first).kind == voidType)
            {
               //TypeName param = symbol.type.params.first;
               Type param = symbol.type.params.first;
               symbol.type.params.Remove(param);
               //FreeTypeName(param);
               FreeType(param);
            }
            if(type.classObjectType != classPointer)
            {
               symbol.type.params.Insert(null, MkClassType(_class.fullName));
               symbol.type.staticMethod = true;
               symbol.type.thisClass = null;

               // HIGH DANGER: VERIFYING THIS...
               symbol.type.extraParam = false;
            }
         }

         strcpy(className, "__ecereClass_");
         FullClassNameCat(className, _class.fullName, true);

         MangleClassName(className);

         structName[0] = 0;
         FullClassNameCat(structName, _class.fullName, false);

         // [class] this
         

         funcDecl = GetFuncDecl(function.declarator);
         if(funcDecl)
         {
            if(funcDecl.function.parameters && funcDecl.function.parameters->count == 1)
            {
               TypeName param = funcDecl.function.parameters->first;
               if(param.qualifiers && param.qualifiers->count == 1 && ((Specifier)param.qualifiers->first).specifier == VOID && !param.declarator)
               {
                  funcDecl.function.parameters->Remove(param);
                  FreeTypeName(param);
               }
            }

            // DANGER: Watch for this... Check if it's a Conversion?
            // if((_class.type != bitClass && _class.type != unitClass && _class.type != enumClass) || function != (FunctionDefinition)symbol.externalSet)
            
            // WAS TRYING THIS FOR CONVERSION PROPERTIES ON NOHEAD CLASSES: if((_class.type == structClass) || function != (FunctionDefinition)symbol.externalSet)
            if(!function.propertyNoThis)
            {
               TypeName thisParam;
               
               if(type.classObjectType != classPointer)
               {
                  thisParam = QMkClass(_class.fullName, MkDeclaratorIdentifier(MkIdentifier("this")));
                  if(!funcDecl.function.parameters)
                     funcDecl.function.parameters = MkList();
                  funcDecl.function.parameters->Insert(null, thisParam);
               }

               if(typedObject)
               {
                  if(type.classObjectType != classPointer)
                  {
                     if(type.byReference || _class.type == unitClass || _class.type == systemClass || _class.type == enumClass || _class.type == bitClass)
                        thisParam.declarator = MkDeclaratorPointer(MkPointer(null,null), thisParam.declarator);
                  }

                  thisParam = TypeName
                  {
                     declarator = MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("class")));
                     qualifiers = MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));
                  };
                  funcDecl.function.parameters->Insert(null, thisParam);
               }
            }
         }

         if(symbol && symbol.pointerExternal && symbol.pointerExternal.type == declarationExternal)
         {
            InitDeclarator initDecl = symbol.pointerExternal.declaration.declarators->first;
            funcDecl = GetFuncDecl(initDecl.declarator);
            if(funcDecl)
            {
               if(funcDecl.function.parameters && funcDecl.function.parameters->count == 1)
               {
                  TypeName param = funcDecl.function.parameters->first;
                  if(param.qualifiers && param.qualifiers->count == 1 && ((Specifier)param.qualifiers->first).specifier == VOID && !param.declarator)
                  {
                     funcDecl.function.parameters->Remove(param);
                     FreeTypeName(param);
                  }
               }

               if(type.classObjectType != classPointer)
               {
                  // DANGER: Watch for this... Check if it's a Conversion?
                  if((_class.type != bitClass && _class.type != unitClass && _class.type != enumClass) || function != (FunctionDefinition)symbol.externalSet)
                  {
                     TypeName thisParam = QMkClass(_class.fullName, MkDeclaratorIdentifier(MkIdentifier("this")));

                     if(!funcDecl.function.parameters)
                        funcDecl.function.parameters = MkList();
                     funcDecl.function.parameters->Insert(null, thisParam);
                  }
               }
            }         
         }
      }
      
      // Add this to the context
      if(function.body)
      {
         if(type.classObjectType != classPointer)
         {
            thisSymbol = Symbol
            {
               string = CopyString("this");
               type = classSym ? MkClassType(classSym.string) : null; //_class.fullName);
            };
            function.body.compound.context.symbols.Add((BTNode)thisSymbol);

            if(typedObject && thisSymbol.type)
            {
               thisSymbol.type.classObjectType = ClassObjectType::typedObject;
               thisSymbol.type.byReference = type.byReference;
               /*
               thisSymbol = Symbol { string = CopyString("class") };
               function.body.compound.context.symbols.Add(thisSymbol);
               */
            }
         }
      }

      // Pointer to class data
      
      if(inCompiler && _class && (_class.type == normalClass /*|| _class.type == noHeadClass*/) && type.classObjectType != classPointer)
      {
         DataMember member = null;
         {
            Class base;
            for(base = _class; base && base.type != systemClass; base = base.next)
            {
               for(member = base.membersAndProperties.first; member; member = member.next)
                  if(!member.isProperty)
                     break;
               if(member)
                  break;
            }
         }
         for(member = _class.membersAndProperties.first; member; member = member.next)
            if(!member.isProperty)
               break;
         if(member)
         {
            char pointerName[1024];
   
            Declaration decl;
            Initializer initializer;
            Expression exp, bytePtr;
   
            strcpy(pointerName, "__ecerePointer_");
            FullClassNameCat(pointerName, _class.fullName, false);
            {
               char className[1024];
               strcpy(className, "__ecereClass_");
               FullClassNameCat(className, classSym.string, true);
               MangleClassName(className);

               // Testing This
               DeclareClass(classSym, className);
            }

            // ((byte *) this)
            bytePtr = QBrackets(MkExpCast(QMkType("char", QMkPtrDecl(null)), QMkExpId("this")));

            if(_class.fixed)
            {
               char string[256];
               sprintf(string, "%d", _class.offset);
               exp = QBrackets(MkExpOp(bytePtr, '+', MkExpConstant(string)));
            }
            else
            {
               // ([bytePtr] + [className]->offset)
               exp = QBrackets(MkExpOp(bytePtr, '+',
                  MkExpPointer(QMkExpId(className), MkIdentifier("offset"))));
            }

            // (this ? [exp] : 0)
            exp = QBrackets(QMkExpCond(QMkExpId("this"), exp, MkExpConstant("0")));
            exp.expType = Type
            {
               refCount = 1;
               kind = pointerType;
               type = Type { refCount = 1, kind = voidType };
            };
   
            if(function.body)
            {
               yylloc = function.body.loc;
               // ([structName] *) [exp]
               // initializer = MkInitializerAssignment(MkExpCast(QMkType(structName, QMkPtrDecl(null)), exp));
               initializer = MkInitializerAssignment(
                  MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)), MkDeclaratorPointer(MkPointer(null, null), null)), exp));

               // [structName] * [pointerName] = [initializer];
               // decl = QMkDeclaration(structName, MkInitDeclarator(QMkPtrDecl(pointerName), initializer));

               {
                  Context prevContext = curContext;
                  curContext = function.body.compound.context;

                  decl = MkDeclaration(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)),
                     MkListOne(MkInitDeclarator(QMkPtrDecl(pointerName), initializer)));

                  curContext = prevContext;
               }

               // WHY?
               decl.symbol = null;

               if(!function.body.compound.declarations)
                  function.body.compound.declarations = MkList();
               function.body.compound.declarations->Insert(null, decl);
            }
         }
      }
      

      // Loop through the function and replace undeclared identifiers
      // which are a member of the class (methods, properties or data)
      // by "this.[member]"
   }
   else
      thisClass = null;

   if(id)
   {
      FreeSpecifier(id._class);
      id._class = null;

      if(symbol && symbol.pointerExternal && symbol.pointerExternal.type == declarationExternal)
      {
         InitDeclarator initDecl = symbol.pointerExternal.declaration.declarators->first;
         id = GetDeclId(initDecl.declarator);

         FreeSpecifier(id._class);
         id._class = null;
      }
   }
   if(function.body)
      topContext = function.body.compound.context;
   {
      FunctionDefinition oldFunction = curFunction;
      curFunction = function;
      if(function.body)
         ProcessStatement(function.body);

      // If this is a property set and no firewatchers has been done yet, add one here
      if(inCompiler && function.propSet && !function.propSet.fireWatchersDone)
      {
         Statement prevCompound = curCompound;
         Context prevContext = curContext;

         Statement fireWatchers = MkFireWatchersStmt(null, null);
         if(!function.body.compound.statements) function.body.compound.statements = MkList();
         ListAdd(function.body.compound.statements, fireWatchers);

         curCompound = function.body;
         curContext = function.body.compound.context;

         ProcessStatement(fireWatchers);

         curContext = prevContext;
         curCompound = prevCompound;

      }

      curFunction = oldFunction;
   }

   if(function.declarator)
   {
      ProcessDeclarator(function.declarator);
   }

   topContext = oldTopContext;
   thisClass = oldThisClass;
}

/////////// INSTANTIATIONS / DATA TYPES PASS /////////////////////////////////////////////
static void ProcessClass(OldList definitions, Symbol symbol)
{
   ClassDef def;
   External external = curExternal;
   Class regClass = symbol ? symbol.registered : null;

   // Process all functions
   for(def = definitions.first; def; def = def.next)
   {
      if(def.type == functionClassDef)
      {
         if(def.function.declarator)
            curExternal = def.function.declarator.symbol.pointerExternal;
         else
            curExternal = external;

         ProcessFunction((FunctionDefinition)def.function);
      }
      else if(def.type == declarationClassDef)
      {
         if(def.decl.type == instDeclaration)
         {
            thisClass = regClass;
            ProcessInstantiationType(def.decl.inst);
            thisClass = null;
         }
         // Testing this
         else
         {
            Class backThisClass = thisClass;
            if(regClass) thisClass = regClass;
            ProcessDeclaration(def.decl);
            thisClass = backThisClass;
         }
      }
      else if(def.type == defaultPropertiesClassDef && def.defProperties)
      {
         MemberInit defProperty;

         // Add this to the context
         Symbol thisSymbol = Symbol
         {
            string = CopyString("this");
            type = regClass ? MkClassType(regClass.fullName) : null;
         };
         globalContext.symbols.Add((BTNode)thisSymbol);
         
         for(defProperty = def.defProperties->first; defProperty; defProperty = defProperty.next)
         {
            thisClass = regClass;
            ProcessMemberInitData(defProperty, regClass, null, null, null, null);
            thisClass = null;
         }

         globalContext.symbols.Remove((BTNode)thisSymbol);
         FreeSymbol(thisSymbol);
      }
      else if(def.type == propertyClassDef && def.propertyDef)
      {
         PropertyDef prop = def.propertyDef;

         // Add this to the context
         /*
         Symbol thisSymbol = Symbol { string = CopyString("this"), type = MkClassType(regClass.fullName) };
         globalContext.symbols.Add(thisSymbol);
         */
         
         thisClass = regClass;
         if(prop.setStmt)
         {
            if(regClass)
            {
               Symbol thisSymbol
               {
                  string = CopyString("this");
                  type = MkClassType(regClass.fullName);
               };
               prop.setStmt.compound.context.symbols.Add((BTNode)thisSymbol);
            }

            curExternal = prop.symbol ? prop.symbol.externalSet : null;
            ProcessStatement(prop.setStmt);
         }
         if(prop.getStmt)
         {
            if(regClass)
            {
               Symbol thisSymbol
               {
                  string = CopyString("this");
                  type = MkClassType(regClass.fullName);
               };
               prop.getStmt.compound.context.symbols.Add((BTNode)thisSymbol);
            }

            curExternal = prop.symbol ? prop.symbol.externalGet : null;
            ProcessStatement(prop.getStmt);
         }
         if(prop.issetStmt)
         {
            if(regClass)
            {
               Symbol thisSymbol
               {
                  string = CopyString("this");
                  type = MkClassType(regClass.fullName);
               };
               prop.issetStmt.compound.context.symbols.Add((BTNode)thisSymbol);
            }

            curExternal = prop.symbol ? prop.symbol.externalIsSet : null;
            ProcessStatement(prop.issetStmt);
         }

         thisClass = null;

         /*
         globalContext.symbols.Remove(thisSymbol);
         FreeSymbol(thisSymbol);
         */
      }
      else if(def.type == propertyWatchClassDef && def.propertyWatch)
      {
         PropertyWatch propertyWatch = def.propertyWatch;
        
         thisClass = regClass;
         if(propertyWatch.compound)
         {
            Symbol thisSymbol
            {
               string = CopyString("this");
               type = regClass ? MkClassType(regClass.fullName) : null;
            };

            propertyWatch.compound.compound.context.symbols.Add((BTNode)thisSymbol);

            curExternal = null;
            ProcessStatement(propertyWatch.compound);
         }
         thisClass = null;
      }
   }
}

void ComputeDataTypes()
{
   External external;
   External temp { };
   currentClass = null;

   containerClass = eSystem_FindClass(GetPrivateModule(), "Container");

   temp.symbol = Symbol { id = -1000, idCode = -1000 };

   // WHERE SHOULD THIS GO?
   // curExternal = ast->first;
   ast->Insert(null, temp);

   curExternal = temp;

   DeclareStruct("ecere::com::Class", false);
   DeclareStruct("ecere::com::Instance", false);
   DeclareStruct("ecere::com::Property", false);
   DeclareStruct("ecere::com::DataMember", false);
   DeclareStruct("ecere::com::Method", false);
   DeclareStruct("ecere::com::SerialBuffer", false);
   DeclareStruct("ecere::com::ClassTemplateArgument", false);

   ast->Remove(temp);

   for(external = ast->first; external; external = external.next)
   {
      afterExternal = curExternal = external;
      if(external.type == functionExternal)
      {
         currentClass = external.function._class;
         ProcessFunction(external.function);
      }
      // There shouldn't be any _class member access here anyways...
      else if(external.type == declarationExternal)
      {
         currentClass = null;
         ProcessDeclaration(external.declaration);
      }
      else if(external.type == classExternal)
      {
         ClassDefinition _class = external._class;
         currentClass = external.symbol.registered;
         if(_class.definitions)
         {
            ProcessClass(_class.definitions, _class.symbol);
         }
         if(inCompiler)
         {
            // Free class data...
            ast->Remove(external);
            delete external;
         }
      }
      else if(external.type == nameSpaceExternal)
      {
         thisNameSpace = external.id.string;
      }
   }
   currentClass = null;
   thisNameSpace = null;

   delete temp.symbol;
   delete temp;
}
