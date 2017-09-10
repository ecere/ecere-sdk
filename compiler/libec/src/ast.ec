import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"
extern char * yytext;

const char * defaultNameSpace;
int defaultNameSpaceLen;
public void SetDefaultNameSpace(const char * s) { defaultNameSpace = s; defaultNameSpaceLen = s ? strlen(s) : 0; }

bool strictNameSpaces;
public void SetStrictNameSpaces(bool b) { strictNameSpaces = b; }

AccessMode declMode = privateAccess;
AccessMode structDeclMode = privateAccess;

public void SetDeclMode(AccessMode accessMode) { structDeclMode = declMode = accessMode; }
AccessMode defaultDeclMode = privateAccess;
public void SetDefaultDeclMode(AccessMode accessMode) { defaultDeclMode = accessMode; }

const char * currentNameSpace;
int currentNameSpaceLen;
public void SetCurrentNameSpace(const char * s) { currentNameSpace = s; currentNameSpaceLen = s ? strlen(s) : 0; }

#ifdef _TIMINGS
Time findClassTotalTime;
Time checkTypeTotalTime;
Time externalImportTotalTime;
Time findClassIgnoreNSTotalTime;
#endif

public OldList * MkList()
{
   return new0 OldList[1];
}

public OldList * MkListOne(void * item)
{
   OldList * list = new0 OldList[1];
   list->Add(item);
   return list;
}

void ListAdd(OldList list, void * item)
{
   if(item)
      list.Add(item);
}

void ListAddFront(OldList list, void * item)
{
   if(item)
      list.Insert(null, item);
}

public Identifier MkIdentifier(const char * string)
{
   Identifier id { };
   int c;

   id._class = null; // Default class...

   if(string)
   {
      const char * namePart;
      bool gotColon = false;
      for(c = strlen(string)-1; c >= 0; c--)
         if(string[c] == ':')
         {
            gotColon = true;
            break;
         }

      namePart = string+c+1;
      while(c >= 0 && string[c] == ':') c--;
      if(c >= 0)
      {
         char name[1024];
         Symbol symbol;

         memcpy(name, string, c+1);
         name[c+1] = '\0';
         // TODO: Do these better, keep in string?
         if(!strcmp(name, "typed_object"))
         {
            id._class = MkSpecifierName("typed_object"); //"class");
            id.string = CopyString(namePart);
         }
         else if(!strcmp(name, "property"))
         {
            id._class = MkSpecifierName("property");
            id.string = CopyString(namePart);
         }
         else if(!strcmp(name, "typed_object&"))
         {
            id._class = MkSpecifierName("typed_object&");
            id.string = CopyString(namePart);
         }
         else if(!strcmp(name, "any_object"))
         {
            id._class = MkSpecifierName("any_object");
            id.string = CopyString(namePart);
         }
         else
         {
            TemplatedType templatedType = FindTemplateTypeParameter(curContext, name);
            if(templatedType)
            {
               id._class = Specifier { type = templateTypeSpecifier, templateParameter = templatedType.param };
               //id._class = MkSpecifierName(name);
               id.string = CopyString(namePart);
            }
            else
            {
               symbol = FindClass(name);
               if(symbol)
               {
                  id._class = _MkSpecifierName(symbol.string, symbol, null);
                  id.string = CopyString(namePart);
               }
               else
                  id.string = CopyString(string);
            }
         }
      }
      else if(gotColon)
      {
         id._class = MkSpecifierName(null);
         id.string = CopyString(namePart);
      }
      else
         id.string = CopyString(string);
   }
   else
      id.string = CopyString("");
   return id;
}

public TemplateParameter MkTypeTemplateParameter(Identifier identifier, TemplateDatatype baseTplDatatype, TemplateArgument defaultArgument)
{
   if(identifier.string)
   {
      TemplateParameter param { type = TemplateParameterType::type, identifier = identifier, dataType = baseTplDatatype, defaultArgument = defaultArgument };
      TemplatedType type { key = (uintptr)identifier.string, param = param };
      if(!curContext.templateTypes.Add((BTNode)type))
         delete type;
      return param;
   }
   return null;
}

public TemplateParameter MkIdentifierTemplateParameter(Identifier identifier, TemplateMemberType memberType, TemplateArgument defaultArgument)
{
   if(identifier.string)
   {
      TemplateParameter param { type = TemplateParameterType::identifier, identifier = identifier, memberType = memberType, defaultArgument = defaultArgument };
      return param;
   }
   return null;
}

public TemplateParameter MkExpressionTemplateParameter(Identifier identifier, TemplateDatatype dataType, TemplateArgument defaultArgument)
{
   if(identifier.string)
   {
      TemplateParameter param { type = TemplateParameterType::expression, identifier = identifier, dataType = dataType, defaultArgument = defaultArgument };
      return param;
   }
   return null;
}

public TemplateDatatype MkTemplateDatatype(OldList * specifiers, Declarator decl)
{
   TemplateDatatype datatype { specifiers = specifiers, decl = decl };
   return datatype;
}

public TemplateArgument MkTemplateTypeArgument(TemplateDatatype tplDatatype)
{
   TemplateArgument argument { type = type, templateDatatype = tplDatatype };
   return argument;
}

public TemplateArgument MkTemplateExpressionArgument(Expression expr)
{
   TemplateArgument argument { type = expression, expression = expr };
   return argument;
}

public TemplateArgument MkTemplateIdentifierArgument(Identifier ident)
{
   TemplateArgument argument { type = identifier, identifier = ident };
   return argument;
}

Expression MkExpExtensionCompound(Statement compound)
{
   return { type = extensionCompoundExp, compound = compound };
}

Expression MkExpExtensionExpression(OldList * expressions)
{
   return { type = extensionExpressionExp, list = expressions, loc = yylloc };
}

Expression MkExpExtensionInitializer(TypeName typeName, Initializer initializer)
{
   return { type = extensionInitializerExp, initializer.typeName = typeName, initializer.initializer = initializer, loc = yylloc };
}

public Expression MkExpIdentifier(Identifier id)
{
   return { type = identifierExp, identifier = id, loc = yylloc };
}

public Expression MkExpDummy()
{
   Expression exp { type = dummyExp };
   return exp;
}

public Expression MkExpConstant(const char * string)
{
   return { type = constantExp, constant = CopyString(string), loc = yylloc };
}

Expression MkExpString(const char * string)
{
   return { type = stringExp, string = CopyString(string), loc = yylloc };
}

Expression MkExpWideString(const char * string)
{
   return { type = stringExp, string = CopyString(string), loc = yylloc, wideString = true };
}

// TODO: String is case sensitive..
//       What should we do about it?
/*public class CaseSensitiveString : String
{
   int OnCompare(CaseSensitiveString string2)
   {
      int result = 0;
      if(this && string2)
         result = strcmpi(this, string2);
      else if(!this && string2)
         result = 1;
      else if(this && !string2)
         result = -1;
      return result;
   }
}*/

public struct ContextStringPair
{
   String string, context;

   // TODO: Should this be automated somehow?
   void OnFree()
   {
      delete string;
      delete context;
   }

   int OnCompare(ContextStringPair b)
   {
      int result;
      result = (string && b.string) ? strcmp(string, b.string) :
         (!string && b.string) ? 1 : (string && !b.string) ? -1 : 0;
      if(result) return result;

      result = (context && b.context) ? strcmp(context, b.context) :
         (!context && b.context) ? 1 : (context && !b.context) ? -1 : 0;
      // TODO: Support these
      // result = CaseSensitiveString::OnCompare(string, b.string);
      // result = ((CaseSensitiveString)string).OnCompare(b.string);
      return result;
   }
};

Map<ContextStringPair, List<Location>> intlStrings { };

Expression MkExpIntlString(const char * string, const char * context)
{
   if(inCompiler)
   {
      OldList * list = MkList();
      String s;
      if(inCompiler)
      {
         ContextStringPair pair { };
         List<Location> list;
         int len = strlen(string);

         pair.string = new byte[len-2+1]; memcpy(pair.string, string+1, len-2); pair.string[len-2] = '\0';
         if(context) { len = strlen(context); pair.context = new byte[len-2+1]; memcpy(pair.context, context+1, len-2); pair.context[len-2] = '\0'; }

         list = intlStrings[pair];
         if(!list)
         {
            list = { };
            intlStrings[pair] = list;
         }
         else
         {
            delete pair.string;
            delete pair.context;
         }
         list.Add(yylloc);
      }
      //ListAdd(list, QMkExpId("__thisModule"));
      s = QMkString(i18nModuleName ? i18nModuleName : "");
      ListAdd(list, MkExpString(s));
      delete s;
      ListAdd(list, MkExpString(string));
      if(context)
      {
         int lenString = strlen(string), lenContext = strlen(context);
         char * msgid = new char[lenString-2 + lenContext-2 + 4];
         msgid[0] = '\"';
         memcpy(msgid+1, context+1, lenContext-2);
         msgid[1+lenContext-2] = 4; // EOT
         memcpy(msgid+1+lenContext-2+1, string+1, lenString-2);
         memcpy(msgid+1+lenContext-2+1+lenString-2, "\"", 2);
         ListAdd(list, MkExpString(msgid));
         delete msgid;
      }
      else
         ListAdd(list, QMkExpId("null"));
      return MkExpCall(QMkExpId("GetTranslatedString"), list);
   }
   else
   {
      Expression e = MkExpString(string);
      e.intlString = true;
      return e;
   }
}

Expression MkExpOp(Expression exp1, int op, Expression exp2)
{
   Expression exp
   {
      type = opExp;
      op.op = op;
      op.exp1 = exp1;
      op.exp2 = exp2
   };
   if(exp1 || exp2)
   {
      exp.loc.start = exp1 ? exp1.loc.start : exp2.loc.start;
      exp.loc.end   = exp2 ? exp2.loc.end   : exp1.loc.end;
   }
   return exp;
}

Expression MkExpBrackets(OldList expressions)
{
   Expression exp
   {
      type = bracketsExp;
      list = expressions;
   };
   if(expressions && expressions.first)
   {
      exp.loc.start = ((Expression)expressions.first).loc.start;
      exp.loc.end   = ((Expression)expressions.last).loc.end;
   }
   return exp;
}

Expression MkExpIndex(Expression expression, OldList index)
{
   return { type = indexExp, index.exp = expression, index.index = index };
}

Expression MkExpCall(Expression expression, OldList arguments)
{
   return { type = callExp, call.exp = expression, call.arguments = arguments, loc = yylloc };
}

Expression MkExpMember(Expression expression, Identifier member)
{
   return { type = memberExp, member.exp = expression, member.member = member, loc = yylloc };
}

Expression MkExpPointer(Expression expression, Identifier member)
{
   return { type = pointerExp, member.exp = expression, member.member = member, loc = yylloc };
}

Expression MkExpTypeSize(TypeName typeName)
{
   return { type = typeSizeExp, typeName = typeName, loc = yylloc };
}

Expression MkExpTypeAlign(TypeName typeName)
{
   return { type = typeAlignExp, typeName = typeName, loc = yylloc };
}

Expression MkExpOffsetOf(TypeName typeName, Identifier id)
{
   return { type = offsetOfExp, offset.typeName = typeName, offset.id = id, loc = yylloc };
}

