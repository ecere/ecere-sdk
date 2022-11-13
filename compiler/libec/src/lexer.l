D         [0-9]
L         [a-zA-Z_]
H         [a-fA-F0-9]
E         [Ee][+-]?{D}+
P         [Pp][+-]?{D}+
FS         (f|F|l|L|i|I|j|J)*
IS         (u|U|l|L|i|I|j|J)*
IDENT    {L}({L}|{D})*

%option nounput

%{
import "ecdefs"
#define YYLTYPE Location
#define YY_NEVER_INTERACTIVE 1    // Avoid calling isatty on eC File object

#include "grammar.h"

bool echoOn = true;
public void SetEchoOn(bool b) { echoOn = b; }

extern YYLTYPE type_yylloc;
extern YYLTYPE expression_yylloc;

extern File fileInput;
int preprocessor();
int comment();

void TESTTTT()
{
   yylloc.end.charPos += yyleng;
   yylloc.end.pos += yyleng;
   type_yylloc.end.charPos += yyleng;
   type_yylloc.end.pos += yyleng;
   expression_yylloc.end.charPos += yyleng;
   expression_yylloc.end.pos += yyleng;
}

#define YY_USER_ACTION  \
   TESTTTT();

   /*
   yylloc.end.charPos += yyleng;
   yylloc.end.pos += yyleng;
   */

#define YY_INPUT(buf,result,max_size) \
   result = fileInput.Read(buf, 1, max_size) \

YY_BUFFER_STATE include_stack[MAX_INCLUDE_DEPTH];
File fileStack[MAX_INCLUDE_DEPTH];
char sourceFileStack[MAX_INCLUDE_DEPTH][MAX_LOCATION];
public void SetSomeSourceFileStack(const char * fileName, int index) { strcpy(sourceFileStack[index], fileName); }
YYLTYPE locStack[MAX_INCLUDE_DEPTH];
AccessMode declModeStack[MAX_INCLUDE_DEPTH];
int include_stack_ptr = 0;

#define uint _uint
default:

%}

%%

%{
   yylloc.start = yylloc.end;
   type_yylloc.start = type_yylloc.end;
   expression_yylloc.start = expression_yylloc.end;
%}

"#"                  { int r = preprocessor(); if(r) return r; }
"/*"                 { comment(); }
"//"                 { commentCPP(); }

"auto"               { return(AUTO); }
"break"              { return(BREAK); }
"case"               { return(CASE); }
"char"               { return(CHAR); }
"const"              { return(CONST); }
"continue"           { return(CONTINUE); }
"default"            { return(DEFAULT); }
"do"                 { return(DO); }
"double"             { return(DOUBLE); }
"else"               { return(ELSE); }
"enum"               { return(ENUM); }
"extern"             { return(EXTERN); }
"float"              { return(FLOAT); }
"for"                { return(FOR); }
"goto"               { return(GOTO); }
"if"                 { return(IF); }
"int"                { return(INT); }
"__int32"            { return(INT); }
"int32"              { return(INT); }
"uint"               { return(UINT); }
 /* "uint16"            { return(UINT16); } */
 /* "uint32"            { return(UINT32); } */
 /* "bool"              { return(BOOL_TOKEN); } */
"long"               { return(LONG); }
"register"           { return(REGISTER); }
"return"             { return(RETURN); }
"short"              { return(SHORT); }
"signed"             { return(SIGNED); }
"__signed"           { return(SIGNED); }
"__signed__"         { return(SIGNED); }
"sizeof"             { return(SIZEOF); }
"__alignof__"        { return(ALIGNOF); }
"__alignof"          { return(ALIGNOF); }
"__builtin_offsetof"        { return(BUILTIN_OFFSETOF); }
"static"             { return(STATIC); }
"__thread"           { return(THREAD); }
"struct"             { return(STRUCT); }
"switch"             { return(SWITCH); }
"typedef"            { return(TYPEDEF); }
"union"              { return(UNION); }
"unsigned"           { return(UNSIGNED); }
"void"               { return(VOID); }
"volatile"           { return(VOLATILE); }
"__volatile__"       { return(VOLATILE); }
"__volatile"         { return(VOLATILE); }
"while"              { return(WHILE); }

