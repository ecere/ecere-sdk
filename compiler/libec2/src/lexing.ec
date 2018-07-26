public import "ecere"

// String Unescape Copy

// TOFIX: THIS DOESN'T HANDLE NUMERIC ESCAPE CODES (OCTAL/HEXADECIMAL...)?
public int unescapeString(String d, const String s, int len)
{
   int j = 0, k = 0;
   char ch;
   while(j < len && (ch = s[j]))
   {
      switch(ch)
      {
         case '\\':
            switch((ch = s[++j]))
            {
               case 'n': d[k] = '\n'; break;
               case 't': d[k] = '\t'; break;
               case 'a': d[k] = '\a'; break;
               case 'b': d[k] = '\b'; break;
               case 'f': d[k] = '\f'; break;
               case 'r': d[k] = '\r'; break;
               case 'v': d[k] = '\v'; break;
               case '\\': d[k] = '\\'; break;
               case '\"': d[k] = '\"'; break;
               case '\'': d[k] = '\''; break;
               default: d[k] = '\\'; d[++k] = ch;
            }
            break;
         default:
            d[k] = ch;
      }
      j++, k++;
   }
   d[k] = '\0';
   return k;
}

public enum TokenType2
{
   // Core Tokens
   none = 9999,
   identifier = 1000,
   constant,
   stringLiteral,

   endOfInput = 0, // FIXME (enum values with escaped char) '\0',

   // Comparison
   smaller = '<',
   greater = '>',

   // Logical Not
   not = '!',

   // Binary Logic
   or = '|',
   and = '&',
   xor = '^',
   tilde = '~',

   // Arithmetic
   plus = '+',
   minus = '-',
   multiply = '*',
   divide = '/',
   modulo = '%',
   openParenthesis = '(',
   closeParenthesis = ')',

   /////////////////////////////////
   equal = '=',
   comma = ',',
   question = '?',
   colon = ':',

   openBracket = '[',
   closeBracket = ']',
   openCurly = '{',
   closeCurly = '}',
   semiColon = ';',
   dot = '.',

   dollar = '$',

   // Multi char symbols
   shiftLeft = 256,  // <<
   shiftRight,       // >>

   equality,         // ==
   notEqual,         // !=
   smallerEqual,     // <=
   greaterEqual,     // >=
   logicalAnd,       // &&
   logicalOr,        // ||

   increment,        // ++
   decrement,        // --

   mulAssign,        // *=
   divAssign,        // /=
   modAssign,        // %=
   addAssign,        // +=
   subAssign,        // -=
   andAssign,        // &=
   xorAssign,        // ^=
   orAssign,         // |=
   shiftLeftAssign,  // <<=
   shiftRightAssign, // >>=

   ptrOp,            // ->
   ellipsis,         // ...

   // Textual operators
   sizeOf,
   alignOf,
   builtInOffsetOf,

   _new,
   _new0,
   _renew,
   _renew0,
   _incref,
   _delete,

   // General
   extension,
   ___asm,

   // Qualifiers
   _auto,
   _extern,
   _register,
   _const,
   _volatile,
   attrib,
   _attrib,
   attribDeprecated, // __attribute_deprecated__
   extDecl,      // These are using 'text'
   extStorage,   // These are using 'text'
   _restrict,
   _thread,

   _virtual,

   // Access control
   _static,
   _public,
   _private,

   //　Basic types
   _char,
   _short,
   _int,
   _int64,
   _int128,
   _float128,
   _long,
   _signed,
   _unsigned,
   _float,
   _double,
   _void,
   _valist,
   vaArg,
   _typeof,

   _uint,
   _uint16,
   _uint64,
   _uint128,
   subClass,
   thisClass,
   typedObject,
   anyObject,

   // C99
   BOOL,
   _BOOL,
   complex,
   imaginary,

   // Types
   nameSpace,
   _class,
   _struct,
   _union,
   _enum,
   _typedef,

   // Flow control
   _case,
   _default,
   _if,
   _switch,
   _while,
   _do,
   _for,
   _goto,
   _continue,
   _break,
   _return,
   ifx,
   _else,

   // eC Stuff
   _import,
   _define,

   classDesigner,
   classNoExpansion,
   classFixed,
   classDefaultProperty,
   classData,
   classProperty,

   // Observer pattern
   _watch,
   stopWatching,
   fireWatchers,
   _watchable,

