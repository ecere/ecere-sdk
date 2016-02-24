import "ecere"
import "ec"
import "Documentor.ec"

#define sflnprintln(...) PrintLn(__FILE__, ":", __LINE__, ": ", ##__VA_ARGS__)

static Context globalContext { };
static OldList defines { };
static OldList imports { };
static NameSpace globalData;
static OldList excludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };

define app = (Convertor)__thisModule.application;

#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

default:
/*extern */int __ecereVMethodID_class_OnGetString;
private:


static __attribute__((unused)) void Dummy()
{
   int a;
   a.OnGetString(null, null, null);
}

static String ConvertReadDoc(const char * filePath)
{
   uint len;
   String contents = null;
   File f;
   f = FileOpen(filePath, read);
   if(f)
   {
      if((len = f.GetSize()))
      {
         contents = new char[len+1];
         f.Read(contents, 1, len);
         contents[len] = '\0';
      }
      delete f;
   }
   if(contents)
   {
      char * s;
      for(s = contents; *s; s++)
         if(!isspace(*s)) break;
      if(!*s)
         delete contents;
   }
   if(contents)
   {
      String buffer = new char[len+1];
      char * i, * o = buffer;
      for(i = contents; *i; i++)
      {
         if(i[0] == '<' && (i[1] == 'b' || i[1] == 'B') && (i[2] == 'r' || i[2] == 'R') && i[3] == '>' && i[4] == '\n')
            i += 3;
         else
         {
            *o = *i;
            o++;
         }
      }
      *o = 0;
      delete contents;
      contents = buffer;
   }
   return contents;
}

