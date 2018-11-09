#ifdef ECERE_STATIC
import static "ecere"
import static "ec"
#else
import "ecere"
import "ec"
#endif


//#include <stdarg.h>

static Context globalContext { };
static Module privateModule;
static ModuleImport mainModule;
static OldList _excludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };
static OldList defines, imports;
static NameSpace globalData
{
   classes.CompareKey = (void *)BinaryTree::CompareString;
   defines.CompareKey = (void *)BinaryTree::CompareString;
   functions.CompareKey = (void *)BinaryTree::CompareString;
   nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
};

static void OutputImports(char * fileName)
{
   File f = FileOpen(fileName, write);
   if(f)
   {
      if(imports.first)
      {
         ModuleImport module;
         f.Printf("[Imported Modules]\n");
         for(module = imports.first; module; module = module.next)
         {
            ClassImport _class;
            FunctionImport function;

            if(module.name)
               f.Printf("   %s\n", module.name);
            else
               f.Printf("   [This]\n");
            if(module.importType == staticImport)
               f.Printf("      [Static]\n");
            else if(module.importType == remoteImport)
               f.Printf("      [Remote]\n");

            if(module.importAccess == privateAccess)
               f.Printf("      [Private]\n");
            else
               f.Printf("      [Public]\n");

            if(module.classes.first)
            {
               f.Printf("      [Imported Classes]\n");
               for(_class = module.classes.first; _class; _class = _class.next)
               {
                  f.Printf("         %s\n", _class.name);
                  if(_class.itself)
                  {
                     f.Printf("            [Instantiated]\n");
                  }
                  if(_class.isRemote)
                  {
                     f.Printf("            [Remote]\n");
                  }

                  if(_class.methods.first)
                  {
                     MethodImport method;
                     f.Printf("            [Imported Methods]\n");
                     for(method = _class.methods.first; method; method = method.next)
                     {
                        f.Printf("               %s\n", method.name);
                        if(method.isVirtual)
                           f.Printf("                  [Virtual]\n");

                     }
                     f.Printf("               .\n");
                  }

                  if(_class.properties.first)
                  {
                     PropertyImport prop;
                     f.Printf("            [Imported Properties]\n");
                     for(prop = _class.properties.first; prop; prop = prop.next)
                     {
                        f.Printf("               %s\n", prop.name);
                        if(prop.isVirtual)
                           f.Printf("                  [Virtual]\n");
                        if(prop.hasSet)
                           f.Printf("                  [Set]\n");
                        if(prop.hasGet)
                           f.Printf("                  [Get]\n");
                     }
                     f.Printf("               .\n");
                  }
               }
               f.Printf("        .\n");
            }
            if(module.functions.first)
            {
               f.Printf("      [Imported Functions]\n");
               for(function = module.functions.first; function; function = function.next)
               {
                  f.Printf("         %s\n", function.name);
               }
               f.Printf("        .\n");
            }
         }
         f.Printf("   .\n");
      }
   }
   delete f;
}