   // Properties
   _property,
   isPropSet,        // don't make these keywords ?
   setProp,
   getProp,
   propertyCategory,

   // EDA keywords
   dbTable,
   dbField,
   dbIndex,
   databaseOpen //, -- a comma here was seriously confusing the debugger

   ;
   ///////////////

   property char { }

   property bool isSpecifier
   {
      get
      {
         return isQualifier || this == _char || this == _short || this == _int || this == _uint || this == _int64 || this == _long || this == _signed ||
                this == _unsigned || this == _float || this == _double || this == _void ||
                this == _valist || this == thisClass || this == typedObject || this == anyObject ||
                this == _typedef || this == _struct || this == _class || this == _union || this == _enum ||
                this == _typeof || this == subClass ||
                this == BOOL || this == _BOOL || this == complex || this == imaginary || this == thisClass || this == _int128 || this == _float128
                ;
      }
   }

   property bool isQualifier
   {
      get
      {
         return this == _extern || this == _static || this == _auto || this == _register || this == _const || this == _volatile ||
                this == _private || this == _public || this == _virtual;
      }
   }

   property bool isUnaryOperator
   {
      get
      {
         return this == '&' || this == '*' || this == '+' || this == '-' || this == '~' || this == '!' || this == _delete || this == _incref;
      }
   }

   property bool isAssignmentOperator
   {
      get
      {
        return this == '=' || this == mulAssign || this == divAssign || this == modAssign ||
               this == addAssign || this == subAssign || this == shiftLeftAssign || this == shiftRightAssign ||
               this == andAssign || this == xorAssign || this == orAssign;
      }
   }

   void print(File out, OutputOptions o)
   {
      if(this < 256)
         out.Print((char)this);
      else
      {
         static bool initialized = false;
         if(!initialized)
         {
            initialized = true;
            for(r : stringTokens)
                tokenStrings[r] = &r;
         }
         out.Print(tokenStrings[this]);
      }
   }
};

static const String tokenStrings[TokenType2];
static Map<String, TokenType2> stringTokens
{ [
   { "++", increment },
   { "--", decrement },
   { "<<", shiftLeft },
   { ">>", shiftRight },
   { "<=", smallerEqual },
   { ">=", greaterEqual },
   { "==", equality },
   { "!=", notEqual },
   { "&&", logicalAnd },
   { "||", logicalOr },
   { "*=", mulAssign },
   { "/=", divAssign },
   { "%=", modAssign },
   { "+=", addAssign },
   { "-=", subAssign },
   { "<<=", shiftLeftAssign },
   { ">>=", shiftRightAssign },
   { "&=", andAssign },
   { "^=", xorAssign },
   { "|=", orAssign },
   { "->", ptrOp },
   { "...", ellipsis },
   { "<:", '[' },
   { ":>", ']' },
   { "<%", '{' },
   { "%>", '}' },

   { "void", _void },
   { "char", _char },
   { "short", _short },
   { "int", _int },
   { "long", _long },
   { "int64", _int64 },
   { "unsigned", _unsigned },
   { "signed", _signed },
   { "float", _float },
   { "double", _double },
   { "typedef", _typedef },
   { "extern", _extern },
   { "static", _static },
   { "auto", _auto },
   { "register", _register },
   { "uint", _uint },
   { "const", _const },
   { "__const", _const },
   { "volatile", _volatile },
   { "va_list", _valist },
   { "thisclass", thisClass },
   { "typed_object", typedObject },
   { "any_object", anyObject },
   { "struct", _struct },
   { "union", _union },
   { "enum", _enum },
   { "class", _class },
   { "typeof", _typeof },
   { "subclass", subClass },
   { "sizeof", sizeOf },

   { "break", _break },
   { "case", _case },
   { "continue", _continue },
   { "default", _default },
   { "do", _do },
   { "else", _else },
   { "for", _for },
   { "while", _while },
   { "goto", _goto },
   { "if", _if },
   { "return", _return },
   { "__signed", _signed },
   { "__signed__",_signed },
   { "__alignof__", alignOf },
   { "__builtin_offsetof", builtInOffsetOf },
   { "__thread", _thread },
   { "switch", _switch },
   { "__volatile__", _volatile },
   { "__volatile" , _volatile },

   { "property", _property },

   { "set", setProp },
   { "get", getProp },
   { "isset", isPropSet },

   { "virtual", _virtual },
   { "thisclass", thisClass },
   { "delete", _delete },
   { "new", _new },
   { "renew", _renew },
   { "new0", _new0 },
   { "renew0", _renew0 },

   { "import", _import },
   { "define", _define },

   { "__int64", _int64 },
   { "__int128", _int128 },
   { "__float128", _float128 },

   { "__builtin_va_list", _valist },
   { "__builtin_va_arg", vaArg },
   { "Bool", BOOL },
   { "_Bool", _BOOL },
   { "_Complex", complex },
   { "_Imaginary", imaginary },
   { "__attribute_deprecated__", attribDeprecated },
   { "__attribute__", attrib },
   { "__attribute", _attrib },

   { "__inline__", extStorage },
   { "_inline", extStorage },
   { "__inline", extStorage },
   { "inline", extStorage },
   { "__declspec", extStorage }, // "__declspec("({D}|{L})*")"
   { "dllexport", extStorage },
   { "dllimport", extStorage },

   { "__cdecl", extDecl },
   { "__stdcall", extDecl },
   { "__stdcall__", extDecl },
   { "_stdcall", extDecl },
   { "stdcall", extDecl },
   { "restrict", extDecl },
   { "__restrict", extDecl },
   { "__restrict__", extDecl },

   { "public", _public },
   { "private", _private },
   { "typed_object", typedObject },
   { "any_object", anyObject },
   { "incref", _incref },
   { "__extension__", extension },
   { "_extension_", extension },
   { "__asm__", ___asm },
   { "asm", ___asm },
   { "__asm", ___asm },
   { "__typeof", _typeof },
   { "watch", _watch },
   { "stopwatching", stopWatching },
   { "firewatchers", fireWatchers },
   { "watchable", _watchable },
   { "class_designer", classDesigner },
   { "class_no_expansion", classNoExpansion },
   { "class_fixed", classFixed },
   { "class_default_property", classDefaultProperty },
   { "property_category", propertyCategory },
   { "class_data", classData },
   { "class_property", classProperty },
   { "subclass", subClass },
   { "namespace", nameSpace },
   { "dbtable", dbTable },
   { "dbfield", dbField },
   { "dbindex", dbIndex },
   { "database_open", databaseOpen }
] };

