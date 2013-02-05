#ifdef ECERE_STATIC
import static "ecere"
import static "ec"
#else
import "ecere"
import "ec"
#endif

#include <stdarg.h>

static Context globalContext { };
static Module privateModule;
static ModuleImport mainModule;
static OldList _excludedSymbols { offset = (uint)&((Symbol)0).left }; 
static OldList defines, imports;
static NameSpace globalData
{
   classes.CompareKey = (void *)BinaryTree::CompareString;
   defines.CompareKey = (void *)BinaryTree::CompareString;
   functions.CompareKey = (void *)BinaryTree::CompareString;
   nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
};
static OldList _precompDefines;

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

      Platform targetPlatform = GetRuntimePlatform();
      int targetBits = (sizeof(uintptr) == 8) ? 64 : 32;

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

      for(c = 1; c<argc; c++)
      {
         char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
            {
#if defined(__WIN32__)
               if(strcmp(arg + 1, "m64"))    // Until we set up MinGW-w64
#endif
               {
                  int argLen = strlen(arg);
                  int newLen = cppOptionsLen + 1 + argLen;
                  cppOptions = renew cppOptions char[newLen + 1];
                  cppOptions[cppOptionsLen] = ' ';
                  strcpy(cppOptions + cppOptionsLen + 1, arg);
                  cppOptionsLen = newLen;
               }
               targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
            }
            else if(arg[1] == 'D')
            {
               int argLen = strlen(arg);
               int newLen = cppOptionsLen + 1 + argLen;
               cppOptions = renew cppOptions char[newLen + 1];
               cppOptions[cppOptionsLen] = ' ';
               strcpy(cppOptions + cppOptionsLen + 1, arg); 
               cppOptionsLen = newLen;
               if(!strcmp(arg, "-DBUILDING_ECERE_COM"))
                  SetBuildingEcereCom(true);
               else if(!strcmp(arg, "-DECERE_COM_MODULE"))
                  SetBuildingEcereComModule(true);
            }
            else if(arg[1] == 'I')
            {
               int argLen = strlen(arg);
               int newLen = cppOptionsLen + argLen + 3;
               cppOptions = renew cppOptions char[newLen + 1];
               cppOptions[cppOptionsLen] = ' ';
               cppOptions[cppOptionsLen+1] = '-';
               cppOptions[cppOptionsLen+2] = 'I';
               cppOptions[cppOptionsLen+3] = '"';
               strcpy(cppOptions + cppOptionsLen + 4, arg+2); 
               cppOptions[newLen-1] = '\"';
               cppOptions[newLen] = '\0';
               cppOptionsLen = newLen;
            }
            else if(!strcmp(arg+1, "t"))
            {
               if(++c < argc)
                  targetPlatform = argv[c];
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
            else if(!strcmp(arg+1, "isystem") || !strcmp(arg+1, "isysroot"))
            {
               if(c + 1 < argc)
               {
                  int argLen = strlen(arg);
                  int arg1Len = strlen(argv[c+1]);
                  int newLen = cppOptionsLen + argLen + arg1Len + 4;
                  cppOptions = renew cppOptions char[newLen + 1];
                  cppOptions[cppOptionsLen] = ' ';
                  strcpy(cppOptions + cppOptionsLen + 1, arg); 
                  cppOptions[cppOptionsLen+argLen+1] = ' ';
                  cppOptions[cppOptionsLen+argLen+2] = '"';
                  arg = argv[++c];
                  strcpy(cppOptions + cppOptionsLen + argLen + 3, arg); 
                  cppOptions[newLen-1] = '\"';
                  cppOptions[newLen] = '\0';
                  cppOptionsLen = newLen;
               }
               else
                  valid = false;
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
         printf($"Syntax:\n   ecc [-t <target platform>] [-cpp <c preprocessor>] [-o <output>] [-symbols <outputdir>] [-I<includedir>]* [-isystem <sysincludedir>]* [-D<definition>]* -c <input>\n");
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

         privateModule = (Module)__ecere_COM_Initialize(true | ((targetBits == 64)?2:0), 1, null);
         SetPrivateModule(privateModule);

         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint64"), type = ProcessTypeString("unsigned int64", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint32"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint16"), type = ProcessTypeString("unsigned short", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("byte"), type = ProcessTypeString("unsigned char", false) });

         {
            GlobalData data { fullName = CopyString("__thisModule"), dataTypeString = CopyString("Module"), module = privateModule };
            data.key = (uintptr)data.fullName;
            globalData.functions.Add((BTNode)data);
         }

         snprintf(command, sizeof(command), "%s%s -x c -E \"%s\"", cppCommand, cppOptions ? cppOptions : "", GetSourceFile());
         command[sizeof(command)-1] = 0;
         if((cppOutput = DualPipeOpen({ output = true }, command)))
         {
            char impFile[MAX_LOCATION];
            ImportedModule module;
            char mainModuleName[MAX_FILENAME];
            int exitCode;
            OldList * ast;

            TempFile fileInput { };
            SetFileInput(fileInput);

            imports.Add((mainModule = ModuleImport { }));
            SetMainModule(mainModule);

            GetLastDirectory(GetSourceFile(), mainModuleName);

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
               int count = cppOutput.Read(junk, 1, 4096);
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

               GetLastDirectory(GetSourceFile(), symFile);
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

            if(/*ast /*&& !parseError*/ /*&& */!exitCode)
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
               {
                  char fileName[MAX_FILENAME];
                  GetLastDirectory(GetSourceFile(), fileName);
                  PathCat(impFile, fileName);
                  ChangeExtension(impFile, "imp", impFile);
               }
               if(imports.first)
                  OutputImports(impFile);
               // For now use precomp to generate sym file only...

               if(/*!strcmp(targetExt, "c") && */!this.exitCode)
               {
                  File output = FileOpen(GetOutputFile(), write);
                  if(output)
                  {
                     //output.Printf("#include <ecereCOM.h>\n\n");

                     // Temporary patch, fix with defines or something...
                     /*
                     if(!strstr(GetSourceFile(), "instance.ec"))
                     {
                        output.Printf("#if defined(__GNUC__) && defined(__WIN32__)\n");
                        output.Printf("#include <x87inline.h>\n");
                        output.Printf("#endif\n");
                     }
                     */
                     /*output.Printf("#if defined(__GNUC__) \n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                     output.Printf("#else\n");
                        output.Printf("typedef __int64 int64;\n");
                        output.Printf("typedef unsigned __int64 uint64;\n");
                     output.Printf("#endif\n");*/
                     output.Printf("#if defined(__GNUC__)\n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                     output.Printf("#elif defined(__TINYC__)\n");
                        output.Printf("#include <stdarg.h>\n");
                        output.Printf("#define __builtin_va_list va_list\n");
                        output.Printf("#define __builtin_va_start va_start\n");
                        output.Printf("#define __builtin_va_end va_end\n");
                        output.Printf("#ifdef _WIN32\n");
                           output.Printf("#define strcasecmp stricmp\n");
                           output.Printf("#define strncasecmp strnicmp\n");
                           output.Printf("#define __declspec(x) __attribute__((x))\n");
                        output.Printf("#endif\n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                     output.Printf("#else\n");
                        output.Printf("typedef __int64 int64;\n");
                        output.Printf("typedef unsigned __int64 uint64;\n");
                     output.Printf("#endif\n");
                     /*output.Printf("#if defined(__GNUC__) || defined(__TINYC__)\n");
                        output.Printf("typedef long long int64;\n");
                        output.Printf("typedef unsigned long long uint64;\n");
                     output.Printf("#elif defined(__TINYC__)\n");
                     output.Printf("#else\n");
                        output.Printf("typedef __int64 int64;\n");
                        output.Printf("typedef unsigned __int64 uint64;\n");
                     output.Printf("#endif\n");*/
                     output.Printf("#ifdef __BIG_ENDIAN__\n");
                        output.Printf("#define __ENDIAN_PAD(x) (8 - (x))\n");
                     output.Printf("#else\n");
                        output.Printf("#define __ENDIAN_PAD(x) 0\n");
                     output.Printf("#endif\n");
                     output.Printf("#include <stdint.h>\n");

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

#if defined(_DEBUG) && defined(__WIN32__)
      if(exitCode || GetNumWarnings())
         getch();
#endif
   }
}
