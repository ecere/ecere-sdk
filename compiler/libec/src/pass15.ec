import "ecdefs"

// UNTIL IMPLEMENTED IN GRAMMAR
#define ACCESS_CLASSDATA(_class, baseClass) \
   (_class ? ((void *)(((char *)_class.data) + baseClass.offsetClass)) : null)

#define YYLTYPE Location
#include "grammar.h"

extern OldList * ast;
extern int returnCode;
extern Expression parsedExpression;
extern int /*bool*/ yydebug;
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
      bool backOutputLineNumbers = outputLineNumbers;
      outputLineNumbers = false;

      if(exp)
         OutputExpression(exp, f);
      f.Seek(0, start);
      count = strlen(string);
      count += f.Read(string + count, 1, 1023);
      string[count] = '\0';
      delete f;

      outputLineNumbers = backOutputLineNumbers;
   }
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

   if(type1.kind == type2.kind && type1.isLong == type2.isLong)
   {
      switch(type1.kind)
      {
         case _BoolType:
         case charType:
         case shortType:
         case intType:
         case int64Type:
         case intPtrType:
         case intSizeType:
            if(type1.passAsTemplate && !type2.passAsTemplate)
               return true;
            return type1.isSigned != type2.isSigned;
         case classType:
            return type1._class != type2._class;
         case pointerType:
            return (type1.type && type2.type && type1.type.constant != type2.type.constant) || NeedCast(type1.type, type2.type);
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
            if(!ctx) break;   // This happened opening old mapTileCache.ec from archives?
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
                        Expression argExp = GetTemplateArgExpByName(param.name, null, _class, TemplateParameterType::expression);

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
   if(result > MAXINT)
      sprintf(temp, FORMAT64HEX /*"0x%I64XLL"*/, result);
   else
      sprintf(temp, FORMAT64D /*"%I64d"*/, result);
   if(result > MAXINT || result < MININT)
      strcat(temp, "LL");
   return CopyString(temp);
}

public char * PrintUInt(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64X"*/, result);
   else if(result > MAXINT)
      sprintf(temp, FORMAT64HEX /*"0x%I64X"*/, result);
   else
      sprintf(temp, FORMAT64D /*"%I64d"*/, result);
   return CopyString(temp);
}

public char *  PrintInt64(int64 result)
{
   char temp[100];
   if(result > MAXINT || result < MININT)
      sprintf(temp, FORMAT64DLL /*"%I64d"*/, result);
   else
      sprintf(temp, FORMAT64D /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintUInt64(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEXLL /*"0x%I64XLL"*/, result);
   else if(result > MAXINT)
      sprintf(temp, FORMAT64HEX /*"0x%I64XLL"*/, result);
   else
      sprintf(temp, FORMAT64D /*"%I64d"*/, result);
   return CopyString(temp);
}

public char * PrintHexUInt(uint64 result)
{
   char temp[100];
   if(result > MAXDWORD)
      sprintf(temp, FORMAT64HEX /*"0x%I64xLL"*/, result);
   else
      sprintf(temp, FORMAT64HEX /*"0x%I64x"*/, result);
   if(result > MAXDWORD)
      strcat(temp, "LL");
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
      sprintf(temp, "%d", (int)result);
   return CopyString(temp);
}

public char * PrintChar(char result)
{
   char temp[100];
   if(result > 0 && isprint(result))
      sprintf(temp, "'%c'", result);
   else if(result < 0)
      sprintf(temp, "%d", (int)result);
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
   if(result.isInf)
   {
      if(result.signBit)
         strcpy(temp, "-inf");
      else
         strcpy(temp, "inf");
   }
   else if(result.isNan)
   {
      if(result.signBit)
         strcpy(temp, "-nan");
      else
         strcpy(temp, "nan");
   }
   else
      sprintf(temp, "%.16ff", result);
   return CopyString(temp);
}

public char * PrintDouble(double result)
{
   char temp[350];
   if(result.isInf)
   {
      if(result.signBit)
         strcpy(temp, "-inf");
      else
         strcpy(temp, "inf");
   }
   else if(result.isNan)
   {
      if(result.signBit)
         strcpy(temp, "-nan");
      else
         strcpy(temp, "nan");
   }
   else
      sprintf(temp, "%.16f", result);
   return CopyString(temp);
}

////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////

//public Operand GetOperand(Expression exp);

#define GETVALUE(name, t) \
   public bool GetOp##name(Operand op2, t * value2) \
   {                                                        \
      if(op2.kind == intType && op2.type.isSigned) *value2 = (t) op2.i; \
      else if(op2.kind == intType) *value2 = (t) op2.ui;                 \
      else if(op2.kind == int64Type && op2.type.isSigned) *value2 = (t) op2.i64; \
      else if(op2.kind == int64Type) *value2 = (t) op2.ui64;                 \
      else if(op2.kind == intSizeType && op2.type.isSigned) *value2 = (t) op2.i64; \
      else if(op2.kind == intSizeType) *value2 = (t) op2.ui64; \
      else if(op2.kind == intPtrType && op2.type.isSigned) *value2 = (t) op2.i64; \
      else if(op2.kind == intPtrType) *value2 = (t) op2.ui64;                 \
      else if(op2.kind == shortType && op2.type.isSigned) *value2 = (t) op2.s;   \
      else if(op2.kind == shortType) *value2 = (t) op2.us;                        \
      else if(op2.kind == charType && op2.type.isSigned) *value2 = (t) op2.c;    \
      else if(op2.kind == _BoolType || op2.kind == charType) *value2 = (t) op2.uc; \
      else if(op2.kind == floatType) *value2 = (t) op2.f;                         \
      else if(op2.kind == doubleType) *value2 = (t) op2.d;                        \
      else if(op2.kind == pointerType) *value2 = (t) op2.ui64;                    \
      else                                                                          \
         return false;                                                              \
      return true;                                                                  \
   } \
   public bool Get##name(Expression exp, t * value2) \
   {                                                        \
      Operand op2 = GetOperand(exp);                        \
      return GetOp##name(op2, value2); \
   }

// To help the debugger currently not preprocessing...
#define HELP(x) x

GETVALUE(Int, HELP(int));
GETVALUE(UInt, HELP(unsigned int));
GETVALUE(Int64, HELP(int64));
GETVALUE(UInt64, HELP(uint64));
GETVALUE(IntPtr, HELP(intptr));
GETVALUE(UIntPtr, HELP(uintptr));
GETVALUE(IntSize, HELP(intsize));
GETVALUE(UIntSize, HELP(uintsize));
GETVALUE(Short, HELP(short));
GETVALUE(UShort, HELP(unsigned short));
GETVALUE(Char, HELP(char));
GETVALUE(UChar, HELP(unsigned char));
GETVALUE(Float, HELP(float));
GETVALUE(Double, HELP(double));

void ComputeExpression(Expression exp);

void ComputeClassMembers(Class _class, bool isMember)
{
   DataMember member = isMember ? (DataMember) _class : null;
   Context context = isMember ? null : SetupTemplatesContext(_class);
   if(member || ((_class.type == bitClass || _class.type == normalClass || _class.type == structClass || _class.type == noHeadClass) &&
                 (_class.type == bitClass || (!_class.structSize || _class.structSize == _class.offset)) && _class.computeSize))
   {
      int unionMemberOffset = 0;
      int bitFields = 0;

      /*
      if(!member && (_class.type == structClass || _class.type == normalClass || _class.type == noHeadClass) && _class.memberOffset && _class.memberOffset > _class.base.structSize)
         _class.memberOffset = (_class.base && _class.base.type != systemClass) ? _class.base.structSize : 0;
      */

      if(member)
      {
         member.memberOffset = 0;
         if(targetBits < sizeof(void *) * 8)
            member.structAlignment = 0;
      }
      else if(targetBits < sizeof(void *) * 8)
         _class.structAlignment = 0;

      // Confusion here: non struct classes seem to have their memberOffset restart at 0 at each hierarchy level
      if(!member && ((_class.type == normalClass || _class.type == noHeadClass) || (_class.type == structClass && _class.memberOffset && _class.memberOffset > _class.base.structSize)))
         _class.memberOffset = (_class.base && _class.type == structClass) ? _class.base.structSize : 0;

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
                  if(bitMember.pos + bitMember.size > _class.typeSize * 8 || bitMember.pos == 64)
                  {
                     if(inCompiler)
                        Compiler_Error("overflowing bits in %s: bit class member %s at position %d\n",
                           _class.name, bitMember.name,bitMember.pos, "\n");
                     else
                        PrintLn("overflowing bits in ", _class.name, ": bit class member ",
                           bitMember.name, " at position ", bitMember.pos);
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
                  int alignment;

                  ComputeClassMembers((Class)dataMember, true);
                  alignment = dataMember.structAlignment;

                  if(isMember)
                  {
                     if(alignment)
                     {
                        if(member.memberOffset % alignment)
                           member.memberOffset += alignment - (member.memberOffset % alignment);

                        member.structAlignment = Max(member.structAlignment, alignment);
                     }
                     dataMember.offset = member.memberOffset;
                     if(member.type == unionMember)
                        unionMemberOffset = Max(unionMemberOffset, dataMember.memberOffset);
                     else
                        member.memberOffset += dataMember.memberOffset;
                  }
                  else
                  {
                     if(alignment)
                     {
                        if(_class.memberOffset % alignment)
                           _class.memberOffset += alignment - (_class.memberOffset % alignment);
                        _class.structAlignment = Max(_class.structAlignment, alignment);
                     }
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
            int extra = 0;
            if(_class.structAlignment)
            {
               if(_class.memberOffset % _class.structAlignment)
                  extra += _class.structAlignment - (_class.memberOffset % _class.structAlignment);
            }
            _class.structSize = (_class.base ? (_class.base.templateClass ?
               (/*_class.base.type == noHeadClass ? _class.base.templateClass.memberOffset : */_class.base.templateClass.structSize) :
                  (/*_class.base.type == noHeadClass ? _class.base.memberOffset : */_class.base.structSize) ) : 0) + _class.memberOffset + extra;
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
                     deriv.offset = /*_class.offset + */(_class.type == noHeadClass ? _class.structSize /*memberOffset*/ : _class.structSize);
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
         case _BoolType: type.alignment = size = sizeof(char); break;   // Assuming 1 byte _Bool
         case charType: type.alignment = size = sizeof(char); break;
         case intType: type.alignment = size = sizeof(int); break;
         case int64Type: type.alignment = size = sizeof(int64); break;
         case intPtrType: type.alignment = size = targetBits / 8; type.pointerAlignment = true; break;
         case intSizeType: type.alignment = size = targetBits / 8; type.pointerAlignment = true; break;
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
               type.pointerAlignment = (bool)_class.pointerAlignment;
               size = _class.structSize;
               if(type.alignment && size % type.alignment)
                  size += type.alignment - (size % type.alignment);

            }
            else if(_class && (_class.type == unitClass ||
                   _class.type == enumClass ||
                   _class.type == bitClass ||
                   _class.type == systemClass))
            {
               if(!_class.dataType)
                  _class.dataType = ProcessTypeString(_class.dataTypeString, false);
               size = type.alignment = ComputeTypeSize(_class.dataType);
            }
            else
            {
               size = type.alignment = targetBits / 8; // sizeof(Instance *);
               type.pointerAlignment = true;
            }
            break;
         }
         case pointerType: case subClassType: size = type.alignment = targetBits / 8; /*sizeof(void *); */ type.pointerAlignment = true; break;
         case arrayType:
            if(type.arraySizeExp)
            {
               ProcessExpressionType(type.arraySizeExp);
               ComputeExpression(type.arraySizeExp);
               if(!type.arraySizeExp.isConstant || (type.arraySizeExp.expType && type.arraySizeExp.expType.kind != intType &&
                  type.arraySizeExp.expType.kind != shortType &&
                  type.arraySizeExp.expType.kind != charType &&
                  type.arraySizeExp.expType.kind != longType &&
                  type.arraySizeExp.expType.kind != int64Type &&
                  type.arraySizeExp.expType.kind != intSizeType &&
                  type.arraySizeExp.expType.kind != intPtrType &&
                  type.arraySizeExp.expType.kind != enumType &&
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
            }
            else if(type.enumClass)
            {
               if(type.enumClass && type.enumClass.registered && type.enumClass.registered.type == enumClass)
               {
                  type.arraySize = (int)eClass_GetProperty(type.enumClass.registered, "enumSize");
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
            if(type.type)
            {
               type.alignment = type.type.alignment;
               type.pointerAlignment = type.type.pointerAlignment;
            }

            break;
         case structType:
         {
            if(!type.members.first && type.enumName)
            {
               Symbol symbol = FindStruct(curContext, type.enumName);
               if(symbol && symbol.type)
               {
                  ComputeTypeSize(symbol.type);
                  size = symbol.type.size;
               }
            }
            else
            {
               Type member;
               for(member = type.members.first; member; member = member.next)
               {
                  uint addSize = ComputeTypeSize(member);

                  member.offset = size;
                  if(member.alignment && size % member.alignment)
                     member.offset += member.alignment - (size % member.alignment);
                  size = member.offset;

                  if(member.pointerAlignment && type.size <= 4)
                     type.pointerAlignment = true;
                  else if(!member.pointerAlignment && member.alignment >= 8)
                     type.pointerAlignment = false;

                  type.alignment = Max(type.alignment, member.alignment);
                  size += addSize;
               }
               if(type.alignment && size % type.alignment)
                  size += type.alignment - (size % type.alignment);
            }
            break;
         }
         case unionType:
         {
            if(!type.members.first && type.enumName)
            {
               Symbol symbol = FindStruct(curContext, type.enumName);
               if(symbol && symbol.type)
               {
                  ComputeTypeSize(symbol.type);
                  size = symbol.type.size;
                  type.alignment = symbol.type.alignment;
               }
            }
            else
            {
               Type member;
               for(member = type.members.first; member; member = member.next)
               {
                  uint addSize = ComputeTypeSize(member);

                  member.offset = size;
                  if(member.alignment && size % member.alignment)
                     member.offset += member.alignment - (size % member.alignment);
                  size = member.offset;

                  if(member.pointerAlignment && type.size <= 4)
                     type.pointerAlignment = true;
                  else if(!member.pointerAlignment && member.alignment >= 8)
                     type.pointerAlignment = false;

                  type.alignment = Max(type.alignment, member.alignment);

                  size = Max(size, addSize);
               }
               if(type.alignment && size % type.alignment)
                  size += type.alignment - (size % type.alignment);
            }
            break;
         }
         case templateType:
         {
            TemplateParameter param = type.templateParameter;
            Type baseType = ProcessTemplateParameterType(param);
            if(baseType)
            {
               size = ComputeTypeSize(baseType);
               type.alignment = baseType.alignment;
               type.pointerAlignment = baseType.pointerAlignment;
            }
            else
               type.alignment = size = sizeof(uint64);
            break;
         }
         case enumType:
         {
            type.alignment = size = sizeof(enum { test });
            break;
         }
         case thisClassType:
         {
            type.alignment = size = targetBits / 8; //sizeof(void *);
            type.pointerAlignment = true;
            break;
         }
      }
      type.size = size;
      type.computing = false;
   }
   return size;
}


/*static */int AddMembers(External neededBy, OldList * declarations, Class _class, bool isMember, uint * retSize, Class topClass, bool *addedPadding)
{
   // This function is in need of a major review when implementing private members etc.
   DataMember topMember = isMember ? (DataMember) _class : null;
   uint totalSize = 0;
   uint maxSize = 0;
   int alignment;
   uint size;
   static int paddingID = 0;   // WARNING: not thread-safe
   DataMember member;
   int anonID = 1;
   Context context = isMember ? null : SetupTemplatesContext(_class);
   if(addedPadding)
      *addedPadding = false;

   paddingID++;
   if(!isMember && _class.base)
   {
      maxSize = _class.structSize;
      //if(_class.base.type != systemClass) // Commented out with new Instance _class
      {
         // DANGER: Testing this noHeadClass here...
         if(_class.type == structClass || _class.type == noHeadClass)
            /*totalSize = */AddMembers(neededBy, declarations, _class.base, false, &totalSize, topClass, null);
         else
         {
            uint baseSize = _class.base.templateClass ? _class.base.templateClass.structSize : _class.base.structSize;
            if(maxSize > baseSize)
               maxSize -= baseSize;
            else
               maxSize = 0;
         }
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
                     DeclareType(neededBy, member.dataType, true, false);
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
               char id[100];
               sprintf(id, "__anon%d", anonID++);

               size = 0;
               AddMembers(neededBy, list, (Class)member, true, &size, topClass, null);
               ListAdd(specs,
                  MkStructOrUnion((member.type == unionMember)?unionSpecifier:structSpecifier, null, list));
               ListAdd(declarations, MkClassDefDeclaration(MkStructDeclaration(specs, MkListOne(MkDeclaratorIdentifier(MkIdentifier(id))),null)));
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
   /*else */if(totalSize < maxSize && _class.type != systemClass)
   {
      int autoPadding = 0;
      if(!isMember && _class.structAlignment && totalSize % _class.structAlignment)
         autoPadding = _class.structAlignment - (totalSize % _class.structAlignment);
      if(totalSize + autoPadding < maxSize)
      {
         char sizeString[50];
         String paddingString = PrintString("__ecere_padding", paddingID);
         sprintf(sizeString, "%d", maxSize - totalSize);
         ListAdd(declarations,
            MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(CHAR)),
            MkListOne(MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier(paddingString)), MkExpConstant(sizeString))), null)));
         if(addedPadding)
            *addedPadding = true;
         delete paddingString;
      }
   }
   if(context)
      FinishTemplatesContext(context);
   paddingID--;
   return topMember ? topMember.memberID : _class.memberID;
}

static int DeclareMembers(External neededBy, Class _class, bool isMember)
{
   DataMember topMember = isMember ? (DataMember) _class : null;
   DataMember member;
   Context context = isMember ? null : SetupTemplatesContext(_class);

   if(!isMember && (_class.type == structClass || _class.type == noHeadClass) && _class.base.type != systemClass)
      DeclareMembers(neededBy, _class.base, false);

   for(member = isMember ? topMember.members.first : _class.membersAndProperties.first; member; member = member.next)
   {
      if(!member.isProperty)
      {
         switch(member.type)
         {
            case normalMember:
            {
               if(!member.dataType && member.dataTypeString)
                  member.dataType = ProcessTypeString(member.dataTypeString, false);
               if(member.dataType)
                  DeclareType(neededBy, member.dataType, true, false);
               break;
            }
            case unionMember:
            case structMember:
            {
               DeclareMembers(neededBy, (Class)member, true);
               break;
            }
         }
      }
   }
   if(context)
      FinishTemplatesContext(context);

   return topMember ? topMember.memberID : _class.memberID;
}

static void IdentifyAnonStructs(OldList/*<ClassDef>*/ *  definitions)
{
   ClassDef def;
   int anonID = 1;
   for(def = definitions->first; def; def = def.next)
   {
      if(def.type == declarationClassDef)
      {
         Declaration decl = def.decl;
         if(decl && decl.specifiers)
         {
            Specifier spec;
            bool isStruct = false;
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               if(spec.type == structSpecifier || spec.type == unionSpecifier)
               {
                  if(spec.definitions)
                     IdentifyAnonStructs(spec.definitions);
                  isStruct = true;
               }
            }
            if(isStruct)
            {
               Declarator d = null;
               if(decl.declarators)
               {
                  for(d = decl.declarators->first; d; d = d.next)
                  {
                     Identifier idDecl = GetDeclId(d);
                     if(idDecl)
                        break;
                  }
               }
               if(!d)
               {
                  char id[100];
                  sprintf(id, "__anon%d", anonID++);
                  if(!decl.declarators)
                     decl.declarators = MkList();
                  ListAdd(decl.declarators, MkDeclaratorIdentifier(MkIdentifier(id)));
               }
            }
         }
      }
   }
}

External DeclareStruct(External neededBy, const char * name, bool skipNoHead, bool needDereference)
{
   return _DeclareStruct(neededBy, name, skipNoHead, needDereference, false);
}

External _DeclareStruct(External neededBy, const char * name, bool skipNoHead, bool needDereference, bool fwdDecl)
{
   External external = null;
   Symbol classSym = FindClass(name);
   OldList * curDeclarations = null;

   if(!inCompiler || !classSym) return null;

   // We don't need any declaration for bit classes...
   if(classSym.registered &&
      (classSym.registered.type == bitClass || classSym.registered.type == unitClass || classSym.registered.type == enumClass))
      return null;

   if(!classSym.registered || (classSym.registered.type == normalClass && classSym.registered.structSize && classSym.registered.base && classSym.registered.base.base))
      _DeclareStruct(neededBy, "ecere::com::Instance", false, true, fwdDecl);

   external = classSym.structExternal;

   if(external && external.declaration)
   {
      Specifier spec;
      for(spec = external.declaration.specifiers ? external.declaration.specifiers->first : null; spec; spec = spec.next)
         if(spec.type == structSpecifier || spec.type == unionSpecifier)
         {
            curDeclarations = spec.definitions;
            break;
         }
   }

   if(classSym.registered && !classSym.declaring && classSym.imported && (!classSym.declaredStructSym || (classSym.registered.type == noHeadClass && !skipNoHead && external && !curDeclarations)))
   {
      OldList * specifiers, * declarators;
      OldList * declarations = null;
      char structName[1024];
      bool addedPadding = false;
      Specifier curSpec = null;

      classSym.declaring++;

      if(strchr(classSym.string, '<'))
      {
         if(classSym.registered.templateClass)
            external = _DeclareStruct(neededBy, classSym.registered.templateClass.fullName, skipNoHead, needDereference, fwdDecl);
         classSym.declaring--;
         return external;
      }

      structName[0] = 0;
      FullClassNameCat(structName, name, false);

      classSym.declaredStructSym = true;
      if(!external || (classSym.registered.type == noHeadClass && !skipNoHead && !curDeclarations))
      {
         bool add = false;
         if(!external)
         {
            external = MkExternalDeclaration(null);
            classSym.structExternal = external;
            external.symbol = classSym;

            add = true;
         }

         if(!skipNoHead)
         {
            declarations = MkList();
            AddMembers(external, declarations, classSym.registered, false, null, classSym.registered, &addedPadding);
         }

         if(external.declaration)
         {
            Specifier spec;
            for(spec = external.declaration.specifiers ? external.declaration.specifiers->first : null; spec; spec = spec.next)
               if(spec.type == structSpecifier || spec.type == unionSpecifier)
               {
                  curSpec = spec;
                  curDeclarations = spec.definitions;
                  break;
               }
         }

         if(declarations && (!declarations->count || (declarations->count == 1 && addedPadding)) && classSym.registered.type != structClass)
         {
            FreeList(declarations, FreeClassDef);
            declarations = null;
         }

         if(classSym.registered.type != noHeadClass && !declarations)
         {
            FreeExternal(external);
            external = null;
            classSym.structExternal = null;
         }
         else
         {
            if(curSpec)
               curSpec.definitions = declarations;
            else
            {
               specifiers = MkList();
               declarators = MkList();
               ListAdd(specifiers, MkStructOrUnion(structSpecifier, MkIdentifier(structName), declarations));
               external.declaration = MkDeclaration(specifiers, declarators);
            }
            if(add)
               ast->Add(external);
         }
      }
      classSym.declaring--;
   }
   else if(!classSym.declaredStructSym && classSym.structExternal)
   {
      classSym.declaredStructSym = true;

      if(classSym.registered)
         DeclareMembers(classSym.structExternal, classSym.registered, false);

      if(classSym.structExternal.declaration && classSym.structExternal.declaration.specifiers)
      {
         Specifier spec;
         for(spec = classSym.structExternal.declaration.specifiers->first; spec; spec = spec.next)
         {
            if(spec.definitions)
               IdentifyAnonStructs(spec.definitions);
         }
      }
   }
   if(inCompiler && neededBy && (external || !classSym.imported))
   {
      if(!external)
      {
         classSym.structExternal = external = MkExternalDeclaration(null);
         external.symbol = classSym;
         ast->Add(external);
      }
      if(reachedPass15 && !external.declaration && classSym.registered && classSym.registered.type == noHeadClass)
      {
         // Declare nohead classes without definitions here (e.g. IteratorPointer)
         char structName[1024];
         OldList * specifiers, * declarators;
         structName[0] = 0;
         FullClassNameCat(structName, name, false);
         specifiers = MkList();
         declarators = MkList();
         ListAdd(specifiers, MkStructOrUnion(structSpecifier, MkIdentifier(structName), null));
         external.declaration = MkDeclaration(specifiers, declarators);
      }
      if(fwdDecl)
      {
         External e = external.fwdDecl ? external.fwdDecl : external;
         if(e.incoming.count)
            neededBy.CreateUniqueEdge(e, !needDereference && !external.fwdDecl);
      }
      else
         neededBy.CreateUniqueEdge(external, !needDereference);
   }
   return external;
}

void DeclareProperty(External neededBy, Property prop, char * setName, char * getName)
{
   Symbol symbol = prop.symbol;
   bool imported = false;
   bool dllImport = false;
   External structExternal = null;
   External instExternal = null;

   strcpy(setName, "__ecereProp_");
   FullClassNameCat(setName, prop._class.fullName, false);
   strcat(setName, "_Set_");
   FullClassNameCat(setName, prop.name, true);

   strcpy(getName, "__ecereProp_");
   FullClassNameCat(getName, prop._class.fullName, false);
   strcat(getName, "_Get_");
   FullClassNameCat(getName, prop.name, true);

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
      // Ugly work around for isNan properties declared within float/double classes which are initialized with ecereCOM
      if((prop._class.module != privateModule || !strcmp(prop._class.name, "float") || !strcmp(prop._class.name, "double")) &&
         prop._class.module.importType != staticImport)
         dllImport = true;
   }

   if(!symbol.type)
   {
      Context context = SetupTemplatesContext(prop._class);
      symbol.type = ProcessTypeString(prop.dataTypeString, false);
      FinishTemplatesContext(context);
   }

   if((prop.Get && !symbol.externalGet) || (prop.Set && !symbol.externalSet))
   {
      if(prop._class.type == normalClass && prop._class.structSize)
         instExternal = DeclareStruct(null, "ecere::com::Instance", false, true);
      structExternal = DeclareStruct(null, prop._class.fullName, prop._class.type != structClass /*true*/, false);
   }

   // Get
   if(prop.Get && !symbol.externalGet)
   {
      Declaration decl;
      OldList * specifiers, * declarators;
      Declarator d;
      OldList * params;
      Specifier spec = null;
      External external;
      Declarator typeDecl;
      bool simple = false;
      bool needReference;

      specifiers = MkList();
      declarators = MkList();
      params = MkList();

      ListAdd(params, MkTypeName(MkListOne(MkSpecifierName(prop._class.fullName)),
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
      needReference = !typeDecl || typeDecl.type == identifierDeclarator;
      for(spec = specifiers->first; spec; spec = spec.next)
      {
         if(spec.type == nameSpecifier)
         {
            Symbol classSym = spec.symbol;
            if(needReference)
            {
               symbol._class = classSym.registered;
               if(classSym.registered && classSym.registered.type == structClass)
                  simple = true;
            }
            break;
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

      if(structExternal)
         external.CreateEdge(structExternal, false);
      if(instExternal)
         external.CreateEdge(instExternal, false);

      if(spec)
         DeclareStruct(external, spec.name, false, needReference);

      ast->Add(external);
      external.symbol = symbol;
      symbol.externalGet = external;

      ReplaceThisClassSpecifiers(specifiers, prop._class);

      if(typeDecl)
         FreeDeclarator(typeDecl);
   }

   // Set
   if(prop.Set && !symbol.externalSet)
   {
      Declaration decl;
      OldList * specifiers, * declarators;
      Declarator d;
      OldList * params;
      Specifier spec = null;
      External external;
      Declarator typeDecl;
      bool needReference;

      declarators = MkList();
      params = MkList();

      if(!prop.conversion || prop._class.type == structClass)
      {
         ListAdd(params, MkTypeName(MkListOne(MkSpecifierName(prop._class.fullName)),
            MkDeclaratorIdentifier(MkIdentifier("this"))));
      }

      specifiers = MkList();

      {
         Context context = SetupTemplatesContext(prop._class);
         typeDecl = d = SpecDeclFromString(prop.dataTypeString, specifiers,
            MkDeclaratorIdentifier(MkIdentifier("value")));
         FinishTemplatesContext(context);
      }
      if(!strcmp(prop._class.base.fullName, "eda::Row") || !strcmp(prop._class.base.fullName, "eda::Id"))
         specifiers->Insert(null, MkSpecifier(CONST));

      ListAdd(params, MkTypeName(specifiers, d));

      d = MkDeclaratorIdentifier(MkIdentifier(setName));
      if(dllImport)
         d = MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), d));
      d = MkDeclaratorFunction(d, params);

      // Make sure the simple _class's type is declared
      needReference = !typeDecl || typeDecl.type == identifierDeclarator;
      for(spec = specifiers->first; spec; spec = spec.next)
      {
         if(spec.type == nameSpecifier)
         {
            Symbol classSym = spec.symbol;
            if(needReference)
               symbol._class = classSym.registered;
            break;
         }
      }

      ListAdd(declarators, MkInitDeclarator(d, null));

      specifiers = MkList();
      if(dllImport)
         specifiers->Insert(null, MkSpecifier(EXTERN));
      else if(prop._class.symbol && ((Symbol)prop._class.symbol).isStatic)
         specifiers->Insert(null, MkSpecifier(STATIC));

      if(!prop.conversion || prop._class.type == structClass)
         ListAdd(specifiers, MkSpecifier(VOID));
      else
         ListAdd(specifiers, MkSpecifierName(prop._class.fullName));

      decl = MkDeclaration(specifiers, declarators);

      external = MkExternalDeclaration(decl);

      if(structExternal)
         external.CreateEdge(structExternal, false);
      if(instExternal)
         external.CreateEdge(instExternal, false);

      if(spec)
         DeclareStruct(external, spec.name, false, needReference);

      ast->Add(external);
      external.symbol = symbol;
      symbol.externalSet = external;

      ReplaceThisClassSpecifiers(specifiers, prop._class);
   }

   // Property (for Watchers)
   if(!symbol.externalPtr)
   {
      Declaration decl;
      External external;
      OldList * specifiers = MkList();
      char propName[1024];

      if(imported)
         specifiers->Insert(null, MkSpecifier(EXTERN));
      else
      {
         specifiers->Insert(null, MkSpecifier(STATIC));
         specifiers->Add(MkSpecifierExtended(MkExtDeclAttrib(MkAttrib(ATTRIB, MkListOne(MkAttribute(CopyString("unused"), null))))));
      }

      ListAdd(specifiers, MkSpecifierName("Property"));

      strcpy(propName, "__ecereProp_");
      FullClassNameCat(propName, prop._class.fullName, false);
      strcat(propName, "_");
      FullClassNameCat(propName, prop.name, true);

      {
         OldList * list = MkList();
         ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(propName)), null));

         if(!imported)
         {
            strcpy(propName, "__ecerePropM_");
            FullClassNameCat(propName, prop._class.fullName, false);
            strcat(propName, "_");
            FullClassNameCat(propName, prop.name, true);

            ListAdd(list, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(propName)), null));
         }
         decl = MkDeclaration(specifiers, list);
      }

      external = MkExternalDeclaration(decl);
      ast->Insert(curExternal.prev, external);
      external.symbol = symbol;
      symbol.externalPtr = external;
   }

   if(inCompiler && neededBy)
   {
      // Could improve this to create edge on only what is needed...
      if(symbol.externalPtr)
         neededBy.CreateUniqueEdge(symbol.externalPtr, false);

      if(symbol.externalGet)
         neededBy.CreateUniqueEdge(symbol.externalGet, symbol.externalGet.type == functionExternal);

      if(symbol.externalSet)
         neededBy.CreateUniqueEdge(symbol.externalSet, symbol.externalSet.type == functionExternal);

      // IsSet ?
   }
}