"property"           { return(PROPERTY); }
"set"                { return(SETPROP); }    /* TODO: Don't make this a keyword... */
"get"                { return(GETPROP); }    /* TODO: Don't make this a keyword... */
"isset"              { return(ISPROPSET); }    /* TODO: Don't make this a keyword... */
"class"              { return(CLASS); }
"thisclass"          { return(THISCLASS); }
"virtual"            { return(VIRTUAL); }
"delete"             { return(DELETE); }
"new"                { return(NEWOP); }
"new0"               { return(NEW0OP); }
"renew"              { return(RENEW); }
"renew0"             { return(RENEW0); }
"import"             { return(IMPORT); }
"define"             { return(DEFINE); }
"__int64"            { return(INT64); }
"int64"              { return(INT64); }
"__int128"           { return(INT128); }
"__float128"         { return(FLOAT128); }
"_Float128"          { return(FLOAT128); }
"__float16"         { return(FLOAT16); }
"_Float16"          { return(FLOAT16); }
"__builtin_va_list"  { return(VALIST); }
"__builtin_va_arg"   { return(VAARG); }
"Bool"               { return(BOOL); }
"_Bool"              { return(_BOOL); }
"_Complex"           { return(_COMPLEX); }
"_Imaginary"         { return(_IMAGINARY); }
"restrict"           { return(EXT_DECL); }
"_Nullable"          { return(EXT_DECL); }
"_Nonnull"           { return(EXT_DECL); }
"__ptr32"            { return(EXT_DECL); }
"__ptr64"            { return(EXT_DECL); }
"_Atomic"            { return(EXT_DECL); }
"__forceinline"      { return(EXT_DECL); }
"__unaligned"        { return(EXT_DECL); }
"_Alignof"           { return(ALIGNOF); }
"_Static_assert"     { return(STATIC_ASSERT); }

 /* "__attribute__".?"(("({D}|{L})*"))" { return(EXT_ATTRIB); } */

 /* DID I MEAN? "__attribute__"" "*"(("" "*({D}|{L})*" "*("("({D}|{L})*(" "*","" "*({D}|{L})*)*" "*")")?" "*"))" { return(EXT_ATTRIB); } */

 /*
 "__attribute_deprecated__"(" "*)"(("(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*)(","(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*))*"))" { return(EXT_ATTRIB); }
 "__attribute__"           (" "*)"(("(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*)(","(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*))*"))" { return(EXT_ATTRIB); }
 "__attribute"             (" "*)"(("(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*)(","(" "*)({D}|{L})*(" "*)("("({D}|{L}|\")*((" "*)","(" "*)({D}|{L}|\")*)*(" "*)")")?(" "*))*"))" { return(EXT_ATTRIB); }
 */
 /*
 [__attribute__] [spaces]
   [((] [spaces]
      [digits | letters] [spaces]
         ( [(]  [digits or letters or "]  ( [spaces] [,] [spaces] [digits or letters or "] )*  [spaces]  [)] )?
      [spaces]
      ( [,] [spaces]  [digits or letters]  [spaces]
         ( [(]  [digits or letters or "]
            ( [spaces] [,] [spaces] [digits or letters or "] )*  [spaces] [)]
         )? [spaces]
      )*
   [))]
 */
 /* "__attribute__".?"((".?({D}|{L})*.?("("({D}|{L})*(.?",".?({D}|{L})*)*.?")")?.?"))" { return(EXT_ATTRIB); } */
 /* "__attribute".?"((".?({D}|{L})*.?("("({D}|{L})*(.?",".?({D}|{L})*)*.?")")?.?"))" { return(EXT_ATTRIB); }*/

"__attribute_deprecated__" { return ATTRIB_DEP; }
"__attribute__" { return ATTRIB; }
"__attribute" { return __ATTRIB; }

