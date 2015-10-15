import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

extern External curExternal;
static Statement curCompound;

static void _FixRefExp(Expression * expPtr, Expression * memberExpPtr)
{

   Expression memberExp = *memberExpPtr;
   if(memberExp && memberExp.type == ExpressionType::memberExp &&
      memberExp.member.exp && (memberExp.member.exp.type == bracketsExp || memberExp.member.exp.type == extensionExpressionExp))
   {
      Expression bracketExp = memberExp.member.exp;
      Expression idExp = bracketExp.list->last;

      if(idExp && idExp.type == identifierExp)
      {
         Expression newExp = null;
         Expression exp = *expPtr;

         // opExp ( memberExp ( bracketsExp ( identifierExp ) ) )
         // bracketsExp ( opExp ( memberExp ( identifierExp ) ) )

         *memberExpPtr = null;
         newExp = CopyExpression(exp);
         FreeExpContents(exp);

         *(Expression *)((byte *)newExp + (uint)((byte *)memberExpPtr - (byte *)exp)) = memberExp;

         memberExp.member.exp = idExp;

         exp.type = bracketsExp;
         exp.list = bracketExp.list;
         bracketExp.list = null;

         exp.list->Remove(idExp);
         exp.list->Add(newExp);
         FreeExpression(bracketExp);

         *expPtr = exp; //FixRefExp(newExp);      // TESTING THIS: exp was not used!
      }
   }
   else if(*expPtr && (*expPtr).type == opExp && (*expPtr).op.op == '&' && !(*expPtr).op.exp1 &&
      memberExp && (memberExp.type == bracketsExp || memberExp.type == extensionExpressionExp) && memberExp.list && memberExp.list->count > 1)
   {
      Expression newExp = null;
      Expression exp = *expPtr;

      *memberExpPtr = null;
      newExp = CopyExpression(exp);
      *(Expression *)((byte *)newExp + (uint)((byte *)memberExpPtr - (byte *)exp)) = memberExp.list->last;

      exp.type = bracketsExp;
      exp.list = memberExp.list;
      memberExp.list = null;

      exp.list->Remove(exp.list->last);
      exp.list->Add(newExp);
      FreeExpression(memberExp);

      *expPtr = newExp; //FixRefExp(newExp);
   }
}

static Expression FixRefExp(Expression exp)
{
   if(exp.type == opExp)
   {
      _FixRefExp(&exp, &exp.op.exp1);
      _FixRefExp(&exp, &exp.op.exp2);
   }
   else if(exp.type == indexExp)
      _FixRefExp(&exp, &exp.index.exp);
   else if(exp.type == memberExp)
      _FixRefExp(&exp, &exp.member.exp);
   return exp;
}

static Expression FixReference(Expression e, bool wantReference)
{
   if(e.expType && e.type != constantExp)
   {
      Type type = e.expType;
      bool isPointer = false;
      /*
      if(type.kind == TypePointer && type.type && type.type.kind == classType)
      {
         type = type.type;
         isPointer = true;
      }
      */

      if(type.kind == classType) // || type.kind == TypeInt)
      {
         Class _class = type._class ? type._class.registered : null;
         // TOLOOKINTO: What was systemClass used for here? Exclude "typed_object"...
         // TOFIX: In which case with systemClass do we actually want this to come here? Can't think of any!
         if(_class && ((_class.type == structClass && !type.declaredWithStruct) || _class.type == noHeadClass ||
           (_class.type == systemClass && _class.base &&
           strcmp(_class.fullName, "uintptr") &&
           strcmp(_class.fullName, "intptr") &&
           strcmp(_class.fullName, "uintsize") &&
           strcmp(_class.fullName, "intsize"))))
         {
            // if(wantReference != ((_class.type == systemClass) ? false : e.byReference))
            if(wantReference != (e.byReference || isPointer))
            {
               Expression exp = e;
               for(;;)
               {
                  if(exp.type == bracketsExp || exp.type == extensionExpressionExp)
                  {
                     if(exp.list)
                     {
                        exp.byReference = wantReference;
                        exp = exp.list->last;
                     }
                     else
                        break;
                  }
                  else if(exp.type == castExp)
                  {
                     exp.byReference = wantReference;
                     exp = exp.cast.exp;
                  }
                  else if(exp.type == conditionExp)
                  {
                     if(exp.cond.exp->last)
                        FixReference(exp.cond.exp->last, wantReference);
                     FixReference(exp.cond.elseExp, wantReference);
                     break;
                  }
                  else
                  {
                     if(wantReference != (exp.byReference || isPointer))
                     {
                        Expression newExp { };
                        *newExp = *exp;
                        newExp.prev = null;
                        newExp.next = null;

                        if(exp.destType) exp.destType.refCount++;
                        if(exp.expType) exp.expType.refCount++;

                        exp.type = opExp;
                        exp.op.exp1 = null;
                        exp.op.exp2 = newExp;
                        if(wantReference)
                           exp.op.op = '&';
                        else
                           exp.op.op = '*';

                        e.byReference = wantReference;
                        exp.byReference = wantReference;
                     }
                     break;
                  }
               }
            }
         }
      }
   }
   e = FixRefExp(e);
   return e;
}

static Expression GetInnerExp(Expression exp)
{
   Expression e = exp;
   while(e && (e.type == bracketsExp || e.type == castExp))
   {
      if(e.type == bracketsExp)
         e = e.list ? e.list->last : null;
      else if(e.type == castExp)
         e = e.cast.exp;
   }
   return e;
}

Expression GetNonBracketsExp(Expression exp)
{
   Expression e = exp;
   while(e && e.type == bracketsExp)
      e = e.list ? e.list->last : null;
   return e;
}

static bool FixMember(Expression exp)
{
   bool byReference = false;
   for(;exp;)
   {
      if(exp.type == bracketsExp || exp.type == extensionExpressionExp)
      {
         if(exp.list->count > 1)
            byReference = true;
         exp = exp.list->last;
      }
      else if(exp.type == castExp)
      {
         exp = exp.cast.exp;
      }
      else
      {
         if(byReference)
            FixReference(exp, true);
         else
            byReference = exp.byReference;
         break;
      }
   }
   return byReference;
}