void ConvertModuleDoc(Module module, bool isDll)
{
   SubModule m;
   bool readOnly = true;
   char oldDocFilePath[MAX_LOCATION];
   char docFilePath[MAX_LOCATION];
   NameSpace * nameSpace = null;
   if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")))
      nameSpace = &module.application.systemNameSpace;
   if(module.name && strcmp(module.name, "ecereCOM"))
      nameSpace = &module.publicNameSpace;
#ifdef _DEBUG
   getDocFilePath(oldDocFilePath, null, module, nameSpace, false, true);
   getDocFilePath(docFilePath, null, module, nameSpace, false, false);
   PrintLn("ConvertModuleDoc:",
         "  convertDocDir(", app.convertDocDir, ")",
         "  outputDocDir(", app.outputDocDir, ")",
         "  oldDocFile(", oldDocFilePath, ")",
         "  docFile(", docFilePath, ")");
#endif // def _DEBUG
   getDocFilePath(oldDocFilePath, app.convertDocDir, module, nameSpace, true, true);
   getDocFilePath(docFilePath, app.outputDocDir, module, nameSpace, true, false);

   if(FileExists(oldDocFilePath))
   {
      if(FileExists(docFilePath).isDirectory)
      {
         char writeTestFilePath[MAX_LOCATION];
         File f;
         sprintf(writeTestFilePath, "%s/_", docFilePath);
         f = FileOpen(writeTestFilePath, write);
         PrintLn("Info: Directory exists for eCdoc in eCon format. Conversion is not required. Proceeding anyway.");
         if(f)
         {
            delete f;
            DeleteFile(writeTestFilePath);
            readOnly = false;
         }
         else
         {
            readOnly = true;
            PrintLn("Error: Directory for eCdoc in eCon format is not writable.");
         }
      }
      else
      {
         MakeDir(docFilePath);
         if(FileExists(docFilePath).isDirectory)
         {
            readOnly = false;
         }
         else
         {
            readOnly = true;
            PrintLn("Error: Unable to create directory for eCdoc conversion to eCon.");
         }
      }

      if(!readOnly)
      {
         char fileName[MAX_LOCATION];
         DocConvertIterator fsi
         {
            bool onFolder(const char * folderPath, const char * folderName)
            {
               DocConvertLocType type = typeStack.lastIterator.data;
               if(getNext)
               {
                  if(type == namespaces)
                  {
                     PathCatSlash(nsDir, folderName);
                     namespaces.Add((ns = { namespaceDoc = { name = CopyString(folderName) }, nsPath = CopyString(nsDir) }));
                     nsStack.Add(ns);
                  }
                  else if(type == functions)
                  {
                     functionDoc = FunctionDoc { };
                     if(!ns.namespaceDoc.functions)
                        ns.namespaceDoc.functions = { };
                     ns.namespaceDoc.functions[folderName] = functionDoc;
                  }
                  else if(type == classes)
                  {
                     classDoc = ClassDoc { name = CopyString(folderName) };
                     ns.classes.Add(classDoc);
                  }
                  else if(type == methods)
                  {
                     methodDoc = MethodDoc { };
                     if(!classDoc.methods)
                        classDoc.methods = { };
                     classDoc.methods[folderName] = methodDoc;
                  }
                  else
                     sflnprintln("what?");
                  nameStack.Add(CopyString(folderName));
                  getNext = false;
                  if(!strcmp(folderName, "namespaces"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "functions"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "parameters"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "classes"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "enumeration values"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "data members"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "properties"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "conversions"))
                     sflnprintln("what?");
                  else if(!strcmp(folderName, "methods"))
                     sflnprintln("what?");
               }
               else if((type == root || type == namespaces) && !strcmp(folderName, "namespaces"))
                  addType(namespaces);
               else if((type == root || type == namespaces) && !strcmp(folderName, "functions"))
                  addType(functions);
               else if((type == functions || type == methods) && !strcmp(folderName, "parameters"))
                  addType(parameters);
               else if((type == root || type == namespaces) && !strcmp(folderName, "classes"))
                  addType(classes);
               else if(type == classes && !strcmp(folderName, "enumeration values"))
                  addType(values);
               else if(type == classes && !strcmp(folderName, "data members"))
                  addType(fields);
               else if(type == classes && !strcmp(folderName, "properties"))
                  addType(properties);
               else if(type == classes && !strcmp(folderName, "conversions"))
                  addType(conversions);
               else if(type == classes && !strcmp(folderName, "methods"))
                  addType(methods);
               return true;
            }

            void outFolder(const char * folderPath, const char * folderName, bool isRoot)
            {
               DocConvertLocType type = typeStack.lastIterator.data;
               if(!isRoot)
               {
                  if(!strcmp(folderName, "namespaces"))
                     exitType();
                  else if(!strcmp(folderName, "functions"))
                     exitType();
                  else if(!strcmp(folderName, "parameters"))
                     exitType();
                  else if(!strcmp(folderName, "classes"))
                     exitType();
                  else if(!strcmp(folderName, "enumeration values"))
                     exitType();
                  else if(!strcmp(folderName, "data members"))
                     exitType();
                  else if(!strcmp(folderName, "properties"))
                     exitType();
                  else if(!strcmp(folderName, "conversions"))
                     exitType();
                  else if(!strcmp(folderName, "methods"))
                     exitType();
                  else if(!strcmp(folderName, nameStack.lastIterator.data))
                  {
                     if(type == namespaces)
                     {
                        StripLastDirectory(nsDir, nsDir);
                        nsStack.Remove(nsStack.lastIterator.pointer);
                        ns = nsStack.lastIterator.data;
                     }
                     delete nameStack.lastIterator.data;
                     nameStack.Remove(nameStack.lastIterator.pointer);
                     getNext = true;
                  }
               }
            }

            bool onFile(const char * filePath, const char * fileName)
            {
               DocConvertLocType type = typeStack.lastIterator.data;
               if(!strstr(fileName, ".eCdoc"))
               {
                  String doc = ConvertReadDoc(filePath);
                  if((type == root || type == namespaces || type == classes || type == methods || type == functions) && !strcmp(fileName, "description"))
                  {
                     if(type == root || type == namespaces) { ns.namespaceDoc.description = doc; doc = null; }
                     else if(type == classes) { classDoc.description = doc; doc = null; }
                     else if(type == methods) { methodDoc.description = doc; doc = null; }
                     else if(type == functions) { functionDoc.description = doc; doc = null; }
                  }
                  else if((type == classes || type == methods || type == functions) && !strcmp(fileName, "usage"))
                  {
                     if(type == classes) { classDoc.usage = doc; doc = null; }
                     else if(type == methods) { methodDoc.usage = doc; doc = null; }
                     else if(type == functions) { functionDoc.usage = doc; doc = null; }
                  }
                  else if((type == classes || type == methods || type == functions) && !strcmp(fileName, "example"))
                  {
                     if(type == classes) { classDoc.example = doc; doc = null; }
                     else if(type == methods) { methodDoc.example = doc; doc = null; }
                     else if(type == functions) { functionDoc.example = doc; doc = null; }
                  }
                  else if((type == classes || type == methods || type == functions) && !strcmp(fileName, "remarks"))
                  {
                     if(type == classes) { classDoc.remarks = doc; doc = null; }
                     else if(type == methods) { methodDoc.remarks = doc; doc = null; }
                     else if(type == functions) { functionDoc.remarks = doc; doc = null; }
                  }
                  else if((type == classes || type == methods || type == functions) && !strcmp(fileName, "seeAlso"))
                  {
                     if(type == classes) { classDoc.also = doc; doc = null; }
                     else if(type == methods) { methodDoc.also = doc; doc = null; }
                     else if(type == functions) { functionDoc.also = doc; doc = null; }
                  }
                  else if((type == methods || type == functions) && !strcmp(fileName, "returnValue"))
                  {
                     if(type == methods) { methodDoc.returnValue = doc; doc = null; }
                     else if(type == functions) { functionDoc.returnValue = doc; doc = null; }
                  }
                  else
                  {
                     if(type == parameters)
                     {
                        uint pos;
                        char * s;
                        char name[MAX_FILENAME];
                        ParameterDoc parameterDoc;
                        DocConvertLocType parentType = typeStack[typeStack.count-2];
                        strcpy(name, fileName);
                        s = strstr(name, ".");
                        if(s)
                        {
                           *s = 0;
                           s++;
                           pos = atoi(s);
                        }
                        else
                           sflnprintln("what?");
                        if(parentType == functions)
                        {
                           parameterDoc = ParameterDoc { description = doc, position = pos };
                           doc = null;
                           if(!functionDoc.parameters)
                              functionDoc.parameters = { };
                           functionDoc.parameters[name] = parameterDoc;
                        }
                        else if(parentType == methods)
                        {
                           parameterDoc = ParameterDoc { description = doc, position = pos };
                           doc = null;
                           if(!methodDoc.parameters)
                              methodDoc.parameters = { };
                           methodDoc.parameters[name] = parameterDoc;
                        }
                        else
                           sflnprintln("what?");
                     }
                     else if(type == values)
                     {
                        ValueDoc valueDoc { description = doc };
                        doc = null;
                        if(!classDoc.values)
                           classDoc.values = { };
                        classDoc.values[fileName] = valueDoc;
                     }
                     else if(type == fields)
                     {
                        FieldDoc fieldDoc { description = doc };
                        doc = null;
                        if(!classDoc.fields)
                           classDoc.fields = { };
                        classDoc.fields[fileName] = fieldDoc;
                     }
                     else if(type == properties)
                     {
                        PropertyDoc propertyDoc { description = doc };
                        doc = null;
                        if(!classDoc.properties)
                           classDoc.properties = { };
                       classDoc.properties[fileName] = propertyDoc;
                     }
                     else if(type == conversions)
                     {
                        ConversionDoc conversionDoc { description = doc };
                        doc = null;
                        if(!classDoc.conversions)
                           classDoc.conversions = { };
                        classDoc.conversions[fileName] = conversionDoc;
                     }
                     else
                        sflnprintln("what?");
                  }
                  delete doc;
               }
               return true;
            }
         };
         fsi.nsDir[0] = '\0';
         PathCatSlash(fsi.nsDir, docFilePath);
         fsi.typeStack.Add(root);
         fsi.namespaces.Add((fsi.ns = { namespaceDoc = { }, nsPath = CopyString(fsi.nsDir) }));
         fsi.nsStack.Add(fsi.ns);
         sprintf(fileName, "<%s>", oldDocFilePath);
         fsi.iterate(fileName);
         for(ns : fsi.namespaces)
         {
            writeNamespaceDocFile(ns.namespaceDoc, ns.nsPath);
            for(c : ns.classes)
            {
               writeClassDocFile(c, ns.nsPath);
            }
         }
      }
   }
   else
   {
      PrintLn("Info: old eCdoc format file (", oldDocFilePath, ") does not exist.");
   }

   for(m = module.modules.first; m; m = m.next)
   {
      if(m.importMode == publicAccess || !isDll)
         ConvertModuleDoc(m.module, true);
   }
}

