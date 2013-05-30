import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

extern External curExternal;
static Statement curCompound;
static Statement createInstancesBody;
static Statement destroyInstancesBody;

static void CreateInstancesBody()
{
   if(inCompiler && !createInstancesBody)
   {
      char registerName[1024], moduleName[MAX_FILENAME];
      OldList * specifiers;
      Declarator declarator;

      createInstancesBody = MkCompoundStmt(null, MkList());
      createInstancesBody.compound.context = Context { parent = globalContext };

      specifiers = MkList();
      ListAdd(specifiers, MkSpecifier(VOID));

      //strcpy(moduleName, outputFile);
      GetLastDirectory(outputFile, moduleName);
      StripExtension(moduleName);
      FixModuleName(moduleName);
      sprintf(registerName, "__ecereCreateModuleInstances_%s", moduleName);

      declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), null);

      {
         FunctionDefinition function = _MkFunction(specifiers, declarator, null, false);
         ProcessFunctionBody(function, createInstancesBody);
         ListAdd(ast, MkExternalFunction(function));
      }

      // Destroy Instances Body
      destroyInstancesBody = MkCompoundStmt(null, MkList());
      destroyInstancesBody.compound.context = Context { parent = globalContext };

      specifiers = MkList();
      ListAdd(specifiers, MkSpecifier(VOID));

      sprintf(registerName, "__ecereDestroyModuleInstances_%s", moduleName);

      declarator = MkDeclaratorFunction(MkDeclaratorIdentifier(MkIdentifier(registerName)), null);

      {
         FunctionDefinition function = _MkFunction(specifiers, declarator, null, false);
         ProcessFunctionBody(function, destroyInstancesBody);
         ListAdd(ast, MkExternalFunction(function));
      }
   }
}

// ***************** EXPRESSION PROCESSING ***************************
static void ProcessMemberInitData(MemberInit member)
{
   if(member.initializer)
      ProcessInitializer(member.initializer);
}