Expression MkExpClassSize(Specifier _class)
{
   return { type = classSizeExp, _class = _class, loc = yylloc };
}

Expression MkExpCast(TypeName typeName, Expression expression)
{
   return { type = castExp, cast.typeName = typeName, cast.exp = expression, loc = yylloc };
}

Expression MkExpCondition(Expression cond, OldList expressions, Expression elseExp)
{
   return { type = conditionExp, cond.cond = cond, cond.exp = expressions, cond.elseExp = elseExp, loc = yylloc };
}

Expression MkExpRenew(Expression memExp, TypeName type, Expression size)
{
   return { type = renewExp, _renew.exp = memExp, _renew.typeName = type, _renew.size = size, loc = yylloc };
}

Expression MkExpRenew0(Expression memExp, TypeName type, Expression size)
{
   return { type = renew0Exp, _renew.exp = memExp, _renew.typeName = type, _renew.size = size, loc = yylloc };
}

Expression MkExpNew(TypeName type, Expression size)
{
   return { type = newExp, _new.typeName = type, _new.size = size, loc = yylloc };
}

Expression MkExpNew0(TypeName type, Expression size)
{
   return { type = new0Exp, _new.typeName = type, _new.size = size, loc = yylloc };
}

Expression MkExpVaArg(Expression exp, TypeName type)
{
   return { type = vaArgExp, vaArg.exp = exp, vaArg.typeName = type, loc = yylloc };
}

Specifier MkSpecifier(int specifier)
{
   if(specifier == _BOOL && (declMode != defaultAccess && defaultDeclMode != defaultAccess))
      return MkSpecifierName("bool");
   else if(specifier == _BOOL || specifier == BOOL)
      return { type = baseSpecifier, specifier = specifier };
   else
      return { type = baseSpecifier, specifier = specifier };
}

Specifier MkSpecifierTypeOf(Expression expression)
{
   return { type = typeOfSpecifier, expression = expression };
}

Specifier MkSpecifierSubClass(Specifier _class)
{
   return { type = subClassSpecifier, _class = _class };
}

Specifier MkSpecifierExtended(ExtDecl extDecl)
{
   return { type = extendedSpecifier, extDecl = extDecl /*name = CopyString(name)*/ };
}

Specifier MkEnum(Identifier id, OldList list)
{
   Specifier spec
   {
      type = enumSpecifier;
      id = id;
      list = list;
   };
   if(list && (!declMode || !id))
   {
      Type type;
      Enumerator e;
      OldList specs { };
      specs.Add(spec);
      type = ProcessType(&specs, null);

      if(id)
      {
         Symbol symbol { string = CopyString(id.string), isStruct = true, type = type };
         type.refCount++;
         if(strstr(symbol.string, "::"))
            curContext.hasNameSpace = true;
         if(!curContext.structSymbols.Add((BTNode)symbol))
            FreeSymbol(symbol);
      }
      for(e = list.first; e; e = e.next)
      {
         Symbol symbol { string = CopyString(e.id.string), type = type };
         type.refCount++;
         if(strstr(symbol.string, "::"))
            curContext.hasNameSpace = true;
         if(!(curContext.templateTypesOnly ? curContext.parent : curContext).symbols.Add((BTNode)symbol))
            FreeSymbol(symbol);
      }
      FreeType(type);
   }
   return spec;
}

Specifier MkStructOrUnion(SpecifierType type, Identifier id, OldList definitions)
{
   Specifier spec { type = type, id = id };
   if(id && FindType(curContext, id.string))
      structDeclMode = defaultAccess;
   spec.definitions = definitions;
   if(definitions && id && structDeclMode == defaultAccess)
   {
      OldList specs { };
      Symbol symbol;
      specs.Add(spec);
      symbol = Symbol { string = CopyString(id.string), type = ProcessType(specs, null), isStruct = true };
      if(!curContext.structSymbols.Add((BTNode)symbol))
         FreeSymbol(symbol);
   }
   return spec;
}

void AddStructDefinitions(Specifier spec, OldList definitions)
{
   spec.definitions = definitions;
   if(definitions && spec.id && !declMode)
   {
      Symbol symbol;
      OldList specs { };
      specs.Add(spec);
      symbol = Symbol { string = CopyString(spec.id.string), type = ProcessType(specs, null), isStruct = true };
      if(!curContext.parent.structSymbols.Add((BTNode)symbol))
         FreeSymbol(symbol);
   }
}

Attribute MkAttribute(String attr, Expression exp)
{
   return { attr = attr, exp = exp };
}

Attrib MkAttrib(int type, OldList * attribs)
{
   return { type = type, attribs = attribs };
}

ExtDecl MkExtDeclString(String s)
{
   return { type = extDeclString, s = s };

}

ExtDecl MkExtDeclAttrib(Attrib attr)
{
   return { type = extDeclAttrib, attr = attr };
}


public Declarator MkDeclaratorIdentifier(Identifier id)
{
   return { type = identifierDeclarator, identifier = id };
}

Declarator MkDeclaratorFunction(Declarator declarator, OldList parameters)
{
   return { type = functionDeclarator, declarator = declarator, function.parameters = parameters };
}

Declarator MkDeclaratorExtended(ExtDecl extended, Declarator declarator)
{
   return { type = extendedDeclarator, declarator = declarator, extended.extended = extended };
}

Declarator MkDeclaratorExtendedEnd(ExtDecl extended, Declarator declarator)
{
   return { type = extendedDeclaratorEnd, declarator = declarator, extended.extended = extended };
}

Declarator MkStructDeclarator(Declarator declarator, Expression exp)
{
   return { type = structDeclarator, declarator = declarator, structDecl.exp = exp };
}

Declarator MkDeclaratorBrackets(Declarator declarator)
{
   return { type = bracketsDeclarator, declarator = declarator };
}

Declarator MkDeclaratorArray(Declarator declarator, Expression exp)
{
   return { type = arrayDeclarator, declarator = declarator, array.exp = exp };
}

Declarator MkDeclaratorEnumArray(Declarator declarator, Specifier _class)
{
   return { type = arrayDeclarator, declarator = declarator, array.enumClass = _class };
}

Declarator MkDeclaratorPointer(Pointer pointer, Declarator declarator)
{
   return { type = pointerDeclarator, declarator = declarator, pointer.pointer = pointer };
}

Enumerator MkEnumerator(Identifier id, Expression exp)
{
   return { id = id, exp = exp };
}

Pointer MkPointer(OldList qualifiers, Pointer pointer)
{
   return { qualifiers = qualifiers, pointer = pointer };
}

Initializer MkInitializerAssignment(Expression exp)
{
   /*if(yylloc.start.line == 1)
      printf("bug");*/
   return { type = expInitializer, exp = exp, loc = yylloc };
}

Initializer MkInitializerList(OldList list)
{
   /*if(yylloc.start.line == 1)
      printf("bug");*/
   return { type = listInitializer, list = list, loc = yylloc };
}

InitDeclarator MkInitDeclarator(Declarator declarator, Initializer initializer)
{
   return { declarator = declarator, initializer = initializer };
}

public TypeName MkTypeName(OldList qualifiers, Declarator declarator)
{
   if(qualifiers != null)
   {
      Declarator parentDecl = declarator;
      Declarator decl = declarator;
      while(decl && decl.type == arrayDeclarator)
         decl = decl.declarator;
      if(decl && decl.type == identifierDeclarator && decl.identifier.string && CheckType(decl.identifier.string) == TYPE_NAME)
      {
         Specifier spec;
         // Check if we're missing a real type specifier here
         for(spec = qualifiers.first; spec; spec = spec.next)
         {
            if(spec.type == baseSpecifier)
            {
               if(spec.specifier == CONST || spec.specifier == VOLATILE ||
                  spec.specifier == EXTERN || spec.specifier == STATIC ||
                  spec.specifier == AUTO || spec.specifier == REGISTER)
                  continue;
               break;
            }
            else if(spec.type != extendedSpecifier)
               break;
         }
         if(!spec)
         {
            // This is actually a type
            ListAdd(qualifiers, MkSpecifierName(decl.identifier.string));
            FreeDeclarator(decl);
            parentDecl.declarator = null;
         }
      }
   }
   return { qualifiers = qualifiers, declarator = declarator };
}

public TypeName MkTypeNameGuessDecl(OldList qualifiers, Declarator declarator)
{
   if(qualifiers != null)
   {
      bool gotType = false;
      bool gotFullType = false;
      Specifier spec, next;
      for(spec = qualifiers.first; spec; spec = next)
      {
         next = spec.next;
         if(gotType && !declarator && ((spec.type == nameSpecifier && spec.name) || (spec.type == baseSpecifier && gotFullType)))
         {
            const String s = null;
            if(spec.type == nameSpecifier)
            {
               char * colon = RSearchString(spec.name, "::", strlen(spec.name), true, false);
               s = colon ? colon + 2 : spec.name;
            }
            else if(spec.type == baseSpecifier)
            {
               if(spec.specifier == INT64) s = "int64";
               else if(spec.specifier == INT128) s = "__int128";
               else if(spec.specifier == FLOAT128) s = "__float128";
            }
            if(s)
            {
               declarator = MkDeclaratorIdentifier(MkIdentifier(s));
               qualifiers.Remove(spec);
               FreeSpecifier(spec);
               spec = null;
            }
         }
         if(spec && spec.type != extendedSpecifier)
         {
            if(spec.type == baseSpecifier)
            {
               if(spec.specifier == CONST || spec.specifier == VOLATILE ||
                  spec.specifier == EXTERN || spec.specifier == STATIC ||
                  spec.specifier == AUTO || spec.specifier == REGISTER)
                  continue;
               else if(spec.specifier != UNSIGNED && spec.specifier != SIGNED && spec.specifier != LONG)
                  gotFullType = true;
               gotType = true;
            }
            else
            {
               gotFullType = true;
               gotType = true;
            }
         }
      }
   }
   return { qualifiers = qualifiers, declarator = declarator };
}

public Identifier GetDeclId(Declarator decl)
{
   while(decl && decl.type != identifierDeclarator)
      decl = decl.declarator;
   return decl ? decl.identifier : null;
}

Declaration MkDeclarationClassInst(Instantiation inst)
{
   return { type = instDeclaration, inst = inst, loc = yylloc };
}

Declaration MkDeclarationInst(Instantiation inst)
{
   Declaration decl { type = instDeclaration, inst = inst, loc = yylloc };
   Symbol symbol;
   if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
   {
      char name[1024];
      int len = 0, stringLen;
      if(defaultNameSpace)
      {
         memcpy(name, defaultNameSpace, defaultNameSpaceLen);
         len += defaultNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }
      if(currentNameSpace)
      {
         memcpy(name + len, currentNameSpace, currentNameSpaceLen);
         len += currentNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }

      stringLen = strlen(inst.exp.identifier.string);
      memcpy(name + len, inst.exp.identifier.string, stringLen);
      len += stringLen;
      name[len] = 0;
      delete inst.exp.identifier.string;
      inst.exp.identifier.string = CopyString(name);
   }

   symbol = Symbol
   {
      string = (inst.exp.type == identifierExp) ? CopyString(inst.exp.identifier.string) : null;
      type = MkClassTypeSymbol(inst._class.symbol);
   };
   if(strstr(symbol.string, "::"))
      curContext.hasNameSpace = true;
   if(!(curContext.templateTypesOnly ? curContext.parent : curContext).symbols.Add((BTNode)symbol))
      excludedSymbols->Add(symbol);
   decl.symbol = inst.symbol = symbol;
   return decl;
}