"__inline__"               { return(EXT_STORAGE); }
"_inline"                  { return(EXT_STORAGE); }
"__inline"                 { return(EXT_STORAGE); }
"inline"                   { return(EXT_STORAGE); }
"__declspec("({D}|{L}|([ \n\t\r]))*")" { return(EXT_STORAGE); }
"__declspec("({D}|{L}|([ \n\t\r]))*"("((({D}|{L})*)|((\"(\\.|[^\\"])*\"([ \n\t\r])*)*))")"([ \n\t\r])*")" { return(EXT_STORAGE); }
"dllexport"                { return(EXT_STORAGE); }
"dllimport"                { return(EXT_STORAGE); }
"_Noreturn"                { return(EXT_STORAGE); }
"__cdecl"                  { return(EXT_DECL); }
"__stdcall"                { return(EXT_DECL); }
"__stdcall__"              { return(EXT_DECL); }
"_stdcall"                 { return(EXT_DECL); }
"stdcall"                  { return(EXT_DECL); }
"__restrict"               { return(EXT_DECL); }
"__const"                  { return(CONST /*EXT_DECL*/); }
"__restrict__"             { return(EXT_DECL); }
"public"                   { return(PUBLIC); }
"private"                  { return(PRIVATE); }
"typed_object"             { return(TYPED_OBJECT); }
"any_object"               { return(ANY_OBJECT); }
"incref"                   { return(_INCREF); }
"__extension__"            { return(EXTENSION); }
"_extension_"              { return(EXTENSION); }
"__asm__"                  { return(ASM); }
"asm"                      { return(ASM); }
"__asm"                    { return(ASM); }
"__typeof"                 { return(TYPEOF); }
"watch"                    { return(WATCH); }
"stopwatching"             { return(STOPWATCHING); }
"firewatchers"             { return(FIREWATCHERS); }
"watchable"                { return(WATCHABLE); }
"class_designer"           { return(CLASS_DESIGNER); }
"class_no_expansion"       { return(CLASS_NO_EXPANSION); }
"class_fixed"              { return(CLASS_FIXED); }
"class_default_property"   { return(CLASS_DEFAULT_PROPERTY); }
"property_category"        { return(PROPERTY_CATEGORY); }
"class_data"               { return(CLASS_DATA); }
"class_property"           { return(CLASS_PROPERTY); }
"subclass"                 { return(SUBCLASS); }
"namespace"                { return(NAMESPACE); }
"dbtable"                  { return(DBTABLE); }
"dbfield"                  { return(DBFIELD); }
"dbindex"                  { return(DBINDEX); }
"database_open"            { return(DATABASE_OPEN); }

("::"?(({IDENT}"&"?"::")*)){IDENT}?    { return(check_type()); }     /* {L}({L}|{D})*      { return(check_type()); }  // ("::"|(({IDENT}"::")*)){IDENT}  { return(check_type()); }     // {L}({L}|{D})*      { return(check_type()); } */

0[xX]{H}+{IS}?          { return(CONSTANT); }

0[xX]{H}+{P}{FS}?    { return(CONSTANT); }
0[xX]{H}*"."{H}+({P})?{FS}?    { return(CONSTANT); }
0[xX]{H}+"."{H}*({P})?{FS}?    { return(CONSTANT); }

0{D}+{IS}?              { return(CONSTANT); }
{D}+{IS}?               { return(CONSTANT); }
L?'(\\.|[^\\'])+'       { return(CONSTANT); }

{D}+{E}{FS}?            { return(CONSTANT); }
{D}*"."{D}+({E})?{FS}?  { return(CONSTANT); }
{D}+"."{D}*({E})?{FS}?  { return(CONSTANT); }
{D}+"."{D}+"."{D}*      { return(CONSTANT); }  /* For triple OS X versions inside attributes... TODO: Add syntax errors elsewhere */

\"(\\.|[^\\"])*\"     { return(STRING_LITERAL); }
L\"(\\.|[^\\"])*\"     { return(WIDE_STRING_LITERAL); }

