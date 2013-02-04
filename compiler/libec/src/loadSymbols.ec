import "ecdefs"

extern int yychar;

NameSpace * globalData;
public void SetGlobalData(NameSpace * nameSpace) { globalData = nameSpace; }

OldList dataRedefinitions;

// #define MAX_INCLUDE_DEPTH 10

extern char sourceFileStack[MAX_INCLUDE_DEPTH][MAX_LOCATION];
extern int include_stack_ptr;

static int numIncludes;
static char ** includes;

bool inIDE = false;
public void SetInIDE(bool b) { inIDE = b; }
List<String> sourceDirs;

public void SetSourceDirs(List<String> list) { sourceDirs = list; }

OldList * includeDirs, * sysIncludeDirs;

public void SetIncludeDirs(OldList * list) { includeDirs = list; }
public void SetSysIncludeDirs(OldList * list) { sysIncludeDirs = list; }

// TOFIX: Declaration reordering error if right before above functions
// OldList * includeDirs, * sysIncludeDirs;

bool ecereImported;
public void SetEcereImported(bool b) { ecereImported = b; } public bool GetEcereImported() { return ecereImported; }
bool inPreCompiler = false;
public void SetInPreCompiler(bool b) {inPreCompiler = b; }
OldList * precompDefines;
public void SetPrecompDefines(OldList * list) { precompDefines = list; }

public bool DummyMethod()
{
   return true;
}

static void ReadDataMembers(Class regClass, DataMember member, File f)
{
   char line[1024];
   char name[1024];
   int size = 0, bitPos = -1;
   AccessMode memberAccess = publicAccess;

   for(;;)
   {
      if(!f.GetLine(line, sizeof(line))) break;
      TrimLSpaces(line, line);
      if(!strcmp(line, ".")) break;
      if(line[0] == '[')
      {
         if(!strcmp(line, "[Size]"))
         {
            f.GetLine(line, sizeof(line));
            TrimLSpaces(line, line);
            size = strtol(line, null, 0);
         }
         else if(!strcmp(line, "[Pos]"))
         {
            f.GetLine(line, sizeof(line));
            TrimLSpaces(line, line);
            bitPos = strtol(line, null, 0);
         }
         else if(!strcmp(line, "[Public]"))
            memberAccess = publicAccess;
         else if(!strcmp(line, "[Private]"))
            memberAccess = privateAccess;
         else if(!strcmp(line, "[Type]"))
         {
            f.GetLine(line, sizeof(line));
            TrimLSpaces(line, line);

            if(member)
            {
               if(!eMember_AddDataMember(member, name, line[0] ? line : 0, 0, 0 /*size *//*type->size*/, memberAccess))
                  ;//Compiler_Error($"Member with same name already exists %s in member %s\n", name, member->name);
            }
            else if(regClass && regClass.type == bitClass)
            {
               //eClass_AddBitMember(regClass, name, line[0] ? line : 0, size, bitPos);
               BitMember member = eClass_AddBitMember(regClass, name, line[0] ? line : 0, 0, 0, memberAccess);
               member.size = size;
               member.pos = bitPos;
            }
            else if(regClass)
            {
               if(!eClass_AddDataMember(regClass, name, line[0] ? line : 0, 0, 0 /*size *//*type->size*/, memberAccess))
                  ;//Compiler_Error($"Member with same name already exists %s in class %s\n", name, regClass.fullName);
            }
         }
         else if(!strcmp(line, "[Struct]") || !strcmp(line, "[Union]"))
         {
            DataMember dataMember = (regClass || member) ? eMember_New((!strcmp(line, "[Union]")) ? unionMember : structMember, memberAccess) : null;
            ReadDataMembers(null, dataMember, f);
            if(member)
            {
               if(!eMember_AddMember(member, dataMember))
                  ;//Compiler_Error($"Member with same name already exists %s in member %s\n", name, member->name);
            }
            else if(regClass)
            {
               if(!eClass_AddMember(regClass, dataMember))
                  ;//Compiler_Error($"Member with same name already exists %s in class %s\n", name, regClass.name);
            }
         }
      }
      else
      {
         size = 0;
         bitPos = -1;
         strcpy(name, line);
         memberAccess = publicAccess;
      }
   }
}

