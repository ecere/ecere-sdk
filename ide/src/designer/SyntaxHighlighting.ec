public import "ecere"

import "IDESettings"

char * strchrmax(const char * s, int c, int max)
{
   int i;
   char ch;
   for(i = 0; i < max && (ch = s[i]); i++)
      if(ch == c)
         return (char *)s + i;
   return null;
}

class SyntaxState : int
{
   bool inMultiLineComment:1;
   bool inPrep:1;
   bool escaped:1;
   bool continuedSingleLineComment:1;
   bool wasInMultiLine:1;
   bool continuedString:1;
   bool continuedQuotes:1;

   bool inString:1;
   bool inQuotes:1;
   bool inSingleLineComment:1;

   bool lastWasStar:1;
   bool firstWord:1;
};

public class SyntaxHighlighting : EditSyntaxHL
{
   class_data const char ** extensions;

   class_property const char ** extensions
   {
      get { return class_data(extensions); }
      set { class_data(extensions) = value; }
   }
   Module privateModule; // For eC type info
   Array<int> regLen { };
   Array<const String> regKeywords { };

   Array<int> prepLen { };
   Array<const String> prepKeywords { };

   Array<Array<const String>> allKeywords { [ regKeywords, prepKeywords ] };
   Array<Array<int>> keyLen { [ regLen, prepLen ] };
   property Container<const String> keywords
   {
      set
      {
         if(value)
         {
            int start = regKeywords.size, i, count = value.GetCount();
            regKeywords.size += count;
            regLen.size += count;
            for(i = 0; i < count; i++)
            {
               regKeywords[start + i] = value[i];
               regLen[start + i] = strlen(value[i]);
            }
         }
      }
   }
   property Container<const String> kwPrep
   {
      set
      {
         if(value)
         {
            int start = prepKeywords.size, i, count = value.GetCount();
            prepKeywords.size += count;
            prepLen.size += count;
            for(i = 0; i < count; i++)
            {
               prepKeywords[start + i] = value[i];
               prepLen[start + i] = strlen(value[i]);
            }
         }
      }
   }

   SyntaxColorScheme colorScheme;
   property SyntaxColorScheme syntaxColorScheme { set { delete colorScheme; colorScheme = value; incref colorScheme; } }

   SyntaxState viewLineState;
   SyntaxState currentState;
   SyntaxState backedState;

   bool cppSingle, cMultiLine, cPrep, hashTagComments, cNumbers, singleQuotes;

   bool allowHashInKeyword;
   bool allowDashInKeyword;

   void InitDraw()
   {
      currentState = viewLineState;

      // Should not really need to do this...
      currentState.inString = false;
      currentState.inQuotes = false;
      currentState.inSingleLineComment = false;
   }

   bool CanImpactOtherLines(EditLine line)
   {
      const char * text = line.text;
      bool canImpact = cMultiLine && (strstr(text, "/*") || strstr(text, "*/"));
      int c;

      if(!canImpact)
      {
         for(c = line.count-1; c >= 0; c--)
         {
            char ch = text[c];
            if(ch == '\\')
            {
               canImpact = true;
               break;
            }
            else
               break;
         }
      }
      return canImpact;
   }

   void GotSpace(bool beforeEnd)
   {
      if(beforeEnd)
         currentState.escaped = false;
      currentState.lastWasStar = false;
   }

   void ResetState()
   {
      currentState = backedState;
   }