"..."       { return(ELLIPSIS); }
">>="       { return(RIGHT_ASSIGN); }
"<<="       { return(LEFT_ASSIGN); }
"+="        { return(ADD_ASSIGN); }
"-="        { return(SUB_ASSIGN); }
"*="        { return(MUL_ASSIGN); }
"/="        { return(DIV_ASSIGN); }
"%="        { return(MOD_ASSIGN); }
"&="        { return(AND_ASSIGN); }
"^="        { return(XOR_ASSIGN); }
"|="        { return(OR_ASSIGN); }
">>"        { return(RIGHT_OP); }
"<<"        { return(LEFT_OP); }
"++"        { return(INC_OP); }
"--"        { return(DEC_OP); }
"->"        { return(PTR_OP); }
"&&"        { return(AND_OP); }
"||"        { return(OR_OP); }
"<="        { return(LE_OP); }
">="        { return(GE_OP); }
"=="        { return(EQ_OP); }
"!="        { return(NE_OP); }
   /* "::"        { return(CLASS_OP); } */
";"         { return(';'); }
("{"|"<%")  { return('{'); }
("}"|"%>")  { return('}'); }
","         { return(','); }
":"         { return(':'); }
"="         { return('='); }
"("         { return('('); }
")"         { return(')'); }
("["|"<:")  { return('['); }
("]"|":>")  { return(']'); }
"."         { return('.'); }
"&"         { return('&'); }
"!"         { return('!'); }
"~"         { return('~'); }
"-"         { return('-'); }
"+"         { return('+'); }
"*"         { return('*'); }
"/"         { return('/'); }
"%"         { return('%'); }
"<"         { return('<'); }
">"         { return('>'); }
"^"         { return('^'); }
"|"         { return('|'); }
"?"         { return('?'); }
"$"         { return('$'); }

<<EOF>> {
      while(include_stack_ptr && !fileStack[include_stack_ptr-1])
      {
         --include_stack_ptr;
         defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
      }

      if ( --include_stack_ptr < 0 )
      {
         include_stack_ptr = 0;
         yyterminate();
      }
      else
      {
         delete fileInput;
         yy_delete_buffer( YY_CURRENT_BUFFER );
         fileInput = fileStack[include_stack_ptr];
         yylloc = locStack[include_stack_ptr];
         type_yylloc = locStack[include_stack_ptr];
         expression_yylloc = locStack[include_stack_ptr];
         yy_switch_to_buffer(include_stack[include_stack_ptr] );
         defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
      }
   }


[ \v\f]   { yylloc.start = yylloc.end; type_yylloc.start = type_yylloc.end; expression_yylloc.start = expression_yylloc.end;}
[\n+]    {
   yylloc.end.charPos = 1; yylloc.end.line += yyleng; yylloc.start = yylloc.end;
   type_yylloc.end.charPos = 1; type_yylloc.end.line += yyleng; type_yylloc.start = type_yylloc.end;
   expression_yylloc.end.charPos = 1; expression_yylloc.end.line += yyleng; expression_yylloc.start = expression_yylloc.end;
   }
[\t]     {
   yylloc.start.charPos++ /*= 3 - (yylloc.start.col % 3)*/; yylloc.end.charPos = yylloc.start.charPos; yylloc.start.pos = yylloc.end.pos;
   expression_yylloc.start.charPos++ /*= 3 - (expression_yylloc.start.col % 3)*/; expression_yylloc.end.charPos = expression_yylloc.start.charPos; expression_yylloc.start.pos = expression_yylloc.end.pos;
   type_yylloc.start.charPos++ /*= 3 - (type_yylloc.start.col % 3)*/; type_yylloc.end.charPos = type_yylloc.start.charPos; type_yylloc.start.pos = type_yylloc.end.pos;
   }
[\r]  { yylloc.start = yylloc.end; expression_yylloc.start = expression_yylloc.end;  type_yylloc.start = type_yylloc.end; }
.         {
   yylloc.start = yylloc.end; expression_yylloc.start = expression_yylloc.end;  type_yylloc.start = type_yylloc.end;
   if(inCompiler)
      printf("lexer error: invalid char 0x%X at line %d, col %d\n", (unsigned char)yytext[0], yylloc.start.line, yylloc.start.charPos);
   yyerror();
   }

