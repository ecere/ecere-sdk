define genfn = "";
define genidx = "";

define genloc__ = "";
define genspc__ = "";

define __getloc__ = "";
define __getflow__ = "";
define __getctxx__ = "";

define locprintx = "";
define locprintxln = "";
define locfprintx = "";
define locfprintxln = "";
define conmsgs = "";
define conassert = "";
define logmsgs = "";
define conmsg = "";
define conassertctx = "";
define logmsg = "";
define logmsgc = "";

#include "debug.eh"

import "ecere"

import "debug"

import "consoleApp"
import "ecom"
import "stringTools"
import "extras"

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
   //tell,
   batchFile,
   writeBatchFile,
   directory,
   pathC,
   headerOnly,
   optionsFile,
   enumPrefix,
   funcRename,
   _1024 = 1024,
   C,
   CPlusPlus,
   CSharp,
   Java,
   Python,
   _,
   genLocs,
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
   const String lib;
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
   const String lib;
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
   BGenOptions ::loadFromFile(const String path)
   {
      BGenOptions o = null;
      if(!loadFromFileECON(path, class(BGenOptions), &o))
         PrintLn($"Error: batch file ", path, " failed to load.");
      return o;
   }

   void writeToFile(const String path) { writeToFileECON(path, class(BGenOptions), this); }
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
      {
         languages.Add(language);
         _languages.Add(language);
      }
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

   property GenOptions optScope
   {
      get
      {
         if(liblang) return getLibLangOptions(lang, lib, true);
         if(lib) return getLibraryOptions(lib, true);
         if(lang) return getLangOptions(lang, true);
         return gblScope;
      }
   }

   property GenOptions libScope
   {
      get
      {
         if(lib) return getLibraryOptions(lib, true);
         return gblScope;
      }
   }

   property GenOptions gblScope
   {
      get
      {
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
         MapIterator<LangLib, GenOptions> i { map = specificOptions };
         LangLib langlib { lang, library };
         if(i.Index(langlib, true)) options = i.data;
         else if(create) options = { }, i.data = options;
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
   void writeToFile(const String path) { writeToFileECON(path, class(BGenMatrix), this); }
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
      addArgumentSymbol(ArgSym::C,              "C",                    strict,  0);
      addArgumentSymbol(ArgSym::C,              "c",                    strict,  0);
      addArgumentSymbol(ArgSym::C,              "C89",                  strict,  0);
      addArgumentSymbol(ArgSym::C,              "c89",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,            "c90",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,            "c95",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,            "c99",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,            "c11",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "C++",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "c++",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cxx",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cpp",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,      "cplusplus",            strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "C#",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "c#",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "cs",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,         "csharp",               strict,  0);
      addArgumentSymbol(ArgSym::Java,           "Java",                 strict,  0);
      addArgumentSymbol(ArgSym::Java,           "java",                 strict,  0);
      addArgumentSymbol(ArgSym::Python,         "py",                   strict,  0);
      addArgumentSymbol(ArgSym::Python,         "Python",               strict,  0);
      addArgumentSymbol(ArgSym::Python,         "python",               strict,  0);
      addArgumentSymbol(ArgSym::genLocs,        "generate-locations",   super,   0);
      addArgumentSymbol(ArgSym::bypassMacros,   "bypass-macros",        super,   0);
      addArgumentSymbol(ArgSym::clearAll,       "clear-all",            super,   0);
      addArgumentSymbol(ArgSym::clearLanguages, "clear-languages",      super,   0);
      addArgumentSymbol(ArgSym::clearLibraries, "clear-libraries",      super,   0);
      addArgumentSymbol(ArgSym::clearMatrix,    "clear-matrix",         super,   0);
      addArgumentSymbol(ArgSym::enumPrefix,     "enumeration-prefix",   super,   0);
      addArgumentSymbol(ArgSym::funcRename,     "function-rename",      super,   0);
      //addArgumentSymbol(ArgSym::tell,           "tell",                 super,   0);
      addArgumentSymbol(ArgSym::batchFile,      "batch-file",           super,   0);
      addArgumentSymbol(ArgSym::writeBatchFile, "write-batch-file",     super,   0);
      addArgumentSymbol(ArgSym::directory,      "output",               super,   0);
      addArgumentSymbol(ArgSym::directory,      "directory",            super,   0);
      addArgumentSymbol(ArgSym::pathC,          "path-c",               super,   0);
      addArgumentSymbol(ArgSym::headerOnly,     "header-only",          super,   0);
      addArgumentSymbol(ArgSym::optionsFile,    "options-file",         super,   0);
      addArgumentSymbol(ArgSym::optionsFile,    "list-file",            super,   0);
      //printAllSymbolMatches(0);

      setArgumentSpec(ArgSym::quiet,          { option, many });
      setArgumentSpec(ArgSym::blackList,      { option, many });
      setArgumentSpec(ArgSym::forceList,      { option, many });
      setArgumentSpec(ArgSym::examples,       { task, once, goal });
      setArgumentSpec(ArgSym::C,              { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CPlusPlus,      { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CSharp,         { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Java,           { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Python,         { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::genLocs,        { option, many });
      setArgumentSpec(ArgSym::bypassMacros,   { option, many });
      //setArgumentSpec(ArgSym::tell,           { option, many });
      setArgumentSpec(ArgSym::batchFile,      { option, once });
      setArgumentSpec(ArgSym::writeBatchFile, { option, once });
      setArgumentSpec(ArgSym::directory,      { option, once });
      setArgumentSpec(ArgSym::pathC,          { option, once });
      setArgumentSpec(ArgSym::headerOnly,     { option, once });
      setArgumentSpec(ArgSym::optionsFile,    { option, once });
   }

   void init()
   {
      ConsoleApplication::init();

      // reserved or keywords
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
      targetBits = GetRuntimeBits();
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
      if(argsError())
         failOutput();
      else if(task == bind)
      {
         buildMatrix();
/*#ifdef _DEBUG
         matrix.writeToFile("matrix.bgen.econ");
#endif // def _DEBUG*/
         execute();
      }
      onTask(task);
      //ad.printAllSpecs();
#if defined(_DEBUG) && defined(__WIN32__)
      // debugBreakpoint();
#endif
   }

   void failOutput()
   {
      if(error == mustSpecifyLib)
         PrintLn($"Error: at least one library must be specified for bgen to generate bindings.");
      else if(error == noLibSpecifiedInRunBeforeClear)
         PrintLn($"Error: at least one library must be specified before the 'reset' switch.");
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
      Array<String> libs = null;
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
                     opts.optScope.quiet = true;
                     break;
                  case blackList:
                     opts.libScope.blackList = yes;
                     break;
                  case forceList:
                     opts.libScope.blackList = force;
                     break;
                  case genLocs:
                     opts.optScope.genLocs = true;
                     break;
                  case bypassMacros:
                     opts.optScope.expandMacros = true;
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
                  case headerOnly:
                     opts.optScope.headerOnly = true;
                     break;
                  case enumPrefix:
                  case funcRename:
                  case batchFile:
                  case writeBatchFile:
                  case directory:
                  case pathC:
                  case optionsFile:
                     expect = sym;
                     break;
                  //case tell:
                  //   break;
                  case ambiguous:
                     err = ambiguous;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is ambiguous.");
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
                        PrintLn($"Warning: argument ", arg, " is ignored.");
                     //err = unknown;
                     //PrintLn($"Error: argument ", sym, " (", arg, ") is unknown.");
                     break;
                  default: conmsg("unreachable"); break;
               }
               break;
            }
            case language:
               switch(sym)
               {
                  case C:
                  case CPlusPlus:
                  case CSharp:
                  case Java:
                  case Python:
                  {
                     ActionFlag blackFlag = opts.gblScope.blackList ? opts.gblScope.blackList : opts.libScope.blackList ? opts.libScope.blackList : no;
                     if(blackFlag)
                        PrintLn($"Error: language ", sym, " argument will be ignored since ",
                              blackFlag == yes ? ArgSym::blackList : ArgSym::forceList,
                              " is already specified.");
                     else
                        opts.addLanguage((Language)sym);
                     break;
                  }
                  default:
                     err = unknown;
                     PrintLn($"Error: argument ", sym, " (", arg, ") is not a know language.");
                     break;
               }
               expect = null;
               break;
            case batchFile:
            {
               const String path = arg;
               if(FileExists(path).isFile)
               {
                  delete bgenopts;
                  bgenopts = BGenOptions::loadFromFile(path);
                  if(bgenopts)
                     task = bind; // we will assume the batch file contains bind tasks for now... as it should!
               }
               else
                  PrintLn($"Error: batch file ", path, " does not exist.");
               expect = null;
               break;
            }
            case writeBatchFile:
            {
               const String path = arg;
               bgenopts.writeToFile(path);
               expect = null;
               break;
            }
            case directory:
            {
               GenOptions o = opts.optScope;
               const String dir = o.dir = arg;
               if(opts.lang == C)
               {
                  GenOptions o = opts.libScope;
                  o.cpath = dir;
               }
               expect = null;
               break;
            }
            case pathC:
            {
               GenOptions o = opts.optScope;
               o.cpath = arg;
               expect = null;
               break;
            }
            case optionsFile:
            {
               const String path = arg;
               if(FileExists(path).isFile)
               {
                  GenOptions o = GenOptions::loadFromFile(path);
                  if(o)
                     opts.optScope.merge(o);
               }
               else
                  PrintLn($"Error: options file ", path, " does not exist.");
               expect = null;
               break;
            }
            case funcRename:
            {
               GenOptions options = opts.optScope;
               if(!options.funcRename) options.funcRename = { };
               err = parseMapArgument(arg, options.funcRename, expect);
               expect = null;
               break;
            }
            case enumPrefix:
               conmsg("uniplemented");
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
               if(!error)
                  error = err;
               break;
            case ambiguous:
            case outOfScope:
            case unknown:
               if(!argError)
                  argError = err;
               break;
            default: conmsg("unreachable"); break;
         }
         if(c + 1 == argc && expect != null) //(sym == directory || sym == string || sym == map || sym == tell))
         {
            if(!error)
               error = missing;
            PrintLn($"Error: argument for ", expect, " (", arg, ") is missing.");
            /*if(sym == directory);
            else if(sym == string);
            else if(sym == map);
            else if(sym == tell);*/
         }
      }

      if(argc == 1)
         task = help;
      else if((!task || task == bind) && !(libs && libs.count))
         error = noLibSpecifiedInRunBeforeClear;
   }

   ArgErr parseMapArgument(const char * arg, Map<String, String> m, ArgSym option)
   {
      char * copy = CopyString(arg);
      char * next = copy;
      ArgErr err = null;
      while(next)
      {
         char * item = next;
         next = strchr(item, ',');
         if(next) *next = 0, next++;
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
                  PrintLn($"Warning: ", option, " map key '", item, "' is already specified!");
            }
            else
               PrintLn($"Warning: ", option, " map item '", item, "' is missing equal sign and will be ignored!");
         }
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
      Array<Language> lngs { };
      Array<String> libs { };
      Array<BGenRunOptions> gblRunOpts { };
      Array<BGenRunOptions> lngRunOpts { };
      Array<BGenRunOptions> libRunOpts { };
      for(r : bgenopts.runs)
      {
         BGenRunOptions run = r;
         rn++;
         switch(run.clear)
         {
            case all:
               gblRunOpts.RemoveAll();
            case matrix:
               lngs.RemoveAll();
               lngRunOpts.RemoveAll();
            case libraries:
               libs.RemoveAll();
               libRunOpts.RemoveAll();
               break;
            case languages:
               lngs.RemoveAll();
               lngRunOpts.RemoveAll();
               break;
         }
         if(run.languages && run.languages.count)
         {
            for(lang : run.languages)
               lngs.Add(lang);
         }
         else
            lngs.Add(C);
         if(run.libraries)
         {
            for(lib : run.libraries)
               libs.Add(lib);
         }
         gblRunOpts.Add(run);
         lngRunOpts.Add(run);
         libRunOpts.Add(run);
         if(libs.count > 0)
         {
            for(g : lngs)
            {
               Language lang = g;
               for(l : libs)
               {
                  const String lib = l;
                  RunLangLib key { rn, lang, lib };
                  Library library = createLibrary(lib);
                  GenOptions liblangOpts = run.getLibLangOptions(lang, lib, false);
                  GenOptions libfileOpts = library.loadOptionsFile();
                  GenOptions opts { };
                  if(libfileOpts)
                     opts.merge(libfileOpts);
                  for(optsr : gblRunOpts)
                  {
                     BGenRunOptions optsrun = optsr;
                     if(optsrun.global) opts.merge(optsrun.global);
                  }
                  for(optsr : lngRunOpts)
                  {
                     BGenRunOptions optsrun = optsr;
                     GenOptions langOpts = optsrun.getLangOptions(lang, false);
                     if(langOpts) opts.merge(langOpts);
                  }
                  for(optsr : libRunOpts)
                  {
                     BGenRunOptions optsrun = optsr;
                     GenOptions libOpts = optsrun.getLibraryOptions(lib, false);
                     if(libOpts) opts.merge(libOpts);
                  }
                  if(liblangOpts) opts.merge(liblangOpts);
                  matrix.appliedOptions.Add({ key, opts });
                  addGen(lang, library, opts);
               }
            }
         }
      }
      delete lngs;
      delete libs;
   }

   Gen addGen(Language lang, Library lib, GenOptions opts)
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
      gen.lib = lib;
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
               if(g.options.blackList)
                  g.outLists(g.options);
               else
               {
                  g.process();
                  g.generate();
                  if(g.lib.verbose)
                     g.printOutputFiles();
               }
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
           $"Syntax:\n"
            "   bgen [global-options] [<global-language> [language-options]]*\n"
            "        [<library> [library-options] [<language> [library-language-options]]*]+\n"
            "\n"
            "   library:   library for which bindings will be generated\n"
            "              examples: foo, foo.dll, libfoo.so, /path/to/libfoo.so\n"
            "\n"
            "   languages: language for which to output bindings (case insensitive) any of:\n"
            "      C      (c, c89)                       (default) \n"
            "      C++    (cxx, cpp, cplusplus, c++)\n"
            "      C#     (c#, cs, csharp)\n"
            "      Java   (java)\n"
            "      Python (py, python)\n"
            "\n"
            "   Options:\n"
            "     -h                Shows this syntax help\n"
            "\n"
            "     -e                Shows some examples\n"
            "\n"
            "     -a                Shows program information\n"
            "\n"
            "     -v                Shows version information\n"
            "\n"
            "     -d <directory>    Specify output directory (default: current directory)\n"
            "\n"
            "     -q                Force bgen to execute silently\n"
            "\n"
            //"   --enum-prefix <prefix><string>        Prefix enumeration types by 'prefix'\n"
            //"\n"
            "     -fren <key>=<value>[,<key>=<value>]*     Rename a function\n"
            "\n"
            //"   -tell <telltype>                     Tell you something\n"
            //"                        where telltype is something\n"
            //"\n"
            "     --black-list      Output all constructs within library for a blacklist\n"
            "                       (or whitelist) to ./<libname>.bgen.econ,\n"
            "                       only if file doesn't exist\n"
            "\n"
            "     --force-list      Output all constructs within library for a blacklist\n"
            "                       (or whitelist) to ./<libname>.bgen.econ,\n"
            "                       overwriting an existing file\n"
            "\n"
            "     --clear-all       Clear all options\n"
            "                       (e.g. to generate again with different options)\n"
            "\n"
            "     --clear-languages Clear all languages options\n"
            "\n"
            "     --clear-libraries Clear all libraries options\n"
            "\n"
            "     --clear-matrix    Clear all libraries & languages options\n"
            "\n"
            "     --bypass-macros   Bypass macros option (used by bgen/cpp)\n"
            "\n"
            "   Notes:\n"
            "      All switches are case insensitive.\n"
            "      The use of - or -- is optional for all switches.\n"
            "      All non-ambiguous truncated shorthands are accepted for all switches.\n"
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
      cppTypeNameCall = false;
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

bool cppTypeNameCall;
#if 0
{
   Type t = ti.type;
   if(cppTypeNameCall && g_.lang == CPlusPlus && g_.lib.ecereCOM && t.kind == classType && t._class)
   {
      if(/*!t._class.registered && */tmpcppececeremess.Find(strptrNoNamespace(t._class.string)))
         conmsg("break");
   }
}
#endif // 0

AVLTree<const String> tmpcppececeremesstypedef // hack
{ [
   // "Alignment",
   // "DataDisplayFlags"
] };

AVLTree<const String> tmpcppececeremessclass // hack
{ [
   "Window",
   "IOChannel",
   "Surface",
   "DataBox"
] };

define app = ((BGen)__thisModule);
bool genloc__on;
CGen g_; // todo
bool python; // todo
bool py; // todo

bool impossibledebug_bmethod_hasTemplateAnything(BMethod m)
{
   Type t = m.md.dataType;
   Type param;
   for(param = t.params.first; param; param = param.next)
   {
      if(param.kind == templateType) return true;
   }
   return false;
}