   Color Process(char * word, int * wordLen, bool beforeEndOfLine, Color defaultTextColor, const char * buffer, int * c)
   {
      Color newTextColor;
      bool wasEscaped = currentState.escaped;

      backedState = currentState;

      currentState.escaped = false;
      currentState.lastWasStar = false;

      // Determine Syntax Highlighting
      newTextColor = defaultTextColor;

      if(currentState.inSingleLineComment || currentState.inMultiLineComment)
      {
         newTextColor = colorScheme.commentColor;
      }
      else if(currentState.inQuotes)
      {
         newTextColor = colorScheme.charLiteralColor;
      }
      else if(currentState.inString)
      {
         newTextColor = colorScheme.stringLiteralColor;
      }
      else if(currentState.inPrep)
      {
         newTextColor = colorScheme.preprocessorColor;
      }
      if(*wordLen == 1 && word[0] == '/')
      {
         if(!currentState.inSingleLineComment && !currentState.inMultiLineComment && !currentState.inQuotes && !currentState.inString)
         {
            if(cppSingle && word[1] == '/')
            {
               currentState.inSingleLineComment = true;
               newTextColor = colorScheme.commentColor;
            }
            else if(cMultiLine && word[1] == '*')
            {
               currentState.inMultiLineComment = true;
               newTextColor = colorScheme.commentColor;
            }
         }
         else if(backedState.lastWasStar)
            currentState.inMultiLineComment = false;
      }
      else if(cMultiLine && *wordLen == 1 && word[0] == '*')
      {
         if(backedState.inMultiLineComment)
            currentState.lastWasStar = true;
      }
      else if(!currentState.inSingleLineComment && !currentState.inMultiLineComment && !currentState.inQuotes && *wordLen == 1 && word[0] == '\"')
      {
         if(currentState.inString && !wasEscaped)
         {
            currentState.inString = false;
         }
         else
         {
            currentState.inString = true;
            newTextColor = colorScheme.stringLiteralColor;
         }
      }
      else if(!currentState.inSingleLineComment && !currentState.inMultiLineComment && !currentState.inString && singleQuotes && *wordLen == 1 && word[0] == '\'')
      {
         if(currentState.inQuotes && !wasEscaped)
            currentState.inQuotes = false;
         else
         {
            currentState.inQuotes = true;
            newTextColor = colorScheme.charLiteralColor;
         }
      }
      else if(*wordLen == 1 && word[0] == '\\')
      {
         if(!wasEscaped)
            currentState.escaped = true;
      }
      else if(beforeEndOfLine && !currentState.inQuotes && !currentState.inString && !currentState.inMultiLineComment && !currentState.inSingleLineComment && (isdigit(word[0]) || (word[0] == '.' && isdigit(word[1]))))
      {
         char * dot = word[*wordLen] == '.' ? word + *wordLen : (word[0] == '.' && (word == buffer || word[-1] == '-' || isspace(word[-1])) ? word : null);
         bool isReal = dot != null;
         int base = cNumbers ? 0 : 10;
         char * s = null;
         if(dot)
            isReal = true;
         else
         {
            char * exponent;
            bool isHex = (word[0] == '0' && (word[1] == 'x' || word[1] == 'X'));
            if(isHex)
            {
               base = 16;
               exponent = strchrmax(word, 'p', *wordLen);
               if(!exponent) exponent = strchrmax(word, 'P', *wordLen);
            }
            else
            {
               exponent = strchrmax(word, 'e', *wordLen);
               if(!exponent) exponent = strchrmax(word, 'E', *wordLen);
            }
            isReal = exponent != null;
         }
         if(isReal)
            strtod(word, &s);      // strtod() seems to break on hex floats (e.g. 0x23e3p12, 0x1.fp3)
         else
            strtol(word, &s, base);
         if(s && s != word)
         {
            // Check suffixes
            char ch;
            int i;
            int gotF = 0, gotL = 0, gotU = 0, gotI = 0;
            bool valid = true;

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

            // Don't highlight numbers with too many decimal points
            if(s[0] == '.' && isdigit(s[1]))
            {
               int newWordLen;
               while(s[0] == '.' && isdigit(s[1]))
               {
                  int newWordLen = s - word;
                  *c += newWordLen - *wordLen;
                  *wordLen = newWordLen;
                  strtod(s, &s);
               }
               newWordLen = s - word;
               *c += newWordLen - *wordLen;
               *wordLen = newWordLen;
            }
            else if(valid)
            {
               int newWordLen = s + i - word;
               newTextColor = colorScheme.numberColor;
               *c += newWordLen - *wordLen;
               *wordLen = newWordLen;
            }
            else if(dot && dot > word && dot < s)
               newTextColor = colorScheme.numberColor;
         }
      }
      else
      {
         if(!currentState.inQuotes && !currentState.inString && !currentState.inMultiLineComment && !currentState.inSingleLineComment && word[0] == '#')
         {
            if(cPrep)
            {
               if(currentState.firstWord)
               {
                  currentState.inPrep = true;
                  newTextColor = *wordLen == 1 ? colorScheme.keywordColors[1] : colorScheme.preprocessorColor;
               }
            }
            else if(hashTagComments)
            {
               currentState.inSingleLineComment = true;
               newTextColor = colorScheme.commentColor;
            }
         }
         if(beforeEndOfLine && !currentState.inQuotes && !currentState.inString && !currentState.inMultiLineComment && !currentState.inSingleLineComment)
         {
            int wordStart = *c - *wordLen;
            KeywordType kwType, upTo = (currentState.inPrep && word[0] != '#' && cPrep) ? preprocessor : regular;
            for(kwType = regular; kwType <= upTo; kwType++)
            {
               Array<const String> keys = allKeywords[kwType];
               Array<int> len = keyLen[kwType];
               int k;
               for(k = 0; k < keys.count; k++)
               {
                  if((len[k] == *wordLen && !strncmp(keys[k], word, *wordLen)) ||
                        (keys[k][0] == '.' && wordStart > 0 && *(word - 1) == '.' &&
                              len[k] == *wordLen + 1 && !strncmp(keys[k] + 1, word, *wordLen)))
                  {
                     newTextColor = colorScheme.keywordColors[kwType];
                     break;
                  }
               }
               if(k < keys.count) break;
            }
         }
      }
      currentState.firstWord = false;
      return newTextColor;
   }

   void StartLine()
   {
      currentState.lastWasStar = false;
      currentState.firstWord = true;
      if(!currentState.escaped) currentState.inPrep = false;
      currentState.inSingleLineComment = currentState.continuedSingleLineComment;
      currentState.escaped = false;
      currentState.inString = currentState.continuedString;
      currentState.inQuotes = currentState.continuedQuotes;
   }

   void NextLine(char * buffer, int count)
   {
      if(count && buffer[count - 1] == '\\')
      {
         currentState.continuedSingleLineComment = currentState.inSingleLineComment;
         currentState.continuedString = currentState.inString;
         currentState.continuedQuotes = currentState.inQuotes;
      }
      else
      {
         currentState.continuedSingleLineComment = false;
         currentState.continuedString = false;
         currentState.continuedQuotes = false;
      }
   }

   int ParseWord(char * buffer, int count, int wordLen)
   {
      int c;
      for(c = 0; c < count; c++)
      {
         unichar ch = buffer[c];
         unichar bf = (wordLen == 1) ? buffer[c-1] : 0;
         bool chHash = ch == '#' && allowHashInKeyword;
         bool bfHash = bf == '#' && allowHashInKeyword;
         bool chDash = ch == '-' && allowDashInKeyword;
         bool bfDash = bf == '-' && allowDashInKeyword;
         if(CharMatchCategories(ch, separators) || ch == '\t' ||
            (wordLen && !CharMatchCategories(ch, numbers|letters|marks|connector) && !chHash && !chDash) ||
            (bf && !CharMatchCategories(bf, numbers|letters|separators|marks|connector) && !bfHash && !bfDash && bf != '\t'))
            break;
         wordLen++;
      }
      return c;
   }