// ***************** EXPRESSION PROCESSING ***************************
public Type Dereference(Type source)
{
   Type type = null;
   if(source)
   {
      if(source.isVector)
      {
         type = { refCount = 1 };
         CopyTypeInto(type, source);
         type.isVector = false;
      }
      else if(source.kind == pointerType || source.kind == arrayType)
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
            memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
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
               bool constant = type.constant;
               // FreeType(type);
               type = ProcessTypeString(arg.dataTypeString, false);
               if(type.kind == classType && constant) type.constant = true;
               else if(type.kind == pointerType)
               {
                  Type t = type.type;
                  while(t.kind == pointerType) t = t.type;
                  if(constant) t.constant = constant;
               }
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
                        delete string;

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
         else if(!MatchTypes(member.initializer.exp.expType, type, null, null, _class, true, true, false, false, true))
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
      Symbol classSym;
      Class _class;

      classSym = inst._class.symbol;
      _class = classSym ? classSym.registered : null;

      if(ast && (!_class || _class.type != noHeadClass))
         DeclareStruct(curExternal, inst._class.name, false, true);

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
                        DeclareType(curExternal, symbol.type, true, true);

                     }
                     else if(classSym)
                     {
                        Compiler_Error($"couldn't find virtual method %s in class %s\n",
                           unmangled, classSym.string);
                     }
                  }

                  createdExternal = ProcessClassFunction(classSym ? classSym.registered : null, members.function, ast, afterExternal, true);

                  if(nameID)
                  {
                     FreeSpecifier(nameID._class);
                     nameID._class = null;
                  }

                  curExternal = createdExternal;
                  if(inCompiler)
                  {
                     if(createdExternal.function)
                        ProcessFunction(createdExternal.function);
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

void DeclareType(External neededFor, Type type, bool needDereference, bool forFunctionDef)
{
   _DeclareType(neededFor, type, needDereference, forFunctionDef, false);
}

void DeclareTypeForwardDeclare(External neededFor, Type type, bool needDereference, bool forFunctionDef)
{
   _DeclareType(neededFor, type, needDereference, forFunctionDef, true);
}

static void _DeclareType(External neededFor, Type type, bool needDereference, bool forFunctionDef, bool fwdDecl)
{
   if(inCompiler)
   {
      if(type.kind == functionType)
      {
         Type param;
         for(param = type.params.first; param; param = param.next)
            _DeclareType(neededFor, param, forFunctionDef, false, fwdDecl);
         _DeclareType(neededFor, type.returnType, forFunctionDef, false, fwdDecl);
      }
      else if(type.kind == pointerType)
         _DeclareType(neededFor, type.type, false, false, fwdDecl);
      else if(type.kind == classType)
      {
         Class c = type._class ? type._class.registered : null;
         _DeclareStruct(neededFor, c ? c.fullName : "ecere::com::Instance", c ? c.type == noHeadClass : false, needDereference && c && c.type == structClass, fwdDecl);
      }
      else if(type.kind == structType || type.kind == unionType)
      {
         Type member;
         for(member = type.members.first; member; member = member.next)
            _DeclareType(neededFor, member, needDereference, forFunctionDef, fwdDecl);
      }
      else if(type.kind == arrayType)
         _DeclareType(neededFor, type.arrayType, true, false, fwdDecl);
   }
}

// this code is not known to be called to compile any existing eC code
// params <-> args are usually directly matched by id
// function is a candidate for deletion
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

public void DeclareMethod(External neededFor, Method method, const char * name)
{
   Symbol symbol = method.symbol;
   if(!symbol || (!symbol.pointerExternal && (!symbol.methodCodeExternal || method.type == virtualMethod)))
   {
      bool dllImport = false;

      if(!method.dataType)
         method.dataType = ProcessTypeString(method.dataTypeString, false);

      //if(!symbol || symbol._import || method.type == virtualMethod)
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
               symbol.type = method.dataType;
               if(symbol.type) symbol.type.refCount++;
            }
         }
         if(!method.dataType.dllExport)
         {
            if((method._class.module != privateModule || !strcmp(method._class.name, "float") || !strcmp(method._class.name, "double")) && method._class.module.importType != staticImport)
               dllImport = true;
         }
      }

      if(inCompiler)
      {
         // We need a declaration here :)
         Declaration decl;
         OldList * specifiers, * declarators;
         Declarator d;
         Declarator funcDecl;
         External external;

         specifiers = MkList();
         declarators = MkList();

         if(dllImport)
            ListAdd(specifiers, MkSpecifier(EXTERN));
         else if(method._class.symbol && ((Symbol)method._class.symbol).isStatic)
            ListAdd(specifiers, MkSpecifier(STATIC));

         if(method.type == virtualMethod)
         {
            if(!dllImport && !specifiers->count)
               ListAdd(specifiers, MkSpecifier(EXTERN));
            ListAdd(specifiers, MkSpecifier(INT));
            d = MkDeclaratorIdentifier(MkIdentifier(name));
         }
         else
         {
            d = MkDeclaratorIdentifier(MkIdentifier(name));
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
                     MkSpecifierName(method.dataType.thisClass ? method.dataType.thisClass.string : method._class.fullName)),
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
         }
         ProcessDeclarator(d, true);

         ListAdd(declarators, MkInitDeclarator(d, null));

         decl = MkDeclaration(specifiers, declarators);

         ReplaceThisClassSpecifiers(specifiers, method._class);

         external = MkExternalDeclaration(decl);
         external.symbol = symbol;
         symbol.pointerExternal = external;
         ast->Add(external);
         DeclareStruct(external, method._class.fullName, true, true);
         if(method.dataType)
            DeclareType(external, method.dataType, true, true);
      }
   }
   if(inCompiler && neededFor)
   {
      External external = symbol.pointerExternal ? symbol.pointerExternal : symbol.methodCodeExternal;
      neededFor.CreateUniqueEdge(external, external.type == functionExternal);
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
   Type type;
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
      type = MkClassType(className);
      //type = ProcessTypeString(className, false);
   }
   else
   {
      type = MkClassType(_class.fullName);
      //type = ProcessTypeString(_class.fullName, false);
   }
   //type.wasThisClass = true;
   return type;
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
bool DeclareFunction(External neededFor, GlobalFunction function, char * name)
{
   Symbol symbol = function.symbol;
   // TOCHECK: Might get rid of the pointerExternal check in favor of marking the edge as breakable
   if(!symbol || !symbol.pointerExternal)
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

            if(module && module.name)
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

      if(inCompiler)
      {
         // TOCHECK: What's with the functionExternal check here? Is it Edge breaking / forward declaration?
         //if(!symbol.pointerExternal || symbol.pointerExternal.type == functionExternal)
         {
            // We need a declaration here :)
            Declaration decl;
            OldList * specifiers, * declarators;
            Declarator d;
            Declarator funcDecl;
            External external;

            specifiers = MkList();
            declarators = MkList();

            ListAdd(specifiers, MkSpecifier(EXTERN));

            d = MkDeclaratorIdentifier(MkIdentifier(imported ? name : function.name));
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
            /* Note: This should be handled by the edge breaking...
            if(symbol.pointerExternal && symbol.pointerExternal.type == functionExternal)
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
            */
            external = MkExternalDeclaration(decl);
            if(ast) ast->Add(external);
            external.symbol = symbol;
            symbol.pointerExternal = external;

            DeclareType(external, function.dataType, true, true);
         }
      }
   }
   if(inCompiler && neededFor && symbol && symbol.pointerExternal)
      neededFor.CreateUniqueEdge(symbol.pointerExternal, symbol.pointerExternal.type == functionExternal);
   return (symbol && symbol._import && function.module != privateModule && function.module.importType != staticImport) ? true : false;
}

void DeclareGlobalData(External neededFor, GlobalData data)
{
   Symbol symbol = data.symbol;
   // TOCHECK: Might get rid of the pointerExternal check in favor of marking the edge as breakable
   if(!symbol || !symbol.pointerExternal)
   {
      if(inCompiler)
      {
         if(!symbol)
            symbol = data.symbol = Symbol { };
      }
      if(!data.dataType)
         data.dataType = ProcessTypeString(data.dataTypeString, false);

      if(inCompiler)
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

         DeclareType(external, data.dataType, true, true);
      }
   }
   if(inCompiler && neededFor && symbol && symbol.pointerExternal)
      neededFor.CreateUniqueEdge(symbol.pointerExternal, false);
}

class Conversion : struct
{
   Conversion prev, next;
   Property convert;
   bool isGet;
   Type resultType;
};

static bool CheckConstCompatibility(Type source, Type dest, bool warn)
{
   bool status = true;
   if(((source.kind == classType && source._class && source._class.registered) || source.kind == arrayType || source.kind == pointerType) &&
      ((dest.kind == classType && dest._class && dest._class.registered) || /*dest.kind == arrayType || */dest.kind == pointerType))
   {
      Class sourceClass = source.kind == classType ? source._class.registered : null;
      Class destClass = dest.kind == classType ? dest._class.registered : null;
      if((!sourceClass || (sourceClass && sourceClass.type == normalClass && !sourceClass.structSize)) &&
         (!destClass || (destClass && destClass.type == normalClass && !destClass.structSize)))
      {
         Type sourceType = source, destType = dest;
         while((sourceType.kind == pointerType || sourceType.kind == arrayType) && sourceType.type) sourceType = sourceType.type;
         while((destType.kind == pointerType || destType.kind == arrayType) && destType.type) destType = destType.type;
         if(!destType.constant && sourceType.constant)
         {
            status = false;
            if(warn)
               Compiler_Warning($"discarding const qualifier\n");
         }
      }
   }
   return status;
}

