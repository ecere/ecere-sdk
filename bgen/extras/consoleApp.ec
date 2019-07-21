
public enum ArgSwitchMapMode { strict, super, soft, convenient };

public enum ArgumentSymbol
{
   null,
   goal = 62,
   ambiguous = 63,
   about = 1,
   license,
   version,
   help,
   examples,
   ____ = 64
};

// todo
public class ArgumentSpec : struct
{
public:
   ArgumentType type;
   ArgumentModeAllow repeat;
   ArgumentSymbol group;
   byte consumes;
}

public enum ArgumentType { option, task };
public enum ArgumentModeAllow { no, once, twice, thrice, quace, many };

public enum ArgumentError
{
   null,
   unknown,
   missing,
   ambiguous,
   outOfScope,
   ____ = 64
};

//public class ConsoleApplication<class S> : Application
//public class ConsoleApplication<subclass(ArgumentSymbol) S> : Application
// templates with enum types don't seem to work so well?
// src\bgen.ec:109:25: error: unresolved identifier info; expected ArgSym
#define S int
public class ConsoleApplication : Application
{
public:
   bool addStandardSwitches;
   ArgSwitchMapMode stdSwitchesMode;
   bool addStandardSpecs;
   Map<S, Map<const String, S>> scopes { };
   Map<S, ArgumentSpec> specs { };

   addStandardSwitches = true;
   stdSwitchesMode = super;
   addStandardSpecs = true;

   virtual void onBuildArgumentOptions();
   //virtual bool onArgCustom(S symbol) { return false; }
   virtual bool onArg(const char * arg, int pos, S symbol, S scope, S prev, S error, bool raw);
   virtual bool onTask(S symbol);

   virtual void init()
   {
      if(addStandardSwitches)
      {
         bool cnvnt = stdSwitchesMode == convenient;
         ArgSwitchMapMode mode = cnvnt ? strict : stdSwitchesMode;
         addArgumentSymbol(ArgumentSymbol::about, "about", mode, 0);
         if(cnvnt)
            addArgumentSymbol(ArgumentSymbol::about, "info", mode, 0);
         addArgumentSymbol(ArgumentSymbol::about, "information", mode, 0);
         if(cnvnt)
            addArgumentSymbol(ArgumentSymbol::license, "lic", mode, 0);
         addArgumentSymbol(ArgumentSymbol::license, "license", mode, 0);
         addArgumentSymbol(ArgumentSymbol::help, "help", mode, 0);
         if(cnvnt)
            addArgumentSymbol(ArgumentSymbol::version, "ver", mode, 0);
         addArgumentSymbol(ArgumentSymbol::version, "version", mode, 0);
      }
      if(addStandardSpecs)
      {
         setArgumentSpec(ArgumentSymbol::about,   { task, once, goal });
         setArgumentSpec(ArgumentSymbol::license, { task, once, goal });
         setArgumentSpec(ArgumentSymbol::help,    { task, once, goal });
         setArgumentSpec(ArgumentSymbol::version, { task, once, goal });
      }
      onBuildArgumentOptions();
   }