static void ProcessExpression(Expression exp)
{
   Location oldyylloc = yylloc;
#ifdef _DEBUG
   char debugExpString[1024] = "";
   PrintExpression(exp, debugExpString);
#endif

   // Testing this here
   yylloc = exp.loc;

   switch(exp.type)
   {
      case identifierExp:
      {
         if(exp.expType && exp.expType.kind == methodType)
         {
            Class _class = exp.expType.methodClass;
            Method method = exp.expType.method;
            if(method.type == virtualMethod)
            {
               char name[1024];
               TypeName typeName;
               Declarator decl;
               OldList * specs = MkList();
               strcpy(name, "__ecereVMethodID_");
               FullClassNameCat(name, method._class.fullName, false);
               strcat(name, "_");
               strcat(name, method.name);

               DeclareMethod(curExternal, method, name);

               // Cast function to its type
               decl = SpecDeclFromString(method.dataTypeString, specs, MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), null)));
               if(!method.dataType.staticMethod)
               {
                  Declarator funcDecl = GetFuncDecl(decl);

                  if(!funcDecl.function.parameters)
                     funcDecl.function.parameters = MkList();
                  {
                     TypeName firstParam = ((TypeName)funcDecl.function.parameters->first);
                     Specifier firstSpec = firstParam ? firstParam.qualifiers->first : null;

                     if(firstParam && firstSpec.type == baseSpecifier && firstSpec.specifier == VOID && !firstParam.declarator)
                        funcDecl.function.parameters->Remove(funcDecl.function.parameters->first);
                  }

                  funcDecl.function.parameters->Insert(null, MkTypeName(MkListOne(
                     /*MkClassName*/MkSpecifierName(method.dataType.thisClass ? method.dataType.thisClass.string : method._class.fullName)), null));
               }

               typeName = MkTypeName(specs, decl);

               if(_class)
               {
                  char className[1024];
                  // Need the class itself here...
                  strcpy(className, "__ecereClass_");
                  FullClassNameCat(className, _class.fullName, true);

                  if(!_class.symbol)
                     _class.symbol = FindClass(_class.fullName);
                  DeclareClass(curExternal, _class.symbol, className);

                  if(exp.identifier)
                     FreeIdentifier(exp.identifier);
                  exp.type = bracketsExp;
                  exp.list = MkListOne(MkExpCast(typeName,
                     MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")),
                     MkListOne(MkExpIdentifier(MkIdentifier(name))))));
               }
            }
            else
            {
               char name[1024];
               strcpy(name, "__ecereMethod_");
               FullClassNameCat(name, method._class.fullName, false);
               strcat(name, "_");
               strcat(name, method.name);

               delete exp.identifier.string;
               FreeSpecifier(exp.identifier._class);

               exp.identifier._class = null;
               exp.identifier.string = CopyString(name);
               DeclareMethod(curExternal, method, name);
            }
         }
         /*
         if(exp.usage & USAGE_MEMBER)
            FixReference(exp, true);
         */
         break;
      }
      case constantExp:
         break;
      case stringExp:
         break;
      case newExp:
      case new0Exp:
      case renewExp:
      case renew0Exp:
      {
         OldList * args = MkList();

         if(exp.type == renewExp || exp.type == renew0Exp)
            ListAdd(args, exp._renew.exp);

         ListAdd(args, MkExpOp(MkExpTypeSize(exp._new.typeName), '*', MkExpBrackets(MkListOne(exp._new.size))));

         switch(exp.type)
         {
            case newExp:   exp.call.exp = QMkExpId("ecere::com::eSystem_New"); DeclareFunctionUtil(curExternal, "eSystem_New"); break;
            case new0Exp:  exp.call.exp = QMkExpId("ecere::com::eSystem_New0"); DeclareFunctionUtil(curExternal, "eSystem_New0"); break;
            case renewExp: exp.call.exp = QMkExpId("ecere::com::eSystem_Renew"); DeclareFunctionUtil(curExternal, "eSystem_Renew"); break;
            case renew0Exp:exp.call.exp = QMkExpId("ecere::com::eSystem_Renew0"); DeclareFunctionUtil(curExternal, "eSystem_Renew0"); break;
         }
         exp.call.arguments = args;
         exp.type = callExp;

         ProcessExpression(exp);
         break;
      }
      case opExp:
      {
         Expression exp1 = exp.op.exp1;
         Expression exp2 = exp.op.exp2;

         switch(exp.op.op)
         {
            // Assignment Operators
            case '=':
               if(exp.op.exp2)
                  exp.op.exp2.usage.usageGet = true;
               break;
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
               exp.op.exp2.usage.usageGet = true;
               break;

            case INC_OP:
            case DEC_OP:

            // Unary operators
            case '&':
               // Also binary
               if(exp.op.exp1 && exp.op.exp2)
               {
                  exp.op.exp1.usage.usageGet = true;
                  exp.op.exp2.usage.usageGet = true;
               }
               else if(exp.op.exp2)
               {
                  exp.op.exp2.usage.usageRef = true;
               }
               break;
            case '*':
            case '+':
            case '-':
               // Also binary
               if(exp.op.exp1)
               {
                  exp.op.exp1.usage.usageGet = true;
               }
            case '~':
            case '!':
               if(exp.op.exp2)
                  exp.op.exp2.usage.usageGet = true;
               break;

            // Binary only operators
            case '/':
            case '%':
            case LEFT_OP:
            case RIGHT_OP:
            case '<':
            case '>':
            case LE_OP:
            case GE_OP:
            case EQ_OP:
            case NE_OP:
            case '|':
            case '^':
            case AND_OP:
            case OR_OP:
               if(exp.op.exp1)
                  exp.op.exp1.usage.usageGet = true;
               if(exp.op.exp2)
                  exp.op.exp2.usage.usageGet = true;
               break;
         }

         if(exp.op.op == '=' || exp.op.op == MUL_ASSIGN || exp.op.op == DIV_ASSIGN || exp.op.op == ADD_ASSIGN ||
            exp.op.op == MOD_ASSIGN || exp.op.op == SUB_ASSIGN || exp.op.op == LEFT_ASSIGN ||
            exp.op.op == RIGHT_ASSIGN || exp.op.op == AND_ASSIGN || exp.op.op == OR_ASSIGN ||
            exp.op.op == XOR_ASSIGN || exp.op.op == INC_OP || exp.op.op == DEC_OP)
         {
            Expression memberExp;
            Expression parentExp = null; // Where to take memberExp out from
            bool isIndexedContainerAssignment = false;

            // TOCHECK: See note below for this if
            if(exp.op.exp1 && exp.op.exp1.type == ExpressionType::memberExp)
            {
               // Extra bit of code to access deep properties...
               Expression testExp, topExp = null;
               Expression lastExp = exp.op.exp1, parentExp = null;
               Property lastProperty = null;
               Class propertyClass;

               char setName[1024], getName[1024];
               testExp = exp.op.exp1.member.exp;
               while(true)
               {
                  // Is further fixing needed to address if statement above in the same way?
                  while(testExp)
                  {
                     if(testExp.type == castExp)
                        testExp = testExp.cast.exp;
                     else if(testExp.type == bracketsExp || testExp.type == extensionExpressionExp)
                        testExp = testExp.list->last;
                     else if(testExp.type == ExpressionType::memberExp)
                        break;
                     else
                        testExp = null;
                  }
                  if(!testExp) break;

                  if(testExp.member.memberType == propertyMember ||
                     testExp.member.memberType == reverseConversionMember)
                  {
                     Type type = testExp.member.exp.expType;
                     if(type)
                     {
                        if(type.kind == classType)
                        {
                           Class _class = testExp.member.member.classSym ? testExp.member.member.classSym.registered : type._class.registered;
                           Class convertTo = null;
                           if(testExp.member.memberType == reverseConversionMember)
                           {
                              convertTo = _class;
                              _class = FindClass(testExp.member.member.string).registered;
                              // lastProperty = eClass_FindProperty(_class, convertTo.name, privateModule);
                              lastProperty = eClass_FindProperty(_class, convertTo.fullName, privateModule);
                           }
                           else
                           {
                              lastProperty = eClass_FindProperty(_class, testExp.member.member.string, privateModule);
                           }
                           if(lastProperty && lastProperty.Get && lastProperty.Set)
                           {
                              DeclareProperty(curExternal, lastProperty, setName, getName);
                              // propertyClass = convertTo ? _class : ((Symbol)lastProperty.symbol)._class;
                              propertyClass = convertTo ? _class :
                                 ((((Symbol)lastProperty.symbol).type &&
                                    ((Symbol)lastProperty.symbol).type.kind == classType) ? ((Symbol)lastProperty.symbol).type._class.registered : ((Symbol)lastProperty.symbol)._class);
                              // TODO: Handle this kind of things with bit classes?
                              if(propertyClass && propertyClass.type == structClass)
                              {
                                 topExp = testExp;
                                 parentExp = lastExp;
                              }
                              else if(propertyClass && propertyClass.type == bitClass)
                              {
                                 topExp = testExp;
                                 parentExp = lastExp;
                              }
                           }

                        }
                     }
                  }
                  lastExp = testExp;

                  testExp = testExp.member.exp;
               }
               if(topExp)
               {
                  if(propertyClass.type == structClass)
                  {
                     Expression copy;
                     Expression value;
                     char className[1024];
                     Expression tempExp;

                     sprintf(className, "__simpleStruct%d", curContext.simpleID); //++);
                     tempExp = QMkExpId(className);
                     tempExp.expType = MkClassType(propertyClass.fullName);

                     parentExp.member.exp = tempExp;

                     value = MkExpBrackets(MkList());

                     copy = CopyExpression(topExp);
                     copy.usage.usageGet = true;
                     copy.usage.usageDeepGet = true;

                     ListAdd(value.list, copy);
                     ListAdd(value.list, MkExpOp(exp.op.exp1, exp.op.op, exp.op.exp2));
                     ListAdd(value.list, CopyExpression(tempExp));
                     value.expType = tempExp.expType;
                     tempExp.expType.refCount++;

                     // Go on as usual with these new values:
                     exp.op.exp1 = topExp;
                     exp.op.exp2 = value;
                     exp.op.op = '=';

                     exp1 = exp.op.exp1;
                     exp2 = exp.op.exp2;
                  }
                  else if(propertyClass.type == bitClass)
                  {
                     Expression copy;
                     Expression value;
                     char className[1024];
                     Expression tempExp;

                     sprintf(className, "__simpleStruct%d", curContext.simpleID); //++);
                     tempExp = QMkExpId(className);
                     tempExp.expType = MkClassType(propertyClass.fullName);

                     parentExp.member.exp = tempExp;

                     value = MkExpBrackets(MkList());

                     copy = CopyExpression(topExp);
                     copy.usage.usageGet = true;
                     copy.usage.usageDeepGet = true;

                     ListAdd(value.list, copy);
                     ListAdd(value.list, MkExpOp(exp.op.exp1, exp.op.op, exp.op.exp2));
                     ListAdd(value.list, CopyExpression(tempExp));
                     value.expType = tempExp.expType;
                     value.expType.refCount++;

                     //value = MkExpOp(exp.op.exp1, exp.op.op, exp.op.exp2);

                     // Go on as usual with these new values:
                     exp.op.exp1 = topExp;
                     exp.op.exp2 = value;
                     exp.op.op = '=';

                     exp1 = exp.op.exp1;
                     exp2 = exp.op.exp2;
                  }
               }
            }

            memberExp = exp.op.exp1;

            while(memberExp && ((memberExp.type == bracketsExp && memberExp.list->count == 1) ||
               memberExp.type == extensionExpressionExp || memberExp.type == extensionCompoundExp))
            {
               parentExp = memberExp;
               if(memberExp.type == extensionCompoundExp)
                  memberExp = ((Statement)memberExp.compound.compound.statements->last).expressions->last;
               else
                  memberExp = memberExp.list->last;
            }

            if(memberExp && memberExp.type == indexExp && memberExp.index.exp && memberExp.index.exp.expType &&
               memberExp.index.exp.expType.kind == classType && memberExp.index.exp.expType._class && memberExp.index.exp.expType._class.registered &&
               memberExp.index.exp.expType._class.registered != containerClass && eClass_IsDerived(memberExp.index.exp.expType._class.registered, containerClass))
            {
               Class c = memberExp.index.exp.expType._class.registered;
               if(strcmp((c.templateClass ? c.templateClass : c).name, "Array"))
               {
                  exp.op.exp2 = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), MkExpBrackets(MkListOne(exp.op.exp2)));
                  exp.op.exp2 = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), null), MkExpBrackets(MkListOne(exp.op.exp2)))));
                  isIndexedContainerAssignment = true;
               }

               ProcessExpression(memberExp);

               while(memberExp && ((memberExp.type == bracketsExp && memberExp.list->count == 1) ||
                  memberExp.type == extensionExpressionExp || memberExp.type == extensionCompoundExp))
               {
                  parentExp = memberExp;
                  if(memberExp.type == extensionCompoundExp)
                     memberExp = ((Statement)memberExp.compound.compound.statements->last).expressions->last;
                  else
                     memberExp = memberExp.list->last;
               }

               if(memberExp && memberExp.type == extensionCompoundExp)
               {
                  parentExp = memberExp;
                  if(memberExp.type == extensionCompoundExp)
                  {
                     Statement stmt = memberExp.compound.compound.statements ? memberExp.compound.compound.statements->last : null;
                     if(stmt && stmt.type != expressionStmt) stmt = null;
                     memberExp = (stmt && stmt.expressions) ? stmt.expressions->last : null;
                     if(memberExp)
                     {
                        stmt.expressions->Remove(memberExp);
                        stmt.expressions->Add(MkExpOp(memberExp, exp.op.op, exp.op.exp2));
                        exp.type = bracketsExp;
                        exp.list = MkListOne(parentExp);
                        ProcessExpression(exp);
                        break;
                     }
                  }
                  else
                     memberExp = memberExp.list->last;
               }
            }

            if(memberExp && memberExp.type != ExpressionType::memberExp) memberExp = null;

            if(memberExp && memberExp.type == ExpressionType::memberExp && memberExp.member.member)
            {
               Type type = memberExp.member.exp.expType;
               if(type)
               {
                  // Check if it's an instance
                  if(type.kind == classType || type.kind == subClassType)
                  {
                     // TODO: SOMETHING WRONG HERE...
                     Class _class = memberExp.member.member.classSym ? (memberExp.member.member.classSym ? memberExp.member.member.classSym.registered : null) : (type._class ? type._class.registered : null);

                     if(memberExp == exp1)
                        exp1 = null;
                     else
                     {
                        if(parentExp.type == extensionCompoundExp)
                           ((Statement)parentExp.compound.compound.statements->last).expressions->Remove(memberExp);
                        else
                           parentExp.list->Remove(memberExp);
                     }

                     if(_class && _class.type == bitClass && memberExp.member.memberType == dataMember)
                     {
                         BitMember bitMember =
                            (BitMember)eClass_FindDataMember(_class,
                              memberExp.member.member.string, privateModule, null, null);
                         char mask[32], shift[10];
                         OldList * specs = MkList();
                         //Declarator decl = SpecDeclFromString(bitMember.dataTypeString, specs, null);
                         Declarator decl = SpecDeclFromString(_class.dataTypeString, specs, null);
                         TypeName type = MkTypeName(specs, decl);

                         if(bitMember.mask > MAXDWORD)
                            sprintf(mask, FORMAT64HEXLL, bitMember.mask);
                         else
                            sprintf(mask, FORMAT64HEX, bitMember.mask);
                         sprintf(shift, "%d", bitMember.pos);

                         // color = (color & ~0xFF0000) | (((unsigned char)200) << 16)
                         exp.op.exp1 = memberExp.member.exp;

                         // TESTING THIS FOR: argb.color.r = 1;
                         //ProcessExpression(memberExp.member.exp);

                         // TESTING THIS... FIX ELSEWHRE... FIX FOR OTHER OPS
                         if(exp.op.op == XOR_ASSIGN)
                         {
                            exp.op.exp2 = MkExpOp(MkExpBrackets(
                                 MkListOne(MkExpCast(type, exp.op.exp2))), LEFT_OP, MkExpConstant(shift));
                         }
                         else
                         {
                            exp.op.exp2 = MkExpOp(
                               MkExpBrackets(MkListOne(MkExpOp(CopyExpression(memberExp.member.exp), '&',
                                 MkExpOp(null, '~', MkExpConstant(mask))))), '|',
                               MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(
                                 MkListOne(MkExpCast(type, MkExpBrackets(MkListOne(exp.op.exp2))))), LEFT_OP, MkExpConstant(shift)))));
                         }

                         memberExp.member.exp = null;
                         FreeExpression(memberExp);

                         // TESTING THIS FOR: argb.color.r = 1;
                         ProcessExpression(exp);
                         return;
                     }
                     else if(_class && _class.type == unitClass && memberExp.member.memberType == dataMember)
                     {
                     }
                     else if(memberExp.member.memberType != dataMember)
                     {
                        Property prop;
                        Class convertTo = null;
                        ClassProperty classProperty = null;

                        if(memberExp.member.memberType == reverseConversionMember)
                        {
                           convertTo = _class;
                           _class = FindClass(memberExp.member.member.string).registered;
                           // prop = eClass_FindProperty(_class, convertTo.name, privateModule);
                           prop = eClass_FindProperty(_class, convertTo.fullName, privateModule);
                        }
                        else
                           prop = eClass_FindProperty(_class, memberExp.member.member.string, privateModule);

                        if(memberExp.member.memberType == classPropertyMember)
                           classProperty = eClass_FindClassProperty(_class, memberExp.member.member.string);

                        exp.tempCount = memberExp.member.exp.tempCount;

                        if(classProperty)
                        {
                           // Only process Gets here, Set is processed in opExp's '='
                           if(classProperty.Set)
                           {
                              Identifier id = memberExp.member.member;
                              Expression classExp = memberExp.member.exp;
                              Expression value = exp.op.exp2;

                              memberExp.member.exp = null;
                              memberExp.member.member = null;
                              exp.op.exp2 = null;

                              FreeExpContents(memberExp);

                              // Class Property
                              exp.type = callExp;
                              exp.call.exp = MkExpIdentifier(MkIdentifier("ecere::com::eClass_SetProperty"));
                              exp.call.arguments = MkList();
                              ListAdd(exp.call.arguments, classExp);
                              {
                                 char * s = QMkString(id.string);
                                 ListAdd(exp.call.arguments, MkExpString(s));
                                 delete s;
                              }
                              if(value.expType.isPointerType)
                                 value = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("intptr")), null), value);
                              ListAdd(exp.call.arguments, MkExpCast(MkTypeName(MkListOne(MkSpecifier(INT64)), null), value));

                              FreeIdentifier(id);

                              ProcessExpression(exp);
                              return;
                           }
                        }
                        else if(prop)
                        {
                           if((!convertTo && prop.Set) || (convertTo && prop.Get))
                           {
                              Expression value = exp.op.exp2;
                              char setName[1024], getName[1024];
                              char * setToUse = convertTo ? getName : setName;
                              char * getToUse = convertTo ? setName : getName;
                              bool needAddress = false;
                              int operator = exp.op.op;
                              switch(operator)
                              {
                                 case MUL_ASSIGN: operator = '*'; break;
                                 case DIV_ASSIGN: operator = '/'; break;
                                 case MOD_ASSIGN: operator = '%'; break;
                                 case SUB_ASSIGN: operator = '-'; break;
                                 case ADD_ASSIGN: operator = '+'; break;
                                 case LEFT_ASSIGN: operator = LEFT_OP; break;
                                 case RIGHT_ASSIGN: operator = RIGHT_OP; break;
                                 case AND_ASSIGN: operator = '&'; break;
                                 case OR_ASSIGN: operator = '|'; break;
                                 case XOR_ASSIGN: operator = '^'; break;
                              }

                              if(operator != '=')
                              {
                                 if(operator == INC_OP)
                                    value = MkExpOp(CopyExpression(memberExp),
                                       '+', MkExpConstant("1"));
                                 else if(operator == DEC_OP)
                                    value = MkExpOp(CopyExpression(memberExp),
                                       '-', MkExpConstant("1"));
                                 else
                                 {
                                    value = MkExpOp(CopyExpression(memberExp),
                                       operator, value);
                                    exp2 = null;
                                 }
                                 value.expType = memberExp.expType;
                                 memberExp.expType.refCount++;
                                 value.usage.usageArg = true;
                              }
                              else if(value)
                              {
                                 // Dont free exp2, we're using it
                                 exp2 = null;
                              }

                              if(value)
                                 value.usage.usageArg = true;

                              DeclareProperty(curExternal, prop, setName, getName);

                              if(memberExp.member.exp)
                                 ProcessExpression(memberExp.member.exp);

                              // If get flag present
                              if(exp.usage.usageGet &&
                                 ((!convertTo && prop.Get) || (convertTo && prop.Set)))
                              {
                                 OldList * list = MkList();
                                 OldList * args;
                                 char ecereTemp[100];
                                 Context context = PushContext();
                                 exp.tempCount++;

                                 curExternal.function.tempCount = Max(curExternal.function.tempCount, exp.tempCount);
                                 sprintf(ecereTemp, "__ecTemp%d", exp.tempCount);

                                 curContext = context;
                                 exp.type = extensionCompoundExp;
                                 exp.compound = MkCompoundStmt(
                                    MkListOne(MkDeclaration(MkListOne(MkSpecifier(VOID)), MkListOne(MkInitDeclarator(
                                       MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))),
                                          MkInitializerAssignment(QBrackets(memberExp.member.exp)))))),
                                    list);

                                 // Add the set
                                 args = MkList();
                                 if(convertTo)
                                 {
                                    ListAdd(args, value);
                                    ListAdd(args, QMkExpId(ecereTemp));
                                    ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(getName), args))));
                                 }
                                 else
                                 {
                                    ListAdd(args, QMkExpId(ecereTemp));
                                    ListAdd(args, value);
                                    ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(setName), args))));
                                 }

                                 // Add the get
                                 args = MkList();
                                 if(convertTo)
                                    ListAdd(args, QMkExpId(ecereTemp));
                                 else
                                    args->Insert(null, QMkExpId(ecereTemp));
                                 ListAdd(list, MkExpressionStmt(MkListOne(MkExpCall(QMkExpId(getToUse), args))));

                                 exp.compound.compound.context = context;
                                 PopContext(context);
                                 curContext = context.parent;
                              }
                              else
                              {
                                 Expression newExp = exp;

                                 if(parentExp && parentExp.type == extensionCompoundExp)
                                 {
                                    newExp = Expression { };
                                    ((Statement)parentExp.compound.compound.statements->last).expressions->Add(newExp);
                                    FreeType(exp.expType);
                                    FreeType(exp.destType);
                                    exp = *parentExp;
                                    //delete parentExp;
                                    parentExp.type = dummyExp;
                                    parentExp.expType = null;
                                    parentExp.destType = null;
                                 }

                                 newExp.type = callExp;
                                 newExp.call.exp = QMkExpId(setToUse);
                                 newExp.call.arguments = MkList();
                                 if(convertTo)
                                 {
                                    ListAdd(newExp.call.arguments, value);
                                    ListAdd(newExp.call.arguments, FixReference(memberExp.member.exp, true));
                                 }
                                 else
                                 {
                                    ListAdd(newExp.call.arguments, FixReference(memberExp.member.exp, true));
                                    ListAdd(newExp.call.arguments, value);
                                 }
                                 needAddress = true;
                              }

                              // Take it out from there
                              memberExp.member.exp = null;

                              // Don't use the temporaries used by the left side...
                              if(value)
                              {
                                 value.tempCount = exp.tempCount;
                                 ProcessExpression(value);
                                 if(needAddress)
                                    FixReference(isIndexedContainerAssignment ? GetInnerExp(value) : value, true);
                              }

                              FreeExpression(memberExp);
                           }
                           else
                           {
                              DataMember member = eClass_FindDataMember(_class, memberExp.member.member.string, privateModule, null, null);
                              if(member)
                              {
                                 memberExp.member.memberType = dataMember;
                              }
                              else
                                 Compiler_Error($"no set defined for property %s of class %s\n", prop.name, prop._class.fullName);
                           }
                        }
                        else
                        {
                           Method method = eClass_FindMethod(_class, memberExp.member.member.string, privateModule);
                           if(method && method.type == virtualMethod && type.kind != subClassType)
                           {
                              Expression value = exp.op.exp2;
                              // Don't use the temporaries used by the left side...
                              value.tempCount = exp.tempCount;
                              ProcessExpression(value);

                              if(memberExp.member.exp)
                                 ProcessExpression(memberExp.member.exp);

                              if(exp.usage.usageGet)
                              {
                                 OldList * list = MkList();
                                 OldList * args;

                                 // Set the method
                                 args = MkList();
                                 ListAdd(args, memberExp.member.exp);
                                 {
                                    char * string = QMkString(memberExp.member.member.string);
                                    ListAdd(args, MkExpString(string));
                                    delete string;
                                 }
                                 ListAdd(args, value);
                                 ListAdd(list, MkExpCall(QMkExpId("ecere::com::eInstance_SetMethod"), args));
                                 ListAdd(list, CopyExpression(value));
                                 exp.type = bracketsExp;
                                 exp.list = list;
                              }
                              else
                              {
                                 // Set the method
                                 exp.type = callExp;
                                 exp.call.exp = QMkExpId("ecere::com::eInstance_SetMethod");
                                 exp.call.arguments = MkList();
                                 ListAdd(exp.call.arguments, memberExp.member.exp);
                                 {
                                    char * string = QMkString(memberExp.member.member.string);
                                    ListAdd(exp.call.arguments, MkExpString(string));
                                    delete string;
                                 }
                                 ListAdd(exp.call.arguments, value);
                              }

                              memberExp.member.exp = null;
                              exp2 = null;

                              FreeExpression(memberExp);
                           }
                        }
                     }
                     else if(memberExp.member.memberType == dataMember)
                     {
                        //if(exp.usage & USAGE_GET);
                        //FixReference(value, true);
                        if(FixMember(memberExp.member.exp))
                        {
                           // TESTING THIS HERE:
                           ProcessExpression(memberExp);

                           memberExp.type = pointerExp;
                        }
                     }
                  }
               }
            }
         }
         else if(exp.op.op == _INCREF)
         {
            Expression object = exp.op.exp2;
            exp.op.exp2 = null;
            FreeExpContents(exp);
            FreeType(exp.expType);
            FreeType(exp.destType);
            exp.expType = null;
            exp.destType = null;
            exp.op.op = INC_OP;
            exp.op.exp1 = MkExpPointer(object, MkIdentifier("_refCount"));
         }
         else if(exp.op.op == DELETE)
         {
            Expression object = exp.op.exp2;
            OldList * args = MkList();

            exp.type = bracketsExp;
            exp.list = MkList();

            object.usage.usageDelete = true;

            ProcessExpression(object);

            ListAdd(args, object);

            // TOFIX: Same time as when we fix for = 0

            if(exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered &&
               exp.expType._class.registered.type == normalClass &&
               strcmp(exp.expType._class.registered.dataTypeString, "char *"))
            {
               Expression decRefExp = MkExpCall(QMkExpId("ecere::com::eInstance_DecRef"), args);
               ProcessExpressionType(decRefExp);
               ListAdd(exp.list, decRefExp);
            }
            else if(exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == noHeadClass)
            {
               /*
               char className[1024];
               OldList * list = MkList();

               strcpy(className, "__ecereClass_");
               FullClassNameCat(className, exp.expType._class.string, true);

               DeclareClass(exp.expType._class, className);

               // Call the non virtual destructor
               ListAdd(list, MkExpCall(MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")), CopyList(args, CopyExpression)));
               ListAdd(list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));

               ListAdd(exp.list, MkExpBrackets(MkListOne(MkExpCondition(CopyExpression(object), MkListOne(

                  MkExpBrackets(MkListOne(MkExpCondition(
                  MkExpPointer(QMkExpId(className), MkIdentifier("Destructor")),
                  MkListOne(MkExpBrackets(list)), MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), CopyList(args, CopyExpression)))))), MkExpConstant("0"))))

                  );
               */

               OldList * list = MkList();
               Class _class;
               Statement stmt;
               Expression o;
               Statement compound = MkCompoundStmt(MkListOne(MkDeclaration(MkListOne(MkSpecifier(VOID)), MkListOne(MkInitDeclarator(MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(MkIdentifier("__ecerePtrToDelete"))),
                  MkInitializerAssignment(MkExpBrackets(args)))))), MkListOne(stmt = MkExpressionStmt(list)));
               Expression stmtExp = MkExpExtensionCompound(compound);
               for(_class = exp.expType._class.registered; _class && _class.type == noHeadClass; _class = _class.base)
               {
                  char className[1024];

                  if(_class.templateClass) _class = _class.templateClass;
                  strcpy(className, "__ecereClass_");
                  FullClassNameCat(className, _class.fullName, false /*true*/);

                  if(!_class.symbol)
                     _class.symbol = FindClass(_class.fullName);
                  DeclareClass(curExternal, _class.symbol, className);

                  // Call the non virtual destructor
                  ListAdd(list,
                     MkExpCondition(
                        MkExpPointer(
                           QMkExpId(className),
                           MkIdentifier("Destructor")
                        ),
                        MkListOne(
                           MkExpCall(
                              MkExpPointer(
                                 QMkExpId(className),
                                 MkIdentifier("Destructor")
                              ),
                              MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null)), MkExpIdentifier(MkIdentifier("__ecerePtrToDelete")) /*CopyExpression(args->first)*/))
                           )
                        ),
                        MkExpConstant("0")
                     )
                  );
               }
               ListAdd(list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), MkListOne(MkExpIdentifier(MkIdentifier("__ecerePtrToDelete"))) /*args*/));
               DeclareFunctionUtil(curExternal, "eSystem_Delete");
               o = CopyExpression(object);
               ProcessExpressionType(o);
               o.usage.usageGet = true;
               ProcessExpression(o);

               ListAdd(exp.list,
                  MkExpBrackets(
                     MkListOne(
                        MkExpCondition(
                           o,
                           MkListOne(
                              //MkExpBrackets(list)
                              stmtExp
                           ),
                           MkExpConstant("0")
                        )
                     )
                  )
               );
            }
            else if(exp.expType && exp.expType.kind == templateType)
            {
               Expression argExp = GetTemplateArgExp(exp.expType.templateParameter, thisClass, false);
               if(argExp)
               {
                  Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
                  TypeName typeName;
                  OldList * qualifiers = MkList();
                  Declarator declarator = SpecDeclFromString("void (*)(void * _class, void * data)", qualifiers, null);

                  typeName = MkTypeName(qualifiers, declarator);

                  ProcessExpressionType(classExp);
                  ProcessExpression(classExp);
                  args->Insert(null, CopyExpression(classExp));
                  DeclareMethod(curExternal, eClass_FindMethod(eSystem_FindClass(privateModule, "class"), "OnFree", privateModule), "__ecereVMethodID_class_OnFree");
                  ListAdd(exp.list, MkExpCall(
                     MkExpBrackets(MkListOne(MkExpCast(typeName,
                        MkExpIndex(MkExpPointer(classExp, MkIdentifier("_vTbl")),
                           MkListOne(MkExpIdentifier(MkIdentifier("__ecereVMethodID_class_OnFree"))))))), args));
                  //ProcessExpression(exp.list->last);
               }
            }
            else
            {
               ListAdd(exp.list, MkExpCall(QMkExpId("ecere::com::eSystem_Delete"), args));
               DeclareFunctionUtil(curExternal, "eSystem_Delete");
            }

            //ProcessExpression(object);

            ListAdd(exp.list, MkExpOp(CopyExpression(GetInnerExp(object)), '=', MkExpConstant("0")));

            exp2 = null;

            // TESTING THIS HERE...
            ProcessExpression(exp);
         }

         if(exp.type == opExp)
         {
            // Handle assigment of template structures
            if(exp.op.op == '=' && exp.op.exp1 && exp.op.exp1.expType && exp.op.exp1.expType.kind == templateType &&
               (exp.op.exp1.type == indexExp || (exp.op.exp1.type == opExp && exp.op.exp1.op.op == '*' && !exp.op.exp1.op.exp1)))
            {
               Expression argExp = GetTemplateArgExp(exp.op.exp1.expType.templateParameter, thisClass, false);
               if(argExp)
               {
                  // memcpy((byte *)array + (count * dataTypeClass.size), (dataTypeClass.type == structClass) ? value : &value, dataTypeClass.size);

                  Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
                  OldList * args = MkList();
                  Expression derefExp = exp.op.exp1;
                  Expression sizeExp;

                  ProcessExpressionType(classExp);
                  ProcessExpression(classExp);

                  sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));

                  if(exp.op.exp1.type == indexExp)
                  {
                     Expression indexExp = derefExp.index.exp;
                     OldList * indexExpIndex = derefExp.index.index;

                     derefExp.index.index = null;
                     derefExp.index.exp = null;
                     FreeExpression(derefExp);

                     // BOOSTRAP FIX
                     derefExp = MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null, null), null)), indexExp), '+',
                        MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(indexExpIndex), '*', MkExpBrackets(MkListOne(CopyExpression(sizeExp)))))));
                  }
                  else
                  {
                     Expression indexExp = derefExp.op.exp2;
                     derefExp.op.exp2 = null;
                     FreeExpression(derefExp);
                     derefExp = indexExp;
                  }

                  args->Add(derefExp);
                  ProcessExpressionType(args->last);
                  ProcessExpression(args->last);

                  args->Add(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null, null), null)),
                     MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(classExp, MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))),
                           MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null, null), null)), MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), MkExpBrackets(MkListOne(exp.op.exp2))))),
                           MkExpOp(null, '&', CopyExpression(exp.op.exp2)))));

                  thisClass = curExternal.function ? curExternal.function._class : null;
                  {
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(thisClass.fullName);
                     };
                     globalContext.symbols.Add((BTNode)thisSymbol);

                     ProcessExpressionType(args->last);
                     ProcessExpression(args->last);

                     args->Add(sizeExp);
                     ProcessExpressionType(args->last);
                     ProcessExpression(args->last);

                     DeclareFunctionUtil(curExternal, "memcpy");

                     exp.list = MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("memcpy")), args));
                     exp.type = bracketsExp;

                     //globalContext.symbols.Delete((BTNode)thisSymbol);
                     globalContext.symbols.Remove((BTNode)thisSymbol);
                     FreeSymbol(thisSymbol);
                  }
                  thisClass = null;
                  return;
               }
            }
            else if(exp.op.op == '*' && !exp.op.exp1 && exp.op.exp2 && exp.op.exp2.expType && exp.op.exp2.expType.kind == pointerType &&
               exp.op.exp2.expType.type && exp.op.exp2.expType.type.kind == templateType)
            {
               Expression argExp = GetTemplateArgExp(exp.op.exp2.expType.type.templateParameter, thisClass, false);
               if(argExp)
               {
                  Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
                  Expression sizeExp;

                  ProcessExpressionType(classExp);
                  ProcessExpression(classExp);

                  sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));

                  exp.type = bracketsExp;
                  exp.list = MkListOne(
                     // (uint64)
                     MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), null),

                     // ((class.type == structClass) ?
                     MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))),
                        // array
                        MkListOne(
                           MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), null), MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), CopyExpression(exp.op.exp2)))))),

                     // ((class.size == 1) ?
                     MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))),
                        // *((byte *)array)
                        MkListOne(MkExpOp(null, '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)),
                           CopyExpression(exp.op.exp2)))))),

                     // ((class.size == 2) ?
                     MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))),
                        // *((uint16 *)array)
                        MkListOne(MkExpOp(null, '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer(null, null), null)),
                           CopyExpression(exp.op.exp2)))))),

                     // ((class.size == 4) ?
                     MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))),
                        // *((uint32 *)array)
                        MkListOne(MkExpOp(null, '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer(null, null), null)),
                           CopyExpression(exp.op.exp2)))))),

                     // *((uint64 *)array)
                     MkExpOp(null, '*', MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer(null, null), null)),
                        exp.op.exp2))))))))))))))))))));

                  // Add this to the context
                  thisClass = curExternal.function ? curExternal.function._class : null;
                  {
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(thisClass.fullName);
                     };
                     globalContext.symbols.Add((BTNode)thisSymbol);

                     ProcessExpressionType(exp.list->first);
                     ProcessExpression(exp.list->first);

                     //globalContext.symbols.Delete((BTNode)thisSymbol);
                     globalContext.symbols.Remove((BTNode)thisSymbol);
                     FreeSymbol(thisSymbol);
                  }
                  thisClass = null;
                  return;
               }
            }
            else
            {
               if(exp.op.exp1)
               {
                  if(exp.op.exp2)
                     // TEST: exp.op.exp1.tempCount = Max(exp.op.exp1.tempCount, exp.op.exp2.tempCount);
                     exp.op.exp1.tempCount = exp.op.exp2.tempCount;
                  ProcessExpression(exp.op.exp1);

                  // TESTING THIS...
                  if(exp.op.op == '=' && exp.op.exp2 && (!exp.op.exp2.byReference ||
                     (exp.op.exp2.expType && exp.op.exp2.expType.kind == classType && exp.op.exp2.expType._class &&
                      exp.op.exp2.expType._class.registered && exp.op.exp2.expType._class.registered.type == structClass)) &&
                     exp.op.exp2.expType && (exp.op.exp2.expType.kind != pointerType && exp.op.exp2.expType.kind != templateType /*|| !exp.op.exp2.expType.type || exp.op.exp2.expType.type.kind != voidType*/))
                     FixReference(exp.op.exp1, false);
                  // TEST: exp.tempCount = Max(exp.op.exp1.tempCount, exp.tempCount);
               }
               if(exp.op.exp2)
               {
                  // Don't use the temporaries used by the left side...
                  if(exp.op.exp1)
                     // TEST: exp.op.exp2.tempCount = Max(exp.op.exp2.tempCount, exp.op.exp1.tempCount);
                     exp.op.exp2.tempCount = exp.op.exp1.tempCount;
                  ProcessExpression(exp.op.exp2);
                  if(exp.op.exp1 || (exp.op.op != '*' && exp.op.op != '&'))
                  {
                     // TESTING THIS IF:
                     if((!exp.op.exp1 &&
                        (!exp.op.exp2 || !exp.op.exp2.expType || exp.op.exp2.expType.kind != classType || !exp.op.exp2.expType._class || !exp.op.exp2.expType._class.registered ||
                        (exp.op.exp2.expType._class.registered.type != normalClass &&
                         exp.op.exp2.expType._class.registered.type != structClass &&
                         exp.op.exp2.expType._class.registered.type != noHeadClass)))

                            // TESTING THIS TEMPLATE TYPE CHECK HERE
                        || (exp.op.exp1 && exp.op.exp1.expType && exp.op.exp1.expType.kind != pointerType && exp.op.exp1.expType.kind != templateType))
                     {
                        FixReference(exp.op.exp2, exp.op.exp1 ? exp.op.exp1.byReference : false);
                        //FixReference(exp.op.exp2, false);
                     }
                  }
                  // TEST: exp.tempCount = Max(exp.op.exp2.tempCount, exp.tempCount);
               }
            }
            if(exp.op.op == '*' && !exp.op.exp1 && exp.op.exp2 && exp.op.exp2.type == opExp && exp.op.exp2.op.op == '&' && !exp.op.exp2.op.exp1)
            {
               // Preserve prev, next
               Expression next = exp.next, prev = exp.prev;
               Expression derefExp = exp.op.exp2;
               Expression refExp = exp.op.exp2.op.exp2;

               derefExp.op.exp2 = null;
               FreeExpression(derefExp);
               FreeType(exp.expType);
               FreeType(exp.destType);

               *exp = refExp;

               exp.prev = prev;
               exp.next = next;

               delete refExp;
            }

            if(exp.op.op == '&' && !exp.op.exp1 && exp.op.exp2 && exp.op.exp2.expType && exp.op.exp2.expType.kind == templateType && !exp.op.exp2.expType.passAsTemplate)
            {
               Expression exp2 = exp.op.exp2;
               Expression argExp = GetTemplateArgExp(exp2.expType.templateParameter, thisClass, false);
               if(argExp)
               {
                  Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
                  Expression e;

                  ProcessExpressionType(classExp);
                  ProcessExpression(classExp);

                  exp.type = bracketsExp;
                  exp.list = MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null, null), null)),
                                 MkExpOp(null, '&', exp2)), '+',
                                    MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")),
                                       MkListOne((e = MkExpMember(classExp, MkIdentifier("typeSize")))))));

                                             // Add this to the context
                  thisClass = curExternal.function ? curExternal.function._class : null;
                  {
                     /*Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(thisClass.fullName);
                     };*/
                     //globalContext.symbols.Add((BTNode)thisSymbol);

                     ProcessExpressionType(e);
                     ProcessExpression(e);

                     //globalContext.symbols.Remove((BTNode)thisSymbol);
                     //FreeSymbol(thisSymbol);
                  }
                  thisClass = null;
               }
            }
         }
         else
         {
            if(exp1)
               FreeExpression(exp1);
            if(exp2)
               FreeExpression(exp2);
         }
         break;
      }
      case bracketsExp:
      case extensionExpressionExp:
      {
         if(exp.list)
         {
            Expression e;
            for(e = exp.list->first; e; e = e.next)
            {
               if(!e.next)
               {
                  e.usage |= (exp.usage & ExpUsage { usageGet = true, usageArg = true, usageMember = true });
               }
               e.tempCount = exp.tempCount;
               ProcessExpression(e);
               if(!e.next)
                  exp.byReference = e.byReference;
               exp.tempCount = e.tempCount;

               /*
               if(!e.next)
                  exp.expType = e.expType;
               */
            }
         }
         break;
      }
      case indexExp:
      {
         Expression e;
         /*bool isBuiltin = exp && exp.index.exp &&
            (exp.index.exp.type == ExpressionType::arrayExp ||
              (exp.index.exp.type == castExp && exp.index.exp.cast.exp.type == ExpressionType::arrayExp));
         */
         Expression checkedExp = exp.index.exp;
         bool isBuiltin = false;

         while(checkedExp.type == extensionCompoundExp || checkedExp.type == bracketsExp || checkedExp.type == castExp)
         {
            if(checkedExp.type == extensionCompoundExp)
            {
               isBuiltin = true;
               break;
            }
            else if(checkedExp.type == bracketsExp)
               checkedExp = checkedExp.list ? checkedExp.list->last : null;
            else
               checkedExp = checkedExp.cast.exp;
         }

         exp.index.exp.tempCount = exp.tempCount;

         exp.index.exp.usage.usageGet = true;
         ProcessExpression(exp.index.exp);

         if(exp.index.exp.expType && exp.index.exp.expType.kind == pointerType &&
            exp.index.exp.expType.type && exp.index.exp.expType.type.kind == templateType)
         {
            Expression argExp = GetTemplateArgExp(exp.index.exp.expType.type.templateParameter, thisClass, false);
            if(argExp)
            {
               Expression classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));
               Expression sizeExp;

               ProcessExpressionType(classExp);
               ProcessExpression(classExp);

               sizeExp = MkExpMember(CopyExpression(classExp), MkIdentifier("typeSize"));

               exp.type = bracketsExp;
               exp.list = MkListOne(
                  // (uint64)
                  MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), null),

                  // ((class.type == structClass) ?
                  MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(MkExpMember(CopyExpression(classExp), MkIdentifier("type")), EQ_OP, MkExpIdentifier(MkIdentifier("structClass"))))),
                     // ((byte *)array) + (i) * class.size
                     MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), null), MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), MkExpBrackets(MkListOne(MkExpOp(
                        MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)), CopyExpression(exp.index.exp)))), '+',
                        MkExpOp(MkExpBrackets(CopyList(exp.index.index, CopyExpression)), '*', CopyExpression(sizeExp)))))))),

                  // ((class.size == 1) ?
                  MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("1")))),
                     // ((byte *)array)[i]
                     MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("byte")), MkDeclaratorPointer(MkPointer(null, null), null)),
                        CopyExpression(exp.index.exp)))), CopyList(exp.index.index, CopyExpression))),

                  // ((class.size == 2) ?
                  MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(CopyExpression(sizeExp), EQ_OP, MkExpConstant("2")))),
                     // ((uint16 *)array)[i]
                     MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint16")), MkDeclaratorPointer(MkPointer(null, null), null)),
                        CopyExpression(exp.index.exp)))), CopyList(exp.index.index, CopyExpression))),

                  // ((class.size == 4) ?
                  MkExpBrackets(MkListOne(MkExpCondition(MkExpBrackets(MkListOne(MkExpOp(sizeExp, EQ_OP, MkExpConstant("4")))),
                     // ((uint32 *)array)[i]
                     MkListOne(MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint32")), MkDeclaratorPointer(MkPointer(null, null), null)),
                        CopyExpression(exp.index.exp)))), CopyList(exp.index.index, CopyExpression))),

                  // ((uint64 *)array)[i]
                  MkExpIndex(MkExpBrackets(MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uint64")), MkDeclaratorPointer(MkPointer(null, null), null)),
                     exp.index.exp))), exp.index.index)))))))))))))))));

               // Add this to the context
               thisClass = curExternal.function ? curExternal.function._class : null;
               {
                  Symbol thisSymbol
                  {
                     string = CopyString("this");
                     type = MkClassType(thisClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);

                  ProcessExpressionType(exp.list->first);
                  ProcessExpression(exp.list->first);

                  //globalContext.symbols.Delete((BTNode)thisSymbol);
                  globalContext.symbols.Remove((BTNode)thisSymbol);
                  FreeSymbol(thisSymbol);
               }
               thisClass = null;

               return;
            }
         }

         for(e = exp.index.index->first; e; e = e.next)
         {
            if(!e.next)
               e.usage.usageGet = true;
            ProcessExpression(e);
         }
         // Ignore temps in the index for now...
         exp.tempCount = exp.index.exp.tempCount;

         if(exp.index.exp.expType)
         {
            Type source = exp.index.exp.expType;
            if(/*isBuiltin || */source.kind == classType && source._class && source._class.registered && source._class.registered != containerClass &&
               eClass_IsDerived(source._class.registered, containerClass))
            {
               Class _class = source._class.registered;
               bool isArray = false;
               Class arrayClass = eSystem_FindClass(privateModule, "Array");
               if(source && eClass_IsDerived(source._class.registered, arrayClass))
                  isArray = true;
               if(isArray && _class.templateArgs)
               {
                  OldList * specs = MkList();
                  Declarator decl = SpecDeclFromString(_class.templateArgs[2].dataTypeString, specs, null);
                  TypeName typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl));
                  exp.index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName, MkExpMember(exp.index.exp, MkIdentifier("array")))));
                  ProcessExpressionType(exp.index.exp);
                  ProcessExpression(exp);
               }
               else if(isBuiltin && _class.templateArgs)
               {
                  OldList * specs = MkList();
                  Declarator decl = SpecDeclFromString(_class.templateArgs[2].dataTypeString, specs, null);
                  TypeName typeName = MkTypeName(specs, MkDeclaratorPointer(MkPointer(null, null), decl));
                  exp.index.exp = MkExpBrackets(MkListOne(MkExpCast(typeName,
                     MkExpPointer(MkExpCast(QMkType("BuiltInContainer", QMkPtrDecl(null)), exp.index.exp), MkIdentifier("data")))));
                  ProcessExpressionType(exp.index.exp);
                  ProcessExpression(exp);
               }
               else if(_class.templateArgs)
               {
                  // __extension__({ Iterator<type> i { container }; i.Index(e, [ exp.usage.usageSet ]; i.value; });

                  char iteratorType[1024];
                  OldList * declarations = MkList();
                  OldList * statements = MkList();
                  OldList * args = MkList();
                  OldList * instMembers = MkList();
                  Expression expExt;
                  Context context = PushContext();

                  sprintf(iteratorType, "Iterator<%s, %s >", _class.templateArgs[2].dataTypeString, _class.templateArgs[1].dataTypeString);

                  ListAdd(instMembers, MkMemberInit(null, MkInitializerAssignment(exp.index.exp)));

                  ListAdd(declarations, MkDeclarationInst(MkInstantiationNamed(MkListOne(MkSpecifierName(iteratorType)),
                     MkExpIdentifier(MkIdentifier("__internalIterator")), MkListOne(MkMembersInitList(instMembers)))));

                  ListAdd(args, MkExpBrackets(exp.index.index));
                  ListAdd(args, exp.usage.usageSet ? MkExpIdentifier(MkIdentifier("true")) : MkExpIdentifier(MkIdentifier("false")));

                  ListAdd(statements, MkExpressionStmt(MkListOne(MkExpCall(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")),
                     MkIdentifier("Index")), args))));

                  // ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(null, '&', MkExpIdentifier(MkIdentifier("__internalIterator"))))));
                  ListAdd(statements, MkExpressionStmt(MkListOne(MkExpMember(MkExpIdentifier(MkIdentifier("__internalIterator")), MkIdentifier("data")))));

                  exp.type = bracketsExp;
                  // exp.list = MkListOne(MkExpPointer(expExt = (MkExpExtensionCompound(MkCompoundStmt(declarations, statements))), MkIdentifier("data")));
                  exp.list = MkListOne(expExt = (MkExpExtensionCompound(MkCompoundStmt(declarations, statements))));
                  expExt.compound.compound.context = context;
                  PopContext(context);
                  expExt.usage = exp.usage;
                  ProcessExpressionType(exp.list->first);
                  ProcessExpressionInstPass(exp.list->first);
                  ProcessExpression(exp.list->first);
               }
            }
         }
         break;
      }
      case callExp:
      {
         Expression e;
         bool typedObject = false;
         Type ellipsisDestType = null;
         bool usedEllipsis = false;
         Expression expCallExp = exp.call.exp;
         OldList * arguments = exp.call.arguments;
         bool handleNullVMethod = false;
         TypeName typeName = null;

         if(arguments)
         {
            for(e = arguments->first; e; e = e.next)
            {
               e.usage.usageGet = true;
               e.usage.usageArg = true;
               e.tempCount = Max(e.tempCount, exp.tempCount);
               ProcessExpression(e);
               exp.tempCount = Max(exp.tempCount, e.tempCount);
            }
         }
         expCallExp.usage.usageGet = true;
         expCallExp.usage.usageCall = true;
         expCallExp.tempCount = exp.tempCount;

         ProcessExpression(expCallExp);

         if(expCallExp.expType && expCallExp.expType.kind == methodType)
         {
            bool nullMemberExp = false;
            Expression memberExp = (expCallExp.type == ExpressionType::memberExp) ? expCallExp : null;

            Class _class = expCallExp.expType.methodClass;     // For Virtual Method
            Class argClass = expCallExp.expType.methodClass;  // Class actually passed
            Method method = expCallExp.expType.method;
            if(method.type == virtualMethod)
            {
               char name[1024];
               Declarator decl;
               Context back;
               OldList * specs = MkList();
               strcpy(name, "__ecereVMethodID_");
               FullClassNameCat(name, method._class.fullName, false);
               strcat(name, "_");
               strcat(name, method.name);

               DeclareMethod(curExternal, method, name);

               back = curContext;
               // THIS SpecDeclFromString HERE SHOULD WORK WITH THE METHOD TEMPLATE PARAMETERS...
               curContext = (method._class.symbol) ? ((Symbol)method._class.symbol).ctx : globalContext;
               // Cast function to its type
               {
                  Context context = SetupTemplatesContext(method._class);

                  decl = SpecDeclFromString(method.dataTypeString, specs, MkDeclaratorBrackets(MkDeclaratorPointer(MkPointer(null, null), null)));

                  FinishTemplatesContext(context);
               }
               curContext = back;
               if(method.dataType && !method.dataType.staticMethod)
               {
                  Declarator funcDecl = GetFuncDecl(decl);

                  if(!funcDecl.function.parameters)
                     funcDecl.function.parameters = MkList();
                  {
                     TypeName firstParam = ((TypeName)funcDecl.function.parameters->first);
                     Specifier firstSpec = firstParam ? firstParam.qualifiers->first : null;

                     if(firstParam && firstSpec && firstSpec.type == baseSpecifier && firstSpec.specifier == VOID && !firstParam.declarator)
                     {
                        funcDecl.function.parameters->Remove(funcDecl.function.parameters->first);
                        FreeTypeName(firstParam);
                     }
                  }

                  if(method.dataType.thisClass && !strcmp(method.dataType.thisClass.string, "class"))
                  {
                     TypeName param;
                     typedObject = true;

                     param = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null,null), null));
                     param.qualifiers->Insert(null, MkSpecifier(CONST));
                     funcDecl.function.parameters->Insert(null, param);
                     // Testing this for any_object::
                     if(!method.dataType.extraParam)
                     {
                        funcDecl.function.parameters->Insert(null, MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null)), MkDeclaratorPointer(MkPointer(null,null), null)));
                        DeclareStruct(curExternal, "ecere::com::Class", false, true);
                     }
                  }
                  else
                  {
                     funcDecl.function.parameters->Insert(null, MkTypeName(MkListOne(
                        /*MkClassName*/MkSpecifierName(method.dataType.thisClass ? method.dataType.thisClass.string : method._class.fullName)), null));
                  }
               }

               typeName = MkTypeName(specs, decl);

               if(memberExp && memberExp.member.exp.expType)
               {
                  Type type = memberExp.member.exp.expType;

                  if(type.kind == classType && type._class && type._class.registered)
                  {
                     Class regClass = type._class.registered;
                     ClassType classType = regClass.type;
                     if(classType != normalClass || !strcmp(regClass.dataTypeString, "char *") || (method.dataType.byReference))// TESTING THIS OUT: && !memberExp.member.exp.expType.classObjectType)
                        argClass = regClass;
                  }
                  else if(type.kind == subClassType)
                  {
                     argClass = FindClass("ecere::com::Class").registered;
                  }
                  else if((type.kind == arrayType || type.kind == pointerType) && type.type && type.type.kind == charType)
                  {
                     argClass = FindClass("char *").registered;
                  }
                  else if(type.kind == pointerType)
                  {
                     argClass = eSystem_FindClass(privateModule, "uintptr");
                     FreeType(memberExp.member.exp.expType);
                     memberExp.member.exp.expType = ProcessTypeString("uintptr", false);
                     memberExp.member.exp.byReference = true;
                  }
                  else
                  {
                     char string[1024] = "";
                     Symbol classSym;
                     PrintTypeNoConst(type, string, false, true);
                     classSym = FindClass(string);
                     if(classSym) argClass = classSym.registered;
                  }

                  /*
                  if(!_class && argClass && strcmp(argClass.fullName, "class"))
                     _class = argClass;
                  */
               }

               {
                  Type type = memberExp ? memberExp.member.exp.expType : null;
                  Class regClass = (type && type.kind == classType && type._class) ? type._class.registered : null;
                  char className[1024];

                  // Added !exp.call.exp.expType.methodClass
                  if(!expCallExp.expType.methodClass && !_class && type && type.classObjectType)
                     strcpy(className, "class");
                  else
                  {
                     Class cl = _class;
                     // TESTING: Moved this here...
                     if(!cl && argClass && strcmp(argClass.fullName, "class"))
                        cl = argClass;
                     if(!cl)
                        cl = regClass;
                     if(!cl)
                        // TODO: Unhandled case here, what should happen?
                        cl = class(int);

                     // To avoid declaring classes templatized after this class template (e.g. public struct Iterator<class T, class IT = int> { Container<T, IT> container; } )
                     if(cl.templateClass && !_class && expCallExp.expType._class && !expCallExp.expType.methodClass &&
                        (type.kind == subClassType || (regClass && regClass.type == normalClass && strcmp(regClass.dataTypeString, "char *"))))
                        cl = cl.templateClass;

                     // Need the class itself here...
                     strcpy(className, "__ecereClass_");
                     FullClassNameCat(className, cl.fullName, true);

                     if(!cl.symbol)
                        cl.symbol = FindClass(cl.fullName);

                     DeclareClass(curExternal, cl.symbol, className);
                  }

                  if(type && type.kind == subClassType && !_class && !expCallExp.expType.methodClass && memberExp)
                  {
                     expCallExp = MkExpBrackets(MkListOne(MkExpCast(typeName,
                        MkExpIndex(MkExpPointer(CopyExpression(memberExp.member.exp), MkIdentifier("_vTbl")),
                        MkListOne(MkExpIdentifier(MkIdentifier(name)))))));

                     handleNullVMethod = true;
                  }
                  else if(_class || expCallExp.expType.methodClass || !memberExp ||
                         !regClass || regClass.type != normalClass || !strcmp(regClass.dataTypeString, "char *"))
                  {
                     if(!memberExp)
                        FreeExpression(expCallExp);
                     expCallExp = MkExpBrackets(MkListOne(MkExpCast(typeName,
                        MkExpIndex(MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl")),
                        MkListOne(MkExpIdentifier(MkIdentifier(name)))))));

                     handleNullVMethod = true;
                  }
                  else
                  {
                     // TOCHECK: Added this if statement here for File::OnSerialize to be calling the instance's own Seek function,
                     // as opposed to the File class vTbl one

                     // ({ Instance __internal_ClassInst = e; __internal_ClassInst ? __internal_ClassInst._vTbl : __ecereClass_...; })
                     Expression vTblExp;
                     Context context = PushContext();
                     OldList * specs;
                     OldList * declList = MkListOne(MkDeclaration(
                              (specs = MkListOne(MkSpecifierName("Instance"))),
                              MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")),
                                 MkInitializerAssignment(CopyExpression(memberExp.member.exp))))));
                     OldList * stmtList = MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(
                              MkExpIdentifier(MkIdentifier("__internal_ClassInst")),
                              MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_vTbl"))),
                              MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl"))))));

                     vTblExp = MkExpExtensionCompound(MkCompoundStmt(declList, stmtList));

                     if(type.specConst)
                        specs->Insert(null, MkSpecifier(CONST));

                     vTblExp.loc = exp.loc;
                     vTblExp.compound.compound.context = context;
                     PopContext(context);

                     expCallExp = MkExpBrackets(MkListOne(MkExpCast(typeName,
                        MkExpIndex(vTblExp, MkListOne(MkExpIdentifier(MkIdentifier(name)))))));

                     handleNullVMethod = true;
                  }
               }
            }
            else
            {
               char name[1024];
               strcpy(name, "__ecereMethod_");
               FullClassNameCat(name, method._class.fullName, false);
               strcat(name, "_");
               strcat(name, method.name);

               if(!memberExp)
                  FreeExpression(expCallExp);
               expCallExp = MkExpIdentifier(MkIdentifier(name));
               DeclareMethod(curExternal, method, name);
               if(memberExp && memberExp.expType && method.dataType)
               {
                  expCallExp.expType = method.dataType;
                  method.dataType.refCount++;
               }
            }
            if(memberExp && (!memberExp.member.exp || !memberExp.member.exp.expType || memberExp.member.exp.expType.kind != subClassType))
            {
               if(method.dataType && !method.dataType.staticMethod && !method.dataType.extraParam)
               {
                  if(!arguments)
                     arguments = MkList();

                  // Testing this (COMMENTED OUT TESTING, CALLING METHODS ON ENUM/UNIT ADDED & IN FRONT OF VARIABLES
                  /*
                  if(memberExp.member.exp.expType.kind != classType ||
                     memberExp.member.exp.expType._class.registered.type == enumClass ||
                     memberExp.member.exp.expType._class.registered.type == unitClass)
                  {
                     char typeString[1024] = "";
                     if(memberExp.member.exp.expType.kind != classType)
                        PrintType(memberExp.member.exp.expType, typeString, false, true);
                     else
                        strcpy(typeString, memberExp.member.exp.expType._class.registered.dataTypeString);

                     // THIS WAS NASTY:
                     // memberExp.member.exp.expType.kind = classType;
                     // memberExp.member.exp.expType._class = FindClass(typeString);

                     FreeType(memberExp.member.exp.expType);
                     memberExp.member.exp.expType = Type
                     {
                        kind = classType;
                        _class = FindClass(typeString);
                        refCount = 1;
                     };

                     // Default to an int instead
                     if(!memberExp.member.exp.expType._class)
                     {
                        // TODO: Shouldn't get here...
                        memberExp.member.exp.expType.kind = TypeInt;
                     }
                  }
                  */

                  if(typedObject && memberExp.member.exp && memberExp.member.exp.expType)
                  {
                     bool changeReference = false;
                     bool stillAddReferenceOp = false;
                     Expression memberExpMemberExp = CopyExpression(memberExp.member.exp);
                     Type expType = memberExp.member.exp.expType;
                     Class c = expType.kind == classType && expType._class ? expType._class.registered : null;

                     // Patched so that class isn't considered SYSTEM...
                     if(argClass && (argClass.type == enumClass || argClass.type == unitClass || argClass.type == bitClass || argClass.type == systemClass) && strcmp(argClass.fullName, "class") &&
                        strcmp(argClass.fullName, "uintptr") && strcmp(argClass.fullName, "intptr"))
                        changeReference = true;
                     if(!expType.classObjectType && ( ( (expType.kind != pointerType && (!c || c.type == structClass) ) ) || method.dataType.byReference) ) // ADDED THIS FOR OnGetDataFromString
                     {
                        if(c && (c.type == normalClass || c.type == noHeadClass))
                           stillAddReferenceOp = true;
                        changeReference = true;
                     }
                     if(typedObject && expType.classObjectType && expType.byReference != method.dataType.byReference)
                        changeReference = true;
                     if(changeReference)
                     {
                        if(memberExp.member.exp.type == bracketsExp && memberExp.member.exp.list && memberExp.member.exp.list->count == 1 &&
                           ((Expression)memberExp.member.exp.list->first).type == opExp && ((Expression)memberExp.member.exp.list->first).op.op == '*' && !((Expression)memberExp.member.exp.list->first).op.exp1)
                        {
                           arguments->Insert(null, ((Expression)memberExp.member.exp.list->first).op.exp2);
                           ((Expression)memberExp.member.exp.list->first).op.exp2 = null;
                        }
                        else if(memberExp.member.exp.type == opExp && memberExp.member.exp.op.op == '*' && !memberExp.member.exp.op.exp1)
                        {
                           arguments->Insert(null, memberExp.member.exp.op.exp2);
                           memberExp.member.exp.op.exp2 = null;
                        }
                        else if(!memberExp.member.exp.byReference || stillAddReferenceOp)
                        {
                           // TESTING THIS... REUSE THIS CODE?
                           Expression checkedExp = memberExp.member.exp;
                           Expression parentExp = null;
                           Expression newExp;
                           bool disconnected = false;
                           while(((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp) && checkedExp.list) || checkedExp.type == castExp)
                           {
                              parentExp = checkedExp;

                              if(checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp)
                              {
                                 checkedExp = checkedExp.list->last;
                                 // Dissociate from memberExp which will get freed
                                 if(checkedExp && !disconnected)
                                 {
                                    parentExp.list->Remove(checkedExp);
                                    disconnected = true;
                                 }
                              }
                              else if(checkedExp.type == castExp)
                              {
                                 checkedExp = checkedExp.cast.exp;
                                 // Dissociate from memberExp which will get freed
                                 if(checkedExp && !disconnected)
                                 {
                                    checkedExp.cast.exp = null;
                                    disconnected = true;
                                 }
                              }
                           }
                           if(!parentExp)
                              nullMemberExp = true;

                           if(typedObject && !expType.classObjectType && !stillAddReferenceOp)
                              newExp = checkedExp;
                           else
                           {
                              newExp = MkExpOp(null, '&', checkedExp);
                              newExp.byReference = true;
                           }
                           if(parentExp && (parentExp.type == bracketsExp || parentExp.type == extensionExpressionExp))
                           {
                              parentExp.list->Remove(checkedExp);
                              parentExp.list->Add(newExp);
                           }
                           else if(parentExp && parentExp.type == castExp)
                           {
                              parentExp.cast.exp = newExp;
                              // Add a dereference level here
                              if(newExp.expType && newExp.expType.classObjectType)
                                 parentExp.cast.typeName.declarator = MkDeclaratorPointer(MkPointer(null, null), parentExp.cast.typeName.declarator);
                           }
                           if(typedObject && !expType.classObjectType)
                           {
                              Type destType { refCount = 1, kind = classType, classObjectType = ClassObjectType::anyObject };
                              FreeType((parentExp ? parentExp : newExp).expType);
                              FreeType((parentExp ? parentExp : newExp).destType);
                              (parentExp ? parentExp : newExp).expType = checkedExp.expType;
                              (parentExp ? parentExp : newExp).destType = destType;
                              if(checkedExp.expType) checkedExp.expType.refCount++;
                           }
                           arguments->Insert(null, parentExp ? parentExp : newExp);
                        }
                        else
                        {
                           arguments->Insert(null, memberExp.member.exp);
                           nullMemberExp = true;
                        }
                     }
                     else
                     {
                        arguments->Insert(null, memberExp.member.exp);
                        nullMemberExp = true;
                     }

                     {
                        char className[1024];
                        Type type = memberExp.member.exp ? memberExp.member.exp.expType : null;
                        Class regClass = (type && type.kind == classType && type._class) ? type._class.registered : null;
                        Class cl = argClass ? argClass : regClass;
                        className[0] = 0;

                        if(memberExp.member.exp && memberExp.member.exp.expType && memberExp.member.exp.expType.classObjectType == ClassObjectType::typedObject)
                           strcpy(className, "class");
                        else if(cl)
                        {
                           // Need the class itself here...
                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, cl.fullName, true);

                           if(!cl.symbol)
                              cl.symbol = FindClass(cl.fullName);
                           DeclareClass(curExternal, cl.symbol, className);
                        }

                        if(className[0])
                        {
                           if(memberExp && cl && cl.type == normalClass && (!type || type.byReference == false) && strcmp(cl.dataTypeString, "char *"))
                           {
                              // ({ Instance __internal_ClassInst = e; __internal_ClassInst ? __internal_ClassInst._class : __ecereClass_...; })
                              Expression c;
                              Context context = PushContext();
                              OldList * specs;

                              c = MkExpExtensionCompound(MkCompoundStmt(
                                    MkListOne(MkDeclaration(
                                       (specs = MkListOne(MkSpecifierName("Instance"))),
                                       MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")),
                                          MkInitializerAssignment(memberExpMemberExp))))),
                                    MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(
                                       MkExpIdentifier(MkIdentifier("__internal_ClassInst")),
                                       MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_class"))),
                                       MkExpIdentifier(MkIdentifier(className))))))));
                              c.compound.compound.context = context;
                              PopContext(context);

                              if(type.specConst)
                                 specs->Insert(null, MkSpecifier(CONST));

                              arguments->Insert(null, c);

                              memberExpMemberExp = null; // We used this
                           }
                           else
                              arguments->Insert(null, MkExpIdentifier(MkIdentifier(className)));
                        }
                     }

                     if(memberExpMemberExp)
                        FreeExpression(memberExpMemberExp);
                  }
                  else
                  {
                     arguments->Insert(null, memberExp.member.exp);
                     nullMemberExp = true;
                  }
               }
            }
            /*else if(method->dataType)
            {
            }*/
            if(memberExp)
            {
               if(nullMemberExp)
                  memberExp.member.exp = null;
               FreeExpression(memberExp);
            }
         }

         if(arguments)
         {
            for(e = arguments->first; e; e = e.next)
            {
               Type destType = (e.destType && e.destType.kind == ellipsisType) ? ellipsisDestType : e.destType;
               //if(e.destType && e.destType.kind == classType && e.destType._class && !strcmp(e.destType._class.string, "class"))
               //if(e.destType && (e.destType.classObjectType == ClassObjectType::typedObject || e.destType.classObjectType == anyObject))
               if(destType && (destType.classObjectType == ClassObjectType::typedObject || destType.classObjectType == anyObject))
               {
                  if(e.destType && e.destType.kind == ellipsisType) usedEllipsis = true;
                  ellipsisDestType = destType;
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
                     else if((type.kind == arrayType || type.kind == pointerType) && type.type && type.type.kind == charType)
                     {
                        _class = FindClass("char *").registered;
                     }
                     else if(type.kind == pointerType)
                     {
                        _class = eSystem_FindClass(privateModule, "uintptr");
                        FreeType(e.expType);
                        e.expType = ProcessTypeString("uintptr", false);
                        // Assume null pointers means 'no object' rather than an object holding a null pointer
                        e.byReference = true;
                     }
                     else
                     {
                        char string[1024] = "";
                        Symbol classSym;
                        PrintTypeNoConst(type, string, false, true);
                        classSym = FindClass(string);
                        if(classSym) _class = classSym.registered;
                        // if(!class) _class = eSystem_FindClass(privateModule, "int");
                     }

                     if((_class && (_class.type == enumClass || _class.type == unitClass || _class.type == bitClass || _class.type == systemClass) && strcmp(_class.fullName, "class") && strcmp(_class.fullName, "uintptr") && strcmp(_class.fullName, "intptr")) || // Patched so that class isn't considered SYSTEM...
                        (!e.expType.classObjectType && (((type.kind != pointerType && type.kind != intPtrType && type.kind != subClassType && type.kind != arrayType && (type.kind != classType || !type._class || !type._class.registered || type._class.registered.type == structClass))) ||
                        destType.byReference)))
                     {
                        //if(!_class || strcmp(_class.fullName, "String"))     // TESTING THIS WITH NEW String class...
                        //if(!_class || strcmp(_class.fullName, "char *"))     // TESTING THIS WITH NEW String class...
                        // TESTING WITHOUT THE ABOVE NOW!
                        {
                           Expression checkedExp;
                           Expression parentExp;
                           Expression newExp;

                           checkedExp = e;
                           parentExp = exp;
                           while(checkedExp && (((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp) && checkedExp.list) || checkedExp.type == castExp))
                           {
                              parentExp = checkedExp;
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
                              /*
                              Expression newExp = e.op.exp2;
                              arguments->Insert(e.prev, newExp);
                              arguments->Remove(e);
                              e.op.exp2 = null;
                              FreeExpContents(e);
                              e = newExp;
                              */
                              newExp = checkedExp.op.exp2;
                              checkedExp.op.exp2 = null;
                              FreeExpContents(checkedExp);

                              if(e.expType && e.expType.passAsTemplate)
                              {
                                 char size[100];
                                 ComputeTypeSize(e.expType);
                                 sprintf(size, "%d", e.expType.size);   // BOOTSTRAP FIX
                                 newExp = MkExpBrackets(MkListOne(MkExpOp(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)),
                                    MkDeclaratorPointer(MkPointer(null, null), null)), newExp), '+',
                                       MkExpCall(MkExpIdentifier(MkIdentifier("__ENDIAN_PAD")), MkListOne(MkExpConstant(size))))));
                              }

                              if(parentExp.type == callExp)
                              {
                                 arguments->Insert(e.prev, newExp);
                                 arguments->Remove(e);
                                 e = newExp;
                              }
                              else if(parentExp.type == bracketsExp || parentExp.type == extensionExpressionExp)
                              {
                                 parentExp.list->Remove(checkedExp);
                                 parentExp.list->Add(newExp);
                              }
                              else if(parentExp.type == castExp)
                              {
                                 // NEW CODE: BETTER WAY TO DO THIS? To prevent (double)(double *)
                                 if(parentExp.destType && parentExp.destType.kind == ellipsisType)
                                 {
                                    FreeTypeName(parentExp.cast.typeName);
                                    parentExp.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null,null), null));
                                 }
                                 parentExp.cast.exp = newExp;
                              }
                              else if(parentExp.type == extensionCompoundExp)
                              {
                                 ((Statement)parentExp.compound.compound.statements->last).expressions->Remove(checkedExp);
                                 ((Statement)parentExp.compound.compound.statements->last).expressions->Add(newExp);
                              }
                              e.byReference = true;

                              FreeType(checkedExp.expType);
                              FreeType(checkedExp.destType);
                              delete checkedExp;
                           }
                           else if((!e.byReference && (!e.expType || !e.expType.classObjectType) ) || (_class && _class.type == noHeadClass))     // TESTING THIS HERE...
                           {
                              Expression checkedExp;
                              Expression parentExp;
                              Expression newExp;

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

                                    // TOCHECK: Should this read e.destType ???

                                    if(exp.destType) exp.destType.refCount++;
                                    // if(exp.expType) exp.expType.refCount++;
                                    newExp.prev = null;
                                    newExp.next = null;
                                    newExp.expType = null;

                                    PrintTypeNoConst(e.expType, typeString, false, true);
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
                                       MkListOne(MkDeclaration(specs, MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internalValue")), MkInitializerAssignment(newExp))))),
                                       MkListOne(MkExpressionStmt(MkListOne(MkExpIdentifier(MkIdentifier("__internalValue"))))));
                                    */

                                    e.compound.compound.context = context;
                                    PopContext(context);
                                    curContext = context.parent;
                                 }
                              }

                              // TODO: INTEGRATE THIS WITH VERSION ABOVE WHICH WAS ADDED TO ENCOMPASS OTHER CASE (*pointer)
                              checkedExp = e;
                              parentExp = exp;
                              while(checkedExp && (((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp || checkedExp.type == extensionCompoundExp) && checkedExp.list) || checkedExp.type == castExp))
                              {
                                 parentExp = checkedExp;
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
                                 Expression i;
                                 newExp = MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null), null)), (i = MkExpOp(null, '&', checkedExp)));
                                 i.byReference = true;
                                 newExp.byReference = true;
                              }
                              if(parentExp.type == callExp)
                              {
                                 arguments->Insert(e.prev, newExp);
                                 arguments->Remove(e);
                                 e = newExp;
                              }
                              else if(parentExp.type == bracketsExp || parentExp.type == extensionExpressionExp)
                              {
                                 parentExp.list->Remove(checkedExp);
                                 parentExp.list->Add(newExp);
                              }
                              else if(parentExp.type == castExp)
                                 parentExp.cast.exp = newExp;
                              else if(parentExp.type == bracketsExp || parentExp.type == extensionCompoundExp)
                              {
                                 ((Statement)parentExp.compound.compound.statements->last).expressions->Remove(checkedExp);
                                 ((Statement)parentExp.compound.compound.statements->last).expressions->Add(newExp);
                              }
                           }
                        }
                     }

                     if(destType.classObjectType == ClassObjectType::typedObject)
                     {
                        char className[1024];
                        // Need the class itself here...
                        if(!_class && type.kind == pointerType && type.type && type.type.kind == charType)
                           _class = eSystem_FindClass(privateModule, "String");
                        if(!_class) _class = eSystem_FindClass(privateModule, "int");

                        if(!strcmp(_class.name, "class"))
                        {
                           // Already inside a typed_object function, pass the class through
                           strcpy(className, "class");
                        }
                        else
                        {
                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, _class.fullName, true);

                           if(!_class.symbol)
                              _class.symbol = FindClass(_class.fullName);

                           DeclareClass(curExternal, _class.symbol, className);
                        }

                        if(_class.type == normalClass && destType.byReference == false && strcmp(_class.dataTypeString, "char *"))
                        {
                           // ({ Instance __internal_ClassInst = e; __internal_ClassInst ? __internal_ClassInst._class : __ecereClass_...; })
                           Expression c;
                           Context context = PushContext();

                           // Work around to avoid repeating the BuiltInContainer just to get the type
                           // (a bit messy since we already transformed our expression to an extensionInitializerExp in earlier pass)
                           if(_class.templateClass && !strcmp(_class.templateClass.name, "Container") &&
                              e.list && e.list->first &&
                              ((Expression)e.list->first).type == castExp &&
                              ((Expression)e.list->first).cast.exp &&
                              ((Expression)e.list->first).cast.exp.type == opExp &&
                              ((Expression)e.list->first).cast.exp.op.op == '&' &&
                              ((Expression)e.list->first).cast.exp.op.exp2 &&
                              ((Expression)e.list->first).cast.exp.op.exp2.type == extensionInitializerExp)
                           {
                              arguments->Insert(e.prev, MkExpIdentifier(MkIdentifier(className)));
                           }
                           else
                           {
                              OldList * specs;
                              c = MkExpExtensionCompound(MkCompoundStmt(
                                    MkListOne(MkDeclaration(
                                       (specs = MkListOne(MkSpecifierName("Instance"))),
                                       MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier("__internal_ClassInst")),
                                          MkInitializerAssignment(CopyExpression(e)))))),
                                    MkListOne(MkExpressionStmt(MkListOne(MkExpCondition(
                                       MkExpIdentifier(MkIdentifier("__internal_ClassInst")),
                                       MkListOne(MkExpPointer(MkExpIdentifier(MkIdentifier("__internal_ClassInst")), MkIdentifier("_class"))),
                                       MkExpIdentifier(MkIdentifier(className))))))));
                              c.compound.compound.context = context;
                              PopContext(context);

                              if(type.specConst)
                                 specs->Insert(null, MkSpecifier(CONST));

                              arguments->Insert(e.prev, c);
                           }
                        }
                        else
                           arguments->Insert(e.prev, MkExpIdentifier(MkIdentifier(className)));
                     }
                  }
               }
               {
#ifdef _DEBUG
                  //char debugString[4096] = "";
                  //PrintExpression(e, debugString);
#endif
                  // If expression type is a simple class, make it an address
                  FixReference(e, !destType || !destType.declaredWithStruct);
               }
            }
            if(ellipsisDestType)
            {
               if(usedEllipsis ||
                  (expCallExp.expType && expCallExp.expType.kind == functionType && expCallExp.expType.params.last &&
                   ((Type)expCallExp.expType.params.last).kind == ellipsisType))
               {
                  arguments->Insert(arguments->last, MkExpCast(MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, null),null)),MkExpConstant("0")));
               }
            }
         }

         if(handleNullVMethod)
         {
            Expression compoundExp;
            Context context = PushContext();
            OldList * declList = MkList();
            OldList * stmtList = MkList();
            TypeName castTypeName;
            OldList * specs = MkList();
            Specifier spec;

            for(spec = typeName.qualifiers ? typeName.qualifiers->first : null; spec; spec = spec.next)
            {
               if(spec.type != extendedSpecifier)
                  specs->Add(CopySpecifier(spec));
            }

            if(typeName.declarator.type == pointerDeclarator)
            {
               Pointer p = typeName.declarator.pointer.pointer.pointer;
               castTypeName = MkTypeName(specs, CopyDeclarator(typeName.declarator.declarator.declarator.declarator));
               while(p)
               {
                  Pointer pp;
                  for(pp = castTypeName.declarator.pointer.pointer; pp.pointer; pp = pp.pointer);
                  pp.pointer = MkPointer(null, null);
                  pp.qualifiers = CopyList(p.qualifiers, CopySpecifier);
                  p = p.pointer;
               }
            }
            else
               castTypeName = MkTypeName(specs, CopyDeclarator(typeName.declarator.declarator.declarator.declarator));

            compoundExp = MkExpExtensionCompound(MkCompoundStmt(declList, stmtList));

            declList->Add(MkDeclaration(CopyList(typeName.qualifiers, CopySpecifier),
               MkListOne(MkInitDeclarator(PlugDeclarator(CopyDeclarator(typeName.declarator), MkDeclaratorIdentifier(MkIdentifier("__internal_VirtualMethod"))), null))));

            stmtList->Add(MkExpressionStmt(MkListOne(MkExpOp(MkExpIdentifier(MkIdentifier("__internal_VirtualMethod")), '=', expCallExp))));
            stmtList->Add(MkExpressionStmt(MkListOne(MkExpCondition(
               MkExpIdentifier(MkIdentifier("__internal_VirtualMethod")),
               MkListOne(MkExpCall(MkExpIdentifier(MkIdentifier("__internal_VirtualMethod")), arguments)), MkExpCast(castTypeName, MkExpConstant("1"))))));

            compoundExp.loc = exp.loc;
            compoundExp.compound.compound.context = context;
            PopContext(context);

            exp.type = bracketsExp;
            exp.list = MkListOne(compoundExp);
         }
         else
         {
            exp.call.exp = expCallExp;
            exp.call.arguments = arguments;
         }
         break;
      }
      case memberExp:
      {
         bool changeToPtr = false;
         bool noHead = false;
         Type type = exp.member.exp ? exp.member.exp.expType : null;
         Specifier memberClassSpecifier = exp.member.member ? exp.member.member._class : null;
         if(exp.member.member) exp.member.member._class = null;

         if(type && type.kind == templateType)
         {
            Type baseType = ProcessTemplateParameterType(type.templateParameter);
            if(baseType) type = baseType;
         }
         if(type && exp.member.member && !type.directClassAccess)
         {
            Class _class = exp.member.member.classSym ? exp.member.member.classSym.registered : (((type.kind == classType || type.kind == subClassType) && type._class) ? type._class.registered : null);
            Property prop = null;
            ClassProperty classProperty = null;
            Method method = null;
            Class convertTo = null;
            DataMember member = null;
            DataMember subMemberStack[256];
            int subMemberStackPos = 0;
            bool thisPtr = exp.member.thisPtr;
            if(type.kind == subClassType && exp.member.exp.type == classExp)
               _class = eSystem_FindClass(privateModule, "ecere::com::Class");

            // TEST: exp.member.exp.tempCount = Max(exp.tempCount, exp.member.exp.tempCount);

            if(!_class)
            {
               // DANGER: Buffer overflow
               char string[2048] = "";
               Symbol classSym;
               PrintTypeNoConst(type, string, false, true);
               classSym = FindClass(string);
               _class = classSym ? classSym.registered : null;
            }

            if(_class && exp.member.memberType == dataMember)
            {
               if(!thisPtr && !exp.member.member.classSym)
                  member = eClass_FindDataMember(_class, exp.member.member.string, null, subMemberStack, &subMemberStackPos);
               if(!member)
                  member = eClass_FindDataMember(_class, exp.member.member.string, privateModule, subMemberStack, &subMemberStackPos);
            }
            else if(_class && exp.member.memberType == propertyMember)
            {
               if(!thisPtr && !exp.member.member.classSym)
                  prop = eClass_FindProperty(_class, exp.member.member.string, null);
               if(!prop)
                  prop = eClass_FindProperty(_class, exp.member.member.string, privateModule);
               if(prop && (exp.usage.usageRef ||
                  (exp.usage.usageGet && !prop.Get && !prop.conversion) ||
                  (exp.usage.usageDelete && !prop.Set && !prop.conversion)))
               {
                  member = eClass_FindDataMember(_class, exp.member.member.string, privateModule, subMemberStack, &subMemberStackPos);
                  if(member)
                  {
                     exp.member.memberType = dataMember;
                     prop = null;
                  }
                  else
                  {
                     if(exp.usage.usageRef)
                        Compiler_Error($"cannot obtain address of property\n");
                     else if(!prop.Get)
                        Compiler_Error($"no get defined for property %s of class %s\n", prop.name, prop._class.fullName);
                     else if(exp.usage.usageDelete)
                        Compiler_Error($"no get defined for property %s of class %s\n", prop.name, prop._class.fullName);
                  }
               }
            }
            else if(_class && exp.member.memberType == methodMember)
            {
               if(!thisPtr)
                  method = eClass_FindMethod(_class, exp.member.member.string, null);
               if(!method)
                  method = eClass_FindMethod(_class, exp.member.member.string, privateModule);
            }
            else if(_class && exp.member.memberType == reverseConversionMember)
            {
               convertTo = _class;
               _class = FindClass(exp.member.member.string).registered;
               // prop = eClass_FindProperty(_class, convertTo.name, privateModule);
               prop = eClass_FindProperty(_class, convertTo.fullName, privateModule);
            }
            else if(_class && exp.member.memberType == classPropertyMember)
            {
               classProperty = eClass_FindClassProperty(_class, exp.member.member.string);
            }
            if(prop)
            {
               // Only process Gets here, Set is processed in opExp's '='
               if(exp.usage.usageGet)
               {
                  if(prop.Get)
                  {
                     char getName[1024], setName[1024];
                     Expression ptr = exp.member.exp;
                     Class propertyClass;
                     char * nameToUse = convertTo ? setName : getName;

                     FreeIdentifier(exp.member.member);

                     // Process this here since it won't be processed at the end...
                     exp.member.exp.usage.usageGet = true;
                     ProcessExpression(exp.member.exp);
                     // TEST: exp.tempCount = exp.member.exp.tempCount;

                     DeclareProperty(curExternal, prop, setName, getName);
                     //propertyClass = convertTo ? _class : ((Symbol)prop.symbol)._class;
                     propertyClass = convertTo ? _class :
                        ((((Symbol)prop.symbol).type && ((Symbol)prop.symbol).type.kind == classType) ? ((Symbol)prop.symbol).type._class.registered : ((Symbol)prop.symbol)._class);

                     if(propertyClass && propertyClass.type == bitClass)
                     {
                        // Bit classes shouldn't have properties except for conversions...
                        OldList * args = MkList();
                        if(exp.usage.usageDeepGet)
                        {
                           char className[1024];
                           Declaration decl;
                           Declarator declarator;
                           OldList * specs = MkList(), * decls = MkList();
                           Expression tempExp;

                           // Make a declaration in the closest compound statement
                           // (Do not reuse (since using address for function calls)...)
                           sprintf(className, "__simpleStruct%d", curContext.simpleID++);
                           declarator =
                              SpecDeclFromString(propertyClass.dataTypeString, specs,
                                 MkDeclaratorIdentifier(MkIdentifier(className)));

                           ListAdd(decls, MkInitDeclarator(declarator, null));

                           decl = MkDeclaration(specs, decls);
                           if(!curCompound.compound.declarations)
                              curCompound.compound.declarations = MkList();
                           curCompound.compound.declarations->Insert(null, decl);

                           tempExp = QMkExpId(className);
                           tempExp.expType = MkClassType(propertyClass.fullName);

                           exp.op.exp1 = tempExp;
                           exp.op.exp2 = MkExpCall(QMkExpId(nameToUse), args);
                           exp.op.op = '=';
                           exp.type = opExp;
                        }
                        else
                        {
                           exp.type = callExp;
                           exp.call.exp = QMkExpId(nameToUse);
                           exp.call.arguments = args;
                        }
                        ListAdd(args, FixReference(ptr, true));
                     }
                     else if(propertyClass && propertyClass.type == unitClass)
                     {
                        OldList * args = MkList();
                        ListAdd(args, FixReference(ptr, true));
                        exp.type = callExp;
                        exp.call.exp = QMkExpId(nameToUse);
                        exp.call.arguments = args;
                     }
                     else if(propertyClass && propertyClass.type == structClass)
                     {
                        OldList * args = MkList();
                        char className[1024];
                        Declaration decl;
                        OldList * specs = MkList(), * decls = MkList();
                        Expression tempExp;

                        // Make a declaration in the closest compound statement
                        // (Do not reuse (since using address for function calls)...)

                        className[0] = 0;
                        FullClassNameCat(className, propertyClass.fullName, false); //true);
                        DeclareStruct(curExternal, propertyClass.fullName, false, true);

                        //ListAdd(specs, MkSpecifierName(className));
                        ListAdd(specs, MkStructOrUnion(structSpecifier, MkIdentifier(className), null));

                        sprintf(className, "__simpleStruct%d", curContext.simpleID++);

                        ListAdd(decls, MkInitDeclarator(
                           MkDeclaratorIdentifier(MkIdentifier(className)), null));

                        decl = MkDeclaration(specs, decls);
                        if(curCompound)
                        {
                           if(!curCompound.compound.declarations)
                              curCompound.compound.declarations = MkList();
                           curCompound.compound.declarations->Insert(null, decl);
                        }

                        tempExp = QMkExpId(className);
                        tempExp.expType = MkClassType(propertyClass.fullName);

                        if(convertTo)
                        {
                           ListAdd(args, FixReference(CopyExpression(tempExp), true));
                           ListAdd(args, FixReference(ptr, true));
                        }
                        else
                        {
                           ListAdd(args, FixReference(ptr, true));
                           ListAdd(args, FixReference(CopyExpression(tempExp), true));
                        }

                        if(exp.usage.usageDeepGet)
                        {
                           exp.type = callExp;
                           exp.call.exp = QMkExpId(nameToUse);
                           exp.call.arguments = args;

                           FreeExpression(tempExp);
                        }
                        else
                        {
                           exp.type = bracketsExp;
                           exp.list = MkList();
                           ListAdd(exp.list, MkExpCall(QMkExpId(nameToUse),args));
                           if(exp.usage.usageMember)
                           {
                              ListAdd(exp.list, FixReference(tempExp, true));
                              exp.byReference = true;
                           }
                           else
                              ListAdd(exp.list, tempExp);
                        }
                     }
                     else
                     {
                        exp.type = callExp;
                        exp.call.exp = QMkExpId(nameToUse);
                        exp.call.arguments = MkList();
                        ListAdd(exp.call.arguments, FixReference(ptr, true));
                     }
                  }
                  else if(prop.conversion)
                  {
                     void * prev = exp.prev, * next = exp.next;
                     *exp = *exp.member.exp;
                     exp.prev = prev;
                     exp.next = next;
                  }
               }
            }
            else if(classProperty)
            {
               // Only process Gets here, Set is processed in opExp's '='
               if(exp.usage.usageGet)
               {
                  if(classProperty.Get)
                  {
                     Identifier id = exp.member.member;
                     Expression classExp = exp.member.exp;
                     OldList * args = MkList();

                     exp.type = castExp;
                     // Class Property
                     if(exp.expType)
                     {
                        char typeString[2048];
                        OldList * specs = MkList();
                        Declarator decl;
                        typeString[0] = 0;
                        PrintType(exp.expType, typeString, false, false);
                        decl = SpecDeclFromString(typeString, specs, null);
                        exp.cast.typeName = MkTypeName(specs, decl);
                     }
                     else
                        exp.cast.typeName = QMkType("uint64", null);
                     exp.cast.exp = MkExpCall(MkExpIdentifier(MkIdentifier("ecere::com::eClass_GetProperty")), args);
                     if(exp.expType.isPointerType)
                        exp.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), exp.cast.exp);

                     ListAdd(args, classExp);
                     {
                        char * s = QMkString(id.string);
                        ListAdd(args, MkExpString(s));
                        delete s;
                     }
                     FreeIdentifier(id);

                     ProcessExpression(exp);
                     return;
                  }
               }
            }
            else if(method)
            {
               // Get the function address if it's not called
               if((exp.usage.usageGet || exp.member.exp.expType.kind == subClassType) && !(exp.usage.usageCall))
               {
                  char name[1024];

                  FreeIdentifier(exp.member.member);

                  // Process this here since it won't be processed at the end...
                  exp.member.exp.usage.usageGet = true;
                  ProcessExpression(exp.member.exp);
                  // TEST: exp.tempCount = exp.member.exp.tempCount;

                  if(method.type == virtualMethod)
                  {
                     strcpy(name, "__ecereVMethodID_");
                     FullClassNameCat(name, method._class.fullName, false);
                     strcat(name, "_");
                     strcat(name, method.name);
                     exp.type = indexExp;
                     if(memberClassSpecifier)
                     {
                        char className[1024];
                        // Need the class itself here...
                        strcpy(className, "__ecereClass_");
                        FullClassNameCat(className, _class.fullName, true);

                        if(!_class.symbol)
                           _class.symbol = FindClass(_class.fullName);
                        DeclareClass(curExternal, _class.symbol, className);

                        FreeExpression(exp.member.exp);
                        exp.index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier(className)), MkIdentifier("_vTbl"));
                     }
                     else
                     {
                        if(exp.thisPtr && _class.type != normalClass)
                        {
                           FreeExpression(exp.member.exp);
                           exp.index.exp = MkExpPointer(MkExpIdentifier(MkIdentifier("class")), MkIdentifier("_vTbl"));
                        }
                        else
                           exp.index.exp = MkExpPointer(exp.member.exp, MkIdentifier("_vTbl"));
                     }
                     exp.index.index = MkListOne(QMkExpId(name));
                     DeclareMethod(curExternal, method, name);
                  }
                  else
                  {
                     FreeExpression(exp.member.exp);
                     exp.type = identifierExp;
                     strcpy(name, "__ecereMethod_");
                     FullClassNameCat(name, method._class.fullName, false);
                     strcat(name, "_");
                     strcat(name, method.name);
                     exp.identifier = MkIdentifier(name);
                     DeclareMethod(curExternal, method, name);
                  }
               }
            }
            else if(member)
            {
               if(subMemberStackPos)
               {
                  int i;
                  DataMember parentMember = null;
                  String s, prefix = null;
                  for(i = 0; i < subMemberStackPos; i++)
                  {
                     DataMember curMember = subMemberStack[i];
                     DataMember m;
                     int anonID = 1;
                     for(m = parentMember ? parentMember.members.first : _class.membersAndProperties.first; m; m = m.next)
                     {
                        if(m && !m.isProperty && (m.type == unionMember || m.type == structMember) && !m.name)
                        {
                           if(m == curMember)
                              break;
                           anonID++;
                        }
                     }

                     if(prefix)
                     {
                        s = prefix;
                        prefix = PrintString(prefix, ".__anon", anonID);
                        delete s;
                     }
                     else
                        prefix = PrintString("__anon", anonID);
                     parentMember = curMember;
                  }

                  s = exp.member.member.string;
                  exp.member.member.string = PrintString(prefix, ".", s);
                  delete prefix;
                  delete s;
               }
               // Process this here since it won't be processed at the end...
               if(exp.usage.usageGet)
               {
                  exp.member.exp.usage.usageGet = true;   // Recently added this... is it ok?
               }
               ProcessExpression(exp.member.exp);
               // TEST: exp.tempCount = exp.member.exp.tempCount;

               if(type.kind == classType && type._class && type._class.registered)
                  DeclareStruct(curExternal, type._class.registered.fullName, false, true);

               // TESTING THIS NOHEAD STUFF...
               if(_class.type == noHeadClass)
               {
                  noHead = true;
               }
               else if(_class.type == structClass)
               {
                  changeToPtr = true;
               }
               else if(_class.type == bitClass)
               {
                  OldList * list = MkList();
                  char mask[32], shift[10];
                  OldList * specs = MkList();
                  BitMember bitMember = (BitMember) member;
                  Declarator decl = SpecDeclFromString(bitMember.dataTypeString, specs, null);
                  TypeName type = MkTypeName(specs, decl);
                  if(bitMember.mask > MAXDWORD)
                     sprintf(mask, FORMAT64HEXLL, bitMember.mask);
                  else
                     sprintf(mask, FORMAT64HEX, bitMember.mask);
                  sprintf(shift, "%d", bitMember.pos);

                  FreeIdentifier(exp.member.member);

                  // ((type) ((color & mask) >> bitPos))
                  ListAdd(list, MkExpCast(type, MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(
                     MkExpOp(exp.member.exp, '&', MkExpConstant(mask)))), RIGHT_OP,
                        MkExpConstant(shift))))));

                  exp.type = bracketsExp;
                  exp.list = list;
               }
               else if(_class.type == unitClass)
               {
               }
               else
               {
                  // If it's a this pointer, replace by precomputed shortcut
                  if(exp.member.exp.type == identifierExp && thisPtr && type.kind == classType && (!exp.member.exp.expType || !exp.member.exp.expType.typedByReference))
                  {
                     char pointerName[1024];

                     strcpy(pointerName, "__ecerePointer_");
                     FullClassNameCat(pointerName, type._class.registered.fullName, false);
                     if(exp.member.exp.identifier)
                        FreeIdentifier(exp.member.exp.identifier);
                     exp.member.exp.identifier = MkIdentifier(pointerName);
                  }
                  // Otherwise, access the data the hard way
                  else
                  {
                     Expression bytePtr, e;
                     Expression checkedExp;
                     char structName[1024];
                     char className[1024];
                     strcpy(className, "__ecereClass_");
                     FullClassNameCat(className, member._class.fullName, true);

                     // classExp = QMkExpId(className);

                     if(!member._class.symbol)
                        member._class.symbol = FindClass(member._class.fullName);

                     DeclareClass(curExternal, member._class.symbol, className);
                     DeclareStruct(curExternal, member._class.fullName, false, true);

                     structName[0] = 0;
                     FullClassNameCat(structName, member._class.fullName, false);

                     checkedExp = exp.member.exp;
                     while(((checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp) && checkedExp.list && checkedExp.list->count == 1) ||
                           checkedExp.type == castExp)
                     {
                        if(checkedExp.type == bracketsExp || checkedExp.type == extensionExpressionExp)
                           checkedExp = checkedExp.list->last;
                        else if(checkedExp.type == castExp)
                           checkedExp = checkedExp.cast.exp;
                     }

                     if(checkedExp.type != identifierExp &&
                        checkedExp.type != constantExp &&      // Added this here... Might mess up if we need address?
                        checkedExp.type != memberExp && checkedExp.type != pointerExp)
                     {
                        char ecereTemp[100];
                        Statement compound;
                        Context context = PushContext();
                        if(exp.member.exp.tempCount > exp.tempCount)
                           exp.tempCount = exp.member.exp.tempCount;

                        exp.tempCount++;
                        curExternal.function.tempCount = Max(curExternal.function.tempCount, exp.tempCount);
                        sprintf(ecereTemp, "__ecTemp%d", exp.tempCount);
                        curContext = context;
                        compound = MkCompoundStmt(
                           MkListOne(MkDeclaration(MkListOne(MkSpecifier(CHAR)), MkListOne(MkInitDeclarator(
                              MkDeclaratorPointer(MkPointer(null, null), MkDeclaratorIdentifier(MkIdentifier(ecereTemp))),
                                 MkInitializerAssignment(MkExpCast(MkTypeName(MkListOne(MkSpecifier(CHAR)), MkDeclaratorPointer(MkPointer(null, null), null)), QBrackets(exp.member.exp))))))), null);
                        if(member._class.fixed)
                        {
                           Class c = member._class.templateClass ? member._class.templateClass : member._class;
                           if(c.offset)
                           {
                              Expression se;

                              if(c.offset == c.base.structSize)
                              {
                                 se = MkExpClassSize(MkSpecifierName(c.base.fullName));
                                 ProcessExpressionType(se);
                                 se.isConstant = false;
                              }
                              else
                              {
                                 char string[256];
                                 sprintf(string, "%d", c.offset);
                                 se = MkExpConstant(string);
                              }
                              e = QBrackets(MkExpOp(QMkExpId(ecereTemp), '+', se));
                           }
                           else
                              e = QMkExpId(ecereTemp);
                        }
                        else
                        {
                           e = QBrackets(MkExpOp(QMkExpId(ecereTemp), '+',
                              MkExpPointer(QMkExpId(className), MkIdentifier("offset"))));
                        }

                        compound.compound.context = context;
                        compound.compound.statements = MkListOne(MkExpressionStmt(MkListOne(
                           QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)),
                              MkDeclaratorPointer(MkPointer(null, null), null)), e)))));

                        exp.member.exp =  MkExpExtensionCompound(compound);

                        PopContext(context);
                        curContext = context.parent;
                     }
                     else
                     {
                        bytePtr = MkExpCast(QMkType("char", QMkPtrDecl(null)), /*CopyExpression(*/exp.member.exp/*)*/);
                        // DISABLED BECAUSE PREVENTS GETTING ADDRESS OF MEMBERS WITH ADDRESS 0
                        /*
                        e = QBrackets(QMkExpCond(exp.member.exp,
                           QBrackets(MkExpOp(bytePtr, '+', MkExpPointer(classExp, MkIdentifier("offset")))),
                           MkExpConstant("0")));
                        */

                        // if(class.fixed)
                        if(member._class.fixed)
                        {
                           Class c = member._class.templateClass ? member._class.templateClass : member._class;
                           if(c.offset)
                           {
                              Expression se;

                              if(c.offset == c.base.structSize)
                              {
                                 se = MkExpClassSize(MkSpecifierName(c.base.fullName));
                                 ProcessExpressionType(se);
                                 se.isConstant = false;
                              }
                              else
                              {
                                 char string[256];
                                 sprintf(string, "%d", c.offset);
                                 se = MkExpConstant(string);
                              }

                              e = QBrackets(QBrackets(MkExpOp(bytePtr, '+', se)));
                           }
                           else
                              e = bytePtr;
                        }
                        else
                           e = QBrackets(QBrackets(MkExpOp(bytePtr, '+', MkExpPointer(QMkExpId(className), MkIdentifier("offset")))));

                        // exp.member.exp = QBrackets(MkExpCast(QMkType(structName, QMkPtrDecl(null)), e));
                        exp.member.exp = QBrackets(MkExpCast(MkTypeName(MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier(structName), null)), QMkPtrDecl(null)), e));
                     }
                  }
                  exp.type = pointerExp;
               }
            }
         }

         // Take Out Any Class Specifier (Should have been used by now)
         FreeSpecifier(memberClassSpecifier);

         // Just moved this at the end... How is it?
         if(exp.member.exp && (exp.type == memberExp || exp.type == pointerExp))
         {
            exp.member.exp.usage.usageGet = true;
            exp.member.exp.usage.usageMember = true;
            exp.member.exp.tempCount = exp.tempCount;
            ProcessExpression(exp.member.exp);
            exp.tempCount = exp.member.exp.tempCount;
            if((changeToPtr && exp.member.exp.byReference) || noHead)
               exp.type = pointerExp;
         }
         break;
      }
      case extensionCompoundExp:
      {
         Expression e = ((Statement)exp.compound.compound.statements->last).expressions->last;
         if(e)
            e.usage |= exp.usage & ExpUsage { usageGet = true, usageArg = true, usageMember = true };

         ProcessStatement(exp.compound);

         /*if(((Expression)((Statement)checkedExp.compound.compound.statements->last).expressions->last).byReference)
            exp.byReference = ((Expression)((Statement)checkedExp.compound.compound.statements->last).expressions->last).byReference;*/
         break;
      }
      case pointerExp:
      {
         exp.member.exp.usage.usageGet = true;
         ProcessExpression(exp.member.exp);
         break;
      }
      case typeSizeExp:
      {
         Specifier spec = exp.typeName.qualifiers ? exp.typeName.qualifiers->first : null;
         if(spec && spec.type == templateTypeSpecifier && !exp.typeName.declarator)
         {
            Expression argExp = GetTemplateArgExp(spec.templateParameter, thisClass, false);
            if(argExp)
            {
               Expression classExp;

               FreeTypeName(exp.typeName);

               classExp = MkExpMember(argExp, MkIdentifier("dataTypeClass"));

               ProcessExpressionType(classExp);
               ProcessExpression(classExp);

               exp.type = bracketsExp;
               exp.list = MkListOne(MkExpMember(classExp, MkIdentifier("typeSize")));

               ProcessExpressionType(exp);
               ProcessExpression(exp);
            }
         }
         break;
      }
      case castExp:
      {
         if(exp.cast.exp)
         {
            exp.cast.exp.usage |= exp.usage & ExpUsage { usageGet = true, usageMember = true };
            ProcessExpression(exp.cast.exp);
            // TESTING THIS
            if(exp.cast.exp.byReference)
               exp.byReference = exp.cast.exp.byReference;
            if(exp.expType && exp.expType.kind == classType && exp.expType._class && exp.expType._class.registered && exp.expType._class.registered.type == structClass &&
               exp.cast.exp.expType && (exp.cast.exp.expType.kind == pointerType || exp.cast.exp.expType.kind == arrayType || (
                  exp.cast.exp.expType.kind == classType && exp.cast.exp.expType._class && exp.cast.exp.expType._class.registered &&
                     !strcmp(exp.cast.exp.expType._class.registered.dataTypeString, "char *")) ) )
               exp.byReference = true;
         }
         // Moved this to 1.5...
         //exp.expType = ProcessType(exp.cast.typeName.qualifiers, exp.cast.typeName.declarator);
         break;
      }
      case conditionExp:
      {
         Expression e;
         if(exp.usage.usageGet)
            exp.cond.cond.usage.usageGet = true;
         ProcessExpression(exp.cond.cond);
         for(e = exp.cond.exp->first; e; e = e.next)
         {
            if(!e.next && exp.usage.usageGet) e.usage.usageGet = true;
            ProcessExpression(e);
         }
         if(exp.usage.usageGet)
            exp.cond.elseExp.usage.usageGet = true;
         ProcessExpression(exp.cond.elseExp);
         break;
      }
      case classExp:
      {
         // Need the class itself here...
         if(exp._classExp.specifiers && exp._classExp.specifiers->first && ((Specifier)exp._classExp.specifiers->first).type == templateTypeSpecifier)
         {
            Specifier spec = exp._classExp.specifiers->first;
            Expression argExp = GetTemplateArgExp(spec.templateParameter, thisClass, true);
            if(argExp)
            {
               FreeList(exp._classExp.specifiers, FreeSpecifier);
               if(exp._classExp.decl)
                  FreeDeclarator(exp._classExp.decl);

               exp.type = memberExp; //pointerExp;
               exp.member.exp = argExp;
               exp.member.member = MkIdentifier("dataTypeClass");
               exp.member.memberType = dataMember;

               ProcessExpressionType(argExp);
               ProcessExpressionType(exp);
               ProcessExpression(exp);
            }
         }
         else
         {
            char className[1024];
            char * string = StringFromSpecDecl(exp._classExp.specifiers, exp._classExp.decl);
            Symbol classSym = FindClass(string);

            strcpy(className, "__ecereClass_");
            FullClassNameCat(className, string, true);      // TODO: Verify this

            DeclareClass(curExternal, classSym, className);
            delete string;

            FreeList(exp._classExp.specifiers, FreeSpecifier);
            if(exp._classExp.decl)
               FreeDeclarator(exp._classExp.decl);

            exp.type = identifierExp;
            exp.identifier = MkIdentifier(className);
         }
         break;
      }
      case vaArgExp:
      {
         ProcessExpression(exp.vaArg.exp);
         break;
      }
      case extensionInitializerExp:
      {
         ProcessInitializer(exp.initializer.initializer);
         break;
      }
   }
   FixRefExp(exp);

   if(exp.needTemplateCast != 2 && (exp.needTemplateCast == 1 || (exp.expType && (exp.expType.kind == templateType || exp.expType.passAsTemplate))))
   {
      Expression nbExp = GetNonBracketsExp(exp);
      Expression inner = GetInnerExp(nbExp);

      if((!exp.expType || exp.expType.kind != templateType || nbExp.type != castExp) && !exp.usage.usageRef &&
         (!exp.destType || (!exp.destType.truth && (exp.destType.kind != templateType || (exp.destType.templateParameter && (exp.destType.templateParameter.dataTypeString || exp.destType.templateParameter.dataType))))) &&
         (exp.usage.usageDelete || exp.usage.usageGet || exp.usage.usageArg) &&
         (!exp.destType || (!exp.destType.passAsTemplate && exp.expType && (exp.expType.kind != pointerType || (exp.destType.kind == pointerType || exp.destType.kind == intPtrType)) && ((exp.destType.kind != pointerType && exp.destType.kind != intPtrType) || exp.expType.kind == pointerType))) &&
         !inner.needCast && inner.type != opExp)
      {
         Expression e = MoveExpContents(exp);
         Declarator decl;
         OldList * specs = MkList();
         char typeString[1024];
         bool castingToDest = false;
         bool pointerCastExp = false;

         typeString[0] = '\0';

         e.needTemplateCast = 2;
         inner.needTemplateCast = 2;
         nbExp.needTemplateCast = 2;
         if(exp.usage.usageDelete)
            strcpy(typeString, "void *");
         else
         {
            if(exp.expType.kind == templateType && exp.expType.templateParameter && exp.expType.templateParameter.dataTypeString)
               strcpy(typeString, exp.expType.templateParameter.dataTypeString);
            else
               PrintType(exp.expType, typeString, false, false);
         }

         decl = SpecDeclFromString(typeString, specs, null);

         if(specs && specs->first && ((Specifier)specs->first).type == templateTypeSpecifier &&
            exp.destType && !exp.destType.passAsTemplate && exp.destType.kind == templateType && exp.destType.templateParameter && (exp.destType.templateParameter.dataTypeString || exp.destType.templateParameter.dataType) && !exp.usage.usageArg)
         {
            if(decl) FreeDeclarator(decl);
            FreeList(specs, FreeSpecifier);
            if(exp.destType.templateParameter.dataTypeString)
            {
               specs = MkList();
               strcpy(typeString, exp.destType.templateParameter.dataTypeString);
               decl = SpecDeclFromString(typeString, specs, null);
            }
            else
            {
               specs = CopyList(exp.destType.templateParameter.dataType.specifiers, CopySpecifier);
               decl = CopyDeclarator(exp.destType.templateParameter.dataType.decl);
            }

            castingToDest = true;
         }

         e.destType = exp.destType;
         if(exp.destType)
            exp.destType.refCount++;

         exp.type = bracketsExp;

         {
            Specifier spec = specs ? specs->first : null;
            TemplateParameter tp = (spec && spec.type == templateTypeSpecifier) ? spec.templateParameter : null;
            Type type = castingToDest ? exp.destType : exp.expType;
            bool specsDeclPointer = (spec.type == nameSpecifier && strcmp(spec.name, "uint64")) ||
               (decl && decl.type == pointerDeclarator) ||
               (tp && tp.dataType &&
                  ( (tp.dataType.decl && tp.dataType.decl.type == pointerDeclarator) ||
                    (tp.dataType.specifiers && ((Specifier)tp.dataType.specifiers->first).type == nameSpecifier && strcmp(((Specifier)tp.dataType.specifiers->first).name, "uint64")) ) );
            pointerCastExp = type ? ((type.kind == templateType && specsDeclPointer) || type.isPointerType) : specsDeclPointer;
         }

         if(pointerCastExp)
         {
            e = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), MkExpBrackets(MkListOne(e)));
            e.needTemplateCast = 2;
         }
         exp.list = MkListOne(MkExpCast(MkTypeName(specs, decl), MkExpBrackets(MkListOne(e))));
         if(exp.destType && pointerCastExp == (exp.destType.passAsTemplate ||
            (!exp.destType.isPointerType || (exp.destType.kind == templateType && (!exp.destType.templateParameter || (!exp.destType.templateParameter.dataType && !exp.destType.templateParameter.dataTypeString))))))
            exp.list = MkListOne(MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), decl), MkExpBrackets(exp.list)));
         exp.needTemplateCast = 2;
      }
   }
   yylloc = oldyylloc;
}