public bool MatchTypes(Type source, Type dest, OldList conversions, Class owningClassSource, Class owningClassDest, bool doConversion, bool enumBaseType, bool acceptReversedParams,
                       bool isConversionExploration, bool warnConst)
{
   if(source && dest)
   {
      if(warnConst)
         CheckConstCompatibility(source, dest, true);
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

      if(dest.classObjectType == typedObject && dest.kind != functionType)
      {
         if(source.classObjectType != anyObject)
            return true;
         else
         {
            // If either the source or the destination defines the class, accepts any_object as compatible for a typed_object
            if((dest._class && strcmp(dest._class.string, "class")) || (source._class && strcmp(source._class.string, "class")))
            {
               return true;
            }
         }
      }
      else
      {
         if(source.kind != functionType && source.classObjectType == anyObject)
            return true;
         if(dest.kind != functionType && dest.classObjectType == anyObject && source.classObjectType != typedObject)
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
            if(dest._class && dest._class.registered && source._class && source._class.registered &&
               (dest.casted || (enumBaseType && dest._class.registered.type == enumClass &&
                  (source.kind == classType ||  // Added this here for a base enum to be acceptable for a derived enum (#139)
                   source._class.registered.type != enumClass)
                ) ) )
            {
               if(eClass_IsDerived(dest._class.registered, source._class.registered))
               {
                  return true;
               }
            }
            else if(dest._class && dest._class.registered && source._class && source._class.registered &&
                  dest._class.registered.templateClass && source._class.registered.templateClass)
            {
               // testing this work around warnings
               // source: Map<eda::Table, eda::Lookup>
               //   dest: Map<eda::Table, eda::Lookup, BT = ecere::com::MapNode<KT, V, T = KT>, eda::Table, T = ecere::com::MapNode<KT, V, T = KT>, eda::Table, eda::Lookup>
               if(eClass_IsDerived(dest._class.registered.templateClass, source._class.registered.templateClass))
                  return true;
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
                     // Only go ahead with this conversion flow while processing an existing conversion if the conversion data type is a class
                     if((!isConversionExploration || convert.dataType.kind == classType || !strcmp(_class.name, "String")) &&
                        MatchTypes(convert.dataType, dest, conversions, null, null,
                           (convert.dataType.kind == classType && !strcmp(convert.dataTypeString, "String")) ? true : false,
                              convert.dataType.kind == classType, false, true, warnConst))
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
                     Type constType = null;
                     bool success = false;
                     // Conversion after = (conversions != null) ? conversions.last : null;

                     if(!convert.dataType)
                        convert.dataType = ProcessTypeString(convert.dataTypeString, false);

                     if(warnConst && convert.dataType.kind == pointerType && convert.dataType.type && dest.constant)
                     {
                        Type ptrType { };
                        constType = { kind = pointerType, refCount = 1, type = ptrType };
                        CopyTypeInto(ptrType, convert.dataType.type);
                        ptrType.constant = true;
                     }

                     // Just added this equality check to prevent recursion.... Make it safer?
                     // Changed enumBaseType to false here to prevent all int-compatible enums to show up in AnchorValues
                     if((constType || convert.dataType != dest) && MatchTypes(source, constType ? constType : convert.dataType, conversions, null, null, true, false /*true*/, false, true, warnConst))
                     {
                        if(!conversions && !convert.Set)
                           success = true;
                        else if(conversions != null)
                        {
                           if(_class.type == unitClass && convert.dataType.kind == classType && convert.dataType._class &&
                              convert.dataType._class.registered && _class.base == convert.dataType._class.registered.base &&
                              (source.kind != classType || source._class.registered != _class.base))
                              success = true;
                           else
                           {
                              // *** Testing this! ***
                              Conversion conv { convert = convert };
                              conversions.Add(conv);
                              //conversions.Insert(after, conv);
                              success = true;
                           }
                        }
                     }
                     if(constType)
                        FreeType(constType);
                     if(success)
                        return true;
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
                  if(MatchTypes(source, dest._class.registered.dataType, conversions, null, null, true, dest._class.registered.dataType.kind == classType, false, false, warnConst))
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
                     if(convert.dataType != source &&
                        (!isConversionExploration || convert.dataType.kind == classType || !strcmp(_class.name, "String")) &&
                        MatchTypes(convert.dataType, dest, conversions, null, null, convert.dataType.kind == classType, convert.dataType.kind == classType, false, true, warnConst))
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
               if(!isConversionExploration || source._class.registered.dataType.kind == classType || !strcmp(source._class.registered.name, "String"))
               {
                  if(MatchTypes(source._class.registered.dataType, dest, conversions, null, null, source._class.registered.dataType.kind == classType, source._class.registered.dataType.kind == classType, false, false, warnConst))
                     return true;
                  // For bool to be accepted by byte, short, etc.
                  else if(MatchTypes(dest, source._class.registered.dataType, null, null, null, false, false, false, false, warnConst))
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
      else if(dest.kind == float128Type && (source.kind == floatType || source.kind == doubleType))
         return true;
      else if(dest.kind == shortType && (source.kind == charType || source.kind == _BoolType))
         return true;
      else if(dest.kind == intType && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intSizeType /* Exception here for size_t */))
         return true;
      else if(dest.kind == int64Type && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intType || source.kind == intPtrType || source.kind == intSizeType))
         return true;
      else if(dest.kind == int128Type && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intType || source.kind == intPtrType || source.kind == int64Type || source.kind == intSizeType))
         return true;
      else if(dest.kind == intPtrType && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intType || source.kind == intSizeType || source.kind == int64Type))
         return true;
      else if(dest.kind == intSizeType && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intType || source.kind == int64Type || source.kind == intPtrType))
         return true;
      else if(source.kind == enumType &&
         (dest.kind == intType || dest.kind == shortType || dest.kind == charType || source.kind == _BoolType || dest.kind == longType || dest.kind == int64Type || dest.kind == intPtrType || dest.kind == intSizeType))
          return true;
      else if(dest.kind == enumType && !isConversionExploration &&
         (source.kind == intType || source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == longType || source.kind == int64Type || source.kind == intPtrType || source.kind == intSizeType))
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
         if(!MatchTypes(source.returnType, dest.returnType, null, null, null, true, true, false, false, warnConst))
         {
            Compiler_Warning($"incompatible return type for function\n");
            return false;
         }
         // The const check is backwards from the MatchTypes above (for derivative classes checks)
         else
            CheckConstCompatibility(dest.returnType, source.returnType, true);

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
               if(!MatchTypes(paramDestType, paramSourceType, null, null, null, true, true, false, false, warnConst) &&
                  (!acceptReversedParams || !MatchTypes(paramSourceType, paramDestType, null, null, null, true, true, false, false, warnConst)))
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
         // Pointers to pointer is incompatible with non normal/nohead classes
         if(!(dest.type && dest.type.kind == pointerType && source.type.kind == classType && source.type._class &&
            source.type._class.registered && (source.type._class.registered.type != normalClass && source.type._class.registered.type != noHeadClass) && !source.type.byReference))
         {
            ComputeTypeSize(source.type);
            ComputeTypeSize(dest.type);
            if(source.type.size == dest.type.size && MatchTypes(source.type, dest.type, null, null, null, true, true, false, false, warnConst))
               return true;
         }
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

         if(MatchTypes(type, dest, &converts, null, null, dest.kind != classType || !dest._class || strcmp(dest._class.string, "bool"),
               false, false, false, false))
         {
            NamedLink64 value;
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
                     FreeType(sourceExp.expType);

                     sourceExp.isConstant = true;
                     sourceExp.expType = MkClassType(baseClass.fullName);
                     if(inCompiler || inPreCompiler || inDebugger)
                     {
                        char constant[256];
                        FreeExpContents(sourceExp);

                        sourceExp.type = constantExp;
                        if(!strcmp(baseClass.dataTypeString, "int") || !strcmp(baseClass.dataTypeString, "int64") || !strcmp(baseClass.dataTypeString, "short") || !strcmp(baseClass.dataTypeString, "char"))
                           sprintf(constant, FORMAT64D, value.data);
                        else
                           sprintf(constant, FORMAT64HEXLL, value.data);
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

bool MatchTypeExpression(Expression sourceExp, Type dest, OldList conversions, bool skipUnitBla, bool warnConst)
{
   Type source;
   Type realDest = dest;
   Type backupSourceExpType = null;
   Expression nbExp = GetNonBracketsExp(sourceExp);
   Expression computedExp = nbExp;
   dest.refCount++;

   if(sourceExp.isConstant && sourceExp.type != constantExp && sourceExp.type != identifierExp && sourceExp.type != castExp &&
      dest.kind == classType && dest._class && dest._class.registered && dest._class.registered.type == enumClass)
   {
      computedExp = CopyExpression(nbExp);        // Keep the original expression, but compute for checking enum ranges
      ComputeExpression(computedExp /*sourceExp*/);
   }

   source = sourceExp.expType;

   if(dest.kind == pointerType && sourceExp.type == constantExp && !strtoul(sourceExp.constant, null, 0))
   {
      if(computedExp != nbExp)
      {
         FreeExpression(computedExp);
         computedExp = nbExp;
      }
      FreeType(dest);
      return true;
   }

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
          {
            if(computedExp != nbExp)
            {
               FreeExpression(computedExp);
               computedExp = nbExp;
            }
            FreeType(dest);
            return true;
         }
      }
   }

   if(source)
   {
      OldList * specs;
      bool flag = false;
      int64 value = MAXINT;

      source.refCount++;

      if(computedExp.type == constantExp)
      {
         if(source.isSigned)
            value = strtoll(computedExp.constant, null, 0);
         else
            value = strtoull(computedExp.constant, null, 0);
      }
      else if(computedExp.type == opExp && computedExp.op.op == '-' && !computedExp.op.exp1 && computedExp.op.exp2 && computedExp.op.exp2.type == constantExp)
      {
         if(source.isSigned)
            value = -strtoll(computedExp.op.exp2.constant, null, 0);
         else
            value = -strtoull(computedExp.op.exp2.constant, null, 0);
      }
      if(computedExp != nbExp)
      {
         FreeExpression(computedExp);
         computedExp = nbExp;
      }

      if(dest.kind != classType && source.kind == classType && source._class && source._class.registered &&
         !strcmp(source._class.registered.fullName, "unichar" /*"ecere::com::unichar"*/))
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
                  MatchTypes(tempSource, tempDest, conversions, null, null, true, true, false, false, warnConst);

               // NOTE: To handle bad warnings on int64 vs 32 bit eda::Id incompatibilities
               backupSourceExpType = sourceExp.expType;
               if(dest.passAsTemplate)
               {
                  // Don't carry passAsTemplate
                  sourceExp.expType = { };
                  CopyTypeInto(sourceExp.expType, dest);
                  sourceExp.expType.passAsTemplate = false;
               }
               else
               {
                  sourceExp.expType = dest;
                  dest.refCount++;
               }
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
            if(MatchTypes(source, dest._class.registered.dataType, conversions, null, null, true, true, false, false, warnConst))
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
            if(backupSourceExpType) FreeType(backupSourceExpType);
            return true;
         }
      }
      else if(source.kind == classType)
      {
         Class _class = source._class ? source._class.registered : null;

         if(_class && (_class.type == unitClass || /*!strcmp(_class.fullName, "bool") || _class.type == enumClass || */_class.type == bitClass ))  // TOCHECK: enumClass, bitClass is new here...
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
                  MatchTypes(tempSource, tempDest, conversions, null, null, true, true, false, false, warnConst);

               // PUT THIS BACK TESTING UNITS?
               if(conversions && conversions.last)
               {
                  ((Conversion)(conversions.last)).resultType = dest;
                  dest.refCount++;

                  // This fixes passing unit as template to a double
                  modifyPassAsTemplate(&((Conversion)(conversions.last)).resultType, false);
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
         if(MatchTypes(source, dest, conversions, null, null, true, true, false, false, warnConst))
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
         bool fittingValue = false;
         if(_class && _class.type == enumClass)
         {
            Class enumClass = eSystem_FindClass(privateModule, "enum");
            EnumClassData c = ACCESS_CLASSDATA(_class, enumClass);
            if(c && value >= 0 && value <= c.largest)
               fittingValue = true;
         }

         if(_class && !dest.truth && (_class.type == unitClass || fittingValue ||
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

               if(backupSourceExpType) FreeType(backupSourceExpType);
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
             source.kind == charType || source.kind == _BoolType))
         {
            specs = MkListOne(MkSpecifier(DOUBLE));
         }
         else if(dest.kind == floatType &&
            (source.kind == floatType || dest.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == _BoolType || source.kind == doubleType))
         {
            specs = MkListOne(MkSpecifier(FLOAT));
         }
         else if(dest.kind == int64Type && (source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == _BoolType || source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(INT64));
         }
         else if(dest.kind == intType && (source.kind == intType || source.kind == shortType || source.kind == charType ||
            source.kind == _BoolType || source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(INT));
         }
         else if(dest.kind == shortType && (source.kind == shortType || source.kind == charType || source.kind == _BoolType || source.kind == intType ||
            source.kind == floatType || source.kind == doubleType))
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(SHORT));
         }
         else if(dest.kind == charType && (source.kind == charType || source.kind == _BoolType || source.kind == shortType || source.kind == intType ||
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
            if(backupSourceExpType)
            {
               // Failed to convert: revert previous exp type
               if(sourceExp.expType) FreeType(sourceExp.expType);
               sourceExp.expType = backupSourceExpType;
            }
            return false;
         }
      }
      else if(dest.kind == doubleType &&
         (source.kind == doubleType || source.kind == floatType || source.kind == int64Type || source.kind == intType || source.kind == enumType || source.kind == shortType ||
          source.kind == _BoolType || source.kind == charType))
      {
         specs = MkListOne(MkSpecifier(DOUBLE));
      }
      else if(dest.kind == floatType &&
         (source.kind == floatType || source.kind == enumType || source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == _BoolType || source.kind == charType))
      {
         specs = MkListOne(MkSpecifier(FLOAT));
      }
      else if(dest.kind == _BoolType && (source.kind == _BoolType || source.kind == charType || source.kind == enumType || source.kind == shortType || source.kind == intType) &&
         (value == 1 || value == 0))
      {
         specs = MkList();
         ListAdd(specs, MkSpecifier(BOOL));
      }
      else if(dest.kind == charType && (source.kind == _BoolType || source.kind == charType || source.kind == enumType || source.kind == shortType || source.kind == intType) &&
         (dest.isSigned ? (value >= -128 && value <= 127) : (value >= 0 && value <= 255)))
      {
         if(source.kind == intType)
         {
            FreeType(dest);
            FreeType(source);
            if(backupSourceExpType) FreeType(backupSourceExpType);
            return true;
         }
         else
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(CHAR));
         }
      }
      else if(dest.kind == shortType && (source.kind == enumType || source.kind == _BoolType || source.kind == charType || source.kind == shortType ||
         (source.kind == intType && (dest.isSigned ? (value >= -32768 && value <= 32767) : (value >= 0 && value <= 65535)))))
      {
         if(source.kind == intType)
         {
            FreeType(dest);
            FreeType(source);
            if(backupSourceExpType) FreeType(backupSourceExpType);
            return true;
         }
         else
         {
            specs = MkList();
            if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
            ListAdd(specs, MkSpecifier(SHORT));
         }
      }
      else if(dest.kind == intType && (source.kind == enumType || source.kind == shortType || source.kind == _BoolType || source.kind == charType || source.kind == intType))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(INT));
      }
      else if(dest.kind == int64Type && (source.kind == enumType || source.kind == shortType || source.kind == _BoolType || source.kind == charType || source.kind == intType || source.kind == int64Type))
      {
         specs = MkList();
         if(!dest.isSigned) ListAdd(specs, MkSpecifier(UNSIGNED));
         ListAdd(specs, MkSpecifier(INT64));
      }
      else if(dest.kind == enumType &&
         (source.kind == int64Type || source.kind == intType || source.kind == shortType || source.kind == _BoolType || source.kind == charType))
      {
         specs = MkListOne(MkEnum(MkIdentifier(dest.enumName), null));
      }
      else
      {
         FreeType(source);
         FreeType(dest);
         if(backupSourceExpType)
         {
            // Failed to convert: revert previous exp type
            if(sourceExp.expType) FreeType(sourceExp.expType);
            sourceExp.expType = backupSourceExpType;
         }
         return false;
      }

      if(!flag && !sourceExp.opDestType)
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
      if(backupSourceExpType) FreeType(backupSourceExpType);

      return true;
   }
   else
   {
      if(computedExp != nbExp)
      {
         FreeExpression(computedExp);
         computedExp = nbExp;
      }

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
                     NamedLink64 value;
                     EnumClassData e = ACCESS_CLASSDATA(_class, enumClass);
                     for(value = e.values.first; value; value = value.next)
                     {
                        if(!strcmp(value.name, id.string))
                           break;
                     }
                     if(inBGen && value)
                     {
                        if(strcmp(_class.name, "bool"))
                        {
                           delete id.string;
                           id.string = PrintString(_class.name, "_", value.name);
                        }
                        FreeType(dest);
                        return true;
                     }
                     else if(value)
                     {
                        FreeType(sourceExp.expType);

                        sourceExp.isConstant = true;
                        sourceExp.expType = MkClassType(_class.fullName);
                        if(inCompiler || inPreCompiler || inDebugger)
                        {
                           FreeExpContents(sourceExp);

                           sourceExp.type = constantExp;
                           if(_class.dataTypeString && (!strcmp(_class.dataTypeString, "int") || !strcmp(_class.dataTypeString, "int64") || !strcmp(_class.dataTypeString, "short") || !strcmp(_class.dataTypeString, "char"))) // _class cannot be null here!
                              sourceExp.constant = PrintInt64(value.data);
                           else
                              sourceExp.constant = PrintUInt64(value.data);
                           //for(;_class.base && _class.base.type != systemClass; _class = _class.base);
                        }
                        FreeType(dest);
                        return true;
                     }
                  }
               }
            }
         }

         // Loop through all enum classes
         if(dest.classObjectType != typedObject && dest.kind == classType /*!= ellipsisType */&& MatchWithEnums_Module(privateModule, sourceExp, dest, id.string, conversions))
         {
            FreeType(dest);
            return true;
         }
      }
      FreeType(dest);
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
      exp.string = p((t)(op1.m o value2));                     \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define BINARY_DIVIDEINT(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1, Operand op2)   \
   {                                                              \
      t value2 = op2.m;                                           \
      exp.type = constantExp;                                    \
      exp.string = p(value2 ? ((t)(op1.m o value2)) : 0);             \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define BINARY_DIVIDEREAL(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1, Operand op2)   \
   {                                                              \
      t value2 = op2.m;                                           \
      exp.type = constantExp;                                    \
      exp.string = p((t)(op1.m o value2));             \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define UNARY(o, name, m, t, p) \
   static bool name(Expression exp, Operand op1)                \
   {                                                              \
      exp.type = constantExp;                                    \
      exp.string = p((t)(o op1.m));                                   \
      if(!exp.expType) \
         { exp.expType = op1.type; if(op1.type) op1.type.refCount++; } \
      return true;                                                \
   }

#define OPERATOR_ALL(macro, o, name) \
   macro(o, Int##name, i, int, PrintInt) \
   macro(o, UInt##name, ui, unsigned int, PrintUInt) \
   macro(o, Int64##name, i64, int64, PrintInt64) \
   macro(o, UInt64##name, ui64, uint64, PrintUInt64) \
   macro(o, Short##name, s, short, PrintShort) \
   macro(o, UShort##name, us, unsigned short, PrintUShort) \
   macro(o, Char##name, c, char, PrintChar) \
   macro(o, UChar##name, uc, unsigned char, PrintUChar) \
   macro(o, Float##name, f, float, PrintFloat) \
   macro(o, Double##name, d, double, PrintDouble)

#define OPERATOR_INTTYPES(macro, o, name) \
   macro(o, Int##name, i, int, PrintInt) \
   macro(o, UInt##name, ui, unsigned int, PrintUInt) \
   macro(o, Int64##name, i64, int64, PrintInt64) \
   macro(o, UInt64##name, ui64, uint64, PrintUInt64) \
   macro(o, Short##name, s, short, PrintShort) \
   macro(o, UShort##name, us, unsigned short, PrintUShort) \
   macro(o, Char##name, c, char, PrintChar) \
   macro(o, UChar##name, uc, unsigned char, PrintUChar)

#define OPERATOR_REALTYPES(macro, o, name) \
   macro(o, Float##name, f, float, PrintFloat) \
   macro(o, Double##name, d, double, PrintDouble)

// binary arithmetic
OPERATOR_ALL(BINARY, +, Add)
OPERATOR_ALL(BINARY, -, Sub)
OPERATOR_ALL(BINARY, *, Mul)
OPERATOR_INTTYPES(BINARY_DIVIDEINT, /, Div)
OPERATOR_REALTYPES(BINARY_DIVIDEREAL, /, Div)
OPERATOR_INTTYPES(BINARY_DIVIDEINT, %, Mod)

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
OPERATOR_INTTYPES(BINARY_DIVIDEINT, /=, DivAsign)
OPERATOR_REALTYPES(BINARY_DIVIDEREAL, /=, DivAsign)
OPERATOR_INTTYPES(BINARY_DIVIDEINT, %=, ModAsign)

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
OPERATOR_INTTYPES(TERTIARY, ?, Cond)

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
OPERATOR_TABLE_ALL(int64, Int64)
OPERATOR_TABLE_ALL(uint64, UInt64)
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

// TOFIX: THIS DOESN'T HANDLE NUMERIC ESCAPE CODES (OCTAL/HEXADECIMAL...)?
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
            case '\'': output[d] = '\''; break;
            default: output[d] = ch;
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

// String Unescape Copy

// This started as the same as ReadString above (which misses numeric escape codes) except it doesn't handle external quotes
public int UnescapeString(char * d, char * s, int len)
{  // Does not preserve the escape character in non-standard sequences : \z => z
   return UnescapeCString(d, s, len);
}

public char * OffsetEscapedString(char * s, int len, int offset)
{
   char ch;
   int j = 0, k = 0;
   while(j < len && k < offset && (ch = s[j]))
   {
      if(ch == '\\') ++j;
      j++, k++;
   }
   return (k == offset) ? s + j : null;
}

public Operand GetOperand(Expression exp)
{
   Operand op { };
   Type type = exp.expType;
   if(type)
   {
      while(type.kind == classType && type._class &&
         type._class.registered && (type._class.registered.type == bitClass || type._class.registered.type == unitClass || type._class.registered.type == enumClass))
      {
         if(!type._class.registered.dataType)
            type._class.registered.dataType = ProcessTypeString(type._class.registered.dataTypeString, false);
         type = type._class.registered.dataType;

      }
      if(exp.type == stringExp && op.kind == pointerType)
      {
         op.ui64 = (uint64)(uintptr)exp.string;
         op.kind = pointerType;
         op.ops = uint64Ops;
      }
      else if(exp.isConstant && exp.type == constantExp)
      {
         op.kind = type.kind;
         op.type = type;

         switch(op.kind)
         {
            case _BoolType:
            case charType:
            {
               if(exp.constant[0] == '\'')
               {
                  op.c = exp.constant[1];
                  op.ops = charOps;
               }
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
               if(exp.constant[0] == '\'')
               {
                  op.s = exp.constant[1];
                  op.ops = shortOps;
               }
               else if(type.isSigned)
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
               // TODO: Support unichar, escaped sequences
               if(exp.constant[0] == '\'')
               {
                  op.i = exp.constant[1];
                  op.ops = intOps;
               }
               else if(type.isSigned)
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
               // TODO: Support unichar, escaped sequences
               if(exp.constant[0] == '\'')
               {
                  op.i = exp.constant[1];
                  op.ops = intOps;
               }
               else if(type.isSigned)
               {
                  op.i64 = (int64)_strtoi64(exp.constant, null, 0);
                  op.ops = int64Ops;
               }
               else
               {
                  op.ui64 = (uint64)_strtoui64(exp.constant, null, 0);
                  op.ops = uint64Ops;
               }
               op.kind = int64Type;
               break;
            case intPtrType:
               if(type.isSigned)
               {
                  op.i64 = (int64)_strtoi64(exp.constant, null, 0);
                  op.ops = int64Ops;
               }
               else
               {
                  op.ui64 = (uint64)_strtoui64(exp.constant, null, 0);
                  op.ops = uint64Ops;
               }
               op.kind = int64Type;
               break;
            case intSizeType:
               if(type.isSigned)
               {
                  op.i64 = (int64)_strtoi64(exp.constant, null, 0);
                  op.ops = int64Ops;
               }
               else
               {
                  op.ui64 = (uint64)_strtoui64(exp.constant, null, 0);
                  op.ops = uint64Ops;
               }
               op.kind = int64Type;
               break;
            case floatType:
               if(!strcmp(exp.constant, "inf")) op.f = float::inf();
               else if(!strcmp(exp.constant, "-inf")) op.f = -float::inf();
               else if(!strcmp(exp.constant, "nan")) op.f = float::nan();
               else if(!strcmp(exp.constant, "-nan")) op.f = -float::nan();
               else
                  op.f = (float)strtod(exp.constant, null);
               op.ops = floatOps;
               break;
            case doubleType:
               if(!strcmp(exp.constant, "inf")) op.d = double::inf();
               else if(!strcmp(exp.constant, "-inf")) op.d = -double::inf();
               else if(!strcmp(exp.constant, "nan")) op.d = double::nan();
               else if(!strcmp(exp.constant, "-nan")) op.d = -double::nan();
               else
                  op.d = (double)strtod(exp.constant, null);
               op.ops = doubleOps;
               break;
            //case classType:    For when we have operator overloading...
            // Pointer additions
            //case functionType:
            case arrayType:
            case pointerType:
            case classType:
               op.ui64 = _strtoui64(exp.constant, null, 0);
               op.kind = pointerType;
               op.ops = uint64Ops;
               // op.ptrSize =
               break;
         }
      }
   }
   return op;
}

static int64 GetEnumValue(Class _class, void * ptr)
{
   int64 v = 0;
   switch(_class.typeSize)
   {
      case 8:
         if(!strcmp(_class.dataTypeString, "uint64"))
            v = (int64)*(uint64 *)ptr;
         else
            v = (int64)*(int64 *)ptr;
         break;
      case 4:
         if(!strcmp(_class.dataTypeString, "uint"))
            v = (int64)*(uint *)ptr;
         else
            v = (int64)*(int *)ptr;
         break;
      case 2:
         if(!strcmp(_class.dataTypeString, "uint16"))
            v = (int64)*(uint16 *)ptr;
         else
            v = (int64)*(short *)ptr;
         break;
      case 1:
         if(!strcmp(_class.dataTypeString, "byte"))
            v = (int64)*(byte *)ptr;
         else
            v = (int64)*(char *)ptr;
         break;
   }
   return v;
}

static __attribute__((unused)) void UnusedFunction()
{
   int a = 0;
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
                  NamedLink64 item;
                  for(item = e.values.first; item; item = item.next)
                  {
                     if(item.data == GetEnumValue(_class, ptr))
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
                  // TODO: This should probably use proper type
                  exp.constant = PrintInt64((int64)*(intptr*)ptr);
                  exp.type = constantExp;
                  break;
               }
               case intSizeType:
               {
                  FreeExpContents(exp);
                  // TODO: This should probably use proper type
                  exp.constant = PrintInt64((int64)*(intsize*)ptr);
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
   // Added this check and ->Add to prevent memory leaks on bad code
   if(!inst.members)
      inst.members = MkListOne(MkMembersInitList(memberList));
   else
      inst.members->Add(MkMembersInitList(memberList));
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
                     NamedLink64 item;
                     for(item = e.values.first; item; item = item.next)
                     {
                        if(item.data == GetEnumValue(_class, ptr))
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
      {
         inst.data = (byte *)eInstance_New(_class);
         if(_class.type == normalClass)
            ((Instance)inst.data)._refCount++;
      }
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
                              // TODO: Document/Improve this!!!
                              eClass_FindDataMemberAndOffset(_class, dataMember.name, &dataMemberOffset, privateModule, null, null);
                              if(dataMember._class.type == normalClass || dataMember._class.type == noHeadClass)
                                 dataMemberOffset += dataMember._class.base.structSize;
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
                              if(dataMember._class.type == normalClass || dataMember._class.type == noHeadClass)
                                 dataMemberOffset += dataMember._class.base.structSize;

                              found = true;
                              if(dataMember.memberAccess == publicAccess)
                              {
                                 curMember = dataMember;
                                 curClass = dataMember._class;
                                 memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                                 subMemberStackPos = _subMemberStackPos;
                              }
                           }
                        }
                     }

                     if(found && member.initializer && member.initializer.type == expInitializer)
                     {
                        Expression value = member.initializer.exp;
                        Type type = null;
                        bool deepMember = false;
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
                           deepMember = true;

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
                                    {
                                       if(dataMember._class.type == normalClass || dataMember._class.type == noHeadClass)
                                          dataMemberOffset += dataMember._class.base.structSize;
                                       type = dataMember.dataType;
                                    }
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
                        if(!deepMember && type && value && (_class.type == structClass || _class.type == normalClass || _class.type == noHeadClass /*&& value.expType.kind == type.kind*/))
                        {
                           if(type.kind == classType)
                           {
                              Class _class = type._class.registered;
                              if(_class && (_class.type == bitClass || _class.type == unitClass || _class.type == enumClass))
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
                                    case intSizeType:
                                    {
                                       GetIntSize(value, (intsize*)ptr);
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
                           else if(prop && prop.Set && prop.Set != (void *)(intptr)1)
                           {
                              if(value.type == instanceExp && value.instance.data)
                              {
                                 if(type.kind == classType)
                                 {
                                    Class _class = type._class.registered;
                                    if(_class && (_class.type != normalClass || eClass_IsDerived(((Instance)value.instance.data)._class, _class)))
                                    {
                                       void (*Set)(void *, void *) = (void *)prop.Set;
                                       Set(inst.data, value.instance.data);
                                       PopulateInstance(inst);
                                    }
                                 }
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
                                       Set(inst.data, (int)strtol(value.constant, null, 0));
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
                                    case intSizeType:
                                    {
                                       void (*Set)(void *, intsize) = (void *)prop.Set;
                                       Set(inst.data, (intsize)_strtoi64(value.constant, null, 0));
                                       break;
                                    }
                                 }
                              }
                              else if(value.type == stringExp)
                              {
                                 char temp[1024];
                                 ReadString(temp, value.string);
                                 ((void (*)(void *, void *))(void *)prop.Set)(inst.data, temp);
                              }
                           }
                        }
                        else if(!deepMember && type && _class.type == unitClass)
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
                        else if(!deepMember && type && _class.type == bitClass)
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
                              uint64 part = 0;
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
                                 case _BoolType:
                                 case charType:       { byte v; type.isSigned ? GetChar(value, (char *)&v) : GetUChar(value, &v); part = (uint64)v; break; }
                                 case shortType:      { uint16 v; type.isSigned ? GetShort(value, (short *)&v) : GetUShort(value, &v); part = (uint64)v; break; }
                                 case intType:
                                 case longType:       { uint v; type.isSigned ? GetInt(value, (int *)&v) : GetUInt(value, &v); part = (uint64)v; break; }
                                 case int64Type:      { uint64 v; type.isSigned ? GetInt64(value, (int64 *)&v) : GetUInt64(value, &v); part = (uint64)v; break; }
                                 case intPtrType:     { uintptr v; type.isSigned ? GetIntPtr(value, (intptr *)&v) : GetUIntPtr(value, &v); part = (uint64)v; break; }
                                 case intSizeType:    { uintsize v; type.isSigned ? GetIntSize(value, (intsize *)&v) : GetUIntSize(value, &v); part = (uint64)v; break; }
                              }
                              bits |= part << bitMember.pos;
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

static bool Promote(Operand op, TypeKind kind, bool isSigned)
{
   bool result = false;
   switch(kind)
   {
      case shortType:
         if(op.kind == charType || op.kind == enumType || op.kind == _BoolType)
            result = isSigned ? GetOpShort(op, &op.s) : GetOpUShort(op, &op.us);
         break;
      case intType:
      case longType:
         if(op.kind == charType || op.kind == shortType || op.kind == enumType || op.kind == _BoolType)
            result = isSigned ? GetOpInt(op, &op.i) : GetOpUInt(op, &op.ui);
         break;
      case int64Type:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == int64Type || op.kind == longType || op.kind == floatType || op.kind == doubleType ||
            op.kind == pointerType || op.kind == enumType || op.kind == intPtrType || op.kind == intSizeType || op.kind == _BoolType)
            result = isSigned ? GetOpInt64(op, &op.i64) : GetOpUInt64(op, &op.ui64);
         break;
      case floatType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == int64Type || op.kind == longType ||
            op.kind == enumType || op.kind == intPtrType || op.kind == intSizeType || op.kind == _BoolType)
            result = GetOpFloat(op, &op.f);
         break;
      case doubleType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == int64Type || op.kind == longType || op.kind == floatType ||
            op.kind == enumType || op.kind == intPtrType || op.kind == intSizeType || op.kind == _BoolType)
            result = GetOpDouble(op, &op.d);
         break;
      case pointerType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == int64Type || op.kind == longType || op.kind == floatType || op.kind == doubleType ||
            op.kind == pointerType || op.kind == enumType || op.kind == intPtrType || op.kind == intSizeType || op.kind == _BoolType)
            result = GetOpUInt64 /*GetOpUIntPtr*/(op, &op.ui64);
         break;
      case enumType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == int64Type || op.kind == longType || op.kind == floatType || op.kind == doubleType ||
            op.kind == pointerType || op.kind == enumType || op.kind == intPtrType || op.kind == intSizeType || op.kind == _BoolType)
            result = isSigned ? GetOpInt(op, &op.i) : GetOpUInt(op, &op.ui);
         break;
      case intPtrType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == longType || op.kind == enumType || op.kind == _BoolType)
            result = isSigned ? GetOpInt64 /*GetOpIntPtr*/(op, &op.i64) : GetOpUInt64 /*GetOpUIntPtr*/(op, &op.ui64);
         break;
      case intSizeType:
         if(op.kind == charType || op.kind == shortType || op.kind == intType || op.kind == longType || op.kind == enumType || op.kind == _BoolType)
            result = isSigned ? GetOpInt64 /*GetOpIntSize*/(op, &op.i64) : GetOpUInt64 /*GetOpUIntSize*/(op, &op.ui64);
         break;
   }
   return result;
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
         if(op1 && op2 && op1.type && op2.type && op1.kind != op2.kind)
         {
            if(Promote(op2, op1.kind, op1.type.isSigned))
               op2.kind = op1.kind, op2.ops = op1.ops;
            else if(Promote(op1, op2.kind, op2.type.isSigned))
               op1.kind = op2.kind, op1.ops = op2.ops;
         }
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
#ifdef _DEBUG
   char expString[10240];
   expString[0] = '\0';
   PrintExpression(exp, expString);
#endif

   switch(exp.type)
   {
      case identifierExp:
      {
         Identifier id = exp.identifier;
         if(id && exp.isConstant && !inCompiler && !inPreCompiler && !inDebugger)
         {
            Class c = (exp.expType && exp.expType.kind == classType && exp.expType._class) ? exp.expType._class.registered : null;
            if(c && c.type == enumClass)
            {
               Class enumClass = eSystem_FindClass(privateModule, "enum");
               if(enumClass)
               {
                  NamedLink64 value;
                  EnumClassData e = ACCESS_CLASSDATA(c, enumClass);
                  for(value = e.values.first; value; value = value.next)
                  {
                     if(!strcmp(value.name, id.string))
                        break;
                  }
                  if(value)
                  {
                     const String dts = c.dataTypeString;
                     FreeExpContents(exp);
                     exp.type = constantExp;
                     exp.constant = (dts && (!strcmp(dts, "int") || !strcmp(dts, "int64") || !strcmp(dts, "short") || !strcmp(dts, "char"))) ? PrintInt64(value.data) : PrintUInt64(value.data);
                  }
               }
            }
         }
         break;
      }
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
         {
            Expression e = exp.op.exp2;

            while((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list)
            {
               if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
               {
                  if(e.type == extensionCompoundExp)
                     e = ((Statement)e.compound.compound.statements->last).expressions->last;
                  else
                     e = e.list->last;
               }
            }
            if(exp.op.op == TokenType::sizeOf && e && e.expType)
            {
               if(e.type == stringExp && e.string)
               {
                  char * string = e.string;
                  int len = strlen(string);
                  char * tmp = new char[len-2+1];
                  len = UnescapeString(tmp, string + 1, len - 2);
                  delete tmp;
                  FreeExpContents(exp);
                  exp.type = constantExp;
                  exp.constant = PrintUInt(len + 1);
               }
               else
               {
                  Type type = e.expType;
                  type.refCount++;
                  FreeExpContents(exp);
                  exp.type = constantExp;
                  exp.constant = PrintUInt(ComputeTypeSize(type));
                  FreeType(type);
               }
               break;
            }
            else
               ComputeExpression(exp.op.exp2);
         }
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
               Expression prev = exp.prev;
               Expression next = exp.next;

               // For operations which set the exp type on brackets exp after the inner exp was processed...
               if(exp.expType && exp.expType.kind == classType && (!e.expType || e.expType.kind != classType))
               {
                  FreeType(e.expType);
                  e.expType = exp.expType;
                  e.expType.refCount++;
               }
               ComputeExpression(e);
               //FreeExpContents(exp);
               if(/*e.type != memberExp && */e.type != opExp && e.type != castExp)
               {
                  FreeType(exp.expType);
                  FreeType(exp.destType);
                  *exp = *e;
                  exp.prev = prev;
                  exp.next = next;
                  delete e;
                  delete list;
               }
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
               PrintTypeNoConst(type, string, false, true);
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
                                    exp.instance._class = MkSpecifierName(_class.fullName);
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
                                 exp.instance._class = MkSpecifierName(_class.fullName);
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
                                 exp.instance._class = MkSpecifierName(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;

                                 GetIntPtr(value, &intValue);

                                 Set(exp.instance.data, intValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case intSizeType:
                              {
                                 // TOFIX:
                                 intsize intValue;
                                 void (*Set)(void *, intsize) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;

                                 GetIntSize(value, &intValue);

                                 Set(exp.instance.data, intValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case floatType:
                              {
                                 float floatValue;
                                 void (*Set)(void *, float) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName(_class.fullName);
                                 exp.instance.loc = exp.loc;
                                 exp.type = instanceExp;

                                 GetFloat(value, &floatValue);

                                 Set(exp.instance.data, floatValue);
                                 PopulateInstance(exp.instance);
                                 break;
                              }
                              case doubleType:
                              {
                                 double doubleValue;
                                 void (*Set)(void *, double) = (void *)prop.Set;

                                 exp.instance = Instantiation { };
                                 exp.instance.data = new0 byte[_class.structSize];
                                 exp.instance._class = MkSpecifierName(_class.fullName);
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
                                    exp.instance._class = MkSpecifierName(_class.fullName);
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
                           byte * value = (exp.member.exp.type == instanceExp ) ? exp.member.exp.instance.data : null;
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
                                    exp.instance._class = MkSpecifierName(_class.fullName);
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
         if(type.name && (
            !strcmpi(type.name, "SCOPE_ID") ||
            !strcmpi(type.name, "IN_PKTINFO_EX")
            ))
            // TODO: Detect types we cannot compute (e.g. bit fields)
            ;
         else
         {
            FreeExpContents(exp);
            exp.constant = PrintUInt(ComputeTypeSize(type));
            exp.type = constantExp;
            FreeType(type);
         }
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

               DeclareClass(curExternal, classSym, className);

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
               case _BoolType:
               case charType:
                  if(type.isSigned)
                  {
                     char value = 0;
                     if(GetChar(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintChar(value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     unsigned char value = 0;
                     if(GetUChar(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUChar(value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case shortType:
                  if(type.isSigned)
                  {
                     short value = 0;
                     if(GetShort(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintShort(value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     unsigned short value = 0;
                     if(GetUShort(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUShort(value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case intType:
                  if(type.isSigned)
                  {
                     int value = 0;
                     if(GetInt(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintInt(value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     unsigned int value = 0;
                     if(GetUInt(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUInt(value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case int64Type:
                  if(type.isSigned)
                  {
                     int64 value = 0;
                     if(GetInt64(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintInt64(value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     uint64 value = 0;
                     if(GetUInt64(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUInt64(value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case intPtrType:
                  if(type.isSigned)
                  {
                     intptr value = 0;
                     if(GetIntPtr(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintInt64((int64)value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     uintptr value = 0;
                     if(GetUIntPtr(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUInt64((uint64)value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case intSizeType:
                  if(type.isSigned)
                  {
                     intsize value = 0;
                     if(GetIntSize(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintInt64((int64)value);
                        exp.type = constantExp;
                     }
                  }
                  else
                  {
                     uintsize value = 0;
                     if(GetUIntSize(e, &value))
                     {
                        FreeExpContents(exp);
                        exp.constant = PrintUInt64((uint64)value);
                        exp.type = constantExp;
                     }
                  }
                  break;
               case floatType:
               {
                  float value = 0;
                  if(GetFloat(e, &value))
                  {
                     FreeExpContents(exp);
                     exp.constant = PrintFloat(value);
                     exp.type = constantExp;
                  }
                  break;
               }
               case doubleType:
               {
                  double value = 0;
                  if(GetDouble(e, &value))
                  {
                     FreeExpContents(exp);
                     exp.constant = PrintDouble(value);
                     exp.type = constantExp;
                  }
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

static bool CheckExpressionType(Expression exp, Type destType, bool skipUnitBla, bool warnConst)
{
   bool result = true;
   if(destType)
   {
      OldList converts { };
      Conversion convert;

      if(destType.kind == voidType)
         return false;

      if(!MatchTypeExpression(exp, destType, &converts, skipUnitBla, warnConst))
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
               newExp.prev = null;
               newExp.next = null;
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
                  if(exp.destType && exp.destType.casted)
                     exp.needCast = true;
                  if(exp.expType) exp.expType.refCount++;
               }
               else
               {
                  exp.expType = convert.resultType ? convert.resultType : MkClassType(convert.convert._class.fullName);
                  if(exp.destType && exp.destType.casted)
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
         result = MatchTypes(exp.expType, exp.destType, null, null, null, true, true, false, false, warnConst);
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

void modifyPassAsTemplate(Type * typePtr, bool value)
{
   if(*typePtr && typePtr->passAsTemplate != value)
   {
      Type type { refCount = 1 };
      CopyTypeInto(type, *typePtr);
      type.passAsTemplate = value;
      FreeType(*typePtr);
      *typePtr = type;
   }
}

void CheckTemplateTypes(Expression exp)
{
   /*
   bool et = exp.expType ? exp.expType.passAsTemplate : false;
   bool dt = exp.destType ? exp.destType.passAsTemplate : false;
   */
   Expression nbExp = GetNonBracketsExp(exp);
   if(exp.destType && exp.destType.passAsTemplate && exp.expType && exp.expType.kind != templateType && !exp.expType.passAsTemplate &&
      (nbExp == exp || nbExp.type != castExp))
   {
      Expression newExp { };
      Context context;
      TypeKind kind = exp.expType.kind;
      *newExp = *exp;
      if(exp.destType) exp.destType.refCount++;
      if(exp.expType)  exp.expType.refCount++;
      newExp.prev = null;
      newExp.next = null;

      if(exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered)
      {
         Class c = exp.expType._class.registered;
         if(c.type == bitClass || c.type == enumClass || c.type == unitClass)
         {
            if(!c.dataType)
               c.dataType = ProcessTypeString(c.dataTypeString, false);
            kind = c.dataType.kind;
         }
      }

      switch(kind)
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
               // We want to pass as a template argument
               // ({ union { double d; uint64 i; } u; u.d = [newExp]; u.i; })
               OldList * specs;
               OldList * unionDefs = MkList();
               OldList * statements = MkList();
               context = PushContext();
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(DOUBLE)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("d"))), null)));
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), null)));
               specs = MkListOne(MkStructOrUnion(unionSpecifier, null, unionDefs ));
               exp.type = extensionCompoundExp;

               modifyPassAsTemplate(&exp.expType, true);
               modifyPassAsTemplate(&newExp.destType, false);
               modifyPassAsTemplate(&newExp.expType, false);

               exp.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), null)))),statements);
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         case floatType:
            if(exp.destType.classObjectType)
            {
               // We need to pass the address, just pass it along (Undo what was done above)
               if(exp.destType) exp.destType.refCount--;
               if(exp.expType)  exp.expType.refCount--;
               delete newExp;
            }
            else
            {
               // We want to pass as a template argument
               // ({ union { float f; uint64 i; } u; u.f = [newExp]; u.i; })
               OldList * specs;
               OldList * unionDefs = MkList();
               OldList * statements = MkList();
               context = PushContext();
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(FLOAT)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("f"))), null)));
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), null)));
               specs = MkListOne(MkStructOrUnion(unionSpecifier, null, unionDefs ));
               exp.type = extensionCompoundExp;
               exp.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), null)))),statements);

               modifyPassAsTemplate(&exp.expType, true);
               modifyPassAsTemplate(&newExp.destType, false);
               modifyPassAsTemplate(&newExp.expType, false);

               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("f")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         case voidType:
            // Generated code already processed...
            break;
         default:
            exp.type = castExp;
            exp.cast.typeName = MkTypeName(MkListOne(MkSpecifierName("uint64")), null);
            if((exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass) || exp.expType.isPointerType)
               exp.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), MkExpBrackets(MkListOne(newExp)));
            else
               exp.cast.exp = MkExpBrackets(MkListOne(newExp));
            exp.needCast = true;
            break;
      }
   }
   else if(exp.expType && exp.expType.passAsTemplate && exp.destType && exp.usage.usageGet && exp.destType.kind != templateType && !exp.destType.passAsTemplate)
   {
      Expression newExp { };
      Context context;
      TypeKind kind = exp.expType.kind;
      *newExp = *exp;
      if(exp.destType) exp.destType.refCount++;
      if(exp.expType)  exp.expType.refCount++;
      newExp.prev = null;
      newExp.next = null;

      if(exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered)
      {
         Class c = exp.expType._class.registered;
         if(c.type == bitClass || c.type == enumClass || c.type == unitClass)
         {
            if(!c.dataType)
               c.dataType = ProcessTypeString(c.dataTypeString, false);
            kind = c.dataType.kind;
         }
      }

      switch(kind)
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

               modifyPassAsTemplate(&exp.expType, false);
               modifyPassAsTemplate(&newExp.destType, true);
               modifyPassAsTemplate(&newExp.expType, true);

               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("d")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         case floatType:
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
               // ({ union { float f; uint64 i; } u; u.i = [newExp]; u.f; })
               OldList * specs;
               OldList * unionDefs = MkList();
               OldList * statements = MkList();
               context = PushContext();
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifier(FLOAT)), MkListOne(MkDeclaratorIdentifier(MkIdentifier("f"))), null)));
               ListAdd(unionDefs, MkClassDefDeclaration(MkStructDeclaration(MkListOne(MkSpecifierName("uint64")), MkListOne(MkDeclaratorIdentifier(MkIdentifier("i"))), null)));
               specs = MkListOne(MkStructOrUnion(unionSpecifier, null, unionDefs ));
               exp.type = extensionCompoundExp;
               exp.compound = MkCompoundStmt(MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_union")), null)))),statements);

               modifyPassAsTemplate(&exp.expType, false);
               modifyPassAsTemplate(&newExp.destType, true);
               modifyPassAsTemplate(&newExp.expType, true);

               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("i")), '=', newExp))));
               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internal_union")), MkIdentifier("f")))));
               exp.compound.compound.context = context;
               PopContext(context);
            }
            break;
         case classType:
         {
            if(exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass)
            {
               exp.type = bracketsExp;

               newExp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), newExp);
               exp.list = MkListOne(MkExpOp(null, '*', MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp.expType._class.string)),
                  MkDeclaratorPointer(MkPointer(null, null), null)), newExp)));
               ProcessExpressionType(exp.list->first);
               break;
            }
            else
            {
               exp.type = bracketsExp;
               if(exp.expType.isPointerType)
               {
                  exp.needTemplateCast = 2;
                  newExp.needCast = true;
                  newExp.needTemplateCast = 2;
                  newExp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), newExp);
               }

               exp.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName(exp.expType._class.string)), null), newExp));
               exp.needTemplateCast = 2;
               newExp.needCast = true;
               newExp.needTemplateCast = 2;
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
            /*if(newExp.type == memberExp && newExp.member.memberType == dataMember)
            {
               // When was this required?    Removed to address using templated values to pass to printf()
               exp.type = opExp;
               exp.op.op = '*';
               exp.op.exp1 = null;
               exp.op.exp2 = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer(null, null), null)),
                  MkExpBrackets(MkListOne(MkExpOp(null, '&', newExp))));
            }
            else*/
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
               exp.needTemplateCast = 2;
               newExp.needTemplateCast = 2;
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

static Symbol ScanWithNameSpace(BinaryTree tree, const char * nameSpace, const char * name)
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

static Symbol FindWithNameSpace(BinaryTree tree, const char * name)
{
   int c;
   char nameSpace[1024];
   const char * namePart;
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

/*static */Symbol FindSymbol(const char * name, Context startContext, Context endContext, bool isStruct, bool globalNameSpace)
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
   if(inCompiler && symbol && ctx == globalContext && symbol.pointerExternal && curExternal && symbol.pointerExternal != curExternal)
      curExternal.CreateUniqueEdge(symbol.pointerExternal, symbol.pointerExternal.type == functionExternal);
#ifdef _DEBUG
   //findSymbolTotalTime += GetTime() - startTime;
#endif
   return symbol;
}

static void GetTypeSpecs(Type type, OldList * specs)
{
   if(!type.isSigned && type.kind != intPtrType && type.kind != intSizeType) ListAdd(specs, MkSpecifier(UNSIGNED));
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
      case _BoolType: ListAdd(specs, MkSpecifier(_BOOL)); break;
      case shortType: ListAdd(specs, MkSpecifier(SHORT)); break;
      case int64Type: ListAdd(specs, MkSpecifier(INT64)); break;
      case int128Type: ListAdd(specs, MkSpecifier(INT128)); break;
      case float128Type: ListAdd(specs, MkSpecifier(FLOAT128)); break;
      case intPtrType: ListAdd(specs, MkSpecifierName(type.isSigned ? "intptr" : "uintptr")); break;
      case intSizeType: ListAdd(specs, MkSpecifierName(type.isSigned ? "intsize" : "uintsize")); break;
      case intType:
      default:
         ListAdd(specs, MkSpecifier(INT)); break;
   }
}

static void PrintArraySize(Type arrayType, char * string)
{
   char size[256];
   size[0] = '\0';
   strcat(size, "[");
   if(arrayType.enumClass)
      strcat(size, arrayType.enumClass.string);
   else if(arrayType.arraySizeExp)
      PrintExpression(arrayType.arraySizeExp, size);
   strcat(size, "]");
   strcat(string, size);
}

// WARNING : This function expects a null terminated string since it recursively concatenate...
static void PrintTypeSpecs(Type type, char * string, bool fullName, bool printConst)
{
   if(type)
   {
      if(printConst && type.constant)
         strcat(string, "const ");
      switch(type.kind)
      {
         case classType:
         {
            Symbol c = type._class;
            bool isObjectBaseClass = !c || !c.string || !strcmp(c.string, "class");
            // TODO: typed_object does not fully qualify the type, as it may have taken up an actual class (Stored in _class) from overriding
            //       look into merging with thisclass ?
            if(type.classObjectType == typedObject && isObjectBaseClass)
               strcat(string, "typed_object");
            else if(type.classObjectType == anyObject && isObjectBaseClass)
               strcat(string, "any_object");
            else
            {
               if(c && c.string)
               {
                  const char * name = (fullName || !c.registered) ? c.string : c.registered.name;
                  if(inBGen && bgenSymbolSwap)
                     name = bgenSymbolSwap(name, true, true);
                  strcat(string, name);
               }
            }
            if(type.byReference)
               strcat(string, " &");
            break;
         }
         case voidType: strcat(string, "void"); break;
         case intType:  strcat(string, type.isSigned ? "int" : "uint"); break;
         case int64Type:  strcat(string, type.isSigned ? "int64" : "uint64"); break;
         case int128Type:  strcat(string, type.isSigned ? "__int128" : "unsigned __int128"); break;
         case float128Type:  strcat(string, type.isSigned ? "__float128" : "unsigned __float128"); break;
         case intPtrType:  strcat(string, type.isSigned ? "intptr" : "uintptr"); break;
         case intSizeType:  strcat(string, type.isSigned ? "intsize" : "uintsize"); break;
         case charType: strcat(string, type.isSigned ? "char" : "byte"); break;
         case _BoolType: strcat(string, "_Bool"); break;
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
               strcat(string, type.typeName);
            else
            {
               Type member;
               strcat(string, "struct { ");
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
               strcat(string, type.typeName);
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
               strcat(string, type.typeName);
            else
               strcat(string, "int"); // "enum");
            break;
         case ellipsisType:
            strcat(string, "...");
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
      }
   }
}

static void PrintName(Type type, char * string, bool fullName)
{
   if(type.name && type.name[0])
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
}

static void PrintAttribs(Type type, char * string)
{
   if(type)
   {
      if(type.dllExport)   strcat(string, "dllexport ");
      if(type.attrStdcall) strcat(string, "stdcall ");
   }
}

static void PrePrintType(Type type, char * string, bool fullName, Type parentType, bool printConst)
{
   if(type.kind == arrayType || type.kind == pointerType || type.kind == functionType || type.kind == methodType)
   {
      if((type.kind == functionType || type.kind == methodType) && (!parentType || parentType.kind != pointerType))
         PrintAttribs(type, string);
      if(printConst && type.constant && (type.kind == functionType || type.kind == methodType))
         strcat(string, " const");
      PrePrintType(type.kind == methodType ? type.method.dataType : type.type, string, fullName, type, printConst);
      if(type.kind == pointerType && (type.type.kind == arrayType || type.type.kind == functionType || type.type.kind == methodType))
         strcat(string, " (");
      if(type.kind == pointerType)
      {
         if(type.type.kind == functionType || type.type.kind == methodType)
            PrintAttribs(type.type, string);
      }
      if(type.kind == pointerType)
      {
         if(type.type.kind == functionType || type.type.kind == methodType || type.type.kind == arrayType)
            strcat(string, "*");
         else
            strcat(string, " *");
      }
      if(printConst && type.constant && type.kind == pointerType)
         strcat(string, " const");
   }
   else
      PrintTypeSpecs(type, string, fullName, printConst);
}

static void PostPrintType(Type type, char * string, bool fullName)
{
   if(type.kind == pointerType && (type.type.kind == arrayType || type.type.kind == functionType || type.type.kind == methodType))
      strcat(string, ")");
   if(type.kind == arrayType)
      PrintArraySize(type, string);
   else if(type.kind == functionType)
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
   if(type.kind == arrayType || type.kind == pointerType || type.kind == functionType || type.kind == methodType)
      PostPrintType(type.kind == methodType ? type.method.dataType : type.type, string, fullName);
}

// *****
// TODO: Add a max buffer size to avoid overflows. This function is used with static size char arrays.
// *****
static void _PrintType(Type type, char * string, bool printName, bool fullName, bool printConst)
{
   PrePrintType(type, string, fullName, null, printConst);

   if(type.thisClass || (printName && type.name && type.name[0]))
      strcat(string, " ");
   if(/*(type.kind == methodType || type.kind == functionType) && */(type.thisClass || type.staticMethod))
   {
      Symbol _class = type.thisClass;
      if((type.classObjectType == typedObject || type.classObjectType == classPointer) || (_class && !strcmp(_class.string, "class")))
      {
         if(type.classObjectType == classPointer)
            strcat(string, "class");
         else
            strcat(string, type.byReference ? "typed_object&" : "typed_object");
      }
      else if(_class && _class.string)
      {
         String s = _class.string;
         if(fullName)
            strcat(string, s);
         else
         {
            char * name = RSearchString(s, "::", strlen(s), true, false);
            if(name) name += 2; else name = s;
            strcat(string, name);
         }
      }
      strcat(string, "::");
   }

   if(printName && type.name)
      PrintName(type, string, fullName);
   PostPrintType(type, string, fullName);
   if(type.bitFieldCount)
   {
      char count[100];
      sprintf(count, ":%d", type.bitFieldCount);
      strcat(string, count);
   }
}

void PrintType(Type type, char * string, bool printName, bool fullName)
{
   _PrintType(type, string, printName, fullName, true);
}

void PrintTypeNoConst(Type type, char * string, bool printName, bool fullName)
{
   _PrintType(type, string, printName, fullName, false);
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

public bool GetParseError() { return parseError; }

Expression ParseExpressionString(char * expression)
{
   parseError = false;

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
      NamedLink64 value = null;
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
            if(inBGen && value)
            {
               exp.expType = MkClassType(baseClass.fullName);
               break;
            }
            else if(value)
            {
               exp.isConstant = true;
               if(inCompiler || inPreCompiler || inDebugger)
               {
                  char constant[256];
                  FreeExpContents(exp);

                  exp.type = constantExp;
                  if(!strcmp(baseClass.dataTypeString, "int") || !strcmp(baseClass.dataTypeString, "int64") || !strcmp(baseClass.dataTypeString, "char") || !strcmp(baseClass.dataTypeString, "short"))
                     sprintf(constant, FORMAT64D, value.data);
                  else
                     sprintf(constant, FORMAT64HEX, value.data);
                  exp.constant = CopyString(constant);
               }
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
            exp.constant = QMkString((char *)(uintptr)classProp.Get(_class));
         }
         else
         {
            char constant[256];
            exp.type = constantExp;
            sprintf(constant, "%d", (int)classProp.Get(_class));
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
   if(nameSpace && c - start)
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
#ifdef _DEBUG
   char debugExpString[4096];
   debugExpString[0] = '\0';
   PrintExpression(e, debugExpString);
#endif

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

            PrintTypeNoConst(type, string, false, true);
            classSym = FindClass(string);
            if(classSym) _class = classSym.registered;
         }

         if((_class && (_class.type == enumClass || _class.type == unitClass || _class.type == bitClass || _class.type == systemClass) && strcmp(_class.fullName, "class") && strcmp(_class.fullName, "uintptr") && strcmp(_class.fullName, "intptr")) || // Patched so that class isn't considered SYSTEM...
            (!e.expType.classObjectType && (((type.kind != pointerType && type.kind != intPtrType && type.kind != subClassType && (type.kind != classType || !type._class || !type._class.registered || type._class.registered.type == structClass))) ||
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
                     sprintf(size, "%d", e.expType.size);   // Potential 32/64 Bootstrap issue
                     newExp = MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)),
                        MkDeclaratorPointer(MkPointer(null, null), null)), newExp), '+',
                           MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne(MkExpConstant(size))))));
                  }

                  ReplaceExpContents(checkedExp, newExp);
                  e.byReference = true;
               }
               else if(!e.byReference || (_class && _class.type == noHeadClass))     // TESTING THIS HERE...
               {
                  Expression checkedExp; //, newExp;

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

                        PrintTypeNoConst(e.expType, typeString, false, true);
                        decl = SpecDeclFromString(typeString, specs, null);
                        newExp.destType = ProcessType(specs, decl);

                        curContext = context;

                        // We need a current compound for this
                        if(curCompound)
                        {
                           char name[100];
                           OldList * stmts = MkList();
                           e.type = extensionCompoundExp;
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
                     checkedExp.Clear();
                     checkedExp.destType = ProcessTypeString("void *", false);
                     checkedExp.expType = checkedExp.destType;
                     checkedExp.destType.refCount++;

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
      if(e.expType.classObjectType && destType && destType.classObjectType) //e.expType.kind == classType && e.expType._class && e.expType._class.registered && !strcmp(e.expType._class.registered.name, "class"))
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
         e.list = MkListOne(MkExpOp(null, '*', thisExp.type == identifierExp ? thisExp : MkExpBrackets(MkListOne(thisExp))));
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
         bool backupByReference;

         if(e.expType.kind == classType && e.expType._class && e.expType._class.registered && strcmp(e.expType._class.registered.name, "class"))
            type = e.expType;
         else
            type = destType;

         backupClassObjectType = type.classObjectType;
         backupByReference = type.byReference;

         type.classObjectType = none;
         type.byReference = false;

         typeString[0] = '\0';
         PrintType(type, typeString, false, true);
         decl = SpecDeclFromString(typeString, specs, null);

         type.classObjectType = backupClassObjectType;
         type.byReference = backupByReference;

         *thisExp = *e;
         thisExp.prev = null;
         thisExp.next = null;
         e.Clear();

         if( ( type.kind == classType && type._class && type._class.registered &&
                   (type._class.registered.type == systemClass || type._class.registered.type == bitClass ||
                    type._class.registered.type == enumClass || type._class.registered.type == unitClass) ) ||
             (type.kind != pointerType && type.kind != intPtrType && type.kind != arrayType && type.kind != classType) ||
             (!destType.byReference && byReference && (destType.kind != pointerType || type.kind != pointerType)))
         {
            bool passAsTemplate = thisExp.destType.passAsTemplate;
            Type t;

            destType.refCount++;

            e.type = opExp;
            e.op.op = '*';
            e.op.exp1 = null;
            e.op.exp2 = MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), thisExp);

            t = { };
            CopyTypeInto(t, thisExp.destType);
            t.passAsTemplate = false;
            FreeType(thisExp.destType);
            thisExp.destType = t;

            t = { };
            CopyTypeInto(t, destType);
            t.passAsTemplate = passAsTemplate;
            FreeType(destType);
            destType = t;
            destType.refCount = 0;

            e.expType = { };
            CopyTypeInto(e.expType, type);
            if(type.passAsTemplate)
            {
               e.expType.classObjectType = none;
               e.expType.passAsTemplate = false;
            }
            e.expType.byReference = false;
            e.expType.refCount = 1;
         }
         else
         {
            e.type = castExp;
            e.cast.typeName = MkTypeName(specs, decl);
            e.cast.exp = thisExp;
            e.byReference = true;
            e.expType = type;
            type.refCount++;
         }

         if(e.destType)
            FreeType(e.destType);

         e.destType = destType;
         destType.refCount++;
      }
   }
}

void ApplyLocation(Expression exp, Location loc)
{
   exp.loc = loc;
   switch(exp.type)
   {
      case opExp:
         if(exp.op.exp1) ApplyLocation(exp.op.exp1, loc);
         if(exp.op.exp2) ApplyLocation(exp.op.exp2, loc);
         break;
      case bracketsExp:
         if(exp.list)
         {
            Expression e;
            for(e = exp.list->first; e; e = e.next)
               ApplyLocation(e, loc);
         }
         break;
      case indexExp:
         if(exp.index.index)
         {
            Expression e;
            for(e = exp.index.index->first; e; e = e.next)
               ApplyLocation(e, loc);
         }
         if(exp.index.exp)
            ApplyLocation(exp.index.exp, loc);
         break;
      case callExp:
         if(exp.call.arguments)
         {
            Expression arg;
            for(arg = exp.call.arguments->first; arg; arg = arg.next)
               ApplyLocation(arg, loc);
         }
         if(exp.call.exp)
            ApplyLocation(exp.call.exp, loc);
         break;
      case memberExp:
      case pointerExp:
         if(exp.member.exp)
            ApplyLocation(exp.member.exp, loc);
         break;
      case castExp:
         if(exp.cast.exp)
            ApplyLocation(exp.cast.exp, loc);
         break;
      case conditionExp:
         if(exp.cond.exp)
         {
            Expression e;
            for(e = exp.cond.exp->first; e; e = e.next)
               ApplyLocation(e, loc);
         }
         if(exp.cond.cond)
            ApplyLocation(exp.cond.cond, loc);
         if(exp.cond.elseExp)
            ApplyLocation(exp.cond.elseExp, loc);
         break;
      case vaArgExp:
         if(exp.vaArg.exp)
            ApplyLocation(exp.vaArg.exp, loc);
         break;
      default:
         break;
   }
}

bool RelatedUnits(Class c1, Class c2)
{
   if(c1.base.type == unitClass) c1 = c1.base;
   if(c2.base.type == unitClass) c2 = c2.base;
   return c1 == c2;
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
         if(!id || !topContext) return;

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
         else */
         if(!strcmp(id.string, "__runtimePlatform"))
         {
            exp.expType = ProcessTypeString("ecere::com::Platform", true);
            break;
         }
         else if(strstr(id.string, "__ecereClass") == id.string)
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
            Symbol symbol = null;
            bool findInGlobal = false;
            if(!topContext.parent && exp.destType && exp.destType.kind == classType && exp.destType._class && exp.destType._class.registered && exp.destType._class.registered.type == enumClass)
               findInGlobal = true;  // In global context, look at enum values first
            else
               symbol = FindSymbol(id.string, curContext, topContext /*exp.destType ? topContext : globalContext*/, false, id._class && id._class.name == null);

            // Enums should be resolved here (Special pass in opExp to fix identifiers not seen as enum on the first pass)
            if(!symbol/* && exp.destType*/)
            {
               if(exp.destType && CheckExpressionType(exp, exp.destType, false, false))
                  break;
               else
               {
                  if(thisClass && strcmp(id.string, "this"))
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
            if(findInGlobal)
               symbol = FindSymbol(id.string, curContext, topContext, false, id._class && id._class.name == null);

            // Avoid trigonometric functions from math.h defined without 'Angle' unit
            if(symbol && !symbol.ctx /*symbol.ctx == globalContext*/ && symbol.type && symbol.type.kind == functionType &&
               (!strcmp(id.string, "sin") || !strcmp(id.string, "cos") || !strcmp(id.string, "tan") ||
                !strcmp(id.string, "asin") || !strcmp(id.string, "acos") || !strcmp(id.string, "atan") || !strcmp(id.string, "atan2") ||
                !strcmp(id.string, "sinh") || !strcmp(id.string, "cosh") || !strcmp(id.string, "tanh") ||
                !strcmp(id.string, "asinh") || !strcmp(id.string, "acosh") || !strcmp(id.string, "atanh")))
               symbol = null;

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

                                                // Commented this out, it was making non-constant enum parameters seen as constant
                                                // enums should have been resolved by ResolveIdWithClass, changed to constantExp and marked as constant
               if(type && (type.kind == enumType /*|| (_class && _class.type == enumClass)*/))
                  // Add missing cases here... enum Classes...
                  exp.isConstant = true;

               // TOCHECK: Why was !strcmp(id.string, "this") commented out?
               if(symbol.isParam || !strcmp(id.string, "this"))
               {
                  if(_class && _class.type == structClass && !type.declaredWithStruct)
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
                  if(!inBGen)
                  {
                     int c;
                     for(c = 0; c<definedExpStackPos; c++)
                        if(definedExpStack[c] == definedExp)
                           break;
                     if(c == definedExpStackPos && c < sizeof(definedExpStack) / sizeof(void *))
                     {
                        Location backupYylloc = yylloc;
                        File backInput = fileInput;
                        definedExpStack[definedExpStackPos++] = definedExp;

                        fileInput = TempFile { };
                        fileInput.Write(definedExp.value, 1, strlen(definedExp.value));
                        fileInput.Seek(0, start);

                        echoOn = false;
                        parsedExpression = null;
                        resetScanner();
                        expression_yyparse();
                        delete fileInput;
                        if(backInput)
                           fileInput = backInput;

                        yylloc = backupYylloc;

                        if(parsedExpression)
                        {
                           FreeIdentifier(id);
                           exp.type = bracketsExp;
                           exp.list = MkListOne(parsedExpression);
                           ApplyLocation(parsedExpression, yylloc);
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
                     DeclareGlobalData(curExternal, data);
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
                        if(DeclareFunction(curExternal, function, name))
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
         // Class _class;
         // Symbol classSym;

         if(!exp.instance._class)
         {
            if(exp.destType && exp.destType.kind == classType && exp.destType._class)
            {
               exp.instance._class = MkSpecifierName(exp.destType._class.string);
            }
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
            char * constant = exp.constant;
            Type type
            {
               refCount = 1;
               constant = true;
            };
            exp.expType = type;

            if(constant[0] == '\'')
            {
               if((int)((byte *)constant)[1] > 127)
               {
                  int nb;
                  unichar ch = UTF8GetChar(constant + 1, &nb);
                  if(nb < 2) ch = constant[1];
                  delete constant;
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
            else
            {
               char * dot = strchr(constant, '.');
               bool isHex = (constant[0] == '0' && (constant[1] == 'x' || constant[1] == 'X'));
               char * exponent;
               if(isHex)
               {
                  exponent = strchr(constant, 'p');
                  if(!exponent) exponent = strchr(constant, 'P');
               }
               else
               {
                  exponent = strchr(constant, 'e');
                  if(!exponent) exponent = strchr(constant, 'E');
               }

               if(dot || exponent)
               {
                  if(strchr(constant, 'f') || strchr(constant, 'F'))
                     type.kind = floatType;
                  else
                     type.kind = doubleType;
                  type.isSigned = true;
               }
               else
               {
                  bool isSigned = constant[0] == '-';
                  char * endP = null;
                  int64 i64 = strtoll(constant, &endP, 0);
                  uint64 ui64 = strtoull(constant, &endP, 0);
                  bool is64Bit = endP && (!strcmp(endP, "LL") || !strcmp(endP, "ll") || !strcmp(endP, "LLU") || !strcmp(endP, "llu") || !strcmp(endP, "ull") || !strcmp(endP, "ULL"));
                  bool forceUnsigned = endP && (!strcmp(endP, "U") || !strcmp(endP, "u") || !strcmp(endP, "LLU") || !strcmp(endP, "llu") || !strcmp(endP, "ull") || !strcmp(endP, "ULL"));
                  if(isSigned)
                  {
                     if(i64 < MININT)
                        is64Bit = true;
                  }
                  else
                  {
                     if(ui64 > MAXINT)
                     {
                        if(ui64 > MAXDWORD)
                        {
                           is64Bit = true;
                           if(ui64 <= MAXINT64 && (constant[0] != '0' || !constant[1]))
                              isSigned = true;
                        }
                     }
                     else if(constant[0] != '0' || !constant[1])
                        isSigned = true;
                  }
                  if(forceUnsigned)
                     isSigned = false;
                  type.kind = is64Bit ? int64Type : intType;
                  type.isSigned = isSigned;
               }
            }
            exp.isConstant = true;
            if(exp.destType && exp.destType.kind == doubleType)
               type.kind = doubleType;
            else if(exp.destType && exp.destType.kind == floatType)
               type.kind = floatType;
            else if(exp.destType && exp.destType.kind == int64Type)
               type.kind = int64Type;
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
               kind = exp.wideString ? shortType : charType;
               constant = true;
               isSigned = exp.wideString ? false : true;
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
         DeclareType(curExternal, exp.expType.type, true, false);
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
         DeclareType(curExternal, exp.expType.type, true, false);
         break;
      case opExp:
      {
         bool assign = false, boolResult = false, boolOps = false;
         Type type1 = null, type2 = null;
         bool useDestType = false, useSideType = false;
         Location oldyylloc = yylloc;
         bool useSideUnit = false;
         Class destClass = (exp.destType && exp.destType.kind == classType && exp.destType._class) ? exp.destType._class.registered : null;
         bool powerOp = false, relationOp = false;
         Class c1 = null, c2 = null;

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
               relationOp = true;
               break;
            case '+':
            case '-':
               useSideUnit = true;
               useSideType = true;
               useDestType = true;
               break;

            case LEFT_OP:
            case RIGHT_OP:
               // useSideType = true;
               // useDestType = true;
               break;

            case '|':
            case '^':
               useSideType = true;
               useDestType = true;
               break;

            case '/':
            case '%':
               useSideType = true;
               useDestType = true;
               if(exp.op.op == '/') powerOp = true;
               break;
            case '&':
            case '*':
               if(exp.op.exp1)
               {
                  // For & operator, useDestType nicely ensures the result will fit in a bool (TODO: Fix for generic enum)
                  useSideType = true;
                  useDestType = true;
                  if(exp.op.op == '*') powerOp = true;
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
            // Added this check here to use the dest type only for units derived from the base unit
            // So that untyped units will use the side unit as opposed to the untyped destination unit
            // This fixes (#771) sin(Degrees { 5 } + 5) to be equivalent to sin(Degrees { 10 }), since sin expects a generic Angle
            if(exp.op.exp2 && useSideUnit && useDestType && destClass && destClass.type == unitClass && destClass.base.type != unitClass)
               useDestType = false;

            if(destClass && useDestType &&
              ((destClass.type == unitClass && useSideUnit) || destClass.type == enumClass || destClass.type == bitClass))

              //(exp.destType._class.registered.type == unitClass || exp.destType._class.registered.type == enumClass) && useDestType)
            {
               if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
               exp.op.exp1.destType = exp.destType;
               exp.op.exp1.opDestType = true;
               if(exp.destType)
                  exp.destType.refCount++;
            }
            else if(!assign)
            {
               if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
               exp.op.exp1.destType = dummy;
               dummy.refCount++;
               if(powerOp)
                  exp.op.exp1.opDestType = true;
               if(relationOp)
                  exp.op.exp1.usedInComparison = true;
            }
            if(exp.op.op == '+' || exp.op.op == '-')
            {
               if(exp.opDestType)
                  exp.op.exp1.parentOpDestType = true;
               if(exp.usedInComparison)
                  exp.op.exp1.usedInComparison = true;
            }

            // TESTING THIS HERE...
            if(exp.op.exp1.destType && exp.op.op != '=') exp.op.exp1.destType.count++;
               ProcessExpressionType(exp.op.exp1);
            if(exp.op.exp1.destType && exp.op.op != '=') exp.op.exp1.destType.count--;

            exp.op.exp1.opDestType = false;
            exp.op.exp1.usedInComparison = false;

            // Fix for unit and ++ / --
            if(!exp.op.exp2 && (exp.op.op == INC_OP || exp.op.op == DEC_OP) && exp.op.exp1.expType && exp.op.exp1.expType.kind == classType &&
               exp.op.exp1.expType._class && exp.op.exp1.expType._class.registered && exp.op.exp1.expType._class.registered.type == unitClass)
            {
               exp.op.exp2 = MkExpConstant("1");
               exp.op.op = exp.op.op == INC_OP ? ADD_ASSIGN : SUB_ASSIGN;
               assign = true;
            }

            if(exp.op.exp1.destType == dummy)
            {
               FreeType(dummy);
               exp.op.exp1.destType = null;
            }

            if(exp.op.exp2)
            {
               if(!assign && exp.op.exp1.expType && (exp.op.exp1.expType.kind == charType || exp.op.exp1.expType.kind == shortType))
               {
                  Type type { kind = intType, isSigned = true, refCount = 1, signedBeforePromotion = exp.op.exp1.expType.isSigned, bitMemberSize = exp.op.exp1.expType.bitMemberSize, promotedFrom = exp.op.exp1.expType.kind };
                  FreeType(exp.op.exp1.expType);
                  exp.op.exp1.expType = type;
               }
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
                  if(!exp.op.exp1 || (exp.op.op != '&' && exp.op.op != '^'))
                     exp.op.exp2.opDestType = true;
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
            else if(destClass &&
                  ((destClass.type == unitClass && useDestType && useSideUnit) ||
                  (destClass.type == enumClass && useDestType)))
            {
               if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
               exp.op.exp2.destType = exp.destType;
               if(exp.op.op != '&' && exp.op.op != '^')
                  exp.op.exp2.opDestType = true;
               if(exp.destType)
                  exp.destType.refCount++;
            }
            else
            {
               if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
               exp.op.exp2.destType = dummy;
               dummy.refCount++;
               if(powerOp)
                  exp.op.exp2.opDestType = true;
               if(relationOp)
                  exp.op.exp2.usedInComparison = true;
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
            // Cannot lose the cast on a sizeof
            if(exp.op.op == SIZEOF)
            {
               Expression e = exp.op.exp2;
               while((e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp) && e.list)
               {
                  if(e.type == bracketsExp || e.type == extensionExpressionExp || e.type == extensionCompoundExp)
                  {
                     if(e.type == extensionCompoundExp)
                        e = ((Statement)e.compound.compound.statements->last).expressions->last;
                     else
                        e = e.list->last;
                  }
               }
               if(e.type == castExp && e.cast.exp)
                  e.cast.exp.needCast = true;
            }
            if(exp.op.op == '+' || exp.op.op == '-')
            {
               if(exp.opDestType)
                  exp.op.exp2.parentOpDestType = true;
               if(exp.usedInComparison)
                  exp.op.exp2.usedInComparison = true;
            }
            ProcessExpressionType(exp.op.exp2);
            exp.op.exp2.opDestType = false;
            exp.op.exp2.usedInComparison = false;
            if(exp.op.exp2.destType && exp.op.op != '=') exp.op.exp2.destType.count--;

            if(!assign && (exp.op.exp1 || exp.op.op == '~'))
            {
               if(exp.op.exp2.expType && (exp.op.exp2.expType.kind == charType || exp.op.exp2.expType.kind == shortType))
               {
                  Type type { kind = intType, isSigned = true, refCount = 1, signedBeforePromotion = exp.op.exp2.expType.isSigned, bitMemberSize = exp.op.exp2.expType.bitMemberSize, promotedFrom = exp.op.exp2.expType.kind };
                  FreeType(exp.op.exp2.expType);
                  exp.op.exp2.expType = type;
               }
            }

            if(assign && type1 && type1.kind == pointerType && exp.op.exp2.expType)
            {
               if(exp.op.exp2.expType.kind == intSizeType || exp.op.exp2.expType.kind == intPtrType || exp.op.exp2.expType.kind == int64Type || exp.op.exp2.expType.kind == intType || exp.op.exp2.expType.kind == shortType || exp.op.exp2.expType.kind == charType)
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

            if(exp.op.op == '-' && !exp.op.exp1 && exp.op.exp2.expType && !exp.op.exp2.expType.isSigned)
            {
               type2 = { };
               type2.refCount = 1;
               CopyTypeInto(type2, exp.op.exp2.expType);
               type2.isSigned = true;
            }
            else if(exp.op.op == '~' && !exp.op.exp1 && exp.op.exp2.expType && (!exp.op.exp2.expType.isSigned || exp.op.exp2.expType.kind != intType))
            {
               type2 = { kind = intType };
               type2.refCount = 1;
               type2.isSigned = true;
            }
            else
            {
               type2 = exp.op.exp2.expType;
               if(type2) type2.refCount++;
            }
         }
         c1 = type1 && type1.kind == classType && type1._class ? type1._class.registered : null;
         c2 = type2 && type2.kind == classType && type2._class ? type2._class.registered : null;

         if(relationOp &&
            ( (exp.op.exp1 && exp.op.exp1.ambiguousUnits && (!c2 || c2.type != unitClass)) ||
               (exp.op.exp2 && exp.op.exp2.ambiguousUnits && (!c1 || c1.type != unitClass))) )
            Compiler_Warning($"ambiguous units in relational operation\n");

         if(!relationOp &&
            ((exp.op.exp1 && exp.op.exp1.ambiguousUnits) ||
             (exp.op.exp2 && exp.op.exp2.ambiguousUnits)) &&
             (!powerOp || !c1 || c1.type != unitClass || !c2 || c2.type != unitClass || !RelatedUnits(c1, c2)))
         {
            if(exp.opDestType || exp.usedInComparison)
               exp.ambiguousUnits = true;
            else
               Compiler_Warning($"ambiguous units\n");
         }

         dummy.kind = voidType;

         if(exp.op.op == SIZEOF)
         {
            exp.expType = Type
            {
               refCount = 1;
               kind = intSizeType;
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
         else if(exp.op.op == LEFT_OP || exp.op.op == RIGHT_OP)
         {
            if(exp.op.exp1.expType)
            {
               exp.expType = exp.op.exp1.expType;
               exp.expType.refCount++;
            }
         }
         else if(!assign)
         {
            if(c1 && !c1.dataType)
               c1.dataType = ProcessTypeString(c1.dataTypeString, false);
            if(c2 && !c2.dataType)
               c2.dataType = ProcessTypeString(c2.dataTypeString, false);

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
                     CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false);
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
                     CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false);
                  FreeType(exp.op.exp2.expType);
                  exp.op.exp2.expType = MkClassType("bool");
                  exp.op.exp2.expType.truth = true;
               }
            }
            else if(powerOp && exp.op.exp1 && exp.op.exp2 && ((c1 && c1.type == unitClass) || (c2 && c2.type == unitClass)))
            {
               // * or / with at least one unit operand
               if(c1 && c1.type == unitClass && c2 && c2.type == unitClass)
               {
                  // This is where we'd handle unit powers e.g. square meters or meters/seconds
                  // For now using base types
                  if(c1.dataType.kind == doubleType)        exp.expType = c1.dataType;
                  else if(c2.dataType.kind == doubleType)   exp.expType = c2.dataType;
                  else if(c1.dataType.kind == floatType)    exp.expType = c1.dataType;
                  else if(c2.dataType.kind == floatType)    exp.expType = c2.dataType;
                  else
                     exp.expType = c1.dataType;
               }
               else if((c1 && c1.type == unitClass) || exp.op.op == '/')   // 1/units should not be typed with unit
                  exp.expType = type1;
               else
                  exp.expType = type2;

               if(exp.expType)
                  exp.expType.refCount++;
            }
            else if(exp.op.exp1 && exp.op.exp2 &&
               ((useSideType /*&&
                     (useSideUnit ||
                        ((!c1 || c1.type != unitClass) &&
                         (!c2 || c2.type != unitClass)))*/) ||
                  ((!type1 || type1.kind != classType || !strcmp(type1._class.string, "String")) &&
                  (!type2 || type2.kind != classType || !strcmp(type2._class.string, "String")))))
            {
               if(type1 && type2 &&
                  // If either both are class or both are not class
                  ((type1.kind == classType && type1._class && strcmp(type1._class.string, "String")) == (type2.kind == classType && type2._class && strcmp(type2._class.string, "String"))))
               {
                  // Added this check for enum subtraction to result in an int type:
                  if(exp.op.op == '-' && ((c1 && c1.type == enumClass) || (c2 && c2.type == enumClass)) )
                  {
                     Type intType = ProcessTypeString((c1 && c1.dataType.kind == int64Type) || (c2 && c2.dataType.kind == int64Type) ? "int64" : "int", false);

                     if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp1.destType = intType;
                     exp.op.exp2.destType = intType;
                     intType.refCount++;
                  }
                  else
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                     exp.op.exp2.destType = type1;
                     type1.refCount++;
                     if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                     exp.op.exp1.destType = type2;
                     type2.refCount++;
                  }

                  // Warning here for adding Radians + Degrees with no destination type
                  if(!boolResult && !exp.opDestType && (!exp.destType || exp.destType.kind != classType) &&
                     c1 && c1.type == unitClass &&
                     c2 && c2.type == unitClass &&
                     c1 != c2)
                  {
                     if(exp.usedInComparison || exp.parentOpDestType)
                        exp.ambiguousUnits = true;
                     else
                        Compiler_Warning($"operating on %s and %s with an untyped result, assuming %s\n",
                           type1._class.string, type2._class.string, type1._class.string);
                  }

                  if(type1.kind == pointerType && type1.type.kind == templateType && type2.kind != pointerType)
                  {
                     Expression argExp = GetTemplateArgExp(type1.type.templateParameter, type1.type.thisClassFrom, thisClass, true);
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

                           exp.op.exp2 = MkExpBrackets(MkListOne(MkExpOp(exp.op.exp2, '*', MkExpMember(classExp, MkIdentifier("typeSize")) )));

                           if(!exp.op.exp2.expType)
                           {
                              if(type2)
                                 FreeType(type2);
                              type2 = exp.op.exp2.expType = ProcessTypeString("int", false); c2 = null;
                              type2.refCount++;
                           }

                           ProcessExpressionType(exp.op.exp2);
                        }
                     }
                  }

                  if(!boolResult && ((type1.kind == pointerType || type1.kind == arrayType || (type1.kind == classType && !strcmp(type1._class.string, "String"))) && (type2.kind == intSizeType || type2.kind == intPtrType || type2.kind == int64Type || type2.kind == intType || type2.kind == shortType || type2.kind == charType)))
                  {
                     if(type1.kind != classType && type1.type.kind == voidType)
                        Compiler_Error($"void *: unknown size\n");
                     exp.expType = type1;
                     if(type1) type1.refCount++;
                  }
                  else if(!boolResult && ((type2.kind == pointerType || type2.kind == arrayType || (type2.kind == classType && !strcmp(type2._class.string, "String"))) && (type1.kind == intSizeType || type1.kind == intPtrType || type1.kind == int64Type || type1.kind == intType || type1.kind == shortType || type1.kind == charType)))
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
                           if(MatchTypes(type1.type, type2.type, null, null, null, false, false, false, false, false))
                           {
                              exp.expType = Type
                              {
                                 kind = intType;
                                 refCount = 1;
                              };
                              success = true;

                              if(type1.type.kind == templateType)
                              {
                                 Expression argExp = GetTemplateArgExp(type1.type.templateParameter, type1.type.thisClassFrom, thisClass, true);
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
                                             MkExpMember(classExp, MkIdentifier("typeSize"))));

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
                        if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp1.destType;
                           if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                           success = true;
                        }
                        else if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp2.destType;
                           if(exp.op.exp2.destType) exp.op.exp2.destType.refCount++;
                           success = true;
                        }
                     }
                     else if(!success)
                     {
                        if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp2.destType;
                           if(exp.op.exp2.destType) exp.op.exp2.destType.refCount++;
                           success = true;
                        }
                        else if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false))
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
               else if(!boolResult && !useSideUnit && c2 && c2.type == unitClass && type1 && type1.kind != classType)
               {
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp1.destType = type2._class.registered.dataType;
                  if(type2._class.registered.dataType)
                     type2._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false);
                  exp.expType = type2;
                  if(type2) type2.refCount++;
               }
               else if(!boolResult && !useSideUnit && c1 && c1.type == unitClass && type2 && type2.kind != classType)
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp2.destType = type1._class.registered.dataType;
                  if(type1._class.registered.dataType)
                     type1._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false);
                  exp.expType = type1;
                  if(type1) type1.refCount++;
               }
               else if(type1)
               {
                  bool valid = false;

                  if(!boolResult && useSideUnit && c1 && c1.type == unitClass && type2 && type2.kind != classType)
                  {
                     if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);

                     exp.op.exp2.destType = c1.dataType;
                     exp.op.exp2.destType.refCount++;

                     CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false);
                     if(type2)
                        FreeType(type2);
                     type2 = exp.op.exp2.destType;
                     c2 = type2 && type2.kind == classType && type2._class ? type2._class.registered : null;
                     if(type2) type2.refCount++;

                     exp.expType = type2;
                     type2.refCount++;
                  }

                  if(!boolResult && useSideUnit && c2 && c2.type == unitClass && type1 && type1.kind != classType)
                  {
                     if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);

                     exp.op.exp1.destType = c2.dataType;
                     exp.op.exp1.destType.refCount++;

                     CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false);
                     type1 = exp.op.exp1.destType;
                     c1 = type1 && type1.kind == classType && type1._class ? type1._class.registered : null;
                     exp.expType = type1;
                     type1.refCount++;
                  }

                  // TESTING THIS NEW CODE
                  if(!boolResult || exp.op.op == '>' || exp.op.op == '<' || exp.op.op == GE_OP || exp.op.op == LE_OP)
                  {
                     bool op1IsEnum = c1 && c1.type == enumClass;
                     bool op2IsEnum = c2 && c2.type == enumClass;
                     if(exp.op.op == '*' || exp.op.op == '/' || exp.op.op == '-' || exp.op.op == '|' || exp.op.op == '^')
                     {
                        // Convert the enum to an int instead for these operators
                        if(op1IsEnum && exp.op.exp2.expType)
                        {
                           if(CheckExpressionType(exp.op.exp1, exp.op.exp2.expType, false, false))
                           {
                              if(exp.expType) FreeType(exp.expType);
                              exp.expType = exp.op.exp2.expType;
                              if(exp.op.exp2.expType) exp.op.exp2.expType.refCount++;
                              valid = true;
                           }
                        }
                        else if(op2IsEnum && exp.op.exp1.expType)
                        {
                           if(CheckExpressionType(exp.op.exp2, exp.op.exp1.expType, false, false))
                           {
                              if(exp.expType) FreeType(exp.expType);
                              exp.expType = exp.op.exp1.expType;
                              if(exp.op.exp1.expType) exp.op.exp1.expType.refCount++;
                              valid = true;
                           }
                        }
                     }
                     else
                     {
                        if(op1IsEnum && exp.op.exp2.expType)
                        {
                           if(CheckExpressionType(exp.op.exp1, exp.op.exp2.expType, false, false))
                           {
                              if(exp.expType) FreeType(exp.expType);
                              exp.expType = exp.op.exp1.expType;
                              if(exp.op.exp1.expType) exp.op.exp1.expType.refCount++;
                              valid = true;
                           }
                        }
                        else if(op2IsEnum && exp.op.exp1.expType)
                        {
                           if(CheckExpressionType(exp.op.exp2, exp.op.exp1.expType, false, false))
                           {
                              if(exp.expType) FreeType(exp.expType);
                              exp.expType = exp.op.exp2.expType;
                              if(exp.op.exp2.expType) exp.op.exp2.expType.refCount++;
                              valid = true;
                           }
                        }
                     }
                  }

                  if(!valid)
                  {
                     // Added this first part of the if here to handle  5 + Degrees { 5 } with either a base unit dest or not a unit dest type
                     if(c2 && c2.type == unitClass && (!c1 || c1.type != unitClass))
                     {
                        if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                        exp.op.exp1.destType = type2;
                        type2.refCount++;

                        if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false))
                        {
                           if(exp.expType) FreeType(exp.expType);
                           exp.expType = exp.op.exp1.destType;
                           if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                        }
                     }
                     else
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

                        if(CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false))
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

                           if(c1 && c1.type == enumClass)
                           {
                              exp.expType = exp.op.exp1.expType;
                              if(exp.op.exp1.expType) exp.op.exp1.expType.refCount++;
                           }
                           else if(c2 && c2.type == enumClass)
                           {
                              exp.expType = exp.op.exp2.expType;
                              if(exp.op.exp2.expType) exp.op.exp2.expType.refCount++;
                           }
                        }
                     }
                  }
               }
               else if(type2)
               {
                  // Maybe this was meant to be an enum...
                  if(c2 && c2.type == enumClass)
                  {
                     Type oldType = exp.op.exp1.expType;
                     exp.op.exp1.expType = null;
                     if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false))
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

                  if(CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false))
                  {
                     if(exp.expType) FreeType(exp.expType);
                     exp.expType = exp.op.exp1.destType;
                     if(exp.op.exp1.destType) exp.op.exp1.destType.refCount++;
                  }
               }
            }
            else if(type2 && (!type1 || (type2.kind == classType && type1.kind != classType)))
            {
               if(type1 && c2 && c2.type == unitClass)
               {
                  if(exp.op.exp1.destType) FreeType(exp.op.exp1.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp1.destType = type2._class.registered.dataType;
                  if(type2._class.registered.dataType)
                     type2._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp1, exp.op.exp1.destType, false, false);
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
               if(c2 && c2.type == unitClass)
               {
                  if(exp.op.exp2.destType) FreeType(exp.op.exp2.destType);
                  // Convert e.g. / 4 into / 4.0
                  exp.op.exp2.destType = type1._class.registered.dataType;
                  if(type1._class.registered.dataType)
                     type1._class.registered.dataType.refCount++;
                  CheckExpressionType(exp.op.exp2, exp.op.exp2.destType, false, false);
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
            DeclareType(curExternal, exp.op.exp2.expType, true, false);
         }

         if(exp.op.op == DELETE && exp.op.exp2 && exp.op.exp2.expType && exp.op.exp2.expType.specConst)
            Compiler_Warning($"deleting const qualified object\n");

         yylloc = oldyylloc;

         FreeType(dummy);
         if(type2)
            FreeType(type2);
         break;
      }
      case bracketsExp:
      case extensionExpressionExp:
      {
         Expression e;
         exp.isConstant = true;
         for(e = exp.list->first; e; e = e.next)
         {
            //bool inced = false;
            if(!e.next)
            {
               FreeType(e.destType);
               e.opDestType = exp.opDestType;
               e.usedInComparison = exp.usedInComparison;
               e.parentOpDestType = exp.parentOpDestType;
               e.destType = exp.destType;
               if(e.destType) { exp.destType.refCount++; /*e.destType.count++; inced = true;*/ }
            }
            ProcessExpressionType(e);
            if(e.ambiguousUnits)
               exp.ambiguousUnits = true;
            /*if(inced)
               exp.destType.count--;*/
            if(!exp.expType && !e.next)
            {
               exp.expType = e.expType;
               if(e.expType) e.expType.refCount++;
               exp.needCast = e.needCast;
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
            if(source.kind == classType && source._class && source._class.registered)
            {
               Class _class = source._class.registered;
               Class c = _class.templateClass ? _class.templateClass : _class;
               if(_class != containerClass && eClass_IsDerived(c, containerClass) && _class.templateArgs)
               {
                  exp.expType = ProcessTypeString(_class.templateArgs[2].dataTypeString, false);

                  if(exp.index.index && exp.index.index->last)
                  {
                     Type type = ProcessTypeString(_class.templateArgs[1].dataTypeString, false);

                     if(type.kind == classType) type.constant = true;
                     else if(type.kind == pointerType)
                     {
                        Type t = type;
                        while(t.kind == pointerType) t = t.type;
                        t.constant = true;
                     }

                     ((Expression)exp.index.index->last).destType = type;
                  }
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
            DeclareType(curExternal, exp.expType, true, false);
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
            if(!strcmp(id.string, "__sync_synchronize") || !strcmp(id.string, "__sync_lock_release"))
            {
               exp.expType = ProcessTypeString("void", true);
               break;
            }
            else if(!strcmp(id.string, "__sync_bool_compare_and_swap"))
            {
               exp.expType = ProcessTypeString("bool", true);
               break;
            }
            else if(
                    !strcmp(id.string, "__sync_sub_and_fetch") || !strcmp(id.string, "__sync_fetch_and_sub") ||
                    !strcmp(id.string, "__sync_add_and_fetch") || !strcmp(id.string, "__sync_fetch_and_add") ||
                    !strcmp(id.string, "__sync_or_and_fetch")  || !strcmp(id.string, "__sync_fetch_and_or")  ||
                    !strcmp(id.string, "__sync_and_and_fetch") || !strcmp(id.string, "__sync_fetch_and_and") ||
                    !strcmp(id.string, "__sync_xor_and_fetch") || !strcmp(id.string, "__sync_fetch_and_xor") ||
                    !strcmp(id.string, "__sync_nand_and_fetch")|| !strcmp(id.string, "__sync_fetch_and_nand")||
                    !strcmp(id.string, "__sync_val_compare_and_swap") ||
                    !strcmp(id.string, "__sync_lock_test_and_set"))
            {
               if(exp.call.arguments && exp.call.arguments->first && ((Expression)exp.call.arguments->first).next)
                  ProcessExpressionType(exp.call.arguments->first);
               if(exp.call.arguments && exp.call.arguments->first && ((Expression)exp.call.arguments->first).next &&
                  ((Expression)((Expression)exp.call.arguments->first).next).expType)
               {
                  exp.expType = ((Expression)((Expression)exp.call.arguments->first).next).expType;
                  exp.expType.refCount++;
               }
               else
                  exp.expType = ProcessTypeString("int", true);
               break;
            }
            else if(!strcmp(id.string, "__builtin_frame_address"))
            {
               exp.expType = ProcessTypeString("void *", true);
               if(exp.call.arguments && exp.call.arguments->first)
                  ProcessExpressionType(exp.call.arguments->first);
               break;
            }
            else if(!strcmp(id.string, "__ENDIAN_PAD"))
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
               {
                  Symbol back = functionType.thisClass;
                  // Do not output class specifier here (thisclass was added to this)
                  functionType.thisClass = null;
                  PrintType(functionType, typeString, true, true);
                  functionType.thisClass = back;
               }
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
                        ProcessDeclarator(decl, true);
                        thisClass = backupThisClass;
                     }

                     thisClassParams = true;

                     functionType = ProcessType(specs, decl);
                     functionType.refCount = 0;
                     FinishTemplatesContext(context);

                     // Mark parameters that were 'thisclass'
                     {
                        Type p, op;
                        for(p = functionType.params.first, op = methodType.method.dataType.params.first; p && op; p = p.next, op = op.next)
                        {
                           //p.wasThisClass = op.kind == thisClassType;
                           if(op.kind == thisClassType)
                              p.thisClassFrom = methodType.method._class;
                        }
                     }
                     if(methodType.method.dataType.returnType.kind == thisClassType)
                     {
                        // functionType.returnType.wasThisClass = true;
                        functionType.returnType.thisClassFrom = methodType.method._class;
                     }
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
            if(functionType.extraParam && e && functionType.thisClass)
            {
               e.destType = MkClassType(functionType.thisClass.string);
               e = e.next;
            }

            // WHY WAS THIS COMMENTED OUT ? Broke DisplaySystem::FontExtent(this ? displaySystem : null, font, text, len, width, height);
            // Fixed #141 by adding '&& !functionType.extraParam'
            if(!functionType.staticMethod && !functionType.extraParam)
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
                  type.byReference = functionType.byReference;
                  type.typedByReference = functionType.typedByReference;
                  if(e)
                  {
                     // Allow manually passing a class for typed object
                     if(e.next && type.kind == classType && (functionType && functionType.thisClass) && functionType.classObjectType == typedObject)
                        e = e.next;
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
                     bool constant = type.constant;
                     ClassTemplateArgument arg = _class.templateArgs[id];
                     {
                        Context context = SetupTemplatesContext(_class);

                        /*if(!arg.dataType)
                           arg.dataType = ProcessTypeString(arg.dataTypeString, false);*/
                        templatedType = ProcessTypeString(arg.dataTypeString, false);
                        FinishTemplatesContext(context);
                     }

                     if(templatedType.kind == classType && constant) templatedType.constant = true;
                     else if(templatedType.kind == pointerType)
                     {
                        Type t = templatedType.type;
                        while(t.kind == pointerType) t = t.type;
                        if(constant) t.constant = constant;
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
                  if(type && type.kind == ellipsisType && type.prev && type.prev.kind == classType && type.prev.classObjectType)
                  {
                     e.destType = type.prev;
                     e.destType.refCount++;
                  }
                  else
                  {
                     e.destType = type;
                     if(type) type.refCount++;
                  }
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
                  if(strstr(string, "__builtin_") == string)
                  {
                     if(exp.destType)
                     {
                        functionType.returnType = exp.destType;
                        exp.destType.refCount++;
                     }
                  }
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
               ProcessExpressionType(e);
         }
         break;
      }
      case memberExp:
      {
         Type type;
         Location oldyylloc = yylloc;
         bool thisPtr;
         Expression checkExp = exp.member.exp;
         while(checkExp)
         {
            if(checkExp.type == castExp)
               checkExp = checkExp.cast.exp;
            else if(checkExp.type == bracketsExp)
               checkExp = checkExp.list ? checkExp.list->first : null;
            else
               break;
         }

         thisPtr = (checkExp && checkExp.type == identifierExp && !strcmp(checkExp.identifier.string, "this"));
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
               Expression argExp = GetTemplateArgExpByName(param.name, null, thisClass, TemplateParameterType::identifier);
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
                                    delete string;

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

                  if(!expMember.expType.isPointerType)
                     expMember = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), expMember);
                  // *([expType] *)(((byte *)(uintptr)[exp.member.exp]) + [argExp].member.offset)
                  exp.type = bracketsExp;
                  exp.list = MkListOne(MkExpOp(null, '*',
                  /*opExp;
                  exp.op.op = '*';
                  exp.op.exp1 = null;
                  exp.op.exp2 = */
                  MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), MkExpBrackets(MkListOne(MkExpOp(
                     MkExpBrackets(MkListOne(
                        MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)),
                           expMember))),
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
         // TODO: *** This seems to be where we should add method support for all basic types ***
         if(type && (type.kind == templateType));
         else if(type && (type.kind == classType || type.kind == subClassType || type.kind == intType || type.kind == enumType ||
                          type.kind == int64Type || type.kind == shortType || type.kind == longType || type.kind == charType || type.kind == _BoolType ||
                          type.kind == intPtrType || type.kind == intSizeType || type.kind == floatType || type.kind == doubleType ||
                          (type.kind == pointerType && type.type.kind == charType)))
         {
            Identifier id = exp.member.member;
            TypeKind typeKind = type.kind;
            Class _class = (id && (!id._class || id._class.name))? ( id.classSym ? id.classSym.registered : (type._class ? type._class.registered : null)) : null;
            if(typeKind == subClassType && exp.member.exp.type == classExp)
            {
               _class = eSystem_FindClass(privateModule, "ecere::com::Class");
               typeKind = classType;
            }

            if(id)
            {
               if(typeKind == intType || typeKind == enumType)
                  _class = eSystem_FindClass(privateModule, "int");
               else if(!_class)
               {
                  if(type.kind == classType && type._class && type._class.registered)
                  {
                     _class = type._class.registered;
                  }
                  else if((type.kind == arrayType || type.kind == pointerType) && type.type && type.type.kind == charType)
                  {
                     _class = FindClass("char *").registered;
                  }
                  else if(type.kind == pointerType)
                  {
                     _class = eSystem_FindClass(privateModule, "uintptr");
                     FreeType(exp.expType);
                     exp.expType = ProcessTypeString("uintptr", false);
                     exp.byReference = true;
                  }
                  else
                  {
                     char string[1024] = "";
                     Symbol classSym;
                     PrintTypeNoConst(type, string, false, true);
                     classSym = FindClass(string);
                     if(classSym) _class = classSym.registered;
                  }
               }
            }

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
                     bool useMemberForNonConst = false;
                     // First look for Public Members (Unless class specifier is provided, which skips public priority)
                     if(!id.classSym)
                     {
                        prop = eClass_FindProperty(_class, id.string, null);

                        useMemberForNonConst = prop && exp.destType &&
                           ( (exp.destType.kind == classType && !exp.destType.constant) || ((exp.destType.kind == pointerType || exp.destType.kind == arrayType) && exp.destType.type && !exp.destType.type.constant) ) &&
                              !strncmp(prop.dataTypeString, "const ", 6);

                        if(useMemberForNonConst || !id._class || !id._class.name || strcmp(id._class.name, "property"))
                           member = eClass_FindDataMember(_class, id.string, null, null, null);
                     }

                     if((!prop || useMemberForNonConst) && !member)
                     {
                        method = useMemberForNonConst ? null : eClass_FindMethod(_class, id.string, null);
                        if(!method)
                        {
                           prop = eClass_FindProperty(_class, id.string, privateModule);

                           useMemberForNonConst |= prop && exp.destType &&
                              ( (exp.destType.kind == classType && !exp.destType.constant) || ((exp.destType.kind == pointerType || exp.destType.kind == arrayType) && exp.destType.type && !exp.destType.type.constant) ) &&
                                 !strncmp(prop.dataTypeString, "const ", 6);

                           if(useMemberForNonConst || !id._class || !id._class.name || strcmp(id._class.name, "property"))
                              member = eClass_FindDataMember(_class, id.string, privateModule, null, null);
                        }
                     }

                     if(member && prop)
                     {
                        if(useMemberForNonConst || (member._class != prop._class && !id._class && eClass_IsDerived(member._class, prop._class)))
                           prop = null;
                        else
                           member = null;
                     }
                  }
               }
               if(!prop && !member && !method)     // NOTE: Recently added the !method here, causes private methods to unprioritized
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

               //if(!exp.member.exp.destType)
               if(exp.member.exp.destType)
                  FreeType(exp.member.exp.destType);
               {
                  if(method && !method._class.symbol)
                     method._class.symbol = FindClass(method._class.fullName);
                  if(prop && !prop._class.symbol)
                     prop._class.symbol = FindClass(prop._class.fullName);

                  exp.member.exp.destType = Type
                  {
                     refCount = 1;
                     kind = classType;
                     _class = prop ? prop._class.symbol : method ? method._class.symbol : _class.symbol;
                     // wasThisClass = type ? type.wasThisClass : false;
                     thisClassFrom = type ? type.thisClassFrom : null;
                  };
               }

               if(prop)
               {
                  exp.member.memberType = propertyMember;
                  if(!prop.dataType)
                     ProcessPropertyType(prop);
                  exp.expType = prop.dataType;
                  if(!strcmp(_class.base.fullName, "eda::Row") && !exp.expType.constant && !exp.destType)
                  {
                     Type type { };
                     CopyTypeInto(type, exp.expType);
                     type.refCount = 1;
                     type.constant = true;
                     exp.expType = type;
                  }
                  else if(prop.dataType)
                     prop.dataType.refCount++;
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
                  DeclareStruct(curExternal, _class.fullName, false, true);
                  if(member._class != _class)
                     DeclareStruct(curExternal, member._class.fullName, false, true);

                  if(!member.dataType)
                  {
                     Context context = SetupTemplatesContext(_class);
                     member.dataType = ProcessTypeString(member.dataTypeString, false);
                     FinishTemplatesContext(context);
                  }
                  if(exp.member.exp.expType.kind == classType && exp.member.exp.expType._class && exp.member.exp.expType._class.registered && exp.member.exp.expType._class.registered.type == bitClass)
                     member.dataType.bitMemberSize = ((BitMember)member).size;
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
                  //if(inCompiler)
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
                     FreeType(exp.expType);
                     exp.expType = MkClassType("ecere::com::Class");
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

                  tClass = type._class && type._class.registered ? type._class.registered : _class;
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
                        bool constant = exp.expType.constant;
                        bool passAsTemplate = false;
                        Class thisClassFrom = null;
                        Type t = exp.expType.templateParameter.dataTypeString ? ProcessTypeString(exp.expType.templateParameter.dataTypeString, false) : null;
                        if(t && t.kind == classType && t._class)
                           thisClassFrom = t._class.registered;
                        else if(exp.expType.thisClassFrom)
                           thisClassFrom = thisClass;
                        else
                           // Mark that 'thisClassFrom' was set to something
                           thisClassFrom = eSystem_FindClass(GetPrivateModule(), "class");

                        FreeType(t);

                        passAsTemplate = tClass.templateClass && (exp.expType.kind != templateType ||
                           (!exp.expType.templateParameter || (!exp.expType.templateParameter.dataTypeString && !exp.expType.templateParameter.dataType)));

                        /*if(!arg.dataType)
                           arg.dataType = ProcessTypeString(arg.dataTypeString, false);*/
                        FreeType(exp.expType);

                        exp.expType = ProcessTypeString(arg.dataTypeString, false);
                        exp.expType.thisClassFrom = thisClassFrom;
                        if(exp.expType.kind == classType && constant) exp.expType.constant = true;
                        else if(exp.expType.kind == pointerType)
                        {
                           Type t = exp.expType.type;
                           while(t.kind == pointerType) t = t.type;
                           if(constant) t.constant = constant;
                        }
                        if(exp.expType)
                        {
                           if(exp.expType.kind == thisClassType)
                           {
                              FreeType(exp.expType);
                              exp.expType = ReplaceThisClassType(_class);
                           }

                           if(passAsTemplate)
                              exp.expType.passAsTemplate = true;
                           //exp.expType.refCount++;
                           if(!exp.destType)
                           {
                              exp.destType = ProcessTypeString(arg.dataTypeString, false);
                              if(exp.destType.kind == classType && constant) exp.destType.constant = true;
                              else if(exp.destType.kind == pointerType)
                              {
                                 Type t = exp.destType.type;
                                 while(t.kind == pointerType) t = t.type;
                                 if(constant) t.constant = constant;
                              }

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
                              exp.type = bracketsExp;
                              exp.list = MkListOne(MkExpCast(MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl)), newExp));
                              ((Expression)exp.list->first).expType = exp.expType;
                              if(exp.expType) exp.expType.refCount++;
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
                                       delete string;

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
            if(classSym.registered.type == noHeadClass || (classSym.registered.fixed && classSym.registered.structSize))
            {
               char name[1024];
               Class b = classSym.registered;
               name[0] = '\0';
               DeclareStruct(curExternal, classSym.string, false, true);
               FreeSpecifier(exp._class);
               FullClassNameCat(name, classSym.string, false);

               if(b.offset == 0)
               {
                  exp.type = typeSizeExp;
                  exp.typeName = MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(name), null)), null);
               }
               else
               {
                  Expression e;
                  exp.type = opExp;
                  if(b.structSize == b.offset)
                     exp.op.exp1 = MkExpConstant("0");
                  else
                     exp.op.exp1 = MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(name), null)), null));
                  exp.op.op = '+';
                  e = exp;
                  while(b.offset != 0)
                  {
                     Symbol sym;
                     Expression typeSize;

                     b = b.base;
                     sym = FindClass(b.fullName);

                     name[0] = '\0';
                     DeclareStruct(curExternal, sym.string, false, true);
                     FullClassNameCat(name, sym.string, false);

                     if(b.structSize == b.offset)
                        typeSize = MkExpConstant("0");
                     else
                        typeSize = MkExpTypeSize(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(name), null)), null));
                     e.op.exp2 = b.offset ? MkExpOp(typeSize, '+', null) : typeSize;
                     e = e.op.exp2;
                  }
               }
            }
            else
            {
               if(classSym.registered.fixed && !classSym.registered.structSize)
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

                  DeclareClass(curExternal, classSym, className);

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
            kind = intSizeType;
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
            kind = intSizeType;
         };
         exp.isConstant = true;

         DeclareType(curExternal, type, true, false);
         FreeType(type);
         break;
      }
      case typeAlignExp:
      {
         //Type type = ProcessType(exp.typequalifiers, exp.typeName.declarator);
         // TODO:
         exp.expType = Type
         {
            refCount = 1;
            kind = intSizeType;
         };
         exp.isConstant = true;

         //DeclareType(curExternal, type, true, false);
         //FreeType(type);
         break;
      }
      case castExp:
      {
         Type type = ProcessType(exp.cast.typeName.qualifiers, exp.cast.typeName.declarator);
         type.count = 1;
         FreeType(exp.cast.exp.destType);
         exp.cast.exp.destType = type;
         type.refCount++;
         type.casted = true;
         ProcessExpressionType(exp.cast.exp);
         type.casted = false;
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
         // We have yet to support this... ( { } initializers are currently processed inside ProcessDeclaration()'s initDeclaration case statement
         // ProcessInitializer(exp.initializer.initializer, type);
         exp.expType = type;
         break;
      }
      case vaArgExp:
      {
         Type type = ProcessType(exp.vaArg.typeName.qualifiers, exp.vaArg.typeName.declarator);
         ProcessExpressionType(exp.vaArg.exp);
         exp.expType = type;
         break;
      }
      case conditionExp:
      {
         Expression e;
         Type t = exp.destType;
         if(t && !exp.destType.casted)
         {
            t = { };
            CopyTypeInto(t, exp.destType);
            t.count = 0;
         }
         else if(t)
            t.refCount++;

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
               e.destType = t;
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
         exp.cond.elseExp.destType = t ? t : exp.expType;

         if(exp.cond.elseExp.destType)
            exp.cond.elseExp.destType.refCount++;
         ProcessExpressionType(exp.cond.elseExp);

         // FIXED THIS: Was done before calling process on elseExp
         if(!exp.cond.elseExp.isConstant)
            exp.isConstant = false;

         FreeType(t);
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
            exp.expType = (last.expressions && last.expressions->last) ? ((Expression)last.expressions->last).expType : null;
            if(exp.expType)
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
         const char * typeString = null;
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
                     if(!MatchTypeExpression(e, type, null, false, true))
                     {
                        FreeType(type);
                        type = e.expType;
                        e.expType = null;

                        e = exp.list->first;
                        ProcessExpressionType(e);
                        if(e.expType)
                        {
                           //if(!MatchTypes(e.expType, type, null, null, null, false, false, false))
                           if(!MatchTypeExpression(e, type, null, false, true))
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
               PrintTypeNoConst(type, typeStringBuf, false, true);
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
               while((e = exp.list->first))
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

            DeclareStruct(curExternal, "ecere::com::BuiltInContainer", false, true);

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
            NamedLink64 member;
            for(member = symbol.type.members.first; member; member = member.next)
            {
               NamedLink64 value { name = CopyString(member.name) };
               exp.expType.members.Add(value);
            }
         }
      }
   }

   // Trying to do this here before conversion properties kick in and this becomes a new expression... (Fixing Class c; const char * a = c;)
   // Mark nohead classes as by reference, unless we're casting them to an integral type
   if(!notByReference && exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered &&
      exp.expType._class.registered.type == noHeadClass && (!exp.destType ||
         (exp.destType.kind != intType && exp.destType.kind != int64Type && exp.destType.kind != intPtrType && exp.destType.kind != intSizeType &&
          exp.destType.kind != longType && exp.destType.kind != shortType && exp.destType.kind != charType && exp.destType.kind != _BoolType)))
   {
      exp.byReference = true;
   }

   yylloc = exp.loc;
   if(exp.destType && (/*exp.destType.kind == voidType || */exp.destType.kind == dummyType) );
   else if(exp.destType && !exp.destType.keepCast)
   {
      if(!exp.needTemplateCast && exp.expType && (exp.expType.kind == templateType || exp.expType.passAsTemplate)) // && exp.destType && !exp.destType.passAsTemplate)
         exp.needTemplateCast = 1;

      if(exp.destType.kind == voidType);
      else if(!CheckExpressionType(exp, exp.destType, false, !exp.destType.casted))
      {
         // Warn for casting unrelated types to/from struct classes
         bool invalidCast = false;
         if(inCompiler && exp.destType.count && exp.expType)
         {
            Class c1 = (exp.expType.kind == classType && exp.expType._class) ? exp.expType._class.registered : null;
            Class c2 = (exp.destType.kind == classType && exp.destType._class) ? exp.destType._class.registered : null;
            if(c1 && c1.type != structClass) c1 = null;
            if(c2 && c2.type != structClass) c2 = null;
            if((c1 && !exp.expType.byReference && !c2 && !exp.destType.isPointerType) || (c2 && !exp.destType.byReference && !c1 && !exp.expType.isPointerType))
               invalidCast = true;
         }
         if(!exp.destType.count || unresolved || invalidCast)
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
                  Expression nbExp = GetNonBracketsExp(exp);
                  bool skipWarning = false;
                  TypeKind kind = exp.destType.kind;
                  if(nbExp.type == conditionExp && nbExp.destType && !nbExp.destType.casted && nbExp.destType.kind == exp.destType.kind)
                     // The if/else operands have already been checked / warned about
                     skipWarning = true;
                  if((kind == charType || kind == shortType) && exp.destType.isSigned == exp.expType.signedBeforePromotion && nbExp.type == opExp && nbExp.op.exp1 && nbExp.op.exp2)
                  {
                     int op = nbExp.op.op;
                     Expression nbExp1, nbExp2;
                     TypeKind from;

                     switch(op)
                     {
                        case '%': case '/':
                           nbExp1 = GetNonBracketsExp(nbExp.op.exp1);
                           from = nbExp1.expType.promotedFrom;
                           // Division and Modulo will not take more room than type before promotion
                           if(from == charType || (kind == shortType && from == shortType))
                              skipWarning = true;
                           break;
                        // Left shift
                        case LEFT_OP: case RIGHT_OP:
                           nbExp1 = GetNonBracketsExp(nbExp.op.exp1);
                           nbExp2 = GetNonBracketsExp(nbExp.op.exp2);
                           from = nbExp1.expType.promotedFrom;
                           // Right shift will not take more room than type before promotion
                           if(op == RIGHT_OP && (from == charType || (kind == shortType && from == shortType)))
                              skipWarning = true;
                           else if(nbExp2.isConstant && nbExp2.type == constantExp && (nbExp.op.op == RIGHT_OP || nbExp1.expType.bitMemberSize))
                           {
                              int n = (int)strtol(nbExp2.constant, null, 0);
                              int s = from == charType ? 8 : 16;
                              // Left shifting a bit member constrained in size may still fit in type before promotion
                              if(nbExp1.expType.bitMemberSize && nbExp1.expType.bitMemberSize < s)
                                 s = nbExp1.expType.bitMemberSize;

                              // If right shifted enough things will fit in smaller type
                              if(nbExp.op.op == RIGHT_OP)
                                 s -= n;
                              else
                                 s += n;
                              if(s <= (kind == charType ? 8 : 16))
                                 skipWarning = true;
                           }
                           break;
                        case '-':
                           if(!exp.destType.isSigned)
                           {
                              nbExp1 = GetNonBracketsExp(nbExp.op.exp1);
                              nbExp2 = GetNonBracketsExp(nbExp.op.exp2);
                              from = nbExp2.expType.promotedFrom;
                              // Max value of unsigned type before promotion minus the same will always fit
                              if((from == charType || from == shortType) && nbExp1.isConstant && nbExp1.type == constantExp)
                              {
                                 int n = (int)strtol(nbExp1.constant, null, 0);
                                 if(n == (from == charType ? 255 : 65535))
                                    skipWarning = true;
                              }
                           }
                           break;
                        case '|':
                        {
                           TypeKind kind1, kind2;
                           nbExp1 = GetNonBracketsExp(nbExp.op.exp1);
                           nbExp2 = GetNonBracketsExp(nbExp.op.exp2);
                           kind1 = nbExp1.expType.promotedFrom ? nbExp1.expType.promotedFrom : nbExp1.expType.kind;
                           kind2 = nbExp2.expType.promotedFrom ? nbExp2.expType.promotedFrom : nbExp2.expType.kind;
                           if(((kind1 == charType || (kind1 == shortType && kind == shortType)) || MatchTypeExpression(nbExp1, exp.destType, null, false, false)) &&
                              ((kind2 == charType || (kind2 == shortType && kind == shortType)) || MatchTypeExpression(nbExp2, exp.destType, null, false, false)))
                              skipWarning = true;
                           break;
                        }
                        case '&':
                        {
                           TypeKind kind1, kind2;
                           nbExp1 = GetNonBracketsExp(nbExp.op.exp1);
                           nbExp2 = GetNonBracketsExp(nbExp.op.exp2);
                           kind1 = nbExp1.expType.promotedFrom ? nbExp1.expType.promotedFrom : nbExp1.expType.kind;
                           kind2 = nbExp2.expType.promotedFrom ? nbExp2.expType.promotedFrom : nbExp2.expType.kind;
                           if(((kind1 == charType || (kind1 == shortType && kind == shortType)) || MatchTypeExpression(nbExp1, exp.destType, null, false, false)) ||
                              ((kind2 == charType || (kind2 == shortType && kind == shortType)) || MatchTypeExpression(nbExp2, exp.destType, null, false, false)))
                              skipWarning = true;
                           break;
                        }
                     }
                  }

                  if(!skipWarning)
                  {
                     char expString[10240];
                     expString[0] = '\0';
                     if(inCompiler) { PrintExpression(exp, expString); ChangeCh(expString, '\n', ' '); }

#ifdef _DEBUG
                     CheckExpressionType(exp, exp.destType, false, true);
#endif

                     // Flex & Bison generate code that triggers this, so we ignore it for a quiet sdk build:
                     if(!sourceFile || (!strstr(sourceFile, "src\\lexer.ec") && !strstr(sourceFile, "src/lexer.ec") &&
                                        !strstr(sourceFile, "src\\grammar.ec") && !strstr(sourceFile, "src/grammar.ec") &&
                                        !strstr(sourceFile, "src\\type.ec") && !strstr(sourceFile, "src/type.ec") &&
                                        !strstr(sourceFile, "src\\expression.ec") && !strstr(sourceFile, "src/expression.ec")))
                     {
                        if(invalidCast)
                           Compiler_Error($"incompatible expression %s (%s); expected %s\n", expString, type1, type2);
                        else
                           Compiler_Warning($"incompatible expression %s (%s); expected %s\n", expString, type1, type2);
                     }
                  }

                  // TO CHECK: FORCING HERE TO HELP DEBUGGER
                  if(!inCompiler)
                  {
                     FreeType(exp.expType);
                     exp.destType.refCount++;
                     exp.expType = exp.destType;
                  }
               }
            }
         }
      }
      // Cast function pointers to void * as eC already checked compatibility
      else if(exp.destType && exp.destType.kind == pointerType && exp.destType.type && exp.destType.type.kind == functionType &&
              exp.expType && (exp.expType.kind == functionType || exp.expType.kind == methodType))
      {
         Expression nbExp = GetNonBracketsExp(exp);
         if(nbExp.type != castExp || !IsVoidPtrCast(nbExp.cast.typeName))
         {
            Expression e = MoveExpContents(exp);
            exp.cast.exp = MkExpBrackets(MkListOne(e));
            exp.type = castExp;
            exp.cast.exp.destType = exp.destType;
            if(exp.destType) exp.destType.refCount++;
            exp.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null), null));
         }
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
   if(inCompiler)
      ApplyAnyObjectLogic(exp);

   // Mark nohead classes as by reference, unless we're casting them to an integral type
   if(!notByReference && exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered &&
      exp.expType._class.registered.type == noHeadClass && (!exp.destType ||
         (exp.destType.kind != intType && exp.destType.kind != int64Type && exp.destType.kind != intPtrType && exp.destType.kind != intSizeType &&
          exp.destType.kind != longType && exp.destType.kind != shortType && exp.destType.kind != charType && exp.destType.kind != _BoolType)))
   {
      exp.byReference = true;
   }
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