void getDocFilePath(char * docFilePath, char * docDir, Module module, NameSpace * ns, bool includeDir, bool old)
{
   sprintf(docFilePath, old ? "%s%s%s.eCdoc" : "%s%s%s", includeDir ? docDir : "", includeDir ? "/" : "",
         (!module || !module.name ||
               (ns && ns->name && !strcmp(ns->name, "namespaces/ecere/namespaces/com"))) ? "ecereCOM" : module.name);
}

static void writeNamespaceDocFile(NamespaceDoc namespaceDoc, const char * path)
{
   if(!namespaceDoc.isEmpty)
   {
      char * filePath = new char[MAX_LOCATION];
      File f;
      strcpy(filePath, path);
      PathCatSlash(filePath, "_global-defs");
      ChangeExtension(filePath, "econ", filePath);
      MakeDir(path);
      DeleteFile(filePath);
      f = FileOpen(filePath, write);
      if(f)
      {
         WriteECONObject(f, class(NamespaceDoc), namespaceDoc, 0);
         delete f;
      }
      else
      {
         PrintLn("error: writeNamespaceDocFile -- problem opening file: ", filePath);
      }
      delete filePath;
   }
}

static void writeClassDocFile(ClassDoc classDoc, const char * path)
{
   if(!classDoc.isEmpty)
   {
      char * name = getDocFileNameFromTypeName(classDoc.name);
      char * filePath = new char[MAX_LOCATION];
      File f;
      strcpy(filePath, path);
      PathCatSlash(filePath, name);
      ChangeExtension(filePath, "econ", filePath);
      DeleteFile(filePath);
      f = FileOpen(filePath, write);
      if(f)
      {
         WriteECONObject(f, class(ClassDoc), classDoc, 0);
         delete f;
      }
      else
      {
         PrintLn("error: writeClassDocFile -- problem opening file: ", filePath);
      }
      delete name;
      delete filePath;
   }
}