   void FigureStartSyntaxStates(EditLine firstLine, bool reset, EditLine viewLine)
   {
      bool inMultiLineComment = reset ? false : viewLineState.inMultiLineComment;
      bool wasInMultiLine = reset ? false : viewLineState.wasInMultiLine;
      bool inString = false;
      bool inQuotes = false;
      bool inPrep = reset ? false : viewLineState.inPrep;
      bool inSingleLineComment = false;
      bool escaped = reset ? false : viewLineState.escaped;
      bool continuedSingleLineComment = reset ? false : viewLineState.continuedSingleLineComment;
      bool continuedString = reset ? false : viewLineState.continuedString;
      bool continuedQuotes = reset ? false : viewLineState.continuedQuotes;
      EditLine line = firstLine;

      // int maxBackUp = 1000, c;
      // for(c = 0, line = viewLine; c < maxBackUp && line && line.prev; line = line.prev);
      for(; line != viewLine; line = line.next)
      {
         const char * text = line.text;
         int c;
         char ch;
         bool lastWasStar = false;
         bool firstWord = true;
         if(!escaped) inPrep = false;
         inSingleLineComment = continuedSingleLineComment;
         escaped = false;
         inString = continuedString;
         inQuotes = continuedQuotes;

         for(c = 0; (ch = text[c]); c++)
         {
            bool wasEscaped = escaped;
            // FIXME: twice backed up states here? Is this necessary? Simplify? Comments / Test cases?
            bool backLastWasStar = lastWasStar;
            bool backWasInMultiLine = wasInMultiLine;
            escaped = false;
            lastWasStar = false;
            wasInMultiLine = inMultiLineComment;
            if(ch == '/')
            {
               if(!inSingleLineComment && !inMultiLineComment && !inQuotes && !inString)
               {
                  if(cppSingle && text[c+1] == '/')
                  {
                     inSingleLineComment = true;
                  }
                  else if(cMultiLine && text[c+1] == '*')
                  {
                     inMultiLineComment = true;
                  }
               }
               else if(backLastWasStar)
                  inMultiLineComment = false;
            }
            else if(ch == '*')
            {
               if(backWasInMultiLine) lastWasStar = true;
            }
            else if(ch == '\"' && !inSingleLineComment && !inMultiLineComment && !inQuotes)
            {
               if(inString && !wasEscaped)
               {
                  inString = false;
               }
               else
               {
                  inString = true;
               }
            }
            else if(ch == '\'' && singleQuotes && !inSingleLineComment && !inMultiLineComment && !inString)
            {
               if(inQuotes && !wasEscaped)
                  inQuotes = false;
               else
               {
                  inQuotes = true;
               }
            }
            else if(ch == '\\')
            {
               if(!wasEscaped)
                  escaped = true;
            }
            else if(ch == '#' && !inQuotes && !inString && !inMultiLineComment && !inSingleLineComment)
            {
               if(cPrep)
               {
                  if(firstWord)
                  {
                     inPrep = true;
                  }
               }
               else if(hashTagComments)
                  inSingleLineComment = true;
            }
            else if(ch != ' ' && ch != '\t')
               firstWord = false;
         }
         if(line.count && line.text[line.count - 1] == '\\')
         {
            continuedSingleLineComment = inSingleLineComment;
            continuedString = inString;
            continuedQuotes = inQuotes;
         }
         else
         {
            continuedSingleLineComment = false;
            continuedString = false;
            continuedQuotes = false;
         }
      }

      viewLineState.continuedSingleLineComment = continuedSingleLineComment;
      viewLineState.continuedString = continuedString;
      viewLineState.continuedQuotes = continuedQuotes;
      viewLineState.inMultiLineComment = inMultiLineComment;
      viewLineState.wasInMultiLine = wasInMultiLine;
      viewLineState.inPrep = inPrep;
      viewLineState.escaped = escaped;
   }
};

static const char * makeExtensions[] = { "Makefile", "mk", "cf", null };
class MakeSHL : SyntaxHighlighting
{
   class_property(extensions) = makeExtensions;
   keywords =
   [
      // Makefile
      // special target names
      ".PHONY", ".SUFFIXES", ".DEFAULT", ".PRECIOUS", ".INTERMEDIATE", ".SECONDARY", ".SECONDEXPANSION",
      ".DELETE_ON_ERROR", ".IGNORE", ".LOW_RESOLUTION_TIME", ".LOW_RESOLUTION_TIME:", ".SILENT",
      ".EXPORT_ALL_VARIABLES", ".NOTPARALLEL", ".ONESHELL", ".POSIX",
      // standard targets
      "all", "install", "install-html", "install-dvi", "install-pdf", "install-ps", "uninstall", "install-strip",
      "clean", "distclean", "mostlyclean", "maintainer-clean", "TAGS", "info", "dvi", "html", "pdf", "ps", "dist",
      "check", "installcheck", "installdirs",
      // additional standard targets
      "cleantarget", "realclean", "test", "force", "objdir",
      // keywords
      "include", "ifdef", "ifndef", "ifeq", "ifneq", "else", "endif",
      "export", "unexport", "define", "endef", "undefine", "override", "private", "vpath",
      // shell commands
      "echo", "cd", "touch", "cat", "cp", "cpr", "rm", "rmr", "mkdir", "rmdir",
      "for", "in", "do", "done",
      // built-in functions
      "subst", "patsubst", "strip", "findstring", "filter", "filter-out", "sort",
      "word", "wordlist", "words", "firstword", "lastword", "dir", "notdir", "suffix", "basename",
      "addsuffix", "addprefix", "join", "wildcard", "realpath", "abspath", "if", "or", "and",
      "foreach", "file", "call", "value", "eval", "origin", "flavor", "error", "warning", "info", "shell",
      // special variables
      "$@", "$%", "$<", "$?", "$^", "$+", "$*", "$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
      "MAKEFILES", "VPATH", "SHELL", "MAKESHELL", "MAKE", "MAKE_VERSION", "MAKE_HOST", "MAKELEVEL", "MAKEFLAGS",
      "GNUMAKEFLAGS", "MAKECMDGOALS", "CURDIR", "SUFFIXES", ".LIBPATTERNS",
      "MAKEFILE_LIST", ".DEFAULT_GOAL", "MAKE_RESTARTS", "MAKE_TERMOUT", "MAKE_TERMERR", ".RECIPEPREFIX",
      ".VARIABLES", ".FEATURES", ".INCLUDE_DIRS", "VPATH"
   ];

   hashTagComments = true;
   allowDashInKeyword = true;
}