static void ProcessSpecifier(Specifier spec, bool declareStruct, bool warnClasses)
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
               ProcessSpecifier(spec, declareStruct, false);
            }
         }
         break;
      }
      case nameSpecifier:
      {
         Symbol symbol = FindType(curContext, spec.name);
         if(symbol)
            DeclareType(curExternal, symbol.type, true, true);
         else if(spec.symbol /*&& declareStruct*/)
         {
            Class c = spec.symbol.registered;
            if(warnClasses && !c)
               Compiler_Warning("Undeclared class %s\n", spec.name);
            DeclareStruct(curExternal, spec.name, c && c.type == noHeadClass, declareStruct && c && c.type == structClass);
         }
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
         // Fall through for IDE type processing
         if(inCompiler)
            break;
      }
      case structSpecifier:
      case unionSpecifier:
      {
         if(spec.definitions)
         {
            //ClassDef def;
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
            DeclareStruct(spec.name, false, true);
         break;
      }
      */
   }
}


static void ProcessDeclarator(Declarator decl, bool isFunction)
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
      {
         Identifier id = null;
         Specifier classSpec = null;
         if(decl.type == functionDeclarator)
         {
            id = GetDeclId(decl);
            if(id && id._class)
            {
               classSpec = id._class;
               id._class = null;
            }
         }
         if(decl.declarator)
            ProcessDeclarator(decl.declarator, isFunction);
         if(decl.type == functionDeclarator)
         {
            if(classSpec)
            {
               TypeName param
               {
                  qualifiers = MkListOne(classSpec);
                  declarator = null;
               };
               if(!decl.function.parameters)
                  decl.function.parameters = MkList();
               decl.function.parameters->Insert(null, param);
            }
            if(decl.function.parameters)
            {
               TypeName param;

               for(param = decl.function.parameters->first; param; param = param.next)
               {
                  if(param.qualifiers)
                  {
                     Specifier spec;
                     for(spec = param.qualifiers->first; spec; spec = spec.next)
                     {
                        if(spec.type == baseSpecifier)
                        {
                           if(spec.specifier == TYPED_OBJECT)
                           {
                              Declarator d = param.declarator;
                              TypeName newParam
                              {
                                 qualifiers = MkListOne(MkSpecifier(VOID));
                                 declarator = MkDeclaratorPointer(MkPointer(null,null), d);
                              };
                              if(!d || d.type != pointerDeclarator)
                                 newParam.qualifiers->Insert(null, MkSpecifier(CONST));

                              FreeList(param.qualifiers, FreeSpecifier);

                              param.qualifiers = MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));
                              param.declarator = MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("class")));

                              DeclareStruct(curExternal, "ecere::com::Class", false, true);

                              decl.function.parameters->Insert(param, newParam);
                              param = newParam;
                              break;
                           }
                           else if(spec.specifier == ANY_OBJECT)
                           {
                              Declarator d = param.declarator;

                              FreeList(param.qualifiers, FreeSpecifier);

                              param.qualifiers = MkListOne(MkSpecifier(VOID));
                              if(!d || d.type != pointerDeclarator)
                                 param.qualifiers->Insert(null, MkSpecifier(CONST));
                              param.declarator = MkDeclaratorPointer(MkPointer(null,null), d);
                              break;
                           }
                           else if(spec.specifier == THISCLASS)
                           {
                              if(thisClass)
                              {
                                 spec.type = nameSpecifier;
                                 spec.name = ReplaceThisClass(thisClass);
                                 spec.symbol = FindClass(spec.name);
                                 ProcessSpecifier(spec, false, false);
                              }
                              break;
                           }
                        }
                        else if(spec.type == nameSpecifier)
                        {
                           ProcessSpecifier(spec, isFunction, true);
                        }
                        else if((spec.type == structSpecifier || spec.type == unionSpecifier) && !spec.definitions && spec.id && spec.id.string)
                        {
                           Declarator d = param.declarator;
                           if(!d || d.type != pointerDeclarator)
                              DeclareStruct(curExternal, spec.id.string, false, true);
                        }
                     }
                  }

                  if(param.declarator)
                     ProcessDeclarator(param.declarator, false);
               }
            }
         }
         break;
      }
   }
}