Declaration MkDeclarationDefine(Identifier id, Expression exp)
{
   Declaration decl { type = defineDeclaration, id = id, exp = exp, loc = yylloc };
   char expString[1024];
   expString[0] = '\0';

   PrintExpression(exp, expString);

   if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
   {
      char name[1024];
      int len = 0, stringLen;
      if(defaultNameSpace)
      {
         memcpy(name, defaultNameSpace, defaultNameSpaceLen);
         len += defaultNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }
      if(currentNameSpace)
      {
         memcpy(name + len, currentNameSpace, currentNameSpaceLen);
         len += currentNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }
      stringLen = strlen(id.string);
      memcpy(name + len, id.string, stringLen);
      len += stringLen;
      name[len] = 0;
      delete id.string;
      id.string = CopyString(name);
   }

   if(!eSystem_FindDefine(privateModule, id.string))
      eSystem_RegisterDefine(id.string, expString, privateModule, buildingECERECOMModule ? baseSystemAccess : publicAccess);
   else
      Compiler_Warning($"Redefinition of %s ignored\n", id.string);
   return decl;
}

Declaration MkDeclaration(OldList specifiers, OldList initDeclarators)
{
   Declaration decl { type = initDeclaration, declarators = initDeclarators, specifiers = specifiers, loc = yylloc };
   bool variable = true;

   if(specifiers != null)
   {
      bool gotType = false;
      Specifier spec, next;
      for(spec = specifiers.first; spec; spec = next)
      {
         next = spec.next;
         if(spec.type == baseSpecifier && spec.specifier == TYPEDEF)
         {
            if(initDeclarators != null)
            {
               InitDeclarator d;

               for(d = initDeclarators.first; d; d = d.next)
               {
                  if(GetDeclId(d.declarator).string)
                  {
                     Symbol type
                     {
                        string = CopyString(GetDeclId(d.declarator).string);
                        type = ProcessType(specifiers, d.declarator);
                     };

                     if(!(curContext.templateTypesOnly ? curContext.parent : curContext).types.Add((BTNode)type))
                        excludedSymbols->Add(type);
                     decl.symbol = d.declarator.symbol = type;
                  }
               }
            }
            else if(spec.next)
            {
               //for(spec = spec.next; spec; spec = spec.next)
               spec = specifiers.last;
               {
                  if((spec.type == nameSpecifier && spec.name) || spec.type == baseSpecifier)
                  {
                     const String s = null;
                     if(spec.type == nameSpecifier)
                     {
                        const char * colon = RSearchString(spec.name, "::", strlen(spec.name), true, false);
                        s = colon ? colon + 2 : spec.name;
                     }
                     else if(spec.type == baseSpecifier)
                     {
                        if(spec.specifier == INT64) s = "int64";
                        else if(spec.specifier == INT128) s = "__int128";
                        else if(spec.specifier == FLOAT128) s = "__float128";
                     }
                     if(s)
                     {
                        Symbol type { string = CopyString(s), type = ProcessType(specifiers, null) };
                        decl.symbol = type;
                        decl.declarators = initDeclarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), null));
                        specifiers.Remove(spec);
                        FreeSpecifier(spec);
                        if(!(curContext.templateTypesOnly ? curContext.parent : curContext).types.Add((BTNode)type))
                           excludedSymbols->Add(type);
                     }
                  }
               }
            }
            variable = false;
            break;
         }
         else if(spec.type == baseSpecifier &&
            (spec.specifier == STRUCT || spec.specifier == UNION))
            variable = false;
         else
         {
            if(gotType && initDeclarators == null && !spec.next && ((spec.type == nameSpecifier && spec.name) || spec.type == baseSpecifier))
            {
               const String s = null;
               if(spec.type == nameSpecifier)
               {
                  char * colon = RSearchString(spec.name, "::", strlen(spec.name), true, false);
                  s = colon ? colon + 2 : spec.name;
               }
               else if(spec.type == baseSpecifier)
               {
                  if(spec.specifier == INT64) s = "int64";
                  else if(spec.specifier == INT128) s = "__int128";
                  else if(spec.specifier == FLOAT128) s = "__float128";
               }
               if(s)
               {
                  decl.declarators = initDeclarators = MkListOne(MkInitDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), null));
                  specifiers.Remove(spec);
                  FreeSpecifier(spec);
                  spec = null;
               }
            }
         }
         if(spec && spec.type != extendedSpecifier)
            gotType = true;
      }
   }
   if(variable && initDeclarators)
   {
      InitDeclarator d;
      for(d = initDeclarators.first; d; d = d.next)
      {
         Identifier id = GetDeclId(d.declarator);
         if(id && id.string && id.string[0])
         {
            if(curContext)
            {
               Symbol symbol;

               if(curContext == globalContext && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
               {
                  char name[1024];
                  int len = 0, stringLen;
                  if(defaultNameSpace)
                  {
                     memcpy(name, defaultNameSpace, defaultNameSpaceLen);
                     len += defaultNameSpaceLen;
                     name[len++] = ':';
                     name[len++] = ':';
                  }
                  if(currentNameSpace)
                  {
                     memcpy(name + len, currentNameSpace, currentNameSpaceLen);
                     len += currentNameSpaceLen;
                     name[len++] = ':';
                     name[len++] = ':';
                  }
                  stringLen = strlen(id.string);
                  memcpy(name + len, id.string, stringLen);
                  len += stringLen;
                  name[len] = 0;
                  delete id.string;
                  id.string = CopyString(name);
               }

               // Avoid memory leaks on duplicated symbols (BinaryTree::Add Would Fail)
               symbol = (Symbol)(curContext.templateTypesOnly ? curContext.parent : curContext).symbols.FindString(id.string);
               if(!symbol && strcmp(id.string, "strlen")) // Avoid overriding our definition of strlen or our 'uintsize' warning override won't take effect
               {
                  symbol = Symbol { string = CopyString(id.string), type = ProcessType(specifiers, d.declarator) };
                  if(strstr(symbol.string, "::"))
                     curContext.hasNameSpace = true;
                  if(!(curContext.templateTypesOnly ? curContext.parent : curContext).symbols.Add((BTNode)symbol))
                     excludedSymbols->Add(symbol);
                  // TODO: Add better support to count declarators
                  if(symbol.type && symbol.type.kind == arrayType && !symbol.type.arraySizeExp && d.initializer)
                  {
                     if(d.initializer.type == listInitializer)
                     {
                        char string[256];
                        sprintf(string, "%d",d.initializer.list->count);
                        symbol.type.arraySizeExp = MkExpConstant(string);
                        symbol.type.freeExp = true;
                     }
                     else if(d.initializer.type == expInitializer && d.initializer.exp.type == stringExp && d.initializer.exp.string)
                     {
                        char string[256];
                        int c, count = 0;
                        char ch;
                        bool escaped = false;
                        char * s = d.initializer.exp.string;
                        if(s[0] == 'L') s++;

                        // MAKE MORE ACCURATE
                        for(c = 1; (ch = s[c]); c++)
                        {
                           if(ch == '\\' && !escaped)
                              escaped = true;
                           else
                           {
                              count++;
                              escaped = false;
                           }
                        }

                        sprintf(string, "%d", count);
                        symbol.type.arraySizeExp = MkExpConstant(string);
                        symbol.type.freeExp = true;
                     }
                  }
               }
               decl.symbol = d.declarator.symbol = symbol;
            }
         }
      }
   }
   else
   {
      decl.symbol = Symbol { };
      excludedSymbols->Add(decl.symbol);
   }
   return decl;
}

Declaration MkStructDeclaration(OldList specifiers, OldList declarators, Specifier extStorage)
{
   Declaration decl { type = structDeclaration, declarators = declarators, specifiers = specifiers, extStorage = extStorage, loc = yylloc };
   if(specifiers != null)
   {
      bool gotType = false;
      Specifier spec, next;
      for(spec = specifiers.first; spec; spec = next)
      {
         next = spec.next;
         if(gotType && declarators == null && ((spec.type == nameSpecifier && spec.name) || spec.type == baseSpecifier))
         {
            const String s = null;
            if(spec.type == nameSpecifier)
            {
               const char * colon = RSearchString(spec.name, "::", strlen(spec.name), true, false);
               s = colon ? colon + 2 : spec.name;
            }
            else if(spec.type == baseSpecifier)
            {
               if(spec.specifier == INT64) s = "int64";
               else if(spec.specifier == INT128) s = "__int128";
               else if(spec.specifier == FLOAT128) s = "__float128";
            }
            if(s)
            {
               decl.declarators = declarators = MkListOne(MkStructDeclarator(MkDeclaratorIdentifier(MkIdentifier(s)), null));
               specifiers.Remove(spec);
               FreeSpecifier(spec);
               spec = null;
            }
         }
         if(spec && spec.type != extendedSpecifier)
            gotType = true;
      }
   }
   return decl;
}

Statement MkLabeledStmt(Identifier id, Statement statement)
{
   return { type = labeledStmt, labeled.id = id, labeled.stmt = statement, loc = yylloc };
}

Statement MkCaseStmt(Expression exp, Statement statement)
{
   return { type = caseStmt, caseStmt.exp = exp, caseStmt.stmt = statement, loc = yylloc };
}

Statement MkCompoundStmt(OldList declarations, OldList statements)
{
   return { type = compoundStmt, compound.declarations = declarations, compound.statements = statements, loc = yylloc };
}

Statement MkExpressionStmt(OldList expressions)
{
   return { type = expressionStmt, expressions = expressions, loc = yylloc };
}

Statement MkBadDeclStmt(Declaration decl)
{
   return { type = badDeclarationStmt, decl = decl, loc = yylloc };
}

Statement MkIfStmt(OldList exp, Statement statement, Statement elseStmt)
{
   return { type = ifStmt, ifStmt.exp = exp, ifStmt.stmt = statement, ifStmt.elseStmt = elseStmt, loc = yylloc };
}

Statement MkSwitchStmt(OldList exp, Statement statement)
{
   // To know it's a switch compound... (Don't want declarations in there... bugs)
   if(statement)
      statement.compound.isSwitch = true;
   return { type = switchStmt, switchStmt.exp = exp, switchStmt.stmt = statement, loc = yylloc };
}

Statement MkWhileStmt(OldList exp, Statement statement)
{
   return { type = whileStmt, whileStmt.exp = exp, whileStmt.stmt = statement, loc = yylloc };
}

Statement MkDoWhileStmt(Statement statement, OldList exp)
{
   return { type = doWhileStmt, doWhile.exp = exp, doWhile.stmt = statement, loc = yylloc };
}

Statement MkForStmt(Statement init, Statement check, OldList inc, Statement statement)
{
   return { type = forStmt, forStmt.init = init, forStmt.check = check, forStmt.increment = inc, forStmt.stmt = statement, loc = yylloc };
}