static const char * cExtensions[] = { "c", "h", null };
class CSHL : SyntaxHighlighting
{
   class_property(extensions) = cExtensions;
   keywords =
   [
      "auto", "break", "case", "char", "const", "continue", "default", "do", "double",
      "else", "enum", "extern", "float", "for", "goto", "if", "int", "long", "register",
      "return", "short", "signed", "sizeof", "static", "struct", "switch", "typedef",
      "union", "unsigned", "void", "volatile", "while", "bool", "false", "true",

      "__attribute__", "_stdcall", "__stdcall", "__stdcall__", "__declspec",
      "inline", "_inline", "__inline", "__inline__", "__typeof", "__extension__",
      "asm", "_asm", "__asm", "restrict", "__restrict__", "__restrict",

      "wchar_t", "int8_t", "int16_t", "int32_t", "int64_t", "uint8_t", "uint16_t", "uint32_t", "uint64_t",
      "size_t", "ssize_t",

      // Preprocessor
      "#include", "#define", "#pragma", "#if", "#else", "#elif", "#ifdef", "#ifndef", "#endif", "#undef", "#line", "#cpu",
      "#error", "#warning"
   ];
   kwPrep =
   [
      "defined", "warning"

      // "include", "pragma", "elif", "ifdef", "ifndef", "endif", "undef", "line", "define", "pragma", "else", "cpu"
   ];

   cppSingle = true;
   cMultiLine = true;
   cNumbers = true;
   cPrep = true;
   singleQuotes = true;
   allowHashInKeyword = true;
}

static const char * cxxExtensions[] = { "cxx", "hxx", "cpp", "hpp", "cc", "hh", null };
class CXXSHL : CSHL
{
   class_property(extensions) = cxxExtensions;
   keywords =
   [
      "class", "friend", "compl",
      "new", "delete", "const_cast", "dynamic_cast", "reinterpret_cast",
      "explicit", "export", "mutable",
      "using", "namespace", "operator",
      "private", "protected", "public",
      "static_cast", "template", "this",
      "try",  "throw", "catch",
      "typeid", "typename", "virtual",
      "not", "not_eq","or", "or_eq", "xor", "xor_eq","and", "and_eq", "bitand", "bitor"
   ];
}

static const char * eCExtensions[] = { "ec", "eh", null };
class eCSHL : CSHL
{
   class_property(extensions) = eCExtensions;
   keywords =
   [
      // eC
      "class", "private", "public",
      "property","import",
      "delete", "new", "new0", "renew", "renew0", "define",
      "get", "set",
      "remote",
      "dllexport", "dllimport", "stdcall",
      "subclass", "__on_register_module", "namespace", "using",
      "typed_object", "any_object", "incref", "register", "watch", "stopwatching", "firewatchers", "watchable", "class_designer",
      "class_fixed", "class_no_expansion", "isset", "class_default_property", "property_category", "class_data", "class_property",
      "virtual", "thisclass","unichar", "dbtable", "dbindex", "database_open", "dbfield",

      // Types
      "uint", "uint32", "uint16", "uint64", "bool", "byte", "int64", "uintptr", "intptr", "intsize", "uintsize",

      // Values
      "this", "true", "false", "null", "value"
   ];

   Color Process(char * word, int * wordLen, bool beforeEndOfLine, Color defaultTextColor, const char * buffer, int * c)
   {
      Color newTextColor = SyntaxHighlighting::Process(word, wordLen, beforeEndOfLine, defaultTextColor, buffer, c);
      if(!currentState.inMultiLineComment && !currentState.inSingleLineComment && !currentState.inQuotes && !currentState.inString &&
         (newTextColor == defaultTextColor || newTextColor == colorScheme.preprocessorColor))
      {
         if((word[0] == '_' || isalpha(word[0])) && *wordLen < 256)
         {
            bool valid = true;
            char name[256];
            int i;
            for(i = 0; i < *wordLen; i++)
            {
               char ch = word[i];
               if(ch == '_' || isalnum(ch))
                  name[i] = ch;
               else
               {
                  valid = false;
                  break;
               }
            }
            if(valid)
            {
               name[i] = 0;
               if(eSystem_FindClass(privateModule, name))
                  newTextColor = colorScheme.typeColor;
               else if(eSystem_FindDefine(privateModule, name))
                  newTextColor = colorScheme.defColor;
               else if(eSystem_FindFunction(privateModule, name))
                  newTextColor = colorScheme.fnColor;
            }
         }
      }
      return newTextColor;
   }
}

static const char * objCExtensions[] = { "m", "mm", null };
class ObjCSHL : CSHL
{
   class_property(extensions) = objCExtensions;
   keywords = [ "#import" ];
}

static const char * javaExtensions[] = { "java", null };
class JavaSHL : CSHL
{
   class_property(extensions) = javaExtensions;
   keywords =
   [
      "abstract", "assert", "boolean", "byte", "catch",
      "class",
      "extends", "final", "finally", "implements",
      "import", "instanceof", "interface", "native", "new", "package",
      "private", "protected", "public", "strictfp",
      "super", "synchronized", "this", "throw", "throws", "transient",
      "try", "volatile",
      "null"
   ];
}

static const char * csExtensions[] = { "cs", null };
class CSharpSHL : CSHL
{
   class_property(extensions) = csExtensions;
   keywords =
   [
      "abstract", "as", "base", "byte", "catch",
      "checked", "class", "decimal", "delegate",
      "event", "explicit", "finally",
      "fixed", "foreach", "implicit", "in",
      "interface", "internal", "is", "lock", "namespace", "new", "null",
      "object", "operator", "out", "override", "params", "private", "protected",
      "public", "readonly", "ref", "sbyte", "sealed",
      "stackalloc", "string", "this", "throw",
      "try", "typeof", "uint", "ulong", "unchecked", "unsafe", "ushort", "using",
      "virtual", "volatile",
      "add", "alias", "ascending", "async", "await", "descending", "dynamic", "from",
      "get", "global", "group", "into", "join", "let", "orderby", "partial", "remove",
      "select", "set", "value", "var", "where", "yield"
   ];
}

static const char * pyExtensions[] = { "py", null };
class PythonSHL : SyntaxHighlighting
{
   class_property(extensions) = pyExtensions;
   keywords =
   [
      "and", "as", "assert", "break", "class", "continue", "def", "del", "elif",
      "else", "except", "exec", "finally", "for", "from", "global", "if", "import",
      "in", "is", "lambda", "not", "or", "pass", "print", "raise", "return", "try",
      "while", "with", "yield",
      //
      "True", "False", "None",

      "self", "super", "isinstance", "getattr", "type",

      "__init__", "__file__", "__name__", "__neg__", "__int__", "__long__", "__float__", "__truediv__", "__rtruediv__",
      "__mul__", "__rmul__", "__add__", "__radd__", "__sub__", "__rsub__",
      "__lt__", "__gt__", "__le__", "__ge__", "__ne__", "__eq__", "__new__", "__metaclass__","__getitem__","__len__", "__bases__"
   ];
   hashTagComments = true;
   singleQuotes = true;

