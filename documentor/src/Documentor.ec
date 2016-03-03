import "ecere"
#if !defined(EAR_TO_ECON_ECDOC)
import "ec"
import "HTMLView"
import "IDESettings"
import "SettingsDialog"

define slashTR = 1 /*outputtingHTML*/ ? "</TR>" : "</TR><br>\n";
define twoBRs = outputtingHTML ? "" : "<br><br>";
define oneBR = outputtingHTML ? "" : "<br>";

public struct BlackWhiteList
{
   bool black;
   AVLTree<const String> avl;

   bool match(const String name)
   {
      bool test = avl ? avl.Find(name) == null : false;
      Print(test ? "" : "");
      return !avl || black == (avl.Find(name) == null);
   }
};

class GenOptions : struct
{
public:
   Map<String, String> funcRename;
   BlackWhiteList defineList;
   BlackWhiteList functionList;
   BlackWhiteList classList;

   ~GenOptions()
   {
      if(funcRename) funcRename.Free();
      delete funcRename;
      if(defineList.avl) defineList.avl.Free();
      delete defineList.avl;
      if(functionList.avl) functionList.avl.Free();
      delete functionList.avl;
      if(classList.avl) classList.avl.Free();
      delete classList.avl;
   }
}

Map<String, GenOptions> moduleGenOptions { };

GenOptions readOptionsFile(const String modulePath)
{
   GenOptions options = null;
   String s;
   s = PrintString(modulePath, ".bgen.econ");
   if(FileExists(s).isFile)
   {
      File f = FileOpen(s, read);
      if(f)
      {
         ECONParser parser { f = f };
         JSONResult jsonResult;
         jsonResult = parser.GetObject(class(GenOptions), &options);
         if(jsonResult == success)
         {
            // nothing to do
         }
         else
            PrintLn("error: failed to load library options file!");
         delete f;
      }
   }
   delete s;
   return options;
}

IDESettings ideSettings;

IDESettingsContainer settingsContainer
{
   dataOwner = &ideSettings;
   dataClass = class(IDESettings);
};

static Context globalContext { };
static OldList defines { };
static OldList imports { };
static NameSpace globalData;
static OldList excludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };
static bool readOnly;

define app = (GuiApplication)__thisModule.application;

#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

default:
/*extern */int __ecereVMethodID_class_OnGetString;
private:


static __attribute__((unused)) void Dummy()
{
   int a;
   a.OnGetString(null, null, null);
}

static bool editing = true;

char tmpLink[1024];

enum CodeObjectType { typeClass, typeData, typeMethod, typeEvent, typeProperty, typeNameSpace, typeDataType, typeEnumValue, typeDataPrivate, typeMethodPrivate, typePropertyPrivate };

static const char * iconNames[CodeObjectType] =
{
   "<:ecere>constructs/class.png",
   "<:ecere>constructs/data.png",
   "<:ecere>constructs/method.png",
   "<:ecere>constructs/event.png",
   "<:ecere>constructs/property.png",
   "<:ecere>constructs/namespace.png",
   "<:ecere>constructs/dataType.png",
   "<:ecere>constructs/enumValue.png",
   "<:ecere>constructs/dataPrivate.png",
   "<:ecere>constructs/methodPrivate.png",
   "<:ecere>constructs/propertyPrivate.png"
};

const char * getIconName(CodeObjectType type)
{
   if(outputtingHTML)
   {
      static char tmpIcon[1024];
      int level = apiLevel;
      tmpIcon[0] = 0;
      while(level--)
         strcat(tmpIcon, "../");
      strcat(tmpIcon, "images");
      strcat(tmpIcon, iconNames[type] + 18);
      return tmpIcon;
   }
   else
      return iconNames[type];
}

void GetTemplateString(Class c, char * templateString)
{
   Module m = c.module.application;
   const char * n = c.name;
   char * lt = strchr(n, '<');
   char * s;
   char ch;
   char curName[256];
   int len = 0;

   memcpy(templateString, n, lt-n);
   templateString[lt-n] = 0;
   strcat(templateString, "</a>");

   for(s = lt; (ch = *s); s++)
   {
      if(ch == '<' || ch == '>' || ch == ',')
      {
         if(len)
         {
            Class pc;
            char * d = templateString + strlen(templateString);
            curName[len] = 0;
            TrimLSpaces(curName, curName);
            TrimRSpaces(curName, curName);
            pc = eSystem_FindClass(m, curName);
            if(pc)
               sprintf(d, "%s<a href=\"%s\" style=\"text-decoration: none;\">%s</a>",
                  !strncmp(curName, "const ", 6) ? "const " : "", getLink(pc, tmpLink), pc.name);
            else
               strcat(d, curName);
         }
         if(ch == '<')
            strcat(templateString, "&lt;");
         else if(ch == '>')
            strcat(templateString, "&gt;");
         else
            strcat(templateString, ", ");
         len = 0;
      }
      else if(ch == '=')
      {
         curName[len++] = ' ';
         curName[len++] = ch;
         curName[len++] = ' ';
         curName[0] = 0;
         strcat(templateString, curName);
         len = 0;
      }
      else
         curName[len++] = ch;
   }
}

