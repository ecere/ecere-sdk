import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

extern External curExternal;
///////////////// INSTANCE DECLARATION PASS ///////////////////////

// Returns true if we should add a * to the declarator
static int ReplaceClassSpec(OldList specs, Specifier spec, bool param)
{
   if(spec.type == templateTypeSpecifier)
   {
      TemplateParameter parameter = spec.templateParameter;

      if(!param && parameter.dataTypeString)
      {
         OldList * newSpecs = MkList();
         Declarator decl = SpecDeclFromString(parameter.dataTypeString, newSpecs, null);
         if(newSpecs->first)
         {
            Specifier newSpec = CopySpecifier(newSpecs->first);
            *spec = *newSpec;
            delete newSpec;
         }
         FreeList(newSpecs, FreeSpecifier);

         if(decl)
         {
            bool isPointer = decl.type == pointerDeclarator;
            if(decl)
               FreeDeclarator(decl);
            if(isPointer)
               return 1;
         }
      }
      else if(!param && parameter.dataType)
      {
         OldList * newSpecs = parameter.dataType.specifiers;
         Declarator decl = parameter.dataType.decl;
         if(newSpecs->first)
         {
            Specifier newSpec = CopySpecifier(newSpecs->first);
            *spec = *newSpec;
            delete newSpec;
         }

         if(decl)
         {
            bool isPointer = decl.type == pointerDeclarator;
            if(isPointer)
               return 1;
         }
      }
      else
      {
         spec.type = nameSpecifier;
         spec.name = CopyString("uint64");
         spec.symbol = FindClass("uint64");
      }
   }

   if(spec.type == nameSpecifier || spec.type == subClassSpecifier)
   {
      // TODO: Apply more care because nameSpecifier / subClassSpecifier use different parts of the union!
      Symbol classSym = spec.symbol;
      if(spec.type == subClassSpecifier)
      {
         classSym = FindClass("ecere::com::Class");
      }

      if(classSym)
      {
         Class _class = classSym.registered;

         FreeSpecifierContents(spec);

         spec.type = nameSpecifier;
         if(_class && _class.type == structClass)
         {
            //Externalexternal;
            char name[1024];
            name[0] = 0;
            FullClassNameCat(name, _class.fullName, false);
            FreeSpecifierContents(spec);
            spec.type = structSpecifier;
            spec.baseSpecs = null;
            spec.id = MkIdentifier(name);
            spec.list = null;
            spec.definitions = null;
            spec.ctx = null;
            spec.addNameSpace = false;
         }
         else if(_class && _class.type == noHeadClass)
         {
            char name[1024] = "";
            FullClassNameCat(name, _class.fullName, false);
            spec.type = structSpecifier;
            spec.baseSpecs = null;
            spec.id = MkIdentifier(name);
            spec.list = null;
            spec.definitions = null;
            spec.ctx = null;
            spec.addNameSpace = false;
         }
         else if(_class)
         {
            if((_class.type != systemClass ||
               !strcmp(_class.fullName, "enum") ||
               (_class.dataTypeString && !strcmp(_class.dataTypeString, "char *")) ||
               //strcmp(_class.fullName, "bool") &&
               !strcmp(_class.fullName, "uint64") ||
               !strcmp(_class.fullName, "uint32") ||
               !strcmp(_class.fullName, "uint16") ||
               !strcmp(_class.fullName, "uintptr") ||
               !strcmp(_class.fullName, "intptr") ||
               !strcmp(_class.fullName, "uintsize") ||
               !strcmp(_class.fullName, "intsize") ||
               !strcmp(_class.fullName, "uint") ||
               !strcmp(_class.fullName, "byte")))
            {
               if(_class.dataTypeString)
               {
                  if(!strcmp(_class.dataTypeString, "uint64") ||
                     !strcmp(_class.dataTypeString, "uint32") ||
                     !strcmp(_class.dataTypeString, "uint16") ||
                     !strcmp(_class.dataTypeString, "uintptr") ||
                     !strcmp(_class.dataTypeString, "intptr") ||
                     !strcmp(_class.dataTypeString, "uintsize") ||
                     !strcmp(_class.dataTypeString, "intsize") ||
                     !strcmp(_class.dataTypeString, "uint") ||
                     !strcmp(_class.dataTypeString, "byte"))
                  {
                     if(!_class.dataType)
                        _class.dataType = ProcessTypeString(_class.dataTypeString, false);
                     if(_class.dataType && _class.dataType.kind == classType)
                        classSym = _class.dataType._class;
                     else
                        classSym = FindClass(_class.dataTypeString);
                     _class = classSym ? classSym.registered : null;
                  }

                  spec.name = CopyString(!strcmp(_class.dataTypeString, "char *") ? "char" : _class.dataTypeString);
                  spec.symbol = null;
               }
               else
               {
                  spec.name = CopyString(null);
                  spec.symbol = null;
               }
            }
            else if(!_class.base)
            {
               spec.type = baseSpecifier;
               spec.specifier = VOID;
               return 1;
            }
         }
         else
         {
            spec.type = structSpecifier;
            spec.id = MkIdentifier("__ecereNameSpace__ecere__com__Instance");
            spec.list = null;
            spec.baseSpecs = null;
            spec.definitions = null;
            spec.ctx = null;
            spec.addNameSpace = false;
         }

         if(_class && _class.dataTypeString && !strcmp(_class.dataTypeString, "char *"))
            return 1; //false;
         if(!_class || _class.type == normalClass || _class.type == noHeadClass)
            return 1;
         else if(param && _class.type == structClass)
            return 2;
      }
   }
   else if(spec.type == baseSpecifier)
   {
      if(spec.specifier == ANY_OBJECT || spec.specifier == CLASS)
      {
         spec.specifier = CONST;
         specs.Add(MkSpecifier(VOID));
         return 1;
      }
   }
   return 0;
}

