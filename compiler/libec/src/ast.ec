import "ecdefs"

#define YYLTYPE Location
#include "grammar.h"
extern char * yytext;

char * defaultNameSpace;
int defaultNameSpaceLen;
public void SetDefaultNameSpace(char * s) { defaultNameSpace = s; defaultNameSpaceLen = s ? strlen(s) : 0; }

bool strictNameSpaces;
public void SetStrictNameSpaces(bool b) { strictNameSpaces = b; }

AccessMode declMode = privateAccess;
public void SetDeclMode(AccessMode accessMode) { declMode = accessMode; }
AccessMode defaultDeclMode = privateAccess;
public void SetDefaultDeclMode(AccessMode accessMode) { defaultDeclMode = accessMode; }

char * currentNameSpace;
int currentNameSpaceLen;
public void SetCurrentNameSpace(char * s) { currentNameSpace = s; currentNameSpaceLen = s ? strlen(s) : 0; }

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

public Identifier MkIdentifier(char * string)
{
   Identifier id { };
   int c;
   
   id._class = null; // Default class...

   if(string)
   {
      char * namePart;
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
            id._class = MkSpecifierName("class");
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
   return { type = identifierExp, identifier = id };
}

public Expression MkExpDummy()
{
   Expression exp { type = dummyExp };
   return exp;
}

public Expression MkExpConstant(char * string)
{
   return { type = constantExp, constant = CopyString(string) };
}

Expression MkExpString(char * string)
{
   return { type = stringExp, string = CopyString(string) };
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

Map<ContextStringPair, List<Location> > intlStrings { };

Expression MkExpIntlString(char * string, char * context)
{
   OldList * list = MkList();
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
   ListAdd(list, QMkExpId("__thisModule"));
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
   return { type = callExp, call.exp = expression, call.arguments = arguments };
}

Expression MkExpMember(Expression expression, Identifier member)
{
   return { type = memberExp, member.exp = expression, member.member = member };
}

Expression MkExpPointer(Expression expression, Identifier member)
{
   return { type = pointerExp, member.exp = expression, member.member = member };
}

Expression MkExpTypeSize(TypeName typeName)
{
   return { type = typeSizeExp, typeName = typeName };
}

Expression MkExpTypeAlign(TypeName typeName)
{
   return { type = typeAlignExp, typeName = typeName };
}

Expression MkExpClassSize(Specifier _class)
{
   return { type = classSizeExp, _class = _class };
}

Expression MkExpCast(TypeName typeName, Expression expression)
{
   return { type = castExp, cast.typeName = typeName, cast.exp = expression };
}

Expression MkExpCondition(Expression cond, OldList expressions, Expression elseExp)
{
   return { type = conditionExp, cond.cond = cond, cond.exp = expressions, cond.elseExp = elseExp };
}

Expression MkExpRenew(Expression memExp, TypeName type, Expression size)
{
   return { type = renewExp, _renew.exp = memExp, _renew.typeName = type, _renew.size = size };
}

Expression MkExpRenew0(Expression memExp, TypeName type, Expression size)
{
   return { type = renew0Exp, _renew.exp = memExp, _renew.typeName = type, _renew.size = size };
}

Expression MkExpNew(TypeName type, Expression size)
{
   return { type = newExp, _new.typeName = type, _new.size = size };
}

Expression MkExpNew0(TypeName type, Expression size)
{
   return { type = new0Exp, _new.typeName = type, _new.size = size };
}

Expression MkExpVaArg(Expression exp, TypeName type)
{
   return { type = vaArgExp, vaArg.exp = exp, vaArg.typeName = type };
}

Specifier MkSpecifier(int specifier)
{
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
      declMode = defaultAccess;
   spec.definitions = definitions;
   if(definitions && id && !declMode)
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
   symbol.idCode = symbol.id = curContext.nextID++;
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
      Specifier spec;
      for(spec = specifiers.first; spec; spec = spec.next)
      {
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
                     type.id = type.idCode = curContext.nextID++;

                     if(!(curContext.templateTypesOnly ? curContext.parent : curContext).types.Add((BTNode)type))
                        excludedSymbols->Add(type);
                     decl.symbol = d.declarator.symbol = type;
                  }
               }
            }
            else if(spec.next)
            {
               for(; spec; spec = spec.next)
               {
                  if(spec.type == nameSpecifier && spec.name)
                  {
                     Symbol type
                     {
                        string = CopyString(spec.name);
                        type = ProcessType(specifiers, null);
                     };
                     type.id = type.idCode = curContext.nextID++;
                     if(!(curContext.templateTypesOnly ? curContext.parent : curContext).types.Add((BTNode)type))
                        excludedSymbols->Add(type);

                     decl.symbol = type;
                  }
               }
            }
            variable = false;
            break;
         }
         else if(spec.type == baseSpecifier && 
            (spec.specifier == STRUCT || spec.specifier == UNION))
            variable = false;
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
               if(!symbol)
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
                  symbol.id = symbol.idCode = curContext.nextID++;
               }
               decl.symbol = d.declarator.symbol = symbol;
            }
         }
      }
   }
   else
   {
      decl.symbol = Symbol { };
      decl.symbol.id = decl.symbol.idCode = curContext.nextID++;
      excludedSymbols->Add(decl.symbol);
   }
   return decl;
}