static TokenType2 matchToken(const String text)
{
   TokenType2 type = identifier;
   MapIterator<String, TokenType2> it { map = stringTokens };
   if(it.Index(text, false))
      type = it.data;
   return type;
}

class Token
{
public:
   property TokenType2 type { get { return this ? type : 0; } };
private:
   TokenType2 type;
   String text;

   ~Token()
   {
      delete text;
   }
}

static enum LexingState
{
   none,
   string,
   identifier,
   number,
   preprocessor,
   singleLineComment,
   multiLineComment
};

char * strchrmax(const char * s, int c, int max)
{
   int i;
   char ch;
   for(i = 0; i < max && (ch = s[i]); i++)
      if(ch == c)
         return (char *)s + i;
   return null;
}

public class OutputOptions : uint
{
public:
   bool astType:1;
}

public struct CodePosition
{
public:
   int line, col, pos;
   int included;
};

public struct Location
{
public:
   CodePosition start, end;

   bool inside(int line, int col)
   {
      return (start.line < line || (start.line == line && start.col <= col)) &&
             (end.line   > line || (end.line   == line && end.col   >= col));
   }
};

class Lexer
{
   const String input;
   CodePosition pos;

   TokenType2 type; type = none;
   Token token, nextToken;
   Array<Token> tokenStack { minAllocSize = 256 };
   int ambiguous, stackPos;
   char text[1024]; // FIXME: dynamic size