   Color Process(char * word, int * wordLen, bool beforeEndOfLine, Color defaultTextColor, const char * buffer, int * c)
   {
      Color newTextColor = SyntaxHighlighting::Process(word, wordLen, beforeEndOfLine, defaultTextColor, buffer, c);
      if(!currentState.inMultiLineComment && !currentState.inSingleLineComment && !currentState.inQuotes && !currentState.inString)
      {
         if(beforeEndOfLine && word[0] == '@' && *wordLen == 1)
         {
            char * s = word + 1;
            while(*s == '.' || isalnum(*s)) s++;
            *wordLen = s-word;
            *c += (s-word)-1;
            newTextColor = colorScheme.preprocessorColor;
         }
      }
      return newTextColor;
   }
}

static const char * swiftExtensions[] = { "swift", null };
class SwiftSHL : SyntaxHighlighting
{
   class_property(extensions) = swiftExtensions;
   keywords =
   [
      // in declarations
      "associatedtype", "class", "deinit", "enum", "extension", "func", "import", "init", "inout",
      "internal", "let", "operator", "private", "protocol", "public", "static", "struct", "subscript",
      "typealias", "var",
      // in statements
      "break", "case", "continue", "default", "defer", "do", "else", "fallthrough", "for", "guard",
      "if", "in", "repeat", "return", "switch", "where", "while",
      // in expressions and types
      "as", "catch", "dynamicType", "false", "is", "nil", "rethrows", "super", "self", "Self", "throw",
      "throws", "true", "try", "#column", "#file", "#function", "#line",
      // in patterns
      "_",
      // #*
      "#available", "#column", "#else#elseif", "#endif", "#file", "#function", "#if", "#line", "#selector",
      // in particular contexts
      "associativity", "convenience", "dynamic", "didSet", "final", "get", "infix", "indirect", "lazy",
      "left", "mutating", "none", "nonmutating", "optional", "override", "postfix", "precedence", "prefix",
      "Protocol", "required", "right", "set", "Type", "unowned", "weak", "willSet",
      //
      "true", "false", "nil"
   ];
}

static const char * rsExtensions[] = { "rs", null };
class RustSHL : SyntaxHighlighting
{
   class_property(extensions) = rsExtensions;
   keywords =
   [
      "abstract", "alignof", "as", "become", "box", "break", "const", "continue", "crate", "do",
      "else", "enum", "extern", "false", "final", "fn", "for", "if", "impl", "in",
      "let", "loop", "macro", "match", "mod", "move", "mut", "offsetof", "override", "priv",
      "proc", "pub", "pure", "ref", "return", "Self", "self", "sizeof", "static", "struct",
      "super", "trait", "true", "type", "typeof", "unsafe", "unsized", "use", "virtual", "where",
      "while", "yield"
   ];
   cppSingle = true;
   cMultiLine = true;
}

static const char * goExtensions[] = { "go", null };
class GoSHL : SyntaxHighlighting
{
   class_property(extensions) = goExtensions;
   keywords =
   [
      "break", "case", "chan", "const", "continue", "default", "defer", "else",
      "fallthrough", "for", "func", "go", "goto", "if", "import", "interface",
      "package", "map", "range", "return", "select", "switch", "struct", "type",
      "var"
   ];
   cppSingle = true;
   cMultiLine = true;
}

static const char * phpExtensions[] = { "php", null };
class PHPSHL : XMLSHL
{
   class_property(extensions) = phpExtensions;
   keywords =
   [
      "__halt_compiler()", "abstract", "and", "array()", "as",
      "break", "callable", "case", "catch", "class",
      "clone", "const", "continue", "declare", "default",
      "die()", "do", "echo", "else", "elseif",
      "empty()", "enddeclare", "endfor", "endforeach", "endif",
      "endswitch", "endwhile", "eval()", "exit()", "extends",
      "final", "finally", "for", "foreach", "function",
      "global", "goto", "if", "implements", "include",
      "include_once", "instanceof", "insteadof", "interface", "isset()",
      "list()", "namespace", "new", "or", "print",
      "private", "protected", "public", "require", "require_once",
      "return", "static", "switch", "throw", "trait",
      "try", "unset()", "use", "var", "while",
      "xor", "yield",
      // compile time constants
      "__CLASS__", "__DIR__", "__FILE__", "__FUNCTION__", "__LINE__", "__METHOD__",
      "__NAMESPACE__", "__TRAIT__"
   ];
   cMultiLine = true;
   cppSingle = true;
   hashTagComments = true;
   singleQuotes = true;
}

static const char * jsExtensions[] = { "js", null };
class JavaScriptSHL : SyntaxHighlighting
{
   class_property(extensions) = jsExtensions;
   keywords =
   [
      "break", "case", "catch", "class", "const", "continue", "debugger", "default", "delete",
      "do", "else", "export", "extends", "finally", "for", "function", "if", "import", "in",
      "instanceof", "new", "return", "super", "super", "this", "throw", "try", "typeof", "var",
      "void", "while", "with", "yield",
      //
      "enum",
      //
      "implements", "interface", "let", "package", "private", "protected", "public", "static",
      //
      "await",
      //
      "abstract", "boolean", "byte", "char", "double", "final", "float", "goto", "int", "long",
      "native", "short", "synchronized", "throws", "transient", "volatile"
   ];

   cppSingle = true;
   cNumbers = true;
   cMultiLine = true;
   singleQuotes = true;
}