static void ProcessInstantiation(Instantiation inst)
{
   if(inst.members && inst.members->first)
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

// ADDED TO SUPPORT NESTED UNNAMED STRUCTURES
static bool ProcessInstMembers_SimpleMemberEnsure(DataMember parentMember, Instantiation inst, Expression instExp, OldList list, bool zeroOut)
{
   Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);

   // For simple classes, ensure all members are initialized
   bool fullSet = true;
   DataMember dataMember;
   for(dataMember = parentMember.members.first; dataMember; dataMember = dataMember.next)
   {
      if(!dataMember.isProperty)
      {
         if(!dataMember.name && (dataMember.type == unionMember || dataMember.type == structMember))
         {
            if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
               fullSet = false;
         }
         else
         {
            bool memberFilled = false;
            if(inst.members && inst.members->first)
            {
               Class curClass = null;
               DataMember curMember = null;
               DataMember subMemberStack[256];
               int subMemberStackPos = 0;
               MembersInit members;

               for(members = inst.members->first; members; members = members.next)
               {
                  if(members.type == dataMembersInit)
                  {
                     MemberInit member = null;
                     for(member = members.dataMembers->first; member; member = member.next)
                     {
                        if(member.identifiers)
                        {
                           Identifier firstID = member.identifiers->first;
                           DataMember _subMemberStack[256];
                           int _subMemberStackPos = 0;
                           DataMember thisMember = (DataMember)eClass_FindProperty(classSym.registered, firstID.string, privateModule);
                           // FILL MEMBER STACK
                           if(!thisMember)
                              thisMember = (DataMember)eClass_FindDataMember(classSym.registered, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                           if(thisMember)
                           {
                              if(thisMember && thisMember.memberAccess == publicAccess)
                              {
                                 curMember = thisMember;
                                 curClass = curMember._class;
                                 memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                                 subMemberStackPos = _subMemberStackPos;
                              }
                              if(!firstID.next && thisMember == dataMember)
                              {
                                 memberFilled = true;
                                 break;
                              }
                           }

                           /*
                           BTNamedLink link = parentMember.membersAlpha.Find((uintptr)firstID.string);
                           if(link)
                           {
                              curMember = link.data;
                              if(!firstID.next && curMember == dataMember)
                              {
                                 memberFilled = true;
                                 break;
                              }
                           }
                           */
                        }
                        else
                        {
                           eClass_FindNextMember(classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                           if(curMember == dataMember)
                           {
                              memberFilled = true;
                              break;
                           }
                           /*
                           if(curMember)
                              curMember = curMember.next;
                           else
                              curMember = parentMember.members.first;
                           */

                           //while(curMember)
                           //   curMember = curMember.next;
                        }
                     }
                     if(memberFilled) break;
                  }
                  if(memberFilled) break;
               }
            }
            if(!memberFilled)
            {
               if(zeroOut)
               {
                  Expression instExpCopy = CopyExpression(instExp);
                  Expression memberExp;
                  Expression setExp;
                  Expression value = MkExpConstant("0");

                  memberExp = MkExpMember(instExpCopy, MkIdentifier(dataMember.name));
                  memberExp.member.memberType = MemberType::dataMember;

                  value.usage.usageGet = true;
                  setExp = MkExpOp(memberExp, '=', value);

                  value.loc = inst.loc;

                  // Testing this
                  setExp.loc = inst.loc;

                  FreeType(instExpCopy.expType);
                  instExpCopy.expType = instExp.expType;
                  if(instExp.expType) instExp.expType.refCount++;

                  ProcessExpressionType(setExp);
                  ProcessExpression(setExp);

                  ListAdd(list, setExp);
               }
               fullSet = false;
            }
         }
      }
      /*
      if(parentMember.type == unionMember)
         break;
      */
   }
   return fullSet;
}

// Returns if all members are set
static bool ProcessInstMembers(Instantiation inst, Expression instExp, OldList list, bool zeroOut)
{
   MembersInit members;
   Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
   bool fullSet = true, convert = false;
   if(classSym && classSym.registered && classSym.registered.type == bitClass)
   {
      Expression exp = null;
      if(inst.members && inst.members->first)
      {
         // Ensure all members are initialized only once
         Class _class = null;
         while(_class != classSym.registered)
         {
            BitMember bitMember = null;
            Class lastClass = _class;

            for(_class = classSym.registered; _class.base != lastClass && _class.base.type != systemClass; _class = _class.base);

            for(bitMember = _class.membersAndProperties.first; bitMember; bitMember = bitMember.next)
            {
               BitMember curMember = null;
               Class curClass = null;
               DataMember subMemberStack[256];
               int subMemberStackPos = 0;
               MemberInit member = null;
               bool found = false;
               for(members = inst.members->first; members; members = members.next)
               {
                  if(members.type == dataMembersInit)
                  {
                     for(member = members.dataMembers->first; member; member = member.next)
                     {
                        if(member.identifiers)
                        {
                           Identifier firstID = member.identifiers->first;
                           DataMember _subMemberStack[256];
                           int _subMemberStackPos = 0;

                           // FILL MEMBER STACK
                           BitMember thisMember = (BitMember)eClass_FindDataMember(_class, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                           if(!thisMember)
                           {
                              // WARNING: Brackets needed here, awaiting precomp fix
                              thisMember = (BitMember)eClass_FindProperty(_class, firstID.string, privateModule);
                           }
                           if(thisMember && thisMember.memberAccess == publicAccess)
                           {
                              curMember = thisMember;
                              curClass = curMember._class;
                              memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                              subMemberStackPos = _subMemberStackPos;
                           }
                           if(thisMember == bitMember)
                           {
                              found = true;
                              break;
                           }
                        }
                        else
                        {
                           eClass_FindNextMember(classSym.registered, &curClass, (DataMember *)&curMember, subMemberStack, &subMemberStackPos);
                           if(curMember == bitMember)
                           {
                              found = true;
                              break;
                           }
                        }
                     }
                  }
                  if(found) break;
               }

               if(member)
               {
                  if(!bitMember.isProperty)
                  {
                     Expression part = null;
                     OldList * specs = MkList();
                     Declarator decl;
                     //decl = SpecDeclFromString(bitMember.dataTypeString, specs, null);
                     decl = SpecDeclFromString(_class.dataTypeString, specs, null);

                     ProcessInitializer(member.initializer);

                     if(member.initializer && member.initializer.type == expInitializer)
                     {
                        if(bitMember.pos)
                        {
                           char pos[10];
                           sprintf(pos, "%d", bitMember.pos);
                           // (((type) value) << bitPos)
                           part = MkExpBrackets(MkListOne(MkExpOp(MkExpBrackets(MkListOne(MkExpCast(
                              MkTypeName(specs, decl), MkExpBrackets(MkListOne(member.initializer.exp))))), LEFT_OP, MkExpConstant(pos))));
                        }
                        else
                           part = MkExpBrackets(MkListOne(MkExpCast(MkTypeName(specs, decl), 
                              MkExpBrackets(MkListOne(member.initializer.exp)))));
                        // Take it out
                        member.initializer.exp = null;
                        FreeInitializer(member.initializer);
                        member.initializer = null;
                     }

                     if(exp)
                        exp = MkExpOp(exp,'|', part);
                     else
                        exp = part;
                  }
                  // Clean this up... should only be used for Conversion properties...
                  else
                  {
                     char setName[1024], getName[1024];
                     DeclareProperty((Property)bitMember, setName, getName);
                     if(member.initializer && member.initializer.type == expInitializer)
                     {
                        exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)),
                           MkListOne(member.initializer.exp));

                        // Take it out
                        member.initializer.exp = null;
                        FreeInitializer(member.initializer);
                        member.initializer = null;
                     }
                  }
               }
            }
         }
      }
      if(exp)
         exp = MkExpBrackets(MkListOne(exp));
      else
         exp = MkExpConstant("0");

      // Just added this one...
      exp.expType = MkClassType(classSym.string);

      ProcessExpression(exp);

      ListAdd(list, exp);
   }
   else if(classSym && classSym.registered && classSym.registered.type == unitClass)
   {
      Class _class = classSym.registered;
      Expression exp = null;
      if(inst.members && inst.members->first)
      {
         MemberInit member = null;
         Property prop = null;
         bool found = false;
         for(members = inst.members->first; members; members = members.next)
         {
            if(members.type == dataMembersInit)
            {
               for(member = members.dataMembers->first; member; member = member.next)
               {
                  if(member.identifiers)
                  {
                     Identifier firstID = member.identifiers->first;
                     prop = eClass_FindProperty(_class, firstID.string, privateModule);
                     if(prop)
                     {
                        found = true;
                        break;
                     }
                     prop = null;
                  }
                  else
                  {
                     found = true;
                     break;
                  }
               }
            }
            if(found) break;
         }

         if(member)
         {
            if(prop)
            {
               char setName[1024], getName[1024];
               DeclareProperty(prop, setName, getName);
               if(member.initializer && member.initializer.type == expInitializer)
               {
                  exp = MkExpCall(MkExpIdentifier(MkIdentifier(setName)), MkListOne(member.initializer.exp));

                  // Take it out
                  member.initializer.exp = null;
                  FreeInitializer(member.initializer);
                  member.initializer = null;
               }
            }
            else
            {
               ProcessInitializer(member.initializer);
               if(member.initializer && member.initializer.type == expInitializer)
               {
                  //exp = MkExpBrackets(MkListOne(MkExpCast(QMkClass(_class.fullName, null), member.exp)));
                  exp = MkExpCast(QMkClass(_class.fullName, null), MkExpBrackets(MkListOne(member.initializer.exp)));

                  // Take it out
                  member.initializer.exp = null;
                  FreeInitializer(member.initializer);
                  member.initializer = null;
               }
            }
         }
      }
      if(exp)
         exp = MkExpBrackets(MkListOne(exp));
      else
         exp = MkExpConstant("0");

      ProcessExpression(exp);

      ListAdd(list, exp);
   }
   else if(classSym && classSym.registered)
   {
      if(classSym.registered.type == structClass)
      {
         // For simple classes, ensure all members are initialized
         Class _class = null;
         while(_class != classSym.registered)
         {
            DataMember dataMember;
            Class lastClass = _class;

            for(_class = classSym.registered; _class.base != lastClass && _class.base.type != systemClass; _class = _class.base);

            if(_class.structSize != _class.memberOffset)
               fullSet = false;

            for(dataMember = _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
            {
               if(!dataMember.isProperty)
               {
                  if(!dataMember.name && (dataMember.type == unionMember || dataMember.type == structMember))
                  {
                     if(!ProcessInstMembers_SimpleMemberEnsure(dataMember, inst, instExp, list, zeroOut))
                        fullSet = false;
                  }
                  else
                  {
                     bool memberFilled = false;
                     if(inst.members && inst.members->first)
                     {
                        Class curClass = null;
                        DataMember curMember = null;
                        DataMember subMemberStack[256];
                        int subMemberStackPos = 0;

                        for(members = inst.members->first; members; members = members.next)
                        {
                           if(members.type == dataMembersInit && members.dataMembers)
                           {
                              MemberInit member = null;
                              for(member = members.dataMembers->first; member; member = member.next)
                              {
                                 if(member.identifiers)
                                 {
                                    DataMember _subMemberStack[256];
                                    int _subMemberStackPos = 0;
                                    Identifier firstID = member.identifiers->first;
                                    DataMember thisMember = (DataMember)eClass_FindProperty(classSym.registered, firstID.string, privateModule);
                                    // FILL MEMBER STACK
                                    if(!thisMember)
                                       thisMember = (DataMember)eClass_FindDataMember(classSym.registered, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                                    if(thisMember)
                                    {
                                       if(thisMember.memberAccess == publicAccess)
                                       {
                                          curMember = thisMember;
                                          curClass = curMember._class;
                                          memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                                          subMemberStackPos = _subMemberStackPos;
                                       }
                                       if(!firstID.next && curMember == dataMember)
                                       {                                 
                                          memberFilled = true;
                                          break;
                                       }
                                    }
                                 }
                                 else
                                 {
                                    eClass_FindNextMember(classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                                    if(curMember == dataMember)
                                    {
                                       memberFilled = true;
                                       break;
                                    }
                                 }
                              }
                              if(memberFilled) break;
                           }
                           if(memberFilled) break;
                        }
                     }
                     if(!memberFilled)
                     {
                        if(zeroOut)
                        {
                           Expression instExpCopy = CopyExpression(instExp);
                           Expression memberExp;
                           Expression setExp;
                           Expression value = MkExpConstant("0");

                           memberExp = MkExpMember(instExpCopy, MkIdentifier(dataMember.name));
                           memberExp.member.memberType = MemberType::dataMember;

                           value.usage.usageGet = true;
                           setExp = MkExpOp(memberExp, '=', value);

                           value.loc = inst.loc;

                           // Testing this
                           setExp.loc = inst.loc;

                           FreeType(instExpCopy.expType);
                           instExpCopy.expType = instExp.expType;
                           if(instExp.expType) instExp.expType.refCount++;

                           ProcessExpressionType(setExp);
                           ProcessExpression(setExp);

                           ListAdd(list, setExp);
                        }
                        fullSet = false;
                     }
                  }
               }
            }
         }
      }

      // THEN SET EVERYTHING IN THE ORDER IT IS SET
      if(inst.members && inst.members->first)
      {
         Class curClass = null;
         DataMember curMember = null;
         DataMember subMemberStack[256];
         int subMemberStackPos = 0;

         for(members = inst.members->first; members; members = members.next)
         {
            if(members.type == dataMembersInit && members.dataMembers)
            {
               MemberInit member = null;
               Method method = null;

               for(member = members.dataMembers->first; member; member = member.next)
               {
                  Identifier ident = null;
                  DataMember thisMember = null;
                  if(member.identifiers)
                  {
                     DataMember _subMemberStack[256];
                     int _subMemberStackPos = 0;
                     Identifier firstID = member.identifiers->first;
                     thisMember = (DataMember)eClass_FindProperty(classSym.registered, firstID.string, privateModule);
                     // FILL MEMBER STACK
                     if(!thisMember)
                        thisMember = (DataMember)eClass_FindDataMember(classSym.registered, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                     ident = firstID;
                     if(thisMember)
                     {
                        if(thisMember.memberAccess == publicAccess)
                        {
                           curMember = thisMember;
                           curClass = curMember._class;
                           memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                           subMemberStackPos = _subMemberStackPos;
                        }
                     }
                     else if(classSym.registered.type != structClass)
                     {
                        method = eClass_FindMethod(classSym.registered, ident.string, privateModule);
                        if(!method || method.type != virtualMethod)
                           method = null;
                     }
                  }
                  else
                  {
                     eClass_FindNextMember(classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                     thisMember = curMember;
                  }

                  if(thisMember || method)
                  {
                     Expression instExpCopy = CopyExpression(instExp);
                     Expression setExp = null;

                     instExpCopy.tempCount = instExp.tempCount;

                     if(!ident)
                        ident = MkIdentifier(thisMember.name);
                     if(ident)
                     {
                        Expression memberExp;
                        bool freeMemberExp = false;

                        if(thisMember && thisMember.isProperty && ((Property)thisMember).conversion)
                           convert = true;
                        if(member.identifiers && member.identifiers->count > 1)
                        {
                           Identifier id = member.identifiers->first;
                           // TODO: Set the member types for those
                           memberExp = MkExpMember(instExpCopy, id);
                           for(id = id.next; id; id = id.next)
                              memberExp = MkExpMember(memberExp, id);                     
                        }
                        else
                           memberExp = MkExpMember(instExpCopy, ident);

                        if(member.initializer && member.initializer.type == expInitializer && member.initializer.exp)
                        {
                           member.initializer.exp.usage.usageGet = true;
                           setExp = MkExpOp(memberExp, '=', member.initializer.exp);

                           // Take this out
                           member.initializer.exp = null;
                           FreeInitializer(member.initializer);
                           member.initializer = null;
                        }
                        else
                        {
                           freeMemberExp = true;
                           // TOCHECK: WHat happens in here?
                        }
                        // TODO: list initializer not working...
                        memberExp.loc = inst.loc;

                        if(member.identifiers)
                           member.identifiers->Clear();

                        // Testing this
                        if(setExp)
                           setExp.loc = inst.loc;

                        FreeType(instExpCopy.expType);
                        instExpCopy.expType = instExp.expType;
                        if(instExp.expType) instExp.expType.refCount++;

                        if(setExp)
                        {
                           ProcessExpressionType(setExp);
                           ProcessExpression(setExp);

                           ListAdd(list, setExp);
                        }
                        if(freeMemberExp)
                           FreeExpression(memberExp);
                     }
                  }
               }
            }
         }
      }
   }
   return fullSet || convert;
}

public void DeclareClass(Symbol classSym, char * className)
{
   /*if(classSym.registered.templateClass)
   {
      Symbol templateSym;
      char className[1024];
      strcpy(className, "__ecereClass_");
      templateSym = FindClass(classSym.registered.templateClass.fullName);
      FullClassNameCat(className, templateSym.string, true);
      MangleClassName(className);

      DeclareClass(templateSym, className);
   }*/
   if(classSym && classSym.id == MAXINT)
   {
      // Add Class declaration as extern
      Declaration decl;
      OldList * specifiers, * declarators;
      Declarator d;

      if(!classSym._import)
      {
         // TESTING: DANGER HERE... CHECK FOR TEMPLATES ONLY? SET classSym.module ELSEWHERE?
         // if(!classSym.module) return;
         if(!classSym.module) classSym.module = mainModule;
         if(!classSym.module) return;
         classSym._import = ClassImport
         {
            isRemote = classSym.registered ? classSym.registered.isRemote : false;
            name = CopyString(classSym.string);
         };
         classSym.module.classes.Add(classSym._import);
      }
      classSym._import.itself = true;

      specifiers = MkList();
      declarators = MkList();

      ListAdd(specifiers, MkSpecifier(EXTERN));
      ListAdd(specifiers, MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));

      d = MkDeclaratorPointer(MkPointer(null, null),
         MkDeclaratorIdentifier(MkIdentifier(className)));                           

      ListAdd(declarators, MkInitDeclarator(d, null));

      decl = MkDeclaration(specifiers, declarators);

      if(curExternal)
      {
         ast->Insert(curExternal.prev, (classSym.pointerExternal = MkExternalDeclaration(decl)));
         // classSym.id = curExternal.symbol.id;

         // TESTING THIS:
         classSym.id = curExternal.symbol ? curExternal.symbol.idCode : 0;
         // TESTING THIS:
         classSym.idCode = classSym.id;
      }
   }
   else if(classSym && curExternal.symbol.idCode < classSym.id)
   //else if(curExternal.symbol.id <= classSym.id)
   {
      // DANGER: (Moved here)
      if(classSym.structExternal)
         DeclareStruct(classSym.string, classSym.registered && classSym.registered.type == noHeadClass);

      // Move _class declaration higher...
      ast->Move(classSym.pointerExternal, curExternal.prev);

      // DANGER:
      /*
      if(classSym.structExternal)
         DeclareStruct(classSym.string, classSym.registered && classSym.registered.type == noHeadClass);
      */

      // TOFIX: For non simple classes, Class is in pointerExternal and actual struct in structExternal
      if(classSym.structExternal)
         ast->Move(classSym.structExternal, classSym.pointerExternal);

      classSym.id = curExternal.symbol.idCode;
      // TESTING THIS
      classSym.idCode = classSym.id;
   }
}

void ProcessExpressionInstPass(Expression exp)
{
   ProcessExpression(exp);
}

static void ProcessExpression(Expression exp)
{
#ifdef _DEBUG
   char debugExpString[1024] = "";
   PrintExpression(exp, debugExpString);
#endif
   switch(exp.type)
   {
      case identifierExp:
         break;
      case instanceExp:
      {
         Instantiation inst = exp.instance;
         if(inCompiler && inst._class)
         {
            char className[1024];
            Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
            Expression instExp;

            if(classSym && classSym.registered && classSym.registered.type == bitClass)
            {
               if(inst.exp)
               {
                  OldList list = { 0 };

                  ProcessInstMembers(inst, null, &list, false);
               
                  ProcessExpression(inst.exp);

                  //Why was this here twice? ProcessInstMembers(inst, null, &list);
                  exp.type = opExp;
                  exp.op.op = '=';
                  exp.op.exp1 = inst.exp;
                  exp.op.exp2 = list.first;

                  // Take expression out... (Why was the comment alone?)
                  inst.exp = null;
               }
               else
               {
                  Type expType = exp.expType;
                  Expression prev = exp.prev, next = exp.next;
                  OldList list { };
                  ProcessInstMembers(inst, null, &list, false);

                  // TODO : To Check
                  FreeType(exp.destType);

                  *exp = *(Expression)list.first;

                  {
                     Expression firstExp = list.first;
                     delete firstExp;
                  }

                  FreeType(exp.destType);
                  exp.destType = expType;
                  //if(expType) expType.refCount++;

                  exp.prev = prev;
                  exp.next = next;
               }
            }
            else if(classSym && classSym.registered && (classSym.registered.type == unitClass || classSym.registered.type == enumClass))
            {
               if(inst.exp)
               {
                  OldList list = { 0 };
                  Expression e;

                  ProcessInstMembers(inst, null, &list, false);
               
                  ProcessExpression(inst.exp);

                  //Why was this here twice? ProcessInstMembers(inst, null, &list);
                  exp.type = opExp;
                  exp.op.op = '=';
                  exp.op.exp1 = inst.exp;
                  exp.op.exp2 = list.first;

                  // Take expression out... (Why was the comment alone?)
                  inst.exp = null;

                  list.Remove(list.first);
                  while(e = list.first)
                  {
                     list.Remove(e);
                     FreeExpression(e);
                  }
               }
               else
               {
                  Expression prev = exp.prev, next = exp.next;
                  Type expType = exp.expType;
                  OldList list = { 0 };
                  ProcessInstMembers(inst, null, &list, false);

                  // TODO : To Check
                  if(list.first)
                  {
                     Expression e = list.first;
                     FreeType(exp.destType);
                     *exp = *e;
                     list.Remove(e);
                     delete e;
                     exp.expType = expType;
                     exp.prev = prev;
                     exp.next = next;
                     while(e = list.first)
                     {
                        list.Remove(e);
                        FreeExpression(e);
                     }
                  }
                  else
                  {
                     exp.type = constantExp;
                     exp.constant = CopyString("0");
                  }
               }
            }
            else if(classSym && classSym.registered && classSym.registered.type == structClass)
            {
               if(inst.exp)
               {
                  // Set members
                  exp.type = bracketsExp;
                  exp.list = MkList();

                  ProcessInstMembers(inst, inst.exp, exp.list, false);
               
                  ProcessExpression(inst.exp);

                  if(!exp.list->count)
                  {
                     exp.type = (ExpressionType)1000; // remove expression
                  }

                  // Take expression out...
                  inst.exp = null;
               }
               else
               {
                  Declaration decl;
                  Declaration dummyDecl;
                  // Unnamed instantiation

                  // Make a declaration in the closest compound statement
                  // (Do not reuse (since using address for function calls)...)

                  /*
                  ListAdd(decls, MkInitDeclarator(
                     MkDeclaratorIdentifier(MkIdentifier(className)), null));
                  decl = MkDeclaration(specs, decls);
                  */
                  /*    Never mind this... somebody might modify the values...

                  if(inst.isConstant)
                  {
                     sprintf(className, "__simpleStruct%d", curContext.simpleID++);
                     inst.id = MkIdentifier(className);
                     decl = MkDeclarationInst(inst);
                     exp.type = ExpIdentifier;
                     exp.identifier = inst.id;
                     if(!curCompound.compound.declarations)
                        curCompound.compound.declarations = MkList();
                     curCompound.compound.declarations->Insert(null, decl);
                     ProcessDeclaration(decl);
                  }
                  else
                  */

                  {
                     //OldList * specs = MkList(), * decls = MkList();
                     //sprintf(className, "__ecereClassData_%s", inst._class.name);
                     //ListAdd(specs, MkStructOrUnion(SpecifierStruct, MkIdentifier(className), null));


                     // TRICKY STUFF, UGLY HACK FOR stateSizeAnchor = SizeAnchor { size.w = 10 };
                     dummyDecl = MkDeclaration(null,null);
                     if(!curCompound.compound.declarations)
                        curCompound.compound.declarations = MkList();
                     curCompound.compound.declarations->Insert(null, dummyDecl);

                     sprintf(className, "__simpleStruct%d", curContext.simpleID++);

                     {
                        OldList * list = MkList();
                        if(inst.isConstant && ProcessBracketInst(inst, list))
                        {
                           decl = MkDeclaration(MkList(), MkList());

                           ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                           ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(className)),
                              MkInitializerList(list)));

                           exp.type = identifierExp;
                           exp.identifier = MkIdentifier(className);
                        }
                        else
                        {
                           list->Free(null);
                           delete list;

                           decl = MkDeclarationInst(MkInstantiation(CopySpecifier(inst._class), MkExpIdentifier(MkIdentifier(className)), null));


                           // Set properties & data members in expression
                           // to handle jump and control statements
                           // Set unset data members to 0
                           exp.type = bracketsExp;
                           exp.list = MkList();

                           instExp = QMkExpId(className);
                           instExp.loc = exp.loc;
                           instExp.expType = MkClassType(inst._class.name);

                           // Mark the declarated instance as fullset so it doesn't need to be zeroed out
                           decl.inst.fullSet = ProcessInstMembers(inst, instExp, exp.list, false);

                           ListAdd(exp.list, instExp);
                        }
                     }

                     FreeType(exp.expType);
                     exp.expType = MkClassType(inst._class.name);

                     // TRICKY STUFF, UGLY HACK FOR stateSizeAnchor = SizeAnchor { size.w = 10 };
                     {
                        void * prev = dummyDecl.prev, * next = dummyDecl.next;
                        *dummyDecl = *decl;
                        dummyDecl.prev = prev;
                        dummyDecl.next = next;
                        delete decl;
                        decl = dummyDecl;
                     }
                     ProcessDeclaration(decl);

                     /*
                     if(!curCompound.compound.declarations)
                        curCompound.compound.declarations = MkList();
                     curCompound.compound.declarations->Insert(null, decl);
                     */
                  }
               }
            }
            else
            {
               Expression newCall;

               if(classSym && classSym.registered && classSym.registered.type == noHeadClass && 
                  (classSym.registered.templateClass ? classSym.registered.templateClass.fixed : classSym.registered.fixed))
               {
                  char size[256];
                  sprintf(size, "%d", classSym.registered.templateClass ? classSym.registered.templateClass.structSize : classSym.registered.structSize);
                  newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(MkExpConstant(size)));
                  newCall.byReference = true;
               }
               else
               {
                  strcpy(className, "__ecereClass_");
                  if(classSym && classSym.registered && classSym.registered.type == noHeadClass && classSym.registered.templateClass)
                  {
                     classSym = FindClass(classSym.registered.templateClass.fullName);
                     FullClassNameCat(className, classSym.string, true);
                  }
                  else
                     FullClassNameCat(className, inst._class.name, true);

                  MangleClassName(className);
                  DeclareClass(classSym, className);
                  newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));

                  ProcessExpressionType(newCall);
                  newCall.byReference = true;
               }

               if(inst.exp)
               {
                  if(inst.members && inst.members->first)
                  {
                     exp.type = bracketsExp;
                     exp.list = MkList();

                     if(!inst.built)
                     {
                        ListAdd(exp.list, MkExpOp(inst.exp, '=', newCall));
                     }
                     else
                        FreeExpression(newCall);

                     ProcessInstMembers(inst, inst.exp, exp.list, false);

                     if(inst.built)
                        FreeExpression(inst.exp);
                  }
                  else
                  {
                     exp.type = opExp;
                     exp.op.op = '=';
                     exp.op.exp1 = inst.exp;
                     exp.op.exp2 = newCall;

                     ProcessExpression(inst.exp);
                  }
                  inst.exp = null;
               }
               else
               {
                  // Unnamed instantiation
                  if(inst.members && inst.members->first)
                  {
                     char ecereTemp[100];
                     MembersInit members;
                     int tempCount = exp.tempCount;
                     OldList * expList;
               
                     // Check if members use temp count...
                     for(members = inst.members->first; members; members = members.next)
                     {
                        if(members.type == dataMembersInit && members.dataMembers)
                        {
                           MemberInit member;
                           for(member = members.dataMembers->first; member; member = member.next)
                           {
                              if(member.initializer && member.initializer.type == expInitializer)
                              {
                                 ProcessMemberInitData(member);   // ADDED THIS TO HAVE PROPER tempCount ALREADY...
                                 tempCount = Max(tempCount, member.initializer.exp.tempCount);
                              }
                           }
                        }
                     }
                     if(curDecl)
                        tempCount = Max(tempCount, declTempCount);
               
                     tempCount++;
                     curExternal.function.tempCount = Max(curExternal.function.tempCount, tempCount);
                     sprintf(ecereTemp, "__ecereInstance%d", tempCount);
                     exp.type = extensionCompoundExp;
                     exp.compound = MkCompoundStmt(null, null);
                     exp.compound.compound.context = PushContext();
                     exp.compound.compound.context.simpleID = exp.compound.compound.context.parent.simpleID;
                     exp.compound.compound.declarations = MkListOne(QMkDeclaration(inst._class.name, MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(ecereTemp)), 
                        MkInitializerAssignment(newCall))));
                     exp.compound.compound.statements = MkListOne(MkExpressionStmt((expList = MkList())));

                     instExp = QMkExpId(ecereTemp);
                     instExp.tempCount = tempCount;
                     instExp.expType = MkClassType(inst._class.name);
                     instExp.byReference = true;
                     ProcessInstMembers(inst, instExp, expList, false);
                     FreeExpression(instExp);

                     if(exp.usage)
                     {
                        Expression tmpExp = QMkExpId(ecereTemp);
                        tmpExp.byReference = true;
                        ListAdd(expList, tmpExp);
                     }
                     exp.tempCount = tempCount;
                     if(curDecl)
                        declTempCount = Max(declTempCount, tempCount);
                     PopContext(exp.compound.compound.context);
                  }
                  else
                  {
                     FreeType(newCall.destType);
                     FreeType(newCall.expType);
                     newCall.destType = exp.destType;
                     newCall.expType = exp.expType;
                     *exp = *newCall;
                     delete newCall;
                  }
               }
            }
            if(exp.type != instanceExp)
               FreeInstance(inst);
         }
         else
            ProcessInstantiation(inst);
         break;
      }
      case constantExp:
         break;
      case stringExp:
         break;
      case newExp:
      case new0Exp:
         // if(exp._new.size) exp._new.size.usage.usageGet = true;
         ProcessExpression(exp._new.size);
         break;
      case renewExp:
      case renew0Exp:
         // if(exp._renew.size) exp._renew.size.usage.usageGet = true;
         ProcessExpression(exp._renew.size);
         // if(exp._renew.exp) exp._renew.exp.usage.usageGet = true;
         ProcessExpression(exp._renew.exp);
         break;
      case opExp:
      {
         bool assign = false;

         switch(exp.op.op)
         {
            // Assignment Operators
            case '=': 
               if(exp.op.exp2)
                  exp.op.exp2.usage.usageGet = true;
               if(exp.op.exp1)
                  exp.op.exp1.usage.usageSet = true;
               assign = true;
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
               if(exp.op.exp2)
                  exp.op.exp2.usage.usageGet = true;
               assign = true;
               if(exp.op.exp1)
                  exp.op.exp1.usage.usageSet = true;
               break;

            case INC_OP:
            case DEC_OP:
               if(exp.op.exp1)
                  exp.op.exp1.usage.usageSet = true;

            // Unary operators
            case '&':
               // Also binary
               if(exp.op.exp1 && exp.op.exp2)
               {
                  exp.op.exp1.usage.usageGet = true;
                  exp.op.exp2.usage.usageGet = true;
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

         if(exp.op.exp1)
         {
            // TEST: if(exp.op.exp2) exp.op.exp1.tempCount = Max(exp.op.exp1.tempCount, exp.op.exp2.tempCount);
            ProcessExpression(exp.op.exp1);
            // TEST: exp.tempCount = Max(exp.op.exp1.tempCount, exp.tempCount);
         }

         if(exp.op.exp2)
         {
            // Don't use the temporaries used by the left side...
            if(exp.op.exp1)
               // TEST: exp.op.exp2.tempCount = Max(exp.op.exp2.tempCount, exp.op.exp1.tempCount);
               exp.op.exp2.tempCount = exp.op.exp1.tempCount;
            ProcessExpression(exp.op.exp2);
            // TEST: exp.tempCount = Max(exp.op.exp2.tempCount, exp.tempCount);
         }
         break;
      }
      case extensionExpressionExp:
      case bracketsExp:
      {
         Expression e;
         for(e = exp.list->first; e; e = e.next)
         {
            e.tempCount = Max(e.tempCount, exp.tempCount);
            if(!e.next)
            {
               e.usage |= (exp.usage & (ExpUsage { usageGet = true, usageArg = true }));
            }
            ProcessExpression(e);
            exp.tempCount = Max(exp.tempCount, e.tempCount);
         }
         break;
      }
      case indexExp:
      {
         Expression e;

         exp.index.exp.usage.usageGet = true;
         ProcessExpression(exp.index.exp);
         for(e = exp.index.index->first; e; e = e.next)
         {
            if(!e.next)
               e.usage.usageGet = true;
            ProcessExpression(e);
         }
         // Ignore temps in the index for now...
         exp.tempCount = exp.index.exp.tempCount;
         /*
         if(exp.index.exp.expType)
         {
            Type source = exp.index.exp.expType;
            if(source.kind == classType && source._class && source._class.registered && source._class.registered != containerClass &&
               eClass_IsDerived(source._class.registered, containerClass))
            {
               Class _class = source._class.registered;
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

               ListAdd(statements, MkExpressionStmt(MkListOne(MkExpOp(null, '&', MkExpIdentifier(MkIdentifier("__internalIterator"))))));

               exp.type = bracketsExp;
               exp.list = MkListOne(MkExpPointer(expExt = (MkExpExtensionCompound(MkCompoundStmt(declarations, statements))), MkIdentifier("data")));
               expExt.compound.compound.context = context;
               PopContext(context);
               expExt.usage = exp.usage;
               ProcessExpressionType(exp.list->first);
               ProcessExpression(exp.list->first);
            }
         }
         */
         break;
      }
      case callExp:
      {
         Expression e;
         Method method = null;

         ProcessExpression(exp.call.exp);

         if(exp.call.arguments)
         {
            for(e = exp.call.arguments->first; e; e = e.next)
            {
               e.usage.usageGet = true;
               e.usage.usageArg = true;

               // TEST: e.tempCount = Max(e.tempCount, exp.tempCount);
               ProcessExpression(e);
               // TEST: exp.tempCount = Max(exp.tempCount, e.tempCount);
            }
         }
         break;
      }
      case memberExp:
      {
         exp.member.exp.usage.usageGet = true;
         ProcessExpression(exp.member.exp);

         // Must do this here so we can set the MemberType of deep properties inside instantiations
         if(!exp.member.memberType)
         {
            Type type = exp.member.exp.expType;
            if((type && type.kind == classType && exp.member.member))
            {
               // Check if it's an instance
               Class _class = (exp.member.member._class && exp.member.member.classSym) ? exp.member.member.classSym.registered : (type._class ? type._class.registered : null);
               Property prop = null;
               Method method = null;
               DataMember member = null;
               Property revConvert = null;

               // Prioritize data members over properties for "this"
               if(exp.member.thisPtr)
               {
                  member = eClass_FindDataMember(_class, exp.member.member.string, privateModule, null, null);
                  if(!member)
                     prop = eClass_FindProperty(_class, exp.member.member.string, privateModule);
               }
               // Prioritize properties over data members otherwise
               else
               {
                  // Look for publicAccess Members first
                  prop = eClass_FindProperty(_class, exp.member.member.string, null);
                  if(!prop)
                     member = eClass_FindDataMember(_class, exp.member.member.string, null, null, null);
                  if(!prop && !member)
                  {
                     method = eClass_FindMethod(_class, exp.member.member.string, null);
                     if(!method)
                     {
                        prop = eClass_FindProperty(_class, exp.member.member.string, privateModule);
                        if(!prop)
                           member = eClass_FindDataMember(_class, exp.member.member.string, privateModule, null, null);
                     }
                  }
               }
               if(!prop && !member && !method)     // NOTE: Recently added the !method here, causes private methods to unprioritized
                  method = eClass_FindMethod(_class, exp.member.member.string, privateModule);
               if(!prop && !member && !method)
               {
                  Symbol classSym = FindClass(exp.member.member.string);
                  if(classSym)
                  {
                     Class convertClass = classSym.registered;
                     if(convertClass)
                        revConvert = eClass_FindProperty(convertClass, _class.fullName, privateModule);
                  }
               }
      
               if(prop)
               {
                  exp.member.memberType = propertyMember;
                  if(!prop.dataType)
                     prop.dataType = ProcessTypeString(prop.dataTypeString, false);

                  FreeType(exp.expType);
                  exp.expType = prop.dataType;
                  if(prop.dataType) prop.dataType.refCount++;
               }
               else if(method)
               {
                  exp.member.memberType = methodMember;
                  if(!method.dataType)
                     //method.dataType = ((Symbol)method.symbol).type;
                     ProcessMethodType(method);
                  
                  FreeType(exp.expType);
                  exp.expType = method.dataType;
                  if(method.dataType) method.dataType.refCount++;
               }
               else if(member)
               {
                  exp.member.memberType = dataMember;
                  DeclareStruct(_class.fullName, false);
                  if(!member.dataType)
                     member.dataType = ProcessTypeString(member.dataTypeString, false);

                  FreeType(exp.expType);
                  exp.expType = member.dataType;
                  if(member.dataType) member.dataType.refCount++;
               }
               else if(revConvert)
               {
                  exp.member.memberType = reverseConversionMember;

                  FreeType(exp.expType);
                  exp.expType = MkClassType(revConvert._class.fullName);
               }/*
               else
                  printf($"Error: Couldn't find member %s in class %s\n", 
                     exp.member.member.string, _class.name);*/
            }
         }
         break;
      }
      case typeSizeExp:
         break;
      case castExp:
      {
         exp.cast.exp.usage.usageGet = true;
         ProcessExpression(exp.cast.exp);
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
         if(exp.cond.elseExp)
         {
            if(exp.usage.usageGet) exp.cond.elseExp.usage.usageGet = true;
            ProcessExpression(exp.cond.elseExp);
         }
         break;
      }
      case extensionCompoundExp:
      {
         if(exp.compound.compound.statements &&
         ((Statement)exp.compound.compound.statements->last).type == expressionStmt && 
         ((Statement)exp.compound.compound.statements->last).expressions &&
         ((Statement)exp.compound.compound.statements->last).expressions->last)
         {
            ((Expression)((Statement)exp.compound.compound.statements->last).expressions->last).usage = exp.usage;
         }
         ProcessStatement(exp.compound);
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
   CheckTemplateTypes(exp);
}

static void ProcessInitializer(Initializer init)
{
   switch(init.type)
   {
      case expInitializer:
         init.exp.usage.usageGet = true;
         ProcessExpression(init.exp);
         break;
      case listInitializer:
      {
         Initializer i;
         for(i = init.list->first; i; i = i.next)
            ProcessInitializer(i);
         break;
      }
   }
}

static void ProcessSpecifier(Specifier spec)
{
   switch(spec.type)
   {
      case baseSpecifier:
         break;
      case nameSpecifier:
      {
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
                  ProcessExpression(e.exp);
            }
         }
         break;
      }
      case structSpecifier:
      case unionSpecifier:
      {
         //Declaration decl;
         if(spec.definitions)
         {
            ClassDef def;
            for(def = spec.definitions->first; def; def = def.next)
            {
               if(def.type == declarationClassDef && def.decl && def.decl.type == structDeclaration)
                  ProcessDeclaration(def.decl);
            }
         }
         break;
      }
      /*
      case SpecifierClass:
      {
         break;
      }*/
   }
}

