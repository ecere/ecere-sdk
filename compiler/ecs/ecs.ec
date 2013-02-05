#ifdef ECERE_STATIC
import static "ecere"
import static "ec"
#else
import "ecere"
import "ec"
#endif

static define localeDir = "locale";
static bool i18n;

static Platform targetPlatform;
static int targetBits;

static bool isConsole;
static bool isDynamicLibrary;
static bool isStaticLibrary;
static OldList modules;
static File dcomSymbols;

static OldList _defines { };
static OldList _imports { };
static OldList _excludedSymbols { offset = (uint)&((Symbol)0).left };
static NameSpace globalData
{
   classes.CompareKey = (void *)BinaryTree::CompareString;
   defines.CompareKey = (void *)BinaryTree::CompareString;
   functions.CompareKey = (void *)BinaryTree::CompareString;
   nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
};
static Context theGlobalContext { };
static ModuleImport mainModule;
static Module privateModule;

static char mainModuleName[MAX_LOCATION];
static char projectName[MAX_LOCATION];
static void LoadImports(char * fileName)
{
   File f = FileOpen(fileName, read);
   if(f)
   {
      for(;;)
      {
         char line[1024];
         if(!f.GetLine(line, sizeof(line))) break;
         TrimLSpaces(line, line);

         if(line[0] == '[')
         {
            if(!strcmp(line, "[Imported Modules]"))
            {
               ModuleImport module = null;
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;

                  if(line[0] == '[')
                  {
                     ClassImport _class = null;
                     FunctionImport function = null;
                     
                     if(!strcmp(line, "[This]"))
                     {
                        if((mainModule = GetMainModule()))
                           module = mainModule;
                        else
                        {
                           mainModule = ModuleImport { };
                           SetMainModule(mainModule);
                           module = mainModule;
                           _imports.AddName(module);
                        }
                     }
                     else if(!strcmp(line, "[Static]"))
                     {
                        module.importType = staticImport;
                     }
                     else if(!strcmp(line, "[Remote]"))
                     {
                        module.importType = remoteImport;
                     }
                     else if(!strcmp(line, "[Private]"))
                     {
                        if(module.importAccess != publicAccess)
                           module.importAccess = privateAccess;
                     }
                     else if(!strcmp(line, "[Public]"))
                     {
                        module.importAccess = publicAccess;
                     }
                     else if(!strcmp(line, "[Imported Classes]"))
                     {
                        for(;;)
                        {
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;

                           if(line[0] == '[')
                           {
                              if(!strcmp(line, "[Instantiated]"))
                              {
                                 _class.itself = true;
                              }
                              else if(!strcmp(line, "[Remote]"))
                              {
                                 _class.isRemote = 1;
                              }
                              else if(!strcmp(line, "[Imported Methods]"))
                              {
                                 MethodImport method = null;
                                 for(;;)
                                 {
                                    if(!f.GetLine(line, sizeof(line))) break;
                                    TrimLSpaces(line, line);
                                    if(!strcmp(line, ".")) break;
                                    if(line[0] != '[')
                                    {
                                       if(!(method = _class.methods.FindName(line, false)))
                                       {
                                          method = MethodImport { name = CopyString(line) };
                                          _class.methods.AddName(method);
                                       }
                                    }
                                    else if(!strcmp(line, "[Virtual]"))
                                       method.isVirtual = true;

                                 }
                              }
                              else if(!strcmp(line, "[Imported Properties]"))
                              {
                                 PropertyImport prop = null;
                                 for(;;)
                                 {
                                    if(!f.GetLine(line, sizeof(line))) break;
                                    TrimLSpaces(line, line);
                                    if(!strcmp(line, ".")) break;
                                    if(line[0] != '[')
                                    {
                                       if(!(prop = _class.properties.FindName(line, false)))
                                       {
                                          prop = PropertyImport { name = CopyString(line) };
                                          _class.properties.AddName(prop);
                                       }
                                    }
                                    else if(!strcmp(line, "[Set]"))
                                          prop.hasSet = true;
                                    else if(!strcmp(line, "[Get]"))
                                       prop.hasGet = true;
                                    else if(!strcmp(line, "[Virtual]"))
                                       prop.isVirtual = true;
                                 }
                              }
                           }
                           else
                           {
                              if(!(_class = module.classes.FindName(line, false)))
                              {
                                 _class = ClassImport { name = CopyString(line) };
                                 module.classes.AddName(_class); 
                              }
                           }
                        }
                     }
                     else if(!strcmp(line, "[Imported Functions]"))
                     {
                        for(;;)
                        {
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;

                           if(line[0] == '[')
                           {
                           }
                           else
                           {
                              if(!(function = module.functions.FindName(line, false)))
                              {
                                 function = FunctionImport { name = CopyString(line) };
                                 module.functions.AddName(function);
                              }
                           }
                        }
                     }
                  }
                  else
                  {
                     if(!(module = _imports.FindName(line, false)))
                     {
                        if(!strcmp(line, "ecereCOM"))
                        {
                           module = _imports.FindName("ecere", false);
                        }
                        else if(!strcmp(line, "ecere"))
                        {
                           module = _imports.FindName("ecereCOM", false);
                           if(module)
                           {
                              delete module.name;
                              module.name = CopyString("ecere");
                           }
                        }
                        if(!module)
                        {
                           module = ModuleImport { name = CopyString(line) };
                           _imports.AddName(module);
                        }
                     }
                  }
               }
            }
         }
      }
      delete f;
   }
}

// static Class applicationClass;
static Class thisAppClass;

class ModuleInfo : struct
{
   ModuleInfo prev, next;
   char * name;
   bool globalInstance;
};