static const char * glslExtensions[] = { "frag", "glsl", "vert", null };
class GLSLSHL : SyntaxHighlighting
{
   class_property(extensions) = glslExtensions;
   keywords =
   [
      "attribute", "const", "uniform", "varying",
      "layout",
      "centroid", "flat", "smooth", "noperspective",
      "break", "continue", "do", "for", "while", "switch", "case", "default",
      "if", "else",
      "in", "out", "inout",
      "float", "int", "void", "bool", "true", "false",
      "invariant",
      "discard", "return",
      "mat2", "mat3", "mat4",
      "mat2x2", "mat2x3", "mat2x4",
      "mat3x2", "mat3x3", "mat3x4",
      "mat4x2", "mat4x3", "mat4x4",
      "vec2", "vec3", "vec4", "ivec2", "ivec3", "ivec4", "bvec2", "bvec3", "bvec4",
      "uint", "uvec2", "uvec3", "uvec4",
      "lowp", "mediump", "highp", "precision",
      "sampler1D", "sampler2D", "sampler3D", "samplerCube",
      "sampler1DShadow", "sampler2DShadow", "samplerCubeShadow",
      "sampler1DArray", "sampler2DArray",
      "sampler1DArrayShadow", "sampler2DArrayShadow",
      "isampler1D", "isampler2D", "isampler3D", "isamplerCube",
      "isampler1DArray", "isampler2DArray",
      "usampler1D", "usampler2D", "usampler3D", "usamplerCube",
      "usampler1DArray", "usampler2DArray",
      "sampler2DRect", "sampler2DRectShadow", "isampler2DRect", "usampler2DRect",
      "samplerBuffer", "isamplerBuffer", "usamplerBuffer",
      "struct",
      // future
      "common", "partition", "active",
      "asm",
      "class", "union", "enum", "typedef", "template", "this", "packed",
      "goto",
      "inline", "noinline", "volatile", "public", "static", "extern", "external", "interface",
      "long", "short", "double", "half", "fixed", "unsigned", "superp",
      "input", "output",
      "hvec2", "hvec3", "hvec4", "dvec2", "dvec3", "dvec4", "fvec2", "fvec3", "fvec4",
      "sampler2DRect", "sampler3DRect", "sampler2DRectShadow",
      "samplerBuffer",
      "filter",
      "image1D", "image2D", "image3D", "imageCube",
      "iimage1D", "iimage2D", "iimage3D", "iimageCube",
      "uimage1D", "uimage2D", "uimage3D", "uimageCube",
      "image1DArray", "image2DArray",
      "iimage1DArray", "iimage2DArray", "uimage1DArray", "uimage2DArray",
      "image1DShadow", "image2DShadow",
      "image1DArrayShadow", "image2DArrayShadow",
      "imageBuffer", "iimageBuffer", "uimageBuffer",
      "sizeof", "cast",
      "namespace", "using",
      "row_major",

      "#include", "#define", "#if", "#else", "#elif", "#ifdef", "#ifndef", "#endif", "#undef", "#line"
   ];

   cppSingle = true;
   cNumbers = true;
   cMultiLine = true;
   cPrep = true;
   singleQuotes = true;
}

static const char * cssExtensions[] = { "css", null };
class CSSSHL : SyntaxHighlighting
{
   class_property(extensions) = cssExtensions;

   cMultiLine = true;
   cppSingle = true;
}

static const char * bisonExtensions[] = { "y", "l", null };
class BisonFlexSHL : CSHL
{
   class_property(extensions) = bisonExtensions;
   keywords =
   [
      "%debug", "%union", "%type"
   ];
}

static const char * shExtensions[] = { "sh", null };
class BashSHL : SyntaxHighlighting
{
   class_property(extensions) = shExtensions;
   keywords =
   [
      "case", "do", "done", "elif", "else", "esac", "fi", "for", "function", "if", "in",
      "select", "then", "time", "until", "while",
      "echo", "printf", "read", "cd", "pwd", "pushd", "popd", "dirs",
      "let", "eval", "set", "unset", "export", "declare", "typeset", "readonly", "getopts",
      "source", "exit", "exec", "shopt", "caller", "true", "false", "type", "hash", "bind",
      "ln", "chmod", "cd", "clear", "diff", "comm", "cmp", "cp", "rm", "ls", "exit",
      "grep", "mkdir", "rmdir", "more", "mv", "sort", "date", "cat", "touch"
   ];
   hashTagComments = true;
   singleQuotes = true;
}

static const char * batExtensions[] = { "bat", null };
class BatchSHL : SyntaxHighlighting
{
   class_property(extensions) = batExtensions;
   keywords =
   [
      "rem", "not", "nul", "echo", "off", "for", "in", "do", "goto", "pause", "choice",
      "if", "exist", "call", "command", "cmd", "set", "shift", "sgn", "errorlevel",
      "con", "prn", "lpt1", "com1",
      "assign", "attrib", "cd", "chdir", "cls", "comp", "copy", "del", "deltree", "dir",
      "erase", "exit", "fc", "find", "md", "mkdir", "more", "move", "path", "ren",
      "rename", "rd", "rmdir", "sort", "time", "type", "xcopy"
   ];
}

class SyntaxXMLState : int
{
   bool inTag:1, tagWord:1, xmlComment:1;
}

static const char * xmlExtensions[] = { "xml", "xsd", "html", "htm", "xhtml", "gml", "sld", "kml", "dae", "svg", null };
class XMLSHL : SyntaxHighlighting
{
   class_property(extensions) = xmlExtensions;

   SyntaxXMLState xmlState, xmlStateBak, xmlViewState;

   void InitDraw()
   {
      SyntaxHighlighting::InitDraw();
      xmlState = xmlViewState;
   }