%%

private:

int yywrap()
{
   return(1);
}

int comment()
{
   int c, last = 0;
   for(;;)
   {
      c = input();
      if(c == EOF) break;

      // fputc(c, output);
      // putchar(c);
      if(c == '\n')
      {
         yylloc.end.charPos = 1;
         yylloc.end.pos++;
         yylloc.end.line++;
      }
      else if (c == '\t')
      {
         yylloc.end.charPos++ /* += 3 - (yylloc.end.col % 3)*/;
         yylloc.end.pos++;
      }
      else
      {
         yylloc.end.charPos++;
         yylloc.end.pos++;
      }
      if(c == '/' && last == '*')
         break;
      last = c;
   }
   yylloc.start = yylloc.end;
   return 0;
}

int commentCPP()
{
   int c; //, last = 0;
   for(;;)
   {
      c = input();
      if(c == EOF) break;

      // fputc(c, output);
      // putchar(c);
      if(c == '\n')
      {
         yylloc.end.charPos = 1;
         yylloc.end.pos++;
         yylloc.end.line++;
         break;
      }
      else if (c == '\t')
      {
         yylloc.end.charPos++ /* += 3 - (yylloc.end.col % 3)*/;
         yylloc.end.pos++;
      }
      else
      {
         yylloc.end.charPos++;
         yylloc.end.pos++;
      }
      //last = c;
   }
   yylloc.start = yylloc.end;
   return 0;
}

int preprocessor()
{
   int c, last = 0;
   int count = 0;
   char line[1024];

   line[0] = '\0';

   for(;;)
   {
      c = input();
      if(c == EOF) break;

      if(c == '\n')
      {
         yylloc.end.charPos = 1;
         yylloc.end.pos++;
         yylloc.end.line++;
         if(last != '\\')
         {
            const char * pointer = line + 1;
            bool hasLineNumber = false;
            int lineNumber;
            char numberString[20];

            line[count] = 0;
            if(GetString(&pointer, numberString, sizeof(numberString)))
            {
               char * ptr = null;
               lineNumber = (int)strtol(numberString, &ptr, 10);
               if(ptr && ptr > numberString)
                  hasLineNumber = true;
            }

            if(hasLineNumber)
            {
               char fileName[MAX_LOCATION];

               int inOut;

               fileName[0] = 0;
               GetString(&pointer, fileName, MAX_LOCATION);
               inOut = GetValue(&pointer);

               if(inOut == 1)
               {
                  char extension[MAX_EXTENSION];

                  defaultDeclMode = declModeStack[include_stack_ptr] = declMode;

                  GetExtension(fileName, extension);
                  if(!strcmp(extension, "c") || !strcmp(extension, "h"))
                     declMode = defaultDeclMode = structDeclMode = defaultAccess;

                  fileStack[include_stack_ptr] = null;
                  include_stack_ptr++;
               }
               else if(inOut == 2)
               {
                  include_stack_ptr--;
                  defaultDeclMode = declMode = structDeclMode = declModeStack[include_stack_ptr];
               }

               yylloc.end.charPos = 1;
               yylloc.end.line = lineNumber;
               //yylloc.end.pos -= count;

               if(include_stack_ptr > 0 || (lineNumber && fileName[0]))
                  yylloc.end.included = GetIncludeFileID(fileName);
               else
                  yylloc.end.included = 0;
            }
            /*
            int lineNumber = strtol(line+1, &endPtr, 0);
            if(lineNumber)
            {
               GetString(&
               endPtr

               yylloc.end.charPos = 1;
               yylloc.end.line = lineNumber;
               yylloc.end.pos -= count;
            }
            */
            break;
         }
         count = 0;
      }
      else if (c == '\t')
      {
         yylloc.end.charPos++ /* += 3 - (yylloc.end.col % 3)*/;
         yylloc.end.pos++;
         line[count++] = c;
      }
      else
      {
         yylloc.end.pos++;
         if(c != '\r')
         {
            yylloc.end.charPos++;
            line[count++] = c;
         }
      }
      last = c;
   }
   yylloc.start = yylloc.end;
   line[count] = 0;

   TrimLSpaces(line, line);
   for(c = 0; line[c] && line[c] != ' '; c++);

   if(!strncmp(line, "pragma", c))
   {
      /*
      External pragma;
      if(!ast)
         ast = MkList();
      pragma = MkExternalPragma(line);
      ListAdd(ast, pragma);
      */
      strcpy(yytext, line);
      return PRAGMA;
   }
   else if(!strncmp(line, "include", c))
   {
      char includeFile[MAX_LOCATION] = "";

      memmove(line, line+c, strlen(line+c)+1);
      TrimLSpaces(line, line);
      if(line[0] == '\"')
      {
         for(c = 1; line[c]; c++)
         {
            if(line[c] == '\"')
            {
               strncpy(includeFile, line+1, c-1);
               includeFile[c-1] = '\0';
               break;
            }
         }
      }
      else if(line[0] == '<')
      {
         for(c = 1; line[c]; c++)
            if(line[c] == '>')
            {
               strncpy(includeFile, line+1, c-1);
               includeFile[c-1] = '\0';
               break;
            }
      }

      if ( include_stack_ptr >= MAX_INCLUDE_DEPTH )
      {
         fprintf( stderr, "%s", $"Includes nested too deeply" );
         exit( 1 );
      }

      if(inCompiler || !FindIncludeFileID(includeFile))
      {
         File file = OpenIncludeFile(includeFile);
         if(file)
         {
            char extension[MAX_EXTENSION];

            fileStack[include_stack_ptr] = fileInput;
            locStack[include_stack_ptr] = yylloc;
            defaultDeclMode = declModeStack[include_stack_ptr] = declMode;
            include_stack[include_stack_ptr++] = YY_CURRENT_BUFFER;

            yylloc.start.charPos = yylloc.end.charPos = 1;
            yylloc.start.line = yylloc.end.line = 1;
            yylloc.start.pos = yylloc.end.pos = 0;
            yylloc.start.included = yylloc.end.included = GetIncludeFileID(includeFile);

            GetExtension(includeFile, extension);
            if(!strcmp(extension, "c") || !strcmp(extension, "h"))
               declMode = defaultDeclMode = structDeclMode = defaultAccess;

            fileInput = file;
            yy_switch_to_buffer( yy_create_buffer( fileInput, YY_BUF_SIZE ) );
            BEGIN(INITIAL);
         }
      }
   }
   return 0;
}