   /*
      C constants rules, using CodeEditor code leveraging strtod()/strtol() for now

         D         [0-9]
         H         [a-fA-F0-9]
         E         [Ee][+-]?{D}+
         P         [Pp][+-]?{D}+
         FS        (f|F|l|L|i|I|j|J)*
         IS        (u|U|l|L|i|I|j|J)*

         0[xX]{H}+{IS}?
         0[xX]{H}+{P}{FS}?
         0[xX]{H}*"."{H}+({P})?{FS}?
         0[xX]{H}+"."{H}*({P})?{FS}?
         0{D}+{IS}?
         {D}+{IS}?
         L?'(\\.|[^\\'])+'
         {D}+{E}{FS}?
         {D}*"."{D}+({E})?{FS}?
         {D}+"."{D}*({E})?{FS}?
   */
   bool readConstant(const char * word, int wordLen)
   {
      bool valid = false;
      const char * dot = word[wordLen] == '.' ? word + wordLen : (word[0] == '.' && (word == input || word[-1] == '-' || isspace(word[-1])) ? word : null);
      bool isReal = dot != null;
      char * s = null;
      if(dot)
         isReal = true;
      else
      {
         char * exponent;
         bool isHex = (word[0] == '0' && (word[1] == 'x' || word[1] == 'X'));
         if(isHex)
         {
            exponent = strchrmax(word, 'p', wordLen);
            if(!exponent) exponent = strchrmax(word, 'P', wordLen);
         }
         else
         {
            exponent = strchrmax(word, 'e', wordLen);
            if(!exponent) exponent = strchrmax(word, 'E', wordLen);
         }
         isReal = exponent != null;
      }
      if(isReal)
         strtod(word, &s);      // strtod() seems to break on hex floats (e.g. 0x23e3p12, 0x1.fp3)
      else
         strtol(word, &s, 0);
      if(s && s != word)
      {
         // Check suffixes
         char ch;
         int i;
         int gotF = 0, gotL = 0, gotU = 0, gotI = 0;
         valid = true;

         for(i = 0; valid && i < 5 && (ch = s[i]) && (isalnum(ch) || ch == '_'); i++)
         {
            switch(ch)
            {
               case 'f': case 'F': gotF++; if(gotF > 1 || !isReal) valid = false; break;
               case 'l': case 'L':
                  gotL++;
                  if(gotL > 2 || (isReal && (gotL == 2 || gotF)) || (gotL == 2 && (s[i-1] != ch)))
                  valid = false;
                  break;
               case 'u': case 'U': gotU++; if(gotU > 1 || isReal) valid = false; break;
               case 'i': case 'I': case 'j': case 'J': gotI++; if(gotI > 1) valid = false; break;
               default: valid = false;
            }
         }

         // Check for too many decimal points
         if(s[0] == '.' && isdigit(s[1]))
         {
            while(s[0] == '.' && isdigit(s[1]))
            {
               wordLen = s - word;
               strtod(s, &s);
            }
            wordLen = s - word;
         }
         else if(valid)
            wordLen = s + i - word;
      }
      strncpy(text, word, wordLen);
      text[wordLen] = 0;
      {
         int newPos = ((int)(word - input)) + wordLen;
         pos.col += newPos - pos.pos;
         pos.pos = newPos;
      }
      return valid;
   }