static void ReplaceByInstancePtr(Specifier spec, Declarator * declPtr, int type)
{
   Declarator decl = *declPtr;
   if(decl && decl.type == pointerDeclarator)
   {
      // Pointers to simple classes shouldn't be added pointers
      if(type == 2);
      else
      // Add pointer
         decl.pointer.pointer = MkPointer(null, decl.pointer.pointer);
   }
   else
   {
      Declarator newDecl { };
      if(decl)
      {
         *newDecl = *decl;
         decl.declarator = newDecl;
      }
      else
         decl = newDecl;
      decl.type = pointerDeclarator;
      decl.pointer.pointer = MkPointer(null, null);
      *declPtr = decl;
   }
}

static void InstDeclPassSpecifier(Specifier spec, bool byRefTypedObject)
{
   switch(spec.type)
   {
      case baseSpecifier:
         if(spec.specifier == TYPED_OBJECT)
         {
            spec.type = extendedSpecifier;
            spec.extDecl = MkExtDeclString(CopyString(byRefTypedObject ?
               "struct __ecereNameSpace__ecere__com__Class * class, void *" :
               "struct __ecereNameSpace__ecere__com__Class * class, const void *"));
            DeclareStruct(curExternal, "ecere::com::Class", false, true);
         }
         break;
      case nameSpecifier:
         break;
      case enumSpecifier:
      {
         Enumerator e;
         if(spec.list)
         {
            for(e = spec.list->first; e; e = e.next)
            {

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
            for(def = spec.definitions->first; def; def = def.next)
               if(def.decl)
                  InstDeclPassDeclaration(def.decl);
         }
         if(spec.id)
            InstDeclPassIdentifier(spec.id);
         break;
      }
      case extendedSpecifier:
         if(spec.extDecl && spec.extDecl.type == extDeclString && spec.extDecl.s)
         {
            if(!strcmp(spec.extDecl.s, "dllexport"))
            {
               Specifier prevSpec;
               delete spec.extDecl.s;
               for(prevSpec = spec.prev; prevSpec; prevSpec = prevSpec.prev)
                  if(prevSpec.type == baseSpecifier && prevSpec.specifier == EXTERN)
                     break;
               if(prevSpec)
               {
                  if(targetPlatform == win32)
                     spec.extDecl.s = CopyString("__declspec(dllexport)");
                  else
                     spec.extDecl.s = CopyString("__attribute__ ((visibility(\"default\")))");
               }
               else
               {
                  if(targetPlatform == win32)
                     spec.extDecl.s = CopyString("extern __declspec(dllexport)");
                  else
                     spec.extDecl.s = CopyString("extern __attribute__ ((visibility(\"default\")))");
               }
            }
            else if(!strcmp(spec.extDecl.s, "stdcall") || !strcmp(spec.extDecl.s, "_stdcall") ||
               !strcmp(spec.extDecl.s, "__stdcall") || !strcmp(spec.extDecl.s, "__stdcall__"))
            {
               delete spec.extDecl.s;
               spec.extDecl.s = CopyString("ecere_stdcall");
            }
         }
         break;
   }
}

static void InstDeclPassDeclarator(Declarator decl)
{
   switch(decl.type)
   {
      case structDeclarator:
         if(decl.declarator)
            InstDeclPassDeclarator(decl.declarator);
         break;
      case identifierDeclarator:
      {
         if(decl.identifier)
            InstDeclPassIdentifier(decl.identifier);
         break;
      }
      case bracketsDeclarator:
         if(decl.declarator)
            InstDeclPassDeclarator(decl.declarator);
         break;
      case arrayDeclarator:
         if(decl.declarator)
            InstDeclPassDeclarator(decl.declarator);
         break;
      case functionDeclarator:
      {
         if(decl.declarator)
            InstDeclPassDeclarator(decl.declarator);
         if(decl.function.parameters)
         {
            TypeName type;
            if(decl.declarator)
               InstDeclPassDeclarator(decl.declarator);
            for(type = decl.function.parameters->first; type; type = type.next)
            {
               bool typedObject = false;
               Specifier spec = null;
               if(type.qualifiers)
               {
                  spec = (Specifier)type.qualifiers->first;
                  if(spec && spec.type == nameSpecifier && spec.name && !strcmp(spec.name, "class"))
                     typedObject = true;
               }

               InstDeclPassTypeName(type, true);
               if(typedObject)
               {
                  TypeName _class
                  {
                     qualifiers = MkListOne(MkStructOrUnion(structSpecifier, MkIdentifier("__ecereNameSpace__ecere__com__Class"), null));
                     declarator = MkDeclaratorPointer(MkPointer(null,null), MkDeclaratorIdentifier(MkIdentifier("class")));
                  };
                  DeclareStruct(curExternal, "ecere::com::Class", false, true);
                  decl.function.parameters->Insert(spec.prev, _class);
               }
            }
         }
         break;
      }
      case pointerDeclarator:
      case extendedDeclarator:
      case extendedDeclaratorEnd:
         if((decl.type == extendedDeclarator || decl.type == extendedDeclaratorEnd) && decl.extended.extended)
         {
            if(decl.extended.extended.type == extDeclString && decl.extended.extended.s && !strcmp(decl.extended.extended.s, "dllexport"))
            {
               delete decl.extended.extended.s;
               if(targetPlatform == win32)
                  decl.extended.extended.s = CopyString("extern __declspec(dllexport)");
               else
                  decl.extended.extended.s = CopyString("extern __attribute__ ((visibility(\"default\")))");
            }
            else if(decl.extended.extended.type == extDeclString && decl.extended.extended.s &&
               (!strcmp(decl.extended.extended.s, "stdcall") || !strcmp(decl.extended.extended.s, "_stdcall") ||
               !strcmp(decl.extended.extended.s, "__stdcall") || !strcmp(decl.extended.extended.s, "__stdcall__")))
            {
               delete decl.extended.extended.s;
               decl.extended.extended.s = CopyString("ecere_stdcall");
            }
         }
         if(decl.declarator)
            InstDeclPassDeclarator(decl.declarator);
         break;
   }
}

/*static */void InstDeclPassTypeName(TypeName type, bool param)
{
   if(type.qualifiers)
   {
      Specifier spec;
      for(spec = type.qualifiers->first; spec; spec = spec.next)
      {
         int result;
         if((result = ReplaceClassSpec(type.qualifiers, spec, param)))
            ReplaceByInstancePtr(spec, &type.declarator, result);
         else
         {
            Symbol classSym = (spec.type == nameSpecifier) ? spec.symbol /*FindClass(spec.name)*/ : null;
            if(type.classObjectType && (!classSym || (classSym && classSym.registered &&
               (classSym.registered.type == enumClass || classSym.registered.type == bitClass || classSym.registered.type == unitClass))))
               ReplaceByInstancePtr(spec, &type.declarator, 2);
         }
         InstDeclPassSpecifier(spec, type.declarator && type.declarator.type == pointerDeclarator);
      }
   }
   if(type.declarator)
      InstDeclPassDeclarator(type.declarator);
}

static void InstDeclPassIdentifier(Identifier id)
{
   if(strchr(id.string, ':'))
   {
      char newID[1024];
      int c;
      char ch;
      int len;
      strcpy(newID, "__ecereNameSpace__");
      len = strlen(newID);

      for(c = 0; (ch = id.string[c]); c++)
      {
         if(ch == ':') ch = '_';

         newID[len++] = ch;
      }
      newID[len] = 0;
      delete id.string;
      id.string = CopyString(newID);
   }
}

/*static */bool IsVoidPtrCast(TypeName typeName)
{
   bool result = false;
   Declarator d = typeName.declarator;
   if(d && d.type == pointerDeclarator && d.pointer.pointer && !d.pointer.pointer.pointer)
   {
      if(typeName.qualifiers)
      {
         Specifier s;
         for(s = typeName.qualifiers->first; s; s = s.next)
         {
            if(s.type == baseSpecifier && s.specifier == VOID)
               result = true;
         }
      }
   }
   return result;
}

static void AddPointerCast(Expression e)
{
   Type src = e.expType;

   if(src && (src.kind == templateType || src.kind == classType))
   {
      if(e.type != castExp || !IsVoidPtrCast(e.cast.typeName))
      {
         if(src) src.refCount++;
         if(src.kind == templateType && src.templateParameter && src.templateParameter.type == type)
         {
            Type newType = null;
            if(src.templateParameter.dataTypeString)
               newType = ProcessTypeString(src.templateParameter.dataTypeString, false);
            else if(src.templateParameter.dataType)
               newType = ProcessType(src.templateParameter.dataType.specifiers, src.templateParameter.dataType.decl);
            if(newType)
            {
               FreeType(src);
               src = newType;
            }
         }
         if(src && src.kind == classType && src._class)
         {
            Class sc = src._class.registered;
            if(src.thisClassFrom && src.thisClassFrom.base)
               sc = src.thisClassFrom;

            if(sc && (sc.type == structClass || sc.type == noHeadClass))
            {
               Type dest = e.destType;

               if(dest && (dest.kind == templateType || dest.kind == classType))
               {
                  if(dest) dest.refCount++;

                  if(dest.kind == templateType && dest.templateParameter && dest.templateParameter.type == type)
                  {
                     Type newType = null;
                     if(dest.templateParameter.dataTypeString)
                        newType = ProcessTypeString(dest.templateParameter.dataTypeString, false);
                     else if(dest.templateParameter.dataType)
                        newType = ProcessType(dest.templateParameter.dataType.specifiers, dest.templateParameter.dataType.decl);
                     if(newType)
                     {
                        FreeType(dest);
                        dest = newType;
                     }
                  }
                  if(!dest.passAsTemplate && dest.kind == classType && dest._class && dest._class.registered)
                  {
                     Class dc = dest._class.registered;

                     if(sc.templateClass) sc = sc.templateClass;
                     if(dc.templateClass) dc = dc.templateClass;
                     if(dc.base && sc != dc)
                     {
                        e.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
                        e.type = castExp;
                        e.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null));
                     }
                  }
                  FreeType(dest);
               }
            }
         }
         FreeType(src);
      }
   }
   else if(src && src.kind == intPtrType && e.destType && e.destType.classObjectType)
   {
      Expression nbExp = GetNonBracketsExp(e);
      if(nbExp.type != castExp || !IsVoidPtrCast(nbExp.cast.typeName))
      {
         e.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
         e.type = castExp;
         e.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null));
      }
   }
}