public void resetScanner()
{
   YY_FLUSH_BUFFER;
   yylloc.start.charPos = yylloc.end.charPos = 1;
   yylloc.start.line = yylloc.end.line = 1;
   yylloc.start.pos = yylloc.end.pos = 0;
   yylloc.start.included = yylloc.end.included = 0;

   expression_yylloc.start.charPos = expression_yylloc.end.charPos = 1;
   expression_yylloc.start.line = expression_yylloc.end.line = 1;
   expression_yylloc.start.pos = expression_yylloc.end.pos = 0;
   expression_yylloc.start.included = expression_yylloc.end.included = 0;

   type_yylloc.start.charPos = type_yylloc.end.charPos = 1;
   type_yylloc.start.line = type_yylloc.end.line = 1;
   type_yylloc.start.pos = type_yylloc.end.pos = 0;
   type_yylloc.start.included = type_yylloc.end.included = 0;

   include_stack_ptr = 0;
}

void resetScannerPos(CodePosition pos)
{
   YY_FLUSH_BUFFER;
   yylloc.start = yylloc.end = pos;
   type_yylloc.start = type_yylloc.end = pos;
   expression_yylloc.start = expression_yylloc.end = pos;
}

class LexerBackup
{
   YYLTYPE yylloc;
   YYLTYPE type_yylloc;
   YYLTYPE expression_yylloc;

   AccessMode declMode;
   AccessMode defaultDeclMode;