static bool ProcessBracketInst_DataMember(DataMember parentMember, Instantiation inst, OldList list)
{
   Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
   DataMember dataMember = null;
   bool someMemberSet = false;

   // For simple classes, ensure all members are initialized
   for(dataMember = parentMember.members.first; dataMember; dataMember = dataMember.next)
   {
      MembersInit members;
      MemberInit member = null;

      if(!dataMember.name && (dataMember.type == unionMember || dataMember.type == structMember))
      {
         if(!ProcessBracketInst_DataMember(dataMember, inst, list))
            return false;
      }
      else 
      {
         Class curClass = null;
         DataMember curMember = null;
         DataMember subMemberStack[256];
         int subMemberStackPos = 0;
         bool found = false;

         if(inst.members && inst.members->first)
         {
            for(members = inst.members->first; members; members = members.next)
            {
               if(members.type == dataMembersInit)
               {
                  for(member = members.dataMembers->first; member; member = member.next)
                  {
                     if(member.identifiers)
                     {
                        Identifier firstID = member.identifiers->first;

                        DataMember _subMemberStack[256];
                        int _subMemberStackPos = 0;
                        DataMember thisMember;
                        thisMember = firstID ? (DataMember)eClass_FindProperty(classSym.registered, firstID.string, privateModule) : null;
                        // FILL MEMBER STACK
                        if(!thisMember && firstID)
                           thisMember = (DataMember)eClass_FindDataMember(classSym.registered, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                        if(thisMember && thisMember.memberAccess == publicAccess)
                        {
                           curMember = thisMember;
                           curClass = curMember._class;
                           memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                           subMemberStackPos = _subMemberStackPos;
                        }
                        /*
                        BTNamedLink link = parentMember.membersAlpha.Find((uintptr)firstID.string);
                        if(link)
                        {
                           curMember = link.data;
                        }

                        // Choose the first specified member of the union...
                        if(parentMember.type == unionMember)
                        {
                           if(link)
                              dataMember = curMember;
                        }
                        */

                        if(dataMember == thisMember)
                        {
                           // Look for another member of this one and merge them
                           // into one instantiation...
                           if(member.identifiers->count > 1 && member.initializer && member.initializer.type == expInitializer)
                           {
                              OldList * partList = MkList();
                              // TODO: We're assuming this is a simple class right now...
                              Symbol symbol;
                              Specifier spec;
                              MembersInit nextMembers;
                              MemberInit next = member.next;

                              if(!dataMember.dataType)
                                 dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
                              symbol = (dataMember.dataType && dataMember.dataType.kind == classType) ? dataMember.dataType._class : null;
                              spec = _MkSpecifierName/*MkClassName*/(dataMember.dataTypeString, symbol, null);

                              {
                                 OldList * identifiers = MkList();
                                 Identifier id;
                                 for(id = ((Identifier)member.identifiers->first).next; id; id = id.next)
                                    identifiers->Add(CopyIdentifier(id));

                                 // *** THE IDENTIFIERS WERE BEING REUSED, CAUSING A CRASH WITH EXPRESSION TEMPLATE CODE IN pass1.ec ***
                                 // members->Add(MkMemberInit(ids, MkInitializerAssignment(MkExpConstant(ui64String))));
                                 /*member.identifiers->Remove(firstID);*/
                                 ListAdd(partList, 
                                    MkMemberInit(/*member.identifiers*/identifiers, MkInitializerAssignment(member.initializer.exp)));
                              }
                          
                              for(nextMembers = members; nextMembers; nextMembers = nextMembers.next)
                              {
                                 if(!nextMembers.dataMembers)
                                    continue;

                                 if(members != nextMembers) next = nextMembers.dataMembers->first;

                                 if(nextMembers.type == dataMembersInit)
                                 {
                                    MemberInit nextMember;

                                    for(nextMember = next; nextMember;
                                        nextMember = next, next = nextMember ? nextMember.next : null)
                                    {
                                       Identifier nextID = nextMember.identifiers->first;
                                       if(nextMember.identifiers && 
                                          nextMember.identifiers->count > 1 &&
                                          !strcmp(firstID.string, nextID.string))
                                       {
                                          nextMembers.dataMembers->Remove(nextMember);
                                          nextMember.identifiers->Remove(nextID);
                                          ListAdd(partList, nextMember);
                                       }
                                    }
                                 }
                              }

                              member.initializer.exp = MkExpInstance(MkInstantiation(spec, null, 
                                 MkListOne(MkMembersInitList(partList))));
                           }
                           found = true;
                           break;
                        }
                     }
                     else
                     {
                        eClass_FindNextMember(classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                        if(curMember == dataMember)
                        {
                           found = true;
                           break;
                        }

                        /*
                        if(curMember)
                           curMember = curMember.next;
                        else
                           curMember = parentMember.members.first;

                        if(curMember == dataMember)
                        {
                           found = true;
                           break;
                        }
                        */
                     }
                  }
               }
               if(found) break;
            }
         }

         if(member && member.initializer && member.initializer.type == expInitializer)
         {
            Expression memberExp = null;
            if(member.initializer.exp.type == instanceExp && member.initializer.exp.expType &&
               member.initializer.exp.expType._class.registered.type == structClass)
            {
               OldList * subList = MkList();
               ProcessBracketInst(member.initializer.exp.instance, subList);
               FreeExpression(member.initializer.exp);
               ListAdd(list, MkInitializerList(subList));
            }
            else
            {
               member.initializer.exp.usage.usageGet = true;
               ProcessExpression(member.initializer.exp);
               ListAdd(list, MkInitializerAssignment(member.initializer.exp));
            }
            member.initializer.exp = null;
            FreeInitializer(member.initializer);
            member.initializer = null;
            someMemberSet = true;
         }
         else if(member && member.initializer && member.initializer.type == listInitializer)
         {
            ListAdd(list, member.initializer);
            member.initializer = null;
            someMemberSet = true;
         }
         else if(dataMember && dataMember.dataTypeString/* && !inst.fullSet*/ && parentMember.type != unionMember)
         {
            Symbol classSym;
            if(!dataMember.dataType)
               dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
            classSym = (dataMember.dataType && dataMember.dataType.kind == classType) ? dataMember.dataType._class : null; // FindClass(dataMember.dataTypeString);
            if(classSym && classSym.registered && classSym.registered.type == structClass)
            {
               OldList * subList = MkList();
               Specifier spec = _MkSpecifierName/*MkClassName*/(dataMember.dataTypeString, classSym, null); 
               Instantiation inst = MkInstantiation(spec, null, null);
               ProcessBracketInst(inst, subList);
               FreeInstance(inst);

               ListAdd(list, MkInitializerList(subList));
            }
            else
               ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
         }
      }
      /*
      if(parentMember.type == unionMember)
         break;
      */
   }
   // TESTING THIS NEW CODE FOR ANCHORS...
   if(parentMember.type == unionMember && !someMemberSet)
   {
      Symbol classSym;
      dataMember = parentMember.members.first;
      if(!dataMember.dataType && dataMember.dataTypeString)
         dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
      classSym = (dataMember.dataType && dataMember.dataType.kind == classType) ? dataMember.dataType._class : null; // FindClass(dataMember.dataTypeString);
      if(classSym && classSym.registered && classSym.registered.type == structClass)
      {
         OldList * subList = MkList();
         Specifier spec = _MkSpecifierName/*MkClassName*/(dataMember.dataTypeString, classSym, null); 
         Instantiation inst = MkInstantiation(spec, null, null);
         ProcessBracketInst(inst, subList);
         FreeInstance(inst);

         ListAdd(list, MkInitializerList(subList));
      }
      else
         ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
   }
   return true;
}

static bool ProcessBracketInst(Instantiation inst, OldList list)
{
   static int recursionCount = 0;
   Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
   Class _class = null;

   if(recursionCount > 500) return false;
   recursionCount++;

   while(_class != classSym.registered)
   {
      DataMember dataMember;
      Class lastClass = _class;

      for(_class = classSym.registered; _class.base != lastClass && _class.base.type != systemClass; _class = _class.base);

      for(dataMember = _class.membersAndProperties.first; dataMember; dataMember = dataMember.next)
      {
         if(!dataMember.isProperty && !dataMember.name && (dataMember.type == unionMember || dataMember.type == structMember))
         {
            if(!ProcessBracketInst_DataMember(dataMember, inst, list))
            {
               recursionCount--;
               return false;
            }
         }
         else 
         {
            MembersInit members;
            MemberInit member = null;
            bool found = false;

            if(inst.members && inst.members->first)
            {
               DataMember curMember = null;
               Class curClass = null;
               DataMember subMemberStack[256];
               int subMemberStackPos = 0;

               for(members = inst.members->first; members; members = members.next)
               {
                  if(members.type == dataMembersInit)
                  {
                     for(member = members.dataMembers->first; member; member = member.next)
                     {
                        Identifier firstID = member.identifiers ? member.identifiers->first : null;
                        if(firstID)
                        {
                           DataMember _subMemberStack[256];
                           int _subMemberStackPos = 0;
                           DataMember thisMember = (DataMember)eClass_FindProperty(classSym.registered, firstID.string, privateModule);
                           // FILL MEMBER STACK
                           if(!thisMember)
                              thisMember = (DataMember)eClass_FindDataMember(classSym.registered, firstID.string, privateModule, _subMemberStack, &_subMemberStackPos);
                           if(thisMember)
                           {
                              curMember = thisMember;
                              curClass = curMember._class;
                              memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                              subMemberStackPos = _subMemberStackPos;
                           }

                           if(curMember == dataMember)
                           {
                              if(dataMember.isProperty)
                              {
                                 if(!((Property)dataMember).Set) 
                                 {
                                    Compiler_Error($"No set defined for property %s\n", dataMember.name);
                                    continue;
                                 }
                                 recursionCount--;
                                 return false;
                              }

                              // Look for another member of this one and merge them
                              // into one instantiation...
                              if(member.identifiers->count > 1 && member.initializer && member.initializer.type == expInitializer)
                              {
                                 OldList * partList = MkList();
                                 // TODO: We're assuming this is a simple _class right now...
                                 Specifier spec;
                                 MembersInit nextMembers;
                                 MemberInit next = member.next;
                                 Symbol symbol;
                                 if(!dataMember.dataType)
                                    dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
                                 symbol = (dataMember.dataType && dataMember.dataType.kind == classType) ? dataMember.dataType._class : null;
                                 spec = _MkSpecifierName/*MkClassName*/(dataMember.dataTypeString, symbol, null); 

                                 member.identifiers->Remove(firstID);
                                 ListAdd(partList, 
                                    MkMemberInit(member.identifiers, MkInitializerAssignment(member.initializer.exp)));

                                 for(nextMembers = members; nextMembers; nextMembers = nextMembers.next)
                                 {
                                    if(!nextMembers.dataMembers) continue;

                                    if(members != nextMembers) next = nextMembers.dataMembers->first;

                                    if(nextMembers.type == dataMembersInit)
                                    {
                                       MemberInit nextMember;

                                       for(nextMember = next; nextMember;
                                           nextMember = next, next = nextMember ? nextMember.next : null)
                                       {
                                          Identifier nextID = nextMember.identifiers->first;
                                          if(nextMember.identifiers && 
                                             nextMember.identifiers->count > 1 &&
                                             !strcmp(firstID.string, nextID.string))
                                          {
                                             nextMembers.dataMembers->Remove(nextMember);
                                             nextMember.identifiers->Remove(nextID);
                                             ListAdd(partList, nextMember);
                                          }
                                       }
                                    }
                                 }

                                 member.initializer.exp = MkExpInstance(MkInstantiation(spec, null, 
                                    MkListOne(MkMembersInitList(partList))));

                                 // TESTING THIS
                                 member.identifiers = null;
                              }
                              found = true;
                              break;
                           }
                        }
                        else
                        {
                           eClass_FindNextMember(classSym.registered, &curClass, &curMember, subMemberStack, &subMemberStackPos);
                           if(curMember == dataMember)
                           {
                              if(dataMember.isProperty)
                              {
                                 if(!((Property)dataMember).Set) 
                                 {
                                    Compiler_Error($"No set defined for property %s\n", dataMember.name);
                                    continue;
                                 }
                                 recursionCount--;
                                 return false;
                              }
                              found = true;
                              break;
                           }
                        }
                     }
                  }
                  if(found) break;
               }
            }

            if(dataMember.isProperty) continue;
            if(member && member.initializer && member.initializer.type == expInitializer)
            {
               Expression memberExp = null;
               if(member.initializer.exp.type == instanceExp && member.initializer.exp.expType &&
                  member.initializer.exp.expType._class && member.initializer.exp.expType._class.registered && member.initializer.exp.expType._class.registered.type == structClass)
               {
                  OldList * subList = MkList();
                  ProcessBracketInst(member.initializer.exp.instance, subList);
                  FreeExpression(member.initializer.exp);
                  member.initializer.exp = null;
                  ListAdd(list, MkInitializerList(subList));
               }
               else
               {
                  member.initializer.exp.usage.usageGet = true;
                  ProcessExpression(member.initializer.exp);
                  ListAdd(list, MkInitializerAssignment(CopyExpression(member.initializer.exp)));
               }

               // Take this out
               // member.exp = null;
               member.takeOutExp = true;
            }
            else if(member && member.initializer && member.initializer.type == listInitializer)
            {
               ListAdd(list, member.initializer);
               member.initializer = null;
            }
            else if(dataMember && dataMember.dataTypeString/* && !inst.fullSet*/)
            {
               Symbol classSym;

               if(!dataMember.dataType)
                  dataMember.dataType = ProcessTypeString(dataMember.dataTypeString, false);
               classSym = (dataMember.dataType && dataMember.dataType.kind == classType) ? dataMember.dataType._class : null; // FindClass(dataMember.dataTypeString);

               if(classSym && classSym.registered && classSym.registered.type == structClass)
               {
                  OldList * subList = MkList();
                  Specifier spec = _MkSpecifierName/*MkClassName*/(dataMember.dataTypeString, classSym, null); 
                  Instantiation inst = MkInstantiation(spec, null, null);
                  ProcessBracketInst(inst, subList);
                  FreeInstance(inst);
                  ListAdd(list, MkInitializerList(subList));
               }
               else if(dataMember.dataType.kind == arrayType)
                  ListAdd(list, MkInitializerList(MkListOne(MkInitializerAssignment(MkExpConstant("0")))));
               else
                  ListAdd(list, MkInitializerAssignment(MkExpConstant("0")));
            }
         }
      }
   }

   if(inst.members && inst.members->first)
   {
      MembersInit members;
      MemberInit member = null;

      for(members = inst.members->first; members; members = members.next)
      {
         if(members.type == dataMembersInit)
         {
            for(member = members.dataMembers->first; member; member = member.next)
            {
               if(member.takeOutExp)
               {
                  FreeInitializer(member.initializer);
                  member.initializer = null;
               }
            }
         }
      }
   }
   recursionCount--;
   return true;
}

static Declaration curDecl;
static int declTempCount;

static void ProcessDeclaration(Declaration decl)
{
   yylloc = decl.loc;
   switch(decl.type)
   {
      case initDeclaration:
      {
         if(!curDecl) { curDecl = decl; declTempCount = 0; }
         if(decl.specifiers)
         {
            Specifier s;
            for(s = decl.specifiers->first; s; s = s.next)
            {
               ProcessSpecifier(s);
            }
         }
         if(decl.declarators)
         {
            InitDeclarator d;

            for(d = decl.declarators->first; d; d = d.next)
            {
              if(d.initializer)
                  ProcessInitializer(d.initializer);
            }
         }
         if(curDecl == decl) { curDecl = null; declTempCount = 0; }
         break;
      }
      case instDeclaration:
      {
         Instantiation inst = decl.inst;
         
         if(inCompiler)
         {
            Symbol classSym = inst._class.symbol; // FindClass(inst._class.name);
            if(!curCompound)
            {
               Statement stmt;

               if(!inst.isConstant || (classSym && classSym.registered && (classSym.registered.type == normalClass || classSym.registered.type == noHeadClass)))
               {
                  // If this instantiation is outside, turn it into a declaration plus an instantiation expression
                  decl.type = initDeclaration;
                  decl.specifiers = MkListOne(MkSpecifierName/*MkClassName*/(inst._class.name));
                  if(decl.declMode == staticAccess)
                  {
                     decl.specifiers->Insert(null, MkSpecifier(STATIC));
                  }
                  decl.declarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(inst.exp.identifier.string)), null));

                  ProcessDeclaration(decl);
                  CreateInstancesBody();

                  {
                     Expression exp = MkExpInstance(inst);
                     stmt = MkExpressionStmt(MkListOne(exp));       // MkExpOp(inst.exp, '=',
                     ListAdd(createInstancesBody.compound.statements, stmt);
                     ProcessExpressionType(exp);
                  }

                  if(classSym && classSym.registered && (classSym.registered.type == normalClass))
                  {
                     ListAdd(createInstancesBody.compound.statements, 
                        MkExpressionStmt(MkListOne(MkExpCall(
                           MkExpIdentifier(MkIdentifier("ecere::com::eInstance_IncRef")),
                           MkListOne(CopyExpression(inst.exp))))));

                     // We'd like the = 0 as well...
                     {
                        Expression exp = MkExpOp(null, DELETE, CopyExpression(inst.exp));
                        ListAdd(destroyInstancesBody.compound.statements, MkExpressionStmt(MkListOne(exp)));
                        ProcessExpressionType(exp);
                     }
                  }
                  else if(classSym && classSym.registered && (classSym.registered.type == noHeadClass))
                  {
                     Expression exp = MkExpOp(null, DELETE, CopyExpression(inst.exp));
                     ListAdd(destroyInstancesBody.compound.statements, MkExpressionStmt(MkListOne(exp)));
                     ProcessExpressionType(exp);
                  }
                  break;
               }
               else
               {
                  // Precompiler won't know if this isn't constant
                  CreateInstancesBody();
               }
            }
         
            {
               char className[1024];
               
               decl.type = initDeclaration;
               decl.specifiers = MkList();
               decl.declarators = MkList();
      
               // Replace instantiation here
               if(classSym && classSym.registered && classSym.registered.type == bitClass)
               {
                  OldList list = { 0 };

                  // Put the instantiation in an InitDeclarator...
                  ProcessInstMembers(inst, inst.exp, &list, false);
                  ProcessExpression(inst.exp);

                  ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                  ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst.exp.identifier),
                     MkInitializerAssignment(list.first)));
                  inst.exp.identifier = null;
               }
               else if(classSym && classSym.registered && classSym.registered.type == unitClass)
               {
                  OldList list = { 0 };

                  // Put the instantiation in an InitDeclarator...
                  ProcessInstMembers(inst, inst.exp, &list, false);
                  ProcessExpression(inst.exp);

                  ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                  ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst.exp.identifier),
                     MkInitializerAssignment(list.first)));

                  inst.exp.identifier = null;
               }
               else if(classSym && classSym.registered && classSym.registered.type == structClass)
               {
                  Expression exp;

                  DeclareStruct(inst._class.name, false);
                  /*{
                     strcpy(className, "__ecereClass_");
                     FullClassNameCat(className, classSym.string, true);
                     MangleClassName(className);
                     DeclareClass(classSym, className);
                  }*/

                  ProcessExpression(inst.exp);

                  // Put the instantiation in an InitDeclarator...
                  {
                     if(inst.fullSet)
                     {
                        ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                        ListAdd(decl.declarators, 
                           MkInitDeclarator(MkDeclaratorIdentifier(inst.exp.identifier), null));
                        inst.exp.identifier = null;
                     }
                     else 
                     {
                        OldList * list = MkList();
                        if(ProcessBracketInst(inst, list))
                        {
                           ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                           ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst.exp.identifier),
                              MkInitializerList(list)));
                           inst.exp.identifier = null;
                        }
                        else
                        {
                           // If bracket instantiation failed (property: for conversions only?)
                           // TODO: (Fix this so it initializes members through brackets,
                           //        and then does properties)
                           //list->Free(null);
                           //delete list;
                           // TESTING THIS MEMORY LEAK FIX:
                           FreeList(list, FreeInitializer);

                           exp = MkExpBrackets(MkList());
                           ProcessInstMembers(inst, inst.exp, exp.list, true);
                           ListAdd(exp.list, CopyExpression(inst.exp));
                           ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                           ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(inst.exp.identifier),
                              MkInitializerAssignment(exp)));
                           inst.exp.identifier = null;
                        }
                     }
                  }
               }
               else
               {
                  Expression newCall;

                  if(classSym && classSym.registered && classSym.registered.type == noHeadClass && 
                     (classSym.registered.templateClass ? classSym.registered.templateClass.fixed : classSym.registered.fixed))
                  {
                     char size[256];
                     sprintf(size, "%d", classSym.registered.templateClass ? classSym.registered.templateClass.structSize : classSym.registered.structSize);
                     newCall = MkExpCall(QMkExpId("ecere::com::eSystem_New0"), MkListOne(MkExpConstant(size)));
                  }
                  else
                  {
                     strcpy(className, "__ecereClass_");

                     if(classSym && classSym.registered && classSym.registered.type == noHeadClass && classSym.registered.templateClass)
                     {
                        classSym = FindClass(classSym.registered.templateClass.fullName);
                        FullClassNameCat(className, classSym.string, true);
                     }
                     else
                        FullClassNameCat(className, inst._class.name, true);
                     MangleClassName(className);

                     DeclareClass(classSym, className);   // THIS WAS IN C VERSION BUT NOT IN eC VERSION?
                     newCall = MkExpCall(QMkExpId("ecere::com::eInstance_New"), MkListOne(QMkExpId(className)));
                     ProcessExpressionType(newCall);
                     newCall.byReference = true;
                  }

                  if(classSym)
                     DeclareClass(classSym, className);

                  if(inst.exp)
                  {
                     Expression exp, newExp;
                     Identifier id = CopyIdentifier(inst.exp.identifier);

                     // Put the instantiation in an InitDeclarator...
                     if(inst.members && inst.members->first)
                     {
                        newExp = MkExpOp(CopyExpression(inst.exp), '=', newCall);

                        exp = MkExpBrackets(MkList());
                        ListAdd(exp.list, newExp);
                        ProcessInstMembers(inst, inst.exp, exp.list, false);
                        ListAdd(exp.list, inst.exp);

                        ProcessExpression(inst.exp);

                        // Take it out since we're using it...
                        inst.exp = null;
                     }
                     else
                        exp = newCall;

                     ListAdd(decl.specifiers, MkSpecifierName/*MkClassName*/(inst._class.name));
                     ListAdd(decl.declarators, MkInitDeclarator(MkDeclaratorIdentifier(id),
                        MkInitializerAssignment(exp)));
                     //inst.exp.identifier = null;
                  }
                  else
                     FreeExpression(newCall);
               }
            }
            FreeInstance(inst);
         }
         else
            ProcessInstantiation(inst);
         break;
      }
      case structDeclaration:
      {
         if(decl.specifiers)
         {
            Specifier spec;
            for(spec = decl.specifiers->first; spec; spec = spec.next)
               ProcessSpecifier(spec);
         }
         break;
      }
   }
}