/* OBSOLETE
static bool SeardchModuleName(Module searchIn, char * name)
{
   SubModule subModule;
   
   if(searchIn.name && !strcmp(searchIn.name, name))
      return true;

   for(subModule = searchIn.modules.first; subModule; subModule = subModule.next)
   {
      if(SearchModuleName(subModule.module, name))
         return true;
   }
   return false;
}
*/
static void WriteMain(char * fileName)
{
   File f = FileOpen(fileName, write);
   if(f)
   {
      ModuleImport module;
      ModuleInfo defModule;
      bool nonInst = false, anyMethod = false, anyProp = false, anyFunction = false;
      ImportedModule importedModule;
      
      GetLastDirectory(fileName, mainModuleName);
      StripExtension(mainModuleName);
      if(!projectName[0])
      {
         strcpy(projectName, mainModuleName);
         StripExtension(projectName);
      }
      ChangeCh(mainModuleName, '.', '_');
      ChangeCh(mainModuleName, '-', '_');
      ChangeCh(mainModuleName, ' ', '_');

      if(targetPlatform == win32 && !isConsole && !isStaticLibrary && !isDynamicLibrary)
      {
         //f.Puts("#include <windows.h>\n\n");

         f.Puts("typedef void * HINSTANCE;\n");
         f.Puts("#define WINAPI __stdcall\n");
      }

      for(importedModule = ::_defines.first; importedModule; importedModule = importedModule.next)
      {
         if(importedModule.type == moduleDefinition)
         {
            f.Printf("import ");
            if(importedModule.importType == staticImport)
               f.Printf("static ", importedModule.name);
            f.Printf("\"%s\"\n", importedModule.name);
         }
      }

      f.Puts("default:\n");
      f.Puts("static Module __currentModule;\n\n");

      if(!isStaticLibrary)
         f.Puts("Module __thisModule;\n\n");

      // TOCHECK: Problem compiling Scrabble.main.ec when binding Client first
      BindDCOMServer();
      BindDCOMClient();

      if(dcomSymbols)
         f.Printf("void __ecereRegisterModule_%s(Module module);\n\n", mainModuleName);

      for(module = _imports.first; module; module = module.next)
      {
         ClassImport _class;
         FunctionImport function;
         if(module.importType == staticImport)
         {
            /*if(targetPlatform == win32)
            {
               f.Printf("bool __stdcall __ecereDll_Load_%s(Module module);\n", module.name);
               f.Printf("bool __stdcall __ecereDll_Unload_%s(Module module);\n", module.name);
            }
            else*/
            {
               f.Printf("bool __ecereDll_Load_%s(Module module);\n", module.name);
               f.Printf("bool __ecereDll_Unload_%s(Module module);\n", module.name);
            }
         }
         for(_class = module.classes.first; _class; _class = _class.next)
         {
            MethodImport method;
            PropertyImport prop;
            char className[1024] = "";
            Class regClass = eSystem_FindClass(privateModule, _class.name);

            FullClassNameCat(className, _class.name, true);
            MangleClassName(className);

            if(_class.itself)
               f.Printf("Class __ecereClass_%s;\n", className);
            else
               nonInst = true;
            //if(!_class.isRemote)
            {
               //if(strcmp(_class.name, "SerialBuffer"))
               {
                  for(method = _class.methods.first; method; method = method.next)
                  {
                     Method meth = eClass_FindMethod(regClass, method.name, privateModule);
                     if(meth && !meth.dataType)
                     {
                        Context context = SetupTemplatesContext(regClass);
                        meth.dataType = ProcessTypeString(meth.dataTypeString, false);
                        FinishTemplatesContext(context);
                     }

                     if(method.isVirtual)
                        f.Printf("int __ecereVMethodID_%s_%s;\n", className, method.name);
                     else if(module.name && module.importType != staticImport && (!meth || !meth.dataType.dllExport))
                     {
                        /*char name[4096];
                        
                        Type type
                        {
                           kind = TypePointer,
                           type = method.
                        };
                        type.refCount++;
                        sprintf(name, "__ecereMethod_%s_%s", className, method.name);
                        PrintType(type, name, true);
                        f.Printf("%s;\n", name);
                        delete type;
                        */
                        //f.Printf("void * __ecereMethod_%s_%s;\n", className, method.name);

                        f.Printf("int (*__ecereMethod_%s_%s)();\n", className, method.name);
                     }

                     anyMethod = true;
                  }
               }

               for(prop = _class.properties.first; prop; prop = prop.next)
               {
                  char propName[1024];
                  propName[0] = 0;
                  FullClassNameCat(propName, prop.name, true);
                  // strcpy(propName, prop.name);
                  MangleClassName(propName);

                  if(module.name && module.importType != staticImport)
                  {
                     if(prop.hasSet)
                        f.Printf("void * __ecereProp_%s_Set_%s;\n", className, propName);
                     if(prop.hasGet)
                        f.Printf("void * __ecereProp_%s_Get_%s;\n", className, propName);
                  }
                  f.Printf("Property __ecereProp_%s_%s;\n", className, propName);
                  anyProp = true;
               }
            }
         }
         for(function = module.functions.first; function; function = function.next)
         {
            GlobalFunction func = eSystem_FindFunction(privateModule, function.name);
            if(func && !func.dataType)
               func.dataType = ProcessTypeString(func.dataTypeString, false);

            if(module.name && module.importType != staticImport && (!func || !func.dataType || !func.dataType.dllExport))
            {
               char functionName[1024];
               functionName[0] = 0;
               FullClassNameCat(functionName, function.name, false);
               f.Printf("void * __ecereFunction_%s;\n", functionName);
               anyFunction = true;
            }
         }
      }

      for(defModule = ::modules.first; defModule; defModule = defModule.next)
      {
         char moduleName[1024];
         strcpy(moduleName, defModule.name);
         ChangeCh(moduleName, ' ', '_');
         ChangeCh(moduleName, '-', '_');
         ChangeCh(moduleName, '.', '_');

         f.Printf("void __ecereRegisterModule_%s(Module module);\n", moduleName);
         f.Printf("void __ecereUnregisterModule_%s(Module module);\n", moduleName);
         if(defModule.globalInstance)
         {
            f.Printf("void __ecereCreateModuleInstances_%s();\n", moduleName);
            f.Printf("void __ecereDestroyModuleInstances_%s();\n", moduleName);
         }
      }

      // DCOM Stuff
      if(dcomSymbols)
      {
         f.Printf("\n");

         // Insert DCOM bindings here
         dcomSymbols.Seek(0, start);
         while(!dcomSymbols.Eof())
         {
            char buffer[4096];
            int read = dcomSymbols.Read(buffer, 1, sizeof(buffer));
            if(!read) break;
            f.Write(buffer, 1, read);
         }
         f.Printf("\n");
      }

      // Main Function

      if(isStaticLibrary)
      {
         /*if(targetPlatform == win32)
            f.Printf("\nbool __stdcall __ecereDll_Load_%s(Module module)\n{\n", projectName);
         else*/
            f.Printf("\nbool __ecereDll_Load_%s(Module module)\n{\n", projectName);
      }
      else if(isDynamicLibrary)
      {
         if(targetPlatform == win32)
            f.Puts("\ndllexport bool __stdcall __ecereDll_Load(Module module)\n{\n");
         else
            f.Puts("\ndllexport bool __ecereDll_Load(Module module)\n{\n");
      }
      else if(targetPlatform == win32 && !isConsole)
      {
         f.Puts("\nint WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInst, char * cmdLine, int show)\n{\n");
      }
      else
         f.Puts("\nint main(int _argc, char * _argv[])\n{\n");

      if(!isDynamicLibrary)
      {
         f.Puts("   int exitCode;\n");
         f.Puts("   Module module;\n");
      }

      //if(nonInst || thisAppClass)    // We use it all the time to get "Application" for the exit code now...
         f.Puts("   Class _class;\n");

      if(anyMethod)
         f.Puts("   Method method;\n");
      if(anyProp)
         f.Puts("   Property _property;\n");
      if(anyFunction)
         f.Puts("   GlobalFunction function;\n");
      
      f.Puts("\n");

      if(isDynamicLibrary)
      {
         f.Puts("   if(!__currentModule)\n");
         f.Puts("   {\n");
         f.Puts("      __currentModule = module;\n");
         if(!isStaticLibrary)
            f.Puts("      __thisModule = module;\n");
         f.Puts("   }\n\n");
      }
      else if(targetPlatform == win32 && !isConsole)
         f.Puts("   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, 0, null);\n\n");
      else
         f.Puts("   __thisModule = __currentModule = module = __ecere_COM_Initialize(1, _argc, (void *)_argv);\n\n");

      // First load all modules
      if(_imports.count)
      {
         for(module = _imports.first; module; module = module.next)
         {
            if(module.name)
            {
               //if(strcmp(module.name, "ecereCOM") && strcmp(module.name, "ecere") )
               {
                  if(module.importType == staticImport)
                     f.Printf("   eModule_LoadStatic(module, \"%s\", %s, __ecereDll_Load_%s, __ecereDll_Unload_%s);\n", module.name, (module.importAccess == privateAccess) ? "privateAccess" : "publicAccess", module.name,module.name);
                  else
                     f.Printf("   eModule_Load(module, \"%s\", %s);\n", module.name, (module.importAccess == privateAccess) ? "privateAccess" : "publicAccess");
               }
            }
         }
         f.Printf("\n");
      }

      // Then define the classes
      if(::modules.count)
      {
         for(defModule = ::modules.first; defModule; defModule = defModule.next)
         {
            char moduleName[1024];
            strcpy(moduleName, defModule.name);
            ChangeCh(moduleName, ' ', '_');
            ChangeCh(moduleName, '-', '_');
            ChangeCh(moduleName, '.', '_');

            f.Printf("   __ecereRegisterModule_%s(module);\n", moduleName);
         }
         f.Printf("\n");
      }

      // Register Remote Modules
      if(dcomSymbols)
      {
         f.Printf("   __ecereRegisterModule_%s(module);\n\n", mainModuleName);
         delete dcomSymbols;
      }

      if(isDynamicLibrary)
      {
         f.Puts("   if(__currentModule == module)\n");
         f.Puts("   {\n");
      }
      // Then load the imports
      for(module = _imports.first; module; module = module.next)
      {
         ClassImport _class;
         FunctionImport function;
         if(module.classes.count)
         {
            for(_class = module.classes.first; _class; _class = _class.next)
            {
               Class regClass = eSystem_FindClass(privateModule, _class.name);

               //if(!_class.isRemote)
               {
                  MethodImport method;
                  PropertyImport prop;
                  char classID[1024];
                  char className[1024] = "";
                  FullClassNameCat(className, _class.name, true);
                  MangleClassName(className);
            
                  if(_class.itself)
                     sprintf(classID, "__ecereClass_%s", className);
                  else
                     strcpy(classID, "_class");
            
                  if(isDynamicLibrary && !isStaticLibrary)
                     f.Printf("   %s = eSystem_FindClass(__currentModule, \"%s\");\n", classID, _class.name);
                  else
                     f.Printf("   %s = eSystem_FindClass(module, \"%s\");\n", classID, _class.name);

                  for(method = _class.methods.first; method; method = method.next)
                  {
                     Method meth = eClass_FindMethod(regClass, method.name, privateModule);
                     if(!meth || !meth.dataType.dllExport)
                     {
                        if(method.isVirtual || (module.name && module.importType != staticImport))
                        {
                           f.Printf("   method = eClass_FindMethod(%s, \"%s\", module);\n", 
                              classID, method.name);
                           if(method.isVirtual)
                              f.Printf("   if(method) __ecereVMethodID_%s_%s = method.vid;\n", className, method.name);
                           else
                              f.Printf("   if(method) __ecereMethod_%s_%s = method.function;\n", className, method.name);
                        }
                     }
                  }

                  for(prop = _class.properties.first; prop; prop = prop.next)
                  {
                     char propName[1024];
                     propName[0] = 0;
                     FullClassNameCat(propName, prop.name, true);
                     // strcpy(propName, prop.name);
                     MangleClassName(propName);

                     f.Printf("   __ecereProp_%s_%s = _property = eClass_FindProperty(%s, \"%s\", module);\n", 
                        className, propName, classID, prop.name);

                     if(module.name && module.importType != staticImport)
                     {
                        if(prop.hasSet)
                           f.Printf("   __ecereProp_%s_Set_%s = _property.Set;\n", className, propName);
                        if(prop.hasGet)
                           f.Printf("   __ecereProp_%s_Get_%s = _property.Get;\n", className, propName);
                     }
                  }
                  f.Printf("\n");
               }
            }
         }
         if(module.functions.count)
         {
            for(function = module.functions.first; function; function = function.next)
            {
               GlobalFunction func = eSystem_FindFunction(privateModule, function.name);
               if(module.name && module.importType != staticImport && (!func || !func.dataType || !func.dataType.dllExport))
               {
                  char functionName[1024];
                  functionName[0] = 0;
                  FullClassNameCat(functionName, function.name, false);

                  if(isDynamicLibrary && !isStaticLibrary)
                     f.Printf("   function = eSystem_FindFunction(__currentModule, \"%s\");\n", function.name);
                  else
                     f.Printf("   function = eSystem_FindFunction(module, \"%s\");\n", function.name);

                  f.Printf("   if(function) __ecereFunction_%s = function.function;\n", functionName);
                  f.Printf("\n");
               }
            }
            f.Printf("\n");
         }
      }

      for(defModule = ::modules.first; defModule; defModule = defModule.next)
         if(defModule.globalInstance)
         {
            if(!strcmp(defModule.name, "i18n"))
               f.Printf("   __ecereCreateModuleInstances_i18n();\n");
         }
      if(i18n)
         f.Printf("      LoadTranslatedStrings(module, \"%s\");\n", projectName);
      if(isDynamicLibrary)
      {
         //f.Printf("   module._vTbl[10](module);\n");
         f.Puts("   }\n");
      }

      if(!isDynamicLibrary && thisAppClass)
      {
         f.Printf("   _class = eSystem_FindClass(__currentModule, \"%s\");\n", thisAppClass.name);
         f.Printf("   eInstance_Evolve((Instance *)&__currentModule, _class);\n");
         f.Printf("   __thisModule = __currentModule;\n");
      }

      if(isDynamicLibrary)
      {
         f.Puts("   if(__currentModule == module)\n");
         f.Puts("   {\n");
      }

      // Then check if there's any global instances to create
      if(::modules.count)
      {
         for(defModule = ::modules.first; defModule; defModule = defModule.next)
            if(defModule.globalInstance)
            {
               char moduleName[1024];
               if(!strcmp(defModule.name, "i18n")) continue;
               strcpy(moduleName, defModule.name);
               ChangeCh(moduleName, ' ', '_');
               ChangeCh(moduleName, '-', '_');
               ChangeCh(moduleName, '.', '_');

               f.Printf("   __ecereCreateModuleInstances_%s();\n", moduleName);
            }

         f.Printf("\n");
      }

      if(isDynamicLibrary)
      {
         f.Puts("   }\n");
      }
      if(!isDynamicLibrary && thisAppClass)
      {
         f.Printf("   __currentModule._vTbl[12](__currentModule);\n");
      }

      if(isDynamicLibrary)
      {
         f.Puts("   return true;\n");
         f.Puts("}\n");
         if(isStaticLibrary)
         {
            /*if(targetPlatform == win32)
               f.Printf("\nbool __stdcall __ecereDll_Unload_%s(Module module)\n{\n", projectName);
            else*/
               f.Printf("\nbool __ecereDll_Unload_%s(Module module)\n{\n", projectName);
         }
         else
         {
            if(targetPlatform == win32)
               f.Puts("\ndllexport bool __stdcall __ecereDll_Unload(Module module)\n{\n");
            else
               f.Puts("\ndllexport bool __ecereDll_Unload(Module module)\n{\n");
         }
      }

      if(isDynamicLibrary)
      {
         f.Puts("   if(__currentModule == module)\n");
         f.Puts("   {\n");
      }
      // Then check if there's any global instances to destroy
      {
         bool destroyI18n = false;
         if(::modules.count)
         {
            for(defModule = ::modules.first; defModule; defModule = defModule.next)
               if(defModule.globalInstance)
               {
                  char moduleName[1024];
                  if(!strcmp(defModule.name, "i18n")) { destroyI18n = true; continue; }
                  strcpy(moduleName, defModule.name);
                  ChangeCh(moduleName, ' ', '_');
                  ChangeCh(moduleName, '-', '_');
                  ChangeCh(moduleName, '.', '_');
                  f.Printf("   __ecereDestroyModuleInstances_%s();\n", moduleName);
               }

            f.Printf("\n");
         }
         if(i18n)
            f.Printf("   UnloadTranslatedStrings(__currentModule);\n");
         if(destroyI18n)
            f.Printf("   __ecereDestroyModuleInstances_i18n();\n");
      }
      if(isDynamicLibrary)
      {
         f.Puts("   }\n");

         if(isDynamicLibrary)
         {
            //f.Printf("   module._vTbl[11](module);\n");
         }

         if(::modules.count)
         {
            for(defModule = ::modules.first; defModule; defModule = defModule.next)
            {
               char moduleName[1024];
               strcpy(moduleName, defModule.name);
               ChangeCh(moduleName, ' ', '_');
               ChangeCh(moduleName, '-', '_');
               ChangeCh(moduleName, '.', '_');
               f.Printf("   __ecereUnregisterModule_%s(module);\n", moduleName);
            }
            f.Printf("\n");
         }
         f.Puts("   if(__currentModule == module)\n");
         f.Puts("      __currentModule = (void *)0;\n");
         if(!isStaticLibrary)
         {
            f.Puts("   if(__thisModule == module)\n");
            f.Puts("      __thisModule = (void *)0;\n");
         }
      }

      if(!isDynamicLibrary)
      {
         f.Puts(
            "\n"
            "   _class = eSystem_FindClass(__currentModule, \"ecere::com::Application\");\n"
            "   exitCode = ((ecere::com::Application)__currentModule).exitCode;\n"
            "   delete __currentModule;\n"
            "   return exitCode;\n");
      }
      else
         f.Puts("   return true;\n");
      f.Puts("}\n");
      eInstance_Delete(f);
   }
}

