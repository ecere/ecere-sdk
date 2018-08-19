#include "debug.eh"

import "ecere"

import "debug"

import "consoleApp"
import "ecom"
import "stringTools"

import "DynamicString"
import "miscTypes"

import "econe"
import "ectwo"
import "str"
import "tmp"
import "out"
import "gen"

import "genC"
import "genCPP"
import "genCSharp"
import "genJava"
import "genPython"

const char ln = '\n';
const char * sln = "\n";

ConsoleFile console { };
//define app = (ConsoleApplication)__thisModule.application;

enum ArgSym : ArgumentSymbol
{
   quiet,
   blackList,
   forceList,
   language,
   bind,
   clearAll,
   clearLanguages,
   clearLibraries,
   clearMatrix,
   string,
   map,
   //tell,
   directory,
   enumPrefix,
   funcRename,
   _1024 = 1024,
   C,
   CPlusPlus,
   CSharp,
   Java,
   Python,
   _,
   bypassMacros,
   __;

   property bool valid { get { return !(this == ambiguous || this == null); } }
};

enum ArgErr : ArgumentError
{
   taskTwice,
   langTwice,
   mustSpecifyLib,
   noLibSpecifiedInRunBeforeClear,
   _
};

ApplicationData ad { };
class ApplicationData
{
   AVLTree<String> allSpecs { };

   void printAllSpecs()
   {
      AVLNode<String> node;
      PrintLn("allSpecs(", allSpecs.count, ")");
      for(node = allSpecs.root.minimum; node; node = node.next)
      {
         PrintLn(node.key);
      }
   }

   ~ApplicationData()
   {
      allSpecs.Free();
      if(allSpecs.GetCount()) conmsg("check");
      //allSpecs.RemoveAll();
   }
}

class LangLib : struct
{
public:
   Language lang;
   String lib;
private:
   int OnCompare(LangLib o)
   {
      if(o.lang > lang)
         return 1;
      else if(o.lang < lang)
         return -1;
      return strcmp(o.lib, lib);
   }
}

class RunLangLib : struct
{
public:
   int run;
   Language lang;
   String lib;
private:
   int OnCompare(RunLangLib o)
   {
      if(o.run > run || (o.run == run && o.lang > lang))
         return 1;
      else if(o.run < run || (o.run == run && o.lang < lang))
         return -1;
      return strcmp(o.lib, lib);
   }
}

class BGenOptions
{
public:
   property Array<BGenRunOptions> runs { get { return runs; } set { delete runs; runs = value; } };

private:
   Array<BGenRunOptions> runs { };
   void write(const String path)
   {
      File f = FileOpen(path, write);
      if(f)
      {
         WriteECONObject(f, class(BGenOptions), this, 0);
         delete f;
#if 0
         {
            File f = FileOpen(path, read);
            if(f)
            {
               ECONParser parser { f = f };
               JSONResult jsonResult;
               BGenOptions testLoad;
               jsonResult = parser.GetObject(class(BGenOptions), &testLoad);
               if(jsonResult == success)
                  ; // ok, nothing to do
               else
                  conmsg("error: failed to load library options file!");
               delete f;
               {
                  String p2 = PrintString("writeLoadWriteTest-", path);
                  File f = FileOpen(p2, write);
                  if(f)
                  {
                     WriteECONObject(f, class(BGenOptions), testLoad, 0);
                     delete f;
                  }
                  delete p2;
               }
            }
         }
#endif // 0
      }
   }
}

enum ClearFlag
{
   all, languages, libraries, matrix;

   ClearFlag ::fromArgSym(ArgSym sym)
   {
      switch(sym)
      {
         case clearAll:       return all;
         case clearLanguages: return languages;
         case clearLibraries: return libraries;
         case clearMatrix:    return matrix;
         default: conmsg("unreachable"); break;
      }
      return all;
   }
};