   File fileInput;
   YY_BUFFER_STATE include_stack[MAX_INCLUDE_DEPTH];
   File fileStack[MAX_INCLUDE_DEPTH];
   char sourceFileStack[MAX_INCLUDE_DEPTH][MAX_LOCATION];
   YYLTYPE locStack[MAX_INCLUDE_DEPTH];
   AccessMode declModeStack[MAX_INCLUDE_DEPTH];
   int include_stack_ptr;
   YY_BUFFER_STATE buffer;

   int yy_n_chars;
   char * yytext_ptr;
   char * yy_c_buf_p;
   FILE * yyin;
   char yy_hold_char;
   int yychar;
   int yy_init;
   int yy_start;

};

LexerBackup pushLexer()
{
   LexerBackup backup { };

   backup.yylloc = yylloc;
   backup.type_yylloc = type_yylloc;
   backup.expression_yylloc = expression_yylloc;
   backup.fileInput = fileInput;
   memcpy(backup.include_stack, include_stack, sizeof(include_stack));
   memcpy(backup.fileStack, fileStack, sizeof(fileStack));
   memcpy(backup.sourceFileStack, sourceFileStack, sizeof(sourceFileStack));
   memcpy(backup.locStack, locStack, sizeof(locStack));
   memcpy(backup.declModeStack, declModeStack, sizeof(declModeStack));
   backup.include_stack_ptr = include_stack_ptr;
   backup.defaultDeclMode = defaultDeclMode;
   backup.declMode = declMode;
   backup.buffer = YY_CURRENT_BUFFER;

   backup.yy_n_chars = yy_n_chars;
   backup.yytext_ptr = yytext_ptr;
   backup.yy_c_buf_p = yy_c_buf_p;
   backup.yyin = yyin;
   backup.yy_hold_char = yy_hold_char;
   backup.yychar = yychar;
   backup.yy_init = yy_init;
   backup.yy_start = yy_start;

   yy_init = 1;

   YY_CURRENT_BUFFER = 0;

   yylloc.start.charPos = yylloc.end.charPos = 1;
   yylloc.start.line = yylloc.end.line = 1;
   yylloc.start.pos = yylloc.end.pos = 0;
   yylloc.start.included = yylloc.end.included = 0;

   expression_yylloc.start.charPos = expression_yylloc.end.charPos = 1;
   expression_yylloc.start.line = expression_yylloc.end.line = 1;
   expression_yylloc.start.pos = expression_yylloc.end.pos = 0;
   expression_yylloc.start.included = expression_yylloc.end.included = 0;

   type_yylloc.start.charPos = type_yylloc.end.charPos = 1;
   type_yylloc.start.line = type_yylloc.end.line = 1;
   type_yylloc.start.pos = type_yylloc.end.pos = 0;
   type_yylloc.start.included = type_yylloc.end.included = 0;

   include_stack_ptr = 0;

   return backup;
}

void popLexer(LexerBackup backup)
{
   yylloc = backup.yylloc;
   type_yylloc = backup.type_yylloc;
   expression_yylloc = backup.expression_yylloc;
   fileInput = backup.fileInput;
   memcpy(include_stack, backup.include_stack, sizeof(include_stack));
   memcpy(fileStack, backup.fileStack, sizeof(fileStack));
   memcpy(sourceFileStack, backup.sourceFileStack, sizeof(sourceFileStack));
   memcpy(locStack, backup.locStack, sizeof(locStack));
   memcpy(declModeStack, backup.declModeStack, sizeof(declModeStack));
   include_stack_ptr = backup.include_stack_ptr;
   defaultDeclMode = backup.defaultDeclMode;
   declMode = structDeclMode = backup.declMode;

   // yy_switch_to_buffer(backup.buffer);
   YY_CURRENT_BUFFER = backup.buffer;
   yy_n_chars = backup.yy_n_chars;
   yytext_ptr = backup.yytext_ptr;
   yy_c_buf_p = backup.yy_c_buf_p;
   yyin = backup.yyin;
   yy_hold_char = backup.yy_hold_char;
   yychar = backup.yychar;
   yy_init = backup.yy_init;
   yy_start = backup.yy_start;

   delete backup;
}