static Class FindAppClass(NameSpace * nameSpace, bool thisModule)
{
   BTNamedLink link;
   NameSpace * ns;
   for(link = (BTNamedLink)nameSpace->classes.first; link; link = (BTNamedLink)((BTNode)link).next)
   {
      Class _class = link.data;
      /*
      applicationClass = eSystem_FindClass(_class.module, "Application");
      if(_class != applicationClass && eClass_IsDerived(_class, applicationClass) && (!thisModule || _class.module == privateModule))
         return _class;
      */
      if(strcmp(_class.fullName, "ecere::com::Application") && (!thisModule || _class.module == privateModule))
      {
         Class base;
         for(base = _class.base; base && base.type != systemClass; base = base.base)
            if(!strcmp(base.fullName, "ecere::com::Application"))
               return _class;
      }
   }

   for(ns = (NameSpace *)nameSpace->nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
   {
      Class _class = FindAppClass(ns, thisModule);
      if(_class) // && _class != applicationClass)
         return _class;
   }
   return null; //applicationClass;
}

static Class SearchAppClass_Module(Module module)
{
   Class appClass;
   SubModule subModule;

   appClass = FindAppClass(module.publicNameSpace, false);
   if(appClass) return appClass;
   appClass = FindAppClass(module.privateNameSpace, false);
   if(appClass) return appClass;

   for(subModule = module.modules.first; subModule; subModule = subModule.next)
   {
      appClass = SearchAppClass_Module(subModule.module);
      if(appClass) return appClass;
   }
   return null;
}

static void BindDCOMClient()
{
   Class dcomClientObjectClass = eSystem_FindClass(privateModule, "ecere::net::DCOMClientObject");
   OldLink deriv;

   if(dcomClientObjectClass && dcomClientObjectClass.derivatives.first)
   {
      File f;
      if(!dcomSymbols) dcomSymbols = TempFile { };
      f = dcomSymbols;

      // CLIENT BINDINGS
      for(deriv = dcomClientObjectClass.derivatives.first; deriv; deriv = deriv.next)
      {
         Class _class = deriv.data;
         Method method, next;
         int id = 0;
         int vid;
         bool doVirtual;

         DeclareClass(FindClass("ecere::net::DCOMClientObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMClientObject");
         f.Printf("class %s : ecere::net::DCOMClientObject\n", _class.fullName);
         f.Printf("{\n");

         // CLIENT VIRTUAL METHODS BINDINGS
         if(_class.vTblSize > _class.base.vTblSize)
         {
            int vid;
            f.Printf("   virtual void CallVirtualMethod(uint __ecereMethodID, SerialBuffer __ecereBuffer)\n");
            f.Printf("   {\n");
            f.Printf("      switch(__ecereMethodID)\n");
            f.Printf("      {\n");

            for(vid = _class.base.vTblSize; vid < _class.vTblSize; vid++)
            {
               Method method;
               for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
               {
                  if(method.type == virtualMethod && method._class == _class && method.vid == vid)
                     break;
               }
               if(method)
               {
                  Type param;
                  method.dataType = ProcessTypeString(method.dataTypeString, false);
                  if(method.dataType && method.dataType.name)
                  {
                     f.Printf("         case %d:\n", vid - _class.base.vTblSize);
                     f.Printf("         {\n");
                     {
                        if(method.dataType.returnType.kind != voidType)
                        {
                           TypeName resultType;
                           OldList * specs = MkList();
                           Declarator decl;
                           char type[1024] = "";
                           char className[1024];
                           Symbol classSym;

                           if(method.dataType.returnType.kind == classType)
                              classSym = method.dataType.returnType._class; // VERIFY THIS FindClass(method.dataType.returnType._class.string);
                           else
                           {
                              PrintType(method.dataType.returnType, type, false, true);
                              classSym = FindClass(type);
                              type[0] = 0;
                           }
                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, classSym.string, true);
                           MangleClassName(className);
                           DeclareClass(classSym, className);

                           PrintType(method.dataType.returnType, type, true, true);

                           decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
                           resultType = MkTypeName(specs, decl);

                           f.Printf("            ");
                           OutputTypeName(resultType, f);
                           f.Printf(";\n");
                        }

                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           if(param.kind == classType && !strcmp(param._class.string, "String"))
                           {
                              // Hardcode 1024 chars max string for now
                              f.Printf("            char %s[1024];\n", param.name);
                              DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                              DeclareClass(FindClass("String"), "__ecereClass_String");
                           }
                           else
                           {
                              TypeName paramTypeName;
                              OldList * specs = MkList();
                              Declarator decl;
                              char type[1024] = "";
                              char className[1024];
                              Symbol classSym;

                              if(param.kind == classType)
                                 classSym = param._class; // VERIFY THIS FindClass(param._class.string);
                              else
                              {
                                 PrintType(param, type, false, true);
                                 classSym = FindClass(type);
                                 type[0] = 0;
                              }

                              strcpy(className, "__ecereClass_");
                              FullClassNameCat(className, classSym.string, true);
                              MangleClassName(className);
                              DeclareClass(classSym, className);

                              PrintType(param, type, true, true);

                              decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param.name /*"__ecereResult"*/)));
                              paramTypeName = MkTypeName(specs, decl);

                              f.Printf("            ");
                              OutputTypeName(paramTypeName, f);

                              f.Printf(";\n");
                           }
                        }
                        f.Printf("\n");

                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           f.Printf("            __ecereBuffer.Unserialize(");
                           if(param.kind == classType && !strcmp(param._class.string, "String"))
                           {
                              DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                              f.Printf("(StaticString)");
                           }
                           f.Puts(param.name);
                           f.Printf(");\n");
                        }

                        f.Printf("            ");
                        if(method.dataType.returnType.kind != voidType)
                           f.Printf("__ecereResult = ");

                        // f.Printf("this.instance.%s(", method.name);
                        f.Printf("%s(", method.name);
                        
                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           if(param.prev)
                              f.Printf(", ");
                           f.Printf("%s", param.name);
                        }

                        f.Printf(");\n");

                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           if(param.kind == classType && ((param._class && param._class.registered && param._class.registered.type == structClass) || !strcmp(param._class.string, "String")) && !param.constant)
                           {
                              if(!strcmp(param._class.string, "String"))
                              {
                                 DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                                 f.Printf("            __ecereBuffer.Serialize((StaticString)%s);\n", param.name);
                              }
                              else
                                 f.Printf("            __ecereBuffer.Serialize(%s);\n", param.name);
                           }
                        }
                        if(method.dataType.returnType.kind != voidType)
                        {
                           f.Printf("            __ecereBuffer.Serialize(__ecereResult);\n");
                        }

                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           if(param.kind == classType && strcmp(param._class.string, "String") && param._class.registered && 
                              (param._class.registered.type == normalClass || param._class.registered.type == noHeadClass))
                           {
                              f.Printf("            delete %s;\n", param.name);
                           }
                        }
                        if(method.dataType.returnType.kind == classType && strcmp(method.dataType.returnType._class.string, "String") && method.dataType.returnType._class.registered && 
                              (method.dataType.returnType._class.registered.type == normalClass || method.dataType.returnType._class.registered.type == noHeadClass))
                        {
                           f.Printf("            delete __ecereResult;\n");
                        }
                     }

                     f.Printf("            break;\n");
                     f.Printf("         }\n");
                  }
               }
            }
            f.Printf("      }\n");
            f.Printf("   }\n");
            f.Printf("\n");
         } 

         doVirtual = true;
         id = 0;
         vid = _class.base.vTblSize;

         next = (Method)_class.methods.first;
         while(next && ((next.type == virtualMethod) != doVirtual || (doVirtual && next.vid != vid)))
         {
            id++;
            next = (Method)((BTNode)next).next;
            if(!next && doVirtual)
            {
               if(vid == _class.vTblSize)
                  doVirtual = false;
               else
                  vid++;
               id = 0;
               next = (Method)_class.methods.first;
            }
         }
         for(method = next; method; method = next)
         {
            Type param;

            if(!method.dataType)
               method.dataType = ProcessTypeString(method.dataTypeString, false);

            if(method.dataType.name)
            {
               f.Printf("   ");
               if(doVirtual)
               {
                  char name[1024];
                  strcpy(name, "__ecereVMethodID_");
                  FullClassNameCat(name, method._class.fullName, true);
                  strcat(name, "_");
                  strcat(name, method.name);
                  DeclareMethod(method, name);

                  f.Printf("virtual ");
               }
               f.Printf("%s\n", method.dataTypeString);
               f.Printf("   {\n");

               if(method.dataType)
               {
                  if(method.dataType.returnType.kind != voidType)
                  {
                     TypeName resultType;
                     OldList * specs = MkList();
                     Declarator decl;
                     char type[1024] = "";
                     char className[1024];
                     Symbol classSym;

                     if(method.dataType.returnType.kind == classType)
                        classSym = method.dataType.returnType._class; // VERIFY THIS FindClass(method.dataType.returnType._class.string);
                     else
                     {
                        PrintType(method.dataType.returnType, type, false, true);
                        classSym = FindClass(type);
                        type[0] = 0;
                     }

                     strcpy(className, "__ecereClass_");
                     FullClassNameCat(className, classSym.string, true);
                     MangleClassName(className);
                     DeclareClass(classSym, className);

                     PrintType(method.dataType.returnType, type, true, true);

                     decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
                     resultType = MkTypeName(specs, decl);

                     f.Printf("      ");
                     OutputTypeName(resultType, f);
                     if(method.dataType.returnType.kind == structType)
                        f.Printf(" = { 0 }");
                     else if(method.dataType.returnType.kind == classType && method.dataType.returnType._class.registered && method.dataType.returnType._class.registered.type == structClass)
                        f.Printf(" { }");
                     else
                        f.Printf(" = 0");
                     f.Printf(";\n\n");
                  }
                  f.Printf("      incref this;\n");
                  for(param = method.dataType.params.first; param; param = param.next)
                  {
                     char type[1024] = "";
                     char className[1024];
                     Symbol classSym;

                     if(param.kind == classType)
                        classSym = param._class; // VERIFY THIS FindClass(param._class.string);
                     else
                     {
                        PrintType(param, type, false, true);
                        classSym = FindClass(type);
                        type[0] = 0;
                     }
                     strcpy(className, "__ecereClass_");
                     FullClassNameCat(className, classSym.string, true);

                     MangleClassName(className);
                     DeclareClass(classSym, className);

                     if(param.kind == classType && !strcmp(param._class.string, "String"))
                     {
                        DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                        f.Printf("      __ecereBuffer.Serialize((StaticString)%s);\n", param.name);
                     }
                     else
                        f.Printf("      __ecereBuffer.Serialize(%s);\n", param.name);
                  }
                  DeclareMethod(
                     eClass_FindMethod(
                        eSystem_FindClass(privateModule, "ecere::net::DCOMClientObject"), "CallMethod", privateModule), 
                     "__ecereMethod___ecereNameSpace__ecere__net__DCOMClientObject_CallMethod");

                  f.Printf("      if(DCOMClientObject::CallMethod(%d))\n", id++);
                  f.Printf("      {\n");
                  for(param = method.dataType.params.first; param; param = param.next)
                  {
                     if(param.kind == classType && ((param._class && param._class.registered && param._class.registered.type == structClass) || !strcmp(param._class.string, "String")) && !param.constant)
                     {
                        if(!strcmp(param._class.string, "String"))
                        {
                           DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                           f.Printf("         __ecereBuffer.Unserialize((StaticString)%s);\n", param.name);
                        }
                        else
                           f.Printf("         __ecereBuffer.Unserialize(%s);\n", param.name);
                     }
                  }
                  if(method.dataType.returnType.kind != voidType)
                  {
                     if(method.dataType.returnType.kind == classType && !strcmp(method.dataType.returnType._class.string, "String"))
                     {
                        DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                        f.Printf("         __ecereBuffer.Unserialize((StaticString)__ecereResult);\n");
                     }
                     else
                        f.Printf("         __ecereBuffer.Unserialize(__ecereResult);\n");
                  }
                  f.Printf("      }\n");
                  f.Printf("      __ecereBuffer.Free();\n");
                  f.Printf("      delete this;\n");
                  if(method.dataType.returnType.kind != voidType)
                  {
                     f.Printf("      return __ecereResult;\n");
                  }
               }

               f.Printf("   }\n");
            }
            next = (Method)((BTNode)method).next;
            while(next && ((next.type == virtualMethod) != doVirtual || (doVirtual && next.vid != vid)))
            {
               id++;
               next = (Method)((BTNode)next).next;
               if(!next && doVirtual)
               {
                  if(vid == _class.vTblSize)
                     doVirtual = false;
                  else
                     vid++;
                  id = 0;
                  next = (Method)_class.methods.first;
               }
            }
            
            if(next) 
               f.Printf("\n");
         }

         f.Printf("}\n");
         if(deriv.next) 
            f.Printf("\n");
      }
   }
}