   // TODO!!
   void parseArgs()
   {
      const char * idnt = " ";
      S task = 0;
      //Language lang = null;
      ArgumentError error = null;
      ArgumentError argError = null;
      if(argc > 1)
      {
         int c;
         S sym = 0;
         S prev = 0;
         S scope = 0;
         for(c = 1; c < argc; c++)
         {
            ArgumentError err = null;
            const char * arg = argv[c];
            prev = sym;
            sym = 0;
            if(!onArg(arg, c, 0, scope, prev, error, true))
            {
               if(*arg == '-') { arg++; if(*arg == '-') { arg++; if(*arg == '-') arg++; } }
               sym = (S)getSwitchSymbol(arg, scope);
               onArg(arg, c, sym, scope, prev, error, false);
               switch(sym)
               {
                  /*case C:
                  case CPlusPlus:
                  case CSharp:
                  case Java:
                  case Python:
                     if(!lang)
                        lang = (Language)sym;
                     else
                        err = langTwice;
                     break;*/
                  case ArgumentSymbol::about:
                  case ArgumentSymbol::help:
                  case ArgumentSymbol::examples:
                  case ArgumentSymbol::license:
                  case ArgumentSymbol::version:
                  /*case library:
                     if(!task)
                        task = sym;
                     else
                        err = taskTwice;
                     if(sym == library)
                        scope = library;
                     break;
                  case string:
                  case map:
                  case tell:
                  case directory:
                     if(scope != library)
                     {
                        err = outOfScope;
                        PrintLn($"Error: argument ", sym, " (", arg, ") is out of scope. 'library <name>' must be specified first");
                     }
                     break;*/
                  case ArgumentSymbol::ambiguous:
                     err = ambiguous;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is ambiguous.");
                     break;
                  case 0:
                     err = unknown;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is unknown.");
                     break;
                  //default: conmsg("check"); break;
               }
               switch(err)
               {
                  case null:
                     break;
                  /*case taskTwice:
                  case langTwice:
                     if(!error) error = err;
                     break;*/
                  case ambiguous:
                  case outOfScope:
                  case unknown:
                     if(!argError) argError = err;
                     break;
                  //default: conmsg("check"); break;
               }
            }
            //if(c + 1 == argc && (sym == library || sym == directory || sym == string || sym == map || sym == tell))
            {
               if(!error) error = missing;
               PrintLn($"Error: argument for ", sym, " (", arg, ") is missing.");
               /*if(sym == library)
                  ;
               else if(sym == directory)
                  ;
               else if(sym == string)
                  ;
               else if(sym == map)
                  ;
               else if(sym == tell)
                  ;*/
            }
         }
      }
      if(task == 0 || error || argError)
      {
         if(task == 0)
            PrintLn($"Error: please specify task.");
         /*else if(error == taskTwice)
            PrintLn($"Error: you can only specify one task at a time.");
         else if(error == langTwice)
            PrintLn($"Error: you can only specify one target language at a time.");*/
         else if(!argError && error != missing)
            PrintLn($"Error: ", error);
         idnt = "  ";
         PrintLn(idnt, $"use 'bgen help', 'bgen examples' or 'bgen about' for more information.");
      }
      /*else if(task == library)
      {
         if(moduleName) isEcereCOM = !strcmp(moduleName, "ecereCOM");
         if(argLibrary && (!moduleName || !bindingName || !defineName))
         {
            char *s, str[MAX_LOCATION] = "";
            GetLastDirectory(argLibrary, str);
            StripExtension(str);
            if(!moduleName)
            {
               moduleName = CopyString(str);
               isEcereCOM = !strcmp(moduleName, "ecereCOM");
            }
            if(!bindingName)
               bindingName = isEcereCOM ? CopyString("eC") : CopyString(moduleName);
            if(!defineName)
            {
               defineName = CopyString(bindingName);
               for(s = defineName; *s; s++)
                  *s = (char)toupper(*s);
            }
         }
         if(argLibrary)
         {
            Gen bgen = null;
            if(!lang)
               lang = C;
            // todo: validate argLibrary?
            switch(lang)
            {
               case C:
                  bgen = CGen { moduleName, bindingName, defineName, isEcereCOM };
                  break;
               case CPlusPlus:
                  bgen = CPPGen { moduleName, bindingName, defineName, isEcereCOM };
                  break;
               case CSharp:
                  bgen = CSharpGen { moduleName, bindingName, defineName, isEcereCOM };
                  break;
               case Java:
                  bgen = JavaGen { moduleName, bindingName, defineName, isEcereCOM };
                  break;
               case Python:
                  bgen = PythonGen { moduleName, bindingName, defineName, isEcereCOM };
                  break;
               default: conmsg("check"); break;
            }
            if(bgen && bgen.init())
               bgen.generate();
            delete bgen;
         }
      }*/

      if(task == ArgumentSymbol::about)
      {
         PrintLn("Language Binding Generator for eC Libraries (bgen)");
         PrintLn("Copyright (C) 2016 Ecere Corporation");
         PrintLn("This software is distributed under a BSD 3-Clause (Revised) license.");
      }
      else if(task == ArgumentSymbol::license)
         PrintLn("BSD 3-Clause (Revised)");
      else if(task == ArgumentSymbol::version)
         PrintLn("0.1 alpha");
      else if(task == ArgumentSymbol::examples)
         PrintLn($"Examples:");
      else if(task == ArgumentSymbol::help)
         PrintLn($"Syntax:");
   }

