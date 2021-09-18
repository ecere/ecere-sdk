public import IMPORT_STATIC "ecere"

public enum CMSSTokenType
{
   // Core Tokens
   none = 9999,
   identifier = 1000,
   constant,
   stringLiteral,

   endOfInput = 0, // FIXME (enum values with escaped char) '\0',

   hashTag = '#',

   // Comparison
   smaller = '<',
   greater = '>',

   // Logical Not
   not = '!',

   // Binary Logic
   or = '|',
   and = '&',
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

   // Multi char symbols
   notEqual = 256,   // !=
   smallerEqual,     // <=
   greaterEqual,     // >=

   // Text Comparison
   stringIsExactly,
   stringContains,
   stringStartsWith,
   stringEndsWith,
   stringNotContains,
   stringNotStartsW,
   stringNotEndsW,

   addAssign, // +=

   intDivide,  // div

   // Textual operators
   in
   ;
   ///////////////

   property char { }

   property bool isUnaryOperator
   {
      get
      {
         return this == '&' || this == '*' || this == '+' || this == '-' || this == '~' || this == '!';
      }
   }

   void print(File out, int indent, CMSSOutputOptions o)
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

   public String toString(CMSSOutputOptions o)
   {
      TempFile f { };
      String s;
      print(f, 0, o);
      f.Putc(0);
      s = (String)f.StealBuffer();
      delete f;
      return s;
   }
};

static const String tokenStrings[CMSSTokenType];
static Map<String, CMSSTokenType> stringTokens
{ [
   { "<=", smallerEqual },
   { ">=", greaterEqual },
   { "==", equal },
   { "!=", notEqual },
   { "&&", and },
   { "not", not },
   { "and", and },
   { "||", or },
   { "or", or },
   { "+=", addAssign },
   { "in", in },
   { "div", intDivide }
] };

static CMSSTokenType matchToken(const String text)
{
   CMSSTokenType type = identifier;
   MapIterator<String, CMSSTokenType> it { map = stringTokens };
   if(it.Index(text, false))
      type = it.data;
   return type;
}

class CMSSToken
{
public:
   property CMSSTokenType type { get { return this ? type : 0; } };
private:
   CMSSTokenType type;
   String text;

   ~CMSSToken()
   {
      delete text;
   }
}

static enum CMSSLexingState
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

public class CMSSOutputOptions : uint
{
public:
   bool reserved:1;
   bool dbgOneLiner:1;
}

public struct CMSSCodePosition
{
public:
   int line, col, pos;
   int included;
};

public class CMSSLexer
{
   const String input;

   CMSSTokenType type; type = none;
   CMSSToken token, nextToken;
   Array<CMSSToken> tokenStack { minAllocSize = 256 };
   int ambiguous, stackPos;
   CMSSCodePosition pos;
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

   CMSSTokenType prepareNextToken()
   {
      if(type == none)
      {
         const String input = this.input;
         CMSSCodePosition pos = this.pos;
         int start = 0;
         CMSSTokenType type = none;
         bool escaped = false;
         char quoteChar = 0;
         CMSSLexingState lexingState = none;
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
                        CMSSCodePosition np { pos.line, pos.col + 1, pos.pos + 1 };
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
                     type = CMSSTokenType::constant;
                     advanceChar = false;
                  }
                  break;
               }
               case multiLineComment:
                  if(ch == '*' && input[pos.pos+1] == '/')
                  {
                     pos.pos++, pos.col++;
                     lexingState = 0;
                  }
                  break;
               case singleLineComment:
                  if(ch == '\n' && (!pos.pos || input[pos.pos-1] != '\\'))
                  {
                     lexingState = 0;
                     pos.line++, pos.col = 0;
                  }
                  break;
               case preprocessor:
                  if(ch == '\n' && (!pos.pos || input[pos.pos-1] != '\\'))
                  {
                     if(!pos.pos || input[pos.pos-1] != '\\')
                        lexingState = 0;
                     pos.line++, pos.col = 0;
                  }
                  break;
               default:
               {
                  switch(ch)
                  {
                     case ' ': case '\t': case '\r': case '\n':
                        if(ch == '\n')
                           pos.line++, pos.col = 0;
                        break;
                     case '=':
                        if(input[pos.pos+1] == '=')
                           type = equal, pos.pos++, pos.col++;
                        else
                           type = equal;
                        break;
                     case '<':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = smallerEqual, pos.pos++, pos.col++; break;
                           case '>': type = notEqual, pos.pos++, pos.col++; break;
                           default: type = smaller;
                        }
                        break;
                     case '>':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = greaterEqual, pos.pos++, pos.col++; break;
                           default: type = greater;
                        }
                        break;
                     case '~': type = stringContains; break;
                     case '^': type = stringStartsWith; break;
                     case '$': type = stringEndsWith; break;

                     case '!':
                     {
                        char next = input[pos.pos+1];
                             if(next == '=') pos.pos++, pos.col++, type = notEqual;
                        else if(next == '~') pos.pos++, pos.col++, type = stringNotContains;
                        else if(next == '^') pos.pos++, pos.col++, type = stringNotStartsW;
                        else if(next == '$') pos.pos++, pos.col++, type = stringNotEndsW;
                        else
                           type = not;
                        break;
                     }
                     case '+':
                        switch(input[pos.pos+1])
                        {
                           case '=': type = addAssign, pos.pos++, pos.col++; break;
                           default: type = plus;
                        }
                        break;
                     case '-': type = minus; break;
                     case '*': type = multiply; break;
                     case '#': type = hashTag; break;
                     case '/':
                        switch(input[pos.pos+1])
                        {
                           case '/': lexingState = singleLineComment, start = pos.pos, pos.pos++, pos.col++; break;
                           case '*': lexingState = multiLineComment, start = pos.pos, pos.pos++, pos.col++; break;
                           default: type = divide;
                        }
                        break;
                     case '%':
                        switch(input[pos.pos+1])
                        {
                           case '>': type = '}', pos.pos++, pos.col++; break;
                           default: type = modulo; break;
                        }
                        break;
                     case '|':
                        switch(input[pos.pos+1])
                        {
                           case '|': type = or, pos.pos++, pos.col++; break;
                           default: type = or; break;
                        }
                        break;
                     case '&':
                        switch(input[pos.pos+1])
                        {
                           case '&': type = and, pos.pos++, pos.col++; break;
                           default: type = and;
                        }
                        break;
                     case ':':
                        if(input[pos.pos+1] == '>') type = ']', pos.pos++, pos.col++;
                        else type = colon;
                        break;
                     case '.': type = dot; break;
                     case '"': case '\'':
                        quoteChar = ch;
                        start = pos.pos+1;
                        lexingState = string;
                        break;
                     case ',': case '(': case ')': case '?': case ';': case '{': case '}': case '[': case ']': case '\0':
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

   CMSSToken peekToken()
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
            CMSSTokenType type = prepareNextToken();
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

   CMSSToken readToken()
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
            memmove(tokenStack.array, tokenStack.array + stackPos, (tokenStack.size - stackPos) * sizeof(CMSSToken));
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
            case constant:
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

   public void initFile(File f)
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
   public void initString(const String string)
   {
      delete (char *)input;
      input = string;
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