static void InstDeclPassExpression(Expression exp)
{
   switch(exp.type)
   {
      case identifierExp:
      {
         if(exp.identifier)
            InstDeclPassIdentifier(exp.identifier);
         break;
      }
      case constantExp:
         break;
      case stringExp:
         break;
      case opExp:
         if(exp.op.exp1)
            InstDeclPassExpression(exp.op.exp1);
         if(exp.op.exp2)
         {
            InstDeclPassExpression(exp.op.exp2);
            if(exp.op.op != '=' && exp.op.exp1 && exp.op.exp1.expType && exp.op.exp1.expType.kind == pointerType && exp.op.exp1.expType.type && exp.op.exp1.expType.type.kind == templateType &&
               exp.op.exp2.expType && exp.op.exp2.expType.kind == pointerType && exp.op.exp2.expType.type && exp.op.exp2.expType.type.kind == templateType)
            {
               Expression e = exp.op.exp2;
               e.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
               e.type = castExp;
               e.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null));

               e = exp.op.exp1;
               e.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
               e.type = castExp;
               e.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null));
            }
            else if(exp.op.exp1 && (exp.op.op == '=' || exp.op.op == EQ_OP || exp.op.op == NE_OP))
               AddPointerCast(exp.op.exp2);
         }
         break;
      case extensionExpressionExp:
      case bracketsExp:
      {
         Expression e;
         for(e = exp.list->first; e; e = e.next)
            InstDeclPassExpression(e);
         break;
      }
      case indexExp:
      {
         Expression e;
         InstDeclPassExpression(exp.index.exp);
         for(e = exp.index.index->first; e; e = e.next)
            InstDeclPassExpression(e);
         break;
      }
      case callExp:
      {
         Expression e;
         InstDeclPassExpression(exp.call.exp);
         if(exp.call.arguments)
         {
            for(e = exp.call.arguments->first; e; e = e.next)
            {
               bool addCast = false;
               InstDeclPassExpression(e);
               AddPointerCast(e);

               if(e.expType && e.expType.kind == pointerType && e.expType.type && (e.expType.type.kind == classType || (e.expType.type.kind == pointerType && e.expType.type.type && e.expType.type.type.kind != voidType)) &&
                  e.destType && e.destType.kind == pointerType && e.destType.type && e.destType.type.kind == pointerType && e.destType.type.type && e.destType.type.type.kind == voidType)
                  addCast = true;
               // Fix for adding a cast to Unserialize with a struct passed as a parameter:
               else if(e.expType && e.expType.kind == classType && e.expType._class && e.expType._class.registered && e.expType._class.registered.type == structClass && e.byReference &&
                  e.destType && e.destType.kind == classType && e.destType.classObjectType && e.destType.byReference)
                  addCast = true;

               if(addCast && (e.type != castExp || !IsVoidPtrCast(e.cast.typeName)))
               {
                  e.cast.exp = MkExpBrackets(MkListOne(MoveExpContents(e)));
                  e.type = castExp;
                  e.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), QMkPtrDecl(null));
               }
            }
         }
         break;
      }
      case memberExp:
      {
         if(exp.member.exp)
            InstDeclPassExpression(exp.member.exp);
         break;
      }
      case pointerExp:
      {
         if(exp.member.exp)
            InstDeclPassExpression(exp.member.exp);
         break;
      }
      case typeSizeExp:
         InstDeclPassTypeName(exp.typeName, false);
         break;
      case castExp:
      {
         Type type = exp.expType;
         // Remove casts to simple structs... (Watch out for pointers later...)
         if(type && type.kind == classType && type._class.registered && type._class.registered.type == structClass && !exp.needCast)
         {
            if(exp.destType && exp.destType.classObjectType == typedObject && exp.destType.byReference)
            {
               // For Unserialize with a StaticString
               FreeTypeName(exp.cast.typeName);
               exp.cast.typeName = MkTypeName(MkListOne(MkSpecifier(VOID)), MkDeclaratorPointer(MkPointer(null, MkPointer(null, null)), null));
            }
            else
            {
               Expression castExp = exp.cast.exp;
               Expression prev = exp.prev, next = exp.next;
               exp.cast.exp = null;
               FreeExpContents(exp);
               FreeType(exp.expType);
               FreeType(exp.destType);
               *exp = *castExp;
               delete castExp;
               exp.prev = prev;
               exp.next = next;
               InstDeclPassExpression(exp);
            }
         }
         else
         {
            if(exp.expType && exp.expType.kind == pointerType)
            {
               if(exp.cast.exp && exp.cast.exp.expType && exp.cast.exp.expType.kind == templateType && !exp.cast.exp.expType.isPointerType)
                  exp.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), exp.cast.exp);
            }

            InstDeclPassTypeName(exp.cast.typeName, exp.usage.usageArg /*false*/);
            if(exp.cast.exp)
            {
               if(exp.expType && exp.expType.kind == templateType && exp.destType &&
                  (exp.destType.passAsTemplate || (!exp.destType.templateParameter || (!exp.destType.templateParameter.dataType && !exp.destType.templateParameter.dataTypeString))) &&
                  exp.cast.exp.expType && !exp.cast.exp.expType.passAsTemplate && exp.cast.exp.expType.isPointerType)
                  exp.cast.exp = MkExpCast(MkTypeName(MkListOne(MkSpecifierName("uintptr")), null), exp.cast.exp);
               InstDeclPassExpression(exp.cast.exp);
            }
         }
         break;
      }
      case conditionExp:
      {
         Expression e;
         InstDeclPassExpression(exp.cond.cond);
         for(e = exp.cond.exp->first; e; e = e.next)
            InstDeclPassExpression(e);
         if(exp.cond.elseExp)
            InstDeclPassExpression(exp.cond.elseExp);
         break;
      }
      case extensionCompoundExp:
      {
         InstDeclPassStatement(exp.compound);
         break;
      }
      case vaArgExp:
      {
         InstDeclPassExpression(exp.vaArg.exp);
         break;
      }
      case extensionInitializerExp:
      {
         InstDeclPassTypeName(exp.initializer.typeName, false);
         InstDeclPassInitializer(exp.initializer.initializer);
         break;
      }
   }
}

