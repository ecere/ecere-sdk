import "ecere"
import "ec"
import "HTMLView"
import "IDESettings"
import "SettingsDialog"

static Context globalContext { };
static OldList defines { };
static OldList imports { };
static NameSpace globalData;
static OldList excludedSymbols { offset = (uint)&((Symbol)0).left }; 

#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

default:
/*extern */int __ecereVMethodID_class_OnGetString;
private:


static void Dummy()
{
int a;
a.OnGetString(null, null, null);
}

static bool editing = true;

enum CodeObjectType { typeClass, typeData, typeMethod, typeEvent, typeProperty, typeNameSpace, typeDataType, typeEnumValue, typeDataPrivate, typeMethodPrivate, typePropertyPrivate };

static char * iconNames[CodeObjectType] = 
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

IDESettings settings { }; // instantiate the IDESettings class from the IDESettings.ec file. Do this at a global level so that all methods can access settings.

IDESettingsContainer settingsContainer
{
   driver = "JSON";
   data = settings;
   dataOwner = &settings;
};

// WARNING : This function expects a null terminated string since it recursively concatenate...
static void _PrintType(Type type, char * string, bool printName, bool printFunction, bool fullName)
{
   if(type)
   {
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
                     char hex[10];
                     sprintf(hex, "%08x", type._class.registered);
                     strcat(string, "<a href=\"api://");
                     strcat(string, hex);
                     strcat(string, "\" style=\"text-decoration: none;\">");
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
               else
               {
                  printf("");
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
            printf("");
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
      char typeString[1024];
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

void AddComponents(Module module, bool isDll)
{
   DataRow row = null;
   SubModule m;

   if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")))
   {
      row = mainForm.browser.AddRow();
      row.SetData(null, APIPageNameSpace { name = "ecereCOM", nameSpace = &module.application.systemNameSpace });
      row.tag = (int)null;
      AddNameSpace(row, null, module.application.systemNameSpace, null, "", !isDll);
   }

   for(m = module.modules.first; m; m = m.next)
   {
      if(m.importMode == publicAccess || !isDll)
         AddComponents(m.module, true);
   }

   // PUT MODULE DESCRIPTION HERE
   if(module.name && strcmp(module.name, "ecereCOM"))
   {
      row = mainForm.browser.AddRow();
      row.SetData(null, APIPageNameSpace { name = module.name, module = module, nameSpace = &module.publicNameSpace });
      row.tag = (int)module;
      AddNameSpace(row, module, module.publicNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
      if(!isDll)
         AddNameSpace(row, module, module.privateNameSpace, null /*module.application.systemNameSpace*/, "", !isDll);
   }
}

class APIPage
{
public:
   char * name;
   APIPage page;
   char * label;
   bool showPrivate;

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      return name;
   }

   virtual void Generate(File f)
   {
      page.Generate(f);
   }
};

enum DocumentationType
{
   nameSpaceDoc,
   classDoc,
   functionDoc,
   methodDoc
};

enum DocumentationItem
{
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

static void FigureFileName(char * fileName, Module module, DocumentationType type, void * object, DocumentationItem item, void * data)
{
   NameSpace * nameSpace, * ns;
   Class cl = null;
   Method method = null;
   GlobalFunction function = null;
   char nsName[1024], temp[1024];
   char docFile[1024];


   switch(type)
   {
      case nameSpaceDoc: nameSpace = object; break;
      case classDoc:     cl = (Class)object; nameSpace = cl.nameSpace; break;
      case functionDoc:  function = object; nameSpace = function.nameSpace; break;
      case methodDoc:    method = object; cl = method._class; nameSpace = cl.nameSpace; break;
   }

   nsName[0] = 0;
   ns = nameSpace;
   while(ns && ns->name)
   {
      strcpy(temp, "namespaces/");
      strcat(temp, ns->name);
      strcat(temp, "/");
      strcat(temp, nsName);
      strcpy(nsName, temp);
      ns = ns->parent;
   }
   sprintf(docFile, "%s.eCdoc", (!module || !module.name || !strcmp(nsName, "namespaces/ecere/namespaces/com")) ? "ecereCOM" : module.name);

   sprintf(fileName, "<%s/%s>", settings.docDir, docFile); // Note that in the ecereIDE.ini file, there can be no quotes around the path, and there needs to be the final backslash. Otherwise this does not work.
   strcat(fileName, nsName);

   if(cl)
   {
      strcat(fileName, "classes/");
      strcat(fileName, cl.name);
      strcat(fileName, "/");
   }

   if(method)
   {
      strcat(fileName, "methods/");
      strcat(fileName, method.name);
      strcat(fileName, "/");
   }
   else if(function)
   {
      char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
      if(name) name += 2; else name = function.name;
      strcat(fileName, "functions/");
      strcat(fileName, name);
      strcat(fileName, "/");
   }

   switch(item)
   {
      case description: strcat(fileName, "description"); break;
      case usage: strcat(fileName, "usage"); break;
      case remarks: strcat(fileName, "remarks"); break;
      case example: strcat(fileName, "example"); break;
      case seeAlso: strcat(fileName, "seeAlso"); break;
      case returnValue: strcat(fileName, "returnValue"); break;
      case enumerationValue: 
         strcat(fileName, "enumeration values/");
         strcat(fileName, ((NamedLink)data).name);
         break;
      case definition:
         strcat(fileName, "definitions/");
         strcat(fileName, ((Definition)data).name);
         break;
      case conversion:
      {
         char * name = RSearchString(((Property)data).name, "::", strlen(((Property)data).name), true, false);
         if(name) name += 2; else name = ((Property)data).name;
         strcat(fileName, "conversions/");
         strcat(fileName, name);
         break;
      }
      case memberDescription:
         strcat(fileName, "data members/");
         strcat(fileName, ((DataMember)data).name);
         break;
      case propertyDescription:
         strcat(fileName, "properties/");
         strcat(fileName, ((Property)data).name);
         break;
      case parameter:
      {
         int count;
         char name[1024];
         Type prev;
         strcat(fileName, "parameters/");
         for(prev = data, count = 0; prev; prev = prev.prev, count++);
         sprintf(name, "%s.%d", ((Type)data).name, count);
         strcat(fileName, name);
         break;
      }
   }
}

static char * ReadDoc(Module module, DocumentationType type, void * object, DocumentationItem item, void * data)
{
   char fileName[MAX_LOCATION];
   String contents = null;
   File file;

   FigureFileName(fileName, module, type, object, item, data);
   file = FileOpen(fileName, read);
   if(file)
   {
      uint len;
      if((len = file.GetSize()))
      {
         contents = new char[len+1];
         file.Read(contents, 1, len);
         contents[len] = '\0';      
      }
      delete file;
   }
   if(contents)
   {
      int c;
      for(c = 0; contents[c]; c++)
         if(!isspace(contents[c])) break;
      if(!contents[c])
         delete contents;      
   }
   if(editing && !contents)
      contents = CopyString($"[Add Text]");
   return contents;
}

class APIPageNameSpace : APIPage
{
   NameSpace * nameSpace;
   Module module;
   
   void Generate(File f)
   {
      char string[1024];
      char nsName[1024], temp[1024];
      NameSpace * ns;
      BTNamedLink link;
      uint tag;

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
         f.Printf("<FONT FACE=\"Arial\" SIZE=\"6\">%s</FONT><br><br>\n", nsName );
         tag = (uint)nameSpace;
         f.Printf($"Module: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", (module && module.name) ? module : null, (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      }
      else
      {
         tag = (uint)((!module || !module.name || !strcmp(nsName, "ecere::com") ? null : module));
         f.Printf($"<FONT FACE=\"Arial\" SIZE=\"6\">Module %s</FONT><br>\n", (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      }

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
         f.Printf($"Parent namespace: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", nameSpace->parent, nsName);

      f.Printf("<br>");
      {
         char * desc = ReadDoc(module, nameSpaceDoc, nameSpace, description, null);
         if(desc)
         {
            f.Printf($"<H3>Description</H3><br><br>\n");
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, nameSpaceDoc, nameSpace, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a><br><br>");
            }
            else
               f.Printf("%s<br><br>", desc);
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
               f.Printf($"<H3>Sub Namespaces</H3><br><br>\n");
               f.Printf("<TABLE >\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a></TD>", iconNames[typeNameSpace], ns, ns->name);
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
            f.Printf("</TR><br>\n");
         }
         if(!first)
            f.Printf("</TABLE><br>\n");
      }

      if(nameSpace->classes.first)
      {
         bool first = true;
         for(link = (BTNamedLink)nameSpace->classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            Class cl = link.data;
            if(!cl.templateClass)
            {
               char * desc = ReadDoc(module, classDoc, cl, description, null);

               if(first)
               {
                  f.Printf($"<a name=Classes></a><H3>Classes</H3><br><br>\n");
                  f.Printf("<TABLE >\n");
                  first = false;
               }

               f.Printf("<TR>");

               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a></TD>", (cl.type == enumClass || cl.type == unitClass || cl.type == systemClass) ? iconNames[typeDataType] : iconNames[typeClass], cl, cl.name);
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
            f.Printf("</TABLE><br>\n");
      }

      if(nameSpace->functions.first)
      {
         bool first = true;
         for(link = (BTNamedLink)nameSpace->functions.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            GlobalFunction function = link.data;
            char * desc = ReadDoc(module, functionDoc, function, description, null);
            char * name = RSearchString(function.name, "::", strlen(function.name), true, false);
            if(name) name += 2; else name = function.name;
            if(first)
            {
               f.Printf("<a name=Functions></a><H3>Functions</H3><br><br>\n");
               f.Printf("<TABLE >\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a></TD>", iconNames[typeMethod], function, name);
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
            f.Printf("</TR><br>\n");
         }
         if(!first)
            f.Printf("</TABLE><br>\n");
      }

      if(nameSpace->defines.first)
      {
         bool first = true;
         for(link = (BTNamedLink)nameSpace->defines.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            DefinedExpression def = link.data;
            char * desc = ReadDoc(module, nameSpaceDoc, nameSpace, definition, def);
            if(first)
            {
               f.Printf($"<a name=Definitions></a><H3>Definitions</H3><br><br>\n");
               f.Printf("<TABLE >\n");
               first = false;
            }
            f.Printf("<TR>");
            f.Printf("<TD valign=top height=22 nowrap=1><a name=%08x></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", def, iconNames[typeData], def.name);
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
            f.Printf("</TR><br>\n");
         }
         if(!first)
            f.Printf("</TABLE><br>\n");
      }

      f.Printf("</FONT></BODY></HTML>\n");
   }   
}

class APIPageClass : APIPage
{
   Class cl;

   void Generate(File f)
   {
      char string[1024];
      Method method;
      Property prop;
      DataMember member;
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

      f.Printf($"Module: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", (module && module.name) ? module : null, (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      if(nsName[0]) 
         f.Printf($"Namespace: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", cl.nameSpace, nsName);

      {
         char * classType = null;
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
            f.Printf("<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a>", cl.base, cl.base.name);
         f.Printf("<br>\n");
      }

      {
         char * desc = ReadDoc(module, classDoc, cl, description, null);
         if(desc)
         {
            f.Printf($"<br><H3>Description</H3><br><br>\n");
            if(editing)
            {
               char fileName[MAX_LOCATION];
               FigureFileName(fileName, module, classDoc, cl, description, null);
               f.Printf("<a style=\"text-decoration:none;\" href=\"edit://%s\">", fileName);
               f.Puts(desc);
               f.Printf("</a><br><br>");
            }
            else
               f.Printf("%s<br><br>", desc);
            delete desc;
         }
      }

      if(cl.type == enumClass)
      {
         EnumClassData enumeration = (EnumClassData)cl.data;
         if(enumeration.values.first)
         {
            NamedLink item;
                        
            f.Printf($"<a name=EnumerationValues></a><H3>Enumeration Values</H3><br><br>\n");
            f.Printf("<TABLE >\n");

            for(item = enumeration.values.first; item; item = item.next)
            {
               char * desc = ReadDoc(module, classDoc, cl, enumerationValue, item);
               bool needClass = true;
               Class dataClass;
               Class base = cl;
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
               f.Printf("<TD valign=top height=22 nowrap=1><a name=%08x></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", item, iconNames[typeEnumValue], item.name);
               if(dataClass.type == systemClass)
               {
                  needClass = false;
                  dataClass._vTbl[__ecereVMethodID_class_OnGetString](dataClass, &item.data, string, sizeof(string), &needClass);
               }
               else
                  eSystem_FindClass(componentsApp, "class")._vTbl[__ecereVMethodID_class_OnGetString](dataClass, &item.data, string, sizeof(string), &needClass);
               if(needClass)
                  f.Printf("<TD valign=top height=22 nowrap=1>%s { %s }</TD>", dataClass.name, string);
               else
                  f.Printf("<TD valign=top height=22 nowrap=1>%s</TD>", string);
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
            f.Printf("</TABLE><BR>\n");
         }
      }

      if(cl.conversions.first)
      {
         f.Printf($"<a name=Conversions></a><H3>Conversions</H3><br><br>\n");
         f.Printf("<TABLE >\n");
         for(prop = cl.conversions.first; prop; prop = prop.next)
         {
            if((prop.memberAccess == publicAccess || (prop.memberAccess == privateAccess && showPrivate)) && prop.name)
            {
               char * desc = ReadDoc(module, classDoc, cl, conversion, prop);
               DataRow mRow;
               char * name;
               Type type = ProcessTypeString(prop.name, false);
               name = RSearchString(prop.name, "::", strlen(prop.name), true, false);
               if(name) name += 2; else name = prop.name;

               f.Printf("<TR>");
               
               string[0] = 0;
               DocPrintType(type, string, true, false);
               
               f.Printf("<TD valign=top height=22 nowrap=1><a name=%08x></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", prop, iconNames[typeDataType], string);
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
         f.Printf("</TABLE><br>\n");
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
                  f.Printf($"<a name=Members></a><H3>Properties and Members</H3><br><br>\n");
                  f.Printf("<TABLE >\n");
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

                  f.Printf("<TD valign=top height=22 nowrap=1><a name=%08x></a><img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", prop, iconNames[typeProperty], prop.name);
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
            f.Printf("</TABLE><br>\n");
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
                  f.Printf($"<a name=VirtualMethods></a><H3>Virtual Methods</H3><br><br>\n");
                  f.Printf("<TABLE >\n");
                  first = false;
               }
               if(!method.dataType)
                  ProcessMethodType(method);

               f.Printf("<TR>");
               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a></TD>", method.dataType.thisClass ? iconNames[typeEvent] : iconNames[typeMethod], method, method.name);
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
               f.Printf("</TR><br>\n");
            }
         }
         if(!first)
            f.Printf("</TABLE><br>\n");

         // Non-Virtual Methods
         first = true;
         for(method = (Method)cl.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if((method.memberAccess == publicAccess || (method.memberAccess == privateAccess && showPrivate)) && method.type != virtualMethod)
            {
               char * desc = ReadDoc(module, methodDoc, method, description, null);
               if(first)
               {
                  f.Printf($"<a name=Methods></a><H3>Non-Virtual Methods</H3><br><br>\n");
                  f.Printf("<TABLE >\n");
                  first = false;
               }

               if(!method.dataType)
                  ProcessMethodType(method);

               f.Printf("<TR>");
               f.Printf("<TD valign=top height=22 nowrap=1><img valign=center src=\"%s\">&nbsp;&nbsp;<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a></TD>", iconNames[typeMethod], method, method.name);
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
               
               f.Printf("</TR><br>\n");
            }
         }
         if(!first)
            f.Printf("</TABLE><br>\n");
      }
      {
         char * usageDoc = ReadDoc(module, classDoc, cl, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, classDoc, cl, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3><br>\n");
            f.Printf("<FONT face=\"Courier New\">\n");
            f.Printf("<br><TABLE >\n");
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
            f.Printf("<br>\n");
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, classDoc, cl, remarks, null);

         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3><br>\n");
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
            f.Printf("<br><br>\n");
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
                  f.Printf($"<H3>Derived Classes</H3><br>\n");
                  f.Printf("<br>");
                  first = false;
               }
               else
                  f.Printf(", ");
               f.Printf("<a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a>", deriv, deriv.name);
             }            
         }
         if(!first)
            f.Printf("<br><br>\n");
      }
      {
         char * seeAlsoDoc = ReadDoc(module, classDoc, cl, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }   
}

class APIPageMethod : APIPage
{
   Method method;
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

      f.Printf($"Module: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", (module && module.name) ? module : null, (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);
      if(nsName[0])
         f.Printf($"Namespace: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", cl.nameSpace, nsName);
      f.Printf("Class: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", cl, cl.name);
      if(method.dataType.staticMethod)
      {
         f.Printf($"this pointer class: None<br>\n");
      }
      else if(method.dataType.thisClass && method.dataType.thisClass.registered && (method.dataType.thisClass.registered != method._class || method.type == virtualMethod))
      {
         f.Printf($"this pointer class: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", method.dataType.thisClass.registered, method.dataType.thisClass.registered.name);
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
            f.Printf($"<br><br><H3>Description</H3><br><br>\n");
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
            delete desc;
         }
      }

      f.Printf("<br><br>\n");
      if(method.dataType.params.first && ((Type)method.dataType.params.first).kind != voidType)
      {
         f.Printf($"<H3>Parameters</H3><br><br>\n");
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
                  f.Printf("s</a>&nbsp;</TD>\n");
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
         f.Printf("</TABLE><br>\n");
      }
      {
         char * usageDoc = ReadDoc(module, methodDoc, method, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, methodDoc, method, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3><br>\n");
            f.Printf("<FONT face=\"Courier New\">\n");
            f.Printf("<br><TABLE >\n");
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
            f.Printf("<br>\n");
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, methodDoc, method, remarks, null);
         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete remarksDoc;
         }
      }
      {
         char * seeAlsoDoc = ReadDoc(module, methodDoc, method, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3><br>\n");
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
            
            f.Printf("<br><br>\n");
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }   
}

class APIPageFunction : APIPage
{
   GlobalFunction function;
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

      f.Printf($"Module: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", (module && module.name) ? module : null, (!module || !module.name || !strcmp(nsName, "ecere::com")) ? "ecereCOM" : module.name);

      if(nsName[0])
         f.Printf($"Namespace: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", function.nameSpace, nsName);

      if(!function.dataType)
         function.dataType = ProcessTypeString(function.dataTypeString, false);

      if(function.dataType.thisClass && function.dataType.thisClass.registered)
      {
         f.Printf($"this pointer class: <a href=\"api://%08x\" style=\"text-decoration: none;\">%s</a><br>\n", function.dataType.thisClass.registered, function.dataType.thisClass.registered.name);
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
            f.Printf($"<br><br><H3>Description</H3><br><br>\n");
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
         }
      }
      f.Printf("<br><br>\n");
      if(function.dataType.params.first && ((Type)function.dataType.params.first).kind != voidType)
      {
         f.Printf($"<H3>Parameters</H3><br><br>\n");
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
         f.Printf("</TABLE><br>\n");
      }
      {
         char * usageDoc = ReadDoc(module, functionDoc, function, usage, null);
         if(usageDoc)
         {
            f.Printf($"<H3>Usage</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete usageDoc;
         }
      }
      {
         char * exampleDoc = ReadDoc(module, functionDoc, function, example, null);
         if(exampleDoc)
         {
            f.Printf($"<H3>Example</H3><br>\n");
            f.Printf("<FONT face=\"Courier New\">\n");
            f.Printf("<br><TABLE >\n");
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
            f.Printf("<br>\n");
            delete exampleDoc;
         }
      }
      {
         char * remarksDoc = ReadDoc(module, functionDoc, function, remarks, null);
         if(remarksDoc)
         {
            f.Printf($"<H3>Remarks</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete remarksDoc;
         }
      }
      {
         char * seeAlsoDoc = ReadDoc(module, functionDoc, function, seeAlso, null);
         if(seeAlsoDoc)
         {
            f.Printf($"<H3>See Also</H3><br>\n");
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
            f.Printf("<br><br>\n");
            delete seeAlsoDoc;
         }
      }
      f.Printf("</FONT></BODY></HTML>\n");
   }   
}

static void AddNameSpace(DataRow parentRow, Module module, NameSpace mainNameSpace, NameSpace comNameSpace, char * parentName, bool showPrivate)
{
   char nsName[1024];
   NameSpace * ns;
   NameSpace * nameSpace = mainNameSpace;
   DataRow row;
   DataRow classesRow = null;
   DataRow functionsRow = null, definesRow = null;
   APIPage page;

   char fileName[MAX_LOCATION];
   
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
      row.tag = (int)nameSpace;
      row.icon = mainForm.icons[typeNameSpace];
   }
   else
   {
      // "Global NameSpace"
      row = parentRow;
      page = parentRow.GetData(null);
   }

   {
      bool first = true;

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
   }
   if(mainNameSpace.classes.first || (comNameSpace && comNameSpace.classes.first))
   {
      for(nameSpace = mainNameSpace ; nameSpace; nameSpace = (nameSpace == mainNameSpace) ? comNameSpace : null)
      {
         if(nameSpace->classes.first)
         {
            BTNamedLink link;
            Class cl;
            for(link = (BTNamedLink)nameSpace->classes.first; link; link = (BTNamedLink)((BTNode)link).next)
            {
               cl = link.data;
               if(!cl.templateClass && (!module || cl.module == module || (!cl.module.name && !strcmp(module.name, "ecere"))))
               {
                  if(!classesRow) { classesRow = row.AddRow(); classesRow.SetData(null, APIPage { $"Classes", page = page }); classesRow.collapsed = true; classesRow.icon = mainForm.icons[typeClass]; classesRow.tag = 1; }
                  AddClass(classesRow, module, cl, nsName, showPrivate);
               }
            }
         }
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
                  char * name = ( name = RSearchString(fn.name, "::", strlen(fn.name), false, false), name ? name + 2 : fn.name);
                  DataRow fnRow;
                  if(!functionsRow) { functionsRow = row.AddRow(); functionsRow.SetData(null, APIPage { $"Functions", page = page }); functionsRow.collapsed = true; functionsRow.icon = mainForm.icons[typeMethod];  functionsRow.tag = 2; };
                  fnRow = functionsRow.AddRow(); fnRow.SetData(null, APIPageFunction { name, function = fn }); fnRow.icon = mainForm.icons[typeMethod]; fnRow.tag = (int)fn;
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
                  defRow = definesRow.AddRow(); defRow.SetData(null, APIPage { name, page = page }); defRow.icon = mainForm.icons[typeData]; defRow.tag = (int)def;
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

   f.Printf("<TD valign=top height=22 nowrap=1><a name=%08x></a>", member);
   for(c = 0; c<indent; c++)
      f.Printf("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
   f.Printf("<img valign=center src=\"%s\">&nbsp;&nbsp;%s</TD>", iconNames[typeData], member.name ? member.name : ((member.type == structMember) ? "(struct)" : "(union)"));
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
   f.Printf("</TR><br>\n");
}

static void AddDataMember(DataRow parentRow, APIPage page, DataMember member)
{
   DataRow row;
   if(member.type == normalMember)
   {
      row = parentRow.AddRow(); row.SetData(null, APIPage { member.name, page = page }); row.icon = mainForm.icons[typeData];
      row.tag = (int)member;
   }
   else
   {
      DataMember m;
      row = parentRow.AddRow(); row.SetData(null, APIPage { (member.type == unionMember) ? "(union)" : "(struct)", page });
      row.icon = mainForm.icons[typeData];
      row.tag = (int)member;

      for(m = member.members.first; m; m = m.next)
      {
         if(m.memberAccess == publicAccess || (m.memberAccess == privateAccess && page.showPrivate))
            AddDataMember(row, page, m);
      }
   }
}

static void AddClass(DataRow parentRow, Module module, Class cl, char * nsName, bool showPrivate)
{
   char fileName[MAX_LOCATION];
   char string[1024];
   Method method;
   Property prop;
   DataMember member;
   Type param;
   DataRow row;
   DataRow methodsRow = null, virtualsRow = null, eventsRow = null;
   DataRow propertiesRow = null, membersRow = null, conversionsRow = null, enumRow = null;
   APIPage page;

   row = parentRow.AddRow();
   row.SetData(null, (page = APIPageClass { cl.name, cl = cl, showPrivate = showPrivate }));
   row.tag = (int)cl;
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
                  mRow.tag = (int)method;
               }
               else
               {
                  if(!virtualsRow) { virtualsRow = row.AddRow(); virtualsRow.SetData(null, APIPage { $"Virtual Methods", page = page }); virtualsRow.collapsed = true; virtualsRow.icon = mainForm.icons[typeMethod]; virtualsRow.tag = 4; }
                  mRow = virtualsRow.AddRow(); mRow.SetData(null, APIPageMethod { method.name, method = method }); mRow.icon = mainForm.icons[typeMethod];
                  mRow.tag = (int)method;
               }
            }
            else
            {
               if(!methodsRow) { methodsRow = row.AddRow(); methodsRow.SetData(null, APIPage { $"Methods", page = page }); methodsRow.collapsed = true; methodsRow.icon = mainForm.icons[typeMethod]; methodsRow.tag = 5; }
               mRow = methodsRow.AddRow(); mRow.SetData(null, APIPageMethod { method.name, method = method }); mRow.icon = mainForm.icons[typeMethod];
               mRow.tag = (int)method;
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
               mRow.tag = (int)prop;
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
         char * name;
         if(!conversionsRow) { conversionsRow = row.AddRow(); conversionsRow.SetData(null, APIPage { $"Conversions", page = page }); conversionsRow.collapsed = true; conversionsRow.icon = mainForm.icons[typeDataType]; conversionsRow.tag = 7; }
         name = RSearchString(prop.name, "::", strlen(prop.name), true, false);
         if(name) name += 2; else name = prop.name;
         mRow = conversionsRow.AddRow(); mRow.SetData(null, APIPage { name, page = page }); mRow.icon = mainForm.icons[typeDataType];
         mRow.tag = (int)prop;
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
         mRow.tag = (int)item;
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
         SettingsDialog { master = this }.Modal(); // Open the settings dialog to allow the user to change the directory for the eCdoc files
      }
   };
   MenuDivider { fileMenu };
   MenuItem fileExit { fileMenu, $"Exit", x, altF4, NotifySelect = MenuFileExit };

   void OpenModule(char * filePath)
   {
      char extension[MAX_EXTENSION];
      Module module = null;
      static char symbolsDir[MAX_LOCATION];

      FreeContext(globalContext);
      FreeExcludedSymbols(excludedSymbols);
      ::defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);
      
      FreeGlobalData(globalData);
      FreeTypeData(componentsApp);
      FreeIncludeFiles();
      delete componentsApp;

      SetGlobalContext(globalContext);
      componentsApp = __ecere_COM_Initialize(false, 1, null);
      SetPrivateModule(componentsApp);

      StripLastDirectory(filePath, symbolsDir);
      SetSymbolsDir(symbolsDir);

      GetExtension(filePath, extension);

      mainForm.browser.Clear();

      ImportModule(filePath, normalImport, publicAccess, false);

      if(extension[0] && strcmpi(extension, "so") && strcmpi(extension, "dll"))
         componentsApp.name = CopyString(filePath);
      
      for(module = componentsApp.allModules.first; module; module = module.next)
      {
         if(module.name && (!strcmp(module.name, "ecere") || !strcmp(module.name, "ecereCOM")))
            break;
      }
      if(!module)
         eModule_LoadStrict(componentsApp, "ecereCOM", publicAccess /*privateAccess*/);
      AddComponents(componentsApp, false);

      for(module = componentsApp.allModules.first; module; module = module.next)
      {
         if(module.name && (!strcmp(module.name, filePath)))
            break;
      }
      if(!module) module = componentsApp;
      mainForm.browser.SelectRow(mainForm.browser.FindSubRow((int)module));

      SetSymbolsDir(null);
   }

   ListBox browser
   {
      this, anchor = { left = 0, top = 0, bottom = 0 }, borderStyle = 0, background = aliceBlue;
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
                     char hex[10];
                     sprintf(hex, "%08x", row.tag);
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
      this, anchor = { top = 0, bottom = 0, right = 0 };
      hotKey = escape;
   };
   PaneSplitter slider
   {
      this, leftPane = browser, rightPane = view, split = 300 /*scaleSplit = 0.3 */
   };

   bool OnClose(bool parentClosing)
   {
      if(view.edit)
         view.OnLeftButtonDown(0,0,0);
      return true;
   }

   bool OnPostCreate()
   {
      mainForm.OpenModule((((GuiApplication)__thisModule).argc > 1) ? ((GuiApplication)__thisModule).argv[1] : "ecere");
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
      char archiveFile[MAX_LOCATION];
      char fileName[MAX_FILENAME];
      char directory[MAX_LOCATION];
      char * location;
      Archive archive;
      SplitArchivePath(editString, archiveFile, &location);
      GetLastDirectory(location, fileName);
      StripLastDirectory(location, directory);
      archive = ArchiveOpen(archiveFile, { true } );
      if(archive)
      {
         TempFile f { };
         ArchiveDir dir = archive.OpenDirectory(directory, null, replace);
         Block block;
         bool empty = true;
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
         dir.AddFromFile(fileName, f, null, replace, 0, null, null);
         delete dir;
         delete archive;
         delete f;
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
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(edit)
      {
         // Update overLink
         HTMLView::OnMouseMove(x, y, mods);
         if(textBlock && overLink == textBlock.parent)
         {
            selPosition = curPosition = TextPosFromPoint(x, y, &textBlock);
            PositionCaret(true);            
         }
         else
         {
            SaveEdit();
            HTMLView::OnLeftButtonDown(x, y, mods);
         }
         return true;
      }
      return HTMLView::OnLeftButtonDown(x, y, mods);
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(!edit || !textBlock || clickedLink != textBlock.parent)
      {
         HTMLView::OnLeftButtonUp(x, y, mods);
         if(edit)
         {
            selPosition = curPosition = TextPosFromPoint(x, y, &textBlock);
            PositionCaret(true);
         }
      }
      return true;
   }

   // Returns true if it needs scrolling
   /*
   bool FindMouse(int px, int py, int * tx, int * ty, EditLine * tline, bool half)
   {
      int w;
      int c;
      int x, y;
      EditLine line;
      bool needHScroll = false;

      if(py < 0)
      {
         if(this.viewY > 0)
         {
            y = this.viewY-1;
            line = this.viewLine ? (void *)this.viewLine.prev : null;
         }
         else
         {
            y = 0;
            line = (void *)this.lines.first;
         }
      }
      else
      {
         py = Min(py, clientSize.h);
         py /= this.space.h;
         py = Min(py, this.lineCount);
         y = this.viewY;
         for(c = 0, line = this.viewLine; (line != (void *)this.lines.last && c<py); line = line.next, c++)
         {
            y++;
         }
      }

      if( (px >= clientSize.w || px < clientSize.w/2) && this.viewX)
         needHScroll = true;
      px = Max(px,0);
      px = Min(px,clientSize.w+this.space.w);

      if(tx && line)
      {
         *tx = AdjustXPosition(line, px + viewX, half, null, MAXINT, 0);
      }

      if(tline) *tline = line;
      if(ty) *ty = y;

      // Prevent divide by 0 from non valid this.font
      if(!this.space.h)
         return (y < this.viewY) || needHScroll;
      else
         return (y < this.viewY || y >= this.viewY + clientSize.h / this.space.h) || needHScroll;
      return false;
   }
*/
/*
   bool OnLeftButtonDown(int mx, int my, Modifiers mods)
   {
      int x,y;
      EditLine line;

      if(style.noSelect) return true;

      if(!mods.isActivate)
      {
         Capture();
         mouseSelect = true;
      }

      mouseX = mx - XOFFSET;
      mouseY = my;

      FindMouse(mouseX, mouseY, &x, &y, &line, true);

      if(!style.readOnly)
      {
         if(wordSelect)
            mouseMove = false;
         else if(IsMouseOnSelection() && !mods.isActivate)
         {
            DirtyLine(this.y);
            mouseMove = true;
            dropX = x;
            dropY = y;
            dropLine = line;
         }
      }

      if(!mouseMove && !wordSelect && (!mods.isActivate || style.multiLine))
      {
         if(mods.shift && !mods.isActivate)
         {
            this.x = x;
            this.y = y;
            this.line = line;
            DirtyAll();
         }
         else
         {
            SelDirty();
            DirtyLine(this.y);
            this.x = x;
            this.y = y;
            this.line = line;
            DirtyLine(this.y);
            this.selLine = this.line;
            this.selX = this.x;
            this.selY = this.y;
            //Deselect();
         }
         ComputeColumn();
      }
      
      UpdateDirty();
      UpdateCaretPosition(true);
      return true;
   }
*/
/*
   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      timer.Stop();

      mouseSelect = false;
      wordSelect = false;
      
      x -= XOFFSET;
      
      ReleaseCapture();
      if(!style.readOnly)
      {
         if(mouseMove)
         {
            EditLine line;
            FindMouse(mouseX, mouseY, &x, &y, &line, true);
    
            dropX = x;
            dropY = y;
            dropLine = line;

            mouseMove = IsMouseOnSelection();

            if(!mouseMove)
            {
               int size = SelSize();
               if(size)
               {
                  char * text = new char[size+1];
                  if(text)
                  {
                     int moveX = 0;
                     GetSel(text, false);

                     if(Max(selY, this.y) == dropY)
                     {
                        if(this.x > selX)
                        {
                           if(this.dropX > this.selX)
                              moveX = this.x - this.selX;
                        }
                        else
                        {
                           if(this.dropX > this.x)
                              moveX = this.selX - this.x;
                        }
                     }
                     DelSel(null);
                     this.dropX -= moveX;
                     this.selX = this.x = this.dropX;
                     this.selY = this.y = this.dropY;
                     this.selLine = this.line = this.dropLine;
                     AddS(text);
                     SetViewToCursor(true);
                     delete text;
                     Modified();
                  }
               }
            }
            else
            {
               SelDirty();
               DirtyLine(this.y);
               this.x = x;
               this.y = y;
               this.line = line;
               ComputeColumn();
               DirtyLine(this.y);
               Deselect();
               UpdateDirty();
            }
         }
         else
         {
            EditLine line;
            mouseX = x;
            mouseY = y;

            FindMouse(mouseX, mouseY, &x, &y, &line, true);

            NotifyDropped(master, this, x, y);
         }
      }
      mouseMove = false;
      return true;
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      int x,y;
      EditLine line;
      bool needScroll;
      
      if(mods != -1 && mods.isSideEffect) 
      { 
         SetSelectCursor(); 
         return true; 
      }
      if(style.noSelect) return true;
      if(wordSelect) return true;
      mouseX = mx - XOFFSET;
      mouseY = my;

      needScroll = FindMouse(this.mouseX, this.mouseY, &x, &y, &line, true);

      if(this.mouseMove || this.mouseSelect)
      {
         if(!needScroll)
            timer.Stop();
         else 
         {
            if(needScroll)
               timer.Start();
            if(mods != -1 && 
               ((style.hScroll) || (style.vScroll)))
               return true;
         }
      }

      if(this.mouseMove)
      {
         DirtyLine(this.dropY);
         this.dropX = x;
         this.dropY = y;
         DirtyLine(this.dropY);
         this.dropLine = line;
         SetViewToCursor(true);
      }
      else if(this.mouseSelect)
      {
         DirtyLine(this.selY);
         DirtyLine(this.y);
         this.x = x;
         this.y = y;
         ComputeColumn();
         DirtyLine(this.y);
         this.line = line;
         SetViewToCursor(true);
         UpdateDirty();
      }
      SetSelectCursor();
      return true;
   }

   bool OnLeftDoubleClick(int mx, int my, Modifiers mods)
   {
      int x,y;
      EditLine line;
      
      mx -= XOFFSET;

      if(style.noSelect) return true;
      FindMouse(mx, my, &x, &y, &line, false);
      if(!NotifyDoubleClick(master, this, line, mods))
         return false;
      if(x < line.count)
      {
         int c;
         int start = -1;
         int numBytes;
         for(c = x; c >= 0; c--)
         {
            unichar ch;
            while(c > 0 && !UTF8_IS_FIRST(line.buffer[c])) c--;
            ch = UTF8_GET_CHAR(line.buffer + c, numBytes);
            if(!IS_ALUNDER(ch))
               break;
            start = c;
         }
         if(start != -1)
         {
            for(c = start; c<line.count; c += numBytes)
            {
               unichar ch = UTF8_GET_CHAR(line.buffer + c, numBytes);
               if(!IS_ALUNDER(ch))
                  break;
            }
            SelDirty();
            DirtyLine(this.y);
            this.y = y;
            DirtyLine(this.y);
            this.selX = start;
            this.x = c;
            ComputeColumn();
            this.line = this.selLine = line;
            this.wordSelect = (c != start);
            UpdateDirty();
         }
      }
      return true;
   }
*/
   bool OnOpen(char * href)
   {
      if(!strncmp(href, "api://", 6))
      {
         int tag = strtoul(href + 6, null, 16);
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
               int tw = 0, th = 0;
               display.FontExtent(block.font.font, " ", 1, null, &th);
               if(!block.prev)
               {
                  block.parent.subBlocks.Insert(null, newBlock);
                  block = newBlock;
               }
               else
               {
                  block.parent.subBlocks.Insert(block, newBlock);
                  startY += th;
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
         // dialog.Create();
         edit = true;
         PositionCaret(true);
      }
      return true;
   }

   Block textBlock;
   char * text;
   int curPosition, selPosition;

   bool OnKeyDown(Key key, unichar ch)
   {
      if(edit)
      {
         switch(key)
         {
            case escape:
               OnLeftButtonDown(0,0,0);
               return false;
            case end:
               selPosition = curPosition = textBlock.textLen;
               PositionCaret(true);
               Update(null);
               break;
            case home:
               selPosition = curPosition = 0;
               PositionCaret(true);
               Update(null);
               break;
            case ctrlHome:
               selPosition = curPosition = 0;
               while(textBlock.prev)
                  textBlock = textBlock.prev.prev;
               PositionCaret(true);
               Update(null);
               return false;
            case ctrlEnd:
               while(textBlock.next && textBlock.next.next)
                  textBlock = textBlock.next.next;
               selPosition = curPosition = textBlock.textLen;
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
            case up:
            {
               if(caretY == textBlock.startY)
               {
                  if(textBlock.prev)
                  {
                     textBlock = textBlock.prev.prev;
                     selPosition = curPosition = Min(curPosition, textBlock.textLen);
                     PositionCaret(false);
                     caretY = MAXINT;
                  }
                  else
                     return false;
               }

               {
                  int tw = 0, th = 0;
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
                           selPosition = curPosition;
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
                           selPosition = curPosition = c + 1;
                        }
                        else
                           selPosition = curPosition = textBlock.textLen;
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
            case down:
            {
               int tw = 0, th = 0;
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
                        selPosition = curPosition;
                        PositionCaret(false);
                        return false;
                     }
                  }
                  if(sy > caretY)
                  {
                     selPosition = curPosition = textBlock.textLen;
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
                  PositionCaret(false);
               }*/
               break;
            }
            #define IS_ALUNDER(ch) ((ch) == '_' || isalnum((ch)))
            case ctrlRight:
            {
               // SELECTION CTRL-RIGHT
               /*
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
                     if(IS_ALUNDER(line.text[c]))
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastLine = line;
                     }
                     else if(foundAlpha)
                     {
                        found = true;
                        break;
                     }
                  }
                  if(!found && (c != curPosition || line != textBlock))
                  {
                     found = true;
                     lastLine = line;
                     lastC = line.textLen-1;
                     break;
                  }
               }  
               if(found)
               {
                  selPosition = curPosition = lastC+1;
                  textBlock = lastLine;
                  PositionCaret(true);
               }
               */
               
               bool foundAlpha = false;
               bool found = false;
               Block line;

               for(line = textBlock; (line && !found); line = line.next ? line.next.next : null)
               {
                  int start = (line == textBlock) ? curPosition : 0;
                  int c;
                  for(c = start; c < line.textLen; c++)
                  {
                     if(!IS_ALUNDER(line.text[c]))
                        foundAlpha = true;
                     else if(foundAlpha)
                     {
                        found = true;
                        selPosition = curPosition = c;
                        textBlock = line;
                        PositionCaret(true);
                        break;
                     }
                  }
                  // No next word found, 
                  if(!found && (c != curPosition || line != textBlock))
                  {
                     found = true;
                     selPosition = curPosition = line.textLen;
                     textBlock = line;
                     PositionCaret(true);
                  }
                  foundAlpha = true;
               }
               break;
            }
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
                     if(IS_ALUNDER(line.text[c]))
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
                  selPosition = curPosition = lastC;
                  PositionCaret(true);
               }
               break;
            }
            case right:
               if(curPosition < textBlock.textLen)
               {
                  curPosition += UTF8_NUM_BYTES(textBlock.text[curPosition]);
                  PositionCaret(true);
                  selPosition = curPosition;
               }
               else if(textBlock.next && textBlock.next.next)
               {
                  textBlock = textBlock.next.next;
                  selPosition = curPosition = 0;
                  PositionCaret(true);
               }
               break;
            case left:
               if(curPosition > 0)
               {
                  while(curPosition > 0 && !UTF8_IS_FIRST(textBlock.text[--curPosition]));
                  PositionCaret(true);
                  selPosition = curPosition;
               }
               else if(textBlock.prev)
               {
                  textBlock = textBlock.prev.prev;
                  selPosition = curPosition = textBlock.textLen;
                  PositionCaret(true);
               }
               break;
            case backSpace:
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
               else if(textBlock.prev)
               {
                  Block prev = textBlock.prev, prevBlock = textBlock.prev.prev;
                  prevBlock.text = renew prevBlock.text char[prevBlock.textLen + textBlock.textLen + 1];
                  memcpy(prevBlock.text + prevBlock.textLen, textBlock.text, textBlock.textLen + 1);

                  selPosition = curPosition = prevBlock.textLen;
                  prevBlock.textLen += textBlock.textLen;
                  textBlock.parent.subBlocks.Remove(prev);
                  delete prev;
                  textBlock.parent.subBlocks.Remove(textBlock);                  
                  delete textBlock;
                  textBlock = prevBlock;
                  
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
               break;
            case del:
               if(textBlock.textLen > curPosition)
               {
                  int nb = UTF8_NUM_BYTES(textBlock.text[curPosition]);
                  memmove(textBlock.text + curPosition, textBlock.text + curPosition + nb, textBlock.textLen - curPosition + 1 - nb + 1);
                  textBlock.textLen -= nb;
                  textBlock.text = renew textBlock.text char[textBlock.textLen + 1];
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
               else if(textBlock.next && textBlock.next.next)
               {
                  Block next = textBlock.next, nextBlock = textBlock.next.next;
                  textBlock.text = renew textBlock.text char[textBlock.textLen + nextBlock.textLen + 1];
                  memcpy(textBlock.text + textBlock.textLen, nextBlock.text, nextBlock.textLen + 1);

                  textBlock.textLen += nextBlock.textLen;
                  textBlock.parent.subBlocks.Remove(next);
                  delete next;
                  textBlock.parent.subBlocks.Remove(nextBlock);                  
                  delete nextBlock;
                  
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
               break;
            case enter:
            {
               Block block { type = BR, parent = textBlock.parent, font = textBlock.font };
               Block newBlock { type = TEXT, parent = textBlock.parent, font = textBlock.font };
               int startY = textBlock.startY, startX = textBlock.startX;
               int tw = 0, th = 0;

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
               {
                  //Clear(html.block);
                  //CreateForms(html.block);
                  ComputeMinSizes();
                  ComputeSizes();
                  //PositionForms();
               }
               textBlock = newBlock;
               PositionCaret(true);
               Update(null);
               break;
            }
            case shiftInsert:
            case ctrlV:
            {
               ClipBoard clipBoard { };
               if(clipBoard.Load())
               {  
                  int c;
                  char * text = clipBoard.memory;
                  char ch;
                  int start = 0;
                  Block parent = textBlock.parent;
                  FontEntry font = textBlock.font;
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
                        if(!ch) break;
                        {
                           Block block { type = BR, parent = parent, font = font };
                           Block newBlock { type = TEXT, parent = parent, font = font };
                           int startY = textBlock.startY, startX = textBlock.startX;
                           int tw = 0, th = 0;

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
               break;
            }
            default:
            {
               // eC BUG HERE: (Should be fixed)
               if(key.ctrl && !key.alt && ch >= 32 && ch != 128 /*&& ch < 128*/)
               {
                  char string[5];
                  int len = UTF32toUTF8Len(&ch, 1, string, 5);
                  int c;

                  textBlock.text = renew textBlock.text char[textBlock.textLen + len + 1];
                  memmove(textBlock.text + curPosition + len, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                  
                  for(c = 0; c<len; c++)
                  {
                     textBlock.text[curPosition] = string[c];
                     textBlock.textLen++;
                     curPosition++;
                  }
                  selPosition = curPosition;
                  
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

         while(textPos < textBlock.textLen)
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
            }
            if(curPosition < textPos || textPos == textBlock.textLen)
            {
               int len = curPosition - startPos;
               display.FontExtent(textBlock.font.font, text + startPos, len, &tw, null);
               sx += tw;
               break;            
            }
            sy += th;
            sx = textBlock.startX;
         }
         if(setCaretX)
            caretX = sx;
         caretY = sy;
         SetCaret(sx, sy, th);
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
   int TextPosFromPoint(int px, int py, Block * block)
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
         
         display.FontExtent(textBlock.font.font, " ", 1, &space, &th);
         //space = space/2+2;
         space = 2;

         while(textPos < textBlock.textLen)
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

               sx = x + textBlock.startX;
               if(/*py >= sy && */py < sy + th && /*px >= sx-space && */px < sx + w-space)
               {
                  int c, numBytes;
                  char ch;
                  *block = textBlock;
                  for(c = textPos; (ch = text[c]); c += numBytes)
                  {
                     numBytes = UTF8_NUM_BYTES(ch);
                     display.FontExtent(textBlock.font.font, text + c, numBytes, &w, &th);
                     if(/*py >= sy && */py < sy + th && /*px >= sx-w/2-space && */px < sx + w -w/2-space)
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
      Platform os = GetRuntimePlatform();
      componentsApp = __ecere_COM_Initialize(false, 1, null);
      SetPrivateModule(componentsApp);
      SetGlobalContext(globalContext);
      SetExcludedSymbols(&excludedSymbols);
      SetDefines(&::defines);
      SetImports(&imports);
      
      SetGlobalData(globalData);

      settingsContainer.dataOwner = &settings;
      settingsContainer.Load();
      if(!settings.docDir || !settings.docDir[0] )
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
               settings.docDir = programFilesDir;
            }
            else if(homeDrive && homeDrive[0])
            {
               PathCat(homeDrive, "ECERE SDK\\doc");
               settings.docDir = homeDrive;
            }
            else if(winDir && winDir[0])
            {
               PathCat(winDir, "..\\ECERE SDK\\doc");
               settings.docDir = winDir;
            }
            else
               settings.docDir = "C:\\ECERE SDK\\doc";
         }
         else // if Os is Linux, or Mac OSX or something else
            settings.docDir = "/usr/share/ecere/doc/";
         settingsContainer.Save();
      }

      //if(argc > 1)
      {
      #if 0
         Module module = eModule_Load(componentsApp, "ecere" /*argv[1]*/, privateAccess);
         DataRow row;
         AddComponents(module, true);
         mainForm.browser.currentRow = row = mainForm.browser.FindSubRow((int)module);
         // mainForm.browser.currentRow = row = mainForm.browser.FindSubRow((int)eSystem_FindClass(componentsApp, "Window"));
         while((row = row.parent))
            row.collapsed = false;
      #endif
      }
      return true;
   }

   void Terminate()
   {
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

MainForm mainForm { };