   // TODO: in and out of PHP mode
   Color Process(char * word, int * wordLen, bool beforeEndOfLine, Color defaultTextColor, const char * buffer, int * c)
   {
      bool wasInString = currentState.inString;
      Color newTextColor = xmlState.xmlComment ? colorScheme.commentColor : SyntaxHighlighting::Process(word, wordLen, beforeEndOfLine, defaultTextColor, buffer, c);

      xmlStateBak = xmlState;

      if(!xmlState.xmlComment && !currentState.inMultiLineComment && !currentState.inSingleLineComment && !currentState.inQuotes && !currentState.inString && !wasInString)
      {
         if(beforeEndOfLine && word[0] == '<' && *wordLen == 1)
         {
            if(word[1] == '!' && word[2] == '-' && word[3] == '-')
            {
               xmlState.xmlComment = true;
               *c += 3 - *wordLen;
               *wordLen = 3;
               newTextColor = colorScheme.commentColor;
            }
            else
            {
               xmlState.inTag = true;
               xmlState.tagWord = true;
            }
         }
         else if(beforeEndOfLine && word[0] == '>' && *wordLen == 1)
         {
            xmlState.inTag = false;
         }
         else if(xmlState.tagWord)
         {
            char * s = word;

            if(s[0] == '!' && s[1] == '-' && s[2] == '-')
            {
               newTextColor = colorScheme.commentColor;
               s += 3;
            }
            else
            {
               if(s[0] == '?')
                  xmlState.inTag = false;

               while(isalnum(*s) || *s == '-' || *s == '_' || *s == ':')
                  s++;
            }
            if(s >= word + *wordLen)
            {
               *c += (s - word) - *wordLen;
               *wordLen = s-word;
               newTextColor = colorScheme.keywordColors[0];
            }
            if(*s != '/')
               xmlState.tagWord = false;
         }
         else if(xmlState.inTag && word[0] != '?' && word[0] != '=' && word[0] != '/')
            newTextColor = colorScheme.preprocessorColor;
      }
      else if(xmlState.xmlComment)
      {
         newTextColor = colorScheme.commentColor;
         if(word[0] == '-' && word[1] == '-' && word[2] == '>')
         {
            *c += 3 - *wordLen;
            *wordLen = 3;
            xmlState.xmlComment = false;
         }
      }
      return newTextColor;
   }

   void FigureStartSyntaxStates(EditLine firstLine, bool reset, EditLine viewLine)
   {
      bool wasInMultiLine = reset ? false : viewLineState.wasInMultiLine;
      bool inMultiLineComment = reset ? false : viewLineState.inMultiLineComment;
      bool inString = false;
      bool inQuotes = false;
      bool inSingleLineComment = false;
      bool escaped = reset ? false : viewLineState.escaped;
      bool continuedSingleLineComment = reset ? false : viewLineState.continuedSingleLineComment;
      bool continuedString = reset ? false : viewLineState.continuedString;
      bool continuedQuotes = reset ? false : viewLineState.continuedQuotes;
      bool xmlComment = reset ? false : xmlViewState.xmlComment;
      EditLine line = firstLine;

      for(; line != viewLine; line = line.next)
      {
         const char * text = line.text;
         int c;
         char ch;
         bool lastWasStar = false;

         inSingleLineComment = continuedSingleLineComment;
         escaped = false;
         inString = continuedString;
         inQuotes = continuedQuotes;

         for(c = 0; (ch = text[c]); c++)
         {
            bool backLastWasStar = lastWasStar;
            bool backWasInMultiLine = wasInMultiLine;
            bool wasEscaped = escaped;
            escaped = false;

            lastWasStar = false;
            wasInMultiLine = inMultiLineComment;
            if(ch == '/')
            {
               if(!inSingleLineComment && !inMultiLineComment && !xmlComment && !inQuotes && !inString)
               {
                  if(cppSingle && text[c+1] == '/')
                  {
                     inSingleLineComment = true;
                  }
                  else if(cMultiLine && text[c+1] == '*')
                  {
                     inMultiLineComment = true;
                  }
               }
               else if(backLastWasStar)
                  inMultiLineComment = false;
            }
            else if(ch == '*')
            {
               if(backWasInMultiLine) lastWasStar = true;
            }
            else if(ch == '\"' && !inSingleLineComment && !inMultiLineComment && !inQuotes)
            {
               if(inString && !wasEscaped)
               {
                  inString = false;
               }
               else
               {
                  inString = true;
               }
            }
            else if(ch == '\'' && singleQuotes && !inSingleLineComment && !inMultiLineComment && !inString)
            {
               if(inQuotes && !wasEscaped)
                  inQuotes = false;
               else
               {
                  inQuotes = true;
               }
            }
            else if(ch == '\\')
            {
               if(!wasEscaped)
                  escaped = true;
            }
            else if(ch == '#' && !inQuotes && !inString && !inMultiLineComment && !inSingleLineComment)
            {
               if(hashTagComments)
                  inSingleLineComment = true;
            }

            if(!inSingleLineComment && !inMultiLineComment && !xmlComment && !inQuotes && !inString)
            {
               if(ch == '<' && text[c+1] == '!' && text[c+2] == '-' && text[c+3] == '-')
               {
                  xmlComment = true;
                  c += 3;
               }
            }
            else if(xmlComment)
            {
               if(ch == '-' && text[c+1] == '-' && text[c+2] == '>')
               {
                  xmlComment = false;
                  c += 2;
               }
            }
         }
      }

      viewLineState.continuedSingleLineComment = continuedSingleLineComment;
      viewLineState.continuedString = continuedString;
      viewLineState.continuedQuotes = continuedQuotes;
      viewLineState.inMultiLineComment = inMultiLineComment;
      viewLineState.escaped = escaped;

      xmlViewState.xmlComment = xmlComment;
   }

   bool CanImpactOtherLines(EditLine line)
   {
      const char * text = line.text;
      bool canImpact = strstr(text, "<!--") || strstr(text, "-->");
      return canImpact || SyntaxHighlighting::CanImpactOtherLines(line);
   }

   void GotSpace(bool beforeEnd)
   {
      SyntaxHighlighting::GotSpace(beforeEnd);
      xmlState.tagWord = false;
   }

   void ResetState()
   {
      SyntaxHighlighting::ResetState();
      xmlState = xmlStateBak;
   }
}

static const char * econExtensions[] = { "econ", "json", "geoecon", "geojson", "topojson", "epj", "cmss", null };
class ECONSHL : SyntaxHighlighting
{
   class_property(extensions) = econExtensions;
   keywords = [ "false", "true", "null" ];
   cppSingle = true;
   cNumbers = true;
   cMultiLine = true;
   singleQuotes = true;
}

class ConfigSHL : SyntaxHighlighting
{
   hashTagComments = true;
}

