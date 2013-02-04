import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"

extern External curExternal;
///////////////// INSTANCE DECLARATION PASS ///////////////////////

// Returns true if we should add a * to the declarator
static bool ReplaceClassSpec(OldList specs, Specifier spec, bool param)
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
               return true;
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
               return true;
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
         spec.type = nameSpecifier;

         if(spec.templateArgs)
         {
            FreeList(spec.templateArgs, FreeTemplateArgument);
            spec.templateArgs = null;
         }

         if(_class && _class.type == structClass)
         {
            //Externalexternal;
            char name[1024];
            name[0] = 0;
            FullClassNameCat(name, _class.fullName, false);
            //spec.name = CopyString(name);
            delete spec.name;
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
            delete spec.name;
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
               !strcmp(_class.fullName, "ecere::com::Instance") ||
               (_class.dataTypeString && !strcmp(_class.dataTypeString, "char *")) ||
               //strcmp(_class.fullName, "bool") &&
               !strcmp(_class.fullName, "uint64") ||
               !strcmp(_class.fullName, "uint32") ||
               !strcmp(_class.fullName, "uint16") ||
               !strcmp(_class.fullName, "uintptr") ||
               !strcmp(_class.fullName, "intptr") ||
               !strcmp(_class.fullName, "uint") ||
               !strcmp(_class.fullName, "byte")))
            {
               delete spec.name;
               if(_class.dataTypeString)
               {
                  if(!strcmp(_class.dataTypeString, "uint64") ||
                     !strcmp(_class.dataTypeString, "uint32") ||
                     !strcmp(_class.dataTypeString, "uint16") ||
                     !strcmp(_class.dataTypeString, "uintptr") ||
                     !strcmp(_class.dataTypeString, "intptr") ||
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

                  if(!strcmp(_class.dataTypeString, "char *"))
                     spec.name = CopyString("char");
                  else
                     spec.name = CopyString(_class.dataTypeString);
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
               delete spec.name;
               spec.type = baseSpecifier;
               spec.specifier = VOID;
               return true;
            }
         }
         else
         {
            delete spec.name;
            spec.type = structSpecifier;
            spec.id = MkIdentifier("__ecereNameSpace__ecere__com__Instance");
            spec.list = null;
            spec.baseSpecs = null;
            spec.definitions = null;
            spec.ctx = null;
            spec.addNameSpace = false;
         }

         if(_class && _class.dataTypeString && !strcmp(_class.dataTypeString, "char *"))
            return true; //false;
         if(!_class || _class.type == normalClass || _class.type == noHeadClass || !strcmp(_class.fullName, "ecere::com::Instance"))
            return true;
         else if(param && _class.type == structClass)
            return 2;
      }
   }
   else if(spec.type == baseSpecifier)
   {
      if(spec.specifier == ANY_OBJECT)
      {
         spec.specifier = VOID;
         return true;
      }
   }
   return false;
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

static void InstDeclPassSpecifier(Specifier spec)
{
   switch(spec.type)
   {
      case baseSpecifier:
         if(spec.specifier == TYPED_OBJECT)
         {
            spec.type = extendedSpecifier;
            spec.extDecl = MkExtDeclString(CopyString("struct __ecereNameSpace__ecere__com__Class * class, void *"));
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
         if(spec.extDecl && spec.extDecl.type == extDeclString && spec.extDecl.s && !strcmp(spec.extDecl.s, "dllexport"))
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
                  if(spec && spec.type == nameSpecifier && !strcmp(spec.name, "class"))
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
               if(targetPlatform == win32)
                  decl.extended.extended.s = CopyString("__attribute__((__stdcall__))");
               else
                  decl.extended.extended.s = CopyString("");
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
               (classSym.registered.type == enumClass || classSym.registered.type == bitClass || classSym.registered.type == unitClass || 
               (classSym.registered.type == systemClass && strcmp(classSym.string, "ecere::com::Instance") && strcmp(classSym.string, "ecere::com::Class"))))))
               ReplaceByInstancePtr(spec, &type.declarator, 2);
         }
         InstDeclPassSpecifier(spec);
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
            InstDeclPassExpression(exp.op.exp2);
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
               InstDeclPassExpression(e);
         }
         break;
      }
      case memberExp:
      {
         InstDeclPassExpression(exp.member.exp);
         break;
      }
      case pointerExp:
      {
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
         if(type && type.kind == classType && type._class.registered && type._class.registered.type == structClass)
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
         else
         {
            InstDeclPassTypeName(exp.cast.typeName, false);
            if(exp.cast.exp)
               InstDeclPassExpression(exp.cast.exp);
         }
         break;
      }
      case conditionExp:
      {
         Expression e;
         InstDeclPassExpression(exp.cond.cond);
         for(e = exp.cond.exp->first; e; e = e.next)
            InstDeclPassExpression(e);
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
         InstDeclPassExpression(init.exp);
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
               InstDeclPassSpecifier(spec);
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
               InstDeclPassSpecifier(spec);
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
         for(exp = stmt.switchStmt.exp->first; exp; exp = exp.next)
            InstDeclPassExpression(exp);
         InstDeclPassStatement(stmt.switchStmt.stmt);
         break;
      }
      case whileStmt:
      {
         Expression exp;
         for(exp = stmt.whileStmt.exp->first; exp; exp = exp.next)
            InstDeclPassExpression(exp);
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
               InstDeclPassSpecifier(spec);
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
}