Statement MkForEachStmt(Identifier id, OldList exp, OldList filter, Statement statement)
{
   return { type = forEachStmt, forEachStmt.id = id, forEachStmt.exp = exp, forEachStmt.filter = filter, forEachStmt.stmt = statement, loc = yylloc };
}

Statement MkGotoStmt(Identifier id)
{
   return { type = gotoStmt, gotoStmt.id = id, loc = yylloc };
}

Statement MkContinueStmt()
{
   return { type = continueStmt, loc = yylloc };
}

Statement MkBreakStmt()
{
   return { type = breakStmt, loc = yylloc };
}

Statement MkReturnStmt(OldList exp)
{
   return { type = returnStmt, expressions = exp, loc = yylloc };
}

FunctionDefinition MkFunction(OldList specifiers, Declarator declarator, OldList declarationList)
{
   return _MkFunction(specifiers, declarator, declarationList, true);
}

FunctionDefinition _MkFunction(OldList specifiers, Declarator declarator, OldList declarationList, bool errorOnOmit)
{
   if(errorOnOmit)
   {
      Declarator funcDecl = GetFuncDecl(declarator);
      if(funcDecl && funcDecl.function.parameters)
      {
         TypeName tn;
         for(tn = funcDecl.function.parameters->first; tn; tn = tn.next)
         {
            if(tn.qualifiers || tn.declarator)
            {
               Identifier declID = tn.declarator ? GetDeclId(tn.declarator) : null;
               if(!declID)
               {
                  // Check for (void)
                  Specifier spec = tn.qualifiers ? tn.qualifiers->first : null;
                  if(!tn.declarator && !tn.prev && !tn.next && spec && !spec.next && spec.type == baseSpecifier && spec.specifier == VOID);
                  else
                     Compiler_Error($"parameter name omitted\n");
                  break;
               }
            }
         }
      }
   }
   return { specifiers = specifiers, declarator = declarator, declarations = declarationList };
}

