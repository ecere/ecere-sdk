#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "ecdefs"

bool parsingType;
public void SetParsingType(bool b) { parsingType = b; }

extern TypeName parsedType;
extern bool echoOn;
extern bool type_yydebug;
extern Location yylloc;

int type_yyparse();
void resetScannerPos(CodePosition pos);

Declarator PlugDeclarator(Declarator decl, Declarator baseDecl)
{
   if(decl && decl.type != identifierDeclarator)
   {
      Declarator base;
      decl = CopyDeclarator(decl);

      base = decl;
      if(base.type != identifierDeclarator)
      {
         for(; base.declarator && base.declarator.type != identifierDeclarator; base = base.declarator)
         {
            printf("");
         }
      }
      if(baseDecl)
      {
         if(base.declarator)
            FreeDeclarator(base.declarator);
         base.declarator = baseDecl;
      }
      else if(base.type == identifierDeclarator)
      {
         FreeDeclarator(decl);
         decl = null;
      }
      return decl;
   }
   else
      return baseDecl;
}


// *** Shortcut Functions ***
Declarator QMkPtrDecl(char * id)
{
   Declarator declarator = id ? MkDeclaratorIdentifier(MkIdentifier(id)) : null;
   return MkDeclaratorPointer(MkPointer(null,null), declarator);
}

TypeName QMkType(char * spec, Declarator decl)
{
   OldList * specs = MkList();
   ListAdd(specs, MkSpecifierName(spec));
   return MkTypeName(specs, decl);
}

TypeName QMkClass(char * spec, Declarator decl)
{
   OldList * specs = MkList();
   ListAdd(specs, MkSpecifierName/*MkClassName*/(spec));
   return MkTypeName(specs, decl);
}

Expression QBrackets(Expression exp)
{
   OldList * expList = MkList();
   ListAdd(expList, exp);
   return MkExpBrackets(expList);
}

Expression QMkExpId(char * id)
{
   return MkExpIdentifier(MkIdentifier(id));
}

Expression QMkExpCond(Expression cond, Expression exp, Expression elseExp)
{
   OldList * expList = MkList();
   ListAdd(expList, exp);
   return MkExpCondition(cond, expList, elseExp);
}

Declaration QMkDeclaration(char * name, InitDeclarator initDecl)
{
   OldList * specs = MkList(), * initDecls = null;
   ListAdd(specs, MkSpecifierName(name));
   if(initDecl)
   {
      initDecls = MkList();
      ListAdd(initDecls, initDecl);
   }
   return MkDeclaration(specs, initDecls);
}

Declaration QMkDeclarationBase(int base, InitDeclarator initDecl)
{
   OldList * specs = MkList(), * initDecls = null;
   ListAdd(specs, MkSpecifier(base));
   if(initDecl)
   {
      initDecls = MkList();
      ListAdd(initDecls, initDecl);
   }
   return MkDeclaration(specs, initDecls);
}

char * QMkString(char * source)
{
   char * string;
   if(source)
   {
      int len = 0;
      int i,j = 0;
      char ch;

      for(i = 0; (ch = source[i]); i++)
      {
         len++;
         if(ch == '\"' || ch == '\\')
            len++;
      }

      string = new char[len+3];

      string[j++] = '\"';
      for(i = 0; (ch = source[i]); i++)
      {
         if(ch == '\"' || ch == '\\')
            string[j++] = '\\';
         string[j++] = ch;
      }
      string[j++] = '\"';
      string[j] = '\0';
   }
   else
      string = CopyString("0");
   return string;
}

public Declarator GetFuncDecl(Declarator decl)
{
   Declarator funcDecl = null;
   while(decl && decl.type != identifierDeclarator)
   {
      if(decl.type == functionDeclarator)
         funcDecl = decl;
      decl = decl.declarator;
   }
   return funcDecl;
}

bool parseTypeError;

public Declarator SpecDeclFromString(char * string, OldList * specs, Declarator baseDecl)
{
   Location oldLocation = yylloc;
   Declarator decl = null;
   File backFileInput = fileInput;

   //char * classOp, * type;
   if(!string)
      string = "void()";

   /*
   classOp = strstr(string, "::");
   type = classOp ? (classOp + 2) : string;
   */

   fileInput = TempFile { };
   fileInput.Write(string, 1, strlen(string));
   fileInput.Seek(0, start);

   //type_yydebug = true;
   echoOn = false;
   parseTypeError = false;
   parsedType = null;
   declMode = structDeclMode = defaultAccess;
   resetScanner();
   {
      bool oldParsingType = parsingType;
      parsingType = true;
      type_yyparse();
      parsingType = oldParsingType;
   }
   declMode = structDeclMode = privateAccess;

   type_yydebug = false;

   delete fileInput;

   if(parsedType)
   {
      if(parsedType.qualifiers)
      {
         Specifier spec;
         for(;(spec = parsedType.qualifiers->first);)
         {
            parsedType.qualifiers->Remove(spec);
            specs->Add(spec);
         }
      }
      if(parsedType.bitCount)
      {
         parsedType.declarator = MkStructDeclarator(parsedType.declarator, parsedType.bitCount);
         parsedType.bitCount = null;
      }
      decl = PlugDeclarator(parsedType.declarator, baseDecl);
      FreeTypeName(parsedType);
      parsedType = null;

      if(parseTypeError)
      {
         Compiler_Warning($"parsing type %s\n", string);
         // Compiler_Error($"parsing type %s\n", string);
      }
   }
   else
   {
      Compiler_Warning($"parsing type %s\n", string);
      // Compiler_Error($"parsing type %s\n", string);
      //eSystem_Logf("parsing type %s\n", string);
      //exit(0);
      decl = baseDecl;
   }

   yylloc = oldLocation;

   fileInput = backFileInput;
   return decl;
}