static void InstDeclPassInitializer(Initializer init)
{
   switch(init.type)
   {
      case expInitializer:
         if(init.exp)
         {
            InstDeclPassExpression(init.exp);
            AddPointerCast(init.exp);
         }
         break;
      case listInitializer:
      {
         Initializer i;
         for(i = init.list->first; i; i = i.next)
            InstDeclPassInitializer(i);
         break;
      }
   }
}

static void InstDeclPassDeclaration(Declaration decl)
{
   switch(decl.type)
   {
      case initDeclaration:
      {
         if(decl.specifiers)
         {
            Specifier spec;
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               int type;
               if((type = ReplaceClassSpec(decl.specifiers, spec, false)))
               {
                  InitDeclarator d;
                  if(decl.declarators)
                  {
                     for(d = decl.declarators->first; d; d = d.next)
                        ReplaceByInstancePtr(spec, &d.declarator, type);
                  }
               }
               InstDeclPassSpecifier(spec, false);
            }
         }
         if(decl.declarators)
         {
            InitDeclarator d;
            for(d = decl.declarators->first; d; d = d.next)
            {
               InstDeclPassDeclarator(d.declarator);
               if(d.initializer)
                  InstDeclPassInitializer(d.initializer);
            }
         }
         break;
      }
      case structDeclaration:
      {
         if(decl.specifiers)
         {
            Specifier spec;
            for(spec = decl.specifiers->first; spec; spec = spec.next)
            {
               int type;
               if((type = ReplaceClassSpec(decl.specifiers, spec, false)))
               {
                  if(decl.declarators)
                  {
                     Declarator d;
                     for(d = decl.declarators->first; d; d = d.next)
                        ReplaceByInstancePtr(spec, &d, type);
                  }
               }
               InstDeclPassSpecifier(spec, false);
            }
         }

         if(decl.declarators)
         {
            Declarator d;
            for(d = decl.declarators->first; d; d = d.next)
               InstDeclPassDeclarator(d);
         }
         break;
      }
      // This should be removed by now?
      case instDeclaration:
         // InstDeclPassInstantiation(decl.inst);
         break;
   }
}