Declaration MkStructDeclaration(OldList specifiers, OldList declarators, Specifier extStorage)
{
   return { type = structDeclaration, declarators = declarators, specifiers = specifiers, extStorage = extStorage, loc = yylloc };
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

                  // TODO: Fix this, the parameters' IDs should really be smaller...
                  symbol.id = context.nextID++;
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
      symbol.idCode = symbol.id = globalContext.nextID++;
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
            declMode = staticAccess;
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
   InitDeclarator d = (declaration && declaration.declarators) ? declaration.declarators->last : null;
   if(declaration && declaration.type == initDeclaration && declaration.specifiers)
   {
      Specifier spec;
      for(spec = declaration.specifiers->first; spec; spec = spec.next)
         if(spec.type == baseSpecifier && spec.specifier == TYPEDEF)
         {
            declMode = defaultAccess;
            break;
         }
         else if(spec.type == baseSpecifier && spec.specifier == STATIC)
         {
            declMode = staticAccess;
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
            symbol = _DeclClass(MAXINT, templateString);
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

Specifier _MkSpecifierName(char * name, Symbol symbol, OldList templateArgs)
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
         spec.name = CopyString(symbol.string);   
      else
         spec.name = CopyString(name);
      spec.symbol = symbol;
      if(templateArgs != null)
         SetClassTemplateArgs(spec, templateArgs);
   }
   return spec;
}

public Specifier MkSpecifierName(char * name)
{
   return _MkSpecifierName(name, null, null);
}

public Specifier MkSpecifierNameArgs(char * name, OldList * templateArgs)
{
   return _MkSpecifierName(name, null, templateArgs);
}

/*
Specifier MkClassName(char * string)
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

                  // TODO: Fix this, the parameters' IDs should really be smaller...
                  symbol.idCode = symbol.id = context.nextID++;
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
      symbol.idCode = symbol.id = globalContext.nextID++;
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

ClassDef MkClassDefDesigner(char * designer)
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

Symbol DeclClassAddNameSpace(int symbolID, char * className)
{
   char name[1024];
   int len = 0, stringLen;
   name[0] = '\0';
   if((currentNameSpace || defaultNameSpace) && declMode != defaultAccess && defaultDeclMode != defaultAccess)
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
   return _DeclClass(symbolID, name);
}

Symbol DeclClass(int symbolID, char * name)
{
   if(strchr(name, ':'))
      return _DeclClass(symbolID, name);
   else
      return DeclClassAddNameSpace(symbolID, name);
}

Symbol _DeclClass(int symbolID, char * name)
{
   Symbol symbol = FindClass(name);
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
         idCode = symbolID, id = symbolID;
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
   if(symbolID)
      symbol.idCode = symbol.id = symbolID;
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
      if(baseClass.ctx)
      {
         TemplatedType copy;
         for(copy = (TemplatedType)baseClass.ctx.templateTypes.first; copy; copy = (TemplatedType)copy.next)
         {
            TemplatedType type { key = copy.key, param = copy.param };
            if(!curContext.templateTypes.Add((BTNode)type))
               delete type;
         }
      }
      else if(baseClass.registered)
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
   classDef = { symbol = symbol, _class = MkSpecifierName /*MkClassName*/(symbol.string), baseSpecs = baseSpecs, definitions = definitions, nameLoc = symbol.nameLoc };
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
      PrintType(type, typeString, false, true);
      id = MkIdentifier(typeString);
      prop.conversion = true;
   }
   prop.id = id;

   symbol = Symbol
   {
      string = CopyString(id.string);
      type = type;
   };
   symbol.idCode = symbol.id = globalContext.nextID++;
   excludedSymbols->Add(symbol);
   globalContext.nextID++;
   globalContext.nextID++;
   prop.symbol = symbol;
   return prop;
}