static void ProcessStatement(Statement stmt)
{
   yylloc = stmt.loc;
   switch(stmt.type)
   {
      case labeledStmt:
         if(stmt.labeled.stmt)
            ProcessStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         if(stmt.caseStmt.exp)
            ProcessExpression(stmt.caseStmt.exp);
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
               {
                  ProcessStatement(s);
               }
            }

            curCompound = prevCompound;
            curContext = prevContext;
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
         Expression exp;

         ((Expression)stmt.ifStmt.exp->last).usage.usageGet = true;
         for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
         {
            ProcessExpression(exp);
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
         ((Expression)stmt.switchStmt.exp->last).usage.usageGet = true;
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
            ProcessExpression(exp);
         ProcessStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         if(stmt.whileStmt.exp)
         {
            Expression exp;

            ((Expression)stmt.whileStmt.exp->last).usage.usageGet = true;
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
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

         if(stmt.forStmt.check && stmt.forStmt.check.expressions)
         {
            ((Expression)stmt.forStmt.check.expressions->last).usage.usageGet = true;
         }

         if(stmt.forStmt.check)
            ProcessStatement(stmt.forStmt.check);
         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
               ProcessExpression(exp);
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
         if(stmt.expressions && stmt.expressions->last)
         {
            ((Expression)stmt.expressions->last).usage.usageGet = true;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
            {
               ProcessExpression(exp);
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
   {
      yylloc = function.loc;
      ProcessStatement(function.body);
   }
}

/////////// INSTANTIATIONS / DATA TYPES PASS /////////////////////////////////////////////
public void ProcessInstantiations()
{
   External external;
   // Is this still needed?
   //CreateInstancesBody();
   
   for(external = ast->first; external; external = external.next)
   {
      curExternal = external;
      if(external.type == declarationExternal)
      {
         //currentClass = external.function._class;
         if(external.declaration)
            ProcessDeclaration(external.declaration);
      }
      else if(external.type == functionExternal)
      {
         //currentClass = null;
         ProcessFunction(external.function);
      }
      else if(external.type == classExternal)
      {
         ClassDefinition _class = external._class;
         //currentClass = external.symbol.registered;
         if(_class.definitions)
         {
            ClassDef def;
            //Class regClass = _class.symbol.registered;

            // Process all functions
            for(def = _class.definitions->first; def; def = def.next)
            {
               if(def.type == functionClassDef)
               {
                  curExternal = def.function.declarator ? def.function.declarator.symbol.pointerExternal : external;
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
                     type = MkClassTypeSymbol(_class.symbol); //regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);
                  
                  for(defProperty = def.defProperties->first; defProperty; defProperty = defProperty.next)
                  {
                     //thisClass = regClass;
                     ProcessMemberInitData(defProperty); ///*, regClass, &id
                     //thisClass = null;
                  }

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
                     type = MkClassTypeSymbol(_class.symbol); //regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);
                  
                  //thisClass = regClass;
                  if(prop.setStmt)
                  {
                     curExternal = prop.symbol ? prop.symbol.externalSet : null;
                     ProcessStatement(prop.setStmt);
                  }
                  if(prop.getStmt)
                  {
                     curExternal = prop.symbol ? prop.symbol.externalGet : null;
                     ProcessStatement(prop.getStmt);
                  }
                  if(prop.issetStmt)
                  {
                     curExternal = prop.symbol ? prop.symbol.externalIsSet : null;
                     ProcessStatement(prop.issetStmt);
                  }
                  //thisClass = null;

                  globalContext.symbols.Remove((BTNode)thisSymbol);
                  FreeSymbol(thisSymbol);
               }
               else if(def.type == propertyWatchClassDef && def.propertyWatch)
               {
                  PropertyWatch propertyWatch = def.propertyWatch;
        
                  // Add this to the context
                  Symbol thisSymbol
                  {
                     string = CopyString("this");
                     type = MkClassTypeSymbol(_class.symbol); //regClass.fullName);
                  };
                  globalContext.symbols.Add((BTNode)thisSymbol);
                  
                  //thisClass = regClass;
                  if(propertyWatch.compound)
                  {
                     Symbol thisSymbol
                     {
                        string = CopyString("this");
                        type = MkClassTypeSymbol(_class.symbol); //regClass.fullName);
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