void ProcessFunctionBody(FunctionDefinition func, Statement body)
{
   Declarator declarator = func.declarator;
   Declarator funcDecl = GetFuncDecl(declarator);
   Symbol symbol;

   func.body = body;

   if(funcDecl && funcDecl.function.parameters && body)
   {
      Context context = body.compound.context;
      TypeName param;
      for(param = funcDecl.function.parameters->first; param; param = param.next)
      {
         if(param.declarator)
         {
            Symbol symbol = null;
            Identifier id = GetDeclId(param.declarator);
            char * string = id ? id.string : null;
            if(string)
            {
               for(symbol = (Symbol)context.symbols.first; symbol; symbol = (Symbol)((BTNode)symbol).next)
                  if(!strcmp(symbol.string, string))
                     break;
               // This parameter is not shadowed by a local declaration
               if(!symbol && id)
               {
                  symbol = Symbol { string = CopyString(id.string), type = ProcessType(param.qualifiers, param.declarator), isParam = true };
                  if(!context.symbols.Add((BTNode)symbol))
                     excludedSymbols->Add(symbol);

                  param.declarator.symbol = symbol;
               }
            }
         }
      }
   }

   if(!declarator.symbol)
   {
      Identifier id = GetDeclId(declarator);

      if((currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess && strcmp(id.string, "__on_register_module"))
      {
         char name[1024];
         int len = 0, stringLen;
         if(defaultNameSpace)
         {
            memcpy(name, defaultNameSpace, defaultNameSpaceLen);
            len += defaultNameSpaceLen;
            name[len++] = ':';
            name[len++] = ':';
         }
         if(currentNameSpace)
         {
            memcpy(name + len, currentNameSpace, currentNameSpaceLen);
            len += currentNameSpaceLen;
            name[len++] = ':';
            name[len++] = ':';
         }
         stringLen = strlen(id.string);
         memcpy(name + len, id.string, stringLen);
         len += stringLen;
         name[len] = 0;
         delete id.string;
         id.string = CopyString(name);
      }
      symbol = Symbol { string = CopyString(id.string), type = ProcessType(func.specifiers, declarator) };
      if(strstr(symbol.string, "::"))
         globalContext.hasNameSpace = true;
      if(!globalContext.symbols.Add((BTNode)symbol))
         excludedSymbols->Add(symbol);
      declarator.symbol = symbol;
   }
   else
   {
      symbol = declarator.symbol;
      excludedSymbols->Remove(declarator.symbol);
      delete symbol.string;
      symbol.string = CopyString(GetDeclId(declarator).string);
      if(strstr(symbol.string, "::"))
         globalContext.hasNameSpace = true;
      if(!globalContext.symbols.Add((BTNode)symbol))
         excludedSymbols->Add(symbol);

      if(!symbol.type)
         symbol.type = ProcessType(func.specifiers, declarator);
   }
   if(symbol.type && (symbol.type.kind == functionType || symbol.type.kind == methodType))
   {
      if(!symbol.type.params.count)
      {
         Type type { refCount = 1 };
         symbol.type.params.Add(type);
      }
   }
   else
   {
      //printf("");
   }
}

External MkExternalFunction(FunctionDefinition function)
{
   External external { type = functionExternal, function = function, symbol = function.declarator.symbol };
   if(function.specifiers)
   {
      Specifier spec;
      for(spec = function.specifiers->first; spec; spec = spec.next)
         if(spec.type == baseSpecifier && spec.specifier == STATIC)
         {
            structDeclMode = declMode = staticAccess;
            break;
         }
   }

   if(external.symbol && !external.symbol.methodExternal)
      external.symbol.methodExternal = external;
   return external;
}

External MkExternalImport(char * name, ImportType importType, AccessMode importAccess)
{
   External external { type = importExternal };
   int len = strlen(name) - 2;
   external.importString = new char[len + 1];
   strncpy(external.importString, name+1, len);
   external.importString[len] = '\0';
   delete name;

   {
#ifdef _TIMINGS
      Time startTime = GetTime();
      Time time;
#endif
      ImportModule(external.importString, importType, importAccess, true);
      ImportModule(external.importString, importType, importAccess, false);
#ifdef _TIMINGS
      time = GetTime() - startTime;
      printf("Importing took %.3f seconds for %s\n", time, external.importString);
      externalImportTotalTime += time;
#endif
   }
   return external;
}

External MkExternalDeclaration(Declaration declaration)
{
   External external { type = declarationExternal, declaration = declaration, symbol = declaration ? declaration.symbol : null };
   if(declaration && declaration.type == initDeclaration && declaration.specifiers)
   {
      Specifier spec;
      for(spec = declaration.specifiers->first; spec; spec = spec.next)
         if(spec.type == baseSpecifier && spec.specifier == TYPEDEF)
         {
            structDeclMode = declMode = defaultAccess;
            break;
         }
         else if(spec.type == baseSpecifier && spec.specifier == STATIC)
         {
            structDeclMode = declMode = staticAccess;
            break;
         }
   }
   if(declaration && declaration.symbol && !declaration.symbol.methodExternal)
      declaration.symbol.methodExternal = external;
   return external;
}

External MkExternalNameSpace(Identifier identifier)
{
   External external { type = nameSpaceExternal, id = identifier };
   currentNameSpace = identifier ? identifier.string : null;
   currentNameSpaceLen = currentNameSpace ? strlen(currentNameSpace) : 0;
   return external;
}

void SetClassTemplateArgs(Specifier spec, OldList templateArgs)
{
   if(spec.type == nameSpecifier)
   {
      Symbol symbol = spec.symbol;
      spec.templateArgs = templateArgs;
      if(templateArgs && templateArgs.first)
      {
         char templateString[1024];
         TemplateArgument arg;
         strcpy(templateString, symbol ? symbol.string : spec.name);
         strcat(templateString, "<");
         for(arg = templateArgs.first; arg; arg = arg.next)
         {
            char argument[256];
            argument[0] = '\0';
            switch(arg.type)
            {
               case expression:
               {
                  char expString[1024];
                  Class backupThisClass = thisClass;
                  thisClass = null;
                  expString[0] = '\0';
                  // Will this work here?
                  /*
                  Location oldLocation = yylloc;
                  File backFileInput = fileInput;
                  declMode = 0;
                  resetScanner();
                  */

                  // TESTING THIS SCANNER RESUME STUFF
                  /*
                  resetScanner();
                  yylloc = oldLocation;
                  fileInput = backFileInput;
                  if(fileInput)
                  {
                     fileInput.Seek(yylloc.start.pos, start);
                     resetScannerPos(&yylloc.start);
                     yychar = -2;
                  }
                  */

                  //ProcessExpressionType(arg.expression);
                  //ComputeExpression(arg.expression);
                  PrintExpression(arg.expression, expString);
                  strcat(argument, expString);
                  thisClass = backupThisClass;
                  break;
               }
               case identifier:
               {
                  strcat(argument, arg.identifier.string);
                  break;
               }
               case type:
               {
                  char * typeString = StringFromSpecDecl(arg.templateDatatype.specifiers, arg.templateDatatype.decl);
                  strcat(argument, typeString);
                  delete typeString;
                  break;
               }
            }
            if(argument[0])
            {
               if(arg.prev) strcat(templateString, ", ");
               if(arg.name)
               {
                  strcat(templateString, arg.name.string);
                  strcat(templateString, " = ");
               }
               strcat(templateString, argument);
            }
         }
         {
            int len = strlen(templateString);
            if(templateString[len-1] == '>') templateString[len++] = ' ';
            templateString[len++] = '>';
            templateString[len++] = '\0';
         }
         // printf("SetClassTemplateArgs templateString: %s\n", templateString);
         symbol = FindClass(templateString);
         if(!symbol && spec.symbol)
         {
            // If class was only decl'ed, invoke DeclClass on this templated class as well
            symbol = _DeclClass(null, templateString);
            symbol.notYetDeclared = true;
         }
         // Add a reference to all templated class to the basic class
         if(spec.symbol)
            spec.symbol.templatedClasses.Add(OldLink { data = symbol });
         delete spec.name;
         spec.symbol = symbol;
         spec.name = CopyString(symbol ? symbol.string : templateString);
      }
   }
   else
      FreeList(templateArgs, FreeTemplateArgument);
}

Specifier _MkSpecifierName(const char * name, Symbol symbol, OldList templateArgs)
{
   Specifier spec { type = nameSpecifier };

   if(name)
   {
      if(!symbol)
      {
         TemplatedType templatedType = FindTemplateTypeParameter(curContext, name);
         if(templatedType)
         {
            spec.templateParameter = templatedType.param;
            spec.type = templateTypeSpecifier;
            return spec;
         }
         else
            symbol = FindClass(name);
      }
      if(symbol && symbol.registered && symbol.registered.isRemote == 1)
      {
         char className[1024];
         strcpy(className, "DCOMClient_");
         if(!strncmp(name, className, strlen(className)))
            spec.name = CopyString(name);
         else
         {
            strcat(className, name);
            spec.name = CopyString(className);
         }
      }
      else if(symbol)
      {
         char nameSpace[1024];
         char * c = strstr(name, symbol.string);
         spec.name = CopyString(symbol.string);
         if(c && c >= name + 2 && c[-1] == ':' && c[-2] == ':')
         {
            if(c > name + 2)
            {
               memcpy(nameSpace, name, c - name - 2);
               nameSpace[c-name] = 0;
               spec.nsSpec = _MkSpecifierName(nameSpace, null, null);
            }
            else
               spec.nsSpec = _MkSpecifierName(null, null, null);
         }
      }
      else
         spec.name = CopyString(name);
      spec.symbol = symbol;
      if(templateArgs != null)
         SetClassTemplateArgs(spec, templateArgs);
   }
   return spec;
}

public Specifier MkSpecifierName(const char * name)
{
   return _MkSpecifierName(name, null, null);
}

public Specifier MkSpecifierNameArgs(const char * name, OldList * templateArgs)
{
   return _MkSpecifierName(name, null, templateArgs);
}

/*
Specifier MkClassName(const char * string)
{
   return { type = SpecifierClass, name = CopyString(string) };
}
*/
ClassFunction MkClassFunction(OldList specifiers, Specifier _class, Declarator decl, OldList declList)
{
   return { specifiers = specifiers, /*_class = _class,*/ declarator = decl, declarations = declList };
}

void ProcessClassFunctionBody(ClassFunction func, Statement body)
{
   Symbol symbol;

   Declarator decl = func.declarator;
   //TESTING THIS
   //Declarator decl = GetFuncDecl(func.declarator);
   Declarator funcDecl = GetFuncDecl(func.declarator);

   func.body = body;

   if(decl && !decl.symbol)
   {
      OldList * symbolSpecs = MkList();

      // WHAT WILL WE DO WITH THIS? Double instances?
      //if(decl.function.parameters && body)
      if(funcDecl && funcDecl.function.parameters && body)
      {
         Context context = body.compound.context;
         TypeName param;
         for(param = funcDecl.function.parameters->first; param; param = param.next)
         {
            if(param.declarator)
            {
               Symbol symbol = null;
               Identifier id = GetDeclId(param.declarator);
               char * string = id ? id.string : null;
               if(string)
               {
                  symbol = (Symbol)context.symbols.FindString(string);
               }
               // This parameter is not shadowed by a local declaration
               if(!symbol && id)
               {
                  symbol = Symbol
                  {
                     string = CopyString(id.string);
                     type = ProcessType(param.qualifiers, param.declarator);
                     isParam = true;
                  };

                  if(!context.symbols.Add((BTNode)symbol))
                     excludedSymbols->Add(symbol);

                  param.declarator.symbol = symbol;
               }
            }
         }
      }
      //////////////////////////////////

      symbol = Symbol
      {

      };

      {
         Identifier id = GetDeclId(funcDecl);
         if(id)
         {
            int c;
            for(c = strlen(id.string)-1; c >= 0; c--)
            {
               if(id.string[c] == ':')
               {
                  char * string = CopyString(id.string + c + 1);
                  id.string[c - 1] = 0;
                  id._class = MkSpecifierName(id.string);
                  delete id.string;
                  id.string = string;
                  break;
               }
            }
            symbol.string = CopyString(id.string);
         }
      }

      if(func.specifiers)
      {
         Specifier spec;
         for(spec = func.specifiers->first; spec; spec = spec.next)
            symbolSpecs->Add(CopySpecifier(spec));
      }
      symbol.type = ProcessType(symbolSpecs, decl);
      decl.symbol = symbol;

      excludedSymbols->Add(symbol);

      FreeList(symbolSpecs, FreeSpecifier);
   }
}

OldList * MkSpecsClass(Specifier _class)
{
   OldList * list = MkList();
   ListAdd(list, _class);
   return list;
}

MemberInit MkMemberInit(OldList ids, Initializer initializer)
{
   return { identifiers = ids, initializer = initializer };
}

MemberInit MkMemberInitExp(Expression idExp, Initializer initializer)
{
   MemberInit init { initializer = initializer, identifiers = MkList() };
   Expression exp;

   for(exp = idExp; exp && exp.type == memberExp; exp = exp.member.exp)
   {
      init.identifiers->Insert(null, exp.member.member);
      exp.member.member = null;
   }
   if(exp && exp.type == identifierExp)
   {
      init.identifiers->Insert(null, exp.identifier);
      exp.identifier = null;
   }
   FreeExpression(idExp);
   return init;
}

MembersInit MkMembersInitList(OldList dataMembers)
{
   return { type = dataMembersInit, dataMembers = dataMembers };
}

MembersInit MkMembersInitMethod(ClassFunction function)
{
   return { type = methodMembersInit, function = function };
}

Instantiation MkInstantiation(Specifier _class, Expression exp, OldList members)
{
   return { _class = _class, exp = exp, members = members };
}

Instantiation MkInstantiationNamed(OldList specs, Expression exp, OldList members)
{
   Instantiation inst { exp = exp, members = members };

   if(specs != null)
   {
      Specifier spec;
      for(spec = specs.first; spec; spec = spec.next)
         if(spec.type == nameSpecifier /*classSpecifier*/)
         {
            inst._class = spec;
            specs.Remove(spec);
            break;
         }

      FreeList(specs, FreeSpecifier);

      if(!spec)
      {
         Compiler_Error($"Expecting class specifier\n");
         inst._class = MkSpecifierName /*MkClassName*/("");
         //exit(1);
         //return null;
      }
   }
   return inst;
}

ClassDef MkClassDefAccessOverride(AccessMode access, Identifier id)
{
   return { type = accessOverrideClassDef, id = id, memberAccess = access };
}

ClassDef MkClassDefMemberAccess()
{
   return { type = memberAccessClassDef };
}

ClassDef MkClassDefDeclaration(Declaration decl)
{
   return { type = declarationClassDef, decl = decl };
}

ClassDef MkClassDefClassData(Declaration decl)
{
   return { type = classDataClassDef, decl = decl };
}

ClassDef MkClassDefDesigner(const char * designer)
{
   return { type = classDesignerClassDef, designer = CopyString(designer) };
}

ClassDef MkClassDefNoExpansion()
{
   return { type = classNoExpansionClassDef };
}

ClassDef MkClassDefFixed()
{
   return { type = classFixedClassDef };
}

ClassDef MkClassDefDesignerDefaultProperty(Identifier id)
{
   return { type = designerDefaultPropertyClassDef, defaultProperty = id };
}

ClassDef MkClassDefDefaultProperty(OldList defProperties)
{
   return { type = defaultPropertiesClassDef, defProperties = defProperties };
}

ClassDef MkClassDefFunction(ClassFunction function)
{
   ClassDef def { };
   if(function && function.declarator)
   {
      Declarator funcDecl = GetFuncDecl(function.declarator);
      if(funcDecl && funcDecl.declarator && funcDecl.declarator.type == bracketsDeclarator)
      {
         def.type = declarationClassDef;
         def.decl = MkStructDeclaration(function.specifiers, MkListOne(MkStructDeclarator(function.declarator, null)), null);
         function.declarator = null;
         function.specifiers = null;
         FreeClassFunction(function);
         return def;
      }
   }
   def.type = functionClassDef;
   def.function = function;
   return def;
}

Symbol DeclClassAddNameSpace(Specifier _class, const char * className)
{
   char name[1024];
   int len = 0, stringLen;
   name[0] = '\0';
   if(className[0] != ':' && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess && (!_class || _class.name))
   {
      if(defaultNameSpace)
      {
         memcpy(name, defaultNameSpace, defaultNameSpaceLen);
         len += defaultNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }
      if(currentNameSpace)
      {
         memcpy(name + len, currentNameSpace, currentNameSpaceLen);
         len += currentNameSpaceLen;
         name[len++] = ':';
         name[len++] = ':';
      }
   }
   stringLen = strlen(className);
   memcpy(name + len, className, stringLen);
   len += stringLen;
   name[len] = 0;
   return _DeclClass(_class, name);
}

Symbol DeclClass(Specifier _class, const char * name)
{
   if(_class || strchr(name, ':'))
      return _DeclClass(_class, name);
   else
      return DeclClassAddNameSpace(_class, name);
}

Symbol _DeclClass(Specifier _class, const char * name)
{
   Symbol symbol;
   char nameBuffer[1024];
   if(_class)
   {
      strcpy(nameBuffer,  _class.name ? _class.name : "");
      strcat(nameBuffer, "::");
      strcat(nameBuffer, name);
      name = nameBuffer;
   }

   symbol = FindClass(name);
   if(!symbol)
   {
      /*
      Context classContext;
      for(classContext = curContext; classContext && !classContext.classDef; classContext = classContext.parent);
      if(classContext)
      {

      }
      */
      if(name[0] == ':' && name[1] == ':')
         name += 2;
      symbol = Symbol
      {
         string = CopyString(name);
         notYetDeclared = true;
      };
      if(!globalContext.classes.Add((BTNode)symbol))
         excludedSymbols->Add(symbol);

      {
         int start = 0, c;
         char ch;
         for(c = 0; (ch = name[c]); c++)
         {
            if(ch == '.' || (ch == ':' && name[c+1] == ':'))
            {
               if(ch == ':') c++;
               start = c+1;
            }
         }
         if(start && c - start)
            symbol.shortName = CopyString(name + start);
      }
   }
   return symbol;
}

void SetupBaseSpecs(Symbol symbol, OldList baseSpecs)
{
   if(baseSpecs && baseSpecs.first && ((Specifier)baseSpecs.first).type == nameSpecifier)
   {
      char name[1024];
      Symbol baseClass;
      char * tpl;
      strcpy(name, ((Specifier)baseSpecs.first).name);
      tpl = strchr(name, '<');
      if(tpl) *tpl = 0;

      baseClass = FindClass(name);
      if(baseClass && baseClass.ctx)
      {
         TemplatedType copy;
         for(copy = (TemplatedType)baseClass.ctx.templateTypes.first; copy; copy = (TemplatedType)copy.next)
         {
            TemplatedType type { key = copy.key, param = copy.param };
            if(!curContext.templateTypes.Add((BTNode)type))
               delete type;
         }
      }
      else if(baseClass && baseClass.registered)
      {
         Class sClass;
         for(sClass = baseClass.registered; sClass; sClass = sClass.base)
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
                     p.param = param = TemplateParameter
                     {
                        identifier = MkIdentifier(p.name), type = p.type,
                        dataTypeString = p.dataTypeString /*, dataType = { specs, decl }*/
                     };
                  }
                  type = TemplatedType { key = (uintptr)p.name, param = param };
                  if(!curContext.templateTypes.Add((BTNode)type))
                     delete type;
               }
            }
         }
      }
   }
}

ClassDefinition MkClass(Symbol symbol, OldList baseSpecs, OldList definitions)
{
   ClassDefinition classDef;
   SetupBaseSpecs(symbol, baseSpecs);
   if(symbol.ctx)
   {
      ClassDefinition classDef = symbol.ctx.classDef;
      if(classDef)
      {
         // This can occur if two instances of a class are defined...
         // To avoid dangling 'parent' Contexts, we free the previous class definition
         External external;
         for(external = ast->first; external; external = external.next)
         {
            if(external.type == classExternal && external._class == classDef)
            {
               ast->Remove(external);
               FreeExternal(external);
               break;
            }
         }
      }
      FreeContext(symbol.ctx);
      delete symbol.ctx;
   }
   symbol.ctx = curContext;
   classDef = { symbol = symbol, _class = MkSpecifierName(symbol.string), baseSpecs = baseSpecs, definitions = definitions, nameLoc = symbol.nameLoc };
   curContext.classDef = classDef;
   return classDef;
}