enum DiffSHLLineMode { normal, addFile, remFile, pos, add, rem };
static const char * diffExtensions[] = { "diff", "patch", null };
class DiffSHL : SyntaxHighlighting
{
   class_property(extensions) = diffExtensions;
   keywords = [ "diff", "index" ];

   Color diffColors[DiffSHLLineMode];
   DiffSHL()
   {
      diffColors[addFile] = lime;
      diffColors[remFile] = tomato;
      diffColors[add] = green;
      diffColors[rem] = crimson;
      diffColors[pos] = cyan;
   }

   DiffSHLLineMode lineMode;

   void StartLine()
   {
      currentState.firstWord = true;
      lineMode = normal;
   }

   Color Process(char * word, int * wordLen, bool beforeEndOfLine, Color defaultTextColor, const char * buffer, int * c)
   {
      Color newTextColor;

      if(currentState.firstWord)
      {
         if(word[0] == '+')
            lineMode = word[1] == '+' && word[2] == '+' ? addFile : add;
         else if(word[0] == '-')
            lineMode = word[1] == '-' && word[2] == '-' ? remFile : rem;
         else if(word[0] == '@')
            lineMode = pos;
      }
      newTextColor = lineMode ? diffColors[lineMode] : defaultTextColor;

      if(beforeEndOfLine)
      {
         int wordStart = *c - *wordLen;
         KeywordType kwType = regular;
         // TOFIX: 'keywords' did not work here
         Array<const String> keys = allKeywords[kwType];
         Array<int> len = keyLen[kwType];
         int k;
         for(k = 0; k < keys.count; k++)
         {
            if((len[k] == *wordLen && !strncmp(keys[k], word, *wordLen)) ||
                  (keys[k][0] == '.' && wordStart > 0 && *(word - 1) == '.' &&
                        len[k] == *wordLen + 1 && !strncmp(keys[k] + 1, word, *wordLen)))
            {
               newTextColor = colorScheme.keywordColors[kwType];
               break;
            }
         }
      }
      currentState.firstWord = false;
      return newTextColor;
   }
};

static const char * sqlExtensions[] = { "sql", null };
class SQLSHL : SyntaxHighlighting
{
   class_property(extensions) = sqlExtensions;
   keywords =
   [
      "ABORT","ACTION","ADD","AFTER","ALL","ALTER","ANALYZE","AND","AS","ASC","ATTACH","AUTOINCREMENT","BEFORE","BEGIN","BETWEEN","BY","CASCADE","CASE","CAST","CHECK","COLLATE",
      "COLUMN","COMMIT","CONFLICT","CONSTRAINT","CREATE","CROSS","CURRENT_DATE","CURRENT_TIME","CURRENT_TIMESTAMP","DATABASE","DEFAULT","DEFERRABLE","DEFERRED","DELETE","DESC",
      "DETACH","DISTINCT","DROP","EACH","ELSE","END","ESCAPE","EXCEPT","EXCLUSIVE","EXISTS","EXPLAIN","FAIL","FOR","FOREIGN","FROM","FULL","GLOB","GROUP","HAVING","IF","IGNORE",
      "IMMEDIATE","IN","INDEX","INDEXED","INITIALLY","INNER","INSERT","INSTEAD","INTERSECT","INTO","IS","ISNULL","JOIN","KEY","LEFT","LIKE","LIMIT","MATCH","NATURAL","NO","NOT",
      "NOTNULL","NULL","OF","OFFSET","ON","OR","ORDER","OUTER","PLAN","PRAGMA","PRIMARY","QUERY","RAISE","RECURSIVE","REFERENCES","REGEXP","REINDEX","RELEASE","RENAME","REPLACE",
      "RESTRICT","RIGHT","ROLLBACK","ROW","SAVEPOINT","SELECT","SET","TABLE","TEMP","TEMPORARY","THEN","TO","TRANSACTION","TRIGGER","UNION","UNIQUE","UPDATE","USING","VACUUM",
      "VALUES","VIEW","VIRTUAL","WHEN","WHERE","WITH","WITHOUT",
      "abort","action","add","after","all","alter","analyze","and","as","asc","attach","autoincrement","before","begin","between","by","cascade","case","cast","check","collate",
      "column","commit","conflict","constraint","create","cross","current_date","current_time","current_timestamp","database","default","deferrable","deferred","delete","desc",
      "detach","distinct","drop","each","else","end","escape","except","exclusive","exists","explain","fail","for","foreign","from","full","glob","group","having","if","ignore",
      "immediate","in","index","indexed","initially","inner","insert","instead","intersect","into","is","isnull","join","key","left","like","limit","match","natural","no","not",
      "notnull","null","of","offset","on","or","order","outer","plan","pragma","primary","query","raise","recursive","references","regexp","reindex","release","rename","replace",
      "restrict","right","rollback","row","savepoint","select","set","table","temp","temporary","then","to","transaction","trigger","union","unique","update","using","vacuum",
      "values","view","virtual","when","where","with","without"
   ];
   cppSingle = true;
   hashTagComments = true;
   cMultiLine = true;
   singleQuotes = true;
}

static subclass(SyntaxHighlighting) FindHL(Class c, const char * ext)
{
   subclass(SyntaxHighlighting) hl = null;
   if(ext)
   {
      OldLink link;
      for(link = c.derivatives.first; link; link = link.next)
      {
         const char ** extensions;
         hl = link.data;
         extensions = hl.extensions;
         if(extensions)
         {
            int c;
            for(c = 0; extensions[c] && extensions[c][0]; c++)
               if(!strcmp(extensions[c], ext))
                  return hl;
         }
         hl = FindHL(hl, ext);
         if(hl) return hl;
      }
   }
   return hl;
}

SyntaxHighlighting SHLFromFileName(const String fileName)
{
   subclass(SyntaxHighlighting) hlClass = null;
   char name[MAX_FILENAME];
   char ext[MAX_EXTENSION];
   GetLastDirectory(fileName, name);
   GetExtension(name, ext);
   if(ext[0])
      hlClass = FindHL(class(SyntaxHighlighting), ext);
   if(!hlClass && strstr(name, "Makefile") == name)
      hlClass = class(MakeSHL);
   if(!hlClass)
      hlClass = class(ConfigSHL);
   return eInstance_New(hlClass);
}