   TokenType2 prepareNextToken()
   {
      if(type == none)
      {
         const String input = this.input;
         CodePosition pos = this.pos;
         int start = 0;
         TokenType2 type = none;
         bool firstChar = true;
         bool escaped = false;
         char quoteChar = 0;
         LexingState lexingState = none;
         text[0] = 0;
         while(type == none)
         {
            char ch = input[pos.pos];
            bool advanceChar = ch ? true : false;
            switch(lexingState)
            {
               case string:
                  if(!ch || (ch == quoteChar && !escaped))
                  {
                     const char * n = input + pos.pos+1;
                     bool isContinued = false, isChar = input[start] == '\'';
                     if(!isChar)
                     {
                        CodePosition np { pos.line, pos.col + 1, pos.pos + 1 };
                        while(*n == ' ' || *n == '\t' || *n == '\r' || *n == '\n')
                        {
                           if(*n == '\r');
                           else if(*n == '\n') np.line++, np.col = 0;
                           else
                              np.col++, np.pos++, pos.col++;
                           n++;
                        }
                        if(*n == '\"')
                           isContinued = true, pos = np;
                     }
                     if(!isContinued)
                     {
                        strncpy(text, input + start-1, pos.pos - start+2);
                        text[pos.pos-start+2] = 0;
                        type = isChar ? constant : stringLiteral;
                     }
                  }
                  else
                     escaped = ch == '\\';
                  break;
               case identifier:
               {
                  if(ch != '_' && !isalnum(ch))
                  {
                     int len = Min(pos.pos - start, sizeof(this.text)-1);
                     strncpy(this.text, input + start, len);
                     this.text[len] = 0;
                     type = matchToken(text);
                     advanceChar = false;
                     break;
                  }
                  break;
               }
               case number:
               {
                  if(!isalnum(ch) && ch != '_')
                  {
                     readConstant(input + start, pos.pos - start);
                     pos = this.pos;
                     type = TokenType2::constant;
                     advanceChar = false;
                  }
                  break;
               }
               case multiLineComment:
                  if(ch == '*' && input[pos.pos+1] == '/')
                  {
                     /*strncpy(text, input + start, pos.pos - start + 2);
                     text[pos.pos - start + 2] = 0;
                     PrintLn(text);*/

                     pos.pos++, pos.col++;
                     lexingState = 0;
                  }
                  break;
               case singleLineComment:
                  if(ch == '\n' && (!pos.pos || input[pos.pos-1] != '\\'))
                  {
                     /*strncpy(text, input + start, pos.pos - start);
                     text[pos.pos - start] = 0;
                     PrintLn(text);*/

                     lexingState = 0;
                     pos.line++, pos.col = 0;
                  }
                  break;
               case preprocessor:
                  if(ch == '\n' && (!pos.pos || input[pos.pos-1] != '\\'))
                  {
                     if(!pos.pos || input[pos.pos-1] != '\\')
                     {
                        /*strncpy(text, input + start, pos.pos - start);
                        text[pos.pos - start] = 0;
                        PrintLn(text);*/

                        lexingState = 0;
                        firstChar = true;
                     }
                     pos.line++, pos.col = 0;
                  }
                  break;
               default:
               {
                  switch(ch)
                  {
                     case ' ': case '\t': case '\r': case '\n':
                        if(ch == '\n')
                        {
                           if(!pos.pos || input[pos.pos-1] != '\\')
                              firstChar = true;
                           pos.line++, pos.col = 0;
                        }
                        break;
                     case '=':
                        if(input[pos.pos+1] == '=')
                           type = equality, pos.pos++, pos.col++;
                        else
                           type = equal;
                        break;
                     case '<':
                        switch(input[pos.pos+1])
                        {
                           case ':': type = '[', pos.pos++, pos.col++; break;
                           case '%': type = '{', pos.pos++, pos.col++; break;
                           case '=': type = smallerEqual, pos.pos++, pos.col++; break;
                           case '<':
                              if(input[pos.pos+2] == '=')
                                 type = shiftLeftAssign, pos.col += 2, pos.pos+=2;
                              else
                                 type = shiftLeft, pos.pos++, pos.col++;
                              break;
                           default: type = smaller;
                        }
                        break;
                     case '>':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = greaterEqual, pos.pos++, pos.col++; break;
                           case '>':
                              if(input[pos.pos+2] == '=')
                                 type = shiftRightAssign, pos.pos+=2, pos.col+=2;
                              else
                                 type = shiftRight, pos.pos++, pos.col++;
                              break;
                           default: type = greater;
                        }
                        break;
                     case '^':
                        if(input[pos.pos+1] == '=') type = xorAssign, pos.pos++, pos.col++;
                        else type = xor;
                        break;
                     case '!':
                        if(input[pos.pos+1] == '=') type = notEqual, pos.pos++, pos.col++;
                        else type = not;
                        break;
                     case '+':
                        switch(input[pos.pos+1])
                        {
                           case '+': type = increment, pos.pos++, pos.col++; break;
                           case '=': type = addAssign, pos.pos++, pos.col++; break;
                           default: type = plus;
                        }
                        break;
                     case '-':
                        switch(input[pos.pos+1])
                        {
                           case '>': type = ptrOp, pos.pos++, pos.col++; break;
                           case '=': type = subAssign, pos.pos++, pos.col++; break;
                           case '-': type = decrement, pos.pos++, pos.col++; break;
                           default: type = minus;
                        }
                        break;
                     case '*':
                        if(input[pos.pos+1] == '=') type = mulAssign, pos.pos++, pos.col++;
                        else type = multiply;
                        break;
                     case '#':
                        if(firstChar)
                        {
                           start = pos.pos;
                           lexingState = preprocessor;
                        }
                        break;
                     case '/':
                        switch(input[pos.pos+1])
                        {
                           case '/': lexingState = singleLineComment, start = pos.pos, pos.pos++, pos.col++; break;
                           case '*': lexingState = multiLineComment, start = pos.pos, pos.pos++, pos.col++; break;
                           case '=': type = divAssign, pos.pos++, pos.col++;
                           default: type = divide;
                        }
                        break;
                     case '%':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = modAssign, pos.pos++, pos.col++; break;
                           case '>': type = '}', pos.pos++, pos.col++; break;
                           default: type = modulo; break;
                        }
                        break;
                     case '|':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = orAssign, pos.pos++, pos.col++; break;
                           case '|': type = logicalOr, pos.pos++, pos.col++; break;
                           default: type = or; break;
                        }
                        break;
                     case '&':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = andAssign, pos.pos++, pos.col++; break;
                           case '&': type = logicalAnd, pos.pos++, pos.col++; break;
                           default: type = and;
                        }
                        break;
                     case ':':
                        if(input[pos.pos+1] == '>') type = ']', pos.pos++, pos.col++;
                        else type = colon;
                        break;
                     case '.':
                        if(input[pos.pos+1] == '.' && input[pos.pos+2] == '.') type = ellipsis, pos.pos+=2, pos.col+=2;
                        else type = dot;
                        break;
                     case '"': case '\'':
                        quoteChar = ch;
                        start = pos.pos+1;
                        lexingState = string;
                        break;
                     case '~': case '$': case ',': case '(': case ')': case '?': case ';': case '{': case '}': case '[': case ']': case '\0':
                        type = ch;
                        break;
                     default:
                        start = pos.pos;
                        if(ch == '.' || isdigit(ch))
                           lexingState = number;
                        else if(ch == '_' || isalpha(ch))
                           lexingState = identifier;
                        else
                           PrintLn("Invalid character: ", ch, " at line: ", pos.line, ", col: ", pos.col);
                        break;
                  }
                  if(ch != ' ' && ch != '\t' && ch != '\r' && ch != '\n')
                     firstChar = false;
                  break;
               }
            }
            if(advanceChar) pos.col++, pos.pos++;
         }
         this.pos = pos;
         this.type = type;
      }
      return type;
   }

   Token peekToken()
   {
      if(!nextToken)
      {
         if(stackPos < tokenStack.count)
         {
            nextToken = tokenStack[stackPos++];
            incref nextToken;
            if(!ambiguous && stackPos == tokenStack.count)
            {
               tokenStack.Free();
               stackPos = 0;
            }
         }
         else
         {
            TokenType2 type = prepareNextToken();
            if(type != endOfInput)
            {
               nextToken = { _refCount = 1, type = type, text = CopyString(text) };
               if(ambiguous)
               {
                  stackPos++;
                  tokenStack.Add(nextToken);
                  incref nextToken;
               }
               this.type = none;
            }
         }
      }
      return nextToken;
   }

   Token readToken()
   {
      if(!nextToken) peekToken();
      delete token;
      token = nextToken;
      nextToken = null;
      return token;
   }

   int pushAmbiguity()
   {
      if(!ambiguous && nextToken && stackPos == tokenStack.count)
      {
         stackPos++;
         tokenStack.Add(nextToken);
         incref nextToken;
      }
      ambiguous++;
      return stackPos - (nextToken ? 1 : 0);
   }

   void clearAmbiguity()
   {
      if(!--ambiguous && stackPos > 0)
      {
         int i;
         for(i = 0; i < stackPos; i++)
            delete tokenStack[i];
         if(tokenStack.size > stackPos)
            memmove(tokenStack.array, tokenStack.array + stackPos, (tokenStack.size - stackPos) * sizeof(Token));
         tokenStack.size -= stackPos;
         stackPos = 0;
      }
   }

   void popAmbiguity(int i)
   {
      delete token;
      delete nextToken;

      stackPos = i;
      clearAmbiguity();
      token = null;
      nextToken = null;
   }

   void lexAll(File out)
   {
      while(readToken())
      {
         switch(token.type)
         {
            case identifier:
            case stringLiteral:
            case extDecl:
            case constant:
            case extStorage:
               out.PrintLn(token.type, " (", token.text, ")");
               break;
            default:
               if(token.type < 256)
                  out.PrintLn((char)token.type);
               else
                  out.PrintLn(token.type);
               break;
         }
      }
   }

   void init(File f)
   {
      uint64 len = f.GetSize();
      char * data = new char[len+1];
      f.Read(data, 1, len);
      data[len] = 0;
      delete (char *)input;
      input = data;
      pos = { 1, 1, 0 };
      token = 0;
      delete token;
      delete nextToken;
      tokenStack.size = 0;
      stackPos = 0;
      ambiguous = 0;
      type = none;
   }
};