static void ProcessDeclaration(Declaration decl, bool warnClasses)
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
               ProcessDeclarator(d.declarator, false);

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
               ProcessSpecifier(s, declareStruct, true);
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
               ProcessDeclarator(d, false);
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
               ProcessSpecifier(spec, declareStruct, warnClasses);
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

   DeclareProperty(curExternal, prop, setName, getName);

   // eInstance_FireWatchers(object, prop);
   strcpy(propName, "__ecereProp_");
   FullClassNameCat(propName, prop._class.fullName, false);
   strcat(propName, "_");
   FullClassNameCat(propName, prop.name, true);

   strcpy(propNameM, "__ecerePropM_");
   FullClassNameCat(propNameM, prop._class.fullName, false);
   strcat(propNameM, "_");
   FullClassNameCat(propNameM, prop.name, true);

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

      DeclareFunctionUtil(curExternal, "eInstance_FireWatchers");
   }

   {
      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
      ListAdd(stmt.expressions,
         MkExpCondition(
            MkExpOp(
               MkExpIdentifier(MkIdentifier(propName)), AND_OP, MkExpMember(MkExpIdentifier(MkIdentifier(propName)), MkIdentifier("selfWatchable"))),
               MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args)),
               MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), null), MkExpConstant("0"))
         ));
      ProcessExpressionType(stmt.expressions->last);

      args = MkList();
      ListAdd(args, object ? CopyExpression(object) : MkExpIdentifier(MkIdentifier("this")));
      ListAdd(args, MkExpIdentifier(MkIdentifier(propNameM)));
      ListAdd(stmt.expressions,
         MkExpCondition(
            MkExpOp(
               MkExpIdentifier(MkIdentifier(propNameM)), AND_OP, MkExpMember(MkExpIdentifier(MkIdentifier(propNameM)), MkIdentifier("selfWatchable"))),
               MkListOne(
                  MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_FireSelfWatchers")), args)),
               MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), null), MkExpConstant("0"))
         ));
      ProcessExpressionType(stmt.expressions->last);

      DeclareFunctionUtil(curExternal, "eInstance_FireSelfWatchers");
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
               curCompound = stmt;
            curContext = stmt.compound.context;

            if(stmt.compound.declarations)
            {
               for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
                  ProcessDeclaration(decl, true);
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
         const char * typeString = null;
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
            bool isMap = false, isArray = false, isLinkList = false, isList = false, isCustomAVLTree = false; //, isAVLTree = false;
            // TODO: Find these once on loadup
            Class arrayClass = eSystem_FindClass(privateModule, "Array");
            Class linkListClass = eSystem_FindClass(privateModule, "LinkList");
            Class customAVLTreeClass = eSystem_FindClass(privateModule, "CustomAVLTree");

            if(inCompiler)
            {
               stmt.type = compoundStmt;

               stmt.compound.context = Context { };
               stmt.compound.context.parent = curContext;
               curContext = stmt.compound.context;
            }

            if(source && eClass_IsDerived(source._class.registered, customAVLTreeClass))
            {
               Class mapClass = eSystem_FindClass(privateModule, "Map");
               //Class avlTreeClass = eSystem_FindClass(privateModule, "AVLTree");
               isCustomAVLTree = true;
               /*if(eClass_IsDerived(source._class.registered, avlTreeClass))
                  isAVLTree = true;
               else */if(eClass_IsDerived(source._class.registered, mapClass))
                  isMap = true;
            }
            else if(source && eClass_IsDerived(source._class.registered, arrayClass)) isArray = true;
            else if(source && eClass_IsDerived(source._class.registered, linkListClass))
            {
               Class listClass = eSystem_FindClass(privateModule, "List");
               isLinkList = true;
               isList = eClass_IsDerived(source._class.registered, listClass);
            }

            if(inCompiler && isArray)
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
                           if(!MatchTypeExpression(e, type, null, false, true))
                           {
                              FreeType(type);
                              type = e.expType;
                              e.expType = null;

                              e = arrayExp.list->first;
                              ProcessExpressionType(e);
                              if(e.expType)
                              {
                                 //if(!MatchTypes(e.expType, type, null, null, null, false, false, false, false))
                                 if(!MatchTypeExpression(e, type, null, false, true))
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
                  if(inCompiler)
                  {
                     OldList * initializers = MkList();
                     Declarator decl;
                     OldList * specs = MkList();
                     if(arrayExp.list)
                     {
                        Expression e;

                        builtinCount = arrayExp.list->count;
                        type = ProcessTypeString(typeString, false);
                        while((e = arrayExp.list->first))
                        {
                           arrayExp.list->Remove(e);
                           e.destType = type;
                           type.refCount++;
                           ProcessExpressionType(e);
                           if(inCompiler)
                              ListAdd(initializers, MkInitializerAssignment(e));
                        }
                        FreeType(type);
                        delete arrayExp.list;
                     }
                     decl = SpecDeclFromString(typeString, specs, MkDeclaratorIdentifier(id));

                     stmt.compound.declarations = MkListOne(MkDeclaration(CopyList(specs, CopySpecifier),
                        MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), /*CopyDeclarator(*/decl/*)*/), null))));

                     ListAdd(stmt.compound.declarations, MkDeclaration(specs, MkListOne(MkInitDeclarator(
                        PlugDeclarator(
                           /*CopyDeclarator(*/decl/*)*/, MkDeclaratorArray(MkDeclaratorIdentifier(MkIdentifier("__internalArray")), null)
                           ), MkInitializerList(initializers)))));
                     FreeList(exp, FreeExpression);
                  }
                  else if(arrayExp.list)
                  {
                     Expression e;
                     type = ProcessTypeString(typeString, false);
                     for(e = arrayExp.list->first; e; e = e.next)
                     {
                        e.destType = type;
                        type.refCount++;
                        ProcessExpressionType(e);
                     }
                     FreeType(type);
                  }
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
            else if(inCompiler && isLinkList && !isList)
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
            else if(inCompiler && _class.templateArgs)
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
            if(inCompiler)
            {
               symbol = FindSymbol(id.string, curContext, curContext, false, false);

               if(block)
               {
                  // Reparent sub-contexts in this statement
                  switch(block.type)
                  {
                     case compoundStmt:
                        if(block.compound.context)
                           block.compound.context.parent = stmt.compound.context;
                        break;
                     case ifStmt:
                        if(block.ifStmt.stmt && block.ifStmt.stmt.type == compoundStmt && block.ifStmt.stmt.compound.context)
                           block.ifStmt.stmt.compound.context.parent = stmt.compound.context;
                        if(block.ifStmt.elseStmt && block.ifStmt.elseStmt.type == compoundStmt && block.ifStmt.elseStmt.compound.context)
                           block.ifStmt.elseStmt.compound.context.parent = stmt.compound.context;
                        break;
                     case switchStmt:
                        if(block.switchStmt.stmt && block.switchStmt.stmt.type == compoundStmt && block.switchStmt.stmt.compound.context)
                           block.switchStmt.stmt.compound.context.parent = stmt.compound.context;
                        break;
                     case whileStmt:
                        if(block.whileStmt.stmt && block.whileStmt.stmt.type == compoundStmt && block.whileStmt.stmt.compound.context)
                           block.whileStmt.stmt.compound.context.parent = stmt.compound.context;
                        break;
                     case doWhileStmt:
                        if(block.doWhile.stmt && block.doWhile.stmt.type == compoundStmt && block.doWhile.stmt.compound.context)
                           block.doWhile.stmt.compound.context.parent = stmt.compound.context;
                        break;
                     case forStmt:
                        if(block.forStmt.stmt && block.forStmt.stmt.type == compoundStmt && block.forStmt.stmt.compound.context)
                           block.forStmt.stmt.compound.context.parent = stmt.compound.context;
                        break;
                     case forEachStmt:
                        if(block.forEachStmt.stmt && block.forEachStmt.stmt.type == compoundStmt && block.forEachStmt.stmt.compound.context)
                           block.forEachStmt.stmt.compound.context.parent = stmt.compound.context;
                        break;
                     /* Only handle those with compound blocks for now... (Potential limitation on compound statements within expressions)
                     case labeledStmt:
                     case caseStmt
                     case expressionStmt:
                     case gotoStmt:
                     case continueStmt:
                     case breakStmt
                     case returnStmt:
                     case asmStmt:
                     case badDeclarationStmt:
                     case fireWatchersStmt:
                     case stopWatchingStmt:
                     case watchStmt:
                     */
                  }
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
                  ProcessDeclaration(stmt.compound.declarations->first, true);

               if(symbol)
                  symbol.isIterator = isMap ? 2 : ((isArray || isBuiltin) ? 3 : (isLinkList ? (isList ? 5 : 4) : (isCustomAVLTree ? 6 : 1)));

               ProcessStatement(stmt);
            }
            else
               ProcessStatement(stmt.forEachStmt.stmt);
            if(inCompiler)
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
                  // TODO: current property if not compiling
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
         ProcessDeclaration(stmt.decl, true);
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

               for(propWatch = watches->first; propWatch; propWatch = propWatch.next)
               {
                  ClassFunction func;
                  char watcherName[1024];
                  Class watcherClass = watcher ?
                     ((watcher.expType && watcher.expType.kind == classType && watcher.expType._class) ? watcher.expType._class.registered : null) : thisClass;
                  External createdExternal;

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
                     func = MkClassFunction(MkListOne(MkSpecifier(VOID)), null, MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(watcherName)),
                        MkListOne(MkTypeName(MkListOne(MkSpecifierName(object.expType._class.string)), MkDeclaratorIdentifier(MkIdentifier("value"))))), null);
                     ProcessClassFunctionBody(func, propWatch.compound);
                     propWatch.compound = null;

                     createdExternal = ProcessClassFunction(watcherClass, func, ast, curExternal, true);

                     FreeClassFunction(func);

                     curExternal = createdExternal;
                     ProcessFunction(createdExternal.function);

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

                              DeclareProperty(createdExternal, prop, setName, getName);

                              // eInstance_Watch(stmt.watch.object, prop, stmt.watch.watcher, callback);
                              strcpy(propName, "__ecereProp_");
                              FullClassNameCat(propName, prop._class.fullName, false);
                              strcat(propName, "_");
                              FullClassNameCat(propName, prop.name, true);

                              ListAdd(args, CopyExpression(object));
                              ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
                              ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                              ListAdd(args, MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null), null)), MkExpIdentifier(MkIdentifier(watcherName))));

                              ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_Watch")), args));

                              external.CreateUniqueEdge(createdExternal, true);
                           }
                           else
                              Compiler_Error($"Property %s not found in class %s\n", propID.string, _class.fullName);
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
               Compiler_Error($"No observer specified and not inside a class\n");
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

                           DeclareProperty(curExternal, prop, setName, getName);

                           // eInstance_StopWatching(object, prop, watcher);
                           strcpy(propName, "__ecereProp_");
                           FullClassNameCat(propName, prop._class.fullName, false);
                           strcat(propName, "_");
                           FullClassNameCat(propName, prop.name, true);

                           ListAdd(args, CopyExpression(object));
                           ListAdd(args, MkExpIdentifier(MkIdentifier(propName)));
                           ListAdd(args, watcher ? CopyExpression(watcher) : MkExpIdentifier(MkIdentifier("this")));
                           ListAdd(stmt.expressions, MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eInstance_StopWatching")), args));
                        }
                        else
                           Compiler_Error($"Property %s not found in class %s\n", propID.string, _class.fullName);
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

            if(!function.propertyNoThis)
            {
               TypeName thisParam = null;

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
                  DeclareStruct(curExternal, "ecere::com::Class", false, true);
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
               type = classSym ? MkClassType(classSym.string) : null;
            };
            function.body.compound.context.symbols.Add((BTNode)thisSymbol);

            if(typedObject && thisSymbol.type)
            {
               thisSymbol.type.classObjectType = ClassObjectType::typedObject;
               thisSymbol.type.byReference = type.byReference;
               thisSymbol.type.typedByReference = type.byReference;
            }
         }
      }

      // Pointer to class data
      if(inCompiler && _class && _class.type == normalClass && type.classObjectType != classPointer)
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

               DeclareClass(curExternal, classSym, className);
            }

            // ((byte *) this)
            bytePtr = QBrackets(MkExpCast(QMkType("char", QMkPtrDecl(null)), QMkExpId("this")));

            if(_class.fixed)
            {
               Expression e;
               if(_class.offset && _class.offset == (_class.base.type == noHeadClass ? _class.base.memberOffset : _class.base.structSize))
               {
                  e = MkExpClassSize(MkSpecifierName(_class.base.fullName));
                  ProcessExpressionType(e);
               }
               else
               {
                  char string[256];
                  sprintf(string, "%d", _class.offset);  // Need Bootstrap Fix
                  e = MkExpConstant(string);
               }
               exp = QBrackets(MkExpOp(bytePtr, '+', e));
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
                  OldList * list;
                  curContext = function.body.compound.context;

                  decl = MkDeclaration((list = MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null))),
                     MkListOne(MkInitDeclarator(QMkPtrDecl(pointerName), initializer)));
                  list->Insert(null, MkSpecifierExtended(MkExtDeclAttrib(MkAttrib(ATTRIB, MkListOne(MkAttribute(CopyString("unused"), null))))));

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
      ProcessDeclarator(function.declarator, true);
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
            ProcessDeclaration(def.decl, symbol ? true : false);
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