Expression MkExpInstance(Instantiation inst)
{
   return { type = instanceExp, instance = inst };
}

External MkExternalClass(ClassDefinition _class)
{
   return { type = classExternal, _class = _class, symbol = _class.symbol };
}

PropertyDef MkProperty(OldList specs, Declarator decl, Identifier id, Statement setStmt, Statement getStmt)
{
   PropertyDef prop
   {
      specifiers = specs;
      declarator = decl;
      setStmt = setStmt;
      getStmt = getStmt;
   };
   Symbol symbol;
   Type type = ProcessType(specs, decl);
   if(!id)
   {
      char typeString[1024];
      typeString[0] = '\0';
      PrintTypeNoConst(type, typeString, false, true);
      id = MkIdentifier(typeString);
      prop.conversion = true;
   }
   prop.id = id;

   symbol = Symbol
   {
      string = CopyString(id.string);
      type = type;
   };
   excludedSymbols->Add(symbol);
   prop.symbol = symbol;
   return prop;
}

ClassDef MkClassDefProperty(PropertyDef propertyDef)
{
   return { type = propertyClassDef, propertyDef = propertyDef, loc = yylloc };
}

ClassDef MkClassDefClassProperty(PropertyDef propertyDef)
{
   return { type = classPropertyClassDef, propertyDef = propertyDef, loc = yylloc };
}

ClassDef MkClassDefClassPropertyValue(Identifier id, Initializer initializer)
{
   return { type = classPropertyValueClassDef, id = id, initializer = initializer, loc = yylloc };
}

int CheckType(const char * text)
{
#ifdef _TIMINGS
   Time startTime = GetTime();
#endif

   if(inIDE)
   {
      // Help out the Debugger with Windows files until we improve the parser
      if(!strcmp(text, "WINAPI"))
         return EXT_DECL;
      else if(!strcmp(text, "BOOL") || !strcmp(text, "WINUSERAPI"))
         return TYPE_NAME;
   }

   if(FindTemplateTypeParameter(curContext, text))
   {
#ifdef _TIMINGS
      checkTypeTotalTime += GetTime() - startTime;
#endif
      return TYPE_NAME;
   }
   if(FindType(curContext, text))
   {
#ifdef _TIMINGS
      checkTypeTotalTime += GetTime() - startTime;
#endif
      return TYPE_NAME;
   }
   if(FindClass(text))
   {
#ifdef _TIMINGS
      checkTypeTotalTime += GetTime() - startTime;
#endif
      return TYPE_NAME;
   }
#ifdef _TIMINGS
   checkTypeTotalTime += GetTime() - startTime;
#endif
   return IDENTIFIER;
}

int check_type()
{
   return CheckType(yytext);
}

Context PushContext()
{
   Context ctx { parent = curContext };
   curContext = ctx;
   return ctx;
}

void PopContext(Context ctx)
{
   curContext = ctx.parent;
}

Symbol FindType(Context ctx, const char * name)
{
   Symbol type = null;
   if(ctx)
   {
      //char output[8192];
      type = (Symbol)ctx.types.FindString(name);
      /*if(!strcmp(name, "intptr_t") && !type)
      {
         ctx.types.Print(output, depthOrder);
         puts(output);
      }*/
      if(!type && ctx.parent)
         type = FindType(ctx.parent, name);
   }
   return type;
}

Symbol FindStruct(Context ctx, const char * name)
{
   Symbol type = null;
   if(ctx)
   {
      type = (Symbol)ctx.structSymbols.FindString(name);
      if(!type && ctx.parent)
         type = FindStruct(ctx.parent, name);
   }
   return type;
}

TemplatedType FindTemplateTypeParameter(Context ctx, const char * name)
{
   TemplatedType templatedType = null;
   if(curContext)
   {
      templatedType = (TemplatedType)ctx.templateTypes.FindString(name);
      if(!templatedType && ctx.parent)
         templatedType = FindTemplateTypeParameter(ctx.parent, name);
   }
   return templatedType;
}

bool ModuleAccess(Module searchIn, Module searchFor)
{
   SubModule subModule;

   if(searchFor == searchIn)
      return true;

   for(subModule = searchIn.modules.first; subModule; subModule = subModule.next)
   {
      if(subModule.importMode == publicAccess /*|| searchIn == searchIn.application*/)
      {
         if(ModuleAccess(subModule.module, searchFor))
            return true;
      }
   }
   return false;
}

ModuleImport FindModule(Module moduleToFind)
{
   ModuleImport module;
   if(!moduleToFind.name)
      return mainModule;
   for(module = imports->first; module; module = module.next)
      if(module.name && !strcmp(module.name, moduleToFind.name))
         break;
   if(!module)
   {
      module = ModuleImport
      {
         name = CopyString(moduleToFind.name), importType = moduleToFind.importType,
         importAccess = ModuleAccess(privateModule, moduleToFind) ? publicAccess : privateAccess
      };
      imports->Add(module);
   }
   return module;
}

/*
// TO REMOVE: OBSOLETE...
static void GetFullClassNameSpace(NameSpace * ns, char * name)
{
   if(ns->parent)
   {
      GetFullClassNameSpace(ns->parent, name);
      strcat(name, ns->name);
      strcat(name, "::");
   }
}

static char * GetFullClassName(Class c, char * name)
{
   NameSpace * nameSpace;
   name[0] = 0;
   GetFullClassNameSpace(c.nameSpace, name);
   strcat(name, c.name);
   return name;
}
*/