// This should register the stuff only...
// But also call ImportModule
public bool LoadSymbols(char * fileName, ImportType importType, bool loadDllOnly)
{
   File f = FileOpenBuffered(fileName, read);
   bool globalInstance = false;
   if(f)
   {
      bool ecereCOMModule = false;
      char moduleName[MAX_LOCATION];
      GetLastDirectory(fileName, moduleName);
      // TEMP: UNTIL WE CAN HAVE PER SOURCE FILE PREPROCESSOR DEFINITIONS...
      if(
         !(strcmpi(moduleName, "instance.sym") && strcmpi(moduleName, "BinaryTree.sym") &&
         strcmpi(moduleName, "dataTypes.sym") && strcmpi(moduleName, "OldList.sym") &&
         strcmpi(moduleName, "String.sym") && strcmpi(moduleName, "BTNode.sym") &&
         strcmpi(moduleName, "Array.sym") && strcmpi(moduleName, "AVLTree.sym") &&
         strcmpi(moduleName, "BuiltInContainer.sym") && strcmpi(moduleName, "Container.sym") &&
         strcmpi(moduleName, "CustomAVLTree.sym") && strcmpi(moduleName, "LinkList.sym") &&
         strcmpi(moduleName, "List.sym") && strcmpi(moduleName, "Map.sym") &&
         strcmpi(moduleName, "Mutex.sym")))
         ecereCOMModule = true;

      for(;;)
      {
         char line[1024];
         if(!f.GetLine(line, sizeof(line))) break;
         TrimLSpaces(line, line);

         if(line[0] == '[')
         {

            if(!strcmp(line, "[Global Instance]"))
               globalInstance = true;
            else if(!strcmp(line, "[Defined Classes]"))
            {
               Class regClass = null;
               char name[1024];
               bool isRemote = false;
               bool isStatic = false;
               bool isWatchable = false;
               ClassType classType = normalClass;
               bool fixed = false;
               bool noExpansion = false;
               AccessMode inheritanceAccess = publicAccess;
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;

                  if(line[0] == '[')
                  {
                     if(!strcmp(line, "[Remote]"))
                        isRemote = true;
                     else if(!strcmp(line, "[Static]"))
                        isStatic = true;
                     else if(!strcmp(line, "[Fixed]"))
                        fixed = true;
                     else if(!strcmp(line, "[No Expansion]"))
                        noExpansion = true;
                     else if(!strcmp(line, "[Watchable]"))
                        isWatchable = true;
                     else if(!strcmp(line, "[Enum]"))
                        classType = enumClass;
                     else if(!strcmp(line, "[Bit]"))
                        classType = bitClass;
                     else if(!strcmp(line, "[Struct]"))
                        classType = structClass;
                     else if(!strcmp(line, "[Unit]"))
                        classType = unitClass;
                     else if(!strcmp(line, "[NoHead]"))
                        classType = noHeadClass;
                     else if(!strcmp(line, "[Base]") || !strcmp(line, "[Private Base]"))
                     {
                        if(!strcmp(line, "[Private Base]"))
                           inheritanceAccess = privateAccess;

                        f.GetLine(line, sizeof(line));
                        TrimLSpaces(line, line);

                        if(importType == preDeclImport)
                           DeclClass(0, name);
                        if(isStatic || loadDllOnly || importType == preDeclImport || importType == comCheckImport)
                          regClass = null;
                        else if(regClass = eSystem_FindClass(privateModule, name), !regClass || regClass.internalDecl || regClass.isRemote)
                        {
                           Symbol existingClass = FindClass(name);
                           char * baseName = (classType == normalClass && importType == remoteImport && isRemote) ? "DCOMClientObject" : (!strcmp(line, "[None]") ? null : line);
                           //Symbol baseSymbol = baseName ? FindClass(baseName) : null;
                           //if(baseSymbol && !baseSymbol->registered)
                           /*if(classType != unitClass && classType != bitClass && classType != enumClass && baseName && !eSystem_FindClass(privateModule, baseName))
                           {
                              Compiler_Error($"Base class %s undefined\n", baseName);
                              DeclClass(0, name);
                              regClass = null;
                              continue;
                           }
                           */

                           if(!isRemote || (importType != remoteImport) || (!sourceFile || !strstr(sourceFile, ".main.ec")))
                           {
                              if(!regClass || regClass.internalDecl)
                                 regClass = eSystem_RegisterClass(classType, name, isRemote ? null : baseName, 0, 0, null, null, privateModule, ecereCOMModule ? baseSystemAccess : publicAccess, inheritanceAccess);
                              if(/*importType == Remote && */regClass && isRemote)
                                 regClass.isRemote = (importType == remoteImport) ? 1 : 2;

                              if(isRemote)
                              {
                                 if(importType == remoteImport)
                                 {
                                    char className[1024] = "DCOMClient_";
                                    strcat(className, name);
                                    if(!existingClass)
                                       existingClass = DeclClass(0, name);
                                    regClass = eSystem_RegisterClass(classType, className, baseName, 0, 0, null, null, privateModule, ecereCOMModule ? baseSystemAccess : publicAccess, inheritanceAccess);
                                 }
                                 if(regClass)
                                    regClass.isRemote = (importType == remoteImport) ? 1 : 3;
                              }

                              // Update templated classes
                              if(existingClass)
                              {
                                 OldLink link;
                                 for(link = existingClass.templatedClasses.first; link; link = link.next)
                                 {
                                    Symbol symbol = link.data;
                                    symbol.registered = eSystem_FindClass(privateModule, symbol.string);
                                 }
                              }

                              if(fixed)
                                 regClass.fixed = true;
                              if(noExpansion)
                                 regClass.noExpansion = true;

                              if(isWatchable)
                              {
                                 eClass_DestructionWatchable(regClass);
                                 regClass.structSize = regClass.offset;    // THIS COULD PROBABLY BENEFIT FROM SOME EXPLANATIONS...
                              }

                              // Added this
                              if(regClass && existingClass)
                              {
                                 existingClass.registered = regClass;
                                 regClass.symbol = existingClass; // TESTING THIS
                                 existingClass.id = MAXINT;
                                 existingClass.idCode = MAXINT;
                                 existingClass.imported = true;
                                 if(regClass.module)
                                    existingClass.module = FindModule(regClass.module);
                                 else
                                    existingClass.module = mainModule;
                              }
                           }
                           else
                              regClass = null;
                        }
                        else
                           regClass = null;
                        isRemote = false;
                        isWatchable = false;
                        fixed = false;
                        isStatic = false;
                     }
                     else if(!strcmp(line, "[Enum Values]"))
                     {
                        for(;;)
                        {
                           char * equal;
                           
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;

                           if(regClass)
                           {
                              equal = strchr(line, '=');
                              if(equal)
                              {
                                 char name[1024];
                                 memcpy(name, line, (int)(equal - line));
                                 name[equal - line] = '\0';
                                 TrimLSpaces(name, name);
                                 TrimRSpaces(name, name);
                                 eEnum_AddFixedValue(regClass, name, atoi(equal + 1));
                              }
                              else
                              {
                                 eEnum_AddValue(regClass, line);
                              }
                           }
                        }
                     }
                     else if(!strcmp(line, "[Defined Methods]"))
                     {
                        char name[1024];
                        bool isVirtual = false;
                        AccessMode memberAccess = publicAccess;
                        for(;;)
                        {
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;
                           if(line[0] == '[')
                           {
                              if(!strcmp(line, "[Type]"))
                              {
                                 f.GetLine(line, sizeof(line));
                                 if(regClass)
                                 {
                                    TrimLSpaces(line, line);
                                    if(isVirtual)
                                       eClass_AddVirtualMethod(regClass, name, line[0] ? line : 0, DummyMethod, memberAccess);
                                    else
                                       eClass_AddMethod(regClass, name, line[0] ? line : 0, DummyMethod, memberAccess);
                                 }
                              }
                              else if(!strcmp(line, "[Virtual]"))
                                 isVirtual = true;
                              else if(!strcmp(line, "[Public]"))
                                 memberAccess = publicAccess;
                              else if(!strcmp(line, "[Private]"))
                                 memberAccess = privateAccess;
                           }
                           else
                           {
                              strcpy(name, line);                              
                              isVirtual = false;
                              memberAccess = publicAccess;
                           }
                        }
                     }
                     else if(!strcmp(line, "[Defined Properties]"))
                     {
                        char name[1024];
                        bool setStmt = false, getStmt = false, isVirtual = false, conversion = false;
                        bool isWatchable = false;
                        AccessMode memberAccess = publicAccess;
                        for(;;)
                        {
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;
                           if(line[0] == '[')
                           {
                              if(!strcmp(line, "[Type]"))
                              {
                                 // Set type , set , get
                                 f.GetLine(line, sizeof(line));
                                 TrimLSpaces(line, line);
                                 if(regClass)
                                 {
                                    Property prop = eClass_AddProperty(regClass, conversion ? null : name, line[0] ? line : 0, (void *)setStmt, (void *)getStmt, memberAccess);
                                    if(prop)
                                    {
                                       prop.compiled = false;
                                       if(isWatchable)
                                       {
                                          eProperty_Watchable(prop);
                                          regClass.structSize = regClass.offset; // THIS COULD PROBABLY BENEFIT FROM SOME EXPLANATIONS
                                       }
                                    }
                                 }
                              }
                              else if(!strcmp(line, "[Set]"))
                                 setStmt = true;
                              else if(!strcmp(line, "[Get]"))
                                 getStmt = true;
                              else if(!strcmp(line, "[Watchable]"))
                                 isWatchable = true;
                              else if(!strcmp(line, "[Public]"))
                                 memberAccess = publicAccess;
                              else if(!strcmp(line, "[Private]"))
                                 memberAccess = privateAccess;
                              else if(!strcmp(line, "[Conversion]"))
                              {
                                 conversion = true;
                                 setStmt = getStmt = isVirtual = isWatchable = false;
                              }
                           }
                           else
                           {
                              strcpy(name, line);
                              setStmt = getStmt = isVirtual = conversion = isWatchable = false;
                              memberAccess = publicAccess;
                           }
                        }
                     }
                     else if(!strcmp(line, "[Defined Class Properties]"))
                     {
                        char name[1024];
                        bool setStmt = false, getStmt = false;
                        for(;;)
                        {
                           if(!f.GetLine(line, sizeof(line))) break;
                           TrimLSpaces(line, line);
                           if(!strcmp(line, ".")) break;
                           if(line[0] == '[')
                           {
                              if(!strcmp(line, "[Type]"))
                              {
                                 // Set type , set , get
                                 f.GetLine(line, sizeof(line));
                                 TrimLSpaces(line, line);
                                 if(regClass)
                                 {
                                    eClass_AddClassProperty(regClass, name, line, (void *)setStmt, (void *)getStmt);
                                 }
                              }
                              else if(!strcmp(line, "[Set]"))
                                 setStmt = true;
                              else if(!strcmp(line, "[Get]"))
                                 getStmt = true;
                           }
                           else
                           {
                              strcpy(name, line);
                              setStmt = getStmt = false;
                           }
                        }
                     }
                     else if(!strcmp(line, "[Defined Data Members]"))
                     {
                        ReadDataMembers(regClass, null, f);
                     }
                     else if(!strcmp(line, "[Template Parameters]"))
                     {
                        while(!f.Eof())
                        {
                           char name[1024];
                           TemplateParameterType type = TemplateParameterType::type;
                           ClassTemplateArgument defaultArg { };
                           void * info = null;

                           f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                           if(line[0] == '.') break;
                           strcpy(name, line);

                           f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                           if(!strcmp(line, "[Expression]")) type = expression;
                           else if(!strcmp(line, "[Identifier]")) type = identifier;

                           //printf("Inside template parameters\n");
                           switch(type)
                           {
                              case TemplateParameterType::type:
                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 if(regClass && strcmp(line, "[None]"))
                                 {
                                    info = CopyString(line);      // FIXME: MEMORY LEAK
                                 }

                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 // printf("%s\n", line);

                                 if(regClass && strcmp(line, "[None]"))
                                 {
                                    defaultArg.dataTypeString = CopyString(line);   // FIXME: MEMORY LEAK
                                 }
                                 break;
                              case expression:
                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 // Data type string (reusing base)
                                 if(regClass && strcmp(line, "[None]"))
                                 {
                                    info = CopyString(line);   // FIXME: MEMORY LEAK
                                 }

                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 if(regClass && strcmp(line, "[None]"))
                                 {
                                    Operand op;
                                    Expression exp;
                                    Location oldLocation = yylloc;

                                    File backFileInput = fileInput;
                                    declMode = 0;
                                    resetScanner();

                                    exp = ParseExpressionString(line);
                                    if(info)
                                       exp.destType = ProcessTypeString(info, false);
                                    ProcessExpressionType(exp);
                                    ComputeExpression(exp);
                                    op = GetOperand(exp);
                                    defaultArg.expression.ui64 = op.ui64;
                                    FreeExpression(exp);

                                    // TESTING THIS SCANNER RESUME STUFF
                                    resetScanner();
                                    yylloc = oldLocation;
                                    fileInput = backFileInput;
                                    if(fileInput)
                                    {
                                       fileInput.Seek(yylloc.start.pos, start); 
                                       resetScannerPos(&yylloc.start);
                                       yychar = -2;
                                    }
                                 }
                                 break;
                              case identifier:
                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 if(!strcmp(line, "[Data member]")) info = (void *)TemplateMemberType::dataMember;
                                 else if(!strcmp(line, "[Method]")) info = (void *)TemplateMemberType::method;
                                 else if(!strcmp(line, "[Property]")) info = (void *)TemplateMemberType::prop;

                                 f.GetLine(line, sizeof(line)); TrimLSpaces(line, line);
                                 if(regClass && strcmp(line, "[None]"))
                                 {
                                    defaultArg.memberString = CopyString(line);
                                 }
                                 break;
                           }
                           if(regClass)
                              eClass_AddTemplateParameter(regClass, name, type, info, defaultArg);
                           if(type == TemplateParameterType::type || type == TemplateParameterType::expression)
                              delete info;
                           if(type == TemplateParameterType::type || type == TemplateParameterType::identifier)
                              delete defaultArg.dataTypeString;                           
                        }
                        if(regClass)
                           eClass_DoneAddingTemplateParameters(regClass);
                     }
                  }
                  else
                  {
                     inheritanceAccess = publicAccess;
                     classType = normalClass;
                     isRemote = false;
                     strcpy(name, line);
                     regClass = null;
                  }
               }
            }
            else if(!strcmp(line, "[Defined Expressions]"))
            {
               char name[1024];
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;
                  if(!strcmp(line, "[Value]")) 
                  {
                     f.GetLine(line, sizeof(line));
                     TrimLSpaces(line, line);
                     if(!loadDllOnly && importType != preDeclImport && importType != comCheckImport)
                        eSystem_RegisterDefine(name, line, privateModule, ecereCOMModule ? baseSystemAccess : publicAccess);
                  }
                  else if(line[0] != '[')
                  {
                     strcpy(name, line);
                  }
               }
            }
            else if(!strcmp(line, "[Defined Functions]"))
            {
               char name[1024];
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;
                  if(!strcmp(line, "[Type]")) 
                  {
                     f.GetLine(line, sizeof(line));
                     TrimLSpaces(line, line);
                     if(!loadDllOnly && importType != preDeclImport && importType != comCheckImport)
                        eSystem_RegisterFunction(name, line, null, privateModule, ecereCOMModule ? baseSystemAccess : publicAccess);
                  }
                  else if(line[0] != '[')
                  {
                     strcpy(name, line);
                  }
               }
            }
            else if(!strcmp(line, "[Defined Data]"))
            {
               char name[1024];
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;
                  if(!strcmp(line, "[Type]")) 
                  {
                     f.GetLine(line, sizeof(line));
                     TrimLSpaces(line, line);

                     if(!loadDllOnly && importType != preDeclImport && importType != comCheckImport)
                     {
                        int start = 0, c;
                        NameSpace * nameSpace = globalData;
                        GlobalData data;

                        // Register Global Data
                        for(c = 0; name[c]; c++)
                        {
                           if(name[c] == '.' || (name[c] == ':' && name[c+1] == ':'))
                           {
                              NameSpace * newSpace;

                              char * spaceName = new char[c - start + 1];
                              strncpy(spaceName, name + start, c - start);
                              spaceName[c-start] = '\0';

                              newSpace = (NameSpace *)nameSpace->nameSpaces.FindString(spaceName);
                              if(!newSpace)
                              {
                                 newSpace = new0 NameSpace[1];
                                 newSpace->classes.CompareKey = (void *)BinaryTree::CompareString;
                                 newSpace->defines.CompareKey = (void *)BinaryTree::CompareString;
                                 newSpace->functions.CompareKey = (void *)BinaryTree::CompareString;
                                 newSpace->nameSpaces.CompareKey = (void *)BinaryTree::CompareString;
                                 newSpace->name = spaceName;
                                 newSpace->parent = nameSpace;
                                 nameSpace->nameSpaces.Add((BTNode)newSpace);
                              }
                              else
                                 delete spaceName;
                              nameSpace = newSpace;
                              if(name[c] == ':') c++;
                              start = c+1;         
                           }
                        }
                        if(c - start)
                        {
                           // TOFIX:
                           //if(!(data = (GlobalData)nameSpace->functions.FindString(name)))
                           data = (GlobalData)nameSpace->functions.FindString(name + start);
                           if(!data)
                           {
                              data = GlobalData
                              {
                                 fullName = CopyString(name),
                                 dataTypeString = CopyString(line),
                                 module = privateModule
                              };
                              data.key = (uintptr)(data.fullName + start);
                              // Reusing functions here...
                              nameSpace->functions.Add((BTNode)data);
                           }
                           else if(strcmp(data.dataTypeString, line))
                           {
                              DataRedefinition redefinition { };
                              strcpy(redefinition.name, name);
                              strcpy(redefinition.type1, data.dataTypeString);
                              strcpy(redefinition.type2, line);
                              dataRedefinitions.Add(redefinition);
                           }
                        }
                     }
                  }
                  else if(line[0] != '[')
                  {
                     strcpy(name, line);
                  }
               }
            }
            else if(!strcmp(line, "[Imported Modules]"))
            {
               ImportType moduleImportType = normalImport;
               AccessMode importAccess = publicAccess;
               for(;;)
               {
                  if(!f.GetLine(line, sizeof(line))) break;
                  TrimLSpaces(line, line);
                  if(!strcmp(line, ".")) break;
                  if(!strcmp(line, "[Static]")) moduleImportType = staticImport;
                  else if(!strcmp(line, "[Remote]")) moduleImportType = remoteImport;
                  else if(!strcmp(line, "[Private]")) importAccess = privateAccess;
                  else if(line[0] != '[')
                  {
                     if(importType != preDeclImport && importType != comCheckImport)
                        ImportModule(line, moduleImportType, importAccess, loadDllOnly);
                     else
                        ImportModule(line, comCheckImport, importAccess, loadDllOnly);
                     if(!strcmp(line, "ecere"))
                        ecereImported = true;
                     moduleImportType = normalImport;
                     importAccess = publicAccess;
                  }
               }
            }
         }
      }
      delete f;
   }
   else if(importType != comCheckImport)
   {
      Compiler_Error($"Couldn't open %s\n", fileName);
   }
   return globalInstance;
}