static void InstDeclPassStatement(Statement stmt)
{
   switch(stmt.type)
   {
      case badDeclarationStmt:
         if(stmt.decl)
            InstDeclPassDeclaration(stmt.decl);
         break;
      case labeledStmt:
         InstDeclPassStatement(stmt.labeled.stmt);
         break;
      case caseStmt:
         // This expression should be constant...
         if(stmt.caseStmt.exp)
            InstDeclPassExpression(stmt.caseStmt.exp);
         if(stmt.caseStmt.stmt)
            InstDeclPassStatement(stmt.caseStmt.stmt);
         break;
      case compoundStmt:
      {
         Declaration decl;
         Statement s;
         Context prevContext = curContext;

         if(!stmt.compound.isSwitch)
            curContext = stmt.compound.context;

         if(stmt.compound.declarations)
         {
            for(decl = stmt.compound.declarations->first; decl; decl = decl.next)
               InstDeclPassDeclaration(decl);
         }
         if(stmt.compound.statements)
         {
            for(s = stmt.compound.statements->first; s; s = s.next)
               InstDeclPassStatement(s);
         }
         curContext = prevContext;
         break;
      }
      case expressionStmt:
      {
         if(stmt.expressions)
         {
            Expression exp;
            for(exp = stmt.expressions->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         break;
      }
      case ifStmt:
      {
         if(stmt.ifStmt.exp)
         {
            Expression exp;
            for(exp = stmt.ifStmt.exp->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         if(stmt.ifStmt.stmt)
            InstDeclPassStatement(stmt.ifStmt.stmt);
         if(stmt.ifStmt.elseStmt)
            InstDeclPassStatement(stmt.ifStmt.elseStmt);
         break;
      }
      case switchStmt:
      {
         Expression exp;
         if(stmt.switchStmt.exp)
         {
            for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         InstDeclPassStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         if(stmt.whileStmt.exp)
         {
            for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         InstDeclPassStatement(stmt.whileStmt.stmt);
         break;
      }
      case doWhileStmt:
      {
         if(stmt.doWhile.exp)
         {
            Expression exp;
            for(exp = stmt.doWhile.exp->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         if(stmt.doWhile.stmt)
            InstDeclPassStatement(stmt.doWhile.stmt);
         break;
      }
      case forStmt:
      {
         Expression exp;
         if(stmt.forStmt.init)
            InstDeclPassStatement(stmt.forStmt.init);
         if(stmt.forStmt.check)
            InstDeclPassStatement(stmt.forStmt.check);
         if(stmt.forStmt.increment)
         {
            for(exp = stmt.forStmt.increment->first; exp; exp = exp.next)
               InstDeclPassExpression(exp);
         }
         if(stmt.forStmt.stmt)
            InstDeclPassStatement(stmt.forStmt.stmt);
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
               InstDeclPassExpression(exp);
            AddPointerCast(stmt.expressions->last);
         }
         break;
      }
      case asmStmt:
      {
         AsmField field;
         if(stmt.asmStmt.inputFields)
         {
            for(field = stmt.asmStmt.inputFields->first; field; field = field.next)
               if(field.expression)
                  InstDeclPassExpression(field.expression);
         }
         if(stmt.asmStmt.outputFields)
         {
            for(field = stmt.asmStmt.outputFields->first; field; field = field.next)
               if(field.expression)
                  InstDeclPassExpression(field.expression);
         }
         if(stmt.asmStmt.clobberedFields)
         {
            for(field = stmt.asmStmt.clobberedFields->first; field; field = field.next)
               if(field.expression)
                  InstDeclPassExpression(field.expression);
         }
         break;
      }
   }
}

void TopoSort(OldList * input)
{
   OldList L { };
   OldList S { };
   OldList B { };
   External n, next;
   //External x;

   for(n = input->first; n; n = next)
   {
      next = n.next;
      if(n.type == declarationExternal && !n.declaration)
      {
         input->Remove(n);
         if(n.symbol && n.symbol.structExternal == n)
            n.symbol.structExternal = null;
         FreeExternal(n);
      }
      else if(!n.incoming || !n.incoming.count)
      {
         input->Remove(n);
         S.Add(n);
      }
      else if(!n.nonBreakableIncoming)
      {
         input->Remove(n);
         B.Add(n);
      }
   }
/*
         for(x = input->first; x; x = x.next)
         {
            int count = 0;
            for(e : x.incoming; !e.breakable)
               count++;
            if(count != x.nonBreakableIncoming)
               printf("Bug in input");

            if(!x.incoming.count)
               printf("This node should be in S!\n");
            for(e : x.incoming)
            {
               External y, from = e.from;
               for(y = input->first; y; y = y.next)
                  if(y == from)
                     break;
               if(!y)
               {
                  for(y = B.first; y; y = y.next)
                     if(y == from)
                        break;
               }

               if(!y)
               {
                  for(y = S.first; y; y = y.next)
                     if(y == from)
                        break;
               }
               if(!y)
               {
                  printf("This node is nowhere!\n");
               }
            }
         }*/

   while(true)
   {
      TopoEdge e, ne;
      if((n = S.first))
      {
         /*
         for(x = input->first; x; x = x.next)
         {
            int count = 0;
            for(e : x.incoming; !e.breakable)
               count++;
            if(count != x.nonBreakableIncoming)
               printf("Bug in input");
            if(!x.incoming.count)
               printf("This node should be in S!\n");
            for(e : x.incoming)
            {
               External y, from = e.from;
               for(y = input->first; y; y = y.next)
                  if(y == from)
                     break;
               if(!y)
               {
                  for(y = B.first; y; y = y.next)
                     if(y == from)
                        break;
               }

               if(!y)
               {
                  for(y = S.first; y; y = y.next)
                     if(y == from)
                        break;
               }
               if(!y)
               {
                  printf("This node is nowhere!\n");
               }
            }
         }*/

         //DebugPrint("*** Free Node: [", n.id, "]\n\t", n.output);
         S.Remove((IteratorPointer)n);

         /*
         if(n && n.symbol && n.symbol.string && !strcmp(n.symbol.string, "ecere::com::Instance"))
            printf("Adding Instance\n");
         */

         L.Add(n);
         if(n.outgoing)
         {
            for(e = n.outgoing.first; e; e = ne)
            {
               External m = e.to;
               OldList * list;

               //DebugPrint(" This Free Node has an edge to [", m.id, "] ", m.output);
               if(m.nonBreakableIncoming)
               {
                  //DebugPrint("... which we think is in input");
                  list = input;
               }
               else
               {
                  //DebugPrint("... which we think is in B");
                  list = &B;
               }

               if(!list->count)
                  PrintLn("!!! Something's wrong !!!");
               ne = e.out.next;

               if(!e.breakable)
               {
#ifdef _DEBUG
                  if(!m.nonBreakableIncoming)
                     printf("Bug");
#endif
                  m.nonBreakableIncoming--;
                  //DebugPrint("Reducing non breakable incoming, now ", m.nonBreakableIncoming);
               }

               n.outgoing.Remove((IteratorPointer)e);
               m.incoming.Remove((IteratorPointer)e);
               delete e;

               if(!m.incoming.count)
               {
                  //DebugPrint("Last edge to this node taken out, moving to S...");
                  list->Remove(m);
                  S.Add(m);
               }
               else if(!m.nonBreakableIncoming)
               {
                  //DebugPrint("Last non-breakable edge to this node taken out, moving to B...");
                  list->Remove(m);
                  B.Add(m);
               }
            }
         }
      }
      else if((n = B.first))
      {
         //DebugPrint("Breaking some of the ", n.incoming.count, " incoming edges to [", n.id, "] ", n.output);
         B.Remove((IteratorPointer)n);

         // Break the edges of this node
         if(n.incoming)
         {
            for(e = n.incoming.first; e; e = ne)
            {
               TopoEdge e2, n2;
               External m = e.from;
               External f;
   /*
            for(x = input->first; x; x = x.next)
            {
               int count = 0;
               for(e : x.incoming; !e.breakable)
                  count++;
               if(count != x.nonBreakableIncoming)
                  printf("Bug in input");
               if(!x.incoming.count)
                  printf("This node should be in S!\n");
               for(e : x.incoming)
               {
                  External y, from = e.from;
                  for(y = input->first; y; y = y.next)
                     if(y == from)
                        break;
                  if(!y)
                  {
                     for(y = B.first; y; y = y.next)
                        if(y == from)
                           break;
                  }

                  if(!y)
                  {
                     for(y = S.first; y; y = y.next)
                        if(y == from)
                           break;
                  }
                  if(!y && from != n)
                  {
                     printf("This node is nowhere!\n");
                  }
               }
            }*/

               f = m.ForwardDeclare();
               ne = e.in.next;
   /*
            for(x = input->first; x; x = x.next)
            {
               int count = 0;
               for(e : x.incoming; !e.breakable)
                  count++;
               if(count != x.nonBreakableIncoming)
                  printf("Bug in input");
               if(!x.incoming.count)
                  printf("This node should be in S!\n");
               for(e : x.incoming)
               {
                  External y, from = e.from;
                  for(y = input->first; y; y = y.next)
                     if(y == from)
                        break;
                  if(!y)
                  {
                     for(y = B.first; y; y = y.next)
                        if(y == from)
                           break;
                  }

                  if(!y)
                  {
                     for(y = S.first; y; y = y.next)
                        if(y == from)
                           break;
                  }
                  if(!y && from != n && from != f)
                  {
                     printf("This node is nowhere!\n");
                  }
               }
            }
   */
               // Recheck input for edges created by forward declaration
               {
                  External c, next;
                  for(c = input->first; c; c = next)
                  {
                     next = c.next;
                     if(!c.incoming || !c.incoming.count)
                     {
                        input->Remove(c);
                        S.Add(c);
                     }
                     else if(!c.nonBreakableIncoming)
                     {
                        input->Remove(c);
                        B.Add(c);
                     }
                  }
               }

               //DebugPrint("Breaking edge from ", e.from.id, " to ", e.to.id);
               //DebugPrint("Creating a forward decl node [", f.id, "] for [", m.id, "]");

               for(e2 = m.outgoing.first; e2; e2 = n2)
               {
                  n2 = e2.out.next;
                  if(e2.breakable)
                  {
                     External to = e2.to;

                     if(e2 == e)
                        ;//DebugPrint("Breaking this particular connection");
                     else
                        ;//DebugPrint("Also redirecting connection from ", m.id, " to ", to.id, " to come from ", f.id, " instead.");
                     e2.breakable = false;
                     e2.from = f;
                     m.outgoing.Remove((IteratorPointer)e2);
                     f.outgoing.Add(e2);
                     to.nonBreakableIncoming++;
                     if(e2 != e && to.nonBreakableIncoming == 1)
                     {
                        // If this node was previously in B, move it to input
                        B.Remove(to);
                        input->Add(to);
                     }

                     //DebugPrint("Node ", e2.to.id, " now has ", e2.to.nonBreakableIncoming, " non-breakable incoming edges.");
                  }
               }
   /*
            for(x = input->first; x; x = x.next)
            {
               int count = 0;
               for(e : x.incoming; !e.breakable)
                  count++;
               if(count != x.nonBreakableIncoming)
                  printf("Bug in input");
               if(!x.incoming.count)
                  printf("This node should be in S!\n");
               for(e : x.incoming)
               {
                  External y, from = e.from;
                  for(y = input->first; y; y = y.next)
                     if(y == from)
                        break;
                  if(!y)
                  {
                     for(y = B.first; y; y = y.next)
                        if(y == from)
                           break;
                  }

                  if(!y)
                  {
                     for(y = S.first; y; y = y.next)
                        if(y == from)
                           break;
                  }
                  if(!y && from != n && from != f)
                  {
                     printf("This node is nowhere!\n");
                  }
               }
            }*/
               if(!f.incoming.count)
                  S.Add(f);
               else if(!f.nonBreakableIncoming)
                  B.Add(f);
               else
                  input->Add(f);
   /*
            for(x = input->first; x; x = x.next)
            {
               int count = 0;
               for(e : x.incoming; !e.breakable)
                  count++;
               if(count != x.nonBreakableIncoming)
                  printf("Bug in input");
               if(!x.incoming.count)
                  printf("This node should be in S!\n");
               for(e : x.incoming)
               {
                  External y, from = e.from;
                  for(y = input->first; y; y = y.next)
                     if(y == from)
                        break;
                  if(!y)
                  {
                     for(y = B.first; y; y = y.next)
                        if(y == from)
                           break;
                  }

                  if(!y)
                  {
                     for(y = S.first; y; y = y.next)
                        if(y == from)
                           break;
                  }

                  if(!y)
                  {
                     for(y = L.first; y; y = y.next)
                        if(y == from)
                        {
                           PrintLn("This node is already in L!");
                           break;
                        }
                  }

                  if(!y && from != n)
                  {
                     ConsoleFile file { };
                     printf("This node is nowhere!\n");
                     OutputExternal(from, file);
                     delete file;
                  }
               }
            }
   */
               // Avoid needless edge breaking by processing a node as soon as one shows up in S
               if(S.first)
                  break;
            }
         }

         // Put n back in input because it now has unbreakable edges
         input->Add(n);
      }
      else
      {
         if(input->count)
         {
#ifdef _DEBUG
            ConsoleFile f { };
            External e = input->first;
#endif
            Compiler_Error("declarations cycles found\n");
#ifdef _DEBUG
            //OutputTree(input, f);
/*
         for(x = input->first; x; x = x.next)
         {
            int count = 0;
            for(e : x.incoming; !e.breakable)
               count++;
            if(count != x.nonBreakableIncoming)
               printf("Bug in input");
            if(!x.incoming.count)
               printf("This node should be in S!\n");

            for(e : x.incoming)
            {
               External y, from = e.from;
               for(y = input->first; y; y = y.next)
                  if(y == from)
                     break;
               if(!y)
               {
                  for(y = B.first; y; y = y.next)
                     if(y == from)
                        break;
               }

               if(!y)
               {
                  for(y = S.first; y; y = y.next)
                     if(y == from)
                        break;
               }
               if(!y)
               {
                  printf("This node is nowhere!\n");
               }
            }
         }
*/
            SetOutputLineNumbers(false);
            OutputExternal(e, f);

            PrintLn("\nDepends on:\n");
            { TopoEdge i; for(i = e.incoming.last; i && !i.breakable && i.from.incoming.count; i = i.in.next) { e = i.from; break; } }

            OutputExternal(e, f);

            PrintLn("\nWhile that depends on:\n");
            { TopoEdge i; for(i = e.incoming.first; i && !i.breakable && i.from.incoming.count; i = i.in.next) { e = i.from; break; } }

            OutputExternal(e, f);

            PrintLn("\nWhile that depends on:\n");
            { TopoEdge i; for(i = e.incoming.first; i && !i.breakable && i.from.incoming.count; i = i.in.next) { e = i.from; break; } }

            OutputExternal(e, f);

            PrintLn("\nWhile that depends on:\n");
            { TopoEdge i; for(i = e.incoming.first; i && !i.breakable && i.from.incoming.count; i = i.in.next) { e = i.from; break; } }

            OutputExternal(e, f);
            delete f;

            system("pause");

            while((e = input->first))
            {
               input->Remove(e);
               L.Add(e);
            }
            *input = L;
#endif
         }
         else
            *input = L;
         break;
      }
   }

   for(n = input->first; n; n = next)
   {
      next = n.next;
      if(n.type == declarationExternal && (!n.declaration || ((!n.declaration.specifiers || !n.declaration.specifiers->count) && (!n.declaration.declarators || !n.declaration.declarators->count))))
      {
         input->Remove(n);
         if(n.symbol && n.symbol.structExternal == n)
            n.symbol.structExternal = null;
         FreeExternal(n);
      }
   }
}

public void ProcessInstanceDeclarations()
{
   External external;
   curContext = globalContext;
   for(external = ast->first; external; external = external.next)
   {
      curExternal = external;
      if(external.type == functionExternal)
      {
         FunctionDefinition func = external.function;
         if(func.specifiers)
         {
            Specifier spec;
            for(spec = func.specifiers->first; spec; spec = spec.next)
            {
               int type;
               if((type = ReplaceClassSpec(func.specifiers, spec, false)))
                  ReplaceByInstancePtr(spec, &func.declarator, type);
               InstDeclPassSpecifier(spec, false);
            }
         }
         InstDeclPassDeclarator(func.declarator);
         if(func.body)
            InstDeclPassStatement(func.body);
      }
      else if(external.type == declarationExternal)
      {
         if(external.declaration)
            InstDeclPassDeclaration(external.declaration);
      }
   }

   // Perform topological sort
   TopoSort(ast);
}