static void BindDCOMServer()
{
   bool mutexDeclared = false;
   Class _class;
   for(_class = privateModule.classes.first; _class; _class = _class.next)
   {
      if(_class.isRemote == 3) //)
         break;
   }

   if(_class)
   {
      File f;
      if(!dcomSymbols) dcomSymbols = TempFile { };
      f = dcomSymbols;

      DeclareClass(FindClass("ecere::net::DCOMServerObject"), "__ecereClass___ecereNameSpace__ecere__net__DCOMServerObject");

      // SERVER BINDINGS
      for(_class = privateModule.classes.first; _class; _class = _class.next)
      {
         if(_class.isRemote == 3) //2 && !strncmp(_class.fullName, "DCOMServer_", strlen("DCOMServer_")))
         {
            Method method;
            int id = 0;
            int vid;

            f.Printf("class DCOM%s : ecere::net::DCOMServerObject\n", _class.fullName);
            // f.Printf("class DCOM%s\n", _class.fullName);
            f.Printf("{\n");
            /*
            f.Printf("   %s instance;\n", _class.fullName);
            f.Printf("   unsigned int id;\n");
            f.Printf("   SerialBuffer buffer { };\n");
            */

            /*
            f.Printf("   DCOM%s()\n", _class.fullName);
            f.Printf("   {\n");
            f.Printf("      instance = eInstance_New(class(%s));\n", _class.fullName);
            f.Printf("   }\n");
            */
            // f.Printf("\n");
            f.Printf("   virtual void CallMethod(uint __ecereMethodID, SerialBuffer __ecereBuffer)\n");
            f.Printf("   {\n");
            f.Printf("      %s inst = (%s)instance;\n", _class.fullName, _class.fullName);
            f.Printf("      incref inst;\n");
            f.Printf("      switch(__ecereMethodID)\n");
            f.Printf("      {\n");

            for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
            {
               Type param;
               method.dataType = ProcessTypeString(method.dataTypeString, false);
               if(method.dataType && method.dataType.name)
               {
                  f.Printf("         case %d:\n", id++);
                  f.Printf("         {\n");

                  {
                     if(method.dataType.returnType.kind != voidType)
                     {
                        TypeName resultType;
                        OldList * specs = MkList();
                        Declarator decl;
                        char type[1024] = "";
                        char className[1024];
                        Symbol classSym;

                        if(method.dataType.returnType.kind == classType)
                           classSym = method.dataType.returnType._class; // VERIFY THIS FindClass(method.dataType.returnType._class.string);
                        else
                        {
                           PrintType(method.dataType.returnType, type, false, true);
                           classSym = FindClass(type);
                           type[0] = 0;
                        }
                        strcpy(className, "__ecereClass_");
                        FullClassNameCat(className, classSym.string, true);
                        MangleClassName(className);
                        DeclareClass(classSym, className);

                        PrintType(method.dataType.returnType, type, true, true);

                        decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
                        resultType = MkTypeName(specs, decl);

                        f.Printf("            ");
                        OutputTypeName(resultType, f);
                        f.Printf(";\n");
                     }

                     for(param = method.dataType.params.first; param; param = param.next)
                     {
                        if(param.kind == classType && !strcmp(param._class.string, "String"))
                        {
                           // Hardcode 1024 chars max string for now
                           f.Printf("            char %s[1024];\n", param.name);
                           DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                           DeclareClass(FindClass("String"), "__ecereClass_String");
                        }
                        else
                        {
                           TypeName paramTypeName;
                           OldList * specs = MkList();
                           Declarator decl;
                           char type[1024] = "";
                           char className[1024];
                           Symbol classSym;

                           if(param.kind == classType)
                              classSym = param._class; // VERIFY THIS FindClass(param._class.string);
                           else
                           {
                              PrintType(param, type, false, true);
                              classSym = FindClass(type);
                              type[0] = 0;
                           }

                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, classSym.string, true);
                           MangleClassName(className);
                           DeclareClass(classSym, className);

                           PrintType(param, type, true, true);

                           decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier(param.name /*"__ecereResult"*/)));
                           paramTypeName = MkTypeName(specs, decl);

                           f.Printf("            ");
                           OutputTypeName(paramTypeName, f);

                           f.Printf(";\n");
                        }
                     }
                     f.Printf("\n");

                     for(param = method.dataType.params.first; param; param = param.next)
                     {
                        f.Printf("            __ecereBuffer.Unserialize(");
                        if(param.kind == classType && !strcmp(param._class.string, "String"))
                        {
                           DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                           f.Printf("(StaticString)");
                        }
                        f.Puts(param.name);
                        f.Printf(");\n");
                     }

                     f.Printf("            ");
                     if(method.dataType.returnType.kind != voidType)
                        f.Printf("__ecereResult = ");

                     // f.Printf("this.instance.%s(", method.name);
                     f.Printf("((%s)instance).%s(", _class.fullName, method.name);
                     
                     for(param = method.dataType.params.first; param; param = param.next)
                     {
                        if(param.prev)
                           f.Printf(", ");
                        f.Printf("%s", param.name);
                     }

                     f.Printf(");\n");

                     for(param = method.dataType.params.first; param; param = param.next)
                     {
                        if(param.kind == classType && ((param._class && param._class.registered && param._class.registered.type == structClass) || !strcmp(param._class.string, "String")) && !param.constant)
                        {
                           if(!strcmp(param._class.string, "String"))
                           {
                              DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                              f.Printf("            __ecereBuffer.Serialize((StaticString)%s);\n", param.name);
                           }
                           else
                              f.Printf("            __ecereBuffer.Serialize(%s);\n", param.name);
                        }
                     }
                     if(method.dataType.returnType.kind != voidType)
                     {
                        f.Printf("            __ecereBuffer.Serialize(__ecereResult);\n");
                     }

                     for(param = method.dataType.params.first; param; param = param.next)
                     {
                        if(param.kind == classType && strcmp(param._class.string, "String") && param._class.registered && 
                           (param._class.registered.type == normalClass || param._class.registered.type == noHeadClass))
                        {
                           f.Printf("            delete %s;\n", param.name);
                        }
                     }
                     if(method.dataType.returnType.kind == classType && strcmp(method.dataType.returnType._class.string, "String") && method.dataType.returnType._class.registered && 
                           (method.dataType.returnType._class.registered.type == normalClass || method.dataType.returnType._class.registered.type == noHeadClass))
                     {
                        f.Printf("            delete __ecereResult;\n");
                     }
                  }

                  f.Printf("            break;\n");
                  f.Printf("         }\n");
               }
            }
            f.Printf("      }\n");
            f.Printf("      delete inst;\n");
            f.Printf("   }\n");

            // *** VIRTUAL FUNCTIONS BINDINGS ***
            for(vid = _class.base.vTblSize; vid < _class.vTblSize; vid++)
            {
               Method method;
               Type param;

               for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
                  if(method.type == virtualMethod && method._class == _class && method.vid == vid)
                     break;
               if(method)
               {
                  if(!mutexDeclared)
                  {
                     DeclareClass(FindClass("ecere::sys::Mutex"), "__ecereClass___ecereNameSpace__ecere__sys__Mutex");
                     DeclareMethod(
                        eClass_FindMethod(
                           eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Wait", privateModule), 
                              "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait");
                     DeclareMethod(
                        eClass_FindMethod(
                           eSystem_FindClass(privateModule, "ecere::sys::Mutex"), "Release", privateModule), 
                              "__ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release");
                     mutexDeclared = true;
                  }

                  f.Printf("\n");
                  if(!method.dataType)
                     method.dataType = ProcessTypeString(method.dataTypeString, false);

                  if(method.dataType.name)
                  {
                     f.Printf("   virtual %s\n", method.dataTypeString);
                     f.Printf("   {\n");

                     if(method.dataType)
                     {
                        f.Printf("      DCOM%s __ecereObject = (void *)_vTbl[-1];\n", _class.fullName);
                        if(method.dataType.returnType.kind != voidType)
                        {
                           TypeName resultType;
                           OldList * specs = MkList();
                           Declarator decl;
                           char type[1024] = "";
                           char className[1024];
                           Symbol classSym;

                           if(method.dataType.returnType.kind == classType)
                              classSym = method.dataType.returnType._class; // VERIFY THIS FindClass(method.dataType.returnType._class.string);
                           else
                           {
                              PrintType(method.dataType.returnType, type, false, true);
                              classSym = FindClass(type);
                              type[0] = 0;
                           }

                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, classSym.string, true);
                           MangleClassName(className);
                           DeclareClass(classSym, className);

                           PrintType(method.dataType.returnType, type, true, true);

                           decl = SpecDeclFromString(type, specs, MkDeclaratorIdentifier(MkIdentifier("__ecereResult")));
                           resultType = MkTypeName(specs, decl);

                           f.Printf("      ");
                           OutputTypeName(resultType, f);
                           if(method.dataType.returnType.kind == structType)
                              f.Printf(" = { 0 }");
                           else if(method.dataType.returnType.kind == classType && method.dataType.returnType._class.registered && method.dataType.returnType._class.registered.type == structClass)
                              f.Printf(" { }");
                           else
                              f.Printf(" = 0");
                           f.Printf(";\n\n");
                        }
                        
                        f.Printf("      incref __ecereObject;\n");
                        f.Printf("      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Wait(__ecereObject.mutex);\n");

                        //f.Printf("      incref this;\n");
                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           char type[1024] = "";
                           char className[1024];
                           Symbol classSym;

                           if(param.kind == classType)
                              classSym = param._class; // VERIFY THIS FindClass(param._class.string);
                           else
                           {
                              PrintType(param, type, false, true);
                              classSym = FindClass(type);
                              type[0] = 0;
                           }
                           strcpy(className, "__ecereClass_");
                           FullClassNameCat(className, classSym.string, true);
                           MangleClassName(className);
                           DeclareClass(classSym, className);

                           if(param.kind == classType && !strcmp(param._class.string, "String"))
                           {
                              DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                              f.Printf("      __ecereObject.argsBuffer.Serialize((StaticString)%s);\n", param.name);
                           }
                           else
                              f.Printf("      __ecereObject.argsBuffer.Serialize(%s);\n", param.name);
                        }

                        DeclareMethod(
                           eClass_FindMethod(
                              eSystem_FindClass(privateModule, "ecere::net::DCOMServerObject"), "CallVirtualMethod", privateModule), 
                           "__ecereMethod___ecereNameSpace__ecere__net__DCOMServerObject_CallVirtualMethod");

                        // Check if this method needs to return anything (hasReturnValue)
                        {
                           bool hasReturnValue = method.dataType.returnType.kind != voidType;
                           if(!hasReturnValue)
                           {
                              for(param = method.dataType.params.first; param; param = param.next)
                              {
                                 if(param.kind == classType && ((param._class && param._class.registered && param._class.registered.type == structClass) || !strcmp(param._class.string, "String")) && !param.constant)
                                 {
                                    hasReturnValue = true;
                                    break;
                                 }
                              }
                           }
                           f.Printf("      if(__ecereObject.CallVirtualMethod(%d, %s))\n", vid - _class.base.vTblSize,
                              hasReturnValue ? "true" : "false");
                        }
                        f.Printf("      {\n");
                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           if(param.kind == classType && ((param._class && param._class.registered && param._class.registered.type == structClass) || !strcmp(param._class.string, "String")) && !param.constant)
                           {
                              if(!strcmp(param._class.string, "String"))
                              {
                                 DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                                 f.Printf("         __ecereObject.returnBuffer.Unserialize((StaticString)%s);\n", param.name);
                              }
                              else
                                 f.Printf("         __ecereObject.returnBuffer.Unserialize(%s);\n", param.name);
                           }
                        }
                        if(method.dataType.returnType.kind != voidType)
                        {
                           if(method.dataType.returnType.kind == classType && !strcmp(method.dataType.returnType._class.string, "String"))
                           {
                              DeclareClass(FindClass("StaticString"), "__ecereClass_StaticString");
                              f.Printf("         __ecereObject.returnBuffer.Unserialize((StaticString)__ecereResult);\n");
                           }
                           else
                              f.Printf("         __ecereObject.returnBuffer.Unserialize(__ecereResult);\n");
                        }
                        f.Printf("      }\n");
                        f.Printf("      else\n");
                        f.Printf("         ((%s)this).%s::%s(", _class.fullName, _class.fullName, method.name);
                        for(param = method.dataType.params.first; param; param = param.next)
                        {
                           f.Printf("%s", param.name);
                           if(param.next) f.Printf(", ");
                        }
                        f.Printf(");\n");

                        f.Printf("      __ecereObject.returnBuffer.Free();\n");
                        f.Printf("      __ecereMethod___ecereNameSpace__ecere__sys__Mutex_Release(__ecereObject.mutex);\n");
                        //f.Printf("      delete this;\n");
                        f.Printf("      delete __ecereObject;\n");
                        if(method.dataType.returnType.kind != voidType)
                        {
                           f.Printf("      return __ecereResult;\n");
                        }
                     }

                     f.Printf("   }\n");
                     /*if(vid < _class.vTblSize) 
                        f.Printf("\n");*/
                  }
               }
            }
            f.Printf("}\n");
         }
      }
   }
}