Map<String, List<Module> > loadedModules { };

// (Same function as in actual compiler)
public void ImportModule(char * name, ImportType importType, AccessMode importAccess, bool loadDllOnly)
{
   ImportedModule module = null;
   char moduleName[MAX_FILENAME];

   strncpy(moduleName, name, MAX_FILENAME-1);
   moduleName[MAX_FILENAME-1] = 0;
   StripExtension(moduleName);

   for(module = defines->first; module; module = module.next)
   {
      if(module.type == moduleDefinition && !strcmpi(module.name, moduleName))
         break;
   }
   if((!module || (module.dllOnly && !loadDllOnly)) && strlen(name) < MAX_FILENAME)
   {
      char ext[MAX_EXTENSION];
      Module loadedModule = null;
      char symFile[MAX_LOCATION];
      symFile[0] = '\0';

      GetExtension(name, ext);

      strcpy(symFile, symbolsDir ? symbolsDir : "");
      PathCat(symFile, name);
      ChangeExtension(symFile, "sym", symFile);

      if(!strcmp(ext, "dll") || !strcmp(ext, "dll") || !ext[0])
      {
         if(importType != comCheckImport)
         {
            if(!module)
            {
               if(precompDefines)
               {
                  module = ImportedModule
                  {
                     name = CopyString(moduleName),
                     type = moduleDefinition,
                     importType = importType,
                     importAccess = importAccess
                  };
                  precompDefines->Add(module);
               }
               module = ImportedModule
               {
                  name = CopyString(moduleName),
                  type = moduleDefinition,
                  importType = importType,
                  importAccess = importAccess
               };
               defines->AddName(module);
            }
            module.dllOnly = loadDllOnly;

            if(ext[0] || !FileExists(symFile))
            {
               bool skipLoad = false;
               List<Module> list = null;

               char file[MAX_FILENAME];
               strcpy(file, name);
               StripExtension(file);

               // Load an extra instance of any shared module to ensure freeing up a 
               // module loaded in another file will not invalidate our objects.
               if(!inCompiler)
               {
                  MapIterator<String, List<Module> > it { map = loadedModules };
                  if(!it.Index(file, false))
                  {
                     Module firstModule = eModule_LoadStrict(__thisModule, file, importAccess);
                     if(firstModule)
                     {
                        list = { };
                        list.Add(firstModule);
                        loadedModules[file] = list;
                     }
                     else
                        skipLoad = true;
                  }
                  else
                     list = it.data;
               }

               if(!skipLoad)
               {
                  loadedModule = eModule_LoadStrict(privateModule, file, importAccess);
                  if(loadedModule)
                  {
                     loadedModule.importType = importType;
                     module.dllOnly = false;    // If this is truly a dll, no need to reload it again...
                     if(list) list.Add(loadedModule);
                  }
               }
            }
         }
      }
      if(!loadedModule && (!strcmp(ext, "ec") || !strcmp(ext, "sym") || !ext[0]))
      {
         //if(symbolsDir)
         {
            if(!module)
            {
               if(precompDefines)
               {
                  module = ImportedModule
                  {
                     name = CopyString(moduleName),
                     type = moduleDefinition,
                     importType = importType,
                     importAccess = importAccess
                  };
                  precompDefines->Add(module);
               }
               module = ImportedModule
               {
                  name = CopyString(moduleName),
                  type = moduleDefinition,
                  importType = importType,
                  importAccess = importAccess
               };
               defines->AddName(module);
            }
            module.dllOnly = loadDllOnly;

            if(inPreCompiler)
               return;

            if(inIDE && !FileExists(symFile) && sourceDirs /*ide.workspace*/ /*ide.projectView*/)
            {
               for(dir : sourceDirs)
               {
                  char configDir[MAX_FILENAME];
                  strcpy(symFile, dir);
                  // PathCat(symFile, "Debug");
                  PathCat(symFile, "obj");
                  sprintf(configDir, "debug.%s", (GetRuntimePlatform() == win32) ? "win32" : "linux");
                  PathCat(symFile, configDir);

                  PathCat(symFile, name);
                  ChangeExtension(symFile, "sym", symFile);
                  if(FileExists(symFile))
                     break;
               }
            }

            // ADDED THIS HERE TO HELP FINDING SYMBOLS IN DOCUMENTOR... HURTS ANYTHING?
            if(!FileExists(symFile))
            {
               char fileName[MAX_FILENAME];
               GetLastDirectory(symFile, fileName);
               strcpy(symFile, symbolsDir ? symbolsDir : "");
               PathCat(symFile, fileName);
            }

            module.globalInstance = LoadSymbols(symFile, importType, loadDllOnly);
         }
      }
   }
}