static void ProcessInitializer(Initializer init)
{
   switch(init.type)
   {
      case expInitializer:
         if(init.exp)
         {
            init.exp.usage.usageGet = true;
            ProcessExpression(init.exp);
            if(init.exp.destType && init.exp.destType.kind == classType && init.exp.destType._class &&
               init.exp.destType._class.registered && init.exp.destType._class.registered.type == noHeadClass)
            {
               FixReference(init.exp, true);
            }
            else if(init.exp.destType && init.exp.destType.kind == classType)
               FixReference(init.exp, false);
         }
         break;
      case listInitializer:
      {
         if(init.list)
         {
            Initializer i;
            for(i = init.list->first; i; i = i.next)
               ProcessInitializer(i);
         }
         break;
      }
   }
}

static void ProcessDeclaration(Declaration decl)
{
   switch(decl.type)
   {
      case initDeclaration:
      {
         if(decl.declarators)
         {
            InitDeclarator d;

            for(d = decl.declarators->first; d; d = d.next)
            {
               if(d.initializer)
                  ProcessInitializer(d.initializer);
            }
         }
         break;
      }
   }
}

static void ProcessStatement(Statement stmt)
{
   switch(stmt.type)
   {
      case labeledStmt:
         ProcessStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
         {
            stmt.caseStmt.exp.usage.usageGet = true;

            // This expression should be constant...
            ProcessExpression(stmt.caseStmt.exp);
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
            {
               ProcessExpression(exp);
            }
         }
         break;
      }
      case ifStmt:
      {
         if(stmt.ifStmt.exp)
         {
            Expression exp;

            ((Expression)stmt.ifStmt.exp->last).usage.usageGet = true;
            for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         if(stmt.ifStmt.stmt)
            ProcessStatement(stmt.ifStmt.stmt);
         if(stmt.ifStmt.elseStmt)
            ProcessStatement(stmt.ifStmt.elseStmt);
         break;
      }
      case switchStmt:
      {
         Expression exp;
         if(stmt.switchStmt.exp && stmt.switchStmt.exp->last)
         {
            ((Expression)stmt.switchStmt.exp->last).usage.usageGet = true;
            for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         ProcessStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         if(stmt.whileStmt.exp && stmt.whileStmt.exp->last)
         {
            ((Expression)stmt.whileStmt.exp->last).usage.usageGet = true;
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         ProcessStatement(stmt.whileStmt.stmt);
         break;
      }
      case doWhileStmt:
      {
         Expression exp;
         if(stmt.doWhile.exp && stmt.doWhile.exp->last)
         {
            ((Expression)stmt.doWhile.exp->last).usage.usageGet = true;
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
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

         if(stmt.forStmt.check)
         {
            if(stmt.forStmt.check.expressions)
            {
               ((Expression)stmt.forStmt.check.expressions->last).usage.usageGet = true;
            }
            ProcessStatement(stmt.forStmt.check);
         }
         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
            }
         }
         if(stmt.forStmt.stmt)
            ProcessStatement(stmt.forStmt.stmt);
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
            ((Expression)stmt.expressions->last).usage.usageGet = true;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
               // TOCHECK: This was added 2013/02/09 as part of 64 bit port for structs in class properties to automatically be returned by reference
               if(!exp.next && exp.destType && exp.destType.byReference)
                  FixReference(exp, true);
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
                  ProcessExpression(field.expression);
         }
         if(stmt.asmStmt.outputFields)
         {
            for(field = stmt.asmStmt.outputFields->first; field; field = field.next)
               if(field.expression)
                  ProcessExpression(field.expression);
         }
         if(stmt.asmStmt.clobberedFields)
         {
            for(field = stmt.asmStmt.clobberedFields->first; field; field = field.next)
               if(field.expression)
                  ProcessExpression(field.expression);
         }
         break;
      }
   }
}