void DeclareFunctionUtil(External neededBy, const String s)
{
   GlobalFunction function = eSystem_FindFunction(privateModule, s);
   if(function)
   {
      char name[1024];
      name[0] = 0;
      if(function.module.importType != staticImport && (!function.dataType || !function.dataType.dllExport))
         strcpy(name, "__ecereFunction_");
      FullClassNameCat(name, s, false); // Why is this using FullClassNameCat ?
      DeclareFunction(neededBy, function, name);
   }
   else if(neededBy)
      FindSymbol(s, globalContext, globalContext, false, false);
}

bool reachedPass15;

void ComputeDataTypes()
{
   External external;

   currentClass = null;

   containerClass = eSystem_FindClass(GetPrivateModule(), "Container");

   DeclareStruct(null, "ecere::com::Class", false, true);
   DeclareStruct(null, "ecere::com::Instance", false, true);
   DeclareStruct(null, "ecere::com::Property", false, true);
   DeclareStruct(null, "ecere::com::DataMember", false, true);
   DeclareStruct(null, "ecere::com::Method", false, true);
   DeclareStruct(null, "ecere::com::SerialBuffer", false, true);
   DeclareStruct(null, "ecere::com::ClassTemplateArgument", false, true);

   DeclareFunctionUtil(null, "eSystem_New");
   DeclareFunctionUtil(null, "eSystem_New0");
   DeclareFunctionUtil(null, "eSystem_Renew");
   DeclareFunctionUtil(null, "eSystem_Renew0");
   DeclareFunctionUtil(null, "eSystem_Delete");
   DeclareFunctionUtil(null, "eClass_GetProperty");
   DeclareFunctionUtil(null, "eClass_SetProperty");
   DeclareFunctionUtil(null, "eInstance_FireSelfWatchers");
   DeclareFunctionUtil(null, "eInstance_SetMethod");
   DeclareFunctionUtil(null, "eInstance_IncRef");
   DeclareFunctionUtil(null, "eInstance_StopWatching");
   DeclareFunctionUtil(null, "eInstance_Watch");
   DeclareFunctionUtil(null, "eInstance_FireWatchers");
   reachedPass15 = true;

   for(external = ast->first; external; external = external.next)
   {
      afterExternal = curExternal = external;
      if(external.type == functionExternal)
      {
         if(memoryGuard)
         {
            DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
            DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
         }

         currentClass = external.function._class;
         ProcessFunction(external.function);
      }
      // There shouldn't be any _class member access here anyways...
      else if(external.type == declarationExternal)
      {
         if(memoryGuard && external.declaration && external.declaration.type == instDeclaration)
         {
            DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
            DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
         }

         currentClass = null;
         if(external.declaration)
            ProcessDeclaration(external.declaration, true);
      }
      else if(external.type == classExternal)
      {
         ClassDefinition _class = external._class;
         currentClass = external.symbol.registered;
         if(memoryGuard)
         {
            DeclareFunctionUtil(external, "MemoryGuard_PushLoc");
            DeclareFunctionUtil(external, "MemoryGuard_PopLoc");
         }
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
   curExternal = null;
}