Application componentsApp;

class Convertor : Application
{
   char * moduleName;;
   char * convertDocDir;
   char * outputDocDir;

   bool Init()
   {
      SetGlobalContext(globalContext);
      SetExcludedSymbols(&excludedSymbols);
      SetDefines(&::defines);
      SetImports(&imports);
      SetInDocumentor(true);

      SetGlobalData(globalData);

      if(argc == 3 || argc == 4)
      {
         convertDocDir = CopyString(argv[1]);
         outputDocDir = CopyString(argv[2]);
         if(argc == 4)
            moduleName = CopyString(argv[3]);
         else
            moduleName = CopyString("ecere");
         return true;
      }
      return false;
   }

   void Main()
   {
      if(Init())
      {
         OpenModule(moduleName);
      }
      else
      {
         PrintLn($"Syntax: exename <old doc dir> <new doc dir> [<module name>]");
      }
      system("pause");
   }

   void Terminate()
   {
      delete moduleName;
      delete convertDocDir;
      delete outputDocDir;

      FreeContext(globalContext);
      FreeExcludedSymbols(excludedSymbols);
      ::defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);

      FreeGlobalData(globalData);
      FreeTypeData(componentsApp);
      FreeIncludeFiles();
      delete componentsApp;
   }

   void OpenModule(const char * filePath)
   {
      char moduleName[MAX_LOCATION];
      char extension[MAX_EXTENSION];
      Module module = null;
      static char symbolsDir[MAX_LOCATION];

      FreeContext(globalContext);
      FreeExcludedSymbols(excludedSymbols);
      ::defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);

      FreeGlobalData(globalData);
      FreeIncludeFiles();
      if(componentsApp)
      {
         FreeTypeData(componentsApp);
         delete componentsApp;
      }

      componentsApp = __ecere_COM_Initialize(false, 1, null);
      SetPrivateModule(componentsApp);

      StripLastDirectory(filePath, symbolsDir);
      SetSymbolsDir(symbolsDir);

      GetExtension(filePath, extension);

      ImportModule(filePath, normalImport, publicAccess, false);

      if(extension[0] && strcmpi(extension, "so") && strcmpi(extension, "dll") && strcmpi(extension, "dylib"))
         componentsApp.name = CopyString(filePath);

      for(module = componentsApp.allModules.first; module; module = module.next)
      {
         if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")))
            break;
      }
      if(!module)
         eModule_LoadStrict(componentsApp, "ecereCOM", publicAccess /*privateAccess*/);

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

      ConvertModuleDoc(componentsApp, false);
   }
}