#ifdef _DEBUG
/*static bool TestType(String string, String expected)
{
   bool result = true;
   char typeString[1024] = { 0 };
   Type type = ProcessTypeString(string, false);
   PrintType(type, typeString, true, false);//true);
   if(strcmp(typeString, expected ? expected : string))
   {
      PrintLn("FAILED: ", string, " -> ", typeString);
      result = false;
   }
   return result;
}

static void TestTypes()
{
   int succeeded = 0, count = 0;

   count++, succeeded += TestType("dllexport void (dllexport * Module::signal(int, void (*)(int)))(int)", null);
   count++, succeeded += TestType("int (* f[8])[10]", null);
   count++, succeeded += TestType("void (* signal(int, void (*)(int)))(int)", null);
   count++, succeeded += TestType("void (* signal(double))()", null);
   count++, succeeded += TestType("void (* bla)(int)", null);
   count++, succeeded += TestType("int f(void (*[10])())", null);
   count++, succeeded += TestType("void (*[10])()", null);
   count++, succeeded += TestType("void (* converters_table[10])()", null);
   count++, succeeded += TestType("int (* f[8])[10]", null);

   count++, succeeded += TestType("int f[8][10]", null);
   count++, succeeded += TestType("int f[10]", null);
   count++, succeeded += TestType("void *", null);
   count++, succeeded += TestType("char * x", "char * x");
   count++, succeeded += TestType("char * x", null);
   count++, succeeded += TestType("char (* x[3])()", null);
   count++, succeeded += TestType("char (*(* x[3])())", "char * (* x[3])()");
   count++, succeeded += TestType("char (* x())", "char * x()");
   count++, succeeded += TestType("char (* (* x[3])())[5]", null);
   count++, succeeded += TestType("char (* f())[5]", null);
   count++, succeeded += TestType("char * (* f())[5]", null);
   count++, succeeded += TestType("char * (* * f())[5][2][3]", null);
   count++, succeeded += TestType("char * (* * (* f)())[5][2][3]", null);
   count++, succeeded += TestType("char * (* (* * (* f)())[5][2])[3]", null);
   count++, succeeded += TestType("void (* (* bar)[5])()", null);
   count++, succeeded += TestType("const int * (* const f)(char[10])", null);
   count++, succeeded += TestType("const int", null);
   count++, succeeded += TestType("int * const *", null);
   count++, succeeded += TestType("int * const", null);
   count++, succeeded += TestType("const int *", null);

   count++, succeeded += TestType("char * const (* (* const bar)[5])(int)", null);
   count++, succeeded += TestType("char * const (* (* (* const bar)[5][6])(int))[2]", null);
   count++, succeeded += TestType("int * * a", null);

   count++, succeeded += TestType("char * const (* bar)()", null);

   count++, succeeded += TestType("char * const (* const (* const bar)[5])(int)", null);

   count++, succeeded += TestType("char * (* const (* bar)[5])(int)", null);
   count++, succeeded += TestType("void (* * const bar[5])()", null);
   count++, succeeded += TestType("void (* * const bar)()", null);
   count++, succeeded += TestType("void (* const * bar)()", null);
   count++, succeeded += TestType("const int * * foo", null); // this prevents you from doing: **foo = 0;
   count++, succeeded += TestType("int * const * bar", null); // this prevents you from doing: *bar = 0;
   count++, succeeded += TestType("int * * const two", null); // this prevents you from doing: two = 0;
   count++, succeeded += TestType("dllexport int TestFunction()", null);
   count++, succeeded += TestType("dllexport int (* TestFunction())[3]", null);


   count++, succeeded += TestType("int dllexport TestFunction()", "dllexport int TestFunction()");
   count++, succeeded += TestType("bool (stdcall * Load)(Module module)", null);

   count++, succeeded += TestType("bool (__attribute__((stdcall)) * Load)(Module module)", "bool (stdcall * Load)(Module module)");
   count++, succeeded += TestType("int (dllexport * Load)()", null);
   count++, succeeded += TestType("int (* Load)(Module module)", null);
   count++, succeeded += TestType("bool (__declspec(dllexport) * Load)(Module module)", "bool (dllexport * Load)(Module module)");
   count++, succeeded += TestType("__declspec(dllexport) int TestFunction()", "dllexport int TestFunction()");
   count++, succeeded += TestType("int __declspec(dllexport) TestFunction()", "dllexport int TestFunction()");
   count++, succeeded += TestType("int __attribute__((dllexport)) TestFunction()", "dllexport int TestFunction()");
   count++, succeeded += TestType("bool (__attribute__((dllexport)) * Load)(Module module)", "bool (dllexport * Load)(Module module)");
   count++, succeeded += TestType("any_object TestFunction(any_object, typed_object param)", null);
   count++, succeeded += TestType("void typed_object::OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)", null);
   count++, succeeded += TestType("int typed_object::OnCompare(any_object object)", null);
   count++, succeeded += TestType("char * typed_object::OnGetString(char * tempString, void * fieldData, bool * needClass)", null);
   count++, succeeded += TestType("void typed_object&::OnCopy(any_object newData)", null);
   count++, succeeded += TestType("void typed_object::OnFree(void)", null);
   count++, succeeded += TestType("bool typed_object&::OnGetDataFromString(char * string)", null);
   count++, succeeded += TestType("Window typed_object::OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)", null);
   count++, succeeded += TestType("void typed_object::OnSerialize(IOChannel channel)", null);
   count++, succeeded += TestType("void typed_object&::OnUnserialize(IOChannel channel)", null);
   count++, succeeded += TestType("bool typed_object&::OnSaveEdit(Window window, void * object)", null);
   count++, succeeded += TestType("void ::StaticMethod(IOChannel channel)", null);

   count++, succeeded += TestType("void PrintLn(typed_object object, ...)", null);
   count++, succeeded += TestType("void PrintLn(typed_object object, ...)", null);

   count++, succeeded += TestType("thisclass RemoveSwapRight()", null);
   count++, succeeded += TestType("struct { thisclass prev; thisclass next; }", null);

   count++, succeeded += TestType("LinkElement<thisclass>", null);

   count++, succeeded += TestType("void (dllexport * converters_table[10])()", null);

   count++, succeeded += TestType("bool (stdcall * * Load)(Module module)", null);

   count++, succeeded += TestType("int stdcall TestFunction()", "stdcall int TestFunction()");
   count++, succeeded += TestType("dllexport stdcall void test()", null);

   count++, succeeded += TestType("bool (* Module::notifySelect)(MenuItem selection, Modifiers mods)", null);

   count++, succeeded += TestType("typed_object &", null);

   PrintLn("\n", succeeded, " / ", count, " tests succeeded.");
}
*/
#endif