class BGenRunOptions
{
public:
   property ClearFlag clear { get { return clear; } set { clear = value; } isset { return clear != all; } };
   property GenOptions global { get { return global; } set { delete global; global = value; } isset { return global && !global.isEmpty; } };
   Array<Language> languages;
   Array<String> libraries;
   property Map<Language, GenOptions> languageOptions { get { return languageOptions; } set { delete languageOptions; languageOptions = value; } isset { return languageOptions && languageOptions.count; } };
   property Map<String, GenOptions> libraryOptions { get { return libraryOptions; } set { delete libraryOptions; libraryOptions = value; } isset { return libraryOptions && libraryOptions.count; } };
   property Map<LangLib, GenOptions> specificOptions { get { return specificOptions; } set { delete specificOptions; specificOptions = value; } isset { return specificOptions && specificOptions.count; } };

private:
   // data:
   ClearFlag clear;
   GenOptions global;
   AVLTree<Language> _languages;
   AVLTree<String> _libraries;
   Map<Language, GenOptions> languageOptions;
   Map<String, GenOptions> libraryOptions;
   Map<LangLib, GenOptions> specificOptions;
   // state:
   Language lang;
   String lib;
   bool liblang;

   void addLanguage(Language language)
   {
      lang = language;
      if(lib) liblang = true;
      if(!languages) languages = { };
      if(!_languages) _languages = { };
      if(!_languages.Find(language))
         languages.Add(language);
   }

   void addLibrary(const String library)
   {
      String str = CopyString(library);
      lib = str;
      if(liblang)
         PrintLn("warning: lib after liblang: ", library);
      if(!libraries) libraries = { };
      if(!_libraries) _libraries = { };
      if(!_libraries.Find(str))
         libraries.Add(str);
   }

   property GenOptions scope
   {
      get
      {
         if(liblang) return getLibLangOptions(lang, lib, true);
         if(lib) return getLibraryOptions(lib, true);
         if(lang) return getLangOptions(lang, true);
         if(!global) global = { };
         return global;
      }
   }

   GenOptions getLangOptions(Language lang, bool create)
   {
      GenOptions options = null;
      if(!languageOptions && create) languageOptions = { };
      if(languageOptions)
      {
         MapIterator<Language, GenOptions> i { map = languageOptions };
         if(i.Index(lang, true)) options = i.data;
         else if(create) options = { }, i.data = options;
      }
      return options;
   }

   GenOptions getLibraryOptions(const String library, bool create)
   {
      GenOptions options = null;
      if(!libraryOptions && create) libraryOptions = { };
      if(libraryOptions)
      {
         MapIterator<String, GenOptions> i { map = libraryOptions };
         if(i.Index(library, true)) options = i.data;
         else if(create) options = { }, i.data = options;
      }
      return options;
   }

   GenOptions getLibLangOptions(Language lang, const String library, bool create)
   {
      GenOptions options = null;
      if(!specificOptions && create) specificOptions = { };
      if(specificOptions)
      {
         MapIterator<String, GenOptions> i { map = specificOptions };
         String liblang = PrintString(lang, "@", library); // maybe todo: consider using LangLib as key
         if(i.Index(liblang, true)) options = i.data;
         else if(create) options = { }, i.data = options;
         delete liblang;
      }
      return options;
   }

   ~BGenRunOptions()
   {
      if(libraries) libraries.Free();
      delete libraries;
      delete _libraries;
      delete languages;
      delete _languages;
      if(languageOptions) languageOptions.Free();
      delete languageOptions;
      if(libraryOptions) libraryOptions.Free();
      delete libraryOptions;
      if(specificOptions) specificOptions.Free();
      delete specificOptions;
   }
}

class BGenRunData
{
public:
   RunLangLib run;
   GenOptions options;
}

class BGenMatrix
{
public:
   Array<BGenRunData> appliedOptions { };
private:
   void write(const String path)
   {
      File f = FileOpen(path, write);
      if(f)
      {
         WriteECONObject(f, class(BGenMatrix), this, 0);
         delete f;
      }
   }
}

public class BGen : ConsoleApplication // <ArgSym>
{
   bool forAll;
   const char * idnt;
   int targetBits;
   idnt = " ";
   ArgSym task;
   ArgErr error;
   ArgErr argError;
   Gen gen;
   GenOptions options;
   GenOptions optionsForAll;
   List<Gen> gens { };
   List<Gen> addGens { };
   BGenRunOptions opts;
   BGenOptions bgenopts { };
   BGenMatrix matrix { };