   void Main()
   {
      init();
      parseArgs();
      // todo
   }

   S getSwitchSymbol(const char * string, S scope)
   {
      S sym = 0;
      Map<const String, S> switches = scopes[scope];
      if(switches)
      {
         MapIterator<const String, S> i { map = switches };
         if(i.Index(string, false))
            sym = i.data;
      }
      return sym;
   }

   void printAllSymbolMatches(S scope)
   {
      Map<const String, S> switches = scopes[scope];
      if(switches)
      {
         MapIterator<const String, S> i { map = switches };
         while(i.Next())
         {
            PrintLn(i.data, " <- ", i.key);
         }
         PrintLn("count: ", switches.count);
      }
   }

   void addArgumentSwitch(S symbol, const char * string, ArgSwitchMapMode mode, S scope)
   {
      MapIterator<S, Map<const String, S>> s { map = scopes };
      if(!s.Index(scope, true))
         s.data = Map<const String, S> { };
      //if(s.data)
      {
         Map<const String, S> switches = s.data;
         MapIterator<const String, S> i { map = switches };
         if(i.Index(string, true))
         {
            if(mode != soft)
               i.data = (S)ArgumentSymbol::ambiguous;
         }
         else
            i.data = symbol;
      }
   }

   void addArgumentSymbol(S symbol, const char * name, ArgSwitchMapMode mode, S scope)
   {
      if(mode == strict)
         addArgumentSwitch(symbol, name, mode, scope);
      else if(mode == super || mode == soft)
      {
         char * s, * copy = CopyString(name);
         char * buffer = new char[strlen(name) + 1];
         if(strstr(copy, "-"))
         {
            Array<String> parts { };
            Array<int> lens { };
            Array<int> pos { };
            int count = 0;
            //addArgumentSwitch(symbol, copy, mode, scope);
            for(s = copy; s; s = strstr(s, "-"))
            {
               if(*s == '-')
                  *s++ = 0;
               parts.Add(s);
            }
            for(p : parts)
            {
               int l = strlen(p);
               lens.Add(l);
               pos.Add(l);
            }
            while(true)
            {
               int n;
               char * o = buffer;
               for(n = 0; n < parts.count; n++)
               {
                  int l = pos[n];
                  strncpy(o, parts[n], l);
                  o += l;
               }
               *o++ = 0;
               //PrintLn(buffer);
               count++;
               addArgumentSwitch(symbol, buffer, mode, scope);
               o = buffer;
               for(n = 0; n < parts.count; n++)
               {
                  int l = pos[n];
                  strncpy(o, parts[n], l);
                  o += l;
                  if(n < parts.count - 1)
                     *o++ = '-';
               }
               *o++ = 0;
               count++;
               addArgumentSwitch(symbol, buffer, mode, scope);
               for(n = parts.count - 1; n >= 0; n--)
               {
                  int p = pos[n];
                  pos[n] = p - 1;
                  if(p != 1) break;
               }
               if(pos[0] == 0) break;
               for(n = 0; n < parts.count; n++)
               {
                  if(pos[n] == 0)
                     pos[n] = lens[n];
               }
            }
            delete parts;
            delete lens;
            delete pos;
         }
         else
         {
            for(s = copy + strlen(copy) - 1; *copy; s--)
            {
               addArgumentSwitch(symbol, copy, mode, scope);
               *s = 0;
            }
         }
      }
   }

   void setArgumentSpec(S symbol, ArgumentSpec spec)
   {
      MapIterator<S, ArgumentSpec> i { map = specs };
      i.Index(symbol, true);
      i.data = spec;
   }
}