class CompilerApp : Application
{
   void Main()
   {
      char * cppCommand = null;
      char * cppOptions = null;
      int cppOptionsLen = 0;
      /*char ** argv = null;
      int argc = 0;*/
      int c;
      bool valid = true;
      char defaultOutputFile[MAX_LOCATION];
      bool buildingBootStrap = false;

      Platform targetPlatform = __runtimePlatform;
      int targetBits = GetHostBits();

#ifdef _DEBUG
      // buildingBootStrap = true;
#endif

      SetSymbolsDir("");

      /*for(c = 0; c<this.argc; c++)
      {
         char * arg = this.argv[c];
         int argLen = strlen(arg);

         argv = renew argv char *[argc + 1];
         argv[argc] = new char[argLen+1];
         strcpy(argv[argc], arg);

         while(argv[argc][argLen-1] == '\\' && c < this.argc-1)
         {
            int len;

            c++;
            arg = this.argv[c];
            len = strlen(arg);
            argv[argc] = renew argv[argc] char[argLen + len + 1];

            argv[argc][argLen-1] = ' ';
            strcpy(argv[argc] + argLen, arg);
            argLen += len;
         }
         argc++;
      }*/

#if 0 //def _DEBUG
      printf("\nArguments given:\n");
      for(c=1; c<argc; c++)
         printf(" %s", argv[c]);
      printf("\n\n");
      for(c=1; c<argc; c++)
         PrintLn("Arg", c, ": ", argv[c]);
      printf("\n");
      //getch();
#endif

      for(c = 1; c<argc; c++)
      {
         const char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
            {
               int newLen = cppOptionsLen + 1 + strlen(arg);
               cppOptions = renew cppOptions char[newLen + 1];
               cppOptions[cppOptionsLen] = ' ';
               strcpy(cppOptions + cppOptionsLen + 1, arg);
               cppOptionsLen = newLen;
               targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
            }
            else if(!strcmp(arg + 1, "t32") || !strcmp(arg + 1, "t64"))
            {
               targetBits = !strcmp(arg + 1, "t32") ? 32 : 64;
            }
            else if(arg[1] == 'D' || arg[1] == 'I')
            {
               char * buf;
               int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;
               cppOptions = renew cppOptions char[size];
               buf = cppOptions + cppOptionsLen;
               *buf++ = ' ';
               PassArg(buf, arg);
               cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
               if(arg[1] == 'D')
               {
                  if(!strcmp(arg, "-DBUILDING_ECERE_COM"))
                     SetBuildingEcereCom(true);
                  else if(!strcmp(arg, "-DECERE_COM_MODULE"))
                     SetBuildingEcereComModule(true);
                  else if(!strcmp(arg, "-DECERE_BOOTSTRAP"))
                     buildingBootStrap = true;
               }
            }
            else if(!strcmp(arg+1, "t"))
            {
               if(++c < argc)
               {
                  targetPlatform = argv[c];
                  if(targetPlatform == unknown)
                  {
                     PrintLn("Unknown platform: ", argv[c]);
                     if(!strcmp(argv[c], "32") || !strcmp(argv[c], "64"))
                        PrintLn("hint: bitness is specified with -t32 or -t64 without a space");
                     valid = false;
                  }
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "cpp"))
            {
               if(++c < argc)
                  cppCommand = CopyString(argv[c]);
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "o"))
            {
               if(!GetOutputFile() && c + 1 < argc)
               {
                  SetOutputFile(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "c"))
            {
               if(!GetSourceFile() && c + 1 < argc)
               {
                  SetSourceFile(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "isystem") || !strcmp(arg+1, "isysroot") || !strcmp(arg+1, "s"))
            {
               if(c + 1 < argc)
               {
                  char * buf;
                  const char * arg1 = argv[++c];
                  int size = cppOptionsLen + 1 + strlen(arg) * 2 + strlen(arg1) * 2 + 1;
                  cppOptions = renew cppOptions char[size];
                  buf = cppOptions + cppOptionsLen;
                  *buf++ = ' ';
                  buf = PassArg(buf, arg);
                  *buf++ = ' ';
                  buf = PassArg(buf, arg1);
                  cppOptionsLen = buf - cppOptions;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "fno-diagnostics-show-caret"))
            {
               char * buf;
               int size = cppOptionsLen + 1 + strlen(arg) * 2 + 1;
               cppOptions = renew cppOptions char[size];
               buf = cppOptions + cppOptionsLen;
               *buf++ = ' ';
               PassArg(buf, arg);
               cppOptionsLen = cppOptionsLen + 1 + strlen(buf);
            }
            else if(!strcmp(arg+1, "symbols"))
            {
               if(c + 1 < argc)
               {
                  SetSymbolsDir(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "module"))
            {
               if(c + 1 < argc)
               {
                  SetI18nModuleName(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "memguard"))
            {
               SetMemoryGuard(true);
            }
            else if(!strcmp(arg+1, "defaultns"))
            {
               if(c + 1 < argc)
               {
                  SetDefaultNameSpace(argv[c+1]);
                  //defaultNameSpaceLen = strlen(defaultNameSpace);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg+1, "strictns"))
            {
               SetStrictNameSpaces(true);
            }
            else if(!strcmp(arg+1, "nolinenumbers"))
            {
               SetOutputLineNumbers(false);
            }
         }
         else
            valid = false;
      }
      if(valid)
      {
         if(!cppCommand)
            cppCommand = CopyString("gcc");
         if(!GetSourceFile())
            valid = false;
         else if(!GetOutputFile())
         {
            strcpy(defaultOutputFile, "");
            PathCat(defaultOutputFile, GetSourceFile());
            ChangeExtension(defaultOutputFile, "c", defaultOutputFile);
            SetOutputFile(defaultOutputFile);
         }
      }

      if(!valid)
      {
         printf("%s", $"Syntax:\n   ecc [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-module <module>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n");
      }
      else
      {
         DualPipe cppOutput;
         // TODO: Improve this
         char command[MAX_F_STRING*3];
         SetGlobalData(&globalData);
         SetExcludedSymbols(&_excludedSymbols);
         SetGlobalContext(globalContext);
         SetCurrentContext(globalContext);
         SetTopContext(globalContext);
         SetDefines(&::defines);
         SetImports(&imports);
         SetInCompiler(true);
         SetTargetPlatform(targetPlatform);
         SetTargetBits(targetBits);
         SetEchoOn(false);
                                                        // TOFIX: Use a bit class instead of a bool to store target bits information
         privateModule = (Module)__ecere_COM_Initialize((bool)(true | (targetBits == sizeof(uintptr)*8 ? 0 : targetBits == 64 ? 2 : targetBits==32 ? 4 : 0) | 8), 1, null);
         SetPrivateModule(privateModule);

         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint64"), type = ProcessTypeString("unsigned int64", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint32"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint16"), type = ProcessTypeString("unsigned short", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("byte"), type = ProcessTypeString("unsigned char", false) });
         if(buildingBootStrap)
         {
            // Do not define this when we pre-include stdint.h or the eC compiler will be confused when parsing these types (External prioritization in pass15.ec will fail)
            globalContext.types.Add((BTNode)Symbol { string = CopyString("intptr_t"), type = ProcessTypeString("intptr", false) });
            globalContext.types.Add((BTNode)Symbol { string = CopyString("uintptr_t"), type = ProcessTypeString("uintptr", false) });
            globalContext.types.Add((BTNode)Symbol { string = CopyString("ssize_t"), type = ProcessTypeString("intsize", false) });
            globalContext.types.Add((BTNode)Symbol { string = CopyString("size_t"), type = ProcessTypeString("uintsize", false) });
         }

#ifdef _DEBUG
         // TestTypes();
#endif

         {
            GlobalData data { fullName = CopyString("__thisModule"), dataTypeString = CopyString("Module"), module = privateModule };
            data.key = (uintptr)data.fullName;
            globalData.functions.Add((BTNode)data);
         }

         snprintf(command, sizeof(command), "%s%s -x c -E %s\"%s\"", cppCommand, cppOptions ? cppOptions : "", buildingBootStrap ? "" : "-include stdint.h -include sys/types.h ", GetSourceFile());
         command[sizeof(command)-1] = 0;
#if 0 //def _DEBUG
         PrintLn("ECC Executing:");
         PrintLn(command);
#endif
         if((cppOutput = DualPipeOpen({ output = true }, command)))
         {
            char impFile[MAX_LOCATION];
            ImportedModule module;
            char sourceFileName[MAX_FILENAME];
            char mainModuleName[MAX_FILENAME];
            int exitCode;
            OldList * ast;

            TempFile fileInput { };
            SetFileInput(fileInput);

            imports.Add((mainModule = ModuleImport { }));
            SetMainModule(mainModule);

            GetLastDirectory(GetSourceFile(), sourceFileName);
            strcpy(mainModuleName, sourceFileName);

#if 0
            // TEMP: UNTIL WE CAN HAVE PER SOURCE FILE PREPROCESSOR DEFINITIONS...
            if(GetBuildingEcereCom() &&
               !(strcmpi(mainModuleName, "instance.ec") && strcmpi(mainModuleName, "BinaryTree.ec") &&
               strcmpi(mainModuleName, "dataTypes.ec") && strcmpi(mainModuleName, "OldList.ec") &&
               strcmpi(mainModuleName, "String.ec") && strcmpi(mainModuleName, "BTNode.ec") &&
               strcmpi(mainModuleName, "Array.ec") && strcmpi(mainModuleName, "AVLTree.ec") &&
               strcmpi(mainModuleName, "BuiltInContainer.ec") && strcmpi(mainModuleName, "Container.ec") &&
               strcmpi(mainModuleName, "CustomAVLTree.ec") && strcmpi(mainModuleName, "LinkList.ec") &&
               strcmpi(mainModuleName, "List.ec") && strcmpi(mainModuleName, "Map.ec") &&
               strcmpi(mainModuleName, "Mutex.ec")))
               SetBuildingEcereComModule(true);
            if(GetBuildingEcereCom() &&
               !(strcmpi(mainModuleName, "instance.ec") && strcmpi(mainModuleName, "BinaryTree.ec") &&
               /*strcmpi(mainModuleName, "dataTypes.ec") && strcmpi(mainModuleName, "OldList.ec") &&*/
               /*strcmpi(mainModuleName, "String.ec") && */strcmpi(mainModuleName, "BTNode.ec") &&
               strcmpi(mainModuleName, "Mutex.ec") && strcmpi(mainModuleName, "Thread.ec")))
            //if(GetBuildingEcereCom() && !strcmpi(mainModuleName, "instance.ec"))
               SetMemoryGuard(false);
#endif

            StripExtension(mainModuleName);
            module = ImportedModule { name = CopyString(mainModuleName), type = moduleDefinition };
            ::defines.AddName(module);

            resetScanner();
            while(!cppOutput.Eof())
            {
               char junk[4096];
               int64 count = cppOutput.Read(junk, 1, 4096);
               fileInput.Write(junk, 1, count);
            }
            exitCode = cppOutput.GetExitCode();
            delete cppOutput;

            fileInput.Seek(0, start);

   #ifdef _DEBUG
            // SetYydebug(true);
   #endif

            // Predeclare all classes
            {
               char symFile[MAX_FILENAME];
               char symLocation[MAX_LOCATION];
               ImportedModule module, next;

               strcpy(symFile, sourceFileName);
               ChangeExtension(symFile, "sym", symFile);

               strcpy(symLocation, GetSymbolsDir());
               PathCat(symLocation, symFile);

               // LoadSymbols(symLocation, normalImport, true);
               LoadSymbols(symLocation, preDeclImport, false);

               for(module = ::defines.first; module; module = next)
               {
                  next = module.next;
                  if(module.type == moduleDefinition && strcmpi(module.name, mainModuleName))
                  {
                     delete module.name;
                     ::defines.Delete(module);
                  }
               }

               if(!GetEcereImported() && !GetBuildingEcereCom())
                  eModule_LoadStrict(privateModule, "ecereCOM", publicAccess /*privateAccess*/);
            }

            ParseEc();

            CheckDataRedefinitions();

            SetYydebug(false);
            SetCurrentNameSpace(null);
            SetDefaultNameSpace(null);
            SetDeclMode(privateAccess);

            delete fileInput;
            SetFileInput(null);

            ast = GetAST();

            if(/*ast && !parseError*/ /*&& */!exitCode)
            {
               ProcessDBTableDefinitions();

               // *** PASS 0 - Register all classes, methods, properties and members ***
               // ***          Build the constructors, destructors, properties as    ***
               // ***          class functions                                       ***
               PrePreProcessClassDefinitions();
               ComputeModuleClasses(privateModule);
               PreProcessClassDefinitions();

               // For classes defined in this module...
               ComputeModuleClasses(privateModule);


               // *** PASS 1 - Turn the class functions into functions               ***
               // *** Write the RegisterModule (Register classes)                    ***
               ProcessClassDefinitions();

               // *** PASS 1.5 - Replace members by this.member, figure out types, do type checking / conversions
               ComputeDataTypes();

               // *** PASS 1.6 - Replace instantiations
               ProcessInstantiations();

               // *** PASS 2 - Replace Member Access ***
               ProcessMemberAccess();

               // *** PASS 3 - Replace pointers to objects by "Instance *" ***
               ProcessInstanceDeclarations();

               strcpy(impFile, GetSymbolsDir());
               PathCat(impFile, sourceFileName);
               ChangeExtension(impFile, "imp", impFile);
               if(imports.first)
                  OutputImports(impFile);
               // For now use precomp to generate sym file only...

               if(/*!strcmp(targetExt, "c") && */!this.exitCode)
               {
                  File output = FileOpen(GetOutputFile(), write);
                  if(output)
                  {
                     output.Printf("/* Code generated from eC source file: %s */\n", sourceFileName);
                     output.Printf("#if defined(_WIN32)\n");
                     output.Printf("#define __runtimePlatform 1\n");
                     output.Printf("#elif defined(__APPLE__)\n");
                     output.Printf("#define __runtimePlatform 3\n");
                     output.Printf("#else\n");
                     output.Printf("#define __runtimePlatform 2\n");
                     output.Printf("#endif\n");

                     output.Printf("#if defined(__GNUC__)\n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                        output.Printf("#ifndef _WIN32\n");
                           output.Printf("#define __declspec(x)\n");
                        output.Printf("#endif\n");
                     output.Printf("#elif defined(__TINYC__)\n");
                        output.Printf("#include <stdarg.h>\n");
                        output.Printf("#define __builtin_va_list va_list\n");
                        output.Printf("#define __builtin_va_start va_start\n");
                        output.Printf("#define __builtin_va_end va_end\n");
                        output.Printf("#ifdef _WIN32\n");
                           output.Printf("#define strcasecmp stricmp\n");
                           output.Printf("#define strncasecmp strnicmp\n");
                           output.Printf("#define __declspec(x) __attribute__((x))\n");
                        output.Printf("#else\n");
                           output.Printf("#define __declspec(x)\n");
                        output.Printf("#endif\n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                     output.Printf("#else\n");
                        output.Printf("typedef __int64 int64;\n");
                        output.Printf("typedef unsigned __int64 uint64;\n");
                     output.Printf("#endif\n");
                     output.Printf("#ifdef __BIG_ENDIAN__\n");
                        output.Printf("#define __ENDIAN_PAD(x) (8 - (x))\n");
                     output.Printf("#else\n");
                        output.Printf("#define __ENDIAN_PAD(x) 0\n");
                     output.Printf("#endif\n");

                     output.Printf("#if defined(_WIN32)\n");
                     output.Printf("#   if defined(__GNUC__) || defined(__TINYC__)\n");
                     output.Printf("#      define ecere_stdcall __attribute__((__stdcall__))\n");
                     output.Printf("#      define ecere_gcc_struct __attribute__((gcc_struct))\n");
                     output.Printf("#   else\n");
                     output.Printf("#      define ecere_stdcall __stdcall\n");
                     output.Printf("#      define ecere_gcc_struct\n");
                     output.Printf("#   endif\n");
                     output.Printf("#else\n");
                     output.Printf("#   define ecere_stdcall\n");
                     output.Printf("#   define ecere_gcc_struct\n");
                     output.Printf("#endif\n");

                     if(buildingBootStrap)
                     {
                        //output.Printf("#ifdef __MINGW32__\n");
                        //output.Printf("#ifdef _WIN64\n");
                        /*
                        output.Printf("#if defined(_WIN64) || WORDSIZE == 64\n");
                        output.Printf("typedef unsigned long long int uintptr_t;\n");
                        output.Printf("typedef long long int intptr_t;\n");
                        output.Printf("#else\n");
                        output.Printf("typedef unsigned int uintptr_t;\n");
                        output.Printf("typedef int intptr_t;\n");
                        output.Printf("#endif\n");
                        */
                        //output.Printf("#else\n");
                        output.Printf("#include <stdint.h>\n");
                        output.Printf("#include <sys/types.h>\n");
                        //output.Printf("#endif\n");
                     }

                     // NOTE: If anything is changed up there, the start outputLine must be updated in libec's output.c or Debugging lines will be wrong

                     if(ast)
                        OutputTree(ast, output);
                     delete output;
                  }
               }
               /*
               else if(!strcmp(targetExt, "o"))
               {
                  // Compile right away
                  File output = FileOpen(GetOutputFile(), Write);
                  output.Printf("#include <ecereCOM.h>\n\n");
                  OutputTree(ast, output);
                  delete output;
               }*/
            }
            else
               this.exitCode = exitCode;

            if(ast)
            {
               FreeASTTree(ast);
            }
         }
         else
         {
            this.exitCode = 1;
            PrintLn("(ecc) error: failed to execute C preprocessor");
         }

         FreeContext(globalContext);
         FreeExcludedSymbols(_excludedSymbols);

         ::defines.Free(FreeModuleDefine);
         imports.Free(FreeModuleImport);

         FreeTypeData(privateModule);
         FreeIncludeFiles();
         FreeGlobalData(globalData);

         delete privateModule;
      }

      delete cppCommand;
      delete cppOptions;

      /*for(c = 0; c<argc; c++)
         delete argv[c];
      delete argv;
      */
      SetSymbolsDir(null); // Free symbols dir

      OutputIntlStrings();

#if 0 //defined(_DEBUG) && defined(__WIN32__)
      PrintLn("Done.");
      if(exitCode || GetNumWarnings())
         getch();
#endif
   }
}