int FindIncludeFileID(char * includeFile)
{
   int c;
   for(c = 0; c<numIncludes; c++)
      if(!fstrcmp(includes[c], includeFile))
         return c + 1;
   return 0;
}

int GetIncludeFileID(char * includeFile)
{
   int found = FindIncludeFileID(includeFile);
   if(found) 
      return found;

   includes = renew includes char *[numIncludes+1];
   includes[numIncludes++] = CopyString(includeFile);
   return numIncludes;
}

char * GetIncludeFileFromID(int id)
{
   return includes[id-1];
}

// TODO: Add parameter to check system dirs before project dirs
File OpenIncludeFile(char * includeFile)
{
   File file;
   char location[MAX_FILENAME];
   StripLastDirectory(sourceFileStack[(include_stack_ptr >= 0) ? include_stack_ptr : 0], location);
   PathCat(location, includeFile);
   file = FileOpen(location, read);
   if(file)
   {
      strcpy(sourceFileStack[include_stack_ptr + 1], location);
   }
   else if(inIDE)
   {
      // TODO: Add support for project dirs as well as system dirs
      NamedItem includeDir;
      if(includeDirs)
      {
         for(includeDir = includeDirs->first; includeDir; includeDir = includeDir.next)
         {
            strcpy(location, includeDir.name);
            PathCat(location, includeFile);
            file = FileOpen(location, read);
            if(file)
               break;
         }
      }
      if(sysIncludeDirs)
      {
         for(includeDir = sysIncludeDirs->first; includeDir; includeDir = includeDir.next)
         {
            strcpy(location, includeDir.name);
            PathCat(location, includeFile);
            file = FileOpen(location, read);
            if(file)
               break;
         }
      }
   }
   return file;
}