static void ProcessFunction(FunctionDefinition function)
{
   if(function.body)
      ProcessStatement(function.body);
}

static void ProcessMemberInitData(MemberInit member)
{
   if(member.initializer)
      ProcessInitializer(member.initializer);
}

static void ProcessInstantiation(Instantiation inst)
{
   if(inst.members)
   {
      MembersInit members;
      for(members = inst.members->first; members; members = members.next)
      {
         if(members.type == dataMembersInit)
         {
            if(members.dataMembers)
            {
               MemberInit member;
               for(member = members.dataMembers->first; member; member = member.next)
                  ProcessMemberInitData(member);
            }
         }
         else if(members.type == methodMembersInit)
         {
            ProcessFunction((FunctionDefinition)members.function);
         }
      }
   }
}

/////////// MEMBER ACCESS PASS /////////////////////////////////////////////
public void ProcessMemberAccess()
{
   External external;
   for(external = ast->first; external; external = external.next)
   {
      curExternal = external;
      // There shouldn't be any class member access here anyways...
      if(external.type == declarationExternal)
      {
         if(external.declaration)
            ProcessDeclaration(external.declaration);
      }
   }

   for(external = ast->first; external; external = external.next)
   {
      curExternal = external;
      if(external.type == functionExternal)
      {
         ProcessFunction(external.function);
      }
      else if(external.type == declarationExternal)
      {
         if(external.declaration)
            ProcessDeclaration(external.declaration);
      }
      else if(external.type == classExternal)
      {
         ClassDefinition _class = external._class;
         if(_class.definitions)
         {
            ClassDef def;
            Class regClass = _class.symbol.registered;

            // Process all functions
            for(def = _class.definitions->first; def; def = def.next)
            {
               if(def.type == functionClassDef)
               {
                  curExternal = def.function.declarator.symbol.pointerExternal;
                  ProcessFunction((FunctionDefinition)def.function);
               }
               else if(def.type == declarationClassDef && def.decl.type == instDeclaration)
               {
                  ProcessInstantiation(def.decl.inst);
               }
               else if(def.type == defaultPropertiesClassDef && def.defProperties)
               {
                  MemberInit defProperty;

                  // Add this to the context
                  Symbol thisSymbol
                  {
                     string = CopyString("this");
                     type = MkClassType(regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);

                  for(defProperty = def.defProperties->first; defProperty; defProperty = defProperty.next)
                  {
                     //thisClass = regClass;
                     ProcessMemberInitData(defProperty); //, regClass, &id);
                     //thisClass = null;
                  }

                  //globalContext.symbols.Delete((BTNode)thisSymbol);
                  globalContext.symbols.Remove((BTNode)thisSymbol);
                  FreeSymbol(thisSymbol);
               }
               else if(def.type == propertyClassDef && def.propertyDef)
               {
                  PropertyDef prop = def.propertyDef;

                  // Add this to the context
                  Symbol thisSymbol
                  {
                     string = CopyString("this");
                     type = MkClassType(regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);

                  //thisClass = regClass;
                  if(prop.setStmt)
                  {
                     curExternal = prop.symbol.externalSet;
                     ProcessStatement(prop.setStmt);
                  }
                  if(prop.getStmt)
                  {
                     curExternal = prop.symbol.externalGet;
                     ProcessStatement(prop.getStmt);
                  }
                  if(prop.issetStmt)
                  {
                     curExternal = prop.symbol.externalIsSet;
                     ProcessStatement(prop.issetStmt);
                  }

                  //thisClass = null;

                  //globalContext.symbols.Delete((BTNode)thisSymbol);
                  globalContext.symbols.Remove((BTNode)thisSymbol);
                  FreeSymbol(thisSymbol);
               }
               else if(def.type == classPropertyClassDef && def.propertyDef)
               {
                  PropertyDef prop = def.propertyDef;

                  //thisClass = regClass;
                  if(prop.setStmt)
                  {
                     curExternal = prop.symbol.externalSet;
                     ProcessStatement(prop.setStmt);
                  }
                  if(prop.getStmt)
                  {
                     curExternal = prop.symbol.externalGet;
                     ProcessStatement(prop.getStmt);
                  }
                  //thisClass = null;
               }
               else if(def.type == propertyWatchClassDef && def.propertyWatch)
               {
                  PropertyWatch propertyWatch = def.propertyWatch;

                  // Add this to the context
                  Symbol thisSymbol
                  {
                     string = CopyString("this");
                     type = MkClassType(regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);

                  //thisClass = regClass;
                  if(propertyWatch.compound)
                  {
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassType(regClass.fullName);
                     };
                     propertyWatch.compound.compound.context.symbols.Add((BTNode)thisSymbol);
                     curExternal = null;
                     ProcessStatement(propertyWatch.compound);
                  }
                  // thisClass = null;

                  //globalContext.symbols.Delete((BTNode)thisSymbol);
                  globalContext.symbols.Remove((BTNode)thisSymbol);
                  FreeSymbol(thisSymbol);
               }
            }
         }
      }
   }
}