// WARNING : This function expects a null terminated string since it recursively concatenate...
static void _PrintType(Type type, char * string, bool printName, bool printFunction, bool fullName)
{
   if(type)
   {
      if(type.constant && (type.kind != pointerType && type.kind != arrayType))
         strcat(string, "const ");
      switch(type.kind)
      {
         case classType:
            if(type._class && type._class.string)
            {
               if(fullName)
                  strcat(string, type._class.string);
               else
               {
                  if(type._class.registered)
                  {
                     char tmpLink[1024];
                     const char * s = type._class.registered.name;
                     strcatf(string, "<a href=\"%s\" style=\"text-decoration: none;\">",
                        getLink(type._class.registered.templateClass ? type._class.registered.templateClass : type._class.registered, tmpLink));
                     if(strchr(s, '<'))
                     {
                        char n[1024];
                        GetTemplateString(type._class.registered, n);
                        strcat(string, n);
                     }
                     else
                        strcat(string, type._class.registered.name);
                     strcat(string, "</a>");
                  }
                  else
                     strcat(string, type._class.string);
               }
            }
            break;
         case pointerType:
         {
            /*Type funcType;
            for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
            if(funcType && funcType.kind == functionType)
            {
               Type param;
               DocPrintType(funcType.returnType, string, false, fullName);
               strcat(string, "(*");
               if(printName || funcType.thisClass)
               {
                  strcat(string, " ");
                  if(funcType.thisClass)
                  {
                     strcat(string, funcType.thisClass.string);
                     strcat(string, "::");
                  }
                  if(type.name)
                     strcat(string, type.name);
               }
               strcat(string, ")(");
               for(param = funcType.params.first; param; param = param.next)
               {
                  DocPrintType(param, string, false, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");
            }
            else*/
            {
               _PrintType(type.type, string, false /*printName*/, printFunction, fullName);
               if(string[strlen(string)-1] == '(')
                  strcat(string, "*");
               else
                  strcat(string, " *");
            }
            break;
         }
         case voidType: strcat(string, "void"); break;
         case intType:  strcat(string, type.isSigned ? "int" : "uint"); break;
         case int64Type:  strcat(string, type.isSigned ? "int64" : "uint64"); break;
         case charType: strcat(string, type.isSigned ? "char" : "byte"); break;
         case shortType: strcat(string, type.isSigned ? "short" : "uint16"); break;
         case floatType: strcat(string, "float"); break;
         case doubleType: strcat(string, "double"); break;
         case structType:
            if(type.enumName)
            {
               strcat(string, "struct ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
            {
               /*
               strcat(string, "struct ");
               strcat(string,"(unnamed)");
               */
               Type member;
               strcat(string, "struct {");
               for(member = type.members.first; member; member = member.next)
               {
                  DocPrintType(member, string, true, fullName);
                  strcat(string,"; ");
               }
               strcat(string,"}");
            }
            break;
         case unionType:
            if(type.enumName)
            {
               strcat(string, "union ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
            {
               strcat(string, "union ");
               strcat(string,"(unnamed)");
            }
            break;
         case enumType:
            if(type.enumName)
            {
               strcat(string, "enum ");
               strcat(string, type.enumName);
            }
            else if(type.typeName)
            {
               strcat(string, type.typeName);
            }
            else
               strcat(string, "enum");
            break;
         case functionType:
         {
            if(printFunction)
            {
               if(type.dllExport)
                  strcat(string, "dllexport ");
               DocPrintType(type.returnType, string, false, fullName);
               strcat(string, " ");
            }

            // DANGER: Testing This
            if(printName)
            {
               if(type.name)
               {
                  if(fullName)
                     strcat(string, type.name);
                  else
                  {
                     char * name = RSearchString(type.name, "::", strlen(type.name), true, false);
                     if(name) name += 2; else name = type.name;
                     strcat(string, "<b>");
                     strcat(string, name);
                     strcat(string, "</b>");
                  }
               }
            }

            if(printFunction)
            {
               Type param;
               strcat(string, "(");
               for(param = type.params.first; param; param = param.next)
               {
                  DocPrintType(param, string, true, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");
            }
            break;
         }
         case arrayType:
         {
            /*Type funcType;
            for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
            if(funcType && funcType.kind == functionType)
            {
               Type param;
               DocPrintType(funcType.returnType, string, false, fullName);
               strcat(string, "(*");
               if(printName || funcType.thisClass)
               {
                  strcat(string, " ");
                  if(funcType.thisClass)
                  {
                     strcat(string, funcType.thisClass.string);
                     strcat(string, "::");
                  }
                  if(type.name)
                     strcat(string, type.name);
               }
               strcat(string, ")(");
               for(param = funcType.params.first; param; param = param.next)
               {
                  DocPrintType(param, string, false, fullName);
                  if(param.next) strcat(string, ", ");
               }
               strcat(string, ")");
            }
            else*/
            {
               char baseType[1024], size[256];
               Type arrayType = type;
               baseType[0] = '\0';
               size[0] = '\0';

               while(arrayType.kind == TypeKind::arrayType)
               {
                  strcat(size, "[");
                  if(arrayType.enumClass)
                     strcat(size, arrayType.enumClass.string);
                  else if(arrayType.arraySizeExp)
                     PrintExpression(arrayType.arraySizeExp, size);
                  //sprintf(string, "%s[%s]", baseType, size);
                  strcat(size, "]");

                  arrayType = arrayType.arrayType;
               }
               _PrintType(arrayType, baseType, printName, printFunction, fullName);
               strcat(string, baseType);
               strcat(string, size);
            }

            /*
               DocPrintType(type.arrayType, baseType, printName, fullName);
               if(type.enumClass)
                  strcpy(size, type.enumClass.string);
               else if(type.arraySizeExp)
                  PrintExpression(type.arraySizeExp, size);
               //sprintf(string, "%s[%s]", baseType, size);
               strcat(string, baseType);
               strcat(string, "[");
               strcat(string, size);
               strcat(string, "]");
               */

            printName = false;
            break;
         }
         case ellipsisType:
            strcat(string, "...");
            break;
         case methodType:
            _PrintType(type.method.dataType, string, false, printFunction, fullName);
            break;
         case subClassType:
            strcat(string, "subclass(");
            strcat(string, type._class ? type._class.string : "int");
            strcat(string, ")");
            break;
         default:
            break;
      }
      if(type.name && printName && type.kind != functionType && (type.kind != pointerType || type.type.kind != functionType))
      {
         strcat(string, " ");
         strcat(string, type.name);
      }
   }
}

void DocPrintType(Type type, char * string, bool printName, bool fullName)
{
   Type funcType;
   for(funcType = type; funcType && (funcType.kind == pointerType || funcType.kind == arrayType); funcType = funcType.type);
   if(funcType && funcType.kind == functionType && type != funcType)
   {
      Type param;

      DocPrintType(funcType.returnType, string, false, fullName);
      strcat(string, "(");
      _PrintType(type, string, printName, false, fullName);
      strcat(string, ")");
      /*
      if(type.name)
         strcat(string, type.name);
      else
      {
         printf("");
      }
      */
      strcat(string, "(");
      for(param = funcType.params.first; param; param = param.next)
      {
         DocPrintType(param, string, true, fullName);
         if(param.next) strcat(string, ", ");
      }
      strcat(string, ")");
   }
   else
      _PrintType(type, string, printName, true, fullName);
}

Map<String, bool> modulesAdded { };
void AddComponents(Module module, bool isDll)
{
   DataRow row = null;
   SubModule m;

   if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")) && !modulesAdded["ecereCOM"])
   {
      row = mainForm.browser.AddRow();
      modulesAdded["ecereCOM"] = true;
      row.SetData(null, APIPageNameSpace { name = "ecereCOM", nameSpace = &module.application.systemNameSpace });
      row.tag = (int64)null;
      AddNameSpace(row, null, module.application.systemNameSpace, null, "", !isDll);
   }

   for(m = module.modules.first; m; m = m.next)
   {
      if(m.importMode == publicAccess || !isDll)
         AddComponents(m.module, true);
   }

   // PUT MODULE DESCRIPTION HERE
   if(module.name && !modulesAdded[module.name] && strcmp(module.name, "ecereCOM"))
   {
      row = mainForm.browser.AddRow();
      modulesAdded[module.name] = true;
      row.SetData(null, APIPageNameSpace { name = module.name, module = module, nameSpace = &module.publicNameSpace });
      row.tag = (int64)module;
      AddNameSpace(row, module, module.publicNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
      if(!isDll)
         AddNameSpace(row, module, module.privateNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
   }
}

void AddClassView()
{
   DataRow row = mainForm.browser.AddRow();
   row.SetData(null, APIPageNameSpace { name = "Class Hierarchy View", nameSpace = &componentsApp.publicNameSpace });
   AddCVModules(componentsApp, row);
}

Map<String, bool> cvmodulesAdded { };
void AddCVModules(Module module, DataRow parentRow)
{
   SubModule m;
   for(m = module.modules.first; m; m = m.next)
   {
      /*if(!strcmp(m.module.name, "ec2"))
         PrintLn(m.module.name);*/
      //if(m.importMode == publicAccess/* || !isDll*/)
         AddCVModules(m.module, parentRow);
   }

   if(module.name && !cvmodulesAdded[module.name]/* && strcmp(module.name, "ecereCOM")*/)
   {
      DataRow row = parentRow.AddRow();
      cvmodulesAdded[module.name] = true;
      row.SetData(null, APIPageNameSpace { name = module.name, module = module, nameSpace = &module.publicNameSpace });
      row.tag = (int64)module;
      //AddNameSpace(row, module, module.publicNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
      //if(!isDll)
      //   AddNameSpace(row, module, module.privateNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
      AddCVNamespace(row, module, module.publicNameSpace, null /*module.application.systemNameSpace*/, ""/*, !isDll*/);
   }
}

static void AddCVNamespace(DataRow parentRow, Module module, NameSpace mainNameSpace, NameSpace comNameSpace, const char * parentName/*, bool showPrivate*/)
{
   char nsName[1024];
   NameSpace * ns;
   NameSpace * nameSpace = mainNameSpace;
   DataRow row;
   //DataRow classesRow = null;
   DataRow functionsRow = null, definesRow = null;
   APIPage page;

   strcpy(nsName, parentName ? parentName : "");
   if(nameSpace->name)
   {
      if(nsName[0])
         strcat(nsName, "::");
      strcat(nsName, nameSpace->name);
   }

   if(nsName[0])
   {
      row = parentRow.AddRow();
      row.SetData(null, (page = APIPageNameSpace { nameSpace->name, module = module, nameSpace = nameSpace/*, showPrivate = showPrivate*/ }));
      row.tag = (int64)nameSpace;
      row.icon = mainForm.icons[typeNameSpace];
   }
   else
   {
      // "Global NameSpace"
      row = parentRow;
      page = parentRow.GetData(null);
   }

   for(ns = (NameSpace *)mainNameSpace.nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
   {
      NameSpace * comNS = (comNameSpace != null) ? (NameSpace *)comNameSpace.nameSpaces.FindString(ns->name) : null;
      AddCVNamespace(row, module, ns, comNS, nsName/*, showPrivate*/);
   }
   if(comNameSpace != null)
   {
      for(ns = (NameSpace *)comNameSpace.nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
      {
         if(!mainNameSpace.nameSpaces.FindString(ns->name))
         {
            AddCVNamespace(row, module, ns, null, nsName/*, showPrivate*/);
         }
      }
   }

   if(mainNameSpace.classes.first || (comNameSpace && comNameSpace.classes.first))
   {
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         AddCVNSClasses(module, *nameSpace, null, row);
      }
   }

   if(mainNameSpace.functions.first || (comNameSpace && comNameSpace.functions.first))
   {
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->functions.first)
         {
            BTNamedLink link;
            GlobalFunction fn;
            for(link = (BTNamedLink)nameSpace->functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               fn = link.data;
               if(!module || fn.module == module || (!fn.module.name && !strcmp(module.name, "ecere")))
               {
                  const char * name = ( name = RSearchString(fn.name, "::", strlen(fn.name), false, false), name ? name + 2 : fn.name);
                  DataRow fnRow;
                  if(!functionsRow) { functionsRow = row.AddRow(); functionsRow.SetData(null, APIPage { $"Functions", page = page }); functionsRow.collapsed = true; functionsRow.icon = mainForm.icons[typeMethod];  functionsRow.tag = 2; };
                  fnRow = functionsRow.AddRow(); fnRow.SetData(null, APIPageFunction { name, function = fn }); fnRow.icon = mainForm.icons[typeMethod]; fnRow.tag = (int64)fn;
               }
            }
         }
      }
   }

   if(mainNameSpace.defines.first || (comNameSpace && comNameSpace.defines.first))
   {
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->defines.first)
         {
            BTNamedLink link;
            Definition def;
            for(link = (BTNamedLink)nameSpace->defines.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               def = link.data;
               //if(def.module == module)
               {
                  char * name = ( name = RSearchString(def.name, "::", strlen(def.name), false, false), name ? name + 2 : def.name);
                  DataRow defRow;
                  if(!definesRow) { definesRow = row.AddRow(); definesRow.SetData(null, APIPage { $"Definitions", page = page }); definesRow.collapsed = true; definesRow.icon = mainForm.icons[typeData]; definesRow.tag = 3; };
                  defRow = definesRow.AddRow(); defRow.SetData(null, APIPage { name, page = page }); defRow.icon = mainForm.icons[typeData]; defRow.tag = (int64)def;
               }
            }
         }
      }
   }
}

void AddCVNSClasses(Module module, NameSpace nameSpace, Class base, DataRow parentRow)
{
   if(nameSpace.classes.first)
   {
      Class cl;
      Class _enum = eSystem_FindClass(module, "enum");
      Class _struct = eSystem_FindClass(module, "struct");
      Class _class = eSystem_FindClass(module, "class");
      Class _instance = eSystem_FindClass(module, "Instance");
      BTNamedLink link;
      for(link = (BTNamedLink)nameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
      {
         cl = link.data;
         if(!cl.templateClass && (!module || cl.module == module || (!cl.module.name && !strcmp(module.name, "ecere"))))
         {
            //if(!classesRow) { classesRow = row.AddRow(); classesRow.SetData(null, APIPage { $"Classes", page = page }); classesRow.collapsed = true; classesRow.icon = mainForm.icons[typeClass]; classesRow.tag = 1; }
            //AddClass(classesRow, module, cl, nsName, showPrivate);
            if(cl.base == base || (!base && (cl.base == _enum || cl.base == _struct ||
                  cl.base == _class || cl.base == _instance ||
                  !(cl.base.module == module && cl.base.nameSpace == nameSpace))) ||
                  (cl.base.templateClass && cl.base.templateClass == base))
            {
               DataRow row = parentRow.AddRow();
               row.SetData(null, /*(page = */APIPageClass { cl.name, cl = cl/*, showPrivate = showPrivate*/ }/*)*/);
               row.tag = (int64)cl;
               row.collapsed = false;
               row.icon = (cl.type == enumClass || cl.type == unitClass || cl.type == systemClass) ? mainForm.icons[typeDataType] : mainForm.icons[typeClass];
               AddCVNSClasses(module, nameSpace, cl, row);
            }
         }
      }
   }
}

void AddCVClasses(Module module, Class base, DataRow parentRow)
{
   Class cl;
   Class _enum = eSystem_FindClass(module, "enum");
   Class _struct = eSystem_FindClass(module, "struct");
   Class _class = eSystem_FindClass(module, "class");
   Class _instance = eSystem_FindClass(module, "Instance");
   Map<String, Class> sort { };
   for(cl = module.classes.first; cl; cl = cl.next)
   {
      if(cl.base == base || (!base && (cl.base == _enum || cl.base == _struct || cl.base == _class || cl.base == _instance || cl.base.module != module)))
         sort[cl.name] = cl;
      /*else
      {
         if(!strcmp(module.name, "ec2"))
            PrintLn("base is: ", cl.base.name);
      }*/
   }
   for(cl : sort)
   {
      DataRow row = parentRow.AddRow();
      row.SetData(null, /*(page = */APIPageClass { cl.name, cl = cl/*, showPrivate = showPrivate*/ }/*)*/);
      row.tag = (int64)cl;
      row.collapsed = true;
      row.icon = (cl.type == enumClass || cl.type == unitClass || cl.type == systemClass) ? mainForm.icons[typeDataType] : mainForm.icons[typeClass];
      AddCVClasses(module, cl, row);
   }
   sort.RemoveAll();
   delete sort;
}

class APIPage
{
public:
   const char * name;
   APIPage page;
   const char * label;
   bool showPrivate;

   const char * OnGetString(char * tempString, void * fieldData, ObjectNotationType * onType)
   {
      return name;
   }

   virtual void Generate(File f)
   {
      page.Generate(f);
   }

   virtual Module GetModule()
   {
      return page ? page.GetModule() : null;
   }

   virtual NameSpace * GetNameSpace()
   {
      return page ? page.GetNameSpace() : null;
   }
};

enum DocumentationType
{
   unset,
   nameSpaceDoc,
   classDoc,
   functionDoc,
   methodDoc
};

enum DocumentationItem
{
   unset,
   description,
   usage,
   remarks,
   example,
   seeAlso,
   enumerationValue,
   definition,
   conversion,
   memberDescription,
   propertyDescription,
   parameter,
   returnValue
};

bool outputtingHTML = false;
int apiLevel = 0;

const char * getAnchor(const void * object, char * output)
{
   if(outputtingHTML)
   {
      DataRow row = mainForm.browser.FindSubRow((int64)(intptr)object);
      output[0] = 0;
      if(row)
      {
         APIPage page = row.GetData(null);
         if(page)
         {
            // Anchor
            if(page && page.page)
            {
               switch(row.tag)
               {
                  case 1: strcat(output, "#Classes"); break;
                  case 2: strcat(output, "#Functions"); break;
                  case 3: strcat(output, "#Definitions"); break;
                  case 4: strcat(output, "#VirtualMethods"); break;
                  case 5: strcat(output, "#Methods"); break;
                  case 6: strcat(output, "#Members"); break;
                  case 7: strcat(output, "#Conversions"); break;
                  case 8: strcat(output, "#EnumerationValues"); break;
                  default: strcatf(output, "#%s", row.string);
               }
            }
         }
      }
   }
   else
      sprintf(output, "%p", object);
   return output;
}

void addLinkPart(DataRow row, char * output, bool thisItem)
{
   APIPage page = row.GetData(null);
   if(page)
   {
      if(row.parent)
         addLinkPart(row.parent, output, false);

      if(!thisItem || !page.page)
      {
         strcat(output, page.name);
         if(thisItem)
            strcat(output, ".html");
         else
            strcat(output, "/");
      }
      if(thisItem && page.page)
      {
         switch(row.tag)
         {
            case 1: strcat(output, "#Classes"); break;
            case 2: strcat(output, "#Functions"); break;
            case 3: strcat(output, "#Definitions"); break;
            case 4: strcat(output, "#VirtualMethods"); break;
            case 5: strcat(output, "#Methods"); break;
            case 6: strcat(output, "#Members"); break;
            case 7: strcat(output, "#Conversions"); break;
            case 8: strcat(output, "#EnumerationValues"); break;
            default: strcatf(output, "#%s", row.string);
         }
      }
   }
}

const String getLink(const void * object, char * output)
{
   if(outputtingHTML)
   {
      DataRow row = mainForm.browser.FindSubRow((int64)(intptr)object);
      int level = apiLevel;
      output[0] = 0;
      while(level--)
         strcat(output, "../");
      if(row)
         addLinkPart(row, output, true);
   }
   else
      sprintf(output, "api://%p", object);
   return output;
}

static void FigureFileName(char * fileName, Module module, DocumentationType type, void * object, DocumentationItem item, void * data)
{
   char hex[20];
   fileName[0] = 0;
   sprintf(hex, "%p", module);
   strcat(fileName, hex);
   strcat(fileName, "/");
   sprintf(hex, "%p", object);
   strcat(fileName, hex);
   strcat(fileName, "/");
   sprintf(hex, "%p", data);
   strcat(fileName, hex);
   strcat(fileName, "/");
   if(type == nameSpaceDoc)
      strcat(fileName, "namespace");
   else if(type == functionDoc)
      strcat(fileName, "function");
   else if(type == classDoc)
      strcat(fileName, "class");
   else if(type == methodDoc)
      strcat(fileName, "method");
   strcat(fileName, "/");
   if(item == description)
      strcat(fileName, "description");
   else if(item == usage)
      strcat(fileName, "usage");
   else if(item == remarks)
      strcat(fileName, "remarks");
   else if(item == example)
      strcat(fileName, "example");
   else if(item == seeAlso)
      strcat(fileName, "seeAlso");
   else if(item == enumerationValue)
      strcat(fileName, "enumerationValue");
   else if(item == definition)
      strcat(fileName, "definition");
   else if(item == conversion)
      strcat(fileName, "conversion");
   else if(item == memberDescription)
      strcat(fileName, "memberDescription");
   else if(item == propertyDescription)
      strcat(fileName, "propertyDescription");
   else if(item == parameter)
      strcat(fileName, "parameter");
   else if(item == returnValue)
      strcat(fileName, "returnValue");
}

static void FigureFilePath(char * path, Module module, DocumentationType type, void * object, DocumentationItem item, void * data)
{
   char docPath[MAX_LOCATION];
   NameSpace * nameSpace, * ns;
   Class cl = null;
   Method method = null;
   GlobalFunction function = null;
   char nsName[1024], temp[1024];
   switch(type)
   {
      case nameSpaceDoc: nameSpace = object; break;
      case classDoc:     cl = (Class)object; nameSpace = cl.nameSpace; break;
      case functionDoc:  function = object; nameSpace = function.nameSpace; break;
      case methodDoc:    method = object; cl = method._class; nameSpace = cl.nameSpace; break;
   }

   nsName[0] = 0;
   temp[0] = 0;
   ns = nameSpace;
   while(ns && ns->name)
   {
      strcpy(temp, ns->name);
      strcat(temp, "/");
      strcat(temp, nsName);
      strcpy(nsName, temp);
      ns = ns->parent;
   }

   docPath[0] = 0;
   PathCatSlash(docPath, (!module || !module.name || !strcmp(nsName, "namespaces/ecere/namespaces/com")) ? "ecereCOM" : module.name);
   //ChangeExtension(docPath, "eCdoc", docPath);
   PathCatSlash(docPath, nsName);
   if(cl)
   {
      char * name = getDocFileNameFromTypeName(cl.name);
      PathCatSlash(docPath, name);
      delete name;
   }
   else
      PathCatSlash(docPath, "_global-defs");
   ChangeExtension(docPath, "econ", docPath);

   path[0] = 0;
   strcpy(path, ideSettings.docDir);
   PathCatSlash(path, docPath);
}

static char * ReadDoc(Module module, DocumentationType type, void * object, DocumentationItem item, void * data)
{
   String contents = null;
   NamespaceDoc nsDoc = null;
   ClassDoc clDoc = null;
   FunctionDoc fnDoc = null;
   MethodDoc mdDoc = null;
   String s = null;
   char filePath[MAX_LOCATION];
   Method method = null;
   GlobalFunction function = null;

   ItemDoc doc = getDoc(filePath, module, type, object, item, data, false);

   switch(type)
   {
      case functionDoc:  function = object; break;
      case methodDoc:    method = object; break;
   }

   if(doc)
   {
      if(eClass_IsDerived(doc._class, class(ClassDoc)))
      {
         clDoc = (ClassDoc)doc;
      }
      else if(eClass_IsDerived(doc._class, class(NamespaceDoc)))
      {
         nsDoc = (NamespaceDoc)doc;
      }
   }

   if(clDoc || nsDoc)
   {
      ItemDoc itDoc = null;
      if(type == functionDoc)
      {
         MapIterator<String, FunctionDoc> it { map = nsDoc.functions };
         const char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
         if(name) name += 2; else name = function.name;
         if(it.Index(name, false))
            fnDoc = it.data;
      }
      else if(type == methodDoc)
      {
         MapIterator<String, MethodDoc> it { map = clDoc.methods };
         if(it.Index(method.name, false))
            mdDoc = it.data;
      }

      switch(item)
      {
         case description: s = type == methodDoc ? mdDoc.description : type == functionDoc ? fnDoc.description : type == classDoc ? clDoc.description : nsDoc.description; break;
         case usage: s = type == methodDoc ? mdDoc.usage : type == functionDoc ? fnDoc.usage : type == classDoc ? clDoc.usage : null; break;
         case remarks: s = type == methodDoc ? mdDoc.remarks : type == functionDoc ? fnDoc.remarks : type == classDoc ? clDoc.remarks : null; break;
         case example: s = type == methodDoc ? mdDoc.example : type == functionDoc ? fnDoc.example : type == classDoc ? clDoc.example : null; break;
         case seeAlso: s = type == methodDoc ? mdDoc.also : type == functionDoc ? fnDoc.also : type == classDoc ? clDoc.also : null; break;
         case returnValue: s = type == methodDoc ? mdDoc.returnValue : type == functionDoc ? fnDoc.returnValue : null; break;
         case enumerationValue:
            if(clDoc && clDoc.values)
            {
               itDoc = clDoc.values[((NamedLink)data).name];
               if(itDoc) s = itDoc.description;
            }
            break;
         case definition:
            if(nsDoc && nsDoc.defines)
            {
               itDoc = nsDoc.defines[((Definition)data).name];
               if(itDoc) s = itDoc.description;
            }
            break;
         case conversion:
            if(clDoc && clDoc.conversions)
            {
               const char * name = RSearchString(((Property)data).name, "::", strlen(((Property)data).name), true, false);
               if(name) name += 2; else name = ((Property)data).name;
               itDoc = clDoc.conversions[name];
               if(itDoc) s = itDoc.description;
            }
            break;
         case memberDescription:
            if(clDoc && clDoc.fields)
            {
               itDoc = clDoc.fields[((DataMember)data).name];
               if(itDoc) s = itDoc.description;
            }
            break;
         case propertyDescription:
            if(clDoc && clDoc.properties)
            {
               itDoc = clDoc.properties[((Property)data).name];
               if(itDoc) s = itDoc.description;
            }
            break;
         case parameter:
            if((type == functionDoc && fnDoc && fnDoc.parameters) || (type == methodDoc && mdDoc && mdDoc.parameters))
            {
               char * name = ((Type)data).name;
               itDoc = ((type == functionDoc) ? fnDoc.parameters : mdDoc.parameters)[name] ;
               if(itDoc) s = itDoc.description;
            }
            break;
      }
      if(s)
         contents = CopyString(s);
   }
   if(editing && !contents && !readOnly)
      contents = CopyString($"[Add Text]");
   delete doc;
   return contents;
}
               // The filePath is returned!
ItemDoc getDoc(char * filePath, Module module, DocumentationType type, void * object, DocumentationItem item, void * data, bool create)
{
   ItemDoc doc = null;
   Class cl = null;
   Method method = null;
   DocCacheEntry entry;
   Time now;

   switch(type)
   {
      case classDoc:     cl = (Class)object; break;
      case methodDoc:    method = object; cl = method._class; break;
   }

   FigureFilePath(filePath, module, type, object, item, data);

   entry = docCache[filePath];
   if(entry)
      doc = entry.doc;

   if(!doc)
   {
      File f = FileOpen(filePath, read);
      if(f)
      {
         ECONParser parser { f = f };
         JSONResult jsonResult = parser.GetObject(cl ? class(ClassDoc) : class(NamespaceDoc), &doc);
         delete parser;
         delete f;

         if(jsonResult != success)
         {
            PrintLn("error: problem parsing file: ", filePath);
            delete doc;
         }
      }
      if(!doc)
         doc = cl ? (ItemDoc)ClassDoc { } : (ItemDoc)NamespaceDoc { };
   }

   incref doc;    // Reference to return

   now = GetTime();
   // Add to the cache
   if(entry)
      entry.timeStamp = now;
   else
   {
      docCache[filePath] = { now, doc };
      incref doc; // Reference for the cache
   }

   //void pruneDocCache()
   // NOTE: If we want time stamp to be last retrieved, the pruning should be done before the retrieval
   {
      MapIterator<String, DocCacheEntry> it { map = docCache };
      Array<const String> toRemove { };
      for(entry : docCache; now - entry.timeStamp > 30)
         toRemove.Add(&entry);
      while(toRemove.count)
      {
         if(it.Index(toRemove.lastIterator.data, false))
         {
            delete it.data;
            it.Remove();
         }
         toRemove.Remove(toRemove.lastIterator.pointer);
      }
      delete toRemove;
   }
   return doc;
}

class APIPageNameSpace : APIPage
{
   NameSpace * nameSpace;
   Module module;

   Module GetModule()
   {
      return module;
   }

   NameSpace * GetNameSpace()
   {
      return nameSpace;
   }

   void Generate(File f)
   {
      char nsName[1024], temp[1024];
      NameSpace * ns;
      BTNamedLink link;
      GenOptions genOptions = module ? moduleGenOptions[module.name] : null;

      nsName[0] = 0;
      ns = nameSpace;
      while(ns && ns->name)
      {
         strcpy(temp, ns->name);
         if(nsName[0]) strcat(temp, "::");
         strcat(temp, nsName);
         strcpy(nsName, temp);
         ns = ns->parent;
      }
      // Generate Class Page
      f.Printf($"<HTML><HEAD><TITLE>API Reference</TITLE></HEAD>\n<BODY><FONT SIZE=\"3\">\n");
      if(nsName[0])
      {
         f.Printf("<FONT FACE=\"Arial\" SIZE=\"6\">%s</FONT><br><br>\n", nsName);
         f.Printf($"Module: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink((module && module.name) ? module : null, tmpLink),
            (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      }
      else
         f.Printf($"<FONT FACE=\"Arial\" SIZE=\"6\">Module %s</FONT><br>\n", (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);

      nsName[0] = 0;
      ns = nameSpace->parent;
      while(ns && ns->name)
      {
         strcpy(temp, ns->name);
         if(nsName[0]) strcat(temp, "::");
         strcat(temp, nsName);
         strcpy(nsName, temp);
         ns = ns->parent;
      }
      if(nsName[0])
         f.Printf($"Parent namespace: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(nameSpace->parent, tmpLink), nsName);

      f.Printf(oneBR);
      {
         char * desc = ReadDoc(module, nameSpaceDoc, nameSpace, description, null);
         if(desc)
         {
            f.Printf($"<H3>Description</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, nameSpaceDoc, nameSpace, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>");
            }
            else
               f.Printf("%s", desc);
            f.Printf(twoBRs);
            f.Printf("<br>");
            delete desc;
         }
      }

      if(nameSpace->nameSpaces.first)
      {
         bool first = true;
         for(ns = (NameSpace *)nameSpace->nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
         {
            char * desc = ReadDoc(module, nameSpaceDoc, ns, description, null);
            if(first)
            {
               f.Printf($"<H3>Sub Namespaces</H3>%s\n", oneBR);
               f.Printf("<TABLE>\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"%s\" style=\"text-decoration: none;\">%s</a></TD>",
               getIconName(typeNameSpace), getLink(ns, tmpLink), ns->name);
            if(desc)
            {
               if(editing)
               {
                  char fileName[MAX_LOCATION];
                  FigureFileName(fileName, module, nameSpaceDoc, ns, description, null);
                  f.Printf("<TD valign=top height=22> <a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                  f.Puts(desc);
                  f.Printf("</a></TD>");
               }
               else
                  f.Printf("<TD valign=top height=22> %s</TD>", desc);
               delete desc;
            }
            f.Printf(slashTR);
         }
         if(!first)
            f.Printf("</TABLE>%s\n", twoBRs);
      }

      if(nameSpace->classes.first)
      {
         bool first = true;
         BlackWhiteList * whiteList = genOptions ? &genOptions.classList : null;

         for(link = (BTNamedLink)nameSpace->classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            Class cl = link.data;
            Module module = cl.module ? cl.module  : this.module;
            if(whiteList && !whiteList->match(cl.name)) continue;

            if(!cl.templateClass) // && !cl.internalDecl)
            {
               char * desc = ReadDoc(module, classDoc, cl, description, null);

               if(first)
               {
                  f.Printf($"<a name=Classes></a><H3>Classes</H3>%s\n", oneBR);
                  f.Printf("<TABLE>\n");
                  first = false;
               }

               f.Printf("<TR>");

               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"%s\" style=\"text-decoration: none;\">%s</a></TD>",
                  getIconName((cl.type == enumClass || cl.type == unitClass || cl.type == systemClass) ? typeDataType : typeClass), getLink(cl, tmpLink), cl.name);
               if(desc)
               {
                  if(editing)
                  {
                     char fileName[MAX_LOCATION];
                     FigureFileName(fileName, module, classDoc, cl, description, null);
                     f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                     f.Puts(desc);
                     f.Printf("</a></TD>");
                  }
                  else
                     f.Printf("<TD valign=top height=22>%s</TD>", desc);
                  delete desc;
               }
               f.Printf("</TR>\n");
            }
         }
         if(!first)
            f.Printf("</TABLE>%s\n", twoBRs);
      }

      if(nameSpace->functions.first)
      {
         bool first = true;
         BlackWhiteList * whiteList = genOptions ? &genOptions.functionList : null;
         for(link = (BTNamedLink)nameSpace->functions.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            GlobalFunction function = link.data;
            Module module = function.module ? function.module  : this.module;
            char * desc = ReadDoc(module, functionDoc, function, description, null);
            const char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
            if(name) name += 2; else name = function.name;

            if(whiteList && !whiteList->match(function.name)) continue;
            if(first)
            {
               f.Printf($"<a name=Functions></a><H3>Functions</H3>%s\n", oneBR);
               f.Printf("<TABLE>\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"%s\" style=\"text-decoration: none;\">%s</a></TD>",
               getIconName(typeMethod), getLink(function, tmpLink), name);
            if(desc)
            {
               if(editing)
               {
                  char fileName[MAX_LOCATION];
                  FigureFileName(fileName, module, functionDoc, function, description, null);
                  f.Printf("<TD valign=top height=22> <a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                  f.Puts(desc);
                  f.Printf("</a></TD>");
               }
               else
                  f.Printf("<TD valign=top height=22> %s</TD>", desc);
               delete desc;
            }
            f.Printf(slashTR);
         }
         if(!first)
            f.Printf("</TABLE>\n", twoBRs);
      }

      if(nameSpace->defines.first)
      {
         bool first = true;
         BlackWhiteList * whiteList = genOptions ? &genOptions.defineList : null;
         for(link = (BTNamedLink)nameSpace->defines.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            DefinedExpression def = link.data;
            char * desc;
            if(whiteList && !whiteList->match(def.name)) continue;

            desc = ReadDoc(module, nameSpaceDoc, nameSpace, definition, def);
            if(first)
            {
               f.Printf($"<a name=Definitions></a><H3>Definitions</H3>%s\n", oneBR);
               f.Printf("<TABLE>\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><a name=%s></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>",
               getAnchor(def, tmpLink), getIconName(typeData), def.name);
            f.Printf("<TD valign=top height=22>%s</TD>", def.value);
            if(desc)
            {
               if(editing)
               {
                  char fileName[MAX_LOCATION];
                  FigureFileName(fileName, module, nameSpaceDoc, nameSpace, definition, def);
                  f.Printf("<TD valign=top height=22> <a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                  f.Puts(desc);
                  f.Printf("</a></TD>");
               }
               else
                  f.Printf("<TD valign=top height=22> %s</TD>", desc);
               delete desc;
            }
            f.Printf(slashTR);
         }
         if(!first)
            f.Printf("</TABLE>\n", twoBRs);
      }

      f.Printf("</FONT></BODY></HTML>\n");
   }
}

class APIPageClass : APIPage
{
   Class cl;

   Module GetModule()
   {
      return cl.module;
   }

   NameSpace * GetNameSpace()
   {
      return cl.nameSpace;
   }

   void Generate(File f)
   {
      char string[1024];
      Method method;
      Property prop;
      char nsName[1024], temp[1024];
      NameSpace * ns = cl.nameSpace;
      Module module = cl.module;

      nsName[0] = 0;
      while(ns && ns->name)
      {
         strcpy(temp, ns->name);
         if(nsName[0]) strcat(temp, "::");
         strcat(temp, nsName);
         strcpy(nsName, temp);
         ns = ns->parent;
      }
      // Generate Class Page
      f.Printf($"<HTML><HEAD><TITLE>API Reference</TITLE></HEAD>\n<BODY><FONT SIZE=\"3\">\n");
      f.Printf("<FONT FACE=\"Arial\" SIZE=\"6\">%s</FONT><br><br>\n", name);

      f.Printf($"Module: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
         getLink((module && module.name) ? module : null, tmpLink),
         (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      if(nsName[0])
         f.Printf($"Namespace: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(cl.nameSpace, tmpLink), nsName);

      {
         const char * classType = null;
         switch(cl.type)
         {
            case bitClass:
               classType = $"Bit Collection";
               break;
            case enumClass:
               classType = $"Enumeration";
               break;
            case structClass:
               classType = $"Structure";
               break;
            case normalClass:
               classType = $"Class";
               break;
            case noHeadClass:
               classType = $"Class (No header)";
               break;
            case unitClass:
               classType = $"Unit";
               break;
            case systemClass:
               classType = $"Basic Data Type";
               break;
         }
         f.Printf($"Type: %s<br>\n", classType);
      }

      if(cl.type != systemClass && cl.base)
      {
         f.Printf($"Base Class: ");
         if(!strcmp(cl.base.name, "struct") || !strcmp(cl.base.name, "class"))
         {
            f.Printf(cl.type == bitClass ? cl.dataTypeString : $"None");
         }
         else if(cl.type == enumClass && !strcmp(cl.base.name, "enum"))
            f.Printf("%s", cl.dataTypeString);
         else
            f.Printf("<a href=\"%s\" style=\"text-decoration: none;\">%s</a>",
               getLink(cl.base.templateClass ? cl.base.templateClass : cl.base, tmpLink), cl.base.name);
         f.Printf("<br>\n");
      }

      {
         char * desc = ReadDoc(module, classDoc, cl, description, null);
         if(desc)
         {
            f.Printf($"%s<H3>Description</H3>%s\n", oneBR, oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>");
            }
            else
               f.Printf("%s", desc);
            f.Printf("%s<br>", twoBRs);
            delete desc;
         }
      }

      if(cl.type == enumClass)
      {
         EnumClassData enumeration = (EnumClassData)cl.data;
         if(enumeration.values.first)
         {
            NamedLink item;

            f.Printf($"<a name=EnumerationValues></a><H3>Enumeration Values</H3>%s\n", oneBR);
            f.Printf("<TABLE>\n");

            for(item = enumeration.values.first; item; item = item.next)
            {
               char * desc = ReadDoc(module, classDoc, cl, enumerationValue, item);
               bool needClass = true;
               Class dataClass;
               Class base = cl;
               char tempString[1024];
               String s;
               while(base.type == enumClass) base = base.base;

               if(base.type == systemClass ||
                  (base.type == bitClass && base.membersAndProperties.first && !strcmp(cl.fullName, ((DataMember)base.membersAndProperties.first).dataTypeString)))
               {
                  if(!base.dataType)
                     base.dataType = ProcessTypeString(base.dataTypeString, false);

                  if(base.dataType.kind != classType)
                  {
                     char string[256];
                     Symbol classSym;
                     string[0] = '\0';
                     PrintType(base.dataType, string, false, true);
                     classSym = FindClass(string);
                     dataClass = classSym ? classSym.registered : null;
                  }
                  else
                     dataClass = base.dataType._class ? base.dataType._class.registered : null;
               }
               else
                  dataClass = base;

               f.Printf("<TR>");
               f.Printf("<TD valign=top height=22 nowrap=1><a name=%s></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>",
                  getAnchor(item, tmpLink), getIconName(typeEnumValue), item.name);
               if(dataClass.type == systemClass)
               {
                  needClass = false;
                  s = ((char *(*)(void *, void *, char *, void *, bool *))(void *)dataClass._vTbl[__ecereVMethodID_class_OnGetString])(dataClass, &item.data, tempString, null, &needClass);
               }
               else
                  s = ((char *(*)(void *, void *, char *, void *, bool *))(void *)eSystem_FindClass(componentsApp, "class")._vTbl[__ecereVMethodID_class_OnGetString])(dataClass, &item.data, tempString, null, &needClass);
               if(needClass)
                  f.Printf("<TD valign=top height=22 nowrap=1>%s { %s }</TD>", dataClass.name, s);
               else
                  f.Printf("<TD valign=top height=22 nowrap=1>%s</TD>", s);
               if(desc)
               {
                  if(editing)
                  {
                     char fileName[MAX_LOCATION];
                     FigureFileName(fileName, module, classDoc, cl, enumerationValue, item);
                     f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                     f.Puts(desc);
                     f.Printf("</a></TD>");
                  }
                  else
                     f.Printf("<TD valign=top height=22>%s</TD>", desc);
                  delete desc;
               }
               f.Printf("</TR>");
            }
            f.Printf("</TABLE>%s\n", oneBR);
         }
      }

      if(cl.conversions.first)
      {
         f.Printf($"<a name=Conversions></a><H3>Conversions</H3>%s\n", oneBR);
         f.Printf("<TABLE>\n");
         for(prop = cl.conversions.first; prop; prop = prop.next)
         {
            if((prop.memberAccess == publicAccess || (prop.memberAccess == privateAccess && showPrivate)) && prop.name)
            {
               char * desc = ReadDoc(module, classDoc, cl, conversion, prop);
               const char * name;
               Type type = ProcessTypeString(prop.name, false);
               name = RSearchString(prop.name, "::", strlen(prop.name), true, false);
               if(name) name += 2; else name = prop.name;

               f.Printf("<TR>");

               string[0] = 0;
               DocPrintType(type, string, true, false);

               f.Printf("<TD valign=top height=22 nowrap=1><a name=%s></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>",
                  getAnchor(prop, tmpLink), getIconName(typeDataType), string);
               if(desc)
               {
                  if(editing)
                  {
                     char fileName[MAX_LOCATION];
                     FigureFileName(fileName, module, classDoc, cl, conversion, prop);
                     f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                     f.Puts(desc);
                     f.Printf("</a></TD>");
                  }
                  else
                     f.Printf("<TD valign=top height=22>%s</TD>", desc);
                  delete desc;
               }

               f.Printf("</TR>\n");

               FreeType(type);
            }
         }
         f.Printf("</TABLE>%s\n", twoBRs);
      }

      if(cl.membersAndProperties.first)
      {
         bool first = true;
         for(prop = (Property)cl.membersAndProperties.first; prop; prop = prop.next)
         {
            if(prop.memberAccess == publicAccess || (prop.memberAccess == privateAccess && showPrivate))
            {
               if(first)
               {
                  f.Printf($"<a name=Members></a><H3>Properties and Members</H3>%s\n", oneBR);
                  f.Printf("<TABLE>\n");
                  first = false;
               }

               if(prop.isProperty)
               {
                  char * desc = ReadDoc(module, classDoc, cl, propertyDescription, prop);
                  if(!prop.dataType)
                     prop.dataType = ProcessTypeString(prop.dataTypeString, false);

                  f.Printf("<TR>");
                  string[0] = 0;
                  DocPrintType(prop.dataType, string, true, false);

                  f.Printf("<TD valign=top height=22 nowrap=1><a name=%s></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>",
                     getAnchor(prop, tmpLink), getIconName(typeProperty), prop.name);
                  f.Printf("<TD valign=top height=22 nowrap=1>%s</TD>", string);
                  if(desc)
                  {
                     if(editing)
                     {
                        char fileName[MAX_LOCATION];
                        FigureFileName(fileName, module, classDoc, cl, propertyDescription, prop);
                        f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                        f.Puts(desc);
                        f.Printf("</a></TD>");
                     }
                     else
                        f.Printf("<TD valign=top height=22>%s</TD>", desc);
                     delete desc;
                  }
                  f.Printf("</TR>\n");
               }
               else
               {
                  AddDataMemberToPage(f, (DataMember)prop, 0, showPrivate);
               }
            }
         }
         if(!first)
         {
            f.Printf("</TABLE>\n");
            f.Printf(twoBRs);
         }
      }

      if(cl.methods.first)
      {
         bool first = true;
         // Virtual Methods
         for(method = (Method)cl.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if((method.memberAccess == publicAccess || (method.memberAccess == privateAccess && showPrivate)) && method.type == virtualMethod)
            {
               char * desc = ReadDoc(module, methodDoc, method, description, null);
               if(first)
               {
                  f.Printf($"<a name=VirtualMethods></a><H3>Virtual Methods</H3>%s\n", oneBR);
                  f.Printf("<TABLE>\n");
                  first = false;
               }
               if(!method.dataType)
                  ProcessMethodType(method);

               f.Printf("<TR>");
               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"%s\" style=\"text-decoration: none;\">%s</a></TD>",
                  getIconName(method.dataType.thisClass ? typeEvent : typeMethod), getLink(method, tmpLink), method.name);
               if(desc)
               {
                  if(editing)
                  {
                     char fileName[MAX_LOCATION];
                     FigureFileName(fileName, module, methodDoc, method, description, null);
                     f.Printf("<TD valign=top height=22> <a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                     f.Puts(desc);
                     f.Printf("</a></TD>");
                  }
                  else
                     f.Printf("<TD valign=top height=22> %s</TD>", desc);
                  delete desc;
               }
               f.Printf(slashTR);
            }
         }
         if(!first)
            f.Printf("</TABLE>%s\n", twoBRs);

         // Non-Virtual Methods
         first = true;
         for(method = (Method)cl.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if((method.memberAccess == publicAccess || (method.memberAccess == privateAccess && showPrivate)) && method.type != virtualMethod)
            {
               char * desc = ReadDoc(module, methodDoc, method, description, null);
               if(first)
               {
                  f.Printf($"<a name=Methods></a><H3>Non-Virtual Methods</H3>%s\n", oneBR);
                  f.Printf("<TABLE>\n");
                  first = false;
               }

               if(!method.dataType)
                  ProcessMethodType(method);

               f.Printf("<TR>");
               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"%s\" style=\"text-decoration: none;\">%s</a></TD>",
                  getIconName(typeMethod), getLink(method, tmpLink), method.name);
               if(desc)
               {
                  if(editing)
                  {
                     char fileName[MAX_LOCATION];
                     FigureFileName(fileName, module, methodDoc, method, description, null);
                     f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                     f.Puts(desc);
                     f.Printf("</a></TD>");
                  }
                  else
                     f.Printf("<TD valign=top height=22>%s</TD>", desc);
                  delete desc;
               }

               f.Printf(slashTR);
            }
         }
         if(!first)
            f.Printf("</TABLE>%s\n", twoBRs);
      }
      {
         char * usageDoc = ReadDoc(module, classDoc, cl, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, usage, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(usageDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", usageDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, classDoc, cl, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3>%s\n", oneBR);
            f.Printf($"<FONT face=\"Courier New\">\n");
            f.Printf("%s<TABLE>\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, example, null);
               f.Printf("<TR><TD><CODE><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(exampleDoc);
               f.Printf("</a></CODE></TD></TR>\n"); // bgcolor=#CFC9C0
            }
            else
               f.Printf("<TR><TD><CODE>%s</CODE></TD></TR>\n", exampleDoc);   // bgcolor=#CFC9C0

            f.Printf("</TABLE></FONT>\n");
            f.Printf(twoBRs);
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, classDoc, cl, remarks, null);

         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, remarks, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(remarksDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", remarksDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete remarksDoc;
         }
      }

      if(cl.type != systemClass)
      {
         bool first = true;
         OldLink c;
         for(c = cl.derivatives.first; c; c = c.next)
         {
            Class deriv = c.data;
            // TO VERIFY: Does this properly check public status?
            if(eSystem_FindClass(componentsApp, deriv.fullName))
            {
               if(first)
               {
                  f.Printf($"<H3>Derived Classes</H3>%s\n", oneBR);
                  first = false;
               }
               else
                  f.Printf(", ");
               f.Printf("<a href=\"%s\" style=\"text-decoration: none;\">%s</a>", getLink(deriv, tmpLink), deriv.name);
             }
         }
         if(!first)
            f.Printf(twoBRs);
      }
      {
         char * seeAlsoDoc = ReadDoc(module, classDoc, cl, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3>\n");
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, seeAlso, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(seeAlsoDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", seeAlsoDoc);
            f.Printf(twoBRs);
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }
}

class APIPageMethod : APIPage
{
   Method method;

   Module GetModule()
   {
      return method._class.module;
   }

   NameSpace * GetNameSpace()
   {
      return method._class.nameSpace;
   }

   void Generate(File f)
   {
      Class cl = method._class;
      char string[1024];
      Module module = cl.module;
      Type param;
      char nsName[1024], temp[1024];
      NameSpace * ns = cl.nameSpace;

      nsName[0] = 0;
      while(ns && ns->name)
      {
         strcpy(temp, ns->name);
         if(nsName[0]) strcat(temp, "::");
         strcat(temp, nsName);
         strcpy(nsName, temp);
         ns = ns->parent;
      }

      f.Printf($"<HTML><HEAD><TITLE>API Reference</TITLE></HEAD>\n<BODY><FONT SIZE=\"3\">\n");
      f.Printf("<FONT FACE=\"Arial\" SIZE=\"6\">%s</FONT><br><br>\n", name);

      f.Printf($"Module: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
         getLink((module && module.name) ? module : null, tmpLink),
         (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      if(nsName[0])
         f.Printf($"Namespace: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(cl.nameSpace, tmpLink), nsName);
      f.Printf("Class: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
         getLink(cl, tmpLink), cl.name);
      if(method.dataType.staticMethod)
      {
         f.Printf($"this pointer class: None<br>\n");
      }
      else if(method.dataType.thisClass && method.dataType.thisClass.registered && (method.dataType.thisClass.registered != method._class || method.type == virtualMethod))
      {
         f.Printf($"this pointer class: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(method.dataType.thisClass.registered, tmpLink), method.dataType.thisClass.registered.name);
      }

      // Generate Method Page
      string[0] = 0;
      if(!method.dataType.name)
         method.dataType.name = CopyString(method.name);
      DocPrintType(method.dataType, string, true, false);
      f.Printf("<br>%s", string);

      {
         char * desc = ReadDoc(module, methodDoc, method, description, null);
         if(desc)
         {
            f.Printf($"%s<H3>Description</H3>%s\n", twoBRs, oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>");
            }
            else
               f.Printf("%s", desc);
            f.Printf(twoBRs);
            delete desc;
         }
      }

      f.Printf(twoBRs);
      if(method.dataType.params.first && ((Type)method.dataType.params.first).kind != voidType)
      {
         f.Printf($"<H3>Parameters</H3>%s\n", oneBR);
      }
      if((method.dataType.returnType && method.dataType.returnType.kind != voidType) ||
         (method.dataType.params.first && ((Type)method.dataType.params.first).kind != voidType))
      {
         f.Printf("<TABLE  valign=center>\n");
      }

      for(param = method.dataType.params.first; param; param = param.next)
      {
         // ADD DESCRIPTION HERE
         if(param.kind != voidType)
         {
            char * desc = ReadDoc(module, methodDoc, method, parameter, param);
            f.Printf("<TR>");
            string[0] = 0;
            DocPrintType(param, string, false, false);

            f.Printf("<TD valign=top height=22 nowrap=1>%s&nbsp;</TD>\n", param.name ? param.name : "");
            f.Printf("<TD valign=top height=22 nowrap=1>%s&nbsp;</TD>\n", string);
            if(desc)
            {
               if(editing)
               {
                  char fileName[MAX_LOCATION];
                  FigureFileName(fileName, module, methodDoc, method, parameter, param);
                  f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                  f.Puts(desc);
                  f.Printf("</a></TD>\n");
               }
               else
                  f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", desc);
               delete desc;
            }

            f.Printf("</TR>\n");
         }
      }
      if(method.dataType.returnType && method.dataType.returnType.kind != voidType)
      {
         char * desc = ReadDoc(module, methodDoc, method, returnValue, null);
         if(method.dataType.params.first && ((Type)method.dataType.params.first).kind != voidType)
         {
            f.Printf("<TR><TD>&nbsp;</TD></TR>");
         }
         f.Printf("<TR>");
         f.Printf($"<TD valign=top height=22 nowrap=1><B>Return Value</B></TD>\n");
         string[0] = 0;
         DocPrintType(method.dataType.returnType, string, false, false);
         f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", string);
         if(desc)
         {
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, returnValue, null);
               f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>&nbsp;</TD>\n");
            }
            else
               f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", desc);
            delete desc;
         }
         f.Printf("</TR>\n");
         f.Printf("</TABLE>\n");
      }
      if((method.dataType.returnType && method.dataType.returnType.kind != voidType) ||
         (method.dataType.params.first && ((Type)method.dataType.params.first).kind != voidType))
      {
         f.Printf("</TABLE>%s\n", oneBR);
      }
      {
         char * usageDoc = ReadDoc(module, methodDoc, method, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, usage, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(usageDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", usageDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, methodDoc, method, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3>%s\n", oneBR);
            f.Printf($"<FONT face=\"Courier New\">\n");
            f.Printf("%s<TABLE>\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, example, null);
               f.Printf("<TR><TD><CODE><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(exampleDoc);
               f.Printf("</a></CODE></TD></TR>\n");   // bgcolor=#CFC9C0
            }
            else
               f.Printf("<TR><TD><CODE>%s</CODE></TD></TR>\n", exampleDoc);   // bgcolor=#CFC9C0
            f.Printf("</TABLE></FONT>\n");
            f.Printf(twoBRs);
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, methodDoc, method, remarks, null);
         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, remarks, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(remarksDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", method, remarksDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete remarksDoc;
         }
      }
      {
         char * seeAlsoDoc = ReadDoc(module, methodDoc, method, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, methodDoc, method, seeAlso, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(seeAlsoDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", method, seeAlsoDoc);

            f.Printf("%s<br>\n", twoBRs);
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }
}

class APIPageFunction : APIPage
{
   GlobalFunction function;

   Module GetModule()
   {
      return function.module;
   }

   NameSpace * GetNameSpace()
   {
      return function.nameSpace;
   }

   void Generate(File f)
   {
      char string[1024];
      Module module = function.module;
      Type param;
      char nsName[1024], temp[1024];
      NameSpace * ns = function.nameSpace;

      nsName[0] = 0;
      while(ns && ns->name)
      {
         strcpy(temp, ns->name);
         if(nsName[0]) strcat(temp, "::");
         strcat(temp, nsName);
         strcpy(nsName, temp);
         ns = ns->parent;
      }

      f.Printf($"<HTML><HEAD><TITLE>API Reference</TITLE></HEAD>\n<BODY><FONT SIZE=\"3\">\n");
      f.Printf("<FONT FACE=\"Arial\" SIZE=\"6\">%s</FONT><br><br>\n", name);

      f.Printf($"Module: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
         getLink((module && module.name) ? module : null, tmpLink), (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);

      if(nsName[0])
         f.Printf($"Namespace: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(function.nameSpace, tmpLink), nsName);

      if(!function.dataType)
         function.dataType = ProcessTypeString(function.dataTypeString, false);

      if(function.dataType.thisClass && function.dataType.thisClass.registered)
      {
         f.Printf($"this pointer class: <a href=\"%s\" style=\"text-decoration: none;\">%s</a><br>\n",
            getLink(function.dataType.thisClass.registered, tmpLink),
            function.dataType.thisClass.registered.name);
      }

      // Generate Method Page
      string[0] = 0;
      if(!function.dataType.name)
         function.dataType.name = CopyString(function.name);
      DocPrintType(function.dataType, string, true, false);
      f.Printf("<br>%s", string);

      {
         char * desc = ReadDoc(module, functionDoc, function, description, null);
         if(desc)
         {
            f.Printf($"%s<H3>Description</H3>%s\n", twoBRs, oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>");
            }
            else
               f.Printf("%s", desc);
            delete desc;
            f.Printf(twoBRs);
         }
      }
      f.Printf(twoBRs);
      if(function.dataType.params.first && ((Type)function.dataType.params.first).kind != voidType)
      {
         f.Printf($"<H3>Parameters</H3>%s\n", oneBR);
      }
      if((function.dataType.returnType && function.dataType.returnType.kind != voidType) ||
         (function.dataType.params.first && ((Type)function.dataType.params.first).kind != voidType))
      {
         f.Printf("<TABLE  valign=center>\n");
      }

      for(param = function.dataType.params.first; param; param = param.next)
      {
         // ADD DESCRIPTION HERE
         if(param.kind != voidType)
         {
            char * desc = ReadDoc(module, functionDoc, function, parameter, param);
            f.Printf("<TR>");
            string[0] = 0;
            DocPrintType(param, string, false, false);

            f.Printf("<TD valign=top height=22 nowrap=1>%s&nbsp;</TD>\n", param.name ? param.name : "");
            f.Printf("<TD valign=top height=22 nowrap=1>%s&nbsp;</TD>\n", string);
            if(param)
            {
               if(editing)
               {
                  char fileName[MAX_LOCATION];
                  FigureFileName(fileName, module, functionDoc, function, parameter, param);
                  f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
                  if(desc)
                     f.Puts(desc);
                  f.Printf("</a>&nbsp;</TD>\n");
               }
               else
                  f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", desc);
               delete desc;
            }
            f.Printf("</TR>\n");
         }
      }
      if(function.dataType.returnType && function.dataType.returnType.kind != voidType)
      {
         char * desc = ReadDoc(module, functionDoc, function, returnValue, null);
         if(function.dataType.params.first && ((Type)function.dataType.params.first).kind != voidType)
         {
            f.Printf("<TR><TD>&nbsp;</TD></TR>");
         }
         f.Printf("<TR>");
         f.Printf($"<TD valign=top height=22 nowrap=1><B>Return Value</B></TD>\n");
         string[0] = 0;
         DocPrintType(function.dataType.returnType, string, false, false);
         f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", string);
         if(desc)
         {
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, returnValue, null);
               f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a>&nbsp;</TD>\n");
            }
            else
               f.Printf("<TD valign=top height=22>%s&nbsp;</TD>\n", function, desc);
            delete desc;
         }
         f.Printf("</TR>\n");
         f.Printf("</TABLE>\n");
      }
      if((function.dataType.returnType && function.dataType.returnType.kind != voidType) ||
         (function.dataType.params.first && ((Type)function.dataType.params.first).kind != voidType))
      {
         f.Printf("</TABLE>%s\n", oneBR);
      }
      {
         char * usageDoc = ReadDoc(module, functionDoc, function, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, usage, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(usageDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", usageDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, functionDoc, function, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3>%s\n", oneBR);
            f.Printf($"<FONT face=\"Courier New\">\n");
            f.Printf("%s<TABLE>\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, example, null);
               f.Printf("<TR><TD><CODE><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(exampleDoc);
               f.Printf("</a></CODE></TD></TR>\n");   // bgcolor=#CFC9C0
            }
            else
               f.Printf("<TR><TD><CODE>%s</CODE></TD></TR>\n", exampleDoc);   // bgcolor=#CFC9C0
            f.Printf("</TABLE></FONT>\n");
            f.Printf(twoBRs);
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, functionDoc, function, remarks, null);
         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, remarks, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(remarksDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", remarksDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete remarksDoc;
         }
      }
      {
         char * seeAlsoDoc = ReadDoc(module, functionDoc, function, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3>%s\n", oneBR);
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, functionDoc, function, seeAlso, null);
               f.Printf("<br><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(seeAlsoDoc);
               f.Printf("</a>\n");
            }
            else
               f.Printf("<br>%s\n", seeAlsoDoc);
            f.Printf("%s<br>\n", twoBRs);
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }
}

static void AddNameSpace(DataRow parentRow, Module module, NameSpace mainNameSpace, NameSpace comNameSpace, const char * parentName, bool showPrivate)
{
   char nsName[1024];
   NameSpace * ns;
   NameSpace * nameSpace = mainNameSpace;
   DataRow row;
   DataRow classesRow = null;
   DataRow functionsRow = null, definesRow = null;
   APIPage page;
   GenOptions genOptions = module ? moduleGenOptions[module.name] : null;

   strcpy(nsName, parentName ? parentName : "");
   if(nameSpace->name)
   {
      if(nsName[0])
         strcat(nsName, "::");
      strcat(nsName, nameSpace->name);
   }

   if(nsName[0])
   {
      row = parentRow.AddRow();
      row.SetData(null, (page = APIPageNameSpace { nameSpace->name, module = module, nameSpace = nameSpace, showPrivate = showPrivate }));
      row.tag = (int64)nameSpace;
      row.icon = mainForm.icons[typeNameSpace];
   }
   else
   {
      // "Global NameSpace"
      row = parentRow;
      page = parentRow.GetData(null);
   }

   for(ns = (NameSpace *)mainNameSpace.nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
   {
      NameSpace * comNS = (comNameSpace != null) ? (NameSpace *)comNameSpace.nameSpaces.FindString(ns->name) : null;
      AddNameSpace(row, module, ns, comNS, nsName, showPrivate);
   }
   if(comNameSpace != null)
   {
      for(ns = (NameSpace *)comNameSpace.nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
      {
         if(!mainNameSpace.nameSpaces.FindString(ns->name))
         {
            AddNameSpace(row, module, ns, null, nsName, showPrivate);
         }
      }
   }

   if(mainNameSpace.classes.first || (comNameSpace && comNameSpace.classes.first))
   {
      BlackWhiteList * whiteList = genOptions ? &genOptions.classList : null;
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->classes.first)
         {
            BTNamedLink link;
            Class cl;
            for(link = (BTNamedLink)nameSpace->classes.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               cl = link.data;
               if(!cl.templateClass /*&& !cl.internalDecl*/ && (!module || cl.module == module || (!cl.module.name && !strcmp(module.name, "ecere"))))
               {
                  if(!whiteList || whiteList->match(cl.name))
                  {
                     if(!classesRow) { classesRow = row.AddRow(); classesRow.SetData(null, APIPage { $"Classes", page = page }); classesRow.collapsed = true; classesRow.icon = mainForm.icons[typeClass]; classesRow.tag = 1; }
                     AddClass(classesRow, module, cl, nsName, showPrivate);
                  }
               }
            }
         }
      }
   }

   if(mainNameSpace.functions.first || (comNameSpace && comNameSpace.functions.first))
   {
      BlackWhiteList * whiteList = genOptions ? &genOptions.functionList : null;
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->functions.first)
         {
            BTNamedLink link;
            GlobalFunction fn;
            for(link = (BTNamedLink)nameSpace->functions.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               fn = link.data;
               if(!module || fn.module == module || (!fn.module.name && !strcmp(module.name, "ecere")))
               {
                  const char * name = ( name = RSearchString(fn.name, "::", strlen(fn.name), false, false), name ? name + 2 : fn.name);
                  if(!whiteList || whiteList->match(fn.name))
                  {
                     DataRow fnRow;
                     if(!functionsRow) { functionsRow = row.AddRow(); functionsRow.SetData(null, APIPage { $"Functions", page = page }); functionsRow.collapsed = true; functionsRow.icon = mainForm.icons[typeMethod];  functionsRow.tag = 2; };
                     fnRow = functionsRow.AddRow(); fnRow.SetData(null, APIPageFunction { name, function = fn }); fnRow.icon = mainForm.icons[typeMethod]; fnRow.tag = (int64)fn;
                  }
               }
            }
         }
      }
   }

   if(mainNameSpace.defines.first || (comNameSpace && comNameSpace.defines.first))
   {
      BlackWhiteList * whiteList = genOptions ? &genOptions.defineList : null;
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->defines.first)
         {
            BTNamedLink link;
            Definition def;
            for(link = (BTNamedLink)nameSpace->defines.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               def = link.data;
               //if(def.module == module)
               {
                  char * name = ( name = RSearchString(def.name, "::", strlen(def.name), false, false), name ? name + 2 : def.name);
                  if(!whiteList || whiteList->match(def.name))
                  {
                     DataRow defRow;
                     if(!definesRow) { definesRow = row.AddRow(); definesRow.SetData(null, APIPage { $"Definitions", page = page }); definesRow.collapsed = true; definesRow.icon = mainForm.icons[typeData]; definesRow.tag = 3; };
                     defRow = definesRow.AddRow(); defRow.SetData(null, APIPage { name, page = page }); defRow.icon = mainForm.icons[typeData]; defRow.tag = (int64)def;
                  }
               }
            }
         }
      }
   }
}

static void AddDataMemberToPage(File f, DataMember member, int indent, bool showPrivate)
{
   char string[1024];
   int c;
   if(!member.dataType)
      member.dataType = ProcessTypeString(member.dataTypeString, false);

   f.Printf("<TR>");
   string[0] = 0;
   DocPrintType(member.dataType, string, true, false);

   f.Printf("<TD valign=top height=22 nowrap=1><a name=%s></a>", getLink(member, tmpLink));
   for(c = 0; c<indent; c++)
      f.Printf("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   f.Printf("<img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", getIconName(typeData), member.name ? member.name : ((member.type == structMember) ? "(struct)" : "(union)"));
   f.Printf("<TD valign=top height=22 nowrap=1>%s</TD>", (member.type == normalMember) ? string : "");
   if(member.type == normalMember)
   {
      char * desc = ReadDoc(member._class.module, classDoc, member._class, memberDescription, member);
      if(desc)
      {
         if(editing)
         {
            char fileName[MAX_LOCATION];
            FigureFileName(fileName, member._class.module, classDoc, member._class, memberDescription, member);
            f.Printf("<TD valign=top height=22><a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
            f.Puts(desc);
            f.Printf("</a></TD>");
         }
         else
            f.Printf("<TD valign=top height=22>%s</TD>", desc);
         delete desc;
      }
   }
   else
      f.Printf("<TD valign=top height=22></TD>");

   if(member.type != normalMember)
   {
      DataMember subMember;
      for(subMember = member.members.first; subMember; subMember = subMember.next)
      {
         if((subMember.memberAccess == publicAccess || (subMember.memberAccess == privateAccess && showPrivate)))
         {
            AddDataMemberToPage(f, subMember, indent + 1, showPrivate);
         }
      }
   }
   f.Printf(slashTR);
}

static void AddDataMember(DataRow parentRow, APIPage page, DataMember member)
{
   DataRow row;
   if(member.type == normalMember)
   {
      row = parentRow.AddRow(); row.SetData(null, APIPage { member.name, page = page }); row.icon = mainForm.icons[typeData];
      row.tag = (int64)member;
   }
   else
   {
      DataMember m;
      row = parentRow.AddRow(); row.SetData(null, APIPage { (member.type == unionMember) ? "(union)" : "(struct)", page });
      row.icon = mainForm.icons[typeData];
      row.tag = (int64)member;

      for(m = member.members.first; m; m = m.next)
      {
         if(m.memberAccess == publicAccess || (m.memberAccess == privateAccess && page.showPrivate))
            AddDataMember(row, page, m);
      }
   }
}

static void AddClass(DataRow parentRow, Module module, Class cl, char * nsName, bool showPrivate)
{
   Method method;
   Property prop;
   DataRow row;
   DataRow methodsRow = null, virtualsRow = null, eventsRow = null;
   DataRow propertiesRow = null, membersRow = null, conversionsRow = null, enumRow = null;
   APIPage page;

   row = parentRow.AddRow();
   row.SetData(null, (page = APIPageClass { cl.name, cl = cl, showPrivate = showPrivate }));
   row.tag = (int64)cl;
   row.collapsed = true;
   row.icon = (cl.type == enumClass || cl.type == unitClass || cl.type == systemClass) ? mainForm.icons[typeDataType] : mainForm.icons[typeClass];

   // METHODS
   if(cl.methods.first)
   {
      for(method = (Method)cl.methods.first; method; method = (Method)((BTNode)method).next)
      {
         if(method.memberAccess == publicAccess || (method.memberAccess == privateAccess && showPrivate))
         {
            DataRow mRow;
            if(!method.dataType)
               ProcessMethodType(method);
            if(method.type == virtualMethod)
            {
               if(method.dataType.thisClass)
               {
                  if(!eventsRow) { eventsRow = row.AddRow(); eventsRow.SetData(null, APIPage { $"Events", page = page }); eventsRow.collapsed = true; eventsRow.icon = mainForm.icons[typeEvent];  eventsRow.tag = 4; }
                  mRow = eventsRow.AddRow(); mRow.SetData(null, APIPageMethod { method.name, method = method }); mRow.icon = mainForm.icons[typeEvent];
                  mRow.tag = (int64)method;
               }
               else
               {
                  if(!virtualsRow) { virtualsRow = row.AddRow(); virtualsRow.SetData(null, APIPage { $"Virtual Methods", page = page }); virtualsRow.collapsed = true; virtualsRow.icon = mainForm.icons[typeMethod]; virtualsRow.tag = 4; }
                  mRow = virtualsRow.AddRow(); mRow.SetData(null, APIPageMethod { method.name, method = method }); mRow.icon = mainForm.icons[typeMethod];
                  mRow.tag = (int64)method;
               }
            }
            else
            {
               if(!methodsRow) { methodsRow = row.AddRow(); methodsRow.SetData(null, APIPage { $"Methods", page = page }); methodsRow.collapsed = true; methodsRow.icon = mainForm.icons[typeMethod]; methodsRow.tag = 5; }
               mRow = methodsRow.AddRow(); mRow.SetData(null, APIPageMethod { method.name, method = method }); mRow.icon = mainForm.icons[typeMethod];
               mRow.tag = (int64)method;
            }
         }
      }
   }

   if(cl.membersAndProperties.first)
   {
      for(prop = (Property)cl.membersAndProperties.first; prop; prop = prop.next)
      {
         if(prop.memberAccess == publicAccess || (prop.memberAccess == privateAccess && showPrivate))
         {
            if(!prop.dataType)
               prop.dataType = ProcessTypeString(prop.dataTypeString, false);
            if(prop.isProperty)
            {
               DataRow mRow;
               if(!propertiesRow) { propertiesRow = row.AddRow(); propertiesRow.SetData(null, APIPage { $"Properties", page = page }); propertiesRow.collapsed = true; propertiesRow.icon = mainForm.icons[typeProperty]; propertiesRow.tag = 6; }
               mRow = propertiesRow.AddRow(); mRow.SetData(null, APIPage { prop.name, page }); mRow.icon = mainForm.icons[typeProperty];
               mRow.tag = (int64)prop;
            }
            else
            {
               if(!membersRow) { membersRow = row.AddRow(); membersRow.SetData(null, APIPage { $"Data Members", page = page }); membersRow.collapsed = true; membersRow.icon = mainForm.icons[typeData]; membersRow.tag = 6; }
               AddDataMember(membersRow, page, (DataMember)prop);
            }
         }
      }
   }

   if(cl.conversions.first)
   {
      for(prop = cl.conversions.first; prop; prop = prop.next)
      {
         DataRow mRow;
         const char * name;
         if(!conversionsRow) { conversionsRow = row.AddRow(); conversionsRow.SetData(null, APIPage { $"Conversions", page = page }); conversionsRow.collapsed = true; conversionsRow.icon = mainForm.icons[typeDataType]; conversionsRow.tag = 7; }
         name = RSearchString(prop.name, "::", strlen(prop.name), true, false);
         if(name) name += 2; else name = prop.name;
         mRow = conversionsRow.AddRow(); mRow.SetData(null, APIPage { name, page = page }); mRow.icon = mainForm.icons[typeDataType];
         mRow.tag = (int64)prop;
      }
   }
   if(cl.type == enumClass)
   {
      EnumClassData enumeration = (EnumClassData)cl.data;
      NamedLink item;
      for(item = enumeration.values.first; item; item = item.next)
      {
         DataRow mRow;
         if(!enumRow) { enumRow = row.AddRow(); enumRow.SetData(null, APIPage { $"Enumeration Values", page = page }); enumRow.collapsed = true; enumRow.icon = mainForm.icons[typeEnumValue]; enumRow.tag = 8; }
         mRow = enumRow.AddRow(); mRow.SetData(null, APIPage { item.name, page = page }); mRow.icon = mainForm.icons[typeEnumValue];
         mRow.tag = (int64)item;
      }
   }
}

class AddressBar : Window
{
   background = activeBorder;
   tabCycle = true;
   Button open
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 0, top = 0, bottom = 0 }, size = Size { 24 }, bitmap = { ":actions/docOpen.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         MainForm mainForm = (MainForm)parent;
         FileDialog fileDialog = mainForm.fileDialog;
         if(fileDialog.Modal() == ok)
            mainForm.OpenModule(fileDialog.filePath);
         return true;
      }
   };
   Button back
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 28, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = altLeft, bitmap = { "<:ecere>actions/goPrevious.png" };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((MainForm)parent).Back();
         return true;
      }
   };
   Button forward
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 52, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = altRight, bitmap = { "<:ecere>actions/goNext.png" };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((MainForm)parent).Forward();
         return true;
      }
   };
   Button home
   {
      this, bevelOver = true, inactive = true, anchor = Anchor { left = 80, top = 0, bottom = 0 }, size = Size { 24 }, hotKey = ctrlH, bitmap = { "<:ecere>actions/goHome.png" };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         ((MainForm)parent).Home();
         return true;
      }
   };
   /* TODO: Search (#143/#441)
      When there's something in the search box, list matching sections, the exact match first,instead of the Hierarchy in the ListBox.
      Update this in the NotifyUpdate. Enter goes to the exact match.

   Label { this, anchor = Anchor { left = (124+12) }, labeledWindow = search };

   EditBox search
   {
      this, text = "Search:", anchor = Anchor { left = (16+48+124), right = 60, top = 0, bottom = 0 }, hotKey = altD;

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(!disabled && (SmartKey)key == enter)
            ((MainForm)parent).Go(editBox.contents);
         return true;
      }

      void NotifyUpdate(EditBox editBox)
      {
         String location = ((MainForm)parent).view.location;
         disabled = !strcmp(location ? location : "", editBox.contents);
      }
   };
   */

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == escape)
         ((MainForm)parent).view.MakeActive();
      return true;
   }
}

void outputHTML(DataRow row, const String dir)
{
   APIPage page = row.GetData(null);
   char filePath[MAX_LOCATION];
   strcpy(filePath, dir);
   PathCat(filePath, page.name);
   strcat(filePath, ".html");

   // TOCHECK: Separate page is generated for things within same page?
   if(page._class != class(APIPage))
   {
      File f;
      MakeDir(dir); //if(MakeDir(dir))

      f = FileOpen(filePath, write);
      if(f)
      {
         page.Generate(f);
         delete f;
      }
   }

   if(row.firstRow)
   {
      DataRow r;
      char subDir[MAX_LOCATION];

      strcpy(subDir, dir);
      PathCat(subDir, page.name);
      for(r = row.firstRow; r; r = r.next)
      {
         apiLevel++;
         outputHTML(r, subDir);
         apiLevel--;
      }
   }
}

class MainForm : Window
{
   size = { 1000, 600 };
   hasClose = true;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   icon = { ":documentorIcon.png" };
   text = $"API Documentation Browser";

   BitmapResource icons[CodeObjectType];

   MainForm()
   {
      CodeObjectType c;
      for(c = 0; c < CodeObjectType::enumSize; c++)
      {
         icons[c] = BitmapResource { iconNames[c], window = this, alphaBlend = true };
      }
      browser.AddField(DataField { dataType = class(APIPage) });
   }

   hasMenuBar = true;
   menu = Menu { };
   Menu fileMenu { menu, $"File", f };
   Array<FileFilter> fileFilters
   { [
      { $"eC Shared Library files (*.dll, *.so, *.dylib)", "dll, so, dylib" },
      { $"eC Symbol files (*.sym)", "sym" }
   ] };

   FileDialog fileDialog
   {
      filters = fileFilters.array, sizeFilters = fileFilters.count * sizeof(FileFilter)
   };
   MenuItem fileOpenItem
   {
      fileMenu, $"Open...", o, ctrlO;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(fileDialog.Modal() == ok)
         {
            OpenModule(fileDialog.filePath);
         }
         return true;
      }
   };
   MenuItem fileSettingsItem
   {
      fileMenu, $"Settings...", s, ctrlS; // set the Settings item to the file menu with shortcut keys:s and ctrl+s

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(SettingsDialog { master = this }.Modal() == ok) // Open the settings dialog to allow the user to change the directory for the eCdoc files
         {
            // Refresh docs
            view.edit = false;
            view.Destroy(0);
            view.Create();
         }
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem fileExport
   {
      fileMenu, $"Export to HTML", h, ctrlE;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         CodeObjectType i;
         editing = false;
         outputtingHTML = true;
         apiLevel = 0;

         MakeDir("html/images");
         for(i = 0; i < CodeObjectType::enumSize; i++)
         {
            char path[MAX_LOCATION];
            const String src = iconNames[i];
            File f = FileOpen(src, read);
            if(f)
            {
               sprintf(path, "html/images/%s", src + 19);
               f.CopyTo(path);
               delete f;
            }
         }

         outputHTML(browser.currentRow, "html");
         editing = true;
         outputtingHTML = false;
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem fileExit { fileMenu, $"Exit", x, altF4, NotifySelect = MenuFileExit };

   void OpenModule(const char * filePath)
   {
      char moduleName[MAX_LOCATION];
      char extension[MAX_EXTENSION];
      Module module = null;
      static char symbolsDir[MAX_LOCATION];

      history.size = 0;
      modulesAdded.RemoveAll();
      cvmodulesAdded.RemoveAll();

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

      mainForm.browser.Clear();

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

      for(module = componentsApp.allModules.first; module; module = module.next)
      {
         if(module.name && (!strcmp(module.name, moduleName)))
            break;
      }
      if(!module) module = componentsApp;
      homeModule = module;

      if(module)
      {
         char path[MAX_LOCATION];
         if(LocateModule(module.name, path))
         {
            GenOptions genOptions;
            StripExtension(path);
            genOptions = readOptionsFile(path);
            if(genOptions)
               moduleGenOptions[module.name] = genOptions;
         }
      }
      AddComponents(componentsApp, false);

      mainForm.browser.SelectRow(mainForm.browser.FindSubRow((int64)module));

      SetSymbolsDir(null);

      AddClassView();
   }

   AddressBar addressBar { this, borderStyle = bevel, anchor = Anchor { top = 0, left = 0, right = 0 }, size.h = 26, hotKey = altD };
   ListBox browser
   {
      this, anchor = { left = 0, top = 26, bottom = 0 }, borderStyle = 0, background = aliceBlue;
      treeBranches = true; collapseControl = true; fullRowSelect = false; rootCollapseButton = true;
      hotKey = alt0;

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         APIPage page = row.GetData(null);
         if(view.edit) view.OnLeftButtonDown(0,0,0);
         if(page && page.page) page = page.page;
         view.edit = false;
         view.PositionCaret(true);
         if(page != view.page)
         {
            Window activeChild = this.activeChild;

            // Back / Forward Support
            if(row && !dontRecordHistory)
            {
               if(history.count > historyPos+1)
                  history.count = historyPos+1;
               historyPos = history.count-1;
               addressBar.back.disabled = (historyPos == 0);
               addressBar.forward.disabled = (historyPos >= history.count-1);

               history.Add((Instance)(uint64)row.tag);
               historyPos = history.count-1;

               addressBar.back.disabled = (historyPos == 0);
               addressBar.forward.disabled = (historyPos >= history.count-1);
            }

            view.Destroy(0);
            if(page)
               view.Create();
            activeChild.Activate();
         }
         else if(!view.created)
            view.Create();

         {
            page = row.GetData(null);
            if(page && page.page)
            {
               switch(row.tag)
               {
                  case 1: view.GoToAnchor("Classes"); break;
                  case 2: view.GoToAnchor("Functions"); break;
                  case 3: view.GoToAnchor("Definitions"); break;
                  case 4: view.GoToAnchor("VirtualMethods"); break;
                  case 5: view.GoToAnchor("Methods"); break;
                  case 6: view.GoToAnchor("Members"); break;
                  case 7: view.GoToAnchor("Conversions"); break;
                  case 8: view.GoToAnchor("EnumerationValues"); break;
                  default:
                  {
                     char hex[1024];
                     getLink((void *)(uintptr)row.tag, hex);
                     view.GoToAnchor(hex);
                  }
               }
            }
            else
            {
               view.SetScrollPosition(0, 0);
            }
         }
         return true;
      }
   };
   HelpView view
   {
      this, anchor = { top = 26, bottom = 0, right = 0 };
      hotKey = escape;
   };
   PaneSplitter slider
   {
      this, anchor.top = 26, leftPane = browser, rightPane = view, split = 300 /*scaleSplit = 0.3 */
   };

   bool OnClose(bool parentClosing)
   {
      if(view.edit)
         view.OnLeftButtonDown(0,0,0);
      return true;
   }

   bool OnPostCreate()
   {
      //mainForm.OpenModule((((GuiApplication)__thisModule).argc > 1) ? ((GuiApplication)__thisModule).argv[1] : "ecere");
      mainForm.OpenModule("ec2");
      //mainForm.OpenModule("ec");
      //mainForm.OpenModule("c:/games/chess/debug/chess.sym");
      //mainForm.OpenModule("c:/ide/Objects.IDE.Win32.Debug/ide.sym");
      {
         int index = mainForm.browser.currentRow.index;
         int rowHeight = mainForm.browser.rowHeight;
         int height = mainForm.browser.clientSize.h;

         mainForm.browser.scroll = { 0, index * rowHeight - height / 2 };
      }
      return true;
   }

   Array<Instance> history { };
   int historyPos;
   bool dontRecordHistory;
   Module homeModule;

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case altLeft: Back(); return false;
         case altRight: Forward(); return false;
      }
      return true;
   }

   bool Forward()
   {
      if(historyPos < history.count-1)
      {
         char location[64];
         historyPos++;
         addressBar.back.disabled = (historyPos == 0);
         addressBar.forward.disabled = (historyPos >= history.count-1);
         sprintf(location, "%s", getLink(history[historyPos], tmpLink));
         dontRecordHistory = true;
         view.OnOpen(location);
         dontRecordHistory = false;
         return true;
      }
      return false;
   }

   bool Back()
   {
      if(historyPos > 0)
      {
         char location[64];
         historyPos--;
         addressBar.back.disabled = (historyPos == 0);
         addressBar.forward.disabled = (historyPos >= history.count-1);
         sprintf(location, "%s", getLink(history[historyPos], tmpLink));
         dontRecordHistory = true;
         view.OnOpen(location);
         dontRecordHistory = false;
         return true;
      }
      return false;
   }

   void Home()
   {
      mainForm.browser.SelectRow(mainForm.browser.FindSubRow((int64)homeModule));
   }
};

class EditDialog : Window
{
   borderStyle = sizable;
   size = { 600, 400 };
   autoCreate = false;

   EditBox editBox
   {
      this, anchor = { left = 16, top = 16, right = 18, bottom = 61 }
   };
   Button saveChanges
   {
      this, text = $"Save Changes", anchor = { horz = 184, vert = 160 }
   };
   Button cancel
   {
      this, text = $"Cancel", anchor = { horz = 254, vert = 160 }
   };
}

#define UTF8_IS_FIRST(x)   (__extension__({ byte b = x; (!(b) || !((b) & 0x80) || (b) & 0x40); }))
#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

class HelpView : HTMLView
{
   APIPage page;

   hasVertScroll = true;
   hasHorzScroll = true;
   bool edit;
   char editString[MAX_LOCATION];

   bool OnCreate()
   {
      TempFile f { };

      page = mainForm.browser.currentRow.GetData(null);
      if(page)
      {
         // Writability test
         {
            char docDir[MAX_LOCATION];
            readOnly = true;
            strcpy(docDir, ideSettings.docDir);
            if(FileExists(docDir).isDirectory)
            {
               PathCatSlash(docDir, "___docWriteTest");
               if(FileExists(docDir).isDirectory)
               {
                  RemoveDir(docDir);
                  if(!FileExists(docDir))
                     readOnly = false;
               }
               else
               {
                  MakeDir(docDir);
                  if(FileExists(docDir).isDirectory)
                  {
                     readOnly = false;
                     RemoveDir(docDir);
                  }
               }
            }
         }

         page.Generate(f);
         f.Seek(0, start);
         OpenFile(f, null);
         GoToAnchor(page.label);
         // Go to label...
         if(page.page) page = page.page;
      }
      delete f;
      return HTMLView::OnCreate();
   }
   EditDialog dialog
   {

   };

   void SaveEdit()
   {
      Block block;
      bool empty = true;
      String contents = null;
      uint64 len;
      TempFile f { };
      for(block = textBlock.parent.subBlocks.first; block; block = block.next)
      {
         if(block.type == TEXT && block.textLen)
         {
            empty = false;
            break;
         }
      }
      if(!empty)
      {
         for(block = textBlock.parent.subBlocks.first; block; block = block.next)
         {
            if(block.type == BR)
               f.Puts("<br>");
            else if(block.type == TEXT)
               f.Write(block.text, 1, block.textLen);
         }
      }
      f.Seek(0, start);
      if((len = f.GetSize()))
      {
         contents = new char[len+1];
         f.Read(contents, 1, len);
         contents[len] = '\0';
      }

      {
         char docPath[MAX_LOCATION];
         char temp[MAX_LOCATION];
         char part[MAX_FILENAME];
         Module module;
         void * object;
         void * data;
         DocumentationType type;
         DocumentationItem item;
         ItemDoc doc;
         NamespaceDoc nsDoc = null;
         ClassDoc clDoc = null;
         FunctionDoc fnDoc = null;
         MethodDoc mdDoc = null;
         Class cl = null;
         Method method = null;
         GlobalFunction function = null;

         strcpy(temp, editString);
         SplitDirectory(temp, part, temp);
         module = (Module)strtoull(part, null, 16);
         SplitDirectory(temp, part, temp);
         object = (void *)strtoull(part, null, 16);
         SplitDirectory(temp, part, temp);
         data = (void *)strtoull(part, null, 16);
         SplitDirectory(temp, part, temp);
         if(!strcmp(part, "namespace"))
            type = nameSpaceDoc;
         else if(!strcmp(part, "function"))
            type = functionDoc;
         else if(!strcmp(part, "class"))
            type = classDoc;
         else if(!strcmp(part, "method"))
            type = methodDoc;
         SplitDirectory(temp, part, temp);
         if(!strcmp(part, "description"))
            item = description;
         else if(!strcmp(part, "usage"))
            item = usage;
         else if(!strcmp(part, "remarks"))
            item = remarks;
         else if(!strcmp(part, "example"))
            item = example;
         else if(!strcmp(part, "seeAlso"))
            item = seeAlso;
         else if(!strcmp(part, "enumerationValue"))
            item = enumerationValue;
         else if(!strcmp(part, "definition"))
            item = definition;
         else if(!strcmp(part, "conversion"))
            item = conversion;
         else if(!strcmp(part, "memberDescription"))
            item = memberDescription;
         else if(!strcmp(part, "propertyDescription"))
            item = propertyDescription;
         else if(!strcmp(part, "parameter"))
            item = parameter;
         else if(!strcmp(part, "returnValue"))
            item = returnValue;

         doc = getDoc(docPath, module, type, object, item, data, !empty && contents);

         /* Why invalidate this entry here?
         {
            MapIterator<const String, DocCacheEntry> it { map = docCache };
            if(it.Index(docPath, false))
            {
               delete it.data;
               it.Remove();
            }
         }*/

         switch(type)
         {
            case classDoc:     cl = (Class)object; break;
            case functionDoc:  function = object; break;
            case methodDoc:    method = object; cl = method._class; break;
         }

         if(doc)
         {
            if(eClass_IsDerived(doc._class, class(ClassDoc)))
            {
               clDoc = (ClassDoc)doc;
            }
            else if(eClass_IsDerived(doc._class, class(NamespaceDoc)))
            {
               nsDoc = (NamespaceDoc)doc;
            }
         }

         if(clDoc || nsDoc)
         {
            if(type == functionDoc)
            {
               const char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
               if(name) name += 2; else name = function.name;
               fnDoc = nsDoc.functions ? nsDoc.functions[name] : null;
               if(!empty && !fnDoc)
               {
                  if(!nsDoc.functions) nsDoc.functions = { };
                  nsDoc.functions[name] = fnDoc = { };
               }
            }
            else if(type == methodDoc)
            {
               mdDoc = clDoc.methods ? clDoc.methods[method.name] : null;
               if(!empty && !mdDoc)
               {
                  if(!clDoc.methods && !empty) clDoc.methods = { };
                  clDoc.methods[method.name] = mdDoc = { };
               }
            }

            if(!empty || mdDoc || fnDoc || (type == classDoc && clDoc) || (type == nameSpaceDoc && nsDoc))
            {
               switch(item)
               {
                  case description:
                     if(type == methodDoc) { mdDoc.description = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.description = contents; contents = null; }
                     else if(type == classDoc) { clDoc.description = contents; contents = null; }
                     else { nsDoc.description = contents; contents = null; }
                     break;
                  case usage:
                     if(type == methodDoc) { mdDoc.usage = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.usage = contents; contents = null; }
                     else if(type == classDoc) { clDoc.usage = contents; contents = null; }
                     break;
                  case remarks:
                     if(type == methodDoc) { mdDoc.remarks = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.remarks = contents; contents = null; }
                     else if(type == classDoc) { clDoc.remarks = contents; contents = null; }
                     break;
                  case example:
                     if(type == methodDoc) { mdDoc.example = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.example = contents; contents = null; }
                     else if(type == classDoc) { clDoc.example = contents; contents = null; }
                     break;
                  case seeAlso:
                     if(type == methodDoc) { mdDoc.also = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.also = contents; contents = null; }
                     else if(type == classDoc) { clDoc.also = contents; contents = null; }
                     break;
                  case returnValue:
                     if(type == methodDoc) { mdDoc.returnValue = contents; contents = null; }
                     else if(type == functionDoc) { fnDoc.returnValue = contents; contents = null; }
                     break;
                  case enumerationValue:
                  {
                     ValueDoc itDoc = clDoc.values ? clDoc.values[((NamedLink)data).name] : null;
                     if(!empty || itDoc)
                     {
                        if(!empty && !itDoc)
                        {
                           if(!clDoc.values) clDoc.values = { };
                           clDoc.values[((NamedLink)data).name] = itDoc = { };
                        }
                        itDoc.description = contents; contents = null;
                        if(itDoc.isEmpty)
                        {
                           MapIterator<String, ValueDoc> it { map = clDoc.values };
                           if(it.Index(((NamedLink)data).name, false))
                              it.Remove();
                           delete itDoc;
                        }
                     }
                     break;
                  }
                  case definition:
                  {
                     DefineDoc itDoc = nsDoc.defines ? nsDoc.defines[((Definition)data).name] : null;
                     if(!empty || itDoc)
                     {
                        if(!empty && !itDoc)
                        {
                           if(!nsDoc.defines) nsDoc.defines = { };
                           nsDoc.defines[((Definition)data).name] = itDoc = { };
                        }
                        itDoc.description = contents; contents = null;
                        if(itDoc.isEmpty)
                        {
                           MapIterator<String, DefineDoc> it { map = nsDoc.defines };
                           if(it.Index(((Definition)data).name, false))
                              it.Remove();
                           delete itDoc;
                        }
                     }
                     break;
                  }
                  case conversion:
                  {
                     ConversionDoc itDoc;
                     const char * name = RSearchString(((Property)data).name, "::", strlen(((Property)data).name), true, false);
                     if(name) name += 2; else name = ((Property)data).name;
                     itDoc = clDoc.conversions ? clDoc.conversions[name] : null;
                     if(!empty || itDoc)
                     {
                        if(!empty && !itDoc)
                        {
                           if(!clDoc.conversions) clDoc.conversions = { };
                           clDoc.conversions[name] = itDoc = { };
                        }
                        itDoc.description = contents; contents = null;
                        if(itDoc.isEmpty)
                        {
                           MapIterator<String, ConversionDoc> it { map = clDoc.conversions };
                           if(it.Index(name, false))
                              it.Remove();
                           delete itDoc;
                        }
                     }
                     break;
                  }
                  case memberDescription:
                  {
                     FieldDoc itDoc = clDoc.fields ? clDoc.fields[((DataMember)data).name] : null;
                     if(!empty || itDoc)
                     {
                        if(!empty && !itDoc)
                        {
                           if(!clDoc.fields) clDoc.fields = { };
                           clDoc.fields[((DataMember)data).name] = itDoc = { };
                        }
                        itDoc.description = contents; contents = null;
                        if(itDoc.isEmpty)
                        {
                           MapIterator<String, FieldDoc> it { map = clDoc.fields };
                           if(it.Index(((DataMember)data).name, false))
                              it.Remove();
                           delete itDoc;
                        }
                     }
                     break;
                  }
                  case propertyDescription:
                  {
                     PropertyDoc itDoc = clDoc.properties ? clDoc.properties[((Property)data).name] : null;
                     if(!empty || itDoc)
                     {
                        if(!empty && !itDoc)
                        {
                           if(!clDoc.properties) clDoc.properties = { };
                           clDoc.properties[((Property)data).name] = itDoc = { };
                        }
                        itDoc.description = contents, contents = null;
                        if(itDoc.isEmpty)
                        {
                           MapIterator<String, PropertyDoc> it { map = clDoc.properties };
                           if(it.Index(((Property)data).name, false))
                              it.Remove();
                           delete itDoc;
                        }
                     }
                     break;
                  }
                  case parameter:
                  {
                     if(type == functionDoc || type == methodDoc)
                     {
                        Map<String, ParameterDoc> * parameters = (type == functionDoc) ? &fnDoc.parameters : &mdDoc.parameters;
                        char * name = ((Type)data).name;
                        ParameterDoc itDoc = *parameters ? (*parameters)[name] : null;
                        int position = 0;
                        Type prev = data;
                        while(prev) position++, prev = prev.prev;

                        if(!empty || itDoc)
                        {
                           if(!empty && !itDoc)
                           {
                              if(!*parameters) *parameters = { };
                              (*parameters)[name] = itDoc = { };
                           }
                           itDoc.description = contents; contents = null;
                           itDoc.position = position;
                           if(itDoc.isEmpty)
                           {
                              MapIterator<String, ParameterDoc> it { map = *parameters };
                              if(it.Index(((Type)data).name, false))
                                 it.Remove();
                              delete itDoc;
                           }
                        }
                     }
                     break;
                  }
               }
            }
         }

         if(type == functionDoc && fnDoc && fnDoc.isEmpty)
         {
            MapIterator<String, FunctionDoc> it { map = nsDoc.functions };
            const char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
            if(name) name += 2; else name = function.name;
            if(it.Index(name, false))
               it.Remove();
            delete fnDoc;
         }
         else if(type == methodDoc && mdDoc && mdDoc.isEmpty)
         {
            MapIterator<String, MethodDoc> it { map = clDoc.methods };
            if(it.Index(method.name, false))
               it.Remove();
            delete mdDoc;
         }
         if(nsDoc)
         {
            if(nsDoc.functions && !nsDoc.functions.count) delete nsDoc.functions;
            if(nsDoc.defines && !nsDoc.defines.count) delete nsDoc.defines;
         }
         if(clDoc)
         {
            if(clDoc && clDoc.conversions && !clDoc.conversions.count) delete clDoc.conversions;
            if(clDoc && clDoc.properties && !clDoc.properties.count) delete clDoc.properties;
            if(clDoc && clDoc.fields && !clDoc.fields.count) delete clDoc.fields;
            if(clDoc && clDoc.methods && !clDoc.methods.count) delete clDoc.methods;
            if(clDoc && clDoc.values && !clDoc.values.count) delete clDoc.values;
         }

         if(clDoc || nsDoc)
         {
            char dirPath[MAX_LOCATION];
            StripLastDirectory(docPath, dirPath);
            if(FileExists(docPath))
               DeleteFile(docPath);
            if(cl ? (clDoc && !clDoc.isEmpty) : (nsDoc && !nsDoc.isEmpty))
            {
               File f;
               if(!FileExists(dirPath))
                  MakeDir(dirPath);
               if((f = FileOpen(docPath, write)))
               {
                  WriteECONObject(f, cl ? class(ClassDoc) : class(NamespaceDoc), doc, 0);
                  delete f;
               }
               else
                  PrintLn("error: writeClassDocFile -- problem opening file: ", docPath);
            }
         }
         delete doc;
         delete contents;
      }

      if(empty)
      {
         Block parent = textBlock.parent;
         while((block = parent.subBlocks.first))
         {
            parent.subBlocks.Remove(block);
            delete block;
         }
         textBlock = Block { type = TEXT, parent = parent, font = parent.font };
         textBlock.text = CopyString($"[Add Text]");
         textBlock.textLen = strlen(textBlock.text);
         parent.subBlocks.Add(textBlock);
      }

      edit = false;
      if(created)
      {
         ComputeMinSizes();
         ComputeSizes();
         PositionCaret(true);
         Update(null);
      }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool result = true;

      if(edit && (!textBlock || overLink != textBlock.parent))
      {
         if(!readOnly)
            SaveEdit();
         HTMLView::OnLeftButtonDown(x, y, mods);
         selPosition = curPosition = 0;
         selBlock = textBlock;
         Update(null);
      }
      else
         result = HTMLView::OnLeftButtonDown(x, y, mods);

      if(!edit && clickedLink)
      {
         ReleaseCapture();
         if(clickedLink == overLink && clickedLink.href)
         {
            if(OnOpen(clickedLink.href))
               Update(null);
         }
      }

      if(edit)
      {
         // Update overLink
         if(textBlock && overLink == textBlock.parent)
         {
            selPosition = curPosition = TextPosFromPoint(x, y, &textBlock, true);
            selBlock = textBlock;
            PositionCaret(true);
            selecting = true;
            Update(null);
         }
      }
      return result;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(!edit || !textBlock || clickedLink != textBlock.parent)
      {
         HTMLView::OnLeftButtonUp(x, y, mods);
         if(edit)
         {
            selPosition = curPosition = TextPosFromPoint(x, y, &textBlock, true);
            selBlock = textBlock;
            PositionCaret(true);
            Update(null);
         }
      }
      else
         ReleaseCapture();
      selecting = false;
      return true;
   }
   bool selecting;

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(edit && selecting)
      {
         curPosition = TextPosFromPoint(x, y, &textBlock, true);
         PositionCaret(true);
         Update(null);
      }
      return HTMLView::OnMouseMove(x, y, mods);
   }

   bool OnLeftDoubleClick(int mx, int my, Modifiers mods)
   {
      if(edit && textBlock)
      {
         int c;
         int start = -1;
         int numBytes;

         selPosition = curPosition = TextPosFromPoint(mx, my, &textBlock, false);
         selBlock = textBlock;
         for(c = curPosition; c >= 0; c--)
         {
            unichar ch;
            while(c > 0 && !UTF8_IS_FIRST(textBlock.text[c])) c--;
            ch = UTF8GetChar(textBlock.text + c, &numBytes);
            if(!CharMatchCategories(ch, letters|numbers|marks|connector))
               break;
            start = c;
         }
         if(start != -1)
         {
            for(c = start; c < textBlock.textLen; c += numBytes)
            {
               unichar ch = UTF8GetChar(textBlock.text + c, &numBytes);
               if(!CharMatchCategories(ch, letters|numbers|marks|connector))
                  break;
            }
            selPosition = start;
            curPosition = c;

            PositionCaret(true);
            Update(null);
            return false;
         }
      }
      return true;
   }

   bool OnOpen(char * href)
   {
      if(!strncmp(href, "api://", 6))
      {
         int64 tag = (int64)strtoull(href + 6, null, 16);
         DataRow row = mainForm.browser.FindSubRow(tag);
         if(row)
         {
            edit = false;
            mainForm.browser.SelectRow(row);
            while((row = row.parent))
               row.collapsed = false;
            row = mainForm.browser.currentRow;
            mainForm.browser.scroll = { 0, row.index * mainForm.browser.rowHeight - mainForm.browser.clientSize.h / 2 };
         }
      }
      else if(!strncmp(href, "edit://", 7))
      {
         Block block;
         int startX = clickedLink.startX, startY = clickedLink.startY;
         for(block = (Block)clickedLink.subBlocks.first; block; block = block.next)
         {
            if(block.type == TEXT) startX = block.startX, startY = block.startY;
            if(block.type == BR && (!block.prev || !block.next || block.next.type != TEXT))
            {
               Block newBlock { type = TEXT, parent = block.parent, font = block.parent.font };
               int th = 0;
               display.FontExtent(block.font.font, " ", 1, null, &th);
               if(!block.prev)
               {
                  block.parent.subBlocks.Insert(null, newBlock);
                  block = newBlock;
               }
               else
               {
                  block.parent.subBlocks.Insert(block, newBlock);
                  startY += block.prev.height;
               }
               newBlock.startX = startX;
               newBlock.startY = startY;
               newBlock.text = new0 char[1];
            }
         }

         textBlock = (Block)clickedLink.subBlocks.first;
         if(!strcmp(textBlock.text, $"[Add Text]"))
         {
            textBlock.text[0] = 0;
            textBlock.textLen = 0;
         }

         strcpy(editString, href + 7);
         selPosition = curPosition = 0;
         selBlock = textBlock;
         // dialog.Create();
         edit = true;
         // PositionCaret(true);

         // TOCHECK: Adding this here seemed to fixed caret positioning bugs
         ComputeSizes();
      }
      return true;
   }

   char * text;

   void DeleteSelection()
   {
      if(textBlock != selBlock || curPosition != selPosition)
      {
         if(textBlock == selBlock)
         {
            // Within same block
            int start = Min(curPosition, selPosition);
            int end = Max(curPosition, selPosition);
            memmove(textBlock.text + start, textBlock.text + end, textBlock.textLen - end);
            textBlock.textLen -= end-start;
            textBlock.text = renew textBlock.text char[textBlock.textLen + 1];
            curPosition = start;
            selPosition = start;
         }
         else
         {
            int startSel, endSel;
            Block startSelBlock = null, endSelBlock = null, b, next;

            NormalizeSelection(&startSelBlock, &startSel, &endSelBlock, &endSel);

            startSelBlock.text = renew startSelBlock.text char[startSel + endSelBlock.textLen - endSel + 1];
            memcpy(startSelBlock.text + startSel, endSelBlock.text + endSel, endSelBlock.textLen - endSel + 1);

            startSelBlock.textLen = startSel + endSelBlock.textLen - endSel;
            for(b = startSelBlock.next; b; b = next)
            {
               bool isEnd = b == endSelBlock;
               next = GetNextBlock(b);
               b.parent.subBlocks.Remove(b);
               delete b;
               if(isEnd)
                  break;
            }
            textBlock = startSelBlock;
            selBlock = startSelBlock;
            curPosition = startSel;
            selPosition = startSel;
         }
         ComputeMinSizes();
         ComputeSizes();
         PositionCaret(true);
         Update(null);
      }
   }

   String GetSelectionString()
   {
      String selection = null;
      if(textBlock == selBlock)
      {
         // Within same block
         int start = Min(curPosition, selPosition);
         int end = Max(curPosition, selPosition);
         int len = end - start;
         selection = new char[len + 1];
         memcpy(selection, textBlock.text + start, len);
         selection[len] = 0;
      }
      else
      {
         int startSel, endSel;
         Block startSelBlock = null, endSelBlock = null, b;
         int totalLen = 0;

         NormalizeSelection(&startSelBlock, &startSel, &endSelBlock, &endSel);

         // Compute length
         for(b = startSelBlock; b; b = GetNextBlock(b))
         {
            int start = (b == startSelBlock) ? startSel : 0;
            int end = (b == endSelBlock) ? endSel : b.textLen;
            int len = end - start;
            totalLen += len;
            if(b == endSelBlock)
               break;
            else if(b.type == TEXT)
               totalLen++;
         }

         selection = new char[totalLen + 1];
         totalLen = 0;
         for(b = startSelBlock; b; b = GetNextBlock(b))
         {
            int start = (b == startSelBlock) ? startSel : 0;
            int end = (b == endSelBlock) ? endSel : b.textLen;
            int len = end - start;
            memcpy(selection + totalLen, b.text + start, len);
            totalLen += len;
            if(b == endSelBlock)
               break;
            else if(b.type == TEXT)
               selection[totalLen++] = '\n';
         }
         selection[totalLen] = 0;
      }
      return selection;
   }

   void CopySelection()
   {
      String s = GetSelectionString();
      if(s)
      {
         int len = strlen(s);
         ClipBoard cb { };
         if(cb.Allocate(len + 1))
         {
            memcpy(cb.text, s, len + 1);
            cb.Save();
         }
         delete cb;
         delete s;
      }
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(edit)
      {
         switch(key)
         {
            case escape:
               OnLeftButtonDown(0,0,0);
               return false;
            case Key { end, shift = true }:
            case end:
               curPosition = textBlock.textLen;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               PositionCaret(true);
               Update(null);
               break;
            case Key { home, shift = true }:
            case home:
               curPosition = 0;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               PositionCaret(true);
               Update(null);
               break;
            case Key { home, ctrl = true, shift = true }:
            case ctrlHome:
               curPosition = 0;
               while(textBlock.prev)
                  textBlock = textBlock.prev.prev;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               PositionCaret(true);
               Update(null);
               return false;
            case Key { end, ctrl = true, shift = true }:
            case ctrlEnd:
               while(textBlock.next && textBlock.next.next)
                  textBlock = textBlock.next.next;
               curPosition = textBlock.textLen;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               PositionCaret(true);
               Update(null);
               return false;
         }
      }
      else
         return HTMLView::OnKeyDown(key, ch);
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(edit)
      {
         switch(key)
         {
            case Key { up, shift = true }:
            case up:
            {
               if(caretY == textBlock.startY)
               {
                  if(textBlock.prev)
                  {
                     textBlock = textBlock.prev.prev;
                     curPosition = Min(curPosition, textBlock.textLen);
                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     Update(null);
                     PositionCaret(false);
                     caretY = MAXINT;
                  }
                  else
                     return false;
               }

               {
                  int th = 0;
                  int textPos = 0;
                  int sx = textBlock.startX, sy = textBlock.startY;
                  char * text = textBlock.text;
                  int maxW;
                  Block block = textBlock;
                  while(block && block.type != TD) block = block.parent;
                  if(block)
                  {
                     Block table = block;
                     while(table && table.type != TABLE) table = table.parent;
                     if(table)
                        maxW = block.w - 2* table.cellPadding;
                     else
                        maxW = clientSize.w - 10 - sx;
                  }
                  else
                     maxW = clientSize.w - 10 - sx;
                  display.FontExtent(textBlock.font.font, " ", 1, null, &th);

                  do
                  {
                     int startPos = textPos;
                     int width = 0;
                     int x = 0;
                     bool lineComplete = false;
                     for(; textPos<textBlock.textLen && !lineComplete;)
                     {
                        int w;
                        int len;
                        char * nextSpace = strchr(text + textPos, ' ');

                        if(nextSpace)
                           len = (nextSpace - (text + textPos)) + 1;
                        else
                           len = textBlock.textLen - textPos;

                        display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

                        if(x + width + w > maxW && x > 0)
                        {
                           lineComplete = true;
                           break;
                        }
                        textPos += len;
                        width += w;
                        if(nextSpace)
                        {
                           x += width;
                           width = 0;
                        }
                        if(textPos == textBlock.textLen || (sy == caretY - th && caretX <= x + width + sx))
                        {
                           x += width;
                           curPosition = textPos;
                           while(curPosition > 0 && x + sx > caretX && textPos > startPos)
                           {
                              int len;
                              while(curPosition > 0 && !UTF8_IS_FIRST(text[--curPosition]));
                              len = curPosition - startPos;
                              display.FontExtent(textBlock.font.font, text + startPos, len, &x, null);
                           }
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);

                           PositionCaret(false);
                           return false;
                        }
                     }
                     if(sy == caretY - th || textPos == textBlock.textLen)
                     {
                        if(textPos != textBlock.textLen)
                        {
                           int c = textPos - 1;
                           while(c > 0 && text[c] == ' ') c--;
                           curPosition = c + 1;
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);
                        }
                        else
                        {
                           curPosition = textBlock.textLen;
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);
                        }
                        PositionCaret(false);
                        return false;
                     }
                     sy += th;
                     sx = textBlock.startX;
                  } while(textPos < textBlock.textLen);
                  return false;
               }
               return false;
            }
            case Key { down, shift = true }:
            case down:
            {
               int th = 0;
               int textPos = 0;
               int sx = textBlock.startX, sy = textBlock.startY;
               char * text = textBlock.text;
               int maxW;
               Block block = textBlock;
               while(block && block.type != TD) block = block.parent;
               if(block)
               {
                  Block table = block;
                  while(table && table.type != TABLE) table = table.parent;
                  if(table)
                     maxW = block.w - 2* table.cellPadding;
                  else
                     maxW = clientSize.w - 10 - sx;
               }
               else
                  maxW = clientSize.w - 10 - sx;
               display.FontExtent(textBlock.font.font, " ", 1, null, &th);

               while(!textPos || textPos < textBlock.textLen)
               {
                  int startPos = textPos;
                  int width = 0;
                  int x = 0;
                  bool lineComplete = false;
                  for(; (textPos < textBlock.textLen) && !lineComplete;)
                  {
                     int w;
                     int len;
                     char * nextSpace = strchr(text + textPos, ' ');

                     if(nextSpace)
                        len = (nextSpace - (text + textPos)) + 1;
                     else
                        len = textBlock.textLen - textPos;

                     display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

                     if(x + width + w > maxW && x > 0)
                     {
                        lineComplete = true;
                        break;
                     }
                     textPos += len;
                     width += w;
                     if(nextSpace)
                     {
                        x += width;
                        width = 0;
                     }
                     if(sy > caretY && (textPos == textBlock.textLen || caretX <= x + width + sx))
                     {
                        curPosition = textPos;
                        x += width;
                        while(curPosition > 0 && x + sx > caretX && textPos > startPos)
                        {
                           int len;
                           while(curPosition > 0 && !UTF8_IS_FIRST(text[--curPosition]));
                           len = curPosition - startPos;
                           display.FontExtent(textBlock.font.font, text + startPos, len, &x, null);
                        }
                        if(!key.shift)
                        {
                           selPosition = curPosition;
                           selBlock = textBlock;
                        }
                        Update(null);
                        PositionCaret(false);
                        return false;
                     }
                  }
                  if(sy > caretY)
                  {
                     curPosition = textBlock.textLen;
                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     Update(null);
                     PositionCaret(false);
                     return false;
                  }
                  else if(textPos == textBlock.textLen && textBlock.next && textBlock.next.next)
                  {
                     startPos = 0;
                     textPos = 0;
                     textBlock = textBlock.next.next;
                     sy = textBlock.startY;
                     sx = textBlock.startX;
                     text = textBlock.text;
                  }
                  else
                  {
                     sy += th;
                     sx = textBlock.startX;
                  }
               }

               /*if(textBlock.next && textBlock.next.next)
               {
                  textBlock = textBlock.next.next;
                  selPosition = curPosition = Min(curPosition, textBlock.textLen);
                  selBlock = textBlock;
                  PositionCaret(false);
               }*/
               break;
            }
            case Key { right, shift = true, ctrl = true }:
            case ctrlRight:
            {
               bool foundAlpha = false;
               bool found = false;
               Block line, lastLine;
               int lastC;

               for(line = textBlock; (line && !found); line = line.next ? line.next.next : null)
               {
                  int start = (line == textBlock) ? curPosition : 0;
                  int c;
                  for(c = start; c < line.textLen; c++)
                  {
                     char ch = line.text[c];
                     bool isAlUnder = CharMatchCategories(ch, letters|numbers|marks|connector);
                     if(key.shift ? isAlUnder : !isAlUnder)
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastLine = line;
                     }
                     else if(foundAlpha)
                     {
                        found = true;
                        if(!key.shift)
                        {
                           curPosition = c;
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);
                           textBlock = line;
                           PositionCaret(true);
                        }
                        break;
                     }
                  }
                  // No next word found,
                  if(!found && (c != curPosition || line != textBlock))
                  {
                     found = true;
                     lastLine = line;
                     lastC = line.textLen-1;
                     if(key.shift)
                        break;
                     else
                     {
                        curPosition = line.textLen;
                        if(!key.shift)
                        {
                           selPosition = curPosition;
                           selBlock = textBlock;
                        }
                        Update(null);

                        textBlock = line;
                        PositionCaret(true);
                     }
                  }
                  if(!key.shift)
                     foundAlpha = true;
               }
               if(key.shift && found)
               {
                  curPosition = lastC+1;
                  textBlock = lastLine;
                  PositionCaret(true);
                  Update(null);
               }
               break;
            }
            case Key { left, ctrl = true, shift = true }:
            case ctrlLeft:
            {
               bool foundAlpha = false;
               bool found = false;
               Block line, lastLine;
               int lastC;

               for(line = textBlock; (line && !found); line = line.prev ? line.prev.prev : null)
               {
                  int start, c;
                  if(curPosition == 0 && line != textBlock)
                  {
                     foundAlpha = true;
                     lastC = line.textLen;
                     lastLine = line;
                     break;
                  }
                  if(line == textBlock) start = curPosition-1; else start = line.textLen-1;
                  for(c = start; c>=0; c--)
                  {
                     if(CharMatchCategories(line.text[c], letters|numbers|marks|connector))
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastLine = line;
                     }
                     else
                     {
                        if(foundAlpha)
                        {
                           found = true;
                           break;
                        }
                     }
                  }
                  // No next word found,
                  if(!found && curPosition > 0)
                  {
                     foundAlpha = true;
                     lastC = 0;
                     lastLine = line;
                     break;
                  }
               }
               if(foundAlpha)
               {
                  textBlock = lastLine;
                  curPosition = lastC;
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  PositionCaret(true);
                  Update(null);
               }
               break;
            }
            case Key { right, shift = true }:
            case right:
               if(curPosition < textBlock.textLen)
               {
                  curPosition += UTF8_NUM_BYTES(textBlock.text[curPosition]);
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  PositionCaret(true);
                  Update(null);
               }
               else if(textBlock.next && textBlock.next.next)
               {
                  textBlock = textBlock.next.next;
                  curPosition = 0;
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  PositionCaret(true);
                  Update(null);
               }
               break;
            case Key { left, shift = true }:
            case left:
               if(curPosition > 0)
               {
                  while(curPosition > 0 && !UTF8_IS_FIRST(textBlock.text[--curPosition]));
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  PositionCaret(true);
                  Update(null);
               }
               else if(textBlock.prev)
               {
                  textBlock = textBlock.prev.prev;
                  curPosition = textBlock.textLen;
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  PositionCaret(true);
                  Update(null);
               }
               break;
            case backSpace:
               if(readOnly) break;
               if(textBlock == selBlock && curPosition == selPosition)
               {
                  if(curPosition)
                  {
                     int c = curPosition;
                     int nb = 1;
                     while(c > 0 && !UTF8_IS_FIRST(textBlock.text[--c])) nb++;
                     memmove(textBlock.text + curPosition - nb, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                     textBlock.textLen -= nb;
                     textBlock.text = renew textBlock.text char[textBlock.textLen + 1];
                     curPosition -= nb;
                     selPosition = curPosition;
                     selBlock = textBlock;

                     ComputeMinSizes();
                     ComputeSizes();
                     PositionCaret(true);
                     Update(null);
                  }
                  else if(textBlock.prev)
                  {
                     Block prev = textBlock.prev, prevBlock = textBlock.prev.prev;
                     prevBlock.text = renew prevBlock.text char[prevBlock.textLen + textBlock.textLen + 1];
                     memcpy(prevBlock.text + prevBlock.textLen, textBlock.text, textBlock.textLen + 1);

                     selPosition = curPosition = prevBlock.textLen;
                     selBlock = textBlock;
                     prevBlock.textLen += textBlock.textLen;
                     textBlock.parent.subBlocks.Remove(prev);
                     if(prev == selBlock)
                     {
                        selBlock = textBlock;
                        selPosition = curPosition;
                     }
                     delete prev;
                     textBlock.parent.subBlocks.Remove(textBlock);
                     if(textBlock == selBlock)
                     {
                        selBlock = prevBlock;
                        selPosition = curPosition;
                     }
                     delete textBlock;
                     textBlock = prevBlock;

                     ComputeMinSizes();
                     ComputeSizes();
                     PositionCaret(true);
                     Update(null);
                  }
               }
               else
                  DeleteSelection();
               break;
            case del:
               if(readOnly) break;
               if(textBlock != selBlock || curPosition != selPosition)
                  DeleteSelection();
               else if(textBlock.textLen > curPosition)
               {
                  int nb = UTF8_NUM_BYTES(textBlock.text[curPosition]);
                  memmove(textBlock.text + curPosition, textBlock.text + curPosition + nb, textBlock.textLen - curPosition + 1 - nb + 1);
                  textBlock.textLen -= nb;
                  textBlock.text = renew textBlock.text char[textBlock.textLen + 1];

                  ComputeMinSizes();
                  ComputeSizes();

                  PositionCaret(true);
                  Update(null);
               }
               else if(textBlock.next && textBlock.next.next)
               {
                  Block next = textBlock.next, nextBlock = textBlock.next.next;
                  textBlock.text = renew textBlock.text char[textBlock.textLen + nextBlock.textLen + 1];
                  memcpy(textBlock.text + textBlock.textLen, nextBlock.text, nextBlock.textLen + 1);

                  textBlock.textLen += nextBlock.textLen;
                  textBlock.parent.subBlocks.Remove(next);
                  if(next == selBlock)
                  {
                     selBlock = textBlock;
                     selPosition = curPosition;
                  }
                  delete next;
                  textBlock.parent.subBlocks.Remove(nextBlock);
                  if(nextBlock == selBlock)
                  {
                     selBlock = textBlock;
                     selPosition = curPosition;
                  }
                  delete nextBlock;

                  ComputeMinSizes();
                  ComputeSizes();
                  PositionCaret(true);
                  Update(null);
               }
               break;
            case enter:
            {
               int th = 0;
               Block block;
               Block newBlock;
               int startY, startX;

               if(readOnly) break;
               DeleteSelection();

               block = { type = BR, parent = textBlock.parent, font = textBlock.font };
               newBlock = { type = TEXT, parent = textBlock.parent, font = textBlock.font };
               startY = textBlock.startY;
               startX = textBlock.startX;

               display.FontExtent(textBlock.font.font, " ", 1, null, &th);
               textBlock.parent.subBlocks.Insert(textBlock, block);
               textBlock.parent.subBlocks.Insert(block, newBlock);

               startY += th;

               newBlock.textLen = textBlock.textLen - curPosition;
               newBlock.text = new char[newBlock.textLen+1];
               memcpy(newBlock.text, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
               textBlock.textLen = curPosition;
               textBlock.text[curPosition] = 0;

               newBlock.startY = startY;
               newBlock.startX = startX;
               selPosition = curPosition = 0;

               ComputeMinSizes();
               ComputeSizes();

               textBlock = newBlock;
               selBlock = textBlock;
               PositionCaret(true);
               Update(null);
               break;
            }
            case ctrlX:
            case Key { del, shift = true }:
               if(readOnly) break;
               // Cut
               CopySelection();
               DeleteSelection();
               break;
            case ctrlC:
            case ctrlInsert:
               // Copy
               CopySelection();
               break;
            case shiftInsert:
            case ctrlV:
               if(!readOnly)
               {
                  ClipBoard clipBoard { };
                  if(clipBoard.Load())
                  {
                     int c;
                     char * text = clipBoard.memory;
                     char ch;
                     int start = 0;
                     Block parent;
                     FontEntry font;

                     DeleteSelection();

                     parent = textBlock.parent;
                     font = textBlock.font;

                     for(c = 0; ; c++)
                     {
                        ch = text[c];
                        if(ch == '\n' || ch == '\r' || !ch)
                        {
                           int len = c - start;
                           textBlock.text = renew textBlock.text char[textBlock.textLen + 1 + len];
                           memmove(textBlock.text + curPosition + len, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                           memcpy(textBlock.text + curPosition, text + start, len);
                           textBlock.textLen += len;
                           curPosition += len;
                           selPosition = curPosition;
                           selBlock = textBlock;
                           if(!ch) break;
                           {
                              Block block { type = BR, parent = parent, font = font };
                              Block newBlock { type = TEXT, parent = parent, font = font };
                              int startY = textBlock.startY, startX = textBlock.startX;
                              int th = 0;

                              display.FontExtent(textBlock.font.font, " ", 1, null, &th);
                              textBlock.parent.subBlocks.Insert(textBlock, block);
                              textBlock.parent.subBlocks.Insert(block, newBlock);

                              startY += th;

                              newBlock.textLen = textBlock.textLen - curPosition;
                              newBlock.text = new char[newBlock.textLen+1];
                              memcpy(newBlock.text, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                              textBlock.textLen = curPosition;
                              textBlock.text[curPosition] = 0;

                              newBlock.startY = startY;
                              newBlock.startX = startX;
                              selPosition = curPosition = 0;
                              selBlock = textBlock;
                              textBlock = newBlock;
                           }
                           if(ch == '\r' && text[c+1] == '\n') c++;
                           start = c + 1;
                        }
                     }
                     ComputeMinSizes();
                     ComputeSizes();
                     PositionCaret(true);
                     Update(null);
                  }
                  delete clipBoard;
               }
               break;
            default:
            {
               // eC BUG HERE: (Should be fixed)
               if(!readOnly && !key.ctrl && !key.alt && ch >= 32 && ch != 128 /*&& ch < 128*/)
               {
                  char string[5];
                  int len = UTF32toUTF8Len(&ch, 1, string, 5);
                  int c;

                  DeleteSelection();

                  textBlock.text = renew textBlock.text char[textBlock.textLen + len + 1];
                  memmove(textBlock.text + curPosition + len, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);

                  for(c = 0; c<len; c++)
                  {
                     textBlock.text[curPosition] = string[c];
                     textBlock.textLen++;
                     curPosition++;
                  }
                  selPosition = curPosition;
                  selBlock = textBlock;

                  {
                     //Clear(html.block);
                     //CreateForms(html.block);
                     ComputeMinSizes();
                     ComputeSizes();
                     //PositionForms();
                  }
                  PositionCaret(true);
                  Update(null);
               }
            }
         }
      }
      return true;
   }

   void OnResize(int width, int height)
   {
      HTMLView::OnResize(width, height);
      PositionCaret(true);
   }

   int caretX, caretY;
   void PositionCaret(bool setCaretX)
   {
      if(edit)
      {
         int tw = 0, th = 0;
         int textPos = 0;
         int sx = textBlock.startX, sy = textBlock.startY;
         char * text = textBlock.text;
         int maxW;
         Block block = textBlock;
         int xOffset = 0;
         while(block && block.type != TD) block = block.parent;
         if(block)
         {
            Block table = block;
            while(table && table.type != TABLE) table = table.parent;
            if(table)
               maxW = block.w - 2* table.cellPadding;
            else
               maxW = clientSize.w - 10 - sx;
         }
         else
            maxW = clientSize.w - 10 - sx;

         display.FontExtent(textBlock.font.font, " ", 1, null, &th);

         // Work around to re-align with first line having different indentation because of &nbsp;&nbsp; before <A> of current block
         {
            Block parent = textBlock.parent;
            while(parent && parent.type == ANCHOR) parent = parent.parent;
            if(parent && parent.subBlocks.first && ((Block)parent.subBlocks.first).type == TEXT)
               xOffset = sx - ((Block)parent.subBlocks.first).startX;
         }

         while(textPos < textBlock.textLen)
         {
            int startPos = textPos;
            int width = 0;
            int x = xOffset;
            bool lineComplete = false;

            for(; textPos<textBlock.textLen && !lineComplete;)
            {
               int w;
               int len;
               char * nextSpace = strchr(text + textPos, ' ');

               if(nextSpace)
                  len = (nextSpace - (text + textPos)) + 1;
               else
                  len = textBlock.textLen - textPos;

               display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

               if(x + width + w > maxW && x > 0)
               {
                  lineComplete = true;
                  break;
               }
               textPos += len;

               width += w;

               if(nextSpace)
               {
                  x += width;
                  width = 0;
               }
            }
            if(curPosition < textPos || textPos == textBlock.textLen)
            {
               int len = curPosition - startPos;
               display.FontExtent(textBlock.font.font, text + startPos, len, &tw, null);
               sx += tw;
               break;
            }
            sy += th;
            sx = textBlock.startX - xOffset;
         }
         if(setCaretX)
            caretX = sx;
         caretY = sy;
         SetCaret(sx-1, sy, th);
         {
            Point scrollPos = scroll;
            bool doScroll = false;
            if(sy - scroll.y + th > clientSize.h)
            {
               scrollPos.y = sy + th - clientSize.h;
               doScroll = true;
            }
            else if(sy - scroll.y < 0)
            {
               scrollPos.y = sy;
               doScroll = true;
            }
            if(sx - scroll.x + 10 > clientSize.w)
            {
               scrollPos.x = sx + 10 - clientSize.w;
               doScroll = true;
            }
            else if(sx - scroll.x < 10)
            {
               scrollPos.x = sx - 10;
               doScroll = true;
            }
            if(doScroll)
               scroll = scrollPos;
         }
      }
      else
         SetCaret(0,0,0);
   }

   // Returns a character offset into the TextBlock from a window coordinate
   int TextPosFromPoint(int px, int py, Block * block, bool half)
   {
      Block parentBlock = this.textBlock.parent;
      Block textBlock;
      int result = 0;
      *block = this.textBlock;

      px += scroll.x;
      py += scroll.y;

      for(textBlock = parentBlock.subBlocks.first; textBlock; textBlock = textBlock.next)
      {
         int sx = textBlock.startX, sy = textBlock.startY;
         int th = 0;
         int textPos = 0;
         char * text = textBlock.text;
         int maxW;
         Block b = textBlock;
         int space;
         int xOffset = 0;

         if(textBlock.type != TEXT) continue;

         while(b && b.type != TD) b = b.parent;
         if(b)
         {
            Block table = b;
            while(table && table.type != TABLE) table = table.parent;
            if(table)
               maxW = b.w - 2* table.cellPadding;
            else
               maxW = clientSize.w - 10 - sx;
         }
         else
            maxW = clientSize.w - 10 - sx;

         // Work around to re-align with first line having different indentation because of &nbsp;&nbsp; before <A> of current block
         {
            Block parent = textBlock.parent;
            while(parent && parent.type == ANCHOR) parent = parent.parent;
            if(parent && parent.subBlocks.first && ((Block)parent.subBlocks.first).type == TEXT)
               xOffset = sx - ((Block)parent.subBlocks.first).startX;
         }

         display.FontExtent(textBlock.font.font, " ", 1, &space, &th);
         //space = space/2+2;
         space = 2;

         while(textPos < textBlock.textLen)
         {
            int width = 0;
            int x = xOffset;
            bool lineComplete = false;

            for(; textPos<textBlock.textLen && !lineComplete;)
            {
               int w;
               int len;
               char * nextSpace = strchr(text + textPos, ' ');

               if(nextSpace)
                  len = (nextSpace - (text + textPos)) + 1;
               else
                  len = textBlock.textLen - textPos;

               display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

               sx = x + textBlock.startX - xOffset;
               if(/*py >= sy && */py < sy + th && /*px >= sx-space && */px < sx + w-space)
               {
                  int c, numBytes;
                  char ch;
                  *block = textBlock;
                  for(c = textPos; (ch = text[c]); c += numBytes)
                  {
                     numBytes = UTF8_NUM_BYTES(ch);
                     display.FontExtent(textBlock.font.font, text + c, numBytes, &w, &th);
                     if(/*py >= sy && */py < sy + th && /*px >= sx-w/2-space && */px < sx + (half ? w/2 : w) -space)
                        break;
                     sx += w;
                  }
                  return c;
               }

               if(x + width + w > maxW && x > 0)
               {
                  lineComplete = true;
                  break;
               }
               textPos += len;

               width += w;

               if(nextSpace)
               {
                  x += width;
                  width = 0;
               }
            }
            if(/*py >= sy && */py < sy + th)
            {
               *block = textBlock;
               return textBlock.textLen;
            }
            sy += th;
         }
         *block = textBlock;
         result = textBlock.textLen;
      }
      return result;
   }
}

Application componentsApp;

class Documentor : GuiApplication
{
   bool Init()
   {
      Platform os = __runtimePlatform;
      SetGlobalContext(globalContext);
      SetExcludedSymbols(&excludedSymbols);
      SetDefines(&::defines);
      SetImports(&imports);
      SetInDocumentor(true);

      SetGlobalData(globalData);

      settingsContainer.dataOwner = &ideSettings;
      settingsContainer.Load();
      if(!ideSettings.docDir || !ideSettings.docDir[0] )
      {
         if(os == win32) // if Windows OS then
         {
            char programFilesDir[MAX_LOCATION];
            char appData[MAX_LOCATION];
            char homeDrive[MAX_LOCATION];
            char winDir[MAX_LOCATION];
            GetEnvironment("APPDATA", appData, sizeof(appData));
            GetEnvironment("HOMEDRIVE", homeDrive, sizeof(homeDrive));
            GetEnvironment("windir", winDir, sizeof(winDir));
            if(GetEnvironment("ProgramFiles", programFilesDir, MAX_LOCATION))
            {
               PathCat(programFilesDir, "ECERE SDK\\doc");
               ideSettings.docDir = programFilesDir;
            }
            else if(homeDrive[0])
            {
               PathCat(homeDrive, "ECERE SDK\\doc");
               ideSettings.docDir = homeDrive;
            }
            else if(winDir[0])
            {
               PathCat(winDir, "..\\ECERE SDK\\doc");
               ideSettings.docDir = winDir;
            }
            else
               ideSettings.docDir = "C:\\ECERE SDK\\doc";
         }
         else // if Os is Linux, or Mac OSX or something else
            ideSettings.docDir = "/usr/share/ecere/doc/";
         settingsContainer.Save();
      }

      //if(argc > 1)
      {
      #if 0
         Module module = eModule_Load(componentsApp, "ecere" /*argv[1]*/, privateAccess);
         DataRow row;
         AddComponents(module, true);
         mainForm.browser.currentRow = row = mainForm.browser.FindSubRow((int64)module);
         // mainForm.browser.currentRow = row = mainForm.browser.FindSubRow((int64)eSystem_FindClass(componentsApp, "Window"));
         while((row = row.parent))
            row.collapsed = false;
      #endif
      }

      commandThread.Create();
      return true;
   }

   bool Cycle(bool idle)
   {
      if(quit)
         mainForm.Destroy(0);
      return true;
   }

   void Terminate()
   {
      PrintLn("Exited");
      console.Flush();
      quit = true;
      if(commandThread.created)
      {
         console.CloseInput();
         console.CloseOutput();
         app.Unlock();
         commandThread.Wait();
         app.Lock();
      }

      FreeContext(globalContext);
      FreeExcludedSymbols(excludedSymbols);
      ::defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);

      FreeGlobalData(globalData);
      FreeTypeData(componentsApp);
      FreeIncludeFiles();
      delete componentsApp;
   }
}

ConsoleFile console { };
MainForm mainForm { };
bool quit;

Thread commandThread
{
   unsigned int Main()
   {
      while(!quit)
      {
         char command[1024];
         console.GetLine(command, sizeof(command));
         if(!quit && command[0])
         {
            app.Lock();
            if(!strcmpi(command, "Activate"))
               mainForm.Activate();
            else if(!strcmpi(command, "Quit"))
               quit = true;
            app.Unlock();
         }
      }
      return 0;
   }
};
#endif // !defined(EAR_TO_ECON_ECDOC)

class ItemDoc
{
public:
   property String name { get { return this ? name : null; } set { delete name; name = CopyString(value); } isset { return name && *name; } }
   property String description { get { return this ? description : null; } set { delete description; description = CopyString(value); } isset { return description && *description; } }
private:
   char * name;
   char * description;
   property bool isEmpty
   {
      get
      {
         return !(
            (name && *name) ||
            (description && *description));
      }
   }
   ~ItemDoc()
   {
      delete name;
      delete description;
   }
}

class MoreDoc : ItemDoc
{
public:
   property String usage { get { return this ? usage : null; } set { delete usage; usage = CopyString(value); } isset { return usage && *usage; } }
   property String example { get { return this ? example : null; } set { delete example; example = CopyString(value); } isset { return example && *example; } }
   property String remarks { get { return this ? remarks : null; } set { delete remarks; remarks = CopyString(value); } isset { return remarks && *remarks; } }
   property String also { get { return this ? also : null; } set { delete also; also = CopyString(value); } isset { return also && *also; } }
private:
   char * usage;
   char * example;
   char * remarks;
   char * also;
   property bool isEmpty
   {
      get
      {
         return !(
            (usage && *usage) ||
            (example && *example) ||
            (remarks && *remarks) ||
            (also && *also) ||
            !ItemDoc::isEmpty);
      }
   }
   ~MoreDoc()
   {
      delete usage;
      delete example;
      delete remarks;
      delete also;
   }
}

class NamespaceDoc : ItemDoc
{
public:
   Map<String, DefineDoc> defines;
   Map<String, FunctionDoc> functions;
private:
   property bool isEmpty
   {
      get
      {
         return !(
            (defines && defines.count) ||
            (functions && functions.count) ||
            !ItemDoc::isEmpty);
      }
   }
   ~NamespaceDoc()
   {
      delete defines;
      delete functions;
   }
}

class DefineDoc : ItemDoc { }

class FunctionDoc : MoreDoc
{
public:
   Map<String, ParameterDoc> parameters;
   property String returnValue { get { return this ? returnValue : null; } set { delete returnValue; returnValue = CopyString(value); } isset { return returnValue && *returnValue; } }
private:
   char * returnValue;
   property bool isEmpty
   {
      get
      {
         return !(
            (parameters && parameters.count) ||
            (returnValue && *returnValue) ||
            !MoreDoc::isEmpty);
      }
   }
   ~FunctionDoc()
   {
      delete parameters;
      delete returnValue;
   }
}

class ParameterDoc : ItemDoc
{
public:
   uint position;
}

class ClassDoc : MoreDoc
{
public:
   Map<String, ValueDoc> values;
   Map<String, FieldDoc> fields;
   Map<String, PropertyDoc> properties;
   Map<String, ConversionDoc> conversions;
   Map<String, MethodDoc> methods;
private:
   property bool isEmpty
   {
      get
      {
         return !(
            (values && values.count) ||
            (fields && fields.count) ||
            (properties && properties.count) ||
            (conversions && conversions.count) ||
            (methods && methods.count) ||
            !MoreDoc::isEmpty);
      }
   }
   ~ClassDoc()
   {
      delete values;
      delete fields;
      delete properties;
      delete conversions;
      delete methods;
   }
}

class ValueDoc : ItemDoc { }

class FieldDoc : ItemDoc { }

class PropertyDoc : ItemDoc { }

class ConversionDoc : ItemDoc { }

class MethodDoc : FunctionDoc { }

char * getDocFileNameFromTypeName(const char * typeName)
{
   char * docFileName = new char[MAX_FILENAME];
   const char * swap = "pointer";
   const char * s = typeName;
   char * d = docFileName;
   const char * end = s + strlen(typeName);
   int swapLen = strlen(swap);
   for(; s < end; s++)
   {
      if(*s == ' ')
         *d = '-';
      else if(*s == '*')
      {
         strcpy(d, swap);
         d += swapLen;
      }
      else
         *d = *s;
      d++;
   }
   *d = '\0';
   return docFileName;
}

class DocCacheEntry //: struct      // TOCHECK: Why does this causes an error: 'struct __ecereNameSpace__ecere__com__MapIterator' has no member named 'data'
{
public:
   Time timeStamp;      // Should this be last accessed, or last retrieved?
   ItemDoc doc;

   ~DocCacheEntry()
   {
      delete doc;
   }
}

Map<String, DocCacheEntry> docCache { };