class SymbolgenApp : Application
{
   void Main()
   {
      /*
      char ** argv = null;
      int argc = 0;
      */
      int c;
      bool valid = true;
      char * output = null;

      targetPlatform = GetRuntimePlatform();
      targetBits = GetHostBits();

      /*
      for(c = 0; c<this.argc; c++)
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
      }
      */

      for(c = 1; c<argc; c++)
      {
         char * arg = argv[c];
         if(arg[0] == '-')
         {
            if(!strcmp(arg + 1, "m32") || !strcmp(arg + 1, "m64"))
            {
               targetBits = !strcmp(arg + 1, "m32") ? 32 : 64;
            }
            else if(!strcmp(arg+1, "o"))
            {
               if(!output && c + 1 < argc)
               {
                  output = argv[c+1];
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg, "-name"))
            {
               if(c + 1 < argc)
               {
                  strcpy(projectName, argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
            else if(!strcmp(arg, "-t"))
            {
               if(++c < argc)
                  targetPlatform = argv[c];
               else
                  valid = false;
            }
            else if(!strcmp(arg, "-console"))
               isConsole = true;
            else if(!strcmp(arg, "-dynamiclib"))
               isDynamicLibrary = true;
            else if(!strcmp(arg, "-staticlib"))
            {
               isDynamicLibrary = true;   // TOFIX: unmixup
               isStaticLibrary = true;
            }
            else if(!strcmp(arg, "-symbols"))
            {
               if(c + 1 < argc)
               {
                  SetSymbolsDir(argv[c+1]);
                  c++;
               }
               else
                  valid = false;
            }
         }
      }
      if(!output)
         valid = false;
     
      if(!valid)
         printf($"Syntax:\n   ecs [-t <target platform>] <input>[, <input>]* -o <output>\n");
      else
      {
         int c;
         char ext[MAX_EXTENSION];
         char symbolModule[MAX_FILENAME];
         GetExtension(output, ext);
         GetLastDirectory(output, symbolModule);
         
         SetDefines(&::_defines);
         SetImports(&_imports);
         SetGlobalData(&globalData);
         SetExcludedSymbols(&_excludedSymbols);
         SetGlobalContext(theGlobalContext);
         SetTopContext(theGlobalContext);
         SetCurrentContext(theGlobalContext);
         SetTargetPlatform(targetPlatform);
         SetTargetBits(targetBits);

         privateModule = (Module)__ecere_COM_Initialize(true | ((targetBits == 64)?2:0), 1, null);
         SetPrivateModule(privateModule);
         mainModule = ModuleImport { };
         SetMainModule(mainModule);
         _imports.Add(mainModule);

         //if(!strcmp(ext, "c"))
         {
            String symbolsDir = GetSymbolsDir();
            // Only generating .pot files when building from release.* directory for now
            bool outputPot = symbolsDir && SearchString(symbolsDir, 0, "release.", false, false);
            Map<ContextStringPair, List<String> > intlStrings { };
            MapIterator<ContextStringPair, List<String>> it { map = intlStrings };

            for(c = 1; c<argc; c++)
            {
               char * file = argv[c];
               if(file[0] == '-')
               {
                  if(!strcmp(file, "-c"))
                     c++;
               }
               else
               {
                  char ext[MAX_EXTENSION];
                  GetExtension(file,ext);
                  if(!strcmp(ext, "imp"))
                     LoadImports(file);
               }
            }

            // What is this supposed to do?
            for(c = 1; c<argc; c++)
            {
               char * file = argv[c];
               if(file[0] == '-')
               {
                  if(!strcmp(file, "-c"))
                     c++;
               }
            }

            for(c = 1; c<argc; c++)
            {
               char * file = argv[c];
               if(file[0] == '-')
               {
                  // Don't even know what it does here?
                  if(!strcmp(file, "-c"))
                     c++;
               }
               else
               {
                  char ext[MAX_EXTENSION];
                  char moduleName[MAX_LOCATION];

                  GetExtension(file,ext);

                  GetLastDirectory(file, moduleName);
                  StripExtension(moduleName);
                  strcat(moduleName, ".ec");

                  if(fstrcmp(moduleName, symbolModule) && (!strcmp(ext, "sym") || !strcmp(ext, "ec")))
                  {
                     ImportedModule importedModule;
                     ModuleInfo module { };
                     char fileName[MAX_FILENAME];
                     ::modules.Add(module);

                     GetLastDirectory(file, fileName);

                     module.name = CopyString(fileName);
                     
                     StripExtension(module.name);                     

                     for(importedModule = ::_defines.first; importedModule; importedModule = importedModule.next)
                     {
                        if(importedModule.type == moduleDefinition && !strcmpi(importedModule.name, module.name) && !(importedModule.importType == remoteImport))
                           break;
                     }

                     if(importedModule)
                        module.globalInstance = importedModule.globalInstance;
                     else
                     {
                        importedModule = ImportedModule
                        {
                           name = CopyString(module.name),
                           type = moduleDefinition,
                           importType = normalImport
                        };
                        ::_defines.AddName(importedModule);

                        module.globalInstance = LoadSymbols(file, normalImport, false);
                        CheckDataRedefinitions();
                     }

                     // I18n code
                     {
                        File f;
                        ChangeExtension(file, "bowl", fileName);
                        f = FileOpen(fileName, read);
                        if(f)
                        {
                           static char line[65536];
                           List<String> comments { };
                           String msgid = null, msgstr = null, msgctxt = null;
                           while(!f.Eof())
                           {
                              if(f.GetLine(line, sizeof(line)))
                              {
                                 int len;
                                 TrimLSpaces(line, line);
                                 if(line[0] == '#')
                                 {
                                    comments.Add(CopyString(line));
                                 }
                                 else if(strstr(line, "msgid \"") == line)
                                 {
                                    delete msgid;
                                    msgid = CopyString(line + 7);
                                    len = strlen(msgid);
                                    if(len) msgid[len-1] = 0;
                                 }
                                 else if(strstr(line, "msgctxt \"") == line)
                                 {
                                    delete msgctxt;
                                    msgctxt = CopyString(line + 9);
                                    len = strlen(msgctxt);
                                    if(len) msgctxt[len-1] = 0;
                                 }
                                 else if(strstr(line, "msgstr \"") == line)
                                 {
                                    delete msgstr;
                                    msgstr = CopyString(line + 8);
                                    len = strlen(msgstr);
                                    if(len) msgstr[len-1] = 0;
                                 }

                                 if(msgid && msgstr)
                                 {
                                    ContextStringPair pair { msgid, msgctxt };
                                    i18n = true;
                                    if(!it.Index(pair, false))
                                    {
                                       msgid = null; msgctxt = null;
                                       intlStrings[pair] = comments;
                                       comments = { };
                                    }
                                    else
                                    {
                                       for(s : comments)
                                          it.data.Add(s);
                                       comments.RemoveAll();
                                    }

                                    delete msgid;
                                    delete msgctxt;
                                    delete msgstr;
                                 }
                              }
                           }
                           comments.Free();
                           delete comments;
                           delete f;
                        }
                     }
                  }
               }
            }

            ComputeModuleClasses(privateModule);

            if(!isDynamicLibrary)
            {
               // applicationClass = eSystem_FindClass(privateModule, "Application");
               /*
               thisAppClass = FindAppClass(&privateModule.application.publicNameSpace, true);
               if(!thisAppClass)
                  thisAppClass = FindAppClass(&privateModule.application.privateNameSpace, true);
               if(!thisAppClass)
                  thisAppClass = FindAppClass(&privateModule.application.publicNameSpace, false);
               if(!thisAppClass)
                  thisAppClass = FindAppClass(&privateModule.application.privateNameSpace, false);
               */
               thisAppClass = SearchAppClass_Module(privateModule);
            }
            WriteMain(output);

            if(outputPot && intlStrings.count)
            {
               File potFile;
               char potFileName[MAX_LOCATION];
               //strcpy(potFileName, output);
               //StripExtension(potFileName);
               strcpy(potFileName, "locale");
               MakeDir(potFileName);
               PathCat(potFileName, projectName);
               ChangeExtension(potFileName, "pot", potFileName);
               potFile = FileOpen(potFileName, write);
               if(potFile)
               {
                  // Write header:
                  potFile.Puts("msgid \"\"\n");
                  potFile.Puts("msgstr \"\"\n");
                  potFile.Puts("\"Project-Id-Version: \\n\"\n");
                  potFile.Puts("\"POT-Creation-Date: \\n\"\n");
                  potFile.Puts("\"PO-Revision-Date: \\n\"\n");
                  potFile.Puts("\"Last-Translator: \\n\"\n");
                  potFile.Puts("\"Language-Team: \\n\"\n");
                  potFile.Puts("\"MIME-Version: 1.0\\n\"\n");
                  potFile.Puts("\"Content-Type: text/plain; charset=iso-8859-1\\n\"\n");
                  potFile.Puts("\"Content-Transfer-Encoding: 8bit\\n\"\n");
                  potFile.Puts("\"X-Poedit-Basepath: ../\\n\"\n");
                  potFile.Puts("\n");

                  for(i : intlStrings)
                  {
                     ContextStringPair pair = &i;
                     List<String> comments = i;
                     for(s : comments)
                     {
                        potFile.Printf(s);
                        potFile.Puts("\n");
                     }

                     if(pair.context)
                     {
                        potFile.Puts("msgctxt \""); potFile.Puts(pair.context); potFile.Puts("\"\n");
                     }
                     potFile.Puts("msgid \""); potFile.Puts(pair.string); potFile.Puts("\"\n");
                     potFile.Puts("msgstr \""); potFile.Puts(pair.string); potFile.Puts("\"\n");
                     potFile.Puts("\n");
                  }
                  intlStrings.Free();
                  delete intlStrings;
                  delete potFile;
               }
            }
         }

         FreeContext(theGlobalContext);
         FreeExcludedSymbols(_excludedSymbols);

         ::_defines.Free(FreeModuleDefine);
         _imports.Free(FreeModuleImport);

         //precompDefines.Free(FreeDefinition);   

         FreeTypeData(privateModule);
         FreeIncludeFiles();
         FreeGlobalData(globalData);

         delete privateModule;
      }

      SetSymbolsDir(null); // Free symbols dir

      /*
      for(c = 0; c<argc; c++)
         delete argv[c];
      delete argv;
      */

#ifdef _DEBUG
      getch();
#endif
   }
}
