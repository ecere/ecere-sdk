#include "debug.eh"

import "ecere"
import "ec"

import "debug"

import "str"

static Context    ec1GlobalContext { };
static OldList    ec1Defines { };
static OldList    ec1Imports { };
static NameSpace  ec1GlobalData;
static OldList    ec1ExcludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };

Application    ec1ComponentsApp;
Module         ec1HomeModule;

bool ec1 = false;
bool ec1init(const char * pathToModule)
{
   //PrintLn(pathToModule, ":");
   SetGlobalContext(ec1GlobalContext);
   SetCurrentContext(ec1GlobalContext);
   SetTopContext(ec1GlobalContext);
   SetExcludedSymbols(&ec1ExcludedSymbols);
   SetDefines(&::ec1Defines);
   SetImports(&ec1Imports);
   SetInDocumentor(true);
   SetOutputFile("");
   SetGlobalData(ec1GlobalData);
   ec1 = false;
   if(pathToModule)
      ec1 = openModule(pathToModule);

   if(ec1)
   {
      Context ctx = ec1GlobalContext;
      ctx.types.Add((BTNode)Symbol { string = CopyString("uint"), type = ProcessTypeString("unsigned int", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("uint64"), type = ProcessTypeString("unsigned int64", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("uint32"), type = ProcessTypeString("unsigned int", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("uint16"), type = ProcessTypeString("unsigned short", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("byte"), type = ProcessTypeString("unsigned char", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("intptr_t"), type = ProcessTypeString("intptr", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("uintptr_t"), type = ProcessTypeString("uintptr", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("ssize_t"), type = ProcessTypeString("intsize", false) });
      ctx.types.Add((BTNode)Symbol { string = CopyString("size_t"), type = ProcessTypeString("uintsize", false) });
   }
   return ec1;
}

void ec1terminate()
{
   //if(ec1)
   {
      FreeContext(ec1GlobalContext);
      FreeExcludedSymbols(ec1ExcludedSymbols);
      ::ec1Defines.Free(FreeModuleDefine);
      ec1Imports.Free(FreeModuleImport);
      FreeGlobalData(ec1GlobalData);
      FreeIncludeFiles();
      if(ec1ComponentsApp) FreeTypeData(ec1ComponentsApp);
      /*delete */ec1ComponentsApp = null;
      ec1 = false;
   }
}

bool openModule(const char * filePath)
{
   char moduleName[MAX_FILENAME];
   char extension[MAX_EXTENSION];
   Module module = null;
   static char symbolsDir[MAX_LOCATION];

//#if 0 // removing this is causing the following line to show up in eC.h's classes defines section
      //           #define Window eC_Window
      FreeContext(ec1GlobalContext);
      FreeExcludedSymbols(ec1ExcludedSymbols);
      ::ec1Defines.Free(FreeModuleDefine);
      ec1Imports.Free(FreeModuleImport);
      FreeGlobalData(ec1GlobalData);
      FreeIncludeFiles();
      if(ec1ComponentsApp)
      {
         FreeTypeData(ec1ComponentsApp);
         delete ec1ComponentsApp;
      }
//#endif // 0
   ec1terminate();

   ec1ComponentsApp = __ecere_COM_Initialize(false, 1, null);
   SetPrivateModule(ec1ComponentsApp);
   StripLastDirectory(filePath, symbolsDir);
   SetSymbolsDir(symbolsDir);
   GetExtension(filePath, extension);

      ImportModule(filePath, normalImport, publicAccess, true);

   if(extension[0] && strcmpi(extension, "so") && strcmpi(extension, "dll") && strcmpi(extension, "dylib"))
      ec1ComponentsApp.name = CopyString(filePath);

   for(module = ec1ComponentsApp.allModules.first; module; module = module.next)
   {
      if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")))
         break;
   }
   //if(!module)
   //   eModule_LoadStrict(ec1ComponentsApp, "ecereCOM", publicAccess /*privateAccess*/);

   GetLastDirectory(filePath, moduleName);
   // Extension, path and lib prefix get removed in Module::name
   if(extension[0])
   {
      StripExtension(moduleName);
      if((!strcmpi(extension, "so") || !strcmpi(extension, "dylib")) && strstr(moduleName, "lib") == moduleName)
      {
         int len = strlen(moduleName) - 3;
         memmove(moduleName, moduleName + 3, len);
         moduleName[len] = 0;
      }
   }

   ec1HomeModule = findModule(moduleName, null);
   if(!ec1HomeModule)
      ec1HomeModule = ec1ComponentsApp;

   SetSymbolsDir(null);

   if(ec1ComponentsApp.allModules.count == 0)
   {
      PrintLn("error: loading ", filePath, " failed!");
      return false;
   }
   return true;
}

// todo: review all other direct use of ProcessTypeString and make them verified correct uses
Type processTypeStringOk(const char * dataTypeString)
{
   // tocheck: does staticMethod ever need to be true?
   bool dtsHasTemplateArgs = strchr(dataTypeString, '<') && strchr(dataTypeString, '>');
   if(dtsHasTemplateArgs)
      debugBreakpoint();
   return ProcessTypeString(dataTypeString, false);
}

Type resolveDataTypeStringInTemplatesContext(Class cl, const char * dataTypeString, bool debug)
{
   Type type;
   Context context = SetupTemplatesContext(cl); // TOCHECK: Should we do this only once while we process the whole class?
   // PrintLn("SetupTemplatesContext(", cl.name, ")");
   // if(debug && !strcmp(cl.name, "BinaryTree")) debugBreakpoint();
   type = ProcessTypeString(dataTypeString, false);
   FinishTemplatesContext(context);
   return type;
}

/*
Type typeDataMember(DataMember dm, Class cl)
{
   if(!dm.dataType)
   {
      Context context = SetupTemplatesContext(cl);
      dm.dataType = ProcessTypeString(dm.dataTypeString, false);
      FinishTemplatesContext(context);
   }
   return dm.dataType;
}
*/

void printDependencies(Module start)
{
   SubModule m;
   for(m = start.modules.first; m; m = m.next)
   {
      PrintLn(m.module.name);
   }
}

void printModulesLayout(Module start, int indent)
{
   SubModule m;
   PrintLn(spaces(indent * 3, 0), (start.name && start.name[0]) ? start.name : "."); // , "└─"
   for(m = start.modules.first; m; m = m.next)
   {
      printModulesLayout(m.module, indent + 1);
   }
}

Module findModule(const char * name, Module parent)
{
   Module module = null;
   if(parent)
   {
      SubModule m;
      for(m = parent.modules.first; m; m = m.next)
      {
         if(m.module.name && (!strcmp(m.module.name, name)))
            module = m.module;
         else
            module = findModule(name, m.module);
         if(module)
            break;
      }
   }
   else
   {
      Module m;
      for(m = ec1ComponentsApp.allModules.first; m; m = m.next)
      {
         if(m.name && (!strcmp(m.name, name)))
            module = m;
         else
            module = findModule(name, m);
         if(module)
            break;
      }
   }
   return module;
}

ClassTemplateParameter findClassTemplateParameter(const char * name, Class start, Class * templateClass)
{
   Class cl = null;
   ClassTemplateParameter p = null;
   for(cl = start; cl; cl = cl.templateClass ? cl.templateClass : cl.base)
   {
      for(p = cl.templateParams.first; p; p = p.next)
         if(!strcmp(p.name, name))
            break;
      if(p) break;
   }
   if(templateClass)
      *templateClass = cl;
   return p;
}

Type unwrapPointerType(Type type, int * ptr)
{
   Type t = type;
   while(t.kind == pointerType && (!ptr || ++(*ptr) < 256))
      t = t.type;
   return t;
}

Type unwrapType(Type type, bool * isNative, bool *isPointer)
{
   bool native = false;
   bool pointer = false;
   Type t = type;
   while(t.kind == pointerType || t.kind == arrayType)
   {
      if(t.kind == pointerType) pointer = true;
      if(!t.type) conmsgs("check");
      if(t.kind == arrayType)
      {
         if(t.arrayType != t.type) conmsgs("check");
      }
      t = t.type;
   }
   switch(t.kind)
   {
      case voidType: case charType: case shortType: case intType:
      case int64Type: case longType: case floatType: case doubleType:
      case intPtrType: case intSizeType: case int128Type:
         native = true;
         break;
      case structType: case classType: case subClassType: case thisClassType:
      case templateType:
      case functionType:
         break;
      case pointerType: case arrayType:
      case _BoolType:
      case unionType:
      case ellipsisType: case vaListType:
      case enumType:
      case methodType:
      case dummyType:
      default: conmsgs("check");
   }
   if(isNative) *isNative = native;
   if(isPointer) *isPointer = pointer;
   return t;
}
