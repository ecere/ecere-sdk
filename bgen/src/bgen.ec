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

char ln = '\n';

ConsoleFile console { };
//define app = (ConsoleApplication)__thisModule.application;

enum ArgSym : ArgumentSymbol
{
   quiet,
   language,
   library,
   all,
   reset,
   string,
   map,
   tell,
   directory,
   enumPrefix,
   funcRename,
   C = 1025,
   CPlusPlus,
   CSharp,
   Java,
   Python,
   _
};

enum ArgErr : ArgumentError
{
   taskTwice,
   langTwice,
   mustSpecifyLib,
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
      if(allSpecs.GetCount()) check();
      //allSpecs.RemoveAll();
   }
}

public class BGen : ConsoleApplication // <ArgSym>
{
   bool quiet;
   bool forAll;
   const char * idnt;
   idnt = " ";
   Gen gen;
   Library lib;
   Language lang;
   Directory dir;
   GenOptions options;
   GenOptions optionsForAll;
   List<Gen> gens { };
   List<Library> libs { };
   List<Library> ownLibs { };
   List<Directory> dirs { };
   List<Directory> ownDirs { };
   List<GenOptions> ownOptions { };

   void onBuildArgumentOptions()
   {
      addArgumentSymbol(ArgSym::quiet,       "quiet",                super,   0);
      addArgumentSymbol(ArgSym::examples,    "examples",             super,   0);
      addArgumentSymbol(ArgSym::library,     "library",              super,   0);
      addArgumentSymbol(ArgSym::C,           "c",                    strict,  0);
      addArgumentSymbol(ArgSym::C,           "c89",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,           "c90",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,           "c95",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,           "c99",                  strict,  0);
      //addArgumentSymbol(ArgSym::C,           "c11",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,   "c++",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,   "cxx",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,   "cpp",                  strict,  0);
      addArgumentSymbol(ArgSym::CPlusPlus,   "cplusplus",            strict,  0);
      addArgumentSymbol(ArgSym::CSharp,      "c#",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,      "cs",                   strict,  0);
      addArgumentSymbol(ArgSym::CSharp,      "csharp",               strict,  0);
      addArgumentSymbol(ArgSym::Java,        "java",                 strict,  0);
      addArgumentSymbol(ArgSym::Python,      "py",                   strict,  0);
      addArgumentSymbol(ArgSym::Python,      "python",               strict,  0);
      addArgumentSymbol(ArgSym::all,         "all",                  strict,  0);
      addArgumentSymbol(ArgSym::reset,       "reset",                strict,  0);
      addArgumentSymbol(ArgSym::string,      "string",               super,   0);
      addArgumentSymbol(ArgSym::enumPrefix,  "enumeration-prefix",   super,   ArgSym::string);
      addArgumentSymbol(ArgSym::map,         "map",                  super,   0);
      addArgumentSymbol(ArgSym::funcRename,  "function-rename",      super,   ArgSym::map);
      addArgumentSymbol(ArgSym::tell,        "tell",                 super,   0);
      addArgumentSymbol(ArgSym::directory,   "output",               super,   0);
      addArgumentSymbol(ArgSym::directory,   "directory",            super,   0);

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

      setArgumentSpec(ArgSym::quiet,     { option, many });
      setArgumentSpec(ArgSym::language,  { option, once });
      setArgumentSpec(ArgSym::examples,  { task, once, goal });
      setArgumentSpec(ArgSym::library,   { task, many, goal });
      setArgumentSpec(ArgSym::C,         { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CPlusPlus, { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::CSharp,    { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Java,      { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::Python,    { option, once, ArgSym::language });
      setArgumentSpec(ArgSym::string,    { option, many });
      setArgumentSpec(ArgSym::map,       { option, many });
      setArgumentSpec(ArgSym::tell,      { option, many });
      setArgumentSpec(ArgSym::directory, { option, once });
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
   }

   void Main()
   {
      ArgSym task = null;
      ArgErr error = null;
      ArgErr argError = null;
      Map<String, String> m = null;

      init();

      if(argc > 1)
      {
         int c;
         ArgSym sym = null;
         ArgSym prev = null;
         ArgSym scope = null;
         for(c = 1; c < argc; c++)
         {
            ArgErr err = null;
            const char * arg = argv[c];
            prev = sym;
            if(arg[0] == '.' && arg[1] == 0)
               sym = null;
            else if(prev == funcRename)
            {
               char * key, * s = strstr(arg, "=");
               if(s)
               {
                  MapIterator<String, String> i { map = m };
                  int len = s - arg;
                  key = new char[len + 1];
                  strncpy(key, arg, len);
                  key[len] = 0;
                  if(!i.Index(key, true))
                     i.data = CopyString(++s);
                  else
                     PrintLn("map error: key (", key, ") is already specified!");
                  delete key;
               }
            }
            else
            {
               sym = null;
               if(prev == library)
                  lib = addLibrary(arg);
               else if(prev == directory)
                  dir = addDirectory(arg);
               else if(prev == string || prev == map)
               {
                  sym = (ArgSym)getSwitchSymbol(arg, scope);
                  if(prev == map && sym == ArgSym::funcRename)
                  {
                     m = null;
                     options = getOptions();
                     if(options)
                     {
                        if(!options.funcRename) options.funcRename = { };
                        m = options.funcRename;
                     }
                  }
                  else
                     check(); // todo error
               }
               else if(prev == tell)
                  check(); // todo
               else
               {
                  if(*arg == '-') { arg++; if(*arg == '-') { arg++; if(*arg == '-') arg++; } }
                  sym = (ArgSym)getSwitchSymbol(arg, scope);
                  switch(sym)
                  {
                     case C:
                     case CPlusPlus:
                     case CSharp:
                     case Java:
                     case Python:
                        //if(!lang)
                           lang = (Language)sym;
                           //if(dir) dir.lang = lang;
                        /*else
                           err = langTwice;*/
                        break;
                     case quiet:
                        quiet = true;
                        break;
                     case about:
                     case help:
                     case examples:
                     case license:
                     case version:
                     case library:
                        if(!task)
                           task = sym;
                        else if(sym != library)
                           err = taskTwice;
                        break;
                     case reset:
                        generateGens();
                        break;
                     case all:
                     {
                        forAll = true;
                        break;
                     }
                     case string:
                     case map:
                        scope = sym;
                        break;
                     case tell:
                        break;
                     case directory:
                        break;
                     case ambiguous:
                        err = ambiguous;
                        PrintLn($"Error: argument ", sym, " (", arg, ") is ambiguous."); // todo: fix i18n
                        break;
                     case null:
                        err = unknown;
                        PrintLn($"Error: argument ", sym, " (", arg, ") is unknown."); // todo: fix i18n
                        break;
                     default: check(); break;
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
                     default: check(); break;
                  }
               }
               if(c + 1 == argc && (sym == library || sym == directory || sym == string || sym == map || sym == tell))
               {
                  if(!error) error = missing;
                  PrintLn($"Error: argument for ", sym, " (", arg, ") is missing."); // todo: fix i18n
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
      }
      generateGens();
      if(task == null || error || argError)
      {
         if(task == null)
            PrintLn($"Error: please specify task.");
         else if(error == taskTwice)
            PrintLn($"Error: you can only specify one task at a time.");
         else if(error == langTwice)
            PrintLn($"Error: you can only specify one target language at a time.");
         else if(!argError && error != missing)
            PrintLn($"Error: ", error);
         idnt = "  ";
         PrintLn(idnt, $"use 'bgen help', 'bgen examples' or 'bgen about' for more information.");
      }
      else if(gens.count)
      {
         for(gen : gens)
         {
            Gen g = this.gen = gen; // for watches
            //bool plug = false;
            // todo: fix this, python should not pollute c or globals
            python = (gen.lang == Python); // todo
            py = false; // todo
            g_ = (CGen)g;
            // tocheck: just drop?
            /*if(!g.lib.outputDir)
               g.lib.outputDir = CopyString(def.lib.outputDir);*/
            //g.lib.init();
            //PrintLn("doing: ", g.dir.lang, " - ", g.lib.bindingName, " -> ", g.dir.outputDir);
            if(g.lib.name)
            {
               // todo: validate g.lib.name?
               /*if(!g.lib.funcRename)
               {
                  plug = true;
                  // tocheck: must keep it somewhere?
                  //g.lib.funcRename = def ? def.lib.funcRename : null;
               }*/
               if(!g.lib.options)
                  g.lib.options = optionsForAll;
               if(!g.lib.options)
                  g.lib.options = addOptions();
               if(g.init())
               {
                  //parseInspection(null, null, "extern bool (*uTF8Validate)(const char * source);\n");
                  //parseInspection(null, null, "extern const char * __ecereNameSpace__ecere__GetTranslatedString(const String name, const char * string, const char * stringAndContext);\n");
                  //parseInspection(null, null, "extern Application __ecere_COM_Initialize(bool guiApp, int argc, char * argv[]);\n");
                  //parseInspection(null, null, "Test fname(...);\n");
                  //parseInspection(null, null, "myFnPtr = (void (*)(void))myVoidPtr;");
                  //parseInspection(null, null, "void (*myFnPtr)(void) = (void (*)(void))myVoidPtr;");
                  g.process();
                  g.generate();
                  if(g.lib.verbose)
                     g.printOutputFiles();
               }
               /*if(plug)
                  g.lib.funcRename = null;*/
               g.reset(); //delete g;
            }
         }
      }

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
      onTask(task);

      //PrintLn("");
      //ad.printAllSpecs();
      //pause();
   }

   Directory addDirectory(const char * path)
   {
      Directory dir { };
      if(lang)
         dir.lang = lang;
      dir.outputDir = CopyString(path);
      dir.init();
      dirs.Add(dir);
      ownDirs.Add(dir);
      return dir;
   }

   Library addLibrary(const char * name)
   {
      Library lib = createLibrary(name);
      libs.Add(lib);
      ownLibs.Add(lib);
      return lib;
   }

   GenOptions addOptions()
   {
      GenOptions options { };
      ownOptions.Add(options);
      return options;
   }

   GenOptions getOptions()
   {
      GenOptions options = null;
      if(forAll)
      {
         if(!optionsForAll)
            optionsForAll = addOptions();
         options = optionsForAll;
      }
      else
      {
         if(lib)
         {
            if(!lib.options)
               lib.options = addOptions();
            options = lib.options;
         }
         else
            PrintLn("options error: a library must be specified first!");
      }
      return options;
   }

   Gen addGen(Library lib, Directory dir)
   {
      Gen gen = null;
      python = false; // todo
      switch(dir.lang)
      {
         case C:           gen = CGen { };      break;
         case CPlusPlus:   gen = CPPGen { };    break;
         case CSharp:      gen = CSharpGen { }; break;
         case Java:        gen = JavaGen { };   break;
         case Python:
            python = true; // todo
                           gen = PythonGen { }; break;
         default: check(); break;
      }
      gen.quiet = quiet;
      gen.lib = lib;
      gen.dir = dir;
      //if(def.lib.outputDir)
      //   gen.lib.outputDir = CopyString(def.lib.outputDir);
      gens.Add(gen);
      return gen;
   }

   void generateGens()
   {
      if(libs.count)
      {
         if(!dirs.count)
            dir = addDirectory("");
         for(dir : dirs)
         {
            for(lib : libs)
            {
               addGen(lib, dir);
            }
         }
      }
      else if(dirs.count)
      {
         //err = mustSpecifyLib;
         PrintLn("command line error: at least one library must be specified for work to be done!");
      }
      lang = null;
      forAll = false;
      libs.RemoveAll();
      dirs.RemoveAll();
   }

   //bool onArgCustom(int symbol) { return true; }
   //bool onArg(const char * arg, int pos, S symbol, S scope, S prev, E error, bool raw)
   //bool onArg(const char * arg, int pos, int symbol, int scope, int prev, int error, bool raw)
   bool onArg(const char * arg, int pos, ArgSym symbol, ArgSym scope, ArgSym prev, ArgErr error, bool raw)
   {
      if(raw)
      {
         if(prev == library)
            check();//gens.Add(createGen(null, arg, def)); // todo if onArg is ever used
         else if(prev == directory)
         {
            check(); // todo?
            /*delete def.lib.outputDir;
            def.lib.outputDir = CopyString(arg);*/
         }
         else if(prev == string)
            check(); // todo
         else if(prev == map)
            check(); // todo
         else if(prev == tell)
            check(); // todo
      }
      else
      {
      }
      return false;
   }

   bool onTask(int symbol)
   {
      ArgSym task = (ArgSym)symbol;
      if(task == about)
      {
         PrintLn("Language Binding Generator for eC Libraries (bgen)");
         PrintLn("Copyright (C) 2016 Ecere Corporation");
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
         PrintLn(idnt, $"'bgen lib \"C:\\Program Files\\Ecere\\bin\\ecere.dll\"'");
         PrintLn(idnt, $"'bgen lib ecereCOM'");
         PrintLn(idnt, $"'bgen library ecere'");
         PrintLn(idnt, $"'bgen lib /usr/lib/libecere.so'");
         return true;
      }
      else if(task == help)
      {
         idnt = "  ";
         PrintLn($"Syntax:");
         idnt = "  ";
         PrintLn(idnt, $"'bgen about'");
         PrintLn(idnt, $"'bgen help'");
         PrintLn(idnt, $"'bgen examples'");
         PrintLn(idnt, $"'bgen version'");
         PrintLn(idnt, $"'bgen library <library> [options]'");
         idnt = "      ";
         PrintLn(idnt, $"<library>: source library to which a language binding will be generated");
         PrintLn(idnt, $"           examples: 'foo' or 'foo.dll' or 'libfoo.so' or 'C:\\path\\to\\foo.dll' or '/path/to/libfoo.so'");
         PrintLn(idnt, $"[options]: optionally, a single instance of [language] as well as");
         PrintLn(idnt, $"           any number of [string] or [map] or [option] in no particular order");
         PrintLn(idnt, $"[language]: target language of generated bindings");
         PrintLn(idnt, $"            case insentitive choices:");
         PrintLn(idnt, $"              'c' or 'c89' for C (default)");
         PrintLn(idnt, $"              'cpp' or 'cxx' or 'cplusplus' or 'c++' for C++");
         PrintLn(idnt, $"              'c#' pr 'cs' or 'csharp' for C#");
         PrintLn(idnt, $"              'java' for Java");
         PrintLn(idnt, $"              'py' or 'python' for Python");
         PrintLn(idnt, $"[string]: 'string <stringtype> <string>'");
         PrintLn(idnt, $"             <stringtype>: 'enumeration-prefix'");
         PrintLn(idnt, $"[map]: 'map <maptype> <key=value> [key=value] [...] .'");
         PrintLn(idnt, $"             <maptype>: 'function-rename'");
         PrintLn(idnt, $"[option]: [tell] or [output directory]:");
         PrintLn(idnt, $"[tell]: 'tell <telltype>'");
         PrintLn(idnt, $"[output directory]: 'output|directory <directory>'");
         PrintLn(idnt, $"                    (this will default to the current directory)");
         PrintLn("");
         idnt = "  ";
         PrintLn($"Additional Information:");
         PrintLn(idnt, $"all switches are case insensitive");
         PrintLn(idnt, $"use of - or -- is optional for all switches");
         PrintLn(idnt, $"all non-ambiguous truncated shorthand are accepted for all switches");
#if 0
         PrintLn(idnt, $"for examples the help switch can be specified in any of these ways");
         PrintLn(idnt, $"    'bgen -h' or 'bgen --he' or 'bgen --help' or 'bgen h' or 'bgen he' or 'bgen hel' or 'bgen help'");
         PrintLn(idnt, $"    'bgen -H' or 'bgen --HE' or 'bgen --HeLP' or 'bgen H' or 'bgen hE' or 'bgen hEl' or 'bgen Help'");
#endif // 0
         return true;
      }
      return false;
   }

   ~BGen()
   {
      ownLibs.Free();
      ownDirs.Free();
      ownOptions.Free();
      gens.Free();
   }
}

define app = ((BGen)__thisModule);
CGen g_;
bool python; // todo
bool py;