class DocConvertNamespaceStackFrame
{
   NamespaceDoc namespaceDoc { };
   Array<ClassDoc> classes { };
   char * nsPath;
}

enum DocConvertLocType { root, namespaces, functions, parameters, classes, values, fields, properties, conversions, methods };

class DocConvertIterator : NormalFileSystemIterator
{
   char * nsDir;

   bool getNext;
   Array<String> nameStack { };
   Array<DocConvertLocType> typeStack { };
   Array<DocConvertNamespaceStackFrame> nsStack { };
   Array<DocConvertNamespaceStackFrame> namespaces { };
   DocConvertNamespaceStackFrame ns;
   DefineDoc defineDoc;
   FunctionDoc functionDoc;
   ClassDoc classDoc;
   MethodDoc methodDoc;

   void addType(DocConvertLocType type)
   {
      typeStack.Add(type);
      getNext = true;
   }
   void exitType()
   {
      typeStack.Remove(typeStack.lastIterator.pointer);
      getNext = false;
   }

   DocConvertIterator()
   {
      nsDir = new char[MAX_LOCATION];
   }
   ~DocConvertIterator()
   {
      delete nsDir;
   }
}

public class NormalFileSystemIterator : FileSystemIterator
{
public:
   Array<StackFrame> stack { };

   char * extensions;
   property char * extensions { set { delete extensions; if(value) extensions = CopyString(value); } }

   ~NormalFileSystemIterator()
   {
      delete extensions;
   }

   void iterate(const char * startPath)
   {
      StackFrame frame;
      char startName[MAX_FILENAME];
      startName[0] = '\0';
      GetLastDirectory(startPath, startName);

      onInit(startPath, startName);
      {
         frame = StackFrame { };
         stack.Add(frame);
         frame.path = CopyString(startPath);
         frame.listing = FileListing { startPath, extensions = extensions };
      }

      if(iterateStartPath)
      {
         FileAttribs attribs = FileExists(startPath);
         if(attribs.isDrive)
            onVolume(startPath);
         else
         {
            if(attribs.isDirectory)
               onFolder(startPath, startName);
            else if(attribs.isFile)
               onFile(startPath, startName);
         }
      }

      while(stack.count)
      {
         if(frame.listing.Find())
         {
            bool peek = frame.listing.stats.attribs.isDirectory && onFolder(frame.listing.path, frame.listing.name);
            if(!frame.listing.stats.attribs.isDirectory)
            {
               onFile(frame.listing.path, frame.listing.name);
            }
            else if(peek)
            {
               StackFrame newFrame { };
               stack.Add(newFrame);
               newFrame.path = CopyString(frame.listing.path);
               newFrame.listing = FileListing { newFrame.path, extensions = frame.listing.extensions };
               frame = newFrame;
            }
         }
         else
         {
            StackFrame parentFrame = stack.count > 1 ? stack[stack.count - 2] : null;
            outFolder(parentFrame ? parentFrame.listing.path : startPath, parentFrame ? parentFrame.listing.name : startName, !parentFrame);
            stack.lastIterator.Remove();
            if(stack.count)
               frame = stack.lastIterator.data;
            else
               frame = null;
         }
      }
   }
}

public class FileSystemIterator
{
public:
   bool iterateStartPath;

   virtual bool onInit(const char * startPath, const char * startName)
   {
      return false;
   }

   virtual bool onFile(const char * filePath, const char * fileName)
   {
      return true;
   }

   virtual bool onFolder(const char * folderPath, const char * folderName)
   {
      return true;
   }

   virtual bool onVolume(const char * volumePath)
   {
      return true;
   }

   virtual void outFolder(const char * folderPath, const char * folderName, bool isRoot)
   {
   }
}

public class StackFrame
{
   int tag;
   char * path;
   FileListing listing;

   ~StackFrame()
   {
      delete path;
   }
};