ClassDef MkClassDefProperty(PropertyDef propertyDef)
{
   return { type = propertyClassDef, propertyDef = propertyDef };
}

ClassDef MkClassDefClassProperty(PropertyDef propertyDef)
{
   return { type = classPropertyClassDef, propertyDef = propertyDef };
}

ClassDef MkClassDefClassPropertyValue(Identifier id, Initializer initializer)
{
   return { type = classPropertyValueClassDef, id = id, initializer = initializer };
}

int CheckType(char * text)
{
#ifdef _TIMINGS
   Time startTime = GetTime();
#endif
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
      return TYPE_NAME; //CLASS_NAME;
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

Symbol FindType(Context ctx, char * name)
{
   Symbol type = null;
   if(curContext)
   {
      type = (Symbol)ctx.types.FindString(name);
      if(!type && ctx.parent)
         type = FindType(ctx.parent, name);
   }
   return type;
}

TemplatedType FindTemplateTypeParameter(Context ctx, char * name)
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

public Symbol FindClass(char * name)
{
#ifdef _DEBUG
   Time startTime = GetTime();
#endif
   Symbol cl = null;
   Class _class;
   bool global = false;
   char fullName[1024];

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
               id = MAXINT;
               idCode = MAXINT;
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
   type.enumName = CopyString(src.enumName);
   type.refCount = 1;

   if(src.kind == enumType)
   {
      NamedLink member;

      type.members.Clear();
      // This must have been a mistake: member = **type**.members.first
      for(member = src.members.first; member; member = member.next)
      {
         type.members.Add(NamedLink { name = CopyString(member.name), data = member.data });
      }
   }
   else if(src.kind == structType || src.kind == unionType)
   {
      Type member;
      // Tricky stuff... will be removed from list only when ref count reaches 0
      for(member = type.members.first; member; member = member.next)
         member.refCount++;
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

public Type ProcessType(OldList specs, Declarator decl)
{
   Type type = null;
   bool isTypedef = false;
   if(!specs || specs.first)
   {
      Declarator funcDecl = GetFuncDecl(decl);
      Type specType { };
      bool dllExport = false;

      specType.kind = intType;
      specType.isSigned = true;   
      specType.refCount = 1;

      type = Type { refCount = 1 };

      while(decl && (decl.type == structDeclarator || decl.type == extendedDeclarator || decl.type == extendedDeclaratorEnd))
      {
         if(decl.type == structDeclarator && decl.structDecl.exp)
         {
            ProcessExpressionType(decl.structDecl.exp);
            ComputeExpression(decl.structDecl.exp);
            if(decl.structDecl.exp.type == constantExp)
               specType.bitFieldCount = strtoul(decl.structDecl.exp.constant, null, 0);
         }
         if((decl.type == extendedDeclarator || decl.type == extendedDeclaratorEnd) && decl.extended.extended && decl.extended.extended.type == extDeclString &&
            decl.extended.extended.s && (!strcmp(decl.extended.extended.s, "__declspec(dllexport)") || !strcmp(decl.extended.extended.s, "dllexport")))
         {
            dllExport = true;
         }
         if((decl.type == extendedDeclarator || decl.type == extendedDeclaratorEnd) && decl.extended.extended && decl.extended.extended.type == extDeclAttrib)
         {
            specType.keepCast = true;
         }
         decl = decl.declarator;
      }

      // If we'll be using the specType
      if(funcDecl || !decl || decl.type == identifierDeclarator)
      {
         Specifier spec;
         if(specs != null)
         {
            bool isLong = false;
            for(spec = specs.first; spec; spec = spec.next)
            {
               if(spec.type == extendedSpecifier && spec.extDecl && spec.extDecl.type == extDeclString && spec.extDecl.s && (!strcmp(spec.extDecl.s, "__declspec(dllexport)") || !strcmp(spec.extDecl.s, "dllexport")))
               {
                  dllExport = true;
               }
               if(spec.type == extendedSpecifier && spec.extDecl.type == extDeclAttrib)
               {
                  specType.keepCast = true;
               }

               if(spec.specifier != CONST && (specType.kind == structType || specType.kind == unionType))
               {
                  FreeType(specType);
                  specType = { kind = intType, isSigned = true, refCount = 1 };
               }

               if(spec.type == baseSpecifier)
               {
                  if(spec.specifier == TYPEDEF) isTypedef = true;
                  else if(spec.specifier == VOID) specType.kind = voidType;
                  else if(spec.specifier == CHAR) specType.kind = charType;
                  else if(spec.specifier == INT) { if(specType.kind != shortType && specType.kind != longType) specType.kind = intType; }
                  else if(spec.specifier == UINT) { if(specType.kind != shortType && specType.kind != longType) specType.kind = intType; specType.isSigned = false; }
                  else if(spec.specifier == INT64) specType.kind = int64Type;
                  else if(spec.specifier == VALIST) 
                     specType.kind = vaListType;
                  else if(spec.specifier == SHORT) specType.kind = shortType;
                  else if(spec.specifier == LONG) 
                  {
                     if(isLong)
                        specType.kind = int64Type;
                     else
                        specType.kind = intType;
                     isLong = true;
                     // specType.kind = longType;
                  }
                  else if(spec.specifier == FLOAT) specType.kind = floatType;
                  else if(spec.specifier == DOUBLE) specType.kind = doubleType;
                  else if(spec.specifier == SIGNED) specType.isSigned = true;
                  else if(spec.specifier == UNSIGNED) specType.isSigned = false;
                  else if(spec.specifier == CONST) specType.constant = true;
                  else if(spec.specifier == TYPED_OBJECT) 
                  { 
                     specType.classObjectType = typedObject; specType.kind = classType; specType._class = FindClass("class"); 
                  }
                  else if(spec.specifier == ANY_OBJECT) 
                  { 
                     specType.classObjectType = anyObject; specType.kind = classType; specType._class = FindClass("class"); 
                  }
                  else if(spec.specifier == CLASS)
                  {
                     specType.classObjectType = classPointer; specType.kind = classType; specType._class = FindClass("class");
                  }
                  else if(spec.specifier == THISCLASS)
                     specType.kind = thisClassType;
               }
               else if(spec.type == nameSpecifier)
               {
                  Symbol symbol = spec.name ? FindType(curContext, spec.name) : null;
                  if(symbol && symbol.type)
                  {
                     // Free Type Contents:
                     Type dummy { };
                     *dummy = *specType;
                     FreeType(dummy);

                     CopyTypeInto(specType, symbol.type);
                     specType.typeName = CopyString(symbol.type.name);
                  }
                  else if(!isTypedef) // !specType.kind)    // TESTING THIS FOR enum / typedef problem
                  {
                     // key.sym enum values need FindClass:
                     specType._class = spec.name ? FindClass(spec.name) : null;
                     // specType._class = spec.symbol; 
                     specType.kind = classType;
                     if(!specType._class)
                        specType.kind = intType;
                  }
               }
               else if(spec.type == enumSpecifier)
               {

                  specType.kind = enumType;
                  specType.enumName = spec.id ? CopyString(spec.id.string) : null;

                  if(spec.list)
                  {
                     Enumerator e;
                     int nextValue = 0;
                     for(e = spec.list->first; e; e = e.next)
                     {
                        // TOFIX: NamedItem i { } causes cryptic error, bad .c!
                        NamedLink i { name = CopyString(e.id.string) };
                        specType.members.Add(i);
                        /*
                        if(e.exp && ComputeExpression(e.exp), e.exp.isConstant && e.exp.expType.kind == intType)
                           value.data = (void *) nextValue = strtol(e.exp.string, null, 0);
                        else
                           value.data = (void *)nextValue++;
                        */
                     }
                  }
                  /*
                  if(spec.list)
                  {
                     Declaration decl;
                     for(enumerator = spec.list->first; enumerator; enumerator = enumerator.next)
                        if(decl.declarators)
                        {
                           Declarator d;
                           for(d = decl.declarators.first; d; d = d.next)
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
                  */
               }
               else if(spec.type == templateTypeSpecifier)
               {
                  /*
                  printf("spec %x\n", spec);
                  printf("template param %x\n", spec.templateParameter);
                  printf("identifier %x\n", spec.templateParameter.identifier);
                  printf("string %x\n", spec.templateParameter.identifier.string);
                  */
                  specType.kind = templateType;
                  specType.templateParameter = spec.templateParameter;
               }
               else if(spec.type == structSpecifier || spec.type == unionSpecifier)
               {
                  Symbol _class = spec.id ? FindClass(spec.id.string) : null;
                  if(_class)
                  {
                     if(!_class.registered || _class.registered.type != structClass)
                        specType.directClassAccess = true;
                     specType._class = _class;
                     specType.kind = classType;
                     break;
                  }
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
                              NamedLink member;

                              specType.members.Clear();
                              for(member = symbol.type.members.first; member; member = member.next)
                              {
                                 NamedLink item { name = CopyString(member.name), data = member.data };
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
                  specType.kind = specType.kind = subClassType;
                  specType._class = spec._class.symbol; // FindClass(spec._class.name);
               }
               /*
               else if(spec.type == classSpecifier)
               {
                  specType._class = FindClass(spec.name);
                  specType.kind = classType;
               }
               */
            }
         }
         else if(!decl)
            specType.kind = ellipsisType;
      }

      if(funcDecl)
      {
         Declarator d = funcDecl.declarator;
         Type funcType { };
         TypeName param;

         funcType.kind = functionType;
         funcType.refCount = 1;
         if(funcDecl.function.parameters)
         {
            for(param = funcDecl.function.parameters->first; param; param = param.next)
            {
               /*
               if(param.typedObject)
               {
                  Type typedObjectType
                  {
                     refCount = 1;
                     byReference = param.byReference;
                     kind = TypeTypedObject;
                  };
                  funcType.params.Add(typedObjectType);
               }
               else*/
                  funcType.params.Add(ProcessType(param.qualifiers, param.declarator));
            }
         }

         // Function returning a pointer...
         if(decl.type == pointerDeclarator)
         {
            Pointer pointer = decl.pointer.pointer;
            Type ptrType { };
            funcType.returnType = ptrType;
            funcType.returnType.refCount = 1;
            while(pointer)
            {
               ptrType.kind = pointerType;
               pointer = pointer.pointer;
               if(pointer)
               {
                  ptrType.type = Type { refCount = 1 };
                  ptrType = ptrType.type;
               }
            }
            ptrType.type = Type { refCount = 1 };
            *ptrType.type = specType;
         }
         else
         {
            funcType.returnType = Type { refCount = 1 };
            *funcType.returnType = specType;
         }

         // TESTING: Added extendedDeclarator here
         while(d && (d.type == bracketsDeclarator || d.type == extendedDeclarator || d.type == extendedDeclaratorEnd))
         {
            if((d.type == extendedDeclarator || d.type == extendedDeclaratorEnd) && d.extended.extended && d.extended.extended.type == extDeclString &&
               d.extended.extended.s && (!strcmp(d.extended.extended.s, "__declspec(dllexport)") || !strcmp(d.extended.extended.s, "dllexport")))
            {
               dllExport = true;            
            }
            d = d.declarator;
         }

         funcType.dllExport = dllExport;

         if(d && d.type == pointerDeclarator)
         {
            Type ptrType;
            Identifier id;

            if(d.declarator && d.declarator.type == arrayDeclarator)
            {
               // Arrays of pointers to functions (extremely tricky :()
               Pointer pointer = d.pointer.pointer;

               // TO WORK ON: Fixed the order for the array...
               type.kind = arrayType;
               type.arraySizeExp = CopyExpression(d.declarator.array.exp);
               type.freeExp = true;
               if(d.declarator.array.enumClass)
                  type.enumClass = d.declarator.array.enumClass.symbol; // FindClass(d.declarator.array.enumClass.name);
               if(d.declarator.declarator && d.declarator.declarator.type == arrayDeclarator)
               {
                  Type tmpType = type;
                  Type inType;
                  type = ProcessType(null, d.declarator.declarator);
                  inType = type.type;
                  type.type = tmpType;
                  tmpType.type = inType;
               }
               else
                  type.type = ProcessType(null, d.declarator.declarator);

               for(ptrType = type.type; ptrType && ptrType.kind && ptrType.type; ptrType = ptrType.type);

               while(pointer)
               {
                  ptrType.kind = pointerType;
                  pointer = pointer.pointer;
                  if(pointer)
                  {
                     ptrType.type = Type { refCount = 1 };
                     ptrType = ptrType.type;
                  }
               }
               ptrType.type = ProcessType(specs, null);
            }
            else
            {
               // WARNING: Not caring if this declarator contains a declarator between
               //          the pointer and the function other than brackets (like in the case of array of pointers to functions)...
               // *********** Could it ever go in here???  Yes: void (* converters_table[10]) (); ***********
               Pointer pointer = d.pointer.pointer;

               ptrType = type;
               while(pointer)
               {
                  ptrType.kind = pointerType;
                  ptrType.type = Type { refCount = 1 };
                  pointer = pointer.pointer;
                  if(pointer)
                     ptrType = ptrType.type;
               }
            }

            *ptrType.type = funcType;
            id = GetDeclId(d);
            if(id)
            {
               if(id._class && !id._class.name)
                  ptrType.type.staticMethod =  true;
               else 
               {
                  // TODO : Ensure classSym has been resolved here... (Is this gonna cause problems? Supposed to do this later...)
                  if(!id.classSym)
                  {
                     if(id._class && id._class.name)
                     {
                        id.classSym = id._class.symbol; // FindClass(id._class.name);
                        /* TODO: Name Space Fix ups
                        if(!id.classSym)
                           id.nameSpace = eSystem_FindNameSpace(privateModule, id._class.name);
                        */
                     }
                  }

                  ptrType.type.thisClass = id.classSym;
                  if(ptrType.type.thisClass && strcmp(ptrType.type.thisClass.string, "class"))
                     ptrType.type.extraParam = true;
                  else if(id._class && id._class.name && !strcmp(id._class.name, "any_object"))
                  {
                     ptrType.type.extraParam = true;
                     ptrType.type.thisClass = FindClass("class");
                  }
               }

               type.name = CopyString(id.string);
            }
         }
         else if(!d || d.type == identifierDeclarator)
         {

            *type = funcType;
            if(d)
            {
               if(d.identifier._class && d.identifier._class.type == templateTypeSpecifier)
               {
                  type.thisClassTemplate = d.identifier._class.templateParameter;
                  type.extraParam = true;
               }
               else
               {
                  if(d.identifier._class && !d.identifier._class.name)
                     type.staticMethod = true;
                  else
                  {
                     if(d.identifier._class && d.identifier._class.name && d.identifier._class.name[strlen(d.identifier._class.name)-1] == '&')
                     {
                        type.thisClass = FindClass("class");
                        type.byReference = true;
                     }
                     else
                        type.thisClass = d.identifier._class ? d.identifier._class.symbol /*FindClass(d.identifier._class.name)*/ : null;
                     if(type.thisClass && strcmp(type.thisClass.string, "class"))
                     {
                        type.extraParam = true;
                     }
                     else if(d.identifier._class && d.identifier._class.name && !strcmp(d.identifier._class.name, "any_object"))
                     {
                        type.extraParam = true;
                        type.thisClass = FindClass("class");
                     }
                     else if(d.identifier._class && d.identifier._class.name && !strcmp(d.identifier._class.name, "class"))
                     {
                        //type.extraParam = true;
                        type.thisClass = FindClass("class");
                        type.classObjectType = classPointer;
                     }
                  }
               }
               type.name = CopyString(d.identifier.string);
            }
         }
         delete funcType;
      }
      else if(decl && decl.type == pointerDeclarator)
      {
         if(decl.declarator && decl.declarator.type == arrayDeclarator)
         {
            // Arrays of pointers (tricky :))
            Identifier id;
            Pointer pointer = decl.pointer.pointer;
            Type ptrType;

            // TO WORK ON: Fixed the order for the array...
            type.kind = arrayType;
            type.arraySizeExp = CopyExpression(decl.declarator.array.exp);
            type.freeExp = true;
            if(decl.declarator.array.enumClass)
               type.enumClass = decl.declarator.array.enumClass.symbol; // FindClass(decl.declarator.array.enumClass.name);
            if(decl.declarator.declarator && decl.declarator.declarator.type == arrayDeclarator)
            {
               Type tmpType = type;
               Type inType;
               type = ProcessType(null, decl.declarator.declarator);
               inType = type.type;
               type.type = tmpType;
               tmpType.type = inType;
            }
            else
               type.type = ProcessType(null, decl.declarator.declarator);
            /*
            type.type = ProcessType(null, decl.declarator.declarator);
            type.kind = arrayType;
            type.arraySizeExp = CopyExpression(decl.declarator.array.exp);
            type.arraySizeExp.freeExp = true;
            if(decl.array.enumClass)
               type.enumClass = FindClass(decl.array.enumClass.name);
            */

            for(ptrType = type.type; ptrType && ptrType.kind && ptrType.type; ptrType = ptrType.type);

            while(pointer)
            {
               ptrType.kind = pointerType;
               pointer = pointer.pointer;
               if(pointer)
               {
                  ptrType.type = Type { refCount = 1 };
                  ptrType = ptrType.type;
               }
            }
            ptrType.type = ProcessType(specs, null);
            id = GetDeclId(decl);
            if(id) type.name = CopyString(id.string);
         }
         else
         {
            Identifier id;
            Pointer pointer = decl.pointer.pointer;
            Type ptrType = type;

            if(type.classObjectType)
            {
               type.byReference = true;
            }
            else
            {
               while(pointer)
               {
                  ptrType.kind = pointerType;
                  pointer = pointer.pointer;
                  if(pointer)
                  {
                     ptrType.type = Type { refCount = 1 };
                     ptrType = ptrType.type;
                  }
               }
               ptrType.type = ProcessType(specs, decl.declarator);

               if(type.type.classObjectType)
               {
                  Type subType = type.type;
                  type.classObjectType = subType.classObjectType;
                  type.kind = subType.kind;
                  type._class = subType._class;
                  type.byReference = true;

                  FreeType(subType);
               }
               id = GetDeclId(decl);
               if(id) type.name = CopyString(id.string);
            }
         }
      }
      else if(decl && decl.type == arrayDeclarator)
      {
         Identifier id;

         type.kind = arrayType;
         
         type.arraySizeExp = CopyExpression(decl.array.exp);
         type.freeExp = true;
         if(decl.array.enumClass)
            type.enumClass = decl.array.enumClass.symbol; // FindClass(decl.array.enumClass.name);
         id = GetDeclId(decl);

         // TO WORK ON: Fixed the order for the array...
         if(decl.declarator && decl.declarator.type == arrayDeclarator)
         {
            Type tmpType = type;
            Type inType;
            type = ProcessType(specs, decl.declarator);
            inType = type.type;
            type.type = tmpType;
            tmpType.type = inType;
         }
         else
            type.type = ProcessType(specs, decl.declarator);

         if(id)
         {
            delete type.name;
            type.name = CopyString(id.string);
         }
      }
      else
      {
         if(!decl || decl.type == identifierDeclarator)
         {
            *type = specType;
            delete type.name;
            type.name = decl ? CopyString(decl.identifier.string) : null;

         }   
      }
      delete specType;
   }
   return type;
}

public Type ProcessTypeString(char * string, bool staticMethod)
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

public Type MkClassType(char * name)
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

AsmField MkAsmField(char * command, Expression expression)
{
   return { command = command, expression = expression };
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

Expression GetTemplateArgExpByName(char * paramName, Class curClass, TemplateParameterType tplType)
{
   Expression argExp = null;
   Class _class = curClass ? curClass : ((curExternal && curExternal.type == functionExternal && curExternal.function) ? curExternal.function._class : null);
   if(_class)
   {
      int id = 0;
      ClassTemplateParameter curParam;
      Class sClass;
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
         Expression classExp;
         
         sprintf(idString, "%d", id);
         strcpy(className, "__ecereClass_");
         FullClassNameCat(className, _class.fullName, true);
         MangleClassName(className);
         DeclareClass(FindClass(_class.fullName), className);

         argExp = MkExpIndex((/*pointer ? MkExpPointer : */MkExpMember)
               (MkExpMember(MkExpIdentifier(MkIdentifier("this")), MkIdentifier("_class")) /*MkExpIdentifier(MkIdentifier(className))*/, 
               MkIdentifier("templateArgs")), MkListOne(MkExpConstant(idString)));
      }
   }
   return argExp; 
}

Expression GetTemplateArgExp(TemplateParameter param, Class curClass, bool pointer)
{
   return param.identifier ? GetTemplateArgExpByName(param.identifier.string, curClass, type) : null;
}

/*char * CreateMsgID(char * string, char * context)
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
      char * srcFile = GetSourceFile();
      char * objFile = GetOutputFile();
      char srcFileFixed[MAX_LOCATION];
      char potFile[MAX_LOCATION];
      File f;
      ChangeExtension(objFile, "bowl", potFile);
      f = FileOpen(potFile, write);
      if(f)
      {
         char * filePrefix = "";
         if(!(srcFile[0] && (srcFile[1] == ':' || srcFile[0] == '/')))
            filePrefix = "./"; //(GetRuntimePlatform() == win32) ? ".\\" : "./";
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

public void SetAST(OldList * list) { ast = list; }
public OldList * GetAST() { return ast; }
public void ParseEc()
{
   yyparse();
}