public Symbol FindClass(const char * name)
{
#ifdef _TIMINGS
   Time startTime = GetTime();
#endif
   Symbol cl = null;
   Class _class;
   bool global = false;
   char fullName[1024];
   fullName[0] = 0;

   if(name[0] == ':' && name[1] == ':')
   {
      global = true;
      name += 2;
   }

   if(!global && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
   {
      int len = 0, stringLen;
      if(defaultNameSpace)
      {
         memcpy(fullName, defaultNameSpace, defaultNameSpaceLen);
         len += defaultNameSpaceLen;
         fullName[len++] = ':';
         fullName[len++] = ':';
      }
      if(currentNameSpace)
      {
         memcpy(fullName + len, currentNameSpace, currentNameSpaceLen);
         len += currentNameSpaceLen;
         fullName[len++] = ':';
         fullName[len++] = ':';
      }
      stringLen = strlen(name);
      memcpy(fullName + len, name, stringLen);
      len += stringLen;
      fullName[len] = 0;
      cl = globalContext ? (Symbol)globalContext.classes.FindString(fullName) : null;
   }

   if(!cl)
      cl = globalContext ? (Symbol)globalContext.classes.FindString(name) : null;

   if(!cl && !global)
   {
#ifdef _TIMINGS
      Time startTime = GetTime();
#endif
      // Ignore name space name when searching
      for(cl = globalContext ? (Symbol)globalContext.classes.first : null; cl; cl = (Symbol)((BTNode)cl).next)
      {
         /*
         int start = 0, c;
         char * string = cl.string;
         char ch;
         for(c = 0; (ch = string[c]); c++)
         {
            if(ch == '.' || (ch == ':' && string[c+1] == ':'))
            {
               if(ch == ':') c++;
               start = c+1;
            }
         }
         if(start && c - start)
         {
            if(!strcmp(string + start, name))
               break;
         }
         */
         if(cl.shortName && !strcmp(cl.shortName, name))
            break;
      }
#ifdef _TIMINGS
      findClassIgnoreNSTotalTime += GetTime() - startTime;
#endif
   }
   if(!cl)
   {
      _class = null;
      if(!global && (currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
         _class = eSystem_FindClass(privateModule, fullName);
      if(!_class)
         _class = eSystem_FindClass(privateModule, name);

      if(_class)
      {
         name = _class.fullName;

         cl = (Symbol)globalContext.classes.FindString(name);
         if(!cl)
         {
            cl = Symbol
            {
               string = CopyString(name);
               registered = _class;
               notYetDeclared = true;
               imported = true;
            };
            _class.symbol = cl;
            if(_class.module)
               cl.module = FindModule(_class.module);
            else
               cl.module = mainModule;
            if(!globalContext.classes.Add((BTNode)cl))
               excludedSymbols->Add(cl);
            if(strcmp(name, _class.name))
               cl.shortName = CopyString(_class.name);
         }
      }
   }
#ifdef _TIMINGS
   findClassTotalTime += GetTime() - startTime;
#endif
   return cl;
}

void CopyTypeInto(Type type, Type src)
{
   type = *src;

   type.name = CopyString(src.name);
   type.typeName = CopyString(src.typeName);
   type.refCount = 1;

   if(src.kind == enumType)
   {
      NamedLink64 member;

      type.members.Clear();
      // This must have been a mistake: member = **type**.members.first
      for(member = src.members.first; member; member = member.next)
      {
         type.members.Add(NamedLink64 { name = CopyString(member.name), data = member.data });
      }
      type.enumName = CopyString(src.enumName);
   }
   else if(src.kind == structType || src.kind == unionType)
   {
      Type member;
      // Tricky stuff... will be removed from list only when ref count reaches 0
      for(member = type.members.first; member; member = member.next)
         member.refCount++;
      type.enumName = CopyString(src.enumName);
   }
   else if(src.kind == functionType)
   {
      Type param;
      type.returnType.refCount++;
      for(param = type.params.first; param; param = param.next)
         param.refCount++;
   }
   else if(src.kind == pointerType || src.kind == arrayType)
   {
      type.type.refCount++;
      if(src.kind == arrayType)
      {
         if(type.arraySizeExp)
            type.arraySizeExp = CopyExpression(type.arraySizeExp);
      }
   }
}

static Type ProcessTypeSpecs(OldList specs, bool assumeEllipsis, bool keepTypeName)
{
   Type specType { refCount = 1, kind = intType, isSigned = true };
   if(specs != null)
   {
      bool isTypedef = false;
      Specifier spec;
      bool isLong = false;
      for(spec = specs.first; spec; spec = spec.next)
      {
         if(spec.type == extendedSpecifier)
         {
            ExtDecl extDecl = spec.extDecl;
            if(extDecl.type == extDeclString)
            {
               if(!strcmp(spec.extDecl.s, "__declspec(dllexport)") || !strcmp(spec.extDecl.s, "dllexport"))
                  specType.dllExport = true;
               else if(!strcmp(spec.extDecl.s, "__declspec(stdcall)") || !strcmp(spec.extDecl.s, "stdcall"))
                  specType.attrStdcall = true;
            }
            else if(extDecl.type == extDeclAttrib)
            {
               OldList * attribs = extDecl.attr.attribs;
               if(attribs)
               {
                  Attribute attr;
                  for(attr = attribs->first; attr; attr = attr.next)
                  {
                     String s = attr.attr;
                     if(s)
                     {
                        if(!strcmp(s, "dllexport"))
                           specType.dllExport = true;
                        else if(!strcmp(s, "stdcall"))
                           specType.attrStdcall = true;
                        else if(!strcmp(s, "__vector_size__"))
                           specType.isVector = true;
                     }
                  }
               }
               specType.keepCast = true;
            }
         }

         if(spec.specifier != CONST && (specType.kind == structType || specType.kind == unionType))
         {
            FreeType(specType);
            specType = { kind = intType, isSigned = true, refCount = 1 };
         }

         if(isTypedef && keepTypeName)
         {
            specType.kind = dummyType;
            return specType;
         }
         else if(spec.type == baseSpecifier)
         {
            if(spec.specifier == TYPEDEF)
               isTypedef = true;
            else if(spec.specifier == VOID) specType.kind = voidType;
            else if(spec.specifier == CHAR) specType.kind = charType;
            else if(spec.specifier == INT) { if(specType.kind != shortType && specType.kind != longType && !isLong) specType.kind = intType; }
            else if(spec.specifier == _BOOL || spec.specifier == BOOL)
               specType.kind = _BoolType;
            else if(spec.specifier == UINT) { if(specType.kind != shortType && specType.kind != longType) specType.kind = intType; specType.isSigned = false; }
            else if(spec.specifier == INT64) specType.kind = int64Type;
            else if(spec.specifier == INT128) specType.kind = int128Type;
            else if(spec.specifier == FLOAT128) specType.kind = float128Type;
            else if(spec.specifier == VALIST)
               specType.kind = vaListType;
            else if(spec.specifier == SHORT) specType.kind = shortType;
            else if(spec.specifier == LONG)
            {
               if(isLong || (targetBits == 64 && targetPlatform != win32))
                  specType.kind = int64Type;
               else
                  specType.kind = intType;
               specType.isLong = true;
               isLong = true;
            }
            else if(spec.specifier == FLOAT) specType.kind = floatType;
            else if(spec.specifier == DOUBLE) specType.kind = doubleType;
            else if(spec.specifier == SIGNED) specType.isSigned = true;
            else if(spec.specifier == UNSIGNED) specType.isSigned = false;
            else if(spec.specifier == CONST)
               specType.constant = true;
            else if(spec.specifier == TYPED_OBJECT || spec.specifier == ANY_OBJECT || spec.specifier == CLASS)
            {
               switch(spec.specifier)
               {
                  case TYPED_OBJECT:   specType.classObjectType = typedObject;   break;
                  case ANY_OBJECT:     specType.classObjectType = anyObject;     break;
                  case CLASS:          specType.classObjectType = classPointer;  break;
               }
               specType.kind = classType;
               specType._class = FindClass("class");
            }
            else if(spec.specifier == THISCLASS)
               specType.kind = thisClassType;
         }
         else if(spec.type == nameSpecifier)
         {
            if(spec.name && (!strcmp(spec.name, "intptr") || !strcmp(spec.name, "uintptr")))
            {
               specType.kind = intPtrType;
               if(!strcmp(spec.name, "uintptr"))
                  specType.isSigned = false;
            }
            else if(spec.name && (!strcmp(spec.name, "uintsize") || !strcmp(spec.name, "intsize")))
            {
               specType.kind = intSizeType;
               if(!strcmp(spec.name, "uintsize"))
                  specType.isSigned = false;
            }
            else
            {
               Symbol symbol = spec.name ? FindType(curContext, spec.name) : null;
               if(symbol && symbol.type)
               {
                  // Keep constant qualifier
                  bool isConstant = specType.constant;
                  // Free Type Contents:
                  Type dummy { };
                  *dummy = *specType;
                  FreeType(dummy);

                  CopyTypeInto(specType, symbol.type);
                  specType.constant = isConstant;
                  delete specType.typeName;
                  specType.typeName = CopyString(symbol.type.name);
               }
               else if(!isTypedef) // !specType.kind)    // TESTING THIS FOR enum / typedef problem
               {
                  // key.sym enum values need FindClass:
                  specType._class = spec.name ? FindClass(spec.name) : null;
                  specType.kind = classType;
                  if(!specType._class)
                     specType.kind = intType;
               }
            }
         }
         else if(spec.type == enumSpecifier)
         {
            specType.kind = enumType;
            specType.enumName = spec.id ? CopyString(spec.id.string) : null;
            specType.members.Clear();

            if(spec.list)
            {
               Enumerator e;
               for(e = spec.list->first; e; e = e.next)
               {
                  NamedLink64 i { name = CopyString(e.id.string) };
                  if(e.exp && e.exp.type == constantExp && e.exp.constant)
                     i.data = strtoll(e.exp.constant, null, 0);
                  specType.members.Add(i);
               }
            }
         }
         else if(spec.type == templateTypeSpecifier)
         {
            specType.kind = templateType;
            specType.templateParameter = spec.templateParameter;
         }
         else if(spec.type == structSpecifier || spec.type == unionSpecifier)
         {
            Symbol _class = spec.id ? FindClass(spec.id.string) : null;
            if(_class)
            {
               specType.declaredWithStruct = true;
               if(!_class.registered || _class.registered.type != structClass)
                  specType.directClassAccess = true;     // TODO: Need to clarify what 'directClassAccess' is about
               specType._class = _class;
               specType.kind = classType;
               break;
            }
            specType.members.Clear();
            if(spec.type == structSpecifier)
               specType.kind = structType;
            else if(spec.type == unionSpecifier)
               specType.kind = unionType;
            if(spec.id)
            {
               // TESTING THIS HERE... Had 0 type size
               if(!spec.definitions && !isTypedef)
               {
                  Symbol symbol = spec.id.string ? FindSymbol(spec.id.string, curContext, globalContext, true, false) : null;
                  if(symbol && symbol.type)
                  {
                     specType = *symbol.type;
                     specType.name = CopyString(symbol.type.name);
                     specType.typeName = CopyString(spec.name);
                     specType.enumName = CopyString(symbol.type.enumName);
                     specType.refCount = 1;

                     if(symbol.type.kind == enumType)
                     {
                        NamedLink64 member;

                        specType.members.Clear();
                        for(member = symbol.type.members.first; member; member = member.next)
                        {
                           NamedLink64 item { name = CopyString(member.name), data = member.data };
                           specType.members.Add(item);
                        }
                     }
                     else if(symbol.type.kind == structType || symbol.type.kind == unionType)
                     {
                        Type member;
                        // Tricky stuff... will be removed from list only when ref count reaches 0
                        for(member = specType.members.first; member; member = member.next)
                           member.refCount++;
                     }
                     else if(symbol.type.kind == functionType)
                     {
                        Type param;
                        specType.returnType.refCount++;
                        for(param = specType.params.first; param; param = param.next)
                           param.refCount++;
                     }
                     else if(symbol.type.kind == pointerType || symbol.type.kind == arrayType)
                     {
                        specType.type.refCount++;
                        if(symbol.type.kind == arrayType)
                        {
                           if(specType.arraySizeExp)
                              specType.arraySizeExp = CopyExpression(specType.arraySizeExp);
                        }

                     }
                  }
                  else
                     specType.enumName = CopyString(spec.id.string);
               }
               else
                  specType.enumName = CopyString(spec.id.string);
            }

            if(spec.definitions)
            {
               ClassDef def;
               for(def = spec.definitions->first; def; def = def.next)
               {
                  if(def.type == declarationClassDef && def.decl.type == structDeclaration)
                  {
                     Declaration decl = def.decl;
                     if(decl.declarators)
                     {
                        Declarator d;
                        for(d = decl.declarators->first; d; d = d.next)
                        {
                           Type memberType = ProcessType(decl.specifiers, d);
                           specType.members.Add(memberType);
                        }
                     }
                     else if(decl.specifiers)
                     {
                        Type memberType = ProcessType(decl.specifiers, null);
                        specType.members.Add(memberType);
                     }
                  }
               }
            }
            break;
         }
         else if(spec.type == subClassSpecifier)
         {
            specType.kind = subClassType;
            specType._class = spec._class.symbol;
         }
      }
   }
   else if(assumeEllipsis)
      specType.kind = ellipsisType;
   return specType;
}

static Type ProcessTypeDecls(OldList specs, Declarator decl, Type parentType)
{
   Type type = parentType;
   Declarator subDecl = decl ? decl.declarator : null;
   bool isVector = false;
   if(decl && (decl.type == extendedDeclarator || decl.type == extendedDeclaratorEnd))
   {
      ExtDecl extDecl = decl.extended.extended;
      if(extDecl && extDecl.type == extDeclAttrib)
      {
         OldList * attribs = extDecl.attr.attribs;
         if(attribs)
         {
            Attribute attr;
            for(attr = attribs->first; attr; attr = attr.next)
            {
               String s = attr.attr;
               if(s)
                  if(!strcmp(s, "__vector_size__"))
                     isVector = true;
            }
         }
      }
   }

   if(!parentType)
      type = ProcessTypeSpecs(specs, decl == null, (decl && decl.type == extendedDeclaratorEnd && !isVector) ? true : false);
   if(decl)
   {
      switch(decl.type)
      {
         case bracketsDeclarator: break;
         case extendedDeclarator:
         case extendedDeclaratorEnd:
         {
            ExtDecl extDecl = decl.extended.extended;
            if(extDecl)
            {
               switch(extDecl.type)
               {
                  case extDeclString:
                  {
                     String s = extDecl.s;
                     if(s)
                     {
                        if(!strcmp(s, "__declspec(dllexport)") || !strcmp(s, "dllexport"))
                           type.dllExport = true;
                        else if(!strcmp(s, "__declspec(stdcall)") || !strcmp(s, "stdcall"))
                           type.attrStdcall = true;
                     }
                     break;
                  }
                  case extDeclAttrib:
                  {
                     OldList * attribs = extDecl.attr.attribs;
                     if(attribs)
                     {
                        Attribute attr;
                        for(attr = attribs->first; attr; attr = attr.next)
                        {
                           String s = attr.attr;
                           if(s)
                           {
                              if(!strcmp(s, "dllexport"))
                                 type.dllExport = true;
                              else if(!strcmp(s, "stdcall"))
                                 type.attrStdcall = true;
                              else if(!strcmp(s, "__vector_size__"))
                              {
                                 type.isVector = true;
                                 /*
                                 Expression exp = attr.exp;
                                 while(exp.type == bracketsExp)
                                    exp = exp.list ? exp.list->last : null;
                                 type.vectorSize = CopyExpression(exp);
                                 */
                              }
                           }
                        }
                     }
                     type.keepCast = true;
                     break;
                  }
               }
            }
            break;
         }
         case structDeclarator:
         {
            Expression exp = decl.structDecl.exp;
            if(exp)
            {
               ProcessExpressionType(exp);
               ComputeExpression(exp);
               if(exp.type == constantExp)
                  type.bitFieldCount = (uint)strtoul(exp.constant, null, 0);
            }
            break;
         }
         case functionDeclarator:
         {
            type = { refCount = 1, kind = functionType, returnType = type, dllExport = type.dllExport, attrStdcall = type.attrStdcall };
            if(decl.function.parameters)
            {
               TypeName param;
               for(param = decl.function.parameters->first; param; param = param.next)
                  type.params.Add(ProcessType(param.qualifiers, param.declarator));
            }
            break;
         }
         case arrayDeclarator:
         {
            type = { refCount = 1, kind = arrayType, arraySizeExp = CopyExpression(decl.array.exp), freeExp = true, type = type, dllExport = type.dllExport, attrStdcall = type.attrStdcall };
            if(decl.array.enumClass)
               type.enumClass = decl.array.enumClass.symbol;
            break;
         }
         case pointerDeclarator:
         {
            Pointer pointer = decl.pointer.pointer;
            while(pointer)
            {
               OldList * qualifiers = pointer.qualifiers;
               if(type.classObjectType)
                  type.byReference = true;
               else
                  type = { refCount = 1, kind = pointerType, type = type, dllExport = type.dllExport, attrStdcall = type.attrStdcall };
               if(qualifiers)
               {
                  Specifier spec;
                  for(spec = qualifiers->first; spec; spec = spec.next)
                  {
                     if(spec.type == baseSpecifier && spec.specifier == CONST)
                        type.constant = true;
                  }
               }
               pointer = pointer.pointer;
            }
            break;
         }
         case identifierDeclarator:
         {
            Identifier id = decl.identifier;
            Specifier _class = id._class;
            delete type.name;
            type.name = CopyString(id.string);
            if(_class)
            {
               if(_class.type == templateTypeSpecifier)
               {
                  type.thisClassTemplate = _class.templateParameter;
                  type.extraParam = true;
               }
               else
               {
                  String name = _class.name;
                  if(!name)
                     type.staticMethod = true;
                  else
                  {
                     if(!id.classSym)
                        id.classSym = _class.symbol; // FindClass(_class.name);
                     /* TODO: Name Space Fix ups
                        id.nameSpace = eSystem_FindNameSpace(privateModule, _class.name);
                     */

                     if(name[strlen(name)-1] == '&')
                     {
                        type.thisClass = FindClass("class");
                        type.byReference = true;
                     }
                     else
                        type.thisClass = _class.symbol;

                     if(type.thisClass && strcmp(type.thisClass.string, "class"))
                        type.extraParam = true;
                     else if(!strcmp(name, "any_object"))
                     {
                        type.extraParam = true;
                        type.thisClass = FindClass("class");
                     }
                     else if(!strcmp(name, "class"))
                     {
                        type.thisClass = FindClass("class");
                        type.classObjectType = classPointer;   // This is used for class properties
                     }
                     else if(!strcmp(name, "typed_object") || !strcmp(name, "typed_object&"))
                     {
                        type.thisClass = FindClass("class");
                        type.classObjectType = typedObject;
                     }
                  }
               }
            }
            break;
         }
         default:
            PrintLn("Unhandled Declarator Type: ", decl.type);
      }
   }
   if(subDecl)
   {
      Type curType = type;
      type = ProcessTypeDecls(null, subDecl, type);
      if(curType && type.kind != functionType)
      {
         curType.thisClassTemplate = type.thisClassTemplate;
         curType.extraParam = type.extraParam;
         curType.staticMethod = type.staticMethod;
         curType.thisClass = type.thisClass;
         curType.byReference = type.byReference;
         curType.classObjectType = type.classObjectType;
      }
   }
   return type;
}

public Type ProcessType(OldList specs, Declarator decl)
{
   return ProcessTypeDecls(specs, decl, null);
}

public Type ProcessTypeString(const char * string, bool staticMethod)
{
   OldList * specs = MkList();
   Declarator decl = SpecDeclFromString(string, specs, null);
   Type type = ProcessType(specs, decl);
   if(type && !type.thisClass && staticMethod) type.staticMethod = true;
   FreeList(specs, FreeSpecifier);
   if(decl) FreeDeclarator(decl);
   return type;
}

Type MkClassTypeSymbol(Symbol symbol)
{
   if(symbol)
   {
      Type type { kind = classType, _class = symbol };
      if(!type._class)
      {
         // Defaults to an int instead...
         type.kind = intType;
      }
      type.refCount = 1;
      return type;
   }
   return null;
}

public Type MkClassType(const char * name)
{
   if(name)
   {
      Type type { kind = classType, _class = FindClass(name) };
      if(!type._class)
      {
         // Defaults to an int instead...
         type.kind = intType;
      }
      type.refCount = 1;
      return type;
   }
   return null;
}

AsmField MkAsmField(char * command, Expression expression, Identifier symbolic)
{
   return { command = command, expression = expression, symbolic = symbolic };
}

Statement MkAsmStmt(Specifier spec, char * statements, OldList inputFields, OldList outputFields, OldList clobberedFields)
{
   return { type = asmStmt, asmStmt.spec = spec, asmStmt.statements = statements,
      asmStmt.inputFields = inputFields, asmStmt.outputFields = outputFields,
      asmStmt.clobberedFields = clobberedFields };
}

ClassDef MkClassDefPropertyWatch(PropertyWatch watcher)
{
   return { type = propertyWatchClassDef, propertyWatch = watcher };
}

Statement MkFireWatchersStmt(Expression object, OldList watches)
{
   return { type = fireWatchersStmt, _watch.object = object, _watch.watches = watches };
}

Statement MkStopWatchingStmt(Expression watcher, Expression object, OldList watches)
{
   return { type = stopWatchingStmt, _watch.watcher = watcher, _watch.object = object, _watch.watches = watches };
}

Statement MkWatchStmt(Expression watcher, Expression object, OldList watches)
{
   return { type = watchStmt, _watch.watcher = watcher, _watch.object = object, _watch.watches = watches };
}

PropertyWatch MkDeleteWatch(Statement compound)
{
   return { compound = compound, deleteWatch = true };
}

PropertyWatch MkPropertyWatch(OldList properties, Statement compound)
{
   return { compound = compound, properties = properties };
}

Expression MkExpClass(OldList * specifiers, Declarator decl)
{
   return { type = classExp, _classExp.specifiers = specifiers, _classExp.decl = decl };
}

Expression MkExpClassData(Identifier id)
{
   return { type = classDataExp, classData.id = id };
}


External MkExternalDBTable(DBTableDef table)
{
   return { type = dbtableExternal, table = table };
}

DBTableDef MkDBTableDef(char * name, Symbol symbol, OldList * definitions)
{
   return { name = name, symbol = symbol, definitions = definitions };
}

DBTableEntry MkDBFieldEntry(TypeName type, Identifier id, char * name)
{
   return { type = fieldEntry, dataType = type, id = id, name = name };
}

DBIndexItem MkDBIndexItem(Identifier id, Order order)
{
   return { id = id, order = order };
}

DBTableEntry MkDBIndexEntry(OldList * items, Identifier id)
{
   return { type = indexEntry, items = items, id = id };
}

Expression MkExpDBOpen(Expression ds, Expression dbName)
{
   return { type = dbopenExp, dbopen.ds = ds, dbopen.name = dbName };
}

Expression MkExpDBField(char * table, Identifier id)
{
   return { type = dbfieldExp, db.table = table, db.id = id };
}

Expression MkExpDBIndex(char * table, Identifier id)
{
   return { type = dbindexExp, db.table = table, db.id = id };
}

Expression MkExpDBTable(char * table)
{
   return { type = dbtableExp, db.table = table };
}

Expression MkExpArray(OldList * expressions)
{
   return { type = arrayExp, list = expressions };
}

Expression GetTemplateArgExpByName(const char * paramName, Class thisClassFrom, Class curClass, TemplateParameterType tplType)
{
   Expression argExp = null;
   Class instanceClass = ((curExternal && curExternal.type == functionExternal && curExternal.function) ? curExternal.function._class : null);
   Class _class = curClass ? curClass : instanceClass;

   if(thisClassFrom && instanceClass && thisClassFrom != instanceClass && strcmp(thisClassFrom.name, "class"))
      Compiler_Error($"unresolved template type (%s)\n", paramName);
   if(_class)
   {
      int id = 0;
      ClassTemplateParameter curParam;
      Class sClass;
      if(_class.templateClass) _class = _class.templateClass;
      for(sClass = _class; sClass; sClass = sClass.base)
      {
         id = 0;
         for(curParam = sClass.templateParams.first; curParam; curParam = curParam.next)
         {
            if(!strcmp(curParam.name, paramName))
            {
               for(sClass = sClass.base; sClass; sClass = sClass.base)
                  id += sClass.templateParams.count;
               break;
            }
            id++;
         }
         if(curParam) break;
      }

      if(curParam && curParam.type != tplType)
         curParam = null;

      if(curParam)
      {
         char idString[32];
         char className[1024];

         sprintf(idString, "%d", id);
         strcpy(className, "__ecereClass_");
         FullClassNameCat(className, _class.fullName, true);
         DeclareClass(curExternal, FindClass(_class.fullName), className);

         argExp = MkExpIndex((/*pointer ? MkExpPointer : */MkExpMember)
               (MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class")) /*MkExpIdentifier(MkIdentifier(className))*/,
               MkIdentifier("templateArgs")), MkListOne(MkExpConstant(idString)));
      }
   }
   return argExp;
}

Expression GetTemplateArgExp(TemplateParameter param, Class thisClassFrom, Class curClass, bool pointer)
{
   return param.identifier ? GetTemplateArgExpByName(param.identifier.string, thisClassFrom, curClass, type) : null;
}

/*char * CreateMsgID(const char * string, const char * context)
{
   int lenString = strlen(string), lenContext = strlen(context);
   char * msgid = new char[lenString + lenContext + 20];
   memcpy(msgid, string, lenString);
   memcpy(msgid+lenString, " [msgctxt: ", 11);
   memcpy(msgid+lenString+11, context, lenContext);
   memcpy(msgid+lenString+11+lenContext, "]", 2);
   return msgid;
}*/

public void OutputIntlStrings()
{
   if(intlStrings.count)
   {
      const char * srcFile = GetSourceFile();
      const char * objFile = GetOutputFile();
      char srcFileFixed[MAX_LOCATION];
      char potFile[MAX_LOCATION];
      File f;
      ChangeExtension(objFile, "bowl", potFile);
      f = FileOpen(potFile, write);
      if(f)
      {
         const char * filePrefix = "";
         if(!(srcFile[0] && (srcFile[1] == ':' || srcFile[0] == '/')))
            filePrefix = "./"; //(__runtimePlatform == win32) ? ".\\" : "./";
         // GetSystemPathBuffer(srcFileFixed, srcFile);
         GetSlashPathBuffer(srcFileFixed, srcFile);

         for(s : intlStrings)
         {
            // TOFIX: (#654) ContextStringPair * pair = &s;
            ContextStringPair pair = &s;
            for(l : s)
               f.Printf("#: %s%s:%d\n", filePrefix, srcFileFixed, l.start.line);
             // PoEdit now preserves and distinguish msgctxt
            if(pair.context)
               f.Printf("msgctxt \"%s\"\n", pair.context);
            f.Printf("msgid \"%s\"\n", pair.string);
            f.Printf("msgstr \"%s\"\n\n", pair.string);
         }
         delete f;
      }
      intlStrings.Free();
   }
}

default extern OldList * ast;
default extern int yyparse ();
default extern int yylex ();

public void SetAST(OldList * list) { ast = list; }
public OldList * GetAST() { return ast; }
public void ParseEc()
{
   yyparse();
}

public int LexEc()
{
   return yylex();
}

public const char * GetYYText()
{
   return yytext;
}