   void onBuildArgumentOptions()
   {
      addArgumentSymbol(ArgSym::quiet,          "quiet",                super,   0);
      addArgumentSymbol(ArgSym::blackList,      "black-list",           super,   0);
      addArgumentSymbol(ArgSym::forceList,      "force-list",           super,   0);
      addArgumentSymbol(ArgSym::examples,       "examples",             super,   0);
      addArgumentSymbol(ArgSym::C,              "c",                    strict,  0);
      addArgumentSymbol(ArgSym::C,              "c89",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,              "c90",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,              "c95",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,              "c99",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,              "c11",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "c++",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cxx",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cpp",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cplusplus",            strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "c#",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "cs",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "csharp",               strict,  0);
      addArgumentSymbol(ArgSym::Java,           "java",                 strict,  0);
      addArgumentSymbol(ArgSym::Python,         "py",                   strict,  0);
      addArgumentSymbol(ArgSym::Python,         "python",               strict,  0);
      addArgumentSymbol(ArgSym::bypassMacros,   "bypass-macros",        super,   0);
      addArgumentSymbol(ArgSym::clearAll,       "clear-all",            super,   0);
      addArgumentSymbol(ArgSym::clearLanguages, "clear-languages",      super,   0);
      addArgumentSymbol(ArgSym::clearLibraries, "clear-libraries",      super,   0);
      addArgumentSymbol(ArgSym::clearMatrix,    "clear-matrix",         super,   0);
      addArgumentSymbol(ArgSym::string,         "string",               super,   0);
      addArgumentSymbol(ArgSym::enumPrefix,     "enumeration-prefix",   super,   ArgSym::string);
      addArgumentSymbol(ArgSym::map,            "map",                  super,   0);
      addArgumentSymbol(ArgSym::funcRename,     "function-rename",      super,   ArgSym::map);
      //addArgumentSymbol(ArgSym::tell,           "tell",                 super,   0);
      addArgumentSymbol(ArgSym::directory,      "output",               super,   0);
      addArgumentSymbol(ArgSym::directory,      "directory",            super,   0);

      /*
      PrintLn("------------------------------------------------------------------------------------------");
      PrintLn("------------------------------------------------------------------------------------------");
      printAllSymbolMatches(0);
      PrintLn("------------------------------------------------------------------------------------------");
      PrintLn("------------------------------------------------------------------------------------------");
      printAllSymbolMatches(ArgSym::string);
      PrintLn("------------------------------------------------------------------------------------------");
      PrintLn("------------------------------------------------------------------------------------------");
      printAllSymbolMatches(ArgSym::map);
      */

      setArgumentSpec(ArgSym::quiet,         { option, many });
      setArgumentSpec(ArgSym::blackList,     { option, many });
      setArgumentSpec(ArgSym::forceList,     { option, many });
      setArgumentSpec(ArgSym::examples,      { task, once, goal });
      setArgumentSpec(ArgSym::C,             { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CPlusPlus,     { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CSharp,        { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Java,          { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Python,        { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::bypassMacros,  { option, many });
      setArgumentSpec(ArgSym::string,        { option, many });
      setArgumentSpec(ArgSym::map,           { option, many });
      //setArgumentSpec(ArgSym::tell,          { option, many });
      setArgumentSpec(ArgSym::directory,     { option, once });
   }

   void init()
   {
      ConsoleApplication::init();

      // reserved or keywords or whatnot
      enumValueNames.Add((char*)"null");
      enumValueNames.Add((char*)"true");
      enumValueNames.Add((char*)"false");
      enumValueNames.Add((char*)"rewind");
      enumValueNames.Add((char*)"open");
      enumValueNames.Add((char*)"close");
      enumValueNames.Add((char*)"read");
      enumValueNames.Add((char*)"write");
      enumValueNames.Add((char*)"tan");
      enumValueNames.Add((char*)"round");
      enumValueNames.Add((char*)"abort");

      // CharCategory vs Pi
      enumValueNames.Add((char*)"Pi");

      // Alignment
      enumValueNames.Add((char*)"left");
      enumValueNames.Add((char*)"right");
      enumValueNames.Add((char*)"center");

      // some ec1 app init:
      targetBits = GetHostBits();
      SetTargetBits(targetBits);
      SetBGenSymbolSwapCallback(bgenSymbolSwap);

      // local init
      bgenopts.runs.Add((opts = { }));
   }

   bool argsError()
   {
      if(error || argError)
      {
         task = help;
         return true;
      }
      return false;
   }

   void Main()
   {
      init();
      parseArgs();
      //bgenopts.write("options.bgen.econ");
      if(argsError())
         failOutput();
      else if(task == bind)
      {
         buildMatrix();
         //matrix.write("matrix.bgen.econ");
         execute();
      }
      onTask(task);
      //ad.printAllSpecs();

#if 0
      if(libs.count == 0)
      {
         if(gens.count == 0)
            error = mustSpecifyLib;
         //else
         //   error = unspecifiedAdditionalLib;
      }
#endif // 0
#if 0
      if(error || argError) task = help;
      else if(task == bind)
         ;//generateGens();
      //else if(task == tell); // todo
#endif // 0

      /*if(def.funcRename)
      {
         MapIterator<String, String> i { map = def.funcRename };
         PrintLn("---------------------");
         while(i.Next())
         {
            PrintLn(i.key, " -> ", i.data);
         }
         PrintLn("---------------------");
      }*/

      // command-line options to select
      //
      //  - <input library>     // path/to/ecereCOM.dll or .so or just ecereCOM.dll or .so or just ecereCOM
      //     - [binding name]   // same as name part of input library if not specified (ecereCOM)
      //     - [define prefix]  // all uppercase version of binding name if not specified (ECERECOM)
      //  - [target language] (defaults to C) caseInsensitive(c|c89|cpp|c++|c#|csharp|java|python|py)
      //  - [output directory] (default to current)
      //  - generating (mangling) options
      //     - global prefix
      //     - name spaces
      //     - context-sensitive enumerations prefixes
      //  - ? other useful options ?
   }

   void failOutput()
   {
      if(error == mustSpecifyLib)
         PrintLn($"Error: at least one library must be specified for bgen to generate bindings.");
      else if(error == noLibSpecifiedInRunBeforeClear)
         PrintLn($"Error: at least one library must be specified before the 'reset' switch.");
      //else if(error == unspecifiedAdditionalLib)
      //   PrintLn($"Error: although some library(ies) have been specified, no additional library(ies) have been specified after the 'reset' switch.");
      else if(error == taskTwice)
         PrintLn($"Error: you can only specify one task at a time.");
      else if(error == langTwice)
         PrintLn($"Error: you can only specify one target language at a time.");
      else if(!argError && error != missing)
         PrintLn($"Error: ", error);
      PrintLn($"Please follow appropriate syntax.");
      PrintLn("");
      idnt = "  ";
   }

   void parseArgs()
   {
      int c;
      ArgSym sym = null;
      ArgSym expect = null;
      Array<String> libs;
      for(c = 1; c < argc; c++)
      {
         ArgErr err = null;
         const char * arg = argv[c];
         const char * str = arg;
         if(*str == '-') { str++; if(*str == '-') { str++; if(*str == '-') str++; } }
         sym = (ArgSym)getSwitchSymbol(str, expect);
         if(sym.valid && sym > ArgSym::_1024 && sym < ArgSym::_)
            expect = language;
         switch(expect)
         {
            case null:
            {
               switch(sym)
               {
                  case quiet:
                     opts.scope.quiet = true;
                     break;
                  case blackList:
                     opts.scope.blackList = yes;
                     break;
                  case forceList:
                     opts.scope.blackList = force;
                     break;
                  case bypassMacros:
                     opts.scope.bypassMacros = true;
                     break;
                  case about:
                  case help:
                  case examples:
                  case license:
                  case version:
                     if(!task)
                        task = sym;
                     else if(sym != bind)
                        err = taskTwice;
                     break;
                  case clearAll:
                  case clearLanguages:
                  case clearLibraries:
                  case clearMatrix:
                     if(libs && libs.count)
                     {
                        addRun();
                        opts.clear = ClearFlag::fromArgSym(sym);
                        if(sym != clearLanguages)
                           libs = null;
                     }
                     else
                        error = noLibSpecifiedInRunBeforeClear;
                     break;
                  case string:
                  case map:
                  case directory:
                     expect = sym;
                     break;
                  //case tell:
                  //   break;
                  case ambiguous:
                     err = ambiguous;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is ambiguous."); // todo: fix i18n
                     break;
                  case null: // maybe todo: some library names might conflict with switch matching. find a way to favor library over flag?
                     if(!task || task == bind)
                     {
                        task = bind;
                        opts.addLibrary(arg);
                        if(!libs)
                           libs = opts.libraries;
                     }
                     else
                        PrintLn($"Warning: argument ", arg, " is ignored."); // todo: fix i18n
                     //err = unknown;
                     //PrintLn($"Error: argument ", sym, " (", arg, ") is unknown."); // todo: fix i18n
                     break;
                  default: conmsg("unreachable"); break;
               }
               break;
            }
            case map:
               err = parseMapArgument(arg, opts.scope);
               expect = null;
               break;
            case language:
               switch(sym)
               {
                  case C:
                  case CPlusPlus:
                  case CSharp:
                  case Java:
                  case Python:
                     opts.addLanguage((Language)sym);
                     break;
                  default:
                     err = unknown;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is not a know language."); // todo: fix i18n
                     break;
               }
               expect = null;
               break;
            case directory:
            {
               GenOptions o = opts.scope;
               const String dir = o.dir = arg;
               if(opts.lang == C)
               {
                  if(!opts.global) opts.global = { };
                  opts.global.cpath = dir;
               }
               expect = null;
               break;
            }
            case string:
               conmsg("untested");
               sym = (ArgSym)getSwitchSymbol(arg, expect);
               expect = null;
               break;
            /*case tell:
               conmsg("task 'tell' isn't implemented yet. (todo)");
               expect = null;
               break;*/
            default: conmsg("unreachable"); break;
         }
         switch(err)
         {
            case null:
               break;
            case taskTwice:
            case langTwice:
               if(!error) error = err;
               break;
            case ambiguous:
            case outOfScope:
            case unknown:
               if(!argError) argError = err;
               break;
            default: conmsg("unreachable"); break;
         }
         if(c + 1 == argc && expect != null) //(sym == directory || sym == string || sym == map || sym == tell))
         {
            if(!error) error = missing;
            PrintLn($"Error: argument for ", expect, " (", arg, ") is missing."); // todo: fix i18n
            /*if(sym == directory);
            else if(sym == string);
            else if(sym == map);
            else if(sym == tell);*/
         }
      }
   }

   ArgErr parseMapArgument(const char * arg, GenOptions options)
   {
      char * copy = CopyString(arg);
      char * type = copy;
      char * next = strchr(copy, ',');
      ArgSym sym;
      ArgErr err = null;
      if(next) *next = 0;
      sym = (ArgSym)getSwitchSymbol(type, ArgSym::map);
      if(sym == ArgSym::funcRename)
      {
         Map<String, String> m = null;
         if(!options.funcRename) options.funcRename = { };
         m = options.funcRename;
         if(m)
         {
            while(next)
            {
               char * item = next + 1;
               next = strchr(item, ',');
               if(next) *next = 0;
               if(*item)
               {
                  char * val = strchr(item, '=');
                  if(val)
                  {
                     MapIterator<String, String> i { map = m };
                     *val = 0;
                     if(!i.Index(item, true))
                        i.data = CopyString(++val);
                     else
                        PrintLn($"Warning: map key '", item, "' is already specified!"); // todo: fix i18n
                  }
                  else
                     PrintLn($"Warning: map item '", item, "' is missing equal sign and will be ignored!"); // todo: fix i18n
               }
            }
         }
      }
      else
      {
         err = unknown;
         PrintLn($"Error: argument ", sym, " (", type, ") is not a know symbol mapping."); // todo: fix i18n
      }
      delete copy;
      return err;
   }

   BGenRunOptions addRun()
   {
      BGenRunOptions runOpts { };
      opts = runOpts;
      bgenopts.runs.Add(runOpts);
      return runOpts;
   }

   void buildMatrix()
   {
      int rn = 0;
      BGenRunOptions prev = null;
      GenOptions glbOpts = null;
      Array<Language> lngs { };
      Array<String> libs { };
      Array<Map<Language, GenOptions>> lngMapOpts { };
      Array<Map<String, GenOptions>> libMapOpts { };
      for(r : bgenopts.runs)
      {
         BGenRunOptions run = r;
         rn++;
         if(run.clear == all)
         {
            glbOpts = run.global;
            lngs.RemoveAll();
            libs.RemoveAll();
            lngMapOpts.RemoveAll();
            libMapOpts.RemoveAll();
         }
         else if(run.clear == languages)
         {
            lngs.RemoveAll();
            if(prev && prev.libraryOptions && prev.libraryOptions.count)
               libMapOpts.Add(prev.libraryOptions);
         }
         else if(run.clear == libraries)
         {
            libs.RemoveAll();
            if(prev && prev.languageOptions && prev.languageOptions.count)
               lngMapOpts.Add(prev.languageOptions);
         }
         else if(run.clear == matrix)
         {
            lngs.RemoveAll();
            libs.RemoveAll();
         }
         if(run.languages)
         {
            for(lang : run.languages)
               lngs.Add(lang);
         }
         if(run.libraries)
         {
            for(lib : run.libraries)
               libs.Add(lib);
         }
         /*{
            if(lngs.count == 0)
               conmsg("todo: some error in run ", rn); // should we do c automatically?
            if(libs.count == 0)
               conmsg("todo: some error in run ", rn); //error = mustSpecifyLib;
         }*/
         for(g : lngs)
         {
            Language lang = g;
            for(lib : libs)
            {
               RunLangLib key { rn, lang, lib };
               GenOptions langOpts = run.getLangOptions(lang, false);
               GenOptions libOpts = run.getLibraryOptions(lib, false);
               GenOptions liblangOpts = run.getLibLangOptions(lang, lib, false);
               GenOptions opts { };
               matrix.appliedOptions.Add({ key, opts });
               if(glbOpts) opts.merge(glbOpts);
               if(langOpts) opts.merge(langOpts);
               if(libOpts) opts.merge(libOpts);
               if(liblangOpts) opts.merge(liblangOpts);
               addGen(lang, lib, opts);
            }
         }
         prev = run;
      }
      delete lngs;
      delete libs;
   }

   Gen addGen(Language lang, const String lib, GenOptions opts)
   {
      Gen gen = null;
      python = false; // todo
      switch(lang)
      {
         case C:           gen = CGen { };      break;
         case CPlusPlus:   gen = CPPGen { };    break;
         case CSharp:      gen = CSharpGen { }; break;
         case Java:        gen = JavaGen { };   break;
         case Python:
            python = true; // todo
                           gen = PythonGen { }; break;
         default: conmsg("unreachable"); break;
      }
      gen.lib = createLibrary(lib);
      //if(false/*readOptionsFiles*/)
      {
         GenOptions fileOpts;
         fileOpts = gen.lib.readOptionsFile();
         if(fileOpts)
            opts.merge(fileOpts);
      }
      gen.options = opts;
      gen.dir = opts.copyDirPath();
      gens.Add(gen);
      return gen;
   }

   void execute()
   {
      for(gen : gens)
      {
         Gen g = this.gen = gen;
         g_ = (CGen)g; // maybe todo: remove global, favor parameter
         python = (gen.lang == Python), py = false; // todo: fix this, python should not pollute c or globals
         if(g.lib.name)
         {
            if(g.init())
            {
               g.outLists(g.options);
               g.process();
               g.generate();
               if(g.lib.verbose)
                  g.printOutputFiles();
            }
            g.reset();
            delete g;
         }
      }
   }

   //bool onArgCustom(int symbol) { return true; }
   //bool onArg(const char * arg, int pos, S symbol, S scope, S prev, E error, bool raw)
   //bool onArg(const char * arg, int pos, int symbol, int scope, int prev, int error, bool raw)
   //bool onArg(const char * arg, int pos, ArgSym symbol, ArgSym scope, ArgSym prev, ArgErr error, bool raw)

   bool onTask(int symbol)
   {
      ArgSym task = (ArgSym)symbol;
      if(task == about)
      {
         PrintLn("Language Binding Generator for eC Libraries (bgen)");
         PrintLn("Copyright (C) 2016-2018 Ecere Corporation");
         PrintLn("This software is distributed under a BSD 3-Clause (Revised) license.");
         return true;
      }
      else if(task == license)
      {
         PrintLn("BSD 3-Clause (Revised)");
         return true;
      }
      else if(task == version)
      {
         PrintLn("0.1 alpha");
         return true;
      }
      else if(task == examples)
      {
         idnt = "  ";
         PrintLn($"Examples:");
         PrintLn(idnt, $"'bgen \"C:\\Program Files\\Ecere\\bin\\ecere.dll\"'");
         PrintLn(idnt, $"'bgen ecereCOM'");
         PrintLn(idnt, $"'bgen ecere'");
         PrintLn(idnt, $"'bgen /usr/lib/libecere.so'");
         return true;
      }
      else if(task == help)
      {
         Print(
        $"   Syntax:\n"
         "     'bgen about'\n"
         "     'bgen help'\n"
         "     'bgen examples'\n"
         "     'bgen version'\n"
         "     'bgen <library> [language-and-options]*'\n"
         "     'bgen [global options] [<global-language> [language-specific global options]]* [<library> [options for all languages of that library] [<language> [options specific for that library/language]]*]+'\n"
         "     'bgen <output group> [reset <output group> [global options]]*'\n"
         "\n"
         "         <output group>: [common options] [language options] <library selection> [library-language options]'\n"
         "\n"
         "     'bgen [common options] [language options] <library selection> [library-language options]'\n"
         "\n"
         "         note: all means within the current output group\n"
         "\n"
         "         common options: [options]\n"
         "                         common options used for all libraries and languages combinations\n"
         "\n"
         "         language options: <language> [language options]\n"
         "                           language specific options used for all libraries\n"
         "\n"
         "         library selection: <library> [library options] [library selection]*\n"
         "                            \n"
         "\n"
         "         library options: [options]\n"
         "                          library specific options used with all languages\n"
         "\n"
         "         library: library for which bindings will be generated\n"
         "                  examples: foo, foo.dll, libfoo.so, C:\\path\\to\\foo.dll, /path/to/libfoo.so\n"
         "\n"
         "         [language-and-options]: <target-language> [options]\n"
         "            where language (case insentitive) is one of:\n"
         "            (default) C      (c, c89)\n"
         "                      C++    (cpp, cxx, cplusplus, c++)\n"
         "                      C#     (c#, cs, csharp)\n"
         "                      Java   (java)\n"
         "                      Python (py, python)\n"
         "\n"
         "            Available options:\n"
         "               output|directory <directory>        Specify output directory\n"
         "                     (otherwise default to the current directory)\n"
         "\n"
         "               string <stringtype> <string>        Set a string setting\n"
         "                        where stringtype is one of:\n"
         "                           enumeration-prefix\n"
         "\n"
         "               map <maptype> [<key>=<value>] .     Set a map setting\n"
         "                        where maptype is one of:\n"
         "                           function-rename\n"
         "\n"
         //"               tell <telltype>                     Tell you something\n"
         //"                        where telltype is something\n"
         //"\n"
         "               quiet                               Force bgen to execute silently\n"
         "               blackList                           Output api black list for each library only if file doesn't exist\n"
         "               forceList                           Output api black list for each library overriding existing file\n"
         "               bypassMacros                        Bypass macros option (used by bgen/cpp)\n"
         "\n"
         "   Additional Information:\n"
         "     all switches are case insensitive\n"
         "     use of - or -- is optional for all switches\n"
         "     all non-ambiguous truncated shorthand are accepted for all switches\n"
         );

#if 0
         PrintLn(idnt, $"for examples the help switch can be specified in any of these ways");
         PrintLn(idnt, $"    'bgen -h' or 'bgen --he' or 'bgen --help' or 'bgen h' or 'bgen he' or 'bgen hel' or 'bgen help'");
         PrintLn(idnt, $"    'bgen -H' or 'bgen --HE' or 'bgen --HeLP' or 'bgen H' or 'bgen hE' or 'bgen hEl' or 'bgen Help'");
#endif // 0
         return true;
      }
      return false;
   }

   BGen()
   {
#ifdef _DEBUG
      dbglog_open(true);
#endif
   }

   ~BGen()
   {
      gens.RemoveAll();
#ifdef _DEBUG
      dbglog_close();
#endif
   }
}

define app = ((BGen)__thisModule);
CGen g_; // todo
bool python; // todo
bool py; // todo