public void FreeIncludeFiles()
{
   int c;
   for(c = 0; c<numIncludes; c++)
      delete includes[c];
   delete includes;
   numIncludes = 0;
}

public void FreeGlobalData(NameSpace globalDataList)
{
   NameSpace * ns;
   GlobalData data;
   // Unload functions
   for(;(ns = (NameSpace *)globalDataList.nameSpaces.root);)
   {
      FreeGlobalData(ns);
      globalDataList.nameSpaces.Remove((BTNode)ns);
      delete ns->name;
      delete ns;
   }
   for(;(data = (GlobalData)globalDataList.functions.root);)
   {
      globalDataList.functions.Remove(data);
      if(data.symbol)
         FreeSymbol(data.symbol);
      FreeType(data.dataType);
      delete data.fullName;
      delete data.dataTypeString;
      delete data;
   }
}

public void CheckDataRedefinitions()
{
   // Delaying this because conflict with main parser...
   DataRedefinition redefinition;
   for(redefinition = dataRedefinitions.first; redefinition; redefinition = redefinition.next)
   {
      // Added this check to resolve namespaces...
      Type type1 = ProcessTypeString(redefinition.type1, false);
      Type type2 = ProcessTypeString(redefinition.type2, false);
      char type1String[1024] = "";
      char type2String[1024] = "";
      PrintType(type1, type1String, false, true);
      PrintType(type2, type2String, false, true);
      if(strcmp(type1String, type2String))
         Compiler_Warning($"Redefinition of %s (defining as %s, already defined as %s)\n", redefinition.name, type1String, type2String);
      FreeType(type1);
      FreeType(type2);
   }
   dataRedefinitions.Free(null);
}
