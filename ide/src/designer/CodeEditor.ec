import "ide"

import "findCtx"
import "findExp"
import "findParams"

import "SyntaxHighlighting"

// UNTIL IMPLEMENTED IN GRAMMAR
#define ACCESS_CLASSDATA(_class, baseClass) \
   (_class ? ((void *)(((char *)_class.data) + baseClass.offsetClass)) : null)

#ifdef ECERE_STATIC
extern int __attribute__((__stdcall__)) __ecereDll_Load_ecere(struct __ecereNameSpace__ecere__com__Instance * module);
extern int __attribute__((__stdcall__)) __ecereDll_Unload_ecere(struct __ecereNameSpace__ecere__com__Instance * module);
#endif

static Array<FileFilter> fileFilters
{ [
   { $"C/C++/eC Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx)", "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx" },
   { $"C/C++/eC Source Files (*.ec, *.c, *.cpp, *.cc, *.cxx)", "ec, eh, c, cpp, cc, cxx" },
   { $"Header Files for eC/C/C++ (*.eh, *.h, *.hpp, *.hh, *.hxx)", "eh, h, hpp, hh, hxx" },
   { $"Objective-C Source Files (*.m, *.mm)", "m, mm" },
   { $"GLSL Source Files (*.glsl, *.vert, *.frag)", "glsl, vert, frag" },
   { $"Python Source Files (*.py)", "py" },
   { $"Java Source Files (*.java)", "java" },
   { $"C# Source Files (*.cs)", "cs" },
   { $"Rust Source Files (*.rs)", "rs" },
   { $"Go Source Files (*.go)", "go" },
   { $"Ruby Source Files (*.rb)", "rb" },
   { $"JavaScript Source Files (*.js)", "js" },
   { $"PHP Source Files (*.php)", "php" },
   { $"Bison & Flex Source Files (*.y, *.l)", "y, l" },
   { $"Source Files (*.ec, *.eh, *.c, *.cpp, *.cc, *.cxx, *.h, *.hpp, *.hh, *.hxx, *.m, *.mm, *.frag, *.glsl, *.vert, *.py, *.java, *.cs, *.go, *.rs, *.swift, *.js, *.php, *.y, *.l)",
      "ec, eh, c, cpp, cc, cxx, h, hpp, hh, hxx, py, java, cs, js, go, rs, swift, php, m, mm, frag, glsl, vert, y, l" },
   { $"Swift Source Files (*.swift)", "swift" },
   { $"Text files (*.txt, *.text, *.nfo, *.info)", "txt, text, nfo, info" },
   { $"Web files (*.html, *.htm, *.xhtml, *.css, *.php, *.js, *.jsi, *.rb, *.xml)", "html, htm, xhtml, css, php, js, jsi, rb, xml" },
   { $"All files", null }
] };

static Array<FileType> fileTypes
{ [
   { $"eC Source Code", "ec", whenNoneGiven },
   { $"Text Files", "txt", never }
] };

static const char * iconNames[] =
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

enum SheetType { methods, properties };

extern int __ecereVMethodID_class_OnEdit;
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnSaveEdit;
extern int __ecereVMethodID___ecereNameSpace__ecere__com__Module_OnLoad;

class RTCMenuBits
{
public:
   bool ignoreBreakpoints:1;
   bool atSameLevel:1;
   bool oldImplementation:1;
};

class EditFileDialog : FileDialog
{
   bool OnCreate()
   {
      if(!ide.projectView && ideSettings.ideFileDialogLocation)
         currentDirectory = ideSettings.ideFileDialogLocation;
      return FileDialog::OnCreate();
   }
}

EditFileDialog codeEditorFileDialog
{
   type = multiOpen, text = $"Open",
   types = fileTypes.array, sizeTypes = fileTypes.count * sizeof(FileType);
   filters = fileFilters.array, sizeFilters = fileFilters.count * sizeof(FileFilter)
};

EditFileDialog codeEditorFormFileDialog
{
   type = open, text = $"Open Project",
   types = fileTypes.array, sizeTypes = fileTypes.count * sizeof(FileType),
   filters = fileFilters.array, sizeFilters = fileFilters.count * sizeof(FileFilter)
};

define OpenBracket = '{';
define CloseBracket = '}';

enum MethodAction
{
   actionAddMethod = 1,
   actionDeleteMethod = 2,
   actionDetachMethod = 3,
   actionAttachMethod = 4,
   actionReattachMethod = 5
};

//extern StatusField pos, ovr, caps, num;
//extern Class thisClass;

File output;

File fileInput;

int returnCode;

Class insideClass;
Expression ctxInsideExp;
Expression paramsInsideExp;
ClassFunction insideFunction;
ClassDef insideDef;
Type instanceType;
const char * instanceName;
Type functionType;
int paramsID;
bool insideInstance;

/****************************************************************************
                              GENERATING
****************************************************************************/

static void OutputString(File f, const char * string)
{
   int c;
   for(c = 0; string[c]; c++)
   {
      if(string[c] == '\"')
         f.Puts("\\\"");
      else if(string[c] == '\\')
         f.Puts("\\\\");
      else if(string[c] == '\n')
      {
         f.Puts("\\n");
         if(c > 30)
            f.Puts("\"\n   \"");
      }
      else
         f.Putc(string[c]);
   }
}

// Consider merging with PrintType ?
void OutputType(File f, Type type, bool outputName)
{
   if(type)
   {
      if(type.kind != pointerType && type.constant)
         f.Printf("const ");
      switch(type.kind)
      {
         case voidType:
            f.Printf("void");
            break;
         case charType:
            if(!type.isSigned) f.Printf("unsigned ");
            f.Printf("char");
            break;
         case shortType:
            if(!type.isSigned) f.Printf("unsigned ");
            f.Printf("short");
            break;
         case intType:
            if(!type.isSigned) f.Printf("unsigned ");
            f.Printf("int");
            break;
         case int64Type:
            if(!type.isSigned) f.Printf("unsigned ");
            f.Printf("__int64");
            break;
         case longType:
            if(!type.isSigned) f.Printf("unsigned ");
            f.Printf("long");
            break;
         case floatType:
            f.Printf("float");
            break;
         case doubleType:
            f.Printf("double");
            break;
         case classType:
         {
            if(type._class && !strcmp(type._class.string, "class"))
            {
               switch(type.classObjectType)
               {
                  case anyObject:
                     f.Printf("any_object");
                     break;
                  default:
                     f.Printf("typed_object");
                     break;
               }
               if(type.byReference)
                  f.Printf(" &");
            }
            else
               // ADD CODE TO DECIDE WHETHER TO OUTPUT FULLY QUAlIFIED OR NOT:
               f.Printf(type._class.shortName ? type._class.shortName : type._class.string);
            break;
         }
         case structType:
            break;
         case unionType:
            break;
         case functionType:
            break;
         case arrayType:
            OutputType(f, type.type, false);
            break;
         case pointerType:
            OutputType(f, type.type, false);
            f.Printf(" *");
            if(type.constant)
               f.Printf(" const");
            break;
         case ellipsisType:
            f.Printf("...");
            break;
         case enumType:
            break;
         case methodType:
            break;
      }
      if(outputName)
      {
         if(type.name)
         {
            f.Printf(" ");
            f.Printf(type.name);
         }
      }
      if(type.kind == arrayType)
      {
         f.Printf("[");
         f.Printf("%d", type.arraySize);
         f.Printf("]");
      }
   }
}

void DeleteJunkBefore(EditBoxStream f, int pos, int * position)
{
   char ch;
   int before = 0;

   if(position)
      f.Seek(pos - *position, current);

   // Try to delete spaces and \n before...
   f.Seek(-1, current);
   for(;f.Getc(&ch);)
   {
      if(!isspace(ch))
         break;
      /*else if(ch == '\n')
      {
         // Look for // comments on the line before
         EditBox editBox = f.editBox;
         EditLine line = editBox.line;
         char * text;
         char last = 0;
         int c;
         bool quoted = false;
         line = line.prev;
         text = line.text;
         for(c = 0; text[c]; c++)
         {
            if(text[c] == '"')
            {
               quoted ^= true;
               last = 0;
            }
            else if(!quoted)
            {
               if(text[c] == '/' && last == '/')
                  break;
               last = text[c];
            }
         }
         if(text[c])
            break;
      }*/
      before++;
      f.Seek(-2, current);
   }

   f.DeleteBytes(before);
   if(position)
      *position = pos;
}

void GetLocText(EditBox editBox, File f, int position, Location loc, char ** text, int * size, int pad, int linePad)
{
   EditLine l1, l2;
   int y1,x1, y2,x2;

   editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

   // Cut & Paste function

   {
      EditLine l1, l2;
      int y1,x1,y2,x2;

      f.Seek(loc.start.pos - position, current);
      l1 = editBox.line;
      x1 = editBox.charPos;
      y1 = editBox.lineNumber;
      f.Seek(loc.end.pos - loc.start.pos, current);
      l2 = editBox.line;
      x2 = editBox.charPos;
      y2 = editBox.lineNumber;
      editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

      *size = editBox.SelSize();
      *text = new char[*size+1 + (y2-y1+1) * linePad + pad]; // Add pad for tabs and new name
      editBox.GetSel(*text, false);
   }

   editBox.SetSelPos(l1, y1, x1, l2, y2, x2);
   f.Printf(""); // Make the stream point to where the editbox is
}

static int64 GetI64EnumValue(Class dataType, DataValue dataForm)
{
   int64 i64Value = 0;
   switch(dataType.typeSize)
   {
      case 1:
         if(!strcmp(dataType.dataTypeString, "byte"))
            i64Value = dataForm.uc;
         else
            i64Value = dataForm.c;
         break;
      case 2:
         if(!strcmp(dataType.dataTypeString, "uint16"))
            i64Value = dataForm.us;
         else
            i64Value = dataForm.s;
         break;
      case 4:
         if(!strcmp(dataType.dataTypeString, "uint"))
            i64Value = dataForm.ui;
         else
            i64Value = dataForm.i;
         break;
      case 8:
         if(!strcmp(dataType.dataTypeString, "uint64"))
            i64Value = *(int64 *)&dataForm.ui64;
         else
            i64Value = dataForm.i64;
         break;
   }
   return i64Value;
}

void Code_FixProperty(Property prop, Instance object)
{
   Designer::FixProperty(prop, object);
}

bool Code_IsPropertyModified(Instance test, ObjectInfo selected, Property prop)
{
   bool result = false;
   if(prop.dataTypeString && (!prop.IsSet || prop.IsSet(selected.instance)))
   {
      Class dataType = prop.dataTypeClass;

      if(!dataType)
         dataType = prop.dataTypeClass = eSystem_FindClass(test._class.module, prop.dataTypeString);

      if(dataType && dataType._vTbl && dataType.type == structClass)
      {
         void * dataForm = new0 byte[dataType.structSize];
         void * dataTest = new0 byte[dataType.structSize];

         ((void (*)(void *, void *))(void *)prop.Get)(selected.instance, dataForm);
         ((void (*)(void *, void *))(void *)prop.Get)(test, dataTest);

         if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
         {
            ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);
            result = true;
         }
         delete dataForm;
         delete dataTest;
      }
      else if(dataType && dataType._vTbl && (dataType.type == normalClass || dataType.type == noHeadClass))
      {
         void * dataForm, * dataTest;
         bool isEditBoxContents = false;
         bool freeDataForm = false, freeDataTest = false;

         // Because contents property is broken for mutiline EditBox at the moment
         if(!strcmp(prop.name, "contents") && !strcmp(prop._class.name, "EditBox"))
            isEditBoxContents = true;

         if(isEditBoxContents && ((EditBox)selected.instance).multiLine)
         {
            dataForm = ((EditBox)selected.instance).multiLineContents;
            freeDataForm = true;
         }
         else
            dataForm = ((void *(*)(void *))(void *)prop.Get)(selected.instance);
         if(isEditBoxContents && ((EditBox)test).multiLine)
         {
            dataTest = ((EditBox)test).multiLineContents;
            freeDataTest = true;
         }
         else
            dataTest = ((void *(*)(void *))(void *)prop.Get)(test);

         if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
         {
            ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);
            result = true;
         }

         // Temporary work around until we standardize how properties should manage memory
         if(!strcmp(prop.name, "strings") && !strcmp(prop._class.name, "DirectoriesBox"))
            freeDataForm = freeDataTest = true;
         if(dataType.type == normalClass && dataType.structSize)
         {
            if(freeDataForm) eInstance_Delete(dataForm);
            if(freeDataTest) eInstance_Delete(dataTest);
         }
         else
         {
            if(freeDataForm) delete dataForm;
            if(freeDataTest) delete dataTest;
         }
      }
      else if(dataType && dataType._vTbl)
      {
         DataValue dataForm, dataTest;

         GetProperty(prop, selected.instance, &dataForm);
         GetProperty(prop, test, &dataTest);

         if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, &dataForm, &dataTest))
         {
            SetProperty(prop, test, dataForm);

            // In case setting on test unset on real instance (e.g. isDefault)
            if(strcmp(prop.name, "name"))
            {
               GetProperty(prop, selected.instance, &dataTest);
               if(((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, &dataForm, &dataTest))
                  SetProperty(prop, selected.instance, dataForm);
            }
            result = true;
         }
      }
   }
   return result;
}

bool Code_IsPropertyDisabled(ObjectInfo selected, const char * name)
{
   bool disabled = false;
   if(selected.oClass == selected)
   {
      ClassDef def;
      if(selected.classDefinition)
      {
         for(def = selected.classDefinition.definitions->first; def; def = def.next)
         {
            if(def.type == defaultPropertiesClassDef)
            {
               MemberInit prop;
               for(prop = def.defProperties->first; prop; prop = prop.next)
               {
                  if(prop.identifiers && prop.identifiers->first)
                  {
                     Identifier id = prop.identifiers->first;
                     if(prop.variable && !strcmp(id.string, name))
                     {
                        disabled = true;
                        break;
                     }
                  }
               }
            }
            if(disabled) break;
         }
      }
   }
   else if(selected.instCode)
   {
      MembersInit members;
      if(selected.instCode.members)
      {
         for(members = selected.instCode.members->first; members; members = members.next)
         {
            if(members.type == dataMembersInit && members.dataMembers)
            {
               MemberInit prop;
               for(prop = members.dataMembers->first; prop; prop = prop.next)
               {
                  if(prop.identifiers && prop.identifiers->first)
                  {
                     Identifier id = prop.identifiers->first;
                     if(prop.variable && !strcmp(id.string, name))
                     {
                        disabled = true;
                        break;
                     }
                  }
               }
            }
            if(disabled) break;
         }
      }
   }
   return disabled;
}

static bool CheckCompatibleMethod(Method method, Type type, Class regClass, bool isForm, Symbol selectedClass)
{
   bool result = false;
   bool reset = false;
   if(!method.dataType)
      method.dataType = ProcessTypeString(method.dataTypeString, false);
   if(!method.dataType.thisClass && !isForm)
   {
      reset = true;
      method.dataType.thisClass = selectedClass;
   }
   //result = MatchTypes(method.dataType, type, null, regClass, regClass, false);
   result = MatchTypes(type, method.dataType, null, regClass, regClass, false, true, true, false, true);
   if(reset)
      method.dataType.thisClass = null;
   return result;
}

bool Code_IsFunctionEmpty(ClassFunction function, Method method, ObjectInfo object)
{
   bool confirmation = true;
   Statement body = function.body;
   // Check if it contains any code
   if((!body.compound.declarations || !body.compound.declarations->count) && (!body.compound.statements || body.compound.statements->count <= 1))
   {
      // Class moduleClass = eSystem_FindClass(object.instance._class.module, "Module");
      Statement stmt = body.compound.statements ? body.compound.statements->first : null;
      Type dataType = method.dataType;
      Type returnType = dataType.returnType;
      Expression exp = null;

      if(!method.dataType)
         method.dataType = ProcessTypeString(method.dataTypeString, false);

      confirmation = false;

      // Check if default function should be calling base class:
      if(object.instance._class._vTbl[method.vid] == null /*moduleClass._vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Module_OnLoad]*/) // Temp Check for DefaultFunction
      {
         if(returnType.kind != voidType)
         {
            if(!stmt || stmt.type != returnStmt || !stmt.expressions || stmt.expressions->count != 1)
               confirmation = true;
            else
            {
               exp = stmt.expressions->first;
               if(returnType.kind == classType && !strcmp(returnType._class.string, "bool"))
               {
                  if( (exp.type != identifierExp || strcmp(exp.identifier.string, "true")) &&
                      (exp.type != constantExp || strcmp(exp.constant, "1")))
                     confirmation = true;
               }
               else
               {
                  if(exp.type != constantExp || strcmp(exp.constant, "0"))
                     confirmation = true;
               }
            }
         }
         else
         {
            if(stmt)
               confirmation = true;
         }
      }
      else
      {
         if(stmt)
         {
            if(returnType.kind != voidType)
            {
               if(stmt.type == returnStmt && stmt.expressions && stmt.expressions->count == 1)
                  exp = stmt.expressions->first;
            }
            else if(stmt.type == expressionStmt && stmt.expressions && stmt.expressions->count == 1)
               exp = stmt.expressions->first;
         }

         if(!exp || exp.type != callExp || exp.call.exp.type != identifierExp)
            confirmation = true;
         else
         {
            Identifier id = exp.call.exp.identifier;
            Class base = object.instance._class;
            if(!id._class || (id._class.name && !strcmp(id._class.name, base.name)) || strcmp(id.string, method.name))
               confirmation = true;
            else
            {
               Expression arg = exp.call.arguments ? exp.call.arguments->first : null;
               if(!arg || arg.type != identifierExp || strcmp("this", arg.identifier.string))
                  confirmation = true;
               else
               {
                  Type param;
                  arg = arg.next;
                  for(param = dataType.params.first; param; param = param.next)
                  {
                     if(!arg || arg.type != identifierExp || strcmp(param.name, arg.identifier.string))
                     {
                        confirmation = true;
                        break;
                     }
                     arg = arg ?arg.next : null;
                  }
               }
            }
         }
      }
   }
   return !confirmation;
}

class CodeEditor : Window
{
   background = colorScheme.marginColor;
   borderStyle = sizableDeep;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   isDocument = true;
   isActiveClient = true;
   anchor = Anchor { left = 300, right = 150, top = 0, bottom = 0 };
   menu = Menu { };

   // eWindow_SetX(A_CASCADE); eWindow_SetY(A_CASCADE);
   // eWindow_SetWidth(A_RELATIVE|80); eWindow_SetHeight(A_RELATIVE|80);

   SheetType sheetSelected;
   ToolBox toolBox;
   Sheet sheet;

   OldList * ast;
   Context globalContext { };
   OldList excludedSymbols { offset = (uint)(uintptr)&((Symbol)0).left };

   OldList defines;
   OldList imports;

   OldList classes;
   bool codeModified;
   bool formModified;

   ObjectInfo selected;
   ObjectInfo oClass;

   // Methods Editing:
   MethodAction methodAction;
   Method method;
   ClassFunction function;
   bool moveAttached;
   char methodName[1024];

   bool updatingCode;
   bool loadingFile;
   bool fixCaret;
   bool membersListShown;
   bool membersAbove;
   Location membersLoc;
   EditLine membersLine;

   Type functionType, instanceType;
   int paramsID;
   bool paramsShown;
   bool paramsAbove;
   Point paramsPosition;
   Expression functionExp;
   bool expectingMove;

   BitmapResource icons[CodeObjectType];

   FontResource boldFont { $"Tahoma", 8.25f, bold = true, window = this };
   FontResource normalFont { $"Tahoma", 8.25f, window = this };

   Module privateModule;
   NameSpace globalData;
   bool skipModified;
   bool inUseDebug;
   OpenedFileInfo openedFileInfo;

   FontResource font { codeFont.faceName, codeFont.size, codeFont.bold, codeFont.italic };
   saveDialog = codeEditorFileDialog;

   Designer designer { codeEditor = this, visible = false, saveDialog = codeEditorFormFileDialog };

   bool noParsing;
   int maxLineNumberLength;

   property bool parsing
   {
      get
      {
         if(!noParsing && !ide.noParsing)
         {
            // Only try to parse C and eC as that is all we currently have a parser for:
            EditSyntaxHL hl = editBox.syntaxHighlighting;
            return hl && (hl._class == class(CSHL) || hl._class == class(eCSHL));
         }
         return false;
      }
   };

   void ProcessCaretMove(EditBox editBox, int line, int charPos)
   {
      char temp[512];
      ObjectInfo classItem;

      // OnActivateClient is called after OnActivate
      if(!updatingCode)
      {
         sprintf(temp, $"Ln %d, Col %d", line, editBox.column + 1);
         ide.pos.text = temp;
      }
      if(sheet.codeEditor != this) return;

      if(!updatingCode)
      {
         for(classItem = classes.first; classItem; classItem = classItem.next)
         {
            ClassDefinition classDef = classItem.classDefinition;
            if(classDef && classDef.loc.Inside(line, charPos))
               break;
         }

         if(classItem)
         {
            ObjectInfo object;
            for(object = classItem.instances.first; object; object = object.next)
            {
               if(object.instCode)
               {
                  if(object.instCode.loc.Inside(line, charPos))
                     break;
               }
            }
            if(object)
               sheet.SelectObject(object);
            else
               sheet.SelectObject(classItem);
            Update(null);
         }
         //else
         {
            //sheet.SelectObject(null);
            //Update(null);
         }

         sprintf(temp, $"Ln %d, Col %d", line, editBox.column + 1);
         ide.pos.text = temp;

         if(expectingMove)
            expectingMove = false;
         else
         {
            if(membersListShown)
            {
               bool hide = false;
               if(line-1 != membersLoc.start.line)
                  hide = true;
               else
               {
                  int c;

                  if(charPos - 1 < membersLoc.start.charPos)
                     hide = true;
                  else if(charPos - 1 > membersLoc.end.charPos)
                  {
                     const char * buffer = membersLine.text;
                     //if(membersList.currentRow)
                     //   hide = true;
                     //else
                     {
                        for(c = membersLoc.start.charPos; c<=charPos && buffer[c]; c++)
                           if(buffer[c] != ' ' && buffer[c] != '\t')
                              break;
                        if(c < charPos && buffer[c])
                           hide = true;
                     }
                  }
               }
               if(hide)
               {
                  membersList.Destroy(0);
                  membersListShown = false;
               }
            }
            {
               bool back = codeModified;
               codeModified = false;
               if(paramsShown)
                  InvokeParameters(false, false, false);
               /*if(membersListShown)
                  InvokeAutoComplete(false, 0, true);*/
               codeModified = back;
            }
         }
      }
   }

   watch(modifiedDocument)
   {
      ProjectView projectView = ide.projectView;
      if(projectView)
      {
         char buffer[MAX_LOCATION];
         char * fullPath = GetSlashPathBuffer(buffer, fileName);
         Array<ProjectNode> nodes = ide.workspace.GetAllProjectNodes(fullPath, false);
         if(nodes)
         {
            for(node : nodes)
               node.modified = modifiedDocument;
            projectView.Update(null);
         }
         delete nodes;
      }
   };


   EditBox editBox
   {
      textVertScroll = true, multiLine = true, /*lineNumbers = ideSettings.showLineNumbers,*/
      freeCaret = ideSettings.useFreeCaret, caretFollowsScrolling = ideSettings.caretFollowsScrolling,
      tabKey = true, smartHome = true;
      tabSelection = true, /*maxLineSize = 65536, */parent = this, hasHorzScroll = true, hasVertScroll = true;
      selectionColor = colorScheme.selectionColor, selectionText = colorScheme.selectionText,
      background = colorScheme.codeEditorBG, foreground = colorScheme.codeEditorFG,
      font = font, borderStyle = none;
      anchor = Anchor { left = 0, right = 0, top = 0, bottom = 0 };

      bool OnMouseOver(int x, int y, Modifiers mods)
      {
         CodeEditor editor = (CodeEditor)master;
         if(editor.designer && editor.designer.isDragging && !mods.isSideEffect)
            Activate();
         return true;
      }

      void NotifyCaretMove(EditBox editBox, int line, int charPos)
      {
         // Update Line Numbers
         int spaceH;
         int oldLine = lastLine;
         display.FontExtent(font.font, " ", 1, null, &spaceH);
         {
            Box box { 0, (oldLine-1) * spaceH - editBox.scroll.y, editBox.anchor.left.distance, oldLine*spaceH-1 - editBox.scroll.y };
            Update(box);
         }
         {
            Box box { 0, (line-1) * spaceH - editBox.scroll.y, editBox.anchor.left.distance, line*spaceH-1 - editBox.scroll.y };
            Update(box);
         }
         lastLine = line;

         if(ide.activeClient == this)
            ProcessCaretMove(editBox, line, charPos);
         if(openedFileInfo)
            openedFileInfo.CaretMove(line, charPos);
      }

      void NotifyOvrToggle(EditBox editBox, bool overwrite)
      {
         ide.UpdateStateLight(ide.ovr, overwrite);
      }

      void NotifyUpdate(EditBox editBox)
      {
         if(designer)
         {
            if(!skipModified)
            {
               codeModified = true;
               designer.modifiedDocument = true;
            }
         }
         modifiedDocument = true;
      }

      bool NotifyUnsetModified(EditBox editBox)
      {
         modifiedDocument = false;
         return true;
      }

      bool NotifyCharsAdded(EditBox editBox, BufferLocation before, BufferLocation after, bool pasteOperation)
      {
         if(!loadingFile && after.y != before.y)
         {
            ProjectView projectView = ide.projectView;
            if(projectView && fileName)
            {
               int c;
               // HOW WE MIGHT WANT TO DO IT:
               const char * text = before.line.text;
               for(c = Min(before.line.count, before.x-1); c>= 0; c--)
                  if(!isspace(text[c]))
                     break;
               ide.debugger.MoveIcons(fileName, before.y + (((!pasteOperation && c > -1) || !after.line.count) ? 1 : 0), after.y - before.y, false);

               // HOW VISUAL STUDIO DOES IT:
               /*
               char * text = after.line.text;
               for(c = after.line.count-1; c>= 0; c--)
                  if(!isspace(text[c]))
                     break;
               ide.debugger.MoveIcons(fileName, before.y + ((c < 0) ? 1 : 0), after.y - before.y, false);
               */
            }
            Update({ 0, 0, editBox.position.x, clientSize.h });
            UpdateMarginSize();
         }

         if(!updatingCode)
         {
            ObjectInfo oClass;

            for(oClass = classes.first; oClass; oClass = oClass.next)
            {
               ObjectInfo object;
               for(object = oClass.instances.first; object; object = object.next)
               {
                  if(object.instCode)
                  {
                     object.instCode.loc.start.AdjustAdd(before, after);
                     object.instCode.loc.end.AdjustAdd(before, after);
                  }
               }
               if(oClass.instCode)
               {
                  oClass.classDefinition.loc.start.AdjustAdd(before, after);
                  oClass.classDefinition.loc.end.AdjustAdd(before, after);
               }
            }

            if(!pasteOperation)
            {
               expectingMove = true;
               if(membersListShown)
               {
                  bool hide = false;
                  if(before.y != after.y)
                     hide = true;
                  else
                  {
                     const char * buffer = membersLine.text;
                     int c;
                     bool firstChar = true;
                     bool addedChar = false;
                     char string[1024];
                     int len = 0;

                     DataRow row;

                     membersLoc.end.charPos += after.x - Max(membersLoc.start.charPos, before.x);

                     for(c = membersLoc.start.charPos; c<membersLoc.end.charPos && len < sizeof(string)-1; c++)
                     {
                        bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
                        if(!isalnum(buffer[c]) && buffer[c] != '_' && (!isSpace || !firstChar)) //|| membersList.currentRow
                        {
                           hide = true;
                           break;
                        }
                        if(!isSpace)
                           firstChar = false;
                        else if(firstChar)
                        {
                           membersLoc.start.charPos++;
                           addedChar = true;
                        }

                        if(!firstChar)
                           string[len++] = buffer[c];
                     }
                     if(firstChar)
                     {
                        row = membersList.currentRow;
                        if(row && row.selected)
                        {
                           hide = true;
                           if(addedChar)
                              membersLoc.start.charPos--;
                        }
                     }

                     string[len] = 0;

                     if(!hide)
                     {
                        row = membersList.FindSubString(string);
                        if(row)
                           membersList.currentRow = row;
                        else
                        {
                           row = membersList.FindSubStringi(string);
                           if(row)
                              membersList.currentRow = row;
                           membersList.currentRow.selected = false;
                        }
                        if(row)
                           membersList.SetScrollPosition(0, (row.index) * membersList.rowHeight);
                     }
                     else
                     {
                        row = membersList.currentRow;
                     }

                     // Accept current string if hiding typing char
                     if(hide && row && row.selected)
                     {
                        const char * string = row.string;
                        int len = strlen(string);
                        membersLoc.end.charPos -= after.x - before.x;
                        editBox.GoToPosition(membersLine, membersLoc.start.line, membersLoc.start.charPos);
                        editBox.Delete(membersLine, membersLoc.start.line, membersLoc.start.charPos,
                                       membersLine, membersLoc.end.line, membersLoc.end.charPos);
                        editBox.PutS(string);
                        editBox.GoToPosition(membersLine, membersLoc.start.line, membersLoc.start.charPos + len + 1 /*after.x - before.x*/);

                        after.x += membersLoc.start.charPos + len - before.x;
                        before.x = membersLoc.start.charPos + len;
                     }
                  }
                  if(hide)
                  {
                     membersList.Destroy(0);
                     membersListShown = false;
                  }
               }
               if(/*after.x - before.x == 1 && */after.y == before.y && !membersListShown)
               {
                  EditLine line = editBox.line;
                  const char * text = line.text;
                  char ch = text[after.x-1];
                  if(ch == '.' || (ch == '>' && after.x-1 > 0 && text[after.x-1-1] == '-') || (ch == ':' && after.x-1 > 0 && text[after.x-1-1] == ':'))
                  {

                     /*
                     // Can we call invoke auto complete here instead?


                     int line, charPos;
                     Expression exp;
                     void * l1, * l2;
                     int x1,y1, x2,y2;
                     int oldCharPos;
                     Point caret;

                     // Force caret update already...
                     editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
                     editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

                     editBox.GetCaretPosition(&caret);



                     // Go back in the buffer until no space before
                     //yydebug = true;
                     codeModified = true;
                     EnsureUpToDate();
                     SetYydebug(false);
                     {
                        EditBoxStream f { editBox = editBox };
                        oldCharPos = x1;
                        x1--;
                        x2--;
                        if(text[after.x-1] == '>')
                        {
                           x1--;
                           x2--;
                        }

                        editBox.SetSelPos(l1, y1, x1, l2, y2, x2);
                        for(;;)
                        {
                           char ch;
                           if(!f.Seek(-1, current))
                              break;
                           f.Getc(&ch);
                           if(!isspace(ch)) break;
                           f.Seek(-1, current);
                        }
                        editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

                        line = editBox.lineNumber + 1;
                        charPos = editBox.charPos + 1;
                        delete f;
                     }

                     exp = FindExpTree(ast, line, charPos);

                     if(exp)
                     {
                        Type type = exp.expType;

                        if(type && text[after.x-1] != '.')
                        {
                           if(type.kind == TypePointer || type.kind == TypeArray)
                              type = type.type;
                           else
                              type = null;
                        }

                        membersList.Clear();
                        ListMembers(type);

                        if(membersList.rowCount)
                        {
                           membersList.Sort(null, 1);
                           membersList.master = this;

                           caret.y += editBox.GetCaretSize();
                           caret.x -= 20;

                           membersList.Create();

                           {
                              int x = caret.x + editBox.GetAbsX() - app.desktop.GetAbsX() - editBox.GetScrollX();
                              int y = caret.y + editBox.GetAbsY() - app.desktop.GetAbsY() - editBox.GetScrollY();
                              Window parent = membersList.parent;

                              if(!paramsAbove && (paramsShown || y + membersList.GetHeight() > parent.GetClientHeight()))
                              {
                                 y -= editBox.GetCaretSize() + membersList.GetHeight();
                                 membersAbove = true;
                              }
                              else
                                 membersAbove = false;

                              membersList.position = { x, y };
                           }

                           membersLine = l1;
                           membersLoc.start.line = line - 1;
                           membersLoc.start.charPos = oldCharPos;
                           membersLoc.end = membersLoc.start;
                           membersListShown = true;
                        }
                     }

                     SetThisClass(null);
                     SetCurrentContext(globalContext);
                     */
                     codeModified = true;
                     skipModified = true;
                     if(text[after.x-1] == ':')
                        InvokeAutoComplete(false, 0, false);
                     else if(text[after.x-1] == '.')
                        InvokeAutoComplete(false, 1, false);
                     else if(text[after.x-1] == '>')
                        InvokeAutoComplete(false, 2, false);
                     skipModified = false;
                  }
                  else if(ch == '(' || ch == OpenBracket || ch == ',' || ch == '='  || ch == '?'  || ch == ':')
                  {
                     codeModified = true;
                     skipModified = true;

                     if(InvokeAutoComplete(true, 0, false))
                     {
                        if(ch == '(' || ch == OpenBracket)
                           InvokeParameters(true, true, false);
                        else
                           InvokeParameters(this.functionType ? false : true, false, false);
                     }

                     // InvokeAutoComplete(true, 0, false);
                     skipModified = false;
                  }
                  else if(ch == ')' || ch == '}' || ch == ';')
                  {
                     codeModified = true;
                     skipModified = true;
                     if(paramsShown)
                        InvokeParameters(false, true, false);
                     skipModified = false;
                  }
                  else
                  {
                     bool back = codeModified;
                     codeModified = false;
                     if(paramsShown)
                        InvokeParameters(false, false, true);
                     if(membersListShown)
                        InvokeAutoComplete(false, 0, true);
                     codeModified = back;
                  }
               }
               else
               {
                  bool back = codeModified;
                  codeModified = false;

                  if(paramsShown)
                     InvokeParameters(false, false, true);
                  /*if(membersListShown)
                     InvokeAutoComplete(false, 0, true);*/

                  codeModified = back;
               }
            }
         }
         return true;
      }

      bool NotifyCharsDeleted(EditBox editBox, BufferLocation before, BufferLocation after, bool pasteOperation)
      {
         if(!loadingFile && after.y != before.y)
         {
            ProjectView projectView = ide.projectView;
            if(projectView && fileName)
               ide.debugger.MoveIcons(fileName, before.y + 1, before.y - after.y, before.x == 0);
            Update({ 0, 0, editBox.position.x, clientSize.h });
            UpdateMarginSize();
         }

         if(!updatingCode)
         {
            ObjectInfo oClass;

            for(oClass = classes.first; oClass; oClass = oClass.next)
            {
               ObjectInfo object;
               Location * loc;
               for(object = oClass.instances.first; object; object = object.next)
               {
                  if(object.instCode)
                  {
                     loc = &object.instCode.loc;

                     if((before.y+1 < loc->start.line || (before.y+1 == loc->start.line && before.x+1 <= loc->start.charPos)) &&
                        (after.y+1 > loc->end.line    || (after.y+1 == loc->end.line && after.x+1 >= loc->end.charPos)))
                     {
                        object.instCode = null;
                     }
                     else
                     {
                        loc->start.AdjustDelete(before, after);
                        loc->end.AdjustDelete(before, after);
                     }
                  }
               }
               if(oClass.classDefinition)
               {
                  loc = &oClass.classDefinition.loc;
                  if((before.y+1 < loc->start.line || (before.y+1 == loc->start.line && before.x+1 <= loc->start.charPos)) &&
                     (after.y+1 > loc->end.line    || (after.y+1 == loc->end.line && after.x+1 >= loc->end.charPos)))
                  {
                     oClass.classDefinition = null;
                  }
                  else
                  {
                     loc->start.AdjustDelete(before, after);
                     loc->end.AdjustDelete(before, after);
                  }
               }
            }

            if(membersListShown)
            {
               bool hide = false;
               if(pasteOperation || before.y != after.y)
                  hide = true;
               else
               {
                  const char * buffer = membersLine.text;
                  int c;
                  bool firstChar = true;
                  char string[1024];
                  int len = 0;

                  if(before.x >= membersLoc.start.charPos)
                  {
                     for(c = membersLoc.start.charPos; c<before.x && len < sizeof(string)-1; c++)
                     {
                        bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
                        if(!isalnum(buffer[c]) && buffer[c] != '_' && (!isSpace || !firstChar))
                        {
                           hide = true;
                           break;
                        }
                        if(!isSpace) firstChar = false;

                        if(!firstChar)
                           string[len++] = buffer[c];
                     }
                  }
                  else
                  {
                     // If deleting spaces before...
                     for(c = before.x; c<membersLoc.start.charPos; c++)
                     {
                        bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
                        if(!isSpace)
                        {
                           hide = true;
                           break;
                        }
                     }
                     if(!hide)
                        membersLoc.start.charPos = before.x;
                  }

                  if(membersLoc.end.charPos >= after.x)
                  {
                     for(c = after.x; c<membersLoc.end.charPos && len < sizeof(string)-1; c++)
                     {
                        bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
                        if(!isalnum(buffer[c]) && buffer[c] != '_' && (!isSpace || !firstChar))
                        {
                           hide = true;
                           break;
                        }
                        if(!isSpace) firstChar = false;

                        if(!firstChar)
                           string[len++] = buffer[c];
                     }
                  }
                  else
                     hide = true;

                  string[len] = '\0';

                  membersLoc.end.charPos -= after.x - before.x;
                  if(!hide)
                  {
                     DataRow row;
                     row = membersList.FindSubString(string);
                     if(!row)
                     {
                        row = membersList.FindSubStringi(string);
                        if(row)
                           membersList.currentRow = row;
                        membersList.currentRow.selected = false;
                     }
                     else
                        membersList.currentRow = row;
                     if(row)
                        membersList.SetScrollPosition(0, row.index * membersList.rowHeight);
                  }
               }
               if(hide)
               {
                  membersList.Destroy(0);
                  membersListShown = false;
               }

               /*
               if(paramsShown)
               {
                  InvokeParameters(false, false);
               }
               */
            }
         }
         return true;
      }

      bool NotifyDropped(EditBox editBox, int x, int y)
      {
         char * controlClass = toolBox.controlClass;
         if(controlClass && controlClass[0])
         {
            Instance control;
            ObjectInfo object;
            ObjectInfo classObject;

            editBox.GoToLineNum(y);
            x = Min(x, editBox.line.count);
            editBox.GoToPosition(editBox.line, y, x);
            // Note: Uncommented this to drag objects after the member instance on which they are dropped
            editBox.NotifyCaretMove(this, editBox, y+1, x+1);

            classObject = selected ? selected.oClass : null;

            if((!selected || selected == classObject) && classObject && classObject.instances.first)
               selected = classObject.instances.last;

            UpdateFormCode();
            control = eInstance_New(eSystem_FindClass(privateModule, controlClass));
            if(control)
            {
               AddObject(control, &object);

               designer.CreateObject(control, object, false, classObject.instance);
               // designer.PostCreateObject(control, object, false, classObject.instance);
               designer.DroppedObject(control, object, false, classObject.instance);

               sheet.AddObject(object, object.name, typeData /* className*/, true);

               UpdateFormCode();
               //codeModified = true;
               EnsureUpToDate();
            }
         }
         return true;
      }

      bool NotifyKeyDown(EditBox editBox, Key key, unichar ch)
      {
         if(key == ctrlSpace)
         {
            membersList.Destroy(0);
            membersListShown = false;
            InvokeAutoComplete(false, 0, false);
            return false;
         }
         else if(key == Key { space, ctrl = true, shift = true })
            InvokeParameters(false, true, false);
         else if(key == escape)
            ide.RepositionWindows(true);
         else if(key == ctrlF7)
         {
            if(ide.projectView)
            {
               ProjectNode node = ide.projectView.GetNodeForCompilationFromWindow(this, false, null, null);
               if(!node)
               {
                  char * s;
                  s = PrintString($"The ", fileName, $" file is not part of any project.\n",
                     $"It can't be compiled.");
                  MessageBox { type = ok, /*parent = ide, */master = ide, text = $"File not in project error", contents = s }.Modal();
                  delete s;
                  return false;
               }
            }
         }
         return true;
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         CodeEditor editor = (CodeEditor)master;
         if(key == escape /*|| key == leftAlt || key == rightAlt || (key.ctrl && key.code != left && key.code != right && key.code != leftShift && key.code != rightShift && key.code !=  space)*/)
         {
            if(editor.membersListShown)
            {
               editor.membersList.Destroy(0);
               editor.membersListShown = false;
               return false;
            }
            if(editor.paramsShown)
            {
               editor.paramsList.Destroy(0);
               editor.paramsShown = false;
               FreeType(editor.functionType);
               FreeType(editor.instanceType);

               editor.functionType = null;
               editor.instanceType = null;
               editor.paramsID = -1;
               return false;
            }
         }
         return EditBox::OnKeyDown(key, ch);
      }

      void OnVScroll(ScrollBarAction action, int position, Key key)
      {
         if(anchor.left.distance)
         {
            Box box { 0, 0, anchor.left.distance-1, parent.clientSize.h - 1 };
            parent.Update(box);
         }
         EditBox::OnVScroll(action, position, key);
         {
            CodeEditor ce = (CodeEditor)parent;
            if(ce.openedFileInfo)
               ce.openedFileInfo.ScrollChange({ scroll.x, position });
         }
      }

      void OnHScroll(ScrollBarAction action, int position, Key key)
      {
         EditBox::OnHScroll(action, position, key);
         {
            CodeEditor ce = (CodeEditor)parent;
            if(ce.openedFileInfo)
               ce.openedFileInfo.ScrollChange({ position, scroll.y });
         }
      }
   };
   ListBox membersList
   {
      master = this,
      fullRowSelect = false,
      interim = true,
      autoCreate = false,
      borderStyle = bevel;
      // size = { 200, 400 };

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         DataRow row = listBox.currentRow;
         if(row)
         {
            const char * string = row.string;

            editBox.GoToPosition(membersLine, membersLoc.start.line, membersLoc.start.charPos);
            editBox.Delete(
               membersLine, membersLoc.start.line, membersLoc.start.charPos,
               membersLine, membersLoc.end.line, membersLoc.end.charPos);
            editBox.PutS(string);

            listBox.Destroy(0);
            membersListShown = false;
         }
         return true;
      }

      bool OnKeyDown(Key key, unichar ch)
      {
         CodeEditor editor = (CodeEditor) master;
         if(key == escape || key == leftAlt || key == rightAlt ||
            (key.ctrl && key.code != left && key.code != right &&
             key.code != leftShift && key.code != rightShift && key.code != space))
         {
            bool result = true;
            if(editor.paramsShown)
            {
               if(key == escape)
                  result = false;
               editor.paramsList.Destroy(0);
               editor.paramsShown = false;
            }
            if(editor.membersListShown)
            {
               if(key == escape)
                  result = false;
               editor.membersList.Destroy(0);
               editor.membersListShown = false;
            }

            FreeType(editor.functionType);
            editor.functionType = null;

            FreeType(editor.instanceType);
            editor.instanceType = null;

            editor.paramsID = -1;

            return result;
         }
         else
            return editor.editBox.OnKeyDown(key, ch);
         return false;
      }

      /*bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         CodeEditor editor = (CodeEditor)master;
         Window rw = previous ? previous.rootWindow : null;
         if(!active && rw != editor.paramsList)
         {
            Destroy(0);
            editor.membersListShown = false;
         }
         return ListBox::OnActivate(active, previous, goOnWithActivation, direct);
      }*/

      bool OnKeyHit(Key key, unichar ch)
      {
         CodeEditor editor = (CodeEditor) master;

         switch((SmartKey)key)
         {
            case enter: case tab:
            {
               DataRow row = currentRow;
               if(row && row.selected)
               {
                  const char * string = row.string;

                  editor.editBox.GoToPosition(editor.membersLine, editor.membersLoc.start.line, editor.membersLoc.start.charPos);
                  editor.editBox.Delete(
                     editor.membersLine, editor.membersLoc.start.line, editor.membersLoc.start.charPos,
                     editor.membersLine, editor.membersLoc.end.line, editor.membersLoc.end.charPos);
                  editor.editBox.PutS(string);

                  Destroy(0);
                  editor.membersListShown = false;
               }
               else
                  editor.editBox.OnKeyHit(key, ch);
               break;
            }
            case down:
            case up:
            case pageDown:
            case pageUp:
            case home:
            case end:
            {
               return ListBox::OnKeyHit(key, ch);
            }
            default:
            {
               /*
               bool result;
               // If before . or after
               //listBox.Destroy(true);
               result = editor.editBox.OnKeyHit(key, ch);
               return result;
               */
               return true;
            }
         }

         return false;
      }
   };

   Window paramsList
   {
      master = this,
      interim = true,
      clickThrough = true,
      autoCreate = false,
      borderStyle = contour,
      cursor = null,
      background = { 255,255,225 },

      OnKeyDown = membersList.OnKeyDown;

      /*bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
      {
         CodeEditor editor = (CodeEditor)master;
         Window rw = previous ? previous.rootWindow : null;
         if(!active && previous != editor.editBox && rw != editor.membersList)
         {
            Destroy(0);
            editor.paramsShown = false;
         }
         return Window::OnActivate(active, previous, goOnWithActivation, direct);
      }*/

      bool OnKeyHit(Key key, unichar ch)
      {
         CodeEditor editor = (CodeEditor)master;

         if(!editor.membersListShown || editor.membersList.OnKeyHit(key, ch))
         {
            /*
            bool result = true; editor.editBox.OnKeyHit(key, ch);
            return (!created) ? false : result;
            */
            return true;
         }
         return false;
      }

      void OnRedraw(Surface surface)
      {
         CodeEditor editor = (CodeEditor) master;
         Type type = editor.functionType ? editor.functionType : editor.instanceType;
         Type param;
         Type methodType = null;

         char string[1024];

         int functionW, nameW = 0;
         int totalW = 0;
         int spaceW, spaceH, commaW, commaWB, parW;
         int availW = 1024;
         int maxW = 0, lineW = 0;
         int realW = 0;
         int height = 0;
         int x = 2, y = 2;
         int id = 0;

         Font font = editor.normalFont.font;
         Font boldFont = editor.boldFont.font;
         Display display = this.display;

         if(!type) { return; };

         if(type.kind == TypeKind::methodType) { methodType = type; type = type.method.dataType; }

         display.FontExtent(boldFont, " ", 1, &spaceW, &spaceH);
         display.FontExtent(font, ", ", 2, &commaW, null);
         display.FontExtent(boldFont, ", ", 2, &commaWB, null);
         display.FontExtent(font, ")", 1, &parW, null);

         string[0] = 0;
         if(editor.functionType && type.kind == functionType)
         {
            PrintType(type.returnType, string, true, true);
            display.FontExtent(font, string, strlen(string), &functionW, null);
            if(type.name)
               display.FontExtent(font, type.name, strlen(type.name), &nameW, null);
            totalW = nameW + functionW + 2 * parW;
         }
         else
         {
            PrintType(type, string, (type.kind == functionType) ? true : false, true); // true);
            display.FontExtent(boldFont, string, strlen(string), &functionW, null);
            if(instanceName && type.kind != functionType)
               display.FontExtent(boldFont, instanceName, strlen(instanceName), &nameW, null);
            totalW = functionW + nameW;
            surface.TextFont(boldFont);
         }

         surface.WriteText(x, y, string, strlen(string));
         x += functionW + spaceW;

         if(editor.functionType)
         {
            if(type.name)
               surface.WriteText(x, y, type.name, strlen(type.name));
            x += nameW;
            surface.WriteText(x, y, "(", 1);
            x += parW;

            if(methodType && !methodType.staticMethod && methodType.methodClass)
            {
               int tw = 0, width;

               if(id == editor.paramsID)
                  surface.TextFont(boldFont);

               if(methodType.methodClass)
                  surface.TextExtent(methodType.methodClass.name, strlen(methodType.methodClass.name), &tw, null);

               width = tw;

               if(type.params.first && (((Type)type.params.first).kind != voidType || type.params.count > 1))
                  width += ((id == editor.paramsID) ? commaWB : commaW);

               if(!height)
                  maxW = lineW;

               if(lineW && ((height && lineW + width > maxW) || (totalW + lineW + width + 20 > availW)))
               {
                  height += spaceH;
                  lineW = 0;

                  x = 2 + nameW + spaceW + functionW + parW;
                  y += spaceH;

               }
               if(methodType.methodClass)
                  surface.WriteText(x, y, methodType.methodClass.name, strlen(methodType.methodClass.name));

               x += tw;
               if(type.params.first && (((Type)type.params.first).kind != voidType || type.params.count > 1))
               {
                  surface.WriteText(x, y, ",", 1);
                  x += ((id ==  editor.paramsID) ? commaWB : commaW);
               }

               lineW += width;

               if(lineW > realW)
                  realW = lineW;

               if(id == editor.paramsID)
                  surface.TextFont(font);
               id ++;
            }

            if(!methodType || (methodType.staticMethod || !methodType.methodClass) || !type.params.first || ((Type)type.params.first).kind != voidType || type.params.count > 1)
            {
               for(param = type.params.first; param; param = param.next)
               {
                  char paramString[1024];
                  int tw, width;

                  if(id == editor.paramsID || (param.kind == ellipsisType && id < editor.paramsID && editor.paramsID != -1))
                     surface.TextFont(boldFont);

                  paramString[0] = 0;
                  PrintType(param, paramString, true, true);
                  surface.TextExtent(paramString, strlen(paramString), &tw, null);
                  width = tw;
                  if(param.next) width += ((id ==  editor.paramsID) ? commaWB : commaW);

                  if(!height)
                     maxW = lineW;

                  if(lineW && ((height && lineW + width > maxW) || (totalW + lineW + width + 20 > availW)))
                  {
                     height += spaceH;
                     lineW = 0;

                     x = 2 + nameW + spaceW + functionW + parW;
                     y += spaceH;

                  }
                  surface.WriteText(x, y, paramString, strlen(paramString));
                  x += tw;
                  if(param.next)
                  {
                     surface.WriteText(x, y, ",", 1);
                     x += ((id ==  editor.paramsID) ? commaWB : commaW);
                  }

                  lineW += width;

                  if(lineW > realW)
                     realW = lineW;

                  if(id == editor.paramsID || (param.kind == ellipsisType && id < editor.paramsID && editor.paramsID != -1))
                     surface.TextFont(font);
                  id ++;
               }
            }

            surface.WriteText(x, y, ")", 1);
         }
         else if(instanceName && type.kind != functionType)
         {
            surface.WriteText(x, y, instanceName, strlen(instanceName));
         }
      }

      bool OnResizing(int * w, int * h)
      {
         CodeEditor editor = (CodeEditor) master;
         Type type = editor.functionType ? editor.functionType : editor.instanceType;
         Type param;
         Type methodType = null;

         char string[1024];

         int functionW = 0, nameW = 0;
         int totalW = 0;
         int spaceW, spaceH, commaW, commaWB, parW;
         int availW = 1024;
         int maxW = 0, lineW = 0;
         int realW = 0;
         int height = 0;
         int id = 0;

         Font font = editor.normalFont.font;
         Font boldFont = editor.boldFont.font;
         Display display = this.display;

         if(type.kind == TypeKind::methodType)
         {
            methodType = type;
            ProcessMethodType(type.method);
            type = type.method.dataType;
         }

         display.FontExtent(boldFont, " ", 1, &spaceW, &spaceH);
         display.FontExtent(font, ", ", 2, &commaW, null);
         display.FontExtent(boldFont, ", ", 2, &commaWB, null);
         display.FontExtent(font, ")", 1, &parW, null);

         string[0] = 0;
         if(editor.functionType && type && type.kind == functionType)
         {
            PrintType(type.returnType, string, true, true);
            display.FontExtent(font, string, strlen(string), &functionW, null);
            if(type.name)
               display.FontExtent(font, type.name, strlen(type.name), &nameW, null);
            totalW = nameW + spaceW + functionW + 2 * parW;
         }
         else if(type)
         {
            PrintType(type, string, false, true); // /*true);
            display.FontExtent(boldFont, string, strlen(string), &functionW, null);
            if(instanceName && type.kind != functionType)
               display.FontExtent(boldFont, instanceName, strlen(instanceName), &nameW, null);
            totalW = functionW + nameW + spaceW;
         }

         if(editor.functionType)
         {
            if(methodType)
            {
               int width = 0;

               if(methodType.methodClass)
                  display.FontExtent((id == editor.paramsID) ? boldFont : font, methodType.methodClass.name, strlen(methodType.methodClass.name), &width, null);
               if(type.params.first && (((Type)type.params.first).kind != voidType || type.params.count > 1))
                  width += ((id == editor.paramsID) ? commaWB : commaW);

               if(!height)
                  maxW = lineW;

               if(lineW && ((height && lineW + width > maxW) || (totalW + lineW + width + 20 > availW)))
               {
                  height += spaceH;
                  lineW = 0;
               }

               lineW += width;

               if(lineW > realW)
                  realW = lineW;

               id++;
            }
            if(!methodType || methodType.staticMethod || !type.params.first || ((Type)type.params.first).kind != voidType || type.params.count > 1)
            {
               for(param = type.params.first; param; param = param.next)
               {
                  char paramString[1024];
                  int width = 0;

                  paramString[0] = 0;
                  PrintType(param, paramString, true, true);
                  display.FontExtent((id == editor.paramsID || param.kind == ellipsisType) ? boldFont : font, paramString, strlen(paramString), &width, null);
                  if(param.next)
                     width += ((id == editor.paramsID) ? commaWB : commaW);

                  if(!height)
                     maxW = lineW;

                  if(lineW && ((height && lineW + width > maxW) || (totalW + lineW + width + 20 > availW)))
                  {
                     height += spaceH;
                     lineW = 0;
                  }

                  lineW += width;

                  if(lineW > realW)
                     realW = lineW;

                  id++;
               }
            }
         }
         height += spaceH;

         *w = realW + totalW + 4;
         *h = height + 4;
         return true;
      }
   };

   Menu fileMenu { menu, $"File", f };
   MenuItem { fileMenu, $"Save", s, Key { s, ctrl = true }, NotifySelect = MenuFileSave };
   MenuItem { fileMenu, $"Save As...", a, NotifySelect = MenuFileSaveAs };

   Menu editMenu { menu, $"Edit", e };
   MenuDivider { editMenu };
   MenuItem clearTrailingSpacesItem
   {
      editMenu, $"Clear trailing spaces", t, Key { t, ctrl = true, shift = true };

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         // Nuke trailing spaces
         EditLine line;
         int y = 0;
         editBox.recordUndoEvent = true;
         for(line = editBox.firstLine; line; line = line.next, y++)
         {
            const String buffer = line.text;
            int count = line.count, i = count-1;
            while(i >= 0 && isspace(buffer[i])) i--;
            if(i < count - 1)
               editBox.Delete(line, y, i + 1, line, y, count);
         }
         editBox.recordUndoEvent = false;
         return true;
      }
   };

   Menu debugMenu { menu, $"Debug", d };
   MenuItem debugRunToCursor                { debugMenu, $"Run To Cursor", c, ctrlF10,                                                                  id = RTCMenuBits { false, false, false }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugSkipRunToCursor            { debugMenu, $"Run To Cursor Skipping Breakpoints", u, Key { f10, ctrl = true, shift = true },              id = RTCMenuBits { true,  false, false }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugRunToCursorAtSameLevel     { debugMenu, $"Run To Cursor At Same Level", l, altF10,                                                     id = RTCMenuBits { false, true,  false }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugSkipRunToCursorAtSameLevel { debugMenu, $"Run To Cursor At Same Level Skipping Breakpoints", g, Key { f10, shift = true, alt = true }, id = RTCMenuBits { true,  true,  false }, NotifySelect = RTCMenu_NotifySelect; };
#if 0
   MenuItem debugBpRunToCursor                { debugMenu, $"BP Run To Cursor"/*, c, ctrlF10*/,                                                                  id = RTCMenuBits { false, false, true  }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugBpSkipRunToCursor            { debugMenu, $"BP Run To Cursor Skipping Breakpoints"/*, u, Key { f10, ctrl = true, shift = true }*/,              id = RTCMenuBits { true,  false, true  }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugBpRunToCursorAtSameLevel     { debugMenu, $"BP Run To Cursor At Same Level"/*, l, altF10*/,                                                     id = RTCMenuBits { false, true,  true  }, NotifySelect = RTCMenu_NotifySelect; };
   MenuItem debugBpSkipRunToCursorAtSameLevel { debugMenu, $"BP Run To Cursor At Same Level Skipping Breakpoints"/*, g, Key { f10, shift = true, alt = true }*/, id = RTCMenuBits { true,  true,  true  }, NotifySelect = RTCMenu_NotifySelect; };
#endif
   bool RTCMenu_NotifySelect(MenuItem selection, Modifiers mods)
   {
      ProjectView projectView = ide.projectView;
      if(!projectView.buildInProgress)
      {
         RTCMenuBits bits = (RTCMenuBits)selection.id;
         int line = editBox.lineNumber + 1;
         if(projectView)
         {
            CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
            ProjectConfig config = projectView.project.config;
            int bitDepth = ide.workspace.bitDepth;
            bool useValgrind = ide.workspace.useValgrind;
            ide.debugger.RunToCursor(compiler, config, bitDepth, useValgrind, fileName, line, bits.ignoreBreakpoints, bits.atSameLevel, bits.oldImplementation);
            delete compiler;
         }
      }
      return true;
   }
   MenuDivider { debugMenu };
   MenuItem debugToggleBreakpoint
   {
      debugMenu, $"Toggle Breakpoint", t, f9;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         ProjectView projectView = ide.projectView;
         if(projectView && fileName)
         {
            int line = editBox.lineNumber + 1;
            ide.debugger.ToggleBreakpoint(fileName, line);
            Update(null);
         }
         return true;
      }
   };

   bool debugClosing;
   int lastLine;

   //MenuItem viewDesignerItem, viewProperties, viewMethods;

   bool OnCreate(void)
   {
      designer.parent = parent;
      designer.Create();

      toolBox = ((IDEWorkSpace)master).toolBox;
      incref toolBox;
      // Debugger bug here: value of toolBox appears as 0

      sheet = ((IDEWorkSpace)master).sheet;
      incref sheet;
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      if(!parentClosing)
      {
         if(ide.workspace && fileName)
            ide.workspace.UpdateOpenedFileInfo(fileName, closed, false);
         if(inUseDebug && !debugClosing)
         {
            debugClosing = true;
            closing = false;
            if(CloseConfirmation(false))
            {
               visible = false;
               if(modifiedDocument)
                  OnFileModified({ modified = true }, null);
            }
            debugClosing = false;
            return false;
         }
         if(designer && !designer.closing)
         {
            if(designer.visible)
            {
               visible = false;
               return false;
            }
            /*else
            {
               //Window formEditor = designer;
               //formEditor.Destroy(0);
            }*/
         }
         ide.AdjustFileMenus();
      }
      return true;
   }

   void OnDestroy(void)
   {
      ObjectInfo oClass, next;
      // Class windowClass = eSystem_FindClass(this.privateModule, "ecere::gui::Window");

      FreeType(this.functionType);
      FreeType(this.instanceType);

      if(designer)
      {
         designer.Reset();
         designer.codeEditor = null;
         designer.Destroy(0);
         delete designer;
      }

      for(oClass = (classes).first, next = oClass ? oClass.next : null; oClass; oClass = next, next = next ? (next.next) : null)
      {
         ObjectInfo object, next;

         for(object = oClass.instances.first; object; object = next)
         {
            next = object.next;
            if(object.instance)
            {
               Designer::DestroyObject(object.instance);
               delete object.instance;
            }
            if(object.i18nStrings)
            {
               Map<String, bool> i18nStrings = object.i18nStrings;
               delete i18nStrings;
            }
            sheet.DeleteObject(object);
            delete object.name;
            oClass.instances.Delete(object);
         }
         if(oClass.instance)
         {
            Designer::DestroyObject(oClass.instance);
            delete oClass.instance;
         }
         if(oClass.i18nStrings)
         {
            Map<String, bool> i18nStrings = oClass.i18nStrings;
            delete i18nStrings;
         }
         sheet.DeleteObject(oClass);
         delete oClass.name;
         classes.Delete(oClass);
      }

      FreeParser();

      if(sheet.codeEditor == this)
      {
         sheet.codeEditor = null;
         toolBox.codeEditor = null;
      }
      delete sheet;
      delete toolBox;

      {
         ProjectView projectView = ide.projectView;
         if(projectView)
         {
            ProjectNode node = projectView.GetNodeFromWindow(this, null, true, false, null);
            if(node && node.modified)
            {
               node.modified = false;
               projectView.Update(null);
            }
         }
      }
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool directActivation)
   {
      // WHY WAS THIS HERE? I think this was here because once you move a window in the ide it's hard to reposition it correctly
      /*
      if(directActivation)
         ide.RepositionWindows(false);    // Moved this up before as resizing causes NotifyCaretMove to be called on all editors
      */
      if(active && directActivation)
      {
         AdjustDebugMenus();
         if(openedFileInfo)
            openedFileInfo.Activate();
         if(designer)
         {
            int line, charPos;
            Location * loc = null;
            UpdateFormCode(); // To ensure update when modifying properties...

            // Got to the right spot in code so we don't lose our form selection...
            if(selected)
            {
               if(selected.instCode)
                  loc = &selected.instCode.loc;
               else if(selected.classDefinition)
                  loc = &selected.classDefinition.loc;
            }
            line = editBox.lineNumber + 1;
            charPos = editBox.charPos + 1;
            if(fixCaret)
            {
               fixCaret = false;

               if(selected && !loc->Inside(line, charPos))
               {
                  editBox.GoToPosition(null, loc->start.line - 1, loc->start.charPos - 1);
                  line = editBox.lineNumber + 1;
                  charPos = editBox.charPos + 1;
               }
               else if(selected && selected.classDefinition)
               {
                  ObjectInfo object;
                  for(object = selected.instances.first; object; object = object.next)
                  {
                     if(object.instCode)
                     {
                        if(object.instCode.loc.Inside(line, charPos))
                           break;
                     }
                  }
                  if(object)
                  {
                     editBox.GoToPosition(null, loc->start.line - 1, loc->start.charPos - 1);
                     line = editBox.lineNumber + 1;
                     charPos = editBox.charPos + 1;
                  }
               }
            }

            ProcessCaretMove(editBox, line, charPos);
         }
      }
      if(!active)
      {
         if(membersListShown)
         {
            membersList.Destroy(0);
            membersListShown = false;
         }
         if(paramsShown)
         {
            paramsList.Destroy(0);
            paramsShown = false;
            FreeType(functionType);
            FreeType(instanceType);

            functionType = null;
            instanceType = null;
            paramsID = -1;
         }
      }
      return true;
   }

   bool OnSaveFile(const char * fileName)
   {
      File f;
      if(designer)
      {
         UpdateFormCode();
      }
      f = FileOpen(fileName, write);
      if(f)
      {
         if(!ide.projectView)
            ide.ChangeFileDialogsDirectory(codeEditorFileDialog.currentDirectory, true);
         if(designer)
         {
            if(!this.fileName)
               this.fileName = fileName;  // Put this here because the form designer will check for it...
            designer.fileName = fileName;
            designer.modifiedDocument = false;
         }

         editBox.Save(f, false);
         modifiedDocument = false;

         delete f;
         return true;
      }
      return false;
   }

   bool OnFileModified(FileChange fileChange, const char * param)
   {
      bool reload = false;
      if(visible == false && inUseDebug == true)
         ide.debugger.WatchesReleaseCodeEditor();
      else
      {
         char message[2048];

         sprintf(message, $"The document %s was modified by another application.\n"
            "Would you like to reload it and lose your changes?", fileName);
         if(MessageBox { creationActivation = flash, type = yesNo, master = /*parent = */parent, text = $"Document has been modified",
            contents = message }.Modal() == yes)
            reload = true;
      }

      if(reload)
      {
         File f = FileOpen(fileName, read);
         if(f)
         {
            int lineNumber, charPos, len;
            Point scroll;

            loadingFile = true;
            updatingCode = true;
            lineNumber = editBox.lineNumber;
            charPos = editBox.charPos;
            scroll = editBox.scroll;
            editBox.Clear();
            editBox.Load(f);
            lineNumber = lineNumber < editBox.numLines ? lineNumber : editBox.numLines - 1;
            len = strlen(editBox.line.text);
            editBox.GoToLineNum(lineNumber);
            editBox.GoToPosition(editBox.line, lineNumber, charPos <= len ? charPos - 1 : (len ? len - 1 : 0));
            editBox.scroll = scroll;
            updatingCode = false;
            loadingFile = false;

            codeModified = true;
            if(designer)
            {
               UpdateFormCode();
               designer.modifiedDocument = false;
            }
            modifiedDocument = false;

            delete f;
         }
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      bool codeMargin = true;
      // Line Numbers
      surface.SetBackground(colorScheme.marginColor);
      surface.Area(0, 0, editBox.anchor.left.distance, clientSize.h - 1);
      if(ideSettings.showLineNumbers)
      {
         int currentLineNumber;
         int i;
         char lineFormat[16];
         char lineText[256];
         int spaceH;

         surface.textOpacity = false;
         surface.font = font.font;
         surface.TextExtent(" ", 1, null, &spaceH);
         currentLineNumber = editBox.scroll.y / spaceH + 1;
         sprintf(lineFormat, " %%%du", maxLineNumberLength);

         surface.SetForeground(colorScheme.lineNumbersColor);
         for(i = 0; i < editBox.clientSize.h - 4; i += spaceH)
         {
            // Highlight current line
            if(editBox.lineNumber == currentLineNumber - 1)
            {
               surface.SetBackground(colorScheme.selectedMarginColor);
               surface.Area(0, i, editBox.anchor.left.distance, i+spaceH-1);
               surface.SetBackground(colorScheme.marginColor);
            }
            sprintf(lineText, lineFormat, currentLineNumber);
            if(currentLineNumber <= editBox.numLines)
               surface.WriteText(codeMargin * 20, i+1,lineText,maxLineNumberLength+1);
            currentLineNumber++;
         }
      }

      if(codeMargin && fileName && ide.projectView)
      {
         bool error, bpOnTopFrame, breakpointEnabled[128];
         int lineCursor, lineTopFrame, breakpointLines[128];
         int count, i, lineH, boxH, scrollY; //, firstLine; firstLine = editBox.firstLine;
         Debugger debugger = ide.debugger;
         BitmapResource bmpRes;

         boxH = clientSize.h;
         scrollY = editBox.scroll.y;
         displaySystem.FontExtent(editBox.font.font, " ", 1, null, &lineH);

         bpOnTopFrame = false;
         count = debugger.GetMarginIconsLineNumbers(fileName, breakpointLines, breakpointEnabled, 128, &error, &lineCursor, &lineTopFrame);
         if(count)
         {
            for(i = 0; i < count; i++)
            {
               if(breakpointLines[i] == lineCursor || breakpointLines[i] == lineTopFrame)
               {
                  bmpRes = breakpointEnabled[i] ? ide.bmpBpHalf : ide.bmpBpHalfDisabled;
                  if(breakpointLines[i] == lineTopFrame)
                     bpOnTopFrame = true;
               }
               else
                  bmpRes = breakpointEnabled[i] ? ide.bmpBp : ide.bmpBpDisabled;

               DrawLineMarginIcon(surface, bmpRes, breakpointLines[i], lineH, scrollY, boxH);
            }
         }
         DrawLineMarginIcon(surface, error ? ide.bmpCursorError : ide.bmpCursor, lineCursor, lineH, scrollY, boxH);
         bmpRes = bpOnTopFrame ? (error ? ide.bmpTopFrameHalfError : ide.bmpTopFrameHalf) : (error ? ide.bmpTopFrameError : ide.bmpTopFrame);
         DrawLineMarginIcon(surface, bmpRes, lineTopFrame, lineH, scrollY, boxH);
      }
      if(editBox.anchor.left.distance)
      {
         if(editBox.horzScroll && editBox.horzScroll.visible)
         {
            surface.SetBackground(control);
            surface.Area(0, editBox.clientSize.h, editBox.anchor.left.distance, clientSize.h - 1);
         }
      }
   }

   void DrawLineMarginIcon(Surface surface, BitmapResource resource, int line, int lineH, int scrollY, int boxH)
   {
      int lineY;
      if(line)
      {
         lineY = (line - 1) * lineH;
         if(lineY + lineH > scrollY && lineY /*+ lineH*/ < scrollY + boxH)
         {
            Bitmap bitmap = resource.bitmap;
            if(bitmap)
               surface.Blit(bitmap, 0, lineY - scrollY + (lineH - bitmap.height) / 2 + 1, 0, 0, bitmap.width, bitmap.height);
         }
      }
   }

   watch(fileName)
   {
      const char * fileName = property::fileName;

      designer.fileName = fileName;

      if(fileName)
      {
         char ext[MAX_EXTENSION];
         char name[MAX_FILENAME];
         SyntaxHighlighting highlighting;
         GetExtension(fileName, ext);
         GetLastDirectory(fileName, name);
         if(!strcmpi(ext, "mk") || !strcmpi(ext, "Makefile") || strstr(name, "Makefile") == name)
            editBox.useTab = true;
         highlighting = SHLFromFileName(name);
         highlighting.syntaxColorScheme = colorScheme.syntaxColors;
         editBox.syntaxHighlighting = highlighting;

         if(parsing && !strcmpi(ext, "ec"))
         {
            codeModified = true;
            EnsureUpToDate();
         }

         maxLineNumberLength = 0;
         UpdateMarginSize();
      }
   };

   bool UpdateMarginSize()
   {
      bool codeMargin = true;
      if(ideSettings.showLineNumbers)
      {
         int numLen = Max(4, nofdigits(editBox.numLines));
         int digitWidth;
         maxLineNumberLength = numLen;
         display.FontExtent(font.font, "0", 1, &digitWidth, null);
         editBox.anchor = Anchor
         {
            left = codeMargin * 20 + ideSettings.showLineNumbers * (maxLineNumberLength+2) * digitWidth,
            right = 0, top = 0, bottom = 0
         };
      }
      else
      {
         maxLineNumberLength = 0;
         editBox.anchor = Anchor
         {
            left = codeMargin * 20,
            right = 0, top = 0, bottom = 0
         };
      }
      return true;
   }

   bool OnPostCreate()
   {
      UpdateMarginSize();
      return true;
   }

   bool LoadFile(const char * filePath)
   {
      File f = FileOpen(filePath, read);
      if(f)
      {
         // Added this here...
         fileName = filePath;
         loadingFile = true;
         updatingCode = true;
         editBox.Load(f);
         updatingCode = false;
         loadingFile = false;
         Create();

         delete f;
         return true;
      }
      return false;
   }

   void AdjustDebugMenus()
   {
      bool unavailable = ide.areDebugMenusUnavailable;
      bool isNotNotRunning    = unavailable || ide.isDebuggerRunning;
      bool isNotStopped       = unavailable || !ide.isDebuggerStopped;
      bool noBreakpointToggle = ide.isBreakpointTogglingUnavailable;

      debugRunToCursor.disabled                = isNotNotRunning;
      debugSkipRunToCursor.disabled            = isNotNotRunning;
      debugRunToCursorAtSameLevel.disabled     = isNotStopped;
      debugSkipRunToCursorAtSameLevel.disabled = isNotStopped;
#if 0
      debugBpRunToCursor.disabled                = isNotNotRunning;
      debugBpSkipRunToCursor.disabled            = isNotNotRunning;
      debugBpRunToCursorAtSameLevel.disabled     = isNotStopped;
      debugBpSkipRunToCursorAtSameLevel.disabled = isNotStopped;
#endif
      debugToggleBreakpoint.disabled           = noBreakpointToggle;
   }

   CodeEditor()
   {
      CodeObjectType c;

      globalData.classes.CompareKey = (void *)BinaryTree::CompareString;
      globalData.defines.CompareKey = (void *)BinaryTree::CompareString;
      globalData.functions.CompareKey = (void *)BinaryTree::CompareString;
      globalData.nameSpaces.CompareKey = (void *)BinaryTree::CompareString;

      /*if(fileName)
         designer.fileName = fileName;
      else
      */
      if(designer)
      {
         char title[1024];
         sprintf(title, $"Untitled %d", documentID);
         // designer.fileName = CopyString(title);
         designer.fileName = title;
      }

      AdjustDebugMenus();

      for(c = 0; c < CodeObjectType::enumSize; c++)
         icons[c] = BitmapResource { iconNames[c], window = this };

      codeModified = true;
      inUseDebug = false;
      return true;
   }

   ~CodeEditor()
   {

   }

   void ModifyCode()
   {
      fixCaret = true;
      selected.modified = true;
      selected.oClass.modified = true;

      designer.modifiedDocument = true;
      modifiedDocument = true;
      formModified = true;
   }

   /****************************************************************************
                                 PARSING
   ****************************************************************************/
   void FreeParser()
   {
      {
         Class windowClass = eSystem_FindClass(privateModule, "ecere::gui::Window");
         if(windowClass && windowClass.data)
            UnapplySkin(windowClass);
      }

      SetCurrentNameSpace(null);
      if(ast)
      {
         FreeASTTree(ast);
         ast = null;
      }
      defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);   // Moved this after FreeAST because Debug printing causes ModuleImports to be created

      FreeExcludedSymbols(excludedSymbols);
      FreeContext(globalContext);
      FreeIncludeFiles();
      FreeGlobalData(&globalData);
      FindCtx_Terminate();
      FindParams_Terminate();

      if(GetGlobalContext() == globalContext)
      {
         SetGlobalData(null);
         SetGlobalContext(null);
         SetExcludedSymbols(null);
         SetTopContext(null);
         SetCurrentContext(null);
         SetDefines(null);
         SetImports(null);
         SetPrivateModule(null);
      }

      // Note: This code should probably be merged with FreeParser()
      if(ast)
      {
         FreeASTTree(ast);
         ast = null;
         //SetAST(null);
      }
      defines.Free(FreeModuleDefine);
      imports.Free(FreeModuleImport);

      FreeContext(this.globalContext);
      FreeExcludedSymbols(this.excludedSymbols);

      FreeIncludeFiles();
      FreeGlobalData(&this.globalData);

      if(this.privateModule)
      {
         FreeTypeData(this.privateModule);
         delete this.privateModule;
      }
   }

   void ParseCode()
   {
      static bool reentrant = false;
      External external;
      File editFile;
      EditLine l1, l2;
      int x1,x2,y1,y2;
      char * selectedClassName = null, * selectedName = null;
      int selectedPos = 0;
      Designer backDesigner;
      char oldWorkDir[MAX_LOCATION];
      char mainModuleName[MAX_FILENAME] = "";
      const char * fileName;
      ImportedModule module;
      char extension[MAX_EXTENSION];
      PathBackup pathBackup { };
#ifdef _TIMINGS
      Time parseCodeStart = GetTime();
      Time startTime, startFindClass;

      findClassTotalTime = 0;
      checkTypeTotalTime = 0;
      externalImportTotalTime = 0;
      findClassIgnoreNSTotalTime = 0;
      findSymbolTotalTime = 0;
      //ResetClassFindTime();
#endif
      Project project;

      // This temporarily fixes issue with 2 overrides in release mode with VC6 (only happens with both ecere.dll and ecere-ide.exe compiled in release mode)
      if(reentrant) return;
      reentrant = true;

      updatingCode++;

      if(selected)
      {
         selectedClassName = CopyString(oClass.name);
         if(selected != oClass)
         {
            ObjectInfo object = this.selected;
            selectedName = CopyString(object.name);
            if(!selectedName)
            {
               ObjectInfo check;
               for(check = this.oClass.instances.first; check; check = check.next)
               {
                  if(check == object)
                     break;
                  selectedPos++;
               }
            }
         }
         else
            selectedPos = -1;
      }

      editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

      /*
      sprintf(command, "C:\\Program Files\\Microsoft Visual Studio\\VC98\\Bin\\cl "
         "/nologo /D \"MSC\" /D \"WIN32\" /D \"NDEBUG\" /D \"_WINDOWS\" /D \"_MBCS\" "
         "/I \"C:\\Program Files\\Microsoft Visual Studio\\VC98\\Include\" "
         "/I T:\\ecere\\include /E %s", argv[1]);
      */

      /*
      ChangeWorkingDir("e:\\ec");
      sprintf(command, "gcc -x c -E -");
      fileInput = DualPipeOpen({ output = true, input = true }, command);
      SetFileInput(fileInput);
      {
         for(;;)
         {
            byte buffer[8192];
            uint count = editFile.Read(buffer, 1, sizeof(buffer));
            if(count)
               fileInput.Write(buffer, 1, count);
            else
               break;
         }
         delete editFile;
         fileInput.CloseOutput();
      }
      */

      // TOCHECK: COULDN'T WE CALL FreeParser here?
      // Clear everything
      FreeType(this.functionType);
      FreeType(this.instanceType);
      this.functionType = null;
      this.instanceType = null;

      // Select nothing
      sheet.SelectObject(null);

      designer.Reset();

      selected = null;

      // We don't want the designer to be notified of selection when deleting rows...
      backDesigner = designer;
      designer = null;

      if(this.oClass)
      {
         ObjectInfo _class, next;

         for(_class = classes.first; _class; _class = next)
         {
            ObjectInfo object;

            next = _class.next;

            while((object = _class.instances.first))
            {
               if(object.instance)
               {
                  Designer::DestroyObject(object.instance);
                  delete object.instance;
               }
               if(object.i18nStrings)
               {
                  Map<String, bool> i18nStrings = object.i18nStrings;
                  delete i18nStrings;
               }
               sheet.DeleteObject(object);
               delete object.name;
               _class.instances.Delete(object);
            }
            if(_class.instance)
            {
               Designer::DestroyObject(_class.instance);
               delete _class.instance;
            }
            if(_class.i18nStrings)
            {
               Map<String, bool> i18nStrings = _class.i18nStrings;
               delete i18nStrings;
            }
            sheet.DeleteObject(_class);
            delete _class.name;
            classes.Delete(_class);
         }
         this.oClass = null;
      }

      designer = backDesigner;

      SetEchoOn(true);
      fileInput = editFile = EditBoxStream { editBox = editBox };
      SetFileInput(fileInput);

      FreeParser();

      SetGlobalData(&globalData);
      SetGlobalContext(globalContext);
      SetExcludedSymbols(&excludedSymbols);
      SetTopContext(globalContext);
      SetCurrentContext(globalContext);
      SetDefines(&defines);
      SetImports(&imports);

#ifdef _TIMINGS
      startTime = GetTime();
      printf("Cleaning up took %.3f seconds\n", startTime - parseCodeStart);

      printf("classes.count: %d\n", globalContext.classes.count);
#endif

      if(ide.workspace)
      {
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
         SetTargetBits(ide.workspace.bitDepth ? ide.workspace.bitDepth : GetHostBits());
         delete compiler;
      }
      this.privateModule = __ecere_COM_Initialize((bool)(false | ((GetTargetBits() == sizeof(uintptr) *8) ? 0 : GetTargetBits() == 64 ? 2 : 4)), 1, null);
      ((SyntaxHighlighting)editBox.syntaxHighlighting).privateModule = this.privateModule;

      SetPrivateModule(privateModule);

      {
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint64"), type = ProcessTypeString("unsigned int64", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint32"), type = ProcessTypeString("unsigned int", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("uint16"), type = ProcessTypeString("unsigned short", false) });
         globalContext.types.Add((BTNode)Symbol { string = CopyString("byte"), type = ProcessTypeString("unsigned char", false) });
      }

      fileName = this.fileName;
      project = null;
      if(ide.workspace && ide.workspace.projects && fileName)
      {
         for(p : ide.workspace.projects)
         {
            char path[MAX_LOCATION];
            ProjectNode pn;
            MakePathRelative(fileName, p.topNode.path, path);
            MakeSlashPath(path);

            pn = p.topNode.FindWithPath(path, false);
            if(pn)
            {
               project = p;
               break;
            }
         }
      }
      if(!project)
         project = ide.project;

      GetWorkingDir(oldWorkDir, MAX_LOCATION);
      if(project)
         ChangeWorkingDir(project.topNode.path);

      SetSomeSourceFileStack(fileName ? fileName : "", 0); //strcpy(sourceFileStack[0], fileName ? fileName : "");

      GetLastDirectory(fileName, mainModuleName);
      GetExtension(mainModuleName, extension);

      SetBuildingEcereCom(false);
      SetBuildingEcereComModule(false);

      // TODO: Get symbolsDir from project settings instead...
      if(ide.projectView)
      {
         CompilerConfig compiler = ideConfig.compilers.GetCompilerConfig(ide.workspace.activeCompiler);
         ProjectConfig config = project.config;
         int bitDepth = ide.workspace.bitDepth;
         DirExpression objDir = project.GetObjDir(compiler, config, bitDepth);
         SetSymbolsDir(objDir.dir);
         SetDefaultNameSpace(project.GetDefaultNameSpace(config));
         ide.SetPath(true, compiler, config, bitDepth);

         delete objDir;
         delete compiler;
         // SetIncludeDirs(ide.projectView.project.config.includeDirs);
         // SetSysIncludeDirs(ide.ideSettings.systemDirs[includes]);
      }
      else
      {
         switch(__runtimePlatform)
         {
            case win32: SetSymbolsDir("obj/debug.win32"); break;
            case tux:   SetSymbolsDir("obj/debug.linux"); break;
            case apple: SetSymbolsDir("obj/debug.apple"); break;
         }
         SetIncludeDirs(null);
         SetSysIncludeDirs(null);
         SetDefaultNameSpace(null);
      }

      {
         if(ide.projectView && ide.projectView.IsModuleInProject(this.fileName))
         {
            // TODO FIX for configless project
            if(ide.project.config && ide.project.config.options && ide.project.config.options.preprocessorDefinitions)
            {
               for(item : ide.project.config.options.preprocessorDefinitions)
               {
                  if(!strcmp(item, "BUILDING_ECERE_COM"))
                  {
                     SetBuildingEcereCom(true);
                     break;
                  }
               }
            }
         }

         if(!(strcmpi(mainModuleName, "instance.ec") && strcmpi(mainModuleName, "BinaryTree.ec") &&
            strcmpi(mainModuleName, "dataTypes.ec") && strcmpi(mainModuleName, "OldList.ec") &&
            strcmpi(mainModuleName, "String.ec") && strcmpi(mainModuleName, "BTNode.ec") &&
            strcmpi(mainModuleName, "Array.ec") && strcmpi(mainModuleName, "AVLTree.ec") &&
            strcmpi(mainModuleName, "BuiltInContainer.ec") && strcmpi(mainModuleName, "Container.ec") &&
            strcmpi(mainModuleName, "CustomAVLTree.ec") && strcmpi(mainModuleName, "LinkList.ec") &&
            strcmpi(mainModuleName, "List.ec") && strcmpi(mainModuleName, "Map.ec") &&
            strcmpi(mainModuleName, "Mutex.ec")))
         {
            SetBuildingEcereComModule(true);
         }

         // Predeclare all classes
         {
            char symFile[MAX_FILENAME];
            char symLocation[MAX_LOCATION];
            ImportedModule module, next;

            GetLastDirectory(fileName, symFile);
            ChangeExtension(symFile, "sym", symFile);

            strcpy(symLocation, GetSymbolsDir());
            PathCat(symLocation, symFile);

            // if(!GetEcereImported() && !GetBuildingEcereCom())
            if(!strcmp(extension, "ec") || !strcmp(extension, "eh"))
            {
#ifdef _TIMINGS
               startTime = GetTime();
#endif
               eModule_LoadStrict(privateModule, "ecereCOM", privateAccess);
#ifdef _TIMINGS
               printf("Loading ecereCOM took %.3f seconds\n", GetTime() - startTime);
#endif
            }

#ifdef _TIMINGS
            startTime = GetTime();
#endif
            // LoadSymbols(symLocation, normalImport, true);
            LoadSymbols(symLocation, preDeclImport, false);
#ifdef _TIMINGS
            printf("Loading symbols took %.3f seconds\n", GetTime() - startTime);
#endif

            for(module = defines.first; module; module = next)
            {
               next = module.next;
               if(module.type == moduleDefinition && strcmpi(module.name, mainModuleName))
               {
                  delete module.name;
                  defines.Delete(module);
               }
            }
         }
      }
      if(!strcmp(extension, "ec") || !strcmp(extension, "eh"))
      {
         SetDefaultDeclMode(privateAccess);
         SetDeclMode(privateAccess);
      }
      else
      {
         SetDefaultDeclMode(defaultAccess);
         SetDeclMode(defaultAccess);
      }

      StripExtension(mainModuleName);
      module = ImportedModule { name = CopyString(mainModuleName), type = moduleDefinition };
      defines.AddName(module);

   #ifdef _DEBUG
      // SetYydebug(true);
   #endif
      resetScanner();

#ifdef _TIMINGS
      startTime = GetTime();
      startFindClass = checkTypeTotalTime;
#endif
      ParseEc();
#ifdef _TIMINGS
      printf("ParseEc took %.3f seconds, out of which %.3f seconds were in CheckType\n", GetTime() - startTime, checkTypeTotalTime - startFindClass);
#endif
      CheckDataRedefinitions();
      SetYydebug(false);

      SetIncludeDirs(null);
      SetSysIncludeDirs(null);

      delete editFile;
      fileInput = null;
      SetFileInput(null);

      if(GetAST())
      {
         ast = GetAST();

#ifdef _TIMINGS
         startTime = GetTime();
#endif
         PrePreProcessClassDefinitions();
         ComputeModuleClasses(privateModule);
         PreProcessClassDefinitions();
         ProcessClassDefinitions();
#ifdef _TIMINGS
         printf("Initial Passes took %.3f seconds\n", GetTime() - startTime);
         startTime = GetTime();
#endif

         ComputeDataTypes();
#ifdef _TIMINGS
         printf("ComputeDataTypes took %.3f seconds\n", GetTime() - startTime);
         startTime = GetTime();
#endif
         ProcessInstantiations();
#ifdef _TIMINGS
         printf("ProcessInstantiations took %.3f seconds\n", GetTime() - startTime);
#endif

         if(!strcmp(extension, "ec") || !strcmp(extension, "eh"))
         {
            Class windowClass = eSystem_FindClass(this.privateModule, "ecere::gui::Window");
            if(!windowClass || windowClass.internalDecl)
            {
#ifdef _TIMINGS
               startTime = GetTime();
#endif
               // *** COMMENTED THIS OUT DUE TO ecereCOM issues
               // eModule_Load(this.privateModule.application.allModules.first ? this.privateModule.application.allModules.first : this.privateModule, "ecere", privateAccess);
               eModule_Load(this.privateModule, "ecere", privateAccess);
#ifdef _TIMINGS
               printf("Loading ecere.dll took %.3f seconds\n", GetTime() - startTime);
#endif
            }
            windowClass = eSystem_FindClass(this.privateModule, "ecere::gui::Window");

            if(windowClass && windowClass.data)
               ApplySkin(windowClass, app.currentSkin.name, null);
         }

#ifdef _TIMINGS
         startTime = GetTime();
#endif
         for(external = ast->first; external; external = external.next)
         {
            if(external.type == classExternal)
            {
               ClassDefinition _class = external._class;
               if(_class.baseSpecs && _class.baseSpecs->first && ((Specifier)_class.baseSpecs->first).type == nameSpecifier ) // classSpecifier
               {
                  Class regClass = eSystem_FindClass(this.privateModule, ((Specifier)_class.baseSpecs->first).name);
                  if(regClass)
                  {
                     if(eClass_GetDesigner(regClass) && !GetBuildingEcereComModule())
                     {
                        Instance instance = eInstance_New(regClass);
                        ObjectInfo classObject
                        {
                           name = CopyString(_class._class.name);
                           instance = instance;
                           classDefinition = _class;
                           oClass = classObject;
                        };
                        classes.Add(classObject);

                        incref instance;

                        // Moved this at bottom so that the file dialog doesn't show up in eCom
                        designer.CreateObject(instance, classObject, true, null);
                        sheet.AddObject(classObject, classObject.name ? classObject.name : _class._class.name, typeClass, false);

                        if(_class.definitions)
                        {
                           ClassDef def;
                           ObjectInfo object;
                           for(def = _class.definitions->first; def; def = def.next)
                           {
                              switch(def.type)
                              {
                                 case defaultPropertiesClassDef:
                                 {
                                    MemberInit propDef;
                                    for(propDef = def.defProperties->first; propDef; propDef = propDef.next)
                                    {
                                       Identifier id = propDef.identifiers->first;
                                       if(id)
                                       {
                                          Property prop = eClass_FindProperty(regClass, id.string, this.privateModule);
                                          if(prop)
                                          {
                                             Class propertyClass = prop.dataTypeClass;
                                             if(!propertyClass)
                                                propertyClass = prop.dataTypeClass = eSystem_FindClass(this.privateModule, prop.dataTypeString);
                                             if(prop.compiled && prop.Set && prop.Get && propertyClass && propDef.initializer && propDef.initializer.type == expInitializer && propDef.initializer.exp)
                                             {
                                                Expression computed;
                                                bool variable = true;

                                                FreeType(propDef.initializer.exp.destType);
                                                propDef.initializer.exp.destType = MkClassType(propertyClass.name);
                                                ProcessExpressionType(propDef.initializer.exp);

                                                computed = CopyExpression(propDef.initializer.exp);
                                                ComputeExpression(computed);
                                                if(computed.isConstant)
                                                {
                                                   switch(computed.type)
                                                   {
                                                      case stringExp:
                                                         if(propertyClass.dataTypeString && strstr(propertyClass.dataTypeString, "char *"))
                                                         {
                                                            String temp = new char[strlen(computed.string)+1];
                                                            ReadString(temp, computed.string);
                                                            ((void (*)(void *, void *))(void *)prop.Set)(instance, temp);
                                                            delete temp;

                                                            if(!propDef.initializer.exp.intlString)
                                                            {
                                                               Map<String, bool> i18nStrings = classObject.i18nStrings;
                                                               if(!i18nStrings)
                                                                  classObject.i18nStrings = i18nStrings = { };
                                                               i18nStrings[prop.name] = false;
                                                            }
                                                            variable = false;
                                                         }
                                                         break;
                                                      case instanceExp:
                                                         if((propertyClass.type == structClass || propertyClass.type == noHeadClass || propertyClass.type == normalClass) && !id.next)
                                                         {
                                                            if(prop.Set)
                                                            {
                                                               if(computed.instance._class && computed.instance._class.symbol &&
                                                                  computed.instance._class.symbol.registered &&
                                                                  eClass_IsDerived(computed.instance._class.symbol.registered, propertyClass))
                                                               {
                                                                  ((void (*)(void *, void *))(void *)prop.Set)(instance, computed.instance.data);

                                                                  // This was saved in the control and shouldn't be freed by FreeExpression...
                                                                  // (Not doing this anymore, incrementing refCount in pass15 instead)
                                                                  /*if(propertyClass.type == normalClass)
                                                                     computed.instance.data = null;*/
                                                               }
                                                            }
                                                            variable = false;
                                                         }
                                                         break;
                                                      case constantExp:
                                                      {
                                                         Operand value = GetOperand(computed);
                                                         DataValue valueData;
                                                         valueData.i64 = value.i64;
                                                         SetProperty(prop, instance, valueData);
                                                         variable = false;
                                                         break;
                                                      }
                                                   }
                                                }
                                                if(variable)
                                                   propDef.variable = true;
                                                FreeExpression(computed);
                                             }
                                          }
                                          else
                                          {
                                             Method method = eClass_FindMethod(regClass, id.string, this.privateModule);
                                             if(method && method.type == virtualMethod && propDef.initializer && propDef.initializer.type == expInitializer &&
                                                propDef.initializer.exp && propDef.initializer.exp.type == identifierExp)
                                             {
                                                ClassDef def;
                                                // Maintain a list in FunctionDefinition of who is attached to it
                                                for(def = _class.definitions->first; def; def = def.next)
                                                {
                                                   if(def.type == functionClassDef && def.function.declarator)
                                                   {
                                                      ClassFunction function = def.function;
                                                      if(!strcmp(function.declarator.symbol.string, propDef.initializer.exp.identifier.string))
                                                      {
                                                         function.attached.Add(OldLink { data = method });
                                                      }
                                                   }
                                                }
                                             }
                                          }
                                       }
                                    }
                                    break;
                                 }
                                 case declarationClassDef:
                                 {
                                    Declaration decl = def.decl;
                                    switch(decl.type)
                                    {
                                       case instDeclaration:
                                       {
                                          Instantiation inst = decl.inst;
                                          Class instClass = eSystem_FindClass(this.privateModule, inst._class.name);
                                          if(instClass && eClass_GetDesigner(instClass))
                                          {
                                             Instance control = eInstance_New(instClass);
                                             if(control)
                                             {
                                                incref control;

                                                object = ObjectInfo
                                                {
                                                   oClass = classObject;
                                                   instance = control;
                                                   instCode = inst;
                                                };
                                                classObject.instances.Add(object);
                                                if(inst.exp)
                                                   // TOCHECK: Why is this needed now?
                                                   object.name = CopyString((inst.exp.type == memberExp) ? inst.exp.member.member.string : inst.exp.identifier.string);
                                                def.object = object;

                                                // if(object.name) { symbol = eList_Add(&curContext.symbols, sizeof(Symbol)); symbol.string = object.name; symbol.type = MkClassType(instClass.name); }

                                                designer.CreateObject(control, object, false, classObject.instance);
                                                sheet.AddObject(object, object.name ? object.name : inst._class.name, typeData, false);
                                             }
                                          }
                                          break;
                                       }
                                    }
                                    break;
                                 }
                              }
                           }

                           // Second pass, process instantiation members
                           object = null;
                           for(def = _class.definitions->first; def; def = def.next)
                           {
                              switch(def.type)
                              {
                                 case declarationClassDef:
                                 {
                                    Declaration decl = def.decl;
                                    switch(decl.type)
                                    {
                                       case instDeclaration:
                                       {
                                          Instantiation inst = decl.inst;
                                          Class instClass = eSystem_FindClass(this.privateModule, inst._class.name);
                                          if(instClass && eClass_GetDesigner(instClass) && ((object && object.next) || (!object && classObject.instances.first)))
                                          {
                                             Instance control;
                                             object = object ? object.next : classObject.instances.first;
                                             control = object.instance;

                                             if(inst.members)
                                             {
                                                MembersInit members;
                                                for(members = inst.members->first; members; members = members.next)
                                                {
                                                   switch(members.type)
                                                   {
                                                      case dataMembersInit:
                                                      {
                                                         if(members.dataMembers)
                                                         {
                                                            MemberInit member;
                                                            DataMember curMember = null;
                                                            Class curClass = null;
                                                            DataMember subMemberStack[256];
                                                            int subMemberStackPos = 0;

                                                            for(member = members.dataMembers->first; member; member = member.next)
                                                            {
                                                               bool found = false;
                                                               Identifier ident = member.identifiers ? member.identifiers->first : null;
                                                               if(ident)
                                                               {
                                                                  DataMember _subMemberStack[256];
                                                                  int _subMemberStackPos = 0;
                                                                  DataMember thisMember = (DataMember)eClass_FindDataMember(instClass, ident.string, privateModule, _subMemberStack, &_subMemberStackPos);

                                                                  if(!thisMember)
                                                                  {
                                                                     thisMember = (DataMember)eClass_FindProperty(instClass, ident.string, privateModule);
                                                                  }
                                                                  if(thisMember && thisMember.memberAccess == publicAccess)
                                                                  {
                                                                     curMember = thisMember;
                                                                     curClass = curMember._class;
                                                                     memcpy(subMemberStack, _subMemberStack, sizeof(DataMember) * _subMemberStackPos);
                                                                     subMemberStackPos = _subMemberStackPos;
                                                                     found = true;
                                                                  }
                                                               }
                                                               else
                                                               {
                                                                  eClass_FindNextMember(instClass, &curClass, (DataMember *)&curMember, subMemberStack, &subMemberStackPos);
                                                                  if(curMember) found = true;
                                                               }
                                                               if(found && curMember.isProperty)
                                                               {
                                                                  Property prop = (Property) curMember;
                                                                  Class propertyClass = prop.dataTypeClass;
                                                                  bool variable = true;
                                                                  if(!propertyClass)
                                                                     propertyClass = prop.dataTypeClass = eSystem_FindClass(this.privateModule, prop.dataTypeString);

                                                                  if(prop.compiled && prop.Set && prop.Get && propertyClass && member.initializer && member.initializer.type == expInitializer && member.initializer.exp)
                                                                  {
                                                                     FreeType(member.initializer.exp.destType);
                                                                     member.initializer.exp.destType = MkClassType(propertyClass.name);
                                                                     if(propertyClass)
                                                                     {
                                                                        Expression computed;

                                                                        ProcessExpressionType(member.initializer.exp);

                                                                        computed = CopyExpression(member.initializer.exp);
                                                                        if(computed)
                                                                        {
                                                                           bool isClass = propertyClass.type == structClass || propertyClass.type == normalClass || propertyClass.type == noHeadClass;
                                                                           {
#ifdef _DEBUG
                                                                              /*char debugExpString[4096];
                                                                              debugExpString[0] = '\0';
                                                                              PrintExpression(member.initializer.exp, debugExpString);*/
#endif
                                                                              ComputeExpression(computed);

                                                                              switch(computed.type)
                                                                              {
                                                                                 case instanceExp:
                                                                                    if(isClass && computed.isConstant && computed.instance.data)
                                                                                    {
                                                                                       if(computed.instance._class && computed.instance._class.symbol &&
                                                                                          computed.instance._class.symbol.registered &&
                                                                                          eClass_IsDerived(computed.instance._class.symbol.registered, propertyClass))
                                                                                       {
                                                                                          ((void (*)(void *, void *))(void *)prop.Set)(control, computed.instance.data);

                                                                                          // This was saved in the control and shouldn't be freed by FreeExpression...
                                                                                          // (Not doing this anymore, incrementing refCount in pass15 instead)
                                                                                          /*if(propertyClass.type == normalClass)
                                                                                             computed.instance.data = null;*/
                                                                                       }
                                                                                       variable = false;
                                                                                    }
                                                                                    break;
                                                                                 case identifierExp:
                                                                                    if(isClass && eClass_GetDesigner(propertyClass))
                                                                                    //if(prop.Set)
                                                                                    {
                                                                                       char * name = computed.identifier.string;
                                                                                       if(!strcmp(name, "this"))
                                                                                       {
                                                                                          if(prop.Set)
                                                                                             ((void (*)(void *, void *))(void *)prop.Set)(control, instance);
                                                                                          variable = false;
                                                                                       }
                                                                                       else
                                                                                       {
                                                                                          ObjectInfo check;
                                                                                          for(check = classObject.instances.first; check; check = check.next)
                                                                                             if(check.name && !strcmp(name, check.name))
                                                                                             {
                                                                                                if(prop.Set)
                                                                                                   ((void (*)(void *, void *))(void *)prop.Set)(control, check.instance);
                                                                                                variable = false;
                                                                                                break;
                                                                                             }
                                                                                       }
                                                                                    }
                                                                                    break;
                                                                                 case memberExp:
                                                                                    if(isClass)
                                                                                    {
                                                                                       if(computed.member.exp.type == identifierExp)
                                                                                       {
                                                                                          char * name = computed.member.exp.identifier.string;
                                                                                          ObjectInfo check;
                                                                                          if(!strcmp(name, "this"))
                                                                                          {
                                                                                             if(computed.member.member)
                                                                                             {
                                                                                                char * name = computed.member.member.string;
                                                                                                ObjectInfo check;
                                                                                                for(check = classObject.instances.first; check; check = check.next)
                                                                                                   if(check.name && !strcmp(name, check.name))
                                                                                                   {
                                                                                                      if(prop.Set)
                                                                                                         ((void (*)(void *, void *))(void *)prop.Set)(control, check.instance);
                                                                                                      variable = false;
                                                                                                      break;
                                                                                                   }
                                                                                             }
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                             for(check = classObject.instances.first; check; check = check.next)
                                                                                             {
                                                                                                if(check.name && !strcmp(name, check.name))
                                                                                                {
                                                                                                   Property getProperty = eClass_FindProperty(check.instance._class, computed.member.member.string, this.privateModule);
                                                                                                   if(getProperty)
                                                                                                   {
                                                                                                      DataValue value { };
                                                                                                      GetProperty(getProperty, check.instance, &value);
                                                                                                      SetProperty(prop, control, value);
                                                                                                      variable = false;
                                                                                                   }
                                                                                                   break;
                                                                                                }
                                                                                             }
                                                                                          }
                                                                                       }
                                                                                    }
                                                                                    break;
                                                                                 case stringExp:
                                                                                    if(propertyClass.dataTypeString && strstr(propertyClass.dataTypeString, "char *"))
                                                                                    {
                                                                                       String temp = new char[strlen(computed.string)+1];
                                                                                       ReadString(temp, computed.string);
                                                                                       ((void (*)(void *, void *))(void *)prop.Set)(control, temp);
                                                                                       delete temp;

                                                                                       if(!member.initializer.exp.intlString)
                                                                                       {
                                                                                          Map<String, bool> i18nStrings = object.i18nStrings;
                                                                                          if(!i18nStrings)
                                                                                             object.i18nStrings = i18nStrings = { };
                                                                                          i18nStrings[prop.name] = false;
                                                                                       }

                                                                                       variable = false;
                                                                                    }
                                                                                    break;
                                                                                 case constantExp:
                                                                                    if(!isClass && computed.isConstant)
                                                                                    {
                                                                                       if(!strcmp(propertyClass.dataTypeString, "float"))
                                                                                          ((void (*)(void *, float))(void *)prop.Set)(control, (float)strtod(computed.constant, null));
                                                                                       else if(!strcmp(propertyClass.dataTypeString, "double"))
                                                                                          ((void (*)(void *, double))(void *)prop.Set)(control, strtod(computed.constant, null));
                                                                                       else
                                                                                          ((void (*)(void *, int))(void *)prop.Set)(control, strtol(computed.constant, null, 0));
                                                                                       variable = false;
                                                                                    }
                                                                                    break;
                                                                              }
                                                                           }
                                                                        }
                                                                        FreeExpression(computed);
                                                                     }
                                                                  }
                                                                  if(variable)
                                                                     member.variable = true;
                                                               }
                                                               else if(ident && member.initializer && member.initializer.type == expInitializer && member.initializer.exp &&
                                                                  member.initializer.exp.type == memberExp) // identifierExp
                                                               {
                                                                  Method method = eClass_FindMethod(instClass, ident.string, this.privateModule);
                                                                  if(method && method.type == virtualMethod)
                                                                  {
                                                                     ClassDef def;
                                                                     // Maintain a list in FunctionDefinition of who is attached to it
                                                                     for(def = _class.definitions->first; def; def = def.next)
                                                                     {
                                                                        if(def.type == functionClassDef && def.function.declarator)
                                                                        {
                                                                           ClassFunction function = def.function;
                                                                           Identifier id = (member.initializer.exp.type == memberExp) ? member.initializer.exp.member.member : member.initializer.exp.identifier;
                                                                           if(!strcmp(function.declarator.symbol.string, id.string))
                                                                           {
                                                                              function.attached.Add(OldLink { data = method });
                                                                              // Reference this particular instance?
                                                                           }
                                                                        }
                                                                     }
                                                                  }
                                                               }
                                                               id++;
                                                            }
                                                         }
                                                         break;
                                                      }
                                                   }
                                                }
                                             }

                                             designer.PostCreateObject(object.instance, object, false, classObject.instance);
                                             break;
                                          }
                                       }
                                       break;
                                    }
                                 }
                              }
                           }
                        }

                        //designer.CreateObject(instance, classObject, true, null);
                        //sheet.AddObject(classObject, classObject.name ? classObject.name : _class._class.name, classType, false);

                        designer.PostCreateObject(instance, classObject, true, null);

                        //instance.state = Hidden;
                        //instance.Create();
                        //instance.SetState(Normal, true, 0);
                     }
                  }
               }
            }
         }

         SetAST(null);
#ifdef _TIMINGS
         printf("Class/Instance Processing took %.3f seconds\n", GetTime() - startTime);
#endif
      }

      // Restore Selection
      if(selectedClassName)
      {
         ObjectInfo oClass;
         for(oClass = classes.first; oClass; oClass = oClass.next)
         {
            if(!strcmp(oClass.name, selectedClassName))
            {
               this.oClass = oClass;
               break;
            }
         }
         delete selectedClassName;
      }
      if(this.oClass)
      {
         if(selectedName)
         {
            ObjectInfo check;

            for(check = this.oClass.instances.first; check; check = check.next)
            {
               if(check.name && !strcmp(check.name, selectedName))
               {
                  this.selected = check;
                  break;
               }
            }
            if(!check)
            {
               if(this.oClass.instances.first)
                  this.selected = this.oClass.instances.first;
               else
                  this.selected = this.oClass;
            }
         }
         else if(selectedPos == -1 || !this.oClass.instances.count)
            this.selected = this.oClass;
         else
         {
            ObjectInfo check;
            int pos = 0;

            if(selectedPos > this.oClass.instances.count)
               selectedPos = 0;
            for(check = this.oClass.instances.first; check; check = check.next)
            {
               if(selectedPos == pos++)
               {
                  this.selected = check;
                  break;
               }
            }
         }
      }
      else
      {
         this.oClass = classes.first;
         this.selected = (this.oClass && this.oClass.instances.first) ? this.oClass.instances.first : this.oClass;
      }
      delete selectedName;
      SetSymbolsDir(null);

      if(sheet.codeEditor == this)
         sheet.SelectObject(selected);
      Update(null);

      codeModified = false;

      // TESTING THIS TO NOT GET EMPTY PARAMETERS
      if(paramsShown)
      {
         InvokeParameters(false, false, false);
      }

      editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

      reentrant = false;

      updatingCode--;

      ChangeWorkingDir(oldWorkDir);
#ifdef _TIMINGS
      printf("Total FindClass time is %.3f seconds, out of which %.3f is in Ignore NS\n\n", findClassTotalTime, findClassIgnoreNSTotalTime);
      printf("Total CheckType time is %.3f seconds\n\n", checkTypeTotalTime);
      printf("Total MkExternalImport time is %.3f seconds\n\n", externalImportTotalTime);
      printf("Total FindSymbol time is %.3f seconds\n\n", findSymbolTotalTime);
      // printf("Total Class Members Find time is %.3f seconds\n\n", GetClassFindTime());

      printf("Whole ParseCode function took %.3f seconds\n\n", GetTime() - parseCodeStart);
#endif
      if(inUseDebug && ide.projectView)
         ide.debugger.EvaluateWatches();

      delete pathBackup;
   }

   void UpdateInstanceCodeClass(Class _class, ObjectInfo object, EditBoxStream f, Instance test, bool * prev, bool * lastIsMethod, DataMember * curMember, Class * curClass)
   {
      Property propIt;
      Window control = (Window)object.instance;
      ObjectInfo classObject = object.oClass;

      if(_class.base && _class.base.type != systemClass) UpdateInstanceCodeClass(_class.base, object, f, test, prev, lastIsMethod, curMember, curClass);

      if(!strcmp(_class.name, "DesignerBase")) return;

      for(propIt = _class.membersAndProperties.first; propIt; propIt = propIt.next)
      {
         Property prop = eClass_FindProperty(object.instance._class, propIt.name, privateModule);
         if(prop && prop.isProperty && !prop.conversion && eClass_FindProperty(object.instance._class, prop.name, privateModule))
         {
            if(prop.Set && prop.Get && prop.dataTypeString && strcmp(prop.name, "name") && !Code_IsPropertyDisabled(object, prop.name) &&
               prop.compiled && (!prop.IsSet || prop.IsSet(control)))
            {
               Class dataType = prop.dataTypeClass;
               if(!dataType)
                  dataType = prop.dataTypeClass = eSystem_FindClass(this.privateModule, prop.dataTypeString);

               if(dataType)
               {
                  if(dataType.type == structClass)
                  {
                     void * dataForm = new0 byte[dataType.structSize];
                     void * dataTest = new0 byte[dataType.structSize];

                     ((void (*)(void *, void *))(void *)prop.Get)(control, dataForm);
                     ((void (*)(void *, void *))(void *)prop.Get)(test, dataTest);

                     if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
                     {
                        char tempString[1024] = "";
                        const char * string = "";
                        bool needClass = true;
                        if(*prev)
                           f.Printf(", ");

                        ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);

                        string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, dataForm, tempString, null, &needClass);

                        eClass_FindNextMember(_class, curClass, curMember, null, null);
                        if(*curMember != (DataMember)prop)
                           f.Printf("%s = ", prop.name);

                        *curMember = (DataMember)prop;
                        *curClass = curMember->_class;

                        if(needClass)
                           f.Printf("%c %s %c", /*dataType.name, */OpenBracket, string, CloseBracket);
                        else
                           f.Printf("%s", string);
                        *prev = true;
                     }

                     delete dataForm;
                     delete dataTest;
                  }
                  else if(dataType.type == normalClass || dataType.type == noHeadClass)
                  {
                     void * dataForm, * dataTest;
                     bool isEditBoxContents = false;
                     bool freeDataForm = false, freeDataTest = false;

                     // Because contents property is broken for mutiline EditBox at the moment
                     if(!strcmp(prop.name, "contents") && !strcmp(prop._class.name, "EditBox"))
                        isEditBoxContents = true;

                     if(isEditBoxContents && ((EditBox)control).multiLine)
                     {
                        dataForm = ((EditBox)control).multiLineContents;
                        freeDataForm = true;
                     }
                     else
                        dataForm = ((void *(*)(void *))(void *)prop.Get)(control);
                     if(isEditBoxContents && ((EditBox)test).multiLine)
                     {
                        dataTest = ((EditBox)test).multiLineContents;
                        freeDataTest = true;
                     }
                     else
                        dataTest = ((void *(*)(void *))(void *)prop.Get)(test);

                     if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
                     {
                        char tempString[1024] = "";
                        const char * string = "";
                        if(*prev)
                           f.Printf(", ");

                        ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);

                        eClass_FindNextMember(_class, curClass, curMember, null, null);
                        if(*curMember != (DataMember)prop)
                           f.Printf("%s = ", prop.name);
                        *curMember = (DataMember)prop;
                        *curClass = curMember->_class;

                        if(eClass_GetDesigner(dataType))
                        {
                           if(eClass_IsDerived(classObject.instance._class, dataType) && classObject.instance == dataForm)
                           //if(!strcmp(classObject.instance._class.name, dataType.name) && classObject.instance == dataForm)
                              f.Printf("this", prop.name);
                           else
                           {
                              //ObjectInfo classObject;
                              //for(classObject = classes.first; classObject; classObject = classObject.next)
                              {
                                 ObjectInfo object;

                                 for(object = classObject.instances.first; object; object = object.next)
                                 {
                                    if(!object.deleted && eClass_IsDerived(object.instance._class, dataType) && object.instance == dataForm && object.name)
                                    {
                                       f.Printf("%s", object.name);
                                       break;
                                    }
                                 }

                                 if(!object)
                                 {
                                    bool needClass = true;
                                    string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, dataForm, tempString, null, &needClass);
                                    f.Printf("%s", string);
                                 }
                              }
                           }
                        }
                        else
                        {
                           bool needClass = true;
                           string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, dataForm, tempString, null, &needClass);

                           if(!strcmp(dataType.dataTypeString, "char *"))
                           {
                              Map<String, bool> i18nStrings = object.i18nStrings;
                              bool i18n = true;
                              if(i18nStrings && i18nStrings.GetAtPosition(prop.name, false, null))
                                 i18n = false;

                              f.Printf("%s\"", i18n ? "$" : "");
                              OutputString(f, string);
                              f.Puts("\"");
                           }
                           else if(needClass)
                              f.Printf("%c %s %c", /*dataType.name, */OpenBracket, string, CloseBracket);
                           else
                              f.Printf("%s", string);
                        }
                        *prev = true;
                        *lastIsMethod = false;
                     }

                     if(freeDataForm) delete dataForm;
                     if(freeDataTest) delete dataTest;
                  }
                  else
                  {
                     DataValue dataForm, dataTest;

                     GetProperty(prop, control, &dataForm);
                     GetProperty(prop, test, &dataTest);

                     if((prop.IsSet && !prop.IsSet(test)) || ((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, &dataForm, &dataTest))
                     {
                        char * string = null;
                        char tempString[1024] = "";
                        SetProperty(prop, test, dataForm);

                        if(dataType.type != bitClass)
                        {
                           bool needClass = true;

                           if(dataType.type == enumClass)
                           {
                              NamedLink64 value;
                              Class enumClass = eSystem_FindClass(privateModule, "enum");
                              EnumClassData e = ACCESS_CLASSDATA(dataType, enumClass);
                              int64 i64Value = GetI64EnumValue(dataType, dataForm);

                              for(value = e.values.first; value; value = value.next)
                              {
                                 if(value.data == i64Value)
                                 {
                                    string = value.name;
                                    break;
                                 }
                              }
                           }
                           else
                              string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, &dataForm, tempString, null, &needClass);

                           if(string && string[0])
                           {
                              if(*prev)
                                 f.Printf(", ");

                              eClass_FindNextMember(_class, curClass, curMember, null, null);
                              if(*curMember != (DataMember)prop)
                                 f.Printf("%s = ", prop.name);
                              *curMember = (DataMember)prop;
                              *curClass = curMember->_class;

                              if(!strcmp(dataType.dataTypeString, "float") && strchr(string, '.'))
                                 f.Printf("%sf", string);
                              else
                                 f.Printf("%s", string);
                              *prev = true;
                           }
                        }
                        else if(dataType.type == bitClass)
                        {
                           bool needClass = true;

                           if(*prev) f.Printf(", ");

                           eClass_FindNextMember(_class, curClass, curMember, null, null);
                           if(*curMember != (DataMember)prop)
                              f.Printf("%s = ", prop.name);
                           *curMember = (DataMember)prop;
                           *curClass = curMember->_class;

                           string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, &dataForm.ui, tempString, null, &needClass);
                           if(needClass)
                              f.Printf("%c %s %c", /*dataType.name, */OpenBracket, string, CloseBracket);
                           else
                              f.Printf("%s", string);
                           *prev = true;
                           *lastIsMethod = false;
                        }
                     }
                  }
               }
            }
         }
      }
   }

   int UpdateInstanceCode(EditBoxStream f, int position, Class regClass, ObjectInfo object, bool * firstObject, char ** text, int * textSize, int movedFuncIdLen, int movedFuncIdPos)
   {
      Instantiation inst = object.instCode;
      Window control = (Window)object.instance;
      bool prev = false;
      bool methodPresent = false;
      bool lastIsMethod = true;

      if(inst)
      {
         if(object.deleted)
         {
            // Instance removed, delete it
            DeleteJunkBefore(f, inst.loc.start.pos, &position);

            f.DeleteBytes(inst.loc.end.pos - inst.loc.start.pos + 1);
            position = inst.loc.end.pos + 1;
         }
         else
         {
            bool multiLine = false;

            // Change the name
            // Check if it's an unnamed instance
            if(inst.exp)
            {
               f.Seek(inst.nameLoc.start.pos - position, current);
               f.DeleteBytes(inst.nameLoc.end.pos - inst.nameLoc.start.pos);
               position = inst.nameLoc.end.pos;
               if(object.name)
                  f.Printf(object.name);
               else
               {
                  char ch = 0;
                  f.Getc(&ch);
                  if(isspace(ch) && ch != '\n')
                  {
                     f.Seek(-1, current);
                     f.DeleteBytes(1);
                     position ++;
                  }
               }
            }
            else
            {
               int pos = inst.loc.start.pos; // + strlen(inst._class.name);
               char ch;
               f.Seek(pos - position, current);
               while(f.Getc(&ch))
               {
                  if(isspace(ch))
                  {
                     f.Seek(-1, current);
                     break;
                  }
                  pos++;
               }

               if(object.name)
               {
                  f.Puts(" ");
                  f.Puts(object.name);
               }
               position = pos;
            }

            if((this.methodAction == actionAddMethod || this.moveAttached) && this.selected == object)
               methodPresent = true;

            for(;;)
            {
               char ch = 0;
               if(!f.Getc(&ch))
                  break;
               position++;
               if(ch == OpenBracket)
                  break;
               if(ch == '\n')
                  multiLine = true;
            }

            // TODO: Simplify this?
            if(methodPresent)
            {
               if(!multiLine)
               {
                  int count = 0;
                  int toDelete = 0;
                  //int toAdd = 0;

                  f.Seek(-1, current);
                  DeleteJunkBefore(f, position, &position);
                  f.Puts("\n   ");
                  f.Seek(1, current);
                  //f.Puts("\n");

                  // Fix indentation
                  for(;;)
                  {
                     char ch = 0;
                     if(!f.Getc(&ch))
                        break;
                     position++;
                     if(ch == '\n') { toDelete = count; count = 0; }
                     else if(isspace(ch)) count++;
                     else
                     {
                        f.Seek(-1, current);
                        position--;
                        if(count > 6)
                        {
                           toDelete += count - 6;
                           count = 6;
                        }
                        /*else
                           toAdd = 6 - count;*/
                        break;
                     }
                  }
                  if(toDelete)
                  {
                     f.Seek(-toDelete-count, current);
                     f.DeleteBytes(toDelete);
                     f.Seek(count, current);
                  }

                  DeleteJunkBefore(f, position, &position);

                  // Removed this here as it was adding trailing spaces when adding a method
                  /*
                  if(toAdd)
                  {
                     int c;
                     for(c = 0; c<toAdd; c++)
                        f.Putc(' ');
                  }
                  */
               }
            }
            else
               methodPresent = multiLine;

            //if(!prev) -- always false
               f.Printf(methodPresent ? "\n      " : " ");
         }
      }
      else
      {
         // Instance not there, create a brand new one
         DeleteJunkBefore(f, position, &position);
         f.Printf(*firstObject ? "\n\n" : "\n");
         *firstObject = false;

         if((this.methodAction == actionAddMethod || this.moveAttached) && this.selected == object)
            methodPresent = true;

         if(methodPresent)
         {
            if(object.name)
               f.Printf("   %s %s\n   %c\n      ", control._class.name, object.name, OpenBracket);
            else
               f.Printf("   %s\n   %c\n      ", control._class.name, OpenBracket);
         }
         else
         {
            if(object.name)
               f.Printf("   %s %s %c ", control._class.name, object.name, OpenBracket);
            else
               f.Printf("   %s %c ", control._class.name, OpenBracket);
         }
      }

      if(!object.deleted)
      {
         Instance test = eInstance_New(control._class);
         DataMember curMember = null;
         Class curClass = null;
         incref test;

         UpdateInstanceCodeClass(control._class, object, f, test, &prev, &lastIsMethod, &curMember, &curClass);

         delete test;

         // Attach Method here
         if((this.methodAction == actionAttachMethod || this.methodAction == actionReattachMethod) && !this.moveAttached && this.selected == object)
         {
            if(prev) f.Printf(", ");
            f.Printf("%s = %s", this.method.name, function.declarator.symbol.string);
            prev = true;
         }
      }

      if(inst && !object.deleted)
      {
         MembersInit members;
         Class instClass = eSystem_FindClass(this.privateModule, inst._class.name);

         DeleteJunkBefore(f, position, &position);

         // Instance already there, clear out the properties
         for(members = inst.members ? inst.members->first : null; members; members = members.next)
         {
            if(members.type == dataMembersInit)
            {
               MemberInit member;

               if(members.dataMembers)
               {
                  bool keptMember = false;
                  MemberInit lastKept = null;

                  for(member = members.dataMembers->first; member; member = member.next)
                  {
                     Identifier ident = member.identifiers ? member.identifiers->first : null;
                     bool deleted = false;

                     // For now delete if it's not a method
                     if(!member.variable) // && ident)
                     {
                        if(!ident || !ident.next)
                        {
                           Property prop = ident ? eClass_FindProperty(instClass, ident.string, this.privateModule) : null;
                           if(!ident || prop)
                           {
                              f.Seek(member.loc.start.pos - position, current);
                              f.DeleteBytes(member.loc.end.pos - member.loc.start.pos);
                              position = member.loc.end.pos;
                              deleted = true;
                           }
                           else
                           {
                              Method method = eClass_FindMethod(instClass, ident.string, this.privateModule);
                              if(method && method.type == virtualMethod && member.initializer && member.initializer.type == expInitializer && member.initializer.exp &&
                                 member.initializer.exp.type == memberExp /*ExpIdentifier*/)
                              {
                                 if(((this.methodAction == actionDetachMethod || this.methodAction == actionReattachMethod) && this.method == method && this.selected == object) ||
                                    (this.methodAction == actionDeleteMethod && function.declarator && !strcmp(function.declarator.symbol.string, member.initializer.exp.identifier.string)))
                                 {
                                    f.Seek(member.loc.start.pos - position, current);
                                    f.DeleteBytes(member.loc.end.pos - member.loc.start.pos);
                                    position = member.loc.end.pos;
                                    deleted = true;
                                 }
                              }
                           }
                        }
                     }
                     if(!deleted)
                     {
                        keptMember = true;
                        lastKept = member;

                        //f.Seek(member.loc.start.pos - position, current);
                        //position = member.loc.start.pos;
                        DeleteJunkBefore(f, member.loc.start.pos, &position);
                        if(prev) f.Printf(", ");
                        else if(keptMember) f.Printf(" ");
                        prev = false;
                     }
                  }

                  if(!keptMember || !members.next)
                  {
                     char ch = 0;

                     if(keptMember && lastKept != members.dataMembers->last)
                     {
                        // Delete the comma
                        char ch;
                        int count = 0;
                        f.Seek(-1, current);
                        for(;f.Getc(&ch);)
                        {
                           if(ch == ',')
                           {
                              count++;
                              f.Seek(-1, current);
                              break;
                           }
                           else if(!isspace(ch))
                              break;
                           f.Seek(-2, current);
                           count++;
                        }

                        if(ch == ',')
                           f.DeleteBytes(count);
                     }

                     f.Seek(members.loc.end.pos - position, current);
                     f.Getc(&ch);

                     if(ch == ';')
                     {
                        f.Seek(-1, current);
                        f.DeleteBytes(1);
                        position = members.loc.end.pos + 1;
                     }
                     else
                     {
                        f.Seek(-1, current);
                        position = members.loc.end.pos;
                     }

                     if(keptMember)
                     {
                        prev = true;
                        lastIsMethod = false;
                     }
                  }
                  else
                  {
                     DeleteJunkBefore(f, position, &position);
                     f.Printf(" ");

                     if(lastKept != members.dataMembers->last)
                     {
                        // Delete the comma
                        char ch;
                        int count = 0;
                        f.Seek(-1, current);
                        for(;f.Getc(&ch);)
                        {
                           if(ch == ',')
                           {
                              count++;
                              f.Seek(-1, current);
                              break;
                           }
                           else if(!isspace(ch))
                              break;
                           f.Seek(-2, current);
                           count++;
                        }

                        if(ch == ',')
                           f.DeleteBytes(count);
                     }
                     else
                     {
                        f.Seek(members.loc.end.pos - position, current);
                        position = members.loc.end.pos;
                     }
                     /*
                     prev = false;
                     lastIsMethod = true;
                     */
                     prev = true;
                     lastIsMethod = false;

                  }
               }
               else
               {
                  f.Seek(members.loc.end.pos - position, current);
                  position = members.loc.end.pos;
                  prev = false;
                  lastIsMethod = true;
               }
            }
            else if(members.type == methodMembersInit)
            {
               if(this.methodAction == actionDeleteMethod && members.function == function);
               else
                  methodPresent = true;

               // Delete instance method here
               if((this.methodAction == actionDeleteMethod || (this.methodAction == actionDetachMethod && this.moveAttached)) &&
                  members.function == function)
               {
                  if(this.moveAttached && !*text)
                     GetLocText(editBox, f, position, &function.loc, text, textSize, Max((int)strlen(this.methodName) - movedFuncIdLen,0), 0);

                  DeleteJunkBefore(f, members.loc.start.pos, &position);
                  f.DeleteBytes(members.loc.end.pos - members.loc.start.pos + 1);
                  position = members.loc.end.pos + 1;
                  f.Printf("\n");
               }
               else
               {
                  DeleteJunkBefore(f, position, &position);
                  if(!lastIsMethod)
                     f.Printf(";");

                  DeleteJunkBefore(f, members.loc.start.pos, &position);
                  lastIsMethod = true;
                  f.Printf("\n\n      ");
               }

               f.Seek(members.loc.end.pos - position, current);
               position = members.loc.end.pos;
            }
            DeleteJunkBefore(f, position, &position);
         }
      }

      if(!object.deleted)
      {
         if(!methodPresent)
            f.Printf(" ");

         if((this.methodAction == actionAddMethod || (this.moveAttached && (this.methodAction == actionAttachMethod || this.methodAction == actionReattachMethod))) && this.selected == object)
         {
            Method method = this.method;
            DeleteJunkBefore(f, position, &position);
            if(!lastIsMethod)
               f.Printf(";");

            f.Printf("\n");

            if(!method.dataType)
               method.dataType = ProcessTypeString(method.dataTypeString, false);

            {
               Type dataType = method.dataType;
               Type returnType = dataType.returnType;
               Type param;

               if(this.moveAttached)
               {
                  // Move function here:
                  int newLen = strlen(method.name);

                  f.Printf("\n   ");

                  if(!*text)
                     GetLocText(editBox, f, position, &function.loc, text, textSize, Max(newLen - movedFuncIdLen, 0), 3);

                  // First change name of function
                  memmove(*text + movedFuncIdPos + newLen, *text + movedFuncIdPos + movedFuncIdLen, *textSize - movedFuncIdPos - movedFuncIdLen + 1);
                  *textSize += newLen - movedFuncIdLen;
                  memcpy(*text + movedFuncIdPos, method.name, newLen);

                  // Second, tab right
                  {
                     int c;
                     for(c = 0; (*text)[c]; )
                     {
                        int i;
                        for(i = c; (*text)[i] && (*text)[i] != '\n'; i++);
                        if(i != c)
                        {
                           memmove((*text)+c+3, (*text)+c, *textSize+1-c);
                           (*text)[c] = (*text)[c+1] = (*text)[c+2] = ' ';
                           c += 3;
                           *textSize += 3;
                        }
                        for(; (*text)[c] && (*text)[c] != '\n'; c++);
                        if((*text)[c]) c++;
                     }
                  }

                  f.Puts((*text));
                  f.Printf("\n");
               }
               else
               {
                  // Class moduleClass = eSystem_FindClass(this.privateModule, "Module");

                  // ADDING METHOD HERE
                  f.Printf("\n      ");
                  OutputType(f, returnType, false);

                  f.Printf(" ");
                  if(dataType.thisClass)
                  {
                     if(!eClass_IsDerived(regClass, dataType.thisClass.registered) && !dataType.classObjectType)     // Just fixed this... was backwards.
                     {
                        if(dataType.thisClass.shortName)
                           f.Printf(dataType.thisClass.shortName);
                        else
                           f.Printf(dataType.thisClass.string);
                        f.Printf("::");
                     }
                  }
                  f.Printf(method.name);
                  f.Printf("(");
                  for(param = dataType.params.first; param; param = param.next)
                  {
                     OutputType(f, param, true);
                     if(param.next)
                        f.Printf(", ");
                  }
                  f.Printf(")\n");
                  f.Printf("      %c\n\n", OpenBracket);

                  if(control._class._vTbl[method.vid] == null /*moduleClass._vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Module_OnLoad]*/) // Temp Check for DefaultFunction
                  {
                     if(returnType.kind == classType && !strcmp(returnType._class.string, "bool"))
                        f.Printf("         return true;\n");
                     else if(returnType.kind != voidType)
                        f.Printf("         return 0;\n");
                  }
                  else
                  {
                     f.Printf("         ");
                     if(returnType.kind != voidType)
                        f.Printf("return ");
                     f.Printf("%s::%s(", control._class.name, method.name);
                     for(param = dataType.params.first; param; param = param.next)
                     {
                        if(param.prev) f.Printf(", ");
                        if(param.kind != voidType)
                           f.Printf(param.name);
                     }
                     f.Printf(");\n");
                  }
                  f.Printf("      %c\n", CloseBracket);
               }
            }
         }
      }

      if(!object.instCode)
         f.Printf(methodPresent ? "   %c;" : "%c;", CloseBracket);
      else if(!object.deleted)
      {
         // Turn this into a multiline instance when adding a method
         DeleteJunkBefore(f, inst.loc.end.pos-1, &position);

         f.Printf(methodPresent ? "\n   " : " ");

         f.Seek(inst.loc.end.pos + 1 - position, current);
         position = inst.loc.end.pos + 1;
      }
      return position;
   }

   void OutputClassProperties(Class _class, ObjectInfo classObject, EditBoxStream f, Instance test)
   {
      Property propIt;
      Class regClass = eSystem_FindClass(privateModule, classObject.name);

      if(_class.base && _class.base.type != systemClass) OutputClassProperties(_class.base, classObject, f, test);

      for(propIt = _class.membersAndProperties.first; propIt; propIt = propIt.next)
      {
         Property prop = eClass_FindProperty(selected.instance._class, propIt.name, privateModule);
         if(prop && prop.isProperty && !prop.conversion)
         {
            if(prop.Set && prop.Get && prop.dataTypeString && strcmp(prop.name, "name") && !Code_IsPropertyDisabled(classObject, prop.name) &&
               (!prop.IsSet || prop.IsSet(classObject.instance)))
            {
               Class dataType = prop.dataTypeClass;
               char tempString[1024] = "";
               char * string = null;
               bool specify = false;
               DataMember member;

               member = eClass_FindDataMember(regClass, prop.name, privateModule, null, null);
               if(member && member._class == regClass)
                  specify = true;

               if(!dataType)
                  dataType = prop.dataTypeClass = eSystem_FindClass(this.privateModule, prop.dataTypeString);

               if(dataType && dataType.type == structClass)
               {
                  void * dataForm = new0 byte[dataType.structSize];
                  void * dataTest = new0 byte[dataType.structSize];

                  ((void (*)(void *, void *))(void *)prop.Get)(classObject.instance, dataForm);
                  ((void (*)(void *, void *))(void *)prop.Get)(test, dataTest);

                  if(((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
                  {
                     bool needClass = true;

                     string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, dataForm, tempString, null, &needClass);
                     ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);
                     if(needClass)
                        f.Printf("\n   %s%s = %c %s %c;", specify ? "property::" : "", prop.name, /*dataType.name, */OpenBracket, string, CloseBracket);
                     else
                        f.Printf("\n   %s%s = %s;", specify ? "property::" : "", prop.name, string);
                  }
                  delete dataForm;
                  delete dataTest;
               }
               else if(dataType && (dataType.type == normalClass || dataType.type == noHeadClass))
               {
                  void * dataForm, * dataTest;
                  bool isEditBoxContents = false;
                  bool freeDataForm = false, freeDataTest = false;

                  // Because contents property is broken for mutiline EditBox at the moment
                  if(!strcmp(prop.name, "contents") && !strcmp(prop._class.name, "EditBox"))
                     isEditBoxContents = true;

                  if(isEditBoxContents && ((EditBox)classObject.instance).multiLine)
                  {
                     dataForm = ((EditBox)classObject.instance).multiLineContents;
                     freeDataForm = true;
                  }
                  else
                     dataForm = ((void *(*)(void *))(void *)prop.Get)(classObject.instance);
                  if(isEditBoxContents && ((EditBox)test).multiLine)
                  {
                     dataTest = ((EditBox)test).multiLineContents;
                     freeDataTest = true;
                  }
                  else
                     dataTest = ((void *(*)(void *))(void *)prop.Get)(test);

                  if(((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, dataForm, dataTest))
                  {
                     char tempString[1024] = "";
                     char * string = null;
                     ((void (*)(void *, void *))(void *)prop.Set)(test, dataForm);

                     if(eClass_IsDerived(classObject.instance._class, dataType) && classObject.instance == dataForm)
                     {
                        // Shouldn't go here ...
                        f.Printf("\n   %s%s = this;", specify ? "property::" : "", prop.name);
                     }
                     else
                     {
                        bool needClass = true;

                        string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, dataForm, tempString, null, &needClass);

                        if(!strcmp(dataType.dataTypeString, "char *"))
                        {
                           Map<String, bool> i18nStrings = classObject.i18nStrings;
                           bool i18n = true;
                           if(i18nStrings && i18nStrings.GetAtPosition(prop.name, false, null))
                              i18n = false;

                           f.Printf("\n   %s%s = %s\"", specify ? "property::" : "", prop.name, i18n ? "$" : "");
                           OutputString(f, string);
                           f.Puts("\";");
                        }
                        else if(needClass)
                           f.Printf("\n   %s%s = %c %s %c;", specify ? "property::" : "", prop.name, /*dataType.name, */OpenBracket, string, CloseBracket);
                        else
                           f.Printf("\n   %s%s = %s;", specify ? "property::" : "", prop.name, string);
                     }
                  }
                  if(freeDataForm) delete dataForm;
                  if(freeDataTest) delete dataTest;
               }
               else if(dataType)
               {
                  DataValue dataForm, dataTest;

                  GetProperty(prop, classObject.instance, &dataForm);
                  GetProperty(prop, test, &dataTest);

                  if(((int (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCompare])(dataType, &dataForm, &dataTest))
                  {
                     SetProperty(prop, test, dataForm);
                     if(dataType.type == bitClass)
                     {
                        bool needClass = true;
                        string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, &dataForm, tempString, null, &needClass);
                        if(needClass)
                           f.Printf("\n   %s%s = %c %s %c;", specify ? "property::" : "", prop.name, /*dataType.name, */OpenBracket, string, CloseBracket);
                        else if(string[0])
                           f.Printf("\n   %s%s = %s;", specify ? "property::" : "", prop.name, string);
                     }
                     else
                     {
                        bool needClass = true;
                        if(dataType.type == enumClass)
                        {
                           NamedLink64 value;
                           Class enumClass = eSystem_FindClass(privateModule, "enum");
                           EnumClassData e = ACCESS_CLASSDATA(dataType, enumClass);
                           int64 i64Value = GetI64EnumValue(dataType, dataForm);

                           for(value = e.values.first; value; value = value.next)
                           {
                              if(value.data == i64Value)
                              {
                                 string = value.name;
                                 break;
                              }
                           }
                        }
                        else
                           string = ((char * (*)(void *, void *, void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, &dataForm, tempString, null, &needClass);
                        if(!strcmp(dataType.dataTypeString, "float") && strchr(string, '.'))
                           f.Printf("\n   %s%s = %sf;", specify ? "property::" : "", prop.name, string);
                        else if(string[0])
                           f.Printf("\n   %s%s = %s;", specify ? "property::" : "", prop.name, string);
                     }
                  }
               }
            }
         }
      }
   }

   void UpdateFormCode()
   {
      if(!this) return;
      if(!parsing) return;

      updatingCode++;
      if(codeModified)
      {
         ParseCode();
      }
      else if(formModified)
      {
         EditBoxStream f { editBox = editBox };
         int position = 0;
         char * text = null;
         int textSize;
         Identifier movedFuncId;
         int movedFuncIdLen = 0, movedFuncIdPos = 0;
         ObjectInfo classObject;

   	   updatingCode++;

         editBox.recordUndoEvent = true;

         if(moveAttached)
         {
            movedFuncId = GetDeclId(function.declarator);
            movedFuncIdLen = movedFuncId.loc.end.pos - movedFuncId.loc.start.pos;
            movedFuncIdPos = movedFuncId.loc.start.pos - function.loc.start.pos;
         }

         for(classObject = classes.first; classObject; classObject = classObject.next)
         {
            ClassDefinition classDef = classObject.classDefinition;
            Class regClass = eSystem_FindClass(this.privateModule, ((Specifier)classDef.baseSpecs->first).name);
            Instance test;
            ClassDef def;
            bool firstObject = true;
            ObjectInfo object = classObject.instances.first;
            bool lastIsDecl = false;

            if(!classObject.modified) continue;

            test = eInstance_New(regClass);
            incref test;

            // Put it in the same desktop window...
            designer.PrepareTestObject(test);

            //f.Printf("class %s : %s\n", classObject.name, classObject.oClass.name);
            //f.Printf("%c\n\n", OpenBracket);

            // Change the _class name
            f.Seek(classDef.nameLoc.start.pos - position, current);
            f.DeleteBytes(classDef.nameLoc.end.pos - classDef.nameLoc.start.pos);
            f.Printf(classObject.name);
            position = classDef.nameLoc.end.pos;

            {
               // Go to block start, delete all until no white space, put \n
               char ch;
               int count = 0;
               int back = 0;
               f.Seek(classDef.blockStart.end.pos - position, current);
               position = classDef.blockStart.end.pos;

               for(; f.Getc(&ch); count++)
               {
                  if(!isspace(ch))
                  {
                     f.Seek(-1, current);
                     break;
                  }

                  if(ch == '\n')
                     back = 0;
                  else
                     back++;
               }

               f.Seek(-count, current);

               f.DeleteBytes(count-back);
               //f.Printf("\n");
               position += count-back;
            }

            // Output properties
            OutputClassProperties(classObject.instance._class, classObject, f, test);

            for(def = classDef.definitions->first; def; def = def.next)
            {
               switch(def.type)
               {
                  case defaultPropertiesClassDef:
                  {
                     bool keptMember = false;
                     MemberInit propDef;
                     MemberInit lastKept = null;

                     lastIsDecl = false;
                     DeleteJunkBefore(f, def.loc.start.pos, &position);

                     // This was adding blank spaces between comment and properties -- What was it for?
                     // f.Printf("\n   ");

                     for(propDef = def.defProperties->first; propDef; propDef = propDef.next)
                     {
                        Identifier ident = propDef.identifiers->first;
                        bool deleted = false;

                        // For now delete if it's a prop
                        if(!propDef.variable && ident)
                        {
                           if(!ident.next)
                           {
                              Property prop = eClass_FindProperty(regClass, ident.string, this.privateModule);
                              if(prop)
                              {
                                 f.Seek(propDef.loc.start.pos - position, current);
                                 f.DeleteBytes(propDef.loc.end.pos - propDef.loc.start.pos);
                                 position = propDef.loc.end.pos;
                                 deleted = true;
                              }
                              else
                              {
                                 Method method = eClass_FindMethod(regClass, ident.string, this.privateModule);
                                 if(method && method.type == virtualMethod && propDef.initializer && propDef.initializer.type == expInitializer && propDef.initializer.exp && propDef.initializer.exp.type == identifierExp)
                                 {
                                    if(((methodAction == actionDetachMethod || methodAction == actionReattachMethod) && method == this.method && selected == classObject) ||
                                       (methodAction == actionDeleteMethod && function.declarator && !strcmp(function.declarator.symbol.string, propDef.initializer.exp.identifier.string)))
                                    {
                                       f.Seek(propDef.loc.start.pos - position, current);
                                       f.DeleteBytes(propDef.loc.end.pos - propDef.loc.start.pos);
                                       position = propDef.loc.end.pos;
                                       deleted = true;
                                    }
                                 }
                              }
                           }
                        }
                        if(!deleted)
                        {
                           keptMember = true;
                           lastKept = propDef;
                        }
                     }

                     if(!keptMember)
                     {
                        char ch = 0;
                        f.Seek(def.loc.end.pos - position - 1, current);
                        f.Getc(&ch);

                        if(ch == ';')
                        {
                           f.Seek(-1, current);
                           f.DeleteBytes(1);
                        }
                        position = def.loc.end.pos;
                     }
                     else
                     {
                        if(lastKept != def.defProperties->last)
                        {
                           char ch;
                           int count = 0;

                           f.Seek(-1, current);
                           for(;f.Getc(&ch);)
                           {
                              if(ch == ',')
                              {
                                 count++;
                                 f.Seek(-1, current);
                                 break;
                              }
                              else if(!isspace(ch))
                                 break;
                              f.Seek(-2, current);
                              count++;
                           }

                           if(ch == ',')
                              f.DeleteBytes(count);
                        }
                        else
                        {
                           f.Seek(def.loc.end.pos - position, current);
                           position = def.loc.end.pos;
                        }
                     }
                     break;
                  }
                  case declarationClassDef:
                  {
                     Declaration decl = def.decl;

                     if(decl.type == instDeclaration)
                     {
                        if(def.object/* && ((ObjectInfo)def.object).modified*/)
                        {
                           while(def.object && object != def.object)
                           {
                              if(object /*&& ((ObjectInfo)def.object).modified*/)
                                 position = UpdateInstanceCode(f, position, regClass, object, &firstObject, &text, &textSize, movedFuncIdLen, movedFuncIdPos);
                              object = object.next;
                           }

                           DeleteJunkBefore(f, def.loc.start.pos, &position);
                           f.Printf(firstObject ? "\n\n   " : "\n   ");
                           firstObject = false;

                           if(def.object && ((ObjectInfo)def.object).modified)
                              position = UpdateInstanceCode(f, position, regClass, def.object, &firstObject, &text, &textSize, movedFuncIdLen, movedFuncIdPos);

                           object = object ? object.next : null;
                        }
                        else
                        {
                           DeleteJunkBefore(f, def.loc.start.pos, &position);
                           f.Printf(firstObject ? "\n\n   " : "\n   ");
                           firstObject = false;
                        }
                        lastIsDecl = false;
                     }
                     else
                     {
                        DeleteJunkBefore(f, def.loc.start.pos, &position);
                        f.Printf(lastIsDecl ? "\n   " : "\n\n   ");
                        lastIsDecl = true;
                     }
                     break;
                  }
                  case functionClassDef:
                  {
                     // TESTING IF THIS IS GOOD ENOUGH FOR GENERATED FUNCTION...
                     if(!def.function.body) continue;

                     lastIsDecl = false;

                     DeleteJunkBefore(f, def.loc.start.pos, &position);
                     f.Printf("\n\n   ");

                     // Delete _class methods
                     if((methodAction == actionDeleteMethod || (moveAttached && selected != classObject)) &&
                        def.function == function)
                     {
                        char ch;
                        int count = 0;

                        if(moveAttached && !text)
                        {
                           GetLocText(editBox, f, position, &function.loc, &text, &textSize, Max((int)strlen(methodName) - movedFuncIdLen,0), 3);
                        }

                        f.Seek(def.loc.end.pos - position, current);
                        for(; f.Getc(&ch); count++)
                        {
                           if(!isspace(ch))
                           {
                              f.Seek(-1, current);
                              break;
                           }
                        }
                        f.Seek(def.loc.start.pos - def.loc.end.pos - count, current);

                        f.DeleteBytes(def.loc.end.pos - def.loc.start.pos + count);
                        position = def.loc.end.pos + count;
                     }

                     // In case of detaching methods in the _class, simply rename the method
                     if(methodAction == actionDetachMethod && moveAttached && selected == classObject && function == def.function)
                     {
                        f.Seek(function.loc.start.pos + movedFuncIdPos - position, current);
                        f.DeleteBytes(movedFuncIdLen);
                        f.Puts(methodName);
                        position = function.loc.start.pos + movedFuncIdPos + movedFuncIdLen;
                     }

                     if((methodAction == actionAttachMethod || methodAction == actionReattachMethod) && selected == classObject && moveAttached &&
                        function == def.function)
                     {
                        // In case of attaching methods in the _class, simply rename the method
                        f.Seek(function.loc.start.pos + movedFuncIdPos - position, current);
                        position = function.loc.start.pos + movedFuncIdPos;
                        f.DeleteBytes(movedFuncIdLen);
                        if(method.dataType.thisClass)
                           f.Printf("%s::", method.dataType.thisClass.string);
                        f.Puts(method.name);
                        position += movedFuncIdLen;
                     }
                     break;
                  }
                  default:
                     DeleteJunkBefore(f, def.loc.start.pos, &position);
                     if(def.type == memberAccessClassDef)
                     {
                        f.Printf("\n\n");
                        firstObject = false;
                        lastIsDecl = true;
                     }
                     else
                     {
                        f.Printf("\n   ");
                        lastIsDecl = false;
                     }
               }

               f.Seek(def.loc.end.pos - position, current);
               position = def.loc.end.pos;
            }

            // Output attached methods
            if((methodAction == actionAttachMethod || methodAction == actionReattachMethod) && selected == classObject && !moveAttached)
            {
               DeleteJunkBefore(f, position, &position);
               f.Printf("\n   %s = %s;\n", method.name, function.declarator.symbol.string);
            }

            // ********** INSTANCES ***************
            for(; object; object = object.next)
            {
               if(!object.instCode)
               {
                  position = UpdateInstanceCode(f, position, regClass, object, &firstObject, &text, &textSize, movedFuncIdLen, movedFuncIdPos);
               }
            }

            DeleteJunkBefore(f, position, &position);

            // ****************** METHODS ***********************
            if(methodAction == actionDetachMethod && moveAttached && classObject == oClass)
            {
               // If detaching an instance method
               if(selected != classObject)
               {
                  int newLen = strlen(methodName);

                  if(!text)
                     GetLocText(editBox, f, position, &function.loc, &text, &textSize, Max(newLen - movedFuncIdLen,0), 0);
                  // Tab selection left
                  {
                     int c;
                     for(c = 0; text[c]; )
                     {
                        int start = c, i;
                        for(i = 0; i<3 && text[c] == ' '; i++, c++);
                        memmove(text+start, text+start+i, textSize+1-start-i);
                        textSize -= i;
                        c -= i;
                        for(; text[c] && text[c] != '\n'; c++);
                        if(text[c]) c++;
                     }
                  }

                  // Rename function
                  memmove(text + movedFuncIdPos + newLen, text + movedFuncIdPos + movedFuncIdLen, textSize - movedFuncIdPos - movedFuncIdLen + 1);
                  textSize += newLen - movedFuncIdLen;
                  memcpy(text + movedFuncIdPos, methodName, newLen);

                  f.Printf("\n\n   ");
                  f.Puts(text);
               }
            }

            if(methodAction == actionAddMethod && selected == classObject)
            {
               Method method = this.method;

               if(!method.dataType)
                  method.dataType = ProcessTypeString(method.dataTypeString, false);

               // ADDING METHOD HERE
               {
                  Type dataType = method.dataType;
                  Type returnType = dataType.returnType;
                  Type param;
                  // Class moduleClass = eSystem_FindClass(this.privateModule, "Module");

                  f.Printf("\n\n");
                  f.Printf("   ");
                  OutputType(f, returnType, false);

                  f.Printf(" ");
                  if(dataType.thisClass && !dataType.classObjectType)
                  {
                     if(dataType.thisClass.shortName)
                        f.Printf(dataType.thisClass.shortName);
                     else
                        f.Printf(dataType.thisClass.string);
                     f.Printf("::");
                  }
                  f.Printf(method.name);
                  f.Printf("(");
                  for(param = dataType.params.first; param; param = param.next)
                  {
                     OutputType(f, param, true);
                     if(param.next)
                        f.Printf(", ");
                  }
                  f.Printf(")\n");
                  f.Printf("   %c\n\n", OpenBracket);

                  if(test._class._vTbl[method.vid] == null /*moduleClass._vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Module_OnLoad]*/) // Temp Check for DefaultFunction
                  {
                     if(returnType && returnType.kind == classType && !strcmp(returnType._class.string, "bool"))
                        f.Printf("      return true;\n");
                     else if(returnType && returnType.kind != voidType)
                        f.Printf("      return 0;\n");
                  }
                  else
                  {
                     f.Printf("      ");
                     if(returnType.kind != voidType)
                        f.Printf("return ");
                     {
                        char * name = ((Specifier)classDef.baseSpecs->first).name;
                        Symbol _class = FindClass(name);
                        f.Printf("%s::%s(", (_class && _class.registered) ? _class.registered.name : name, method.name);
                     }
                     for(param = dataType.params.first; param; param = param.next)
                     {
                        if(param.prev) f.Printf(", ");
                        if(param.kind != voidType)
                           f.Printf(param.name);
                     }
                     f.Printf(");\n");
                  }

                  f.Printf("   %c", CloseBracket);
               }
            }

            DeleteJunkBefore(f, classDef.loc.end.pos-1, &position);
            f.Printf("\n");

            delete test;
         }

         editBox.recordUndoEvent = false;

         updatingCode--;
         delete f;

         ParseCode();
         delete text;

         // TOFIX: Patch for a glitch where clicking at the end of the view seems one line off. No idea what could be going on?
         editBox.OnVScroll(setRange, editBox.scroll.y, 0);
      }

      updatingCode--;
      codeModified = false;
      formModified = false;
      methodAction = 0;
      moveAttached = false;
      function = null;
      method = null;
   }

   int FindMethod(const char * methodName /*Method method*/, ClassFunction*functionPtr, Location propLoc)
   {
      int found = 0;
      ClassFunction function = null;
      if(methodName)
      {
         ObjectInfo object = this.selected;

         if(object && object == this.oClass)
         {
            ClassDefinition classDef = object.oClass.classDefinition;
            ClassDef def;
            if(classDef && classDef.definitions)
            {
               for(def = classDef.definitions->first; def; def = def.next)
               {
                  if(def.type == functionClassDef && def.function.declarator)
                  {
                     if(!strcmp(def.function.declarator.symbol.string, methodName))
                     {
                        function = def.function;
                        found = 1;
                        break;
                     }
                  }
                  else if(def.type == defaultPropertiesClassDef)
                  {
                     MemberInit propDef;

                     for(propDef = def.defProperties->first; propDef; propDef = propDef.next)
                     {
                        Identifier ident = propDef.identifiers ? propDef.identifiers->first : null;
                        if(ident && !ident.next)
                        {
                           if(!strcmp(ident.string, methodName) && propDef.initializer && propDef.initializer.type == expInitializer && propDef.initializer.exp && propDef.initializer.exp.type == identifierExp)
                           {
                              found = 2;
                              if(propLoc != null)
                                 propLoc = propDef.loc;
                              if(functionPtr)
                              {
                                 ClassDefinition classDef = object.oClass.classDefinition;
                                 ClassDef def;
                                 if(classDef.definitions)
                                 {
                                    for(def = classDef.definitions->first; def; def = def.next)
                                    {
                                       if(def.type == functionClassDef && def.function.declarator)
                                       {
                                          if(!strcmp(def.function.declarator.symbol.string, propDef.initializer.exp.identifier.string))
                                          {
                                             function = def.function;
                                             break;
                                          }
                                       }
                                    }
                                    if(function) break;
                                 }
                              }
                              else
                                 break;
                           }
                        }
                     }
                  }
               }
            }
         }
         else if(object)
         {
            Instantiation inst = object.instCode;

            // Check here to see if the method already exists, no need to call ModifyCode in that case
            if(inst && inst.members)
            {
               MembersInit members;
               for(members = inst.members->first; members; members = members.next)
               {
                  switch(members.type)
                  {
                     case dataMembersInit:
                     {
                        if(members.dataMembers)
                        {
                           MemberInit member;
                           for(member = members.dataMembers->first; member; member = member.next)
                           {
                              Identifier ident = member.identifiers ? member.identifiers->first : null;
                              if(ident && !ident.next)
                              {
                                 if(!strcmp(ident.string, methodName) && member.initializer && member.initializer.type == expInitializer && member.initializer.exp && member.initializer.exp.type == memberExp /*ExpIdentifier*/)
                                 {
                                    found = 2;
                                    if(propLoc != null)
                                       propLoc = member.loc;
                                    if(functionPtr)
                                    {
                                       ClassDefinition classDef = object.oClass.classDefinition;
                                       ClassDef def;
                                       if(classDef.definitions)
                                       {
                                          for(def = classDef.definitions->first; def; def = def.next)
                                          {
                                             if(def.type == functionClassDef && def.function.declarator)
                                             {
                                                if(!strcmp(def.function.declarator.symbol.string, member.initializer.exp.identifier.string))
                                                {
                                                   function = def.function;
                                                   break;
                                                }
                                             }
                                          }
                                          if(function) break;
                                       }
                                       if(!function)
                                       {
                                          // TODO: Fix memory leak
                                          function = ClassFunction
                                          {
                                             declarator = Declarator { symbol = Symbol { string = CopyString(member.initializer.exp.member.member ? member.initializer.exp.member.member.string : "") } }
                                          };
                                       }
                                    }
                                    else
                                       break;
                                 }
                              }
                           }
                        }
                        break;
                     }
                     case methodMembersInit:
                     {
                        if(members.function.declarator && !strcmp(members.function.declarator.symbol.string, methodName))
                        {
                           function = members.function;
                           found = 1;
                        }
                        break;
                     }
                  }
                  if(function)
                     break;
               }
            }
         }
      }
      if(functionPtr) *functionPtr = function;
      return found;
   }

   void GoToMethod(const char * methodName /*Method method*/)
   {
      if(methodName)
      {
         ObjectInfo object = selected;
         EditBoxStream f { editBox = editBox };
         ClassFunction function = null;
         bool atChar = false;
         int indent = 6;
         EditLine l1, l2;
         int y1,y2, x1, x2;
         Location propLoc = { {0,0,-1} };

         // GO TO THE METHOD
         if(FindMethod(methodName, &function, &propLoc) == 1 && object != this.oClass) indent = 9;
         if(function && function.body)
         {
            bool lfCount = 0;
            f.Seek(function.body.loc.start.pos+1, current);
            for(;;)
            {
               char ch;
               if(!f.Getc(&ch))
                  break;
               if(ch == '\n')
               {
                  if(lfCount)
                  {
                     f.Seek(-1, current);
                     break;
                  }
                  lfCount++;
               }
               else if(!isspace(ch))
               {
                  f.Seek(-1, current);
                  atChar = true;
                  break;
               }
            }
         }
         else if(propLoc.start.pos > -1)
         {
            f.Seek(propLoc.start.pos, current);
            atChar = true;
         }
         editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
         delete f;
         if(function || propLoc.start.pos > -1)
         {
            editBox.SetSelPos(l1, y1, atChar ? x1 : indent, l2, y2, atChar ? x2 : indent);
            editBox.CenterOnCursor();
            SetState(normal, false, 0);
            Activate();

            if(function && function.declarator && function.declarator.symbol && !function.declarator.symbol.type)
            {
               FreeClassFunction(function);
            }
         }
      }
   }

   void FindCompatibleMethods(Method method, OldList compatible)
   {
      ClassDefinition classDef = this.oClass.classDefinition;
      if(classDef && classDef.definitions)
      {
         Class regClass { };
         Class baseClass = eSystem_FindClass(this.privateModule, ((Specifier)classDef.baseSpecs->first).name);
         ClassDef def;
         Class _class;
         Symbol classSym { };
         Symbol selectedClass;
         if(this.selected == this.oClass)
            selectedClass = classSym;
         else
            selectedClass = FindClass(this.selected.instance._class.name);

         regClass.name = classDef._class.name;
         regClass.base = eSystem_FindClass(this.privateModule, ((Specifier)classDef.baseSpecs->first).name);
         for(def = classDef.definitions->first; def; def = def.next)
         {
            if(def.type == functionClassDef && def.function.declarator)
            {
               Method vMethod = eClass_FindMethod(baseClass, def.function.declarator.symbol.string, this.privateModule);
               if(!vMethod)
                  vMethod = eClass_FindMethod(this.selected.instance._class, def.function.declarator.symbol.string, this.privateModule);
               if(!vMethod)
               {
                  Type type = def.function.declarator.symbol.type;
                  if(CheckCompatibleMethod(method, type, regClass, this.selected == this.oClass, FindClass(this.selected.instance._class.name)))
                  {
                     compatible.Add(OldLink { data = def.function });
                  }
               }
            }
         }

         if(this.oClass && this.oClass.instance)
         {
            classSym.registered = regClass;
            //classSym.registered = this.oClass.oClass;

            for(_class = regClass.base; _class; _class = _class.base)
            {
               Method testMethod;
               for(testMethod = (Method)_class.methods.first; testMethod; testMethod = (Method)((BTNode)testMethod).next)
               {
                  // TODO: Understand why these functions popup in attach list
                  if(testMethod.type != virtualMethod /*&& testMethod.function != Window_OnGetString && testMethod.function != Window_OnGetDataFromString*/)
                  {
                     if(!testMethod.dataType)
                        testMethod.dataType = ProcessTypeString(testMethod.dataTypeString, false);

                     //if(CheckCompatibleMethod(method, testMethod.dataType, &regClass, false, selectedClass)) // this.selected == this.oClass, selectedClass))
                     if(CheckCompatibleMethod(method, testMethod.dataType, this.oClass.instance._class, false, selectedClass)) // this.selected == this.oClass, selectedClass))
                     //if(CheckCompatibleMethod(method, testMethod.dataType, &regClass, this.selected == this.oClass, FindClass(this.oClass.oClass.name)))
                     {
                        // TODO: Fix memory leak, Figure out if it should be ClassFunction or FunctionDefinition
                        // ClassFunction function { };
                        FunctionDefinition function { };

                        function.declarator = Declarator { };
                        function.declarator.symbol = Symbol { string = CopyString(testMethod.name) };
                        excludedSymbols.Add(function.declarator.symbol);

                        compatible.Add(OldLink { data = function });
                     }
                  }
               }
            }
         }
         delete regClass;
         delete classSym;
      }
   }

   void AddMethod(Method method)
   {
      if(method)
      {
         char methodName[1024];
         strcpy(methodName, method.name);
         if(!FindMethod(methodName, null, null))
         {
            methodAction = actionAddMethod;
            this.method = method;
            ModifyCode();
         }
         UpdateFormCode();
         GoToMethod(methodName);
      }
   }

   void DeleteMethod(ClassFunction function)
   {
      if(function)
      {
         methodAction = actionDeleteMethod;
         this.function = function;
         ModifyCode();
         UpdateFormCode();

         Update(null);
      }
   }

   void AttachMethod(Method method, ClassFunction function)
   {
      if(function)
      {
         // If it's an instance we'll ask if we want to move it inside...
         if(!function.attached.count && function.body)
         {
            // Find the function in the _class to check if it's a virtual function
            Class regClass = eSystem_FindClass(this.privateModule, ((Specifier)this.oClass.classDefinition.baseSpecs->first).name);
            Method method = eClass_FindMethod(regClass, function.declarator.symbol.string, this.privateModule);
            /*    LATER we'll need to check for public/virtual properties etc, for now only checked if virtual in base _class
            ClassDef def;
            for(def = this.classDefinition.first; def; def = def.next)
            {
               if(def.type == functionClassDef)
               {
                  if(def.function == function)
                     break;
               }
            }
            */
            if(!method || method.type != virtualMethod)
            {
               char title[1024];
               sprintf(title, $"Attach %s", function.declarator.symbol.string);
               if(MessageBox { type = yesNo, master = parent, text = title, contents = $"Method is unused. Move method inside instance?"}.Modal() == yes)
               {
                  moveAttached = true;
               }
            }
         }

         methodAction = actionAttachMethod;
         this.method = method;
         this.function = function;
         ModifyCode();
         UpdateFormCode();
         Update(null);
      }
   }

   void ReAttachMethod(Method method, ClassFunction function)
   {
      if(function)
      {
         // If it's an instance we'll ask if we want to move it inside...
         if(!function.attached.count && function.body)
         {
            // Find the function in the _class to check if it's a virtual function
            Class regClass = eSystem_FindClass(this.privateModule, ((Specifier)this.oClass.classDefinition.baseSpecs->first).name);
            Method method = eClass_FindMethod(regClass, function.declarator.symbol.string, this.privateModule);
            /*    LATER we'll need to check for public/virtual properties etc, for now only checked if virtual in base _class
            ClassDef def;
            for(def = this.classDefinition.first; def; def = def.next)
            {
               if(def.type == functionClassDef)
               {
                  if(def.function == function)
                     break;
               }
            }
            */
            if(!method || method.type != virtualMethod)
            {
               char title[1024];
               sprintf(title, $"Attach %s", function.declarator.symbol.string);
               if(MessageBox { type = yesNo, master = parent, text = title,
                  contents = $"Method is unused. Move method inside instance?" }.Modal() == yes)
               {
                  moveAttached = true;
               }
            }
         }

         methodAction = actionReattachMethod;
         this.method = method;
         this.function = function;
         ModifyCode();
         UpdateFormCode();
         Update(null);
      }
   }

   void DetachMethod(Method method, ClassFunction function, int type)
   {
      bool result = true;

      if(type == 1)
      {
         Window dialog
         {
            hasClose = true, borderStyle = sizable, minClientSize = { 300, 55 },
            master = sheet, text = $"Name detached method", background = formColor
         };
         Button cancelButton
         {
            dialog, anchor = { horz = 45, top = 30 }, size = { 80 }, text = $"Cancel", hotKey = escape,
            id = DialogResult::cancel, NotifyClicked = ButtonCloseDialog
         };
         Button okButton
         {
            dialog, anchor = { horz = -45, top = 30 }, size = { 80 }, text = $"OK", isDefault = true,
            id = DialogResult::ok, NotifyClicked = ButtonCloseDialog
         };
         EditBox nameBox
         {
            dialog, anchor = { left = 5, right = 5, top = 5 }
         };
         sprintf(methodName, "%s_%s", selected.name, method.name);
         nameBox.contents = methodName;
         incref nameBox;
         result = dialog.Modal() == ok;
         strcpy(methodName, nameBox.contents);
         delete nameBox;
      }
      if(result)
      {
         // If the method is not attached, move it outside
         if(type == 1)
         {
            // Add this class to the methodName
            char name[1024] = "";

            if(this.selected != this.oClass && !method.dataType.thisClass)
            {
               strcat(name, this.selected.instance._class.name);
               strcat(name, "::");
               strcat(name, this.methodName);
               strcpy(this.methodName, name);
            }
            else if(method.dataType.thisClass && (this.selected == this.oClass || !eClass_IsDerived(this.oClass.instance._class, method.dataType.thisClass.registered)))
            {
               strcat(name, method.dataType.thisClass.string);
               strcat(name, "::");
               strcat(name, this.methodName);
               strcpy(this.methodName, name);
            }

            this.moveAttached = true;
         }

         this.methodAction = actionDetachMethod;
         this.method = method;
         this.function = function;
         ModifyCode();
         UpdateFormCode();
         Update(null);
      }
   }

   void AddObject(Instance instance, ObjectInfo * object)
   {
      int id;
      incref instance;
      //*object = _class.instances.Add(sizeof(ObjectInfo));
      *object = ObjectInfo { };
      oClass.instances.Insert((selected.oClass == selected) ? null : selected, *object);
      (*object).oClass = oClass;
      (*object).instance = instance;
      for(id = 1;; id++)
      {
         char name[1024];
         ObjectInfo check;
         sprintf(name, "%c%s%d", tolower(instance._class.name[0]), instance._class.name+1, id);

         // if(strcmp(name, this.oClass.instance.name))

         {
            for(check = oClass.instances.first; check; check = check.next)
               if(!check.deleted && check.name && !strcmp(name, check.name))
                  break;
            if(!check)
            {
               (*object).name = CopyString(name);
               break;
            }
         }
      }
      toolBox.controlClass = null;

      ModifyCode();

      //sheet.AddObject(*object, (*object).name, TypeData, true);

      selected = *object;
   }

   void EnsureUpToDate()
   {
      if(sheet && codeModified && parsing)
         ParseCode();
   }

   void SelectObject(ObjectInfo object)
   {
      selected = object;
      oClass = object ? object.oClass : null;
      if(designer)
         designer.SelectObject(object, object ? object.instance : null);
   }

   void SelectObjectFromDesigner(ObjectInfo object)
   {
      selected = object;
      sheet.SelectObject(object);
   }

   void EnumerateObjects(Sheet sheet)
   {
      ObjectInfo oClass;

      for(oClass = classes.first; oClass; oClass = oClass.next)
      {
         if(oClass.instance)
         {
            ObjectInfo object;

            sheet.AddObject(oClass, oClass.name ? oClass.name : oClass.instance._class.name, typeClass, false);
            for(object = oClass.instances.first; object; object = object.next)
               sheet.AddObject(object, object.name ? object.name : object.instance._class.name, typeData, false);
         }
      }
      sheet.SelectObject(selected);
   }

   void AddControl()
   {
      designer.AddObject();
   }

   void DeleteObject(ObjectInfo object)
   {
      delete object.instance;
      object.deleted = true;
      object.modified = true;
      object.oClass.modified = true;

      if(selected == object)
      {
         bool looped = false;
         ObjectInfo select = object;

         for(;;)
         {
            select = select.prev;
            if(!select)
            {
               if(looped) break;
               select = object.oClass.instances.last;
               if(!select) break;
               looped = true;
            }
            if(!select.deleted)
               break;
         }
         sheet.SelectObject(select ? select : oClass);
      }

      if(!object.instCode && object.oClass != object)
      {
         delete object.name;
         oClass.instances.Delete(object);
      }

      if(sheet.codeEditor == this)
         sheet.DeleteObject(object);
   }

   void RenameObject(ObjectInfo object, const char * name)
   {
      bool valid = false;

      // Validate the name:
      if(object != oClass && (!name || !name[0])) valid = true;   // What's this one again?
      else if(name[0] && (isalpha(name[0]) || name[0] == '_'))
      {
         int c;
         for(c = 0; name[c]; c++)
            if(!isalnum(name[c]) && name[c] != '_' && name[c] != '_')
               break;
         if(!name[c])
            valid = true;
      }
      if(valid)
      {
         delete object.name;
         object.name = (name && name[0]) ? CopyString(name) : null;

         sheet.RenameObject(object, object.name ? object.name : object.instance._class.name);
      }
   }

   void DesignerModifiedObject()
   {
      sheet.ListProperties(false);
      sheet.Update(null);
   }

   void ListSubMembers(Type member)
   {
      Type subMember;

      for(subMember = member.members.first; subMember; subMember = subMember.next)
      {
         if(subMember.name)
         {
            DataRow row = membersList.AddString(subMember.name);
            row.icon = icons[typeData];
         }
         else
         {
            ListSubMembers(subMember);
         }
      }
   }

   void ListSubDataMembers(DataMember member, bool isPrivate)
   {
      DataMember subMember;
      for(subMember = member.members.first; subMember; subMember = subMember.next)
      {
         if((subMember.memberAccess == publicAccess && !isPrivate) || subMember._class.module == privateModule)
         {
            if(subMember.name)
            {
               DataRow row = membersList.AddString(subMember.name);
               BitmapResource bitmap = null;
               if(!subMember.dataType)
                  subMember.dataType = ProcessTypeString(subMember.dataTypeString, false);

               if(subMember.dataType && subMember.dataType.kind == classType && subMember.dataType._class)
               {
                  char * bitmapName = (char *)(intptr)eClass_GetProperty(subMember.dataType._class.registered, "icon");
                  if(bitmapName)
                  {
                     bitmap = { bitmapName };
                     membersList.AddResource(bitmap);
                  }
               }
               row.icon = bitmap ? bitmap : icons[(subMember.memberAccess == publicAccess && !isPrivate) ? typeData : typeDataPrivate];
            }
            else
            {
               ListSubDataMembers(subMember, isPrivate || member.memberAccess == privateAccess);
            }
         }
      }
   }

   void ListClassMembers(Class whatClass, bool methodsOnly)
   {
      Class _class;
      Class baseClass = eSystem_FindClass(this.privateModule, "class");
      bool isPrivate = false;

      for(_class = whatClass; _class && _class.type != systemClass; _class = _class.base)
      {
         Method method, methodIt;
         DataMember member;
         DataMember memberIt;

         for(methodIt = (Method)_class.methods.first; methodIt; methodIt = (Method)((BTNode)methodIt).next)
         {
            method = eClass_FindMethod(whatClass, methodIt.name, privateModule);
            if(methodIt.memberAccess == privateAccess && method && method.memberAccess == publicAccess)
               method = methodIt;
            if(method && method._class.type != systemClass && !eClass_FindMethod(baseClass, method.name, this.privateModule))
            {
               if(method.memberAccess == publicAccess || method._class.module == privateModule)
               {
                  DataRow row = membersList.FindString(method.name);
                  if(!row)
                  {
                     row = membersList.AddString(method.name);

                     if(!method.dataType)
                        method.dataType = ProcessTypeString(method.dataTypeString, false);

                     row.icon = icons[(method.type == virtualMethod && method.dataType && method.dataType.thisClass) ? typeEvent : ((method.memberAccess == publicAccess && !isPrivate) ? typeMethod : typeMethodPrivate)];
                  }
               }
            }
         }

         if(!methodsOnly)
         {
            for(memberIt = _class.membersAndProperties.first; memberIt; memberIt = memberIt.next)
            {
               if(memberIt.name)
               {
                  if(memberIt.isProperty)
                  {
                     member = (DataMember)eClass_FindProperty(whatClass, memberIt.name, privateModule);
                     if(!member)
                        member = eClass_FindDataMember(whatClass, memberIt.name, privateModule, null, null);
                  }
                  else
                  {
                     member = eClass_FindDataMember(whatClass, memberIt.name, privateModule, null, null);
                     if(!member)
                        member = (DataMember)eClass_FindProperty(whatClass, memberIt.name, privateModule);
                  }

                  if(memberIt.memberAccess == privateAccess && member && member.memberAccess == publicAccess)
                     member = memberIt;
               }
               else
                  member = memberIt;

               if(member && (member.memberAccess == publicAccess || member._class.module == privateModule))
               {
                  if(member.isProperty)
                  {
                     Property prop = (Property) member;
                     if(!membersList.FindString(prop.name))
                     {
                        DataRow row = membersList.AddString(prop.name);
                        row.icon = icons[(member.memberAccess == publicAccess && !isPrivate) ? typeProperty : typePropertyPrivate];
                     }
                  }
                  else if(member.name && !membersList.FindString(member.name))
                  {
                     DataRow row = membersList.AddString(member.name);

                     BitmapResource bitmap = null;
                     if(!member.dataType)
                        member.dataType = ProcessTypeString(member.dataTypeString, false);

                     if(member.dataType && member.dataType.kind == classType && member.dataType._class)
                     {
                        char * bitmapName = (char *)(intptr)eClass_GetProperty(member.dataType._class.registered, "icon");
                        if(bitmapName)
                        {
                           bitmap = { bitmapName };
                           membersList.AddResource(bitmap);
                        }
                     }
                     row.icon = bitmap ? bitmap : icons[(member.memberAccess == publicAccess && !isPrivate) ? typeData : typeDataPrivate];
                  }
                  else if(_class.type != bitClass)  // TOFIX: This was not handled properly?
                     ListSubDataMembers(member, member.memberAccess == privateAccess);
               }
            }
         }
         if(_class.inheritanceAccess == privateAccess)
         {
            isPrivate = true;
            if(_class.module != privateModule) break;
         }
      }
   }

   void ListClassMembersMatch(Class whatClass, Type methodType)
   {
      Class _class;
      Class baseClass = eSystem_FindClass(this.privateModule, "class");
      bool isPrivate = false;

      for(_class = whatClass; _class && _class.type != systemClass; _class = _class.base)
      {
         Method method;

         for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if(method.memberAccess == publicAccess || method._class.module == privateModule)
            {
               if(method._class.type != systemClass && !eClass_FindMethod(baseClass, method.name, this.privateModule))
               {
                  if(!method.dataType)
                     method.dataType = ProcessTypeString(method.dataTypeString, false);

                  if(MatchTypes(method.dataType, methodType, null, whatClass, /*null, */whatClass, false, true, false, false, true))
                  {
                     DataRow row = membersList.FindString(method.name);
                     if(!row)
                     {
                        row = membersList.AddString(method.name);
                        row.icon = icons[(method.type == virtualMethod && method.dataType.thisClass) ? typeEvent : ((method.memberAccess == publicAccess && !isPrivate) ? typeMethod : typeMethodPrivate)];
                     }
                  }
               }
            }
         }
         if(_class.inheritanceAccess == privateAccess)
         {
            isPrivate = true;
            if(_class.module != privateModule) break;
         }
      }
   }

   void ListClassPropertiesAndVirtual(Class whatClass, const String curString)
   {
      Class _class;
      bool isPrivate = false;
      for(_class = whatClass; _class /*&& _class.type != systemClass*/; _class = _class.base)
      {
         Method method;
         DataMember member;

         for(method = (Method)_class.methods.first; method; method = (Method)((BTNode)method).next)
         {
            if(method.type == virtualMethod)
            {
               if(method.memberAccess == publicAccess || method._class.module == privateModule)
               {
                  DataRow row = membersList.FindString(method.name);
                  if(!row)
                  {
                     row = membersList.AddString(method.name);

                     if(!method.dataType)
                        method.dataType = ProcessTypeString(method.dataTypeString, false);

                     row.icon = icons[method.dataType.thisClass ? typeEvent : ((method.memberAccess == publicAccess && !isPrivate) ? typeMethod : typeMethodPrivate)];
                  }
               }
            }
         }

         for(member = _class.membersAndProperties.first; member; member = member.next)
         {
            if(member.memberAccess == publicAccess || member._class.module == privateModule)
            {
               if(member.isProperty)
               {
                  Property prop = (Property)member;
                  {
                     DataRow row = membersList.AddString(prop.name);
                     row.icon = icons[(member.memberAccess == publicAccess && !isPrivate) ? typeProperty : typePropertyPrivate];
                  }
               }
               else if(member.name && (!curString || strcmp(curString, member.name)))
               {
                  DataRow row = membersList.AddString(member.name);

                  BitmapResource bitmap = null;
                  if(!member.dataType)
                     member.dataType = ProcessTypeString(member.dataTypeString, false);

                  if(member.dataType && member.dataType.kind == classType && member.dataType._class)
                  {
                     char * bitmapName = (char *)(intptr)eClass_GetProperty(member.dataType._class.registered, "icon");
                     if(bitmapName)
                     {
                        bitmap = { bitmapName };
                        membersList.AddResource(bitmap);
                     }
                  }
                  row.icon = bitmap ? bitmap : icons[(member.memberAccess == publicAccess && !isPrivate) ? typeData : typeDataPrivate];
               }
               else if(member.type == structMember || member.type == unionMember)
                  ListSubDataMembers(member, member.memberAccess == privateAccess || isPrivate);
            }
         }
         if(_class.inheritanceAccess == privateAccess)
         {
            isPrivate = true;
            if(_class.module != privateModule) break;
         }
      }
   }

   void ListMembers(Type type)
   {
      if(type && (type.kind == classType || type.kind == structType || type.kind == unionType))
      {
         if(type.kind == classType)
         {
            if(type._class)
               ListClassMembers(type._class.registered, false);
         }
         else
         {
            Type member;
            for(member = type.members.first; member; member = member.next)
            {
               if(member.name)
               {
                  DataRow row = membersList.AddString(member.name);
                  row.icon = icons[typeData];
               }
               else if(member.kind == structType || member.kind == unionType)
                  ListSubMembers(member);
            }
         }
      }
   }

   void ListModule(Module mainModule, int recurse, bool listClasses)
   {
      Module module;
      ListNameSpace(mainModule.application.systemNameSpace, 1, listClasses);
      ListNameSpace(mainModule.application.privateNameSpace, 1, listClasses);
      ListNameSpace(mainModule.application.publicNameSpace, 1, listClasses);
      for(module = mainModule.application.allModules.first; module; module = module.next)
      {
         if(ModuleVisibility(mainModule, module))
            ListNameSpace(module.publicNameSpace, recurse, listClasses);
      }
   }

   void ListNameSpace(NameSpace nameSpace, int recurse, bool listClasses)
   {
      NameSpace * ns;
      BTNamedLink link;

      if(listClasses)
      {
         for(link = (BTNamedLink)nameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
         {
            Class _class = link.data;
            if(_class.type != systemClass && !_class.templateClass)  // Omit templatized classes
            {
               DataRow row = membersList.AddString(_class.name);
               row.icon = (_class.type == unitClass || _class.type == enumClass) ? icons[typeDataType] : icons[typeClass];
            }
         }
      }

      for(link = (BTNamedLink)nameSpace.defines.first; link; link = (BTNamedLink)((BTNode)link).next )
      {
         //DefinedExpression definedExp = link.data;
         DataRow row = membersList.AddString(link /*definedExp*/.name);
         row.icon = icons[typeData];
      }

      for(link = (BTNamedLink)nameSpace.functions.first; link; link = (BTNamedLink)((BTNode)link).next)
      {
         //GlobalFunction function = link.data;
         DataRow row = membersList.AddString(link /*function*/.name);
         row.icon = icons[typeMethod];
      }


      for(ns = (NameSpace *)nameSpace.nameSpaces.first; ns; ns = (NameSpace *)((BTNode)ns).next)
      {
         if(recurse != 2 && listClasses)
         {
            if(!membersList.FindString(ns->name))
            {
               DataRow row = membersList.AddString(ns->name);
               row.icon = icons[typeNameSpace];
            }
         }

         if(recurse)
            ListNameSpace(ns, 2, listClasses);
      }
   }

   void ListEnumValues(Class _class)
   {
      List<Class> classes { };
      for(; _class && _class.type == enumClass; _class = _class.base)
         classes.Insert(null, _class);
      for(_class : classes)
      {
         EnumClassData enumeration = (EnumClassData)_class.data;
         NamedLink64 item;
         for(item = enumeration.values.first; item; item = item.next)
         {
            DataRow row = membersList.AddString(item.name);
            row.icon = icons[typeEnumValue];
         }
      }
      delete classes;
   }

   bool ListEnumsModule(Module mainModule, Type dest)
   {
      bool result = false;
      Module module;
      result |= ListEnums(mainModule.application.systemNameSpace, dest);
      result |= ListEnums(mainModule.application.privateNameSpace, dest);
      result |= ListEnums(mainModule.application.publicNameSpace, dest);
      for(module = mainModule.application.allModules.first; module; module = module.next)
      {
         if(ModuleVisibility(mainModule, module))
            result |= ListEnums(module.publicNameSpace, dest);
      }
      return result;
   }

   void ListNameSpaceByString(Module mainModule, const char * string)
   {
      NameSpace * nameSpace;
      Module module;
      nameSpace = FindNameSpace(mainModule.application.systemNameSpace, string);
      if(nameSpace) ListNameSpace(nameSpace, 0, true);
      nameSpace = FindNameSpace(mainModule.application.privateNameSpace, string);
      if(nameSpace) ListNameSpace(nameSpace, 0, true);
      nameSpace = FindNameSpace(mainModule.application.publicNameSpace, string);
      if(nameSpace) ListNameSpace(nameSpace, 0, true);
      for(module = mainModule.application.allModules.first; module; module = module.next)
      {
         if(ModuleVisibility(mainModule, module))
         {
            nameSpace = FindNameSpace(module.publicNameSpace, string);
            if(nameSpace) ListNameSpace(nameSpace, 0, true);
         }
      }
   }

   bool ListEnums(NameSpace nameSpace, Type dest)
   {
      BTNamedLink link;
      bool result = false;

      for(link = (BTNamedLink)nameSpace.classes.first; link; link = (BTNamedLink)((BTNode)link).next)
      {
         Class _class = link.data;
         if(_class.type == enumClass && (dest.kind != classType || ((!dest._class || !dest._class.registered || (dest._class.registered != _class && strcmp(dest._class.registered.dataTypeString, "char *") && strcmp(dest._class.string, "bool"))) && !dest.classObjectType)) &&
            dest.kind != pointerType && dest.kind != ellipsisType)
         {
            OldList conversions { };
            Type type { };
            type.kind = classType;
            type._class = FindClass(_class.name);
            if(MatchTypes(type, dest, &conversions, null, null, true, false, false, false, true))
            {
               ListEnumValues(_class);
               result = true;
            }
            conversions.Free(null);
            delete type;
         }
      }
      for(nameSpace = (NameSpace *)nameSpace.nameSpaces.first; nameSpace != null; nameSpace = (NameSpace *)((BTNode)nameSpace).next)
      {
         result |= ListEnums(nameSpace, dest);
      }
      return result;
   }

   NameSpace * FindNameSpace(NameSpace nameSpace, const char * name)
   {
      int start = 0, c;
      char ch;
      for(c = 0; (ch = name[c]); c++)
      {
         if(ch == '.' || (ch == ':' && name[c+1] == ':'))
         {
            NameSpace * newSpace;
            char * spaceName = new char[c - start + 1];
            memcpy(spaceName, name + start, c - start);
            spaceName[c-start] = '\0';
            newSpace = (NameSpace *)nameSpace.nameSpaces.FindString(spaceName);
            delete spaceName;
            if(!newSpace)
               return null;
            nameSpace = newSpace;
            if(ch == ':') c++;
            start = c+1;
         }
      }
      if(c - start)
      {
         // name + start;
      }
      return (NameSpace *)nameSpace;
   }

   void ListSymbols(Expression exp, bool enumOnly, const char * string, Identifier realIdentifier)
   {
      bool listedEnums = false;
      Type destType = (exp && exp.destType && !exp.destType.truth) ? exp.destType : null;
      bool listClasses = true;

      if(exp && (exp.type == identifierExp || exp.type == memberExp))
      {
         // TOCHECK: This memberExp check wasn't here... Some stuff isn't quite done
         Identifier id = (exp.type == memberExp) ? exp.member.member : exp.identifier;
         char * colons = id ? RSearchString(id.string, "::", strlen(id.string), true, false) : null;

         if(exp.type == identifierExp)
            id = realIdentifier;

         if(id && id._class && !id._class.name)
         {
            listClasses = false;
            SetThisClass(null);
         }
         else if(id && id._class && id._class.name)
         {
            if(id.classSym)
            {
               Class _class = id.classSym.registered;
               if(_class && _class.type == enumClass)
               {
                  ListEnumValues(_class);
               }
               else
                  ListClassMembers(id.classSym.registered, true);
               return;
            }
            return;
         }
         else if(id && colons)
         {
            ListNameSpaceByString(this.privateModule, id.string);
            return;
         }
      }

      if(this.privateModule && destType && (destType.kind == _BoolType || destType.kind == classType || destType.kind == enumType || destType.kind == structType || destType.kind == templateType || destType.kind == thisClassType || destType.kind == unionType ||
         (destType.kind == pointerType && destType.type.kind != voidType)))
      //if(this.privateModule && destType && (destType.kind != pointerType || destType.type.kind != voidType) && destType.kind != ellipsisType)
      {
         listedEnums = ListEnumsModule(this.privateModule, destType);
      }

      if(destType && destType.kind == classType && destType._class && destType._class.registered && destType._class.registered.type == enumClass)
      {
         ListEnumValues(destType._class.registered);

         if(insideClass)
            ListClassPropertiesAndVirtual(insideClass, null);

         listedEnums = true;
      }
      else if(destType && destType.kind == enumType)
      {
         NamedLink64 value;

         for(value = destType.members.first; value; value = value.next)
         {
            DataRow row = membersList.AddString(value.name);
            row.icon = icons[typeEnumValue];
         }

         if(insideClass)
            ListClassPropertiesAndVirtual(insideClass, null);

         listedEnums = true;
      }
      else if(insideClass && !enumOnly)
      {
         ListClassPropertiesAndVirtual(insideClass, string);
      }

      if(listedEnums && string && string[0])
      {
         DataRow row = membersList.FindSubString(string);
         if(!row)
            listedEnums = false;
      }

      if(!insideClass && exp && exp.destType && exp.destType.kind == functionType && GetThisClass())
      {
         ListClassMembersMatch(GetThisClass(), exp.destType);
      }
      else if(!insideClass && !enumOnly && !listedEnums)
      {
         Context ctx;
         Symbol symbol = null;
         {
            if(GetThisClass())
            {
               ListClassMembers(GetThisClass(), false);
            }

            for(ctx = listClasses ? GetCurrentContext() : GetTopContext(); ctx != GetTopContext().parent && !symbol; ctx = ctx.parent)
            {
               for(symbol = (Symbol)ctx.symbols.first; symbol; symbol = (Symbol)((BTNode)symbol).next)
               {
                  // Don't list enum values?
                  //if(symbol.type.kind != TypeEnum)
                  DataRow row = membersList.FindString(symbol.string);
                  if(!row)
                  {
                     if(GetBuildingEcereComModule() && symbol.type && symbol.type.kind == functionType && eSystem_FindFunction(privateModule, symbol.string))
                        continue;
                     row = membersList.AddString(symbol.string);
                     if(symbol.type && symbol.type.kind == functionType)
                        row.icon = icons[typeMethod];
                     else if(symbol.type && symbol.type.kind == enumType)
                     {
                        row.icon = icons[typeEnumValue];
                     }
                     else
                     {
                        BitmapResource bitmap = null;
                        if(symbol.type && symbol.type.kind == classType && symbol.type._class && symbol.type._class)
                        {
                           char * bitmapName = (char *)(intptr)eClass_GetProperty(symbol.type._class.registered, "icon");
                           if(bitmapName)
                           {
                              bitmap = { bitmapName };
                              membersList.AddResource(bitmap);
                           }
                        }
                        row.icon = bitmap ? bitmap : icons[typeData];
                     }
                  }
               }

               if(listClasses)
               {
                  for(symbol = (Symbol)ctx.types.first; symbol; symbol = (Symbol)((BTNode)symbol).next)
                  {
                     DataRow row = membersList.FindString(symbol.string);
                     if(!row)
                     {
                        row = membersList.AddString(symbol.string);
                        if(symbol.type.kind == functionType)
                           row.icon = icons[typeMethod];
                        else if(symbol.type.kind == classType && (!symbol.type._class.registered || (symbol.type._class.registered.type != unitClass && symbol.type._class.registered.type != enumClass)))
                        {
                           row.icon = icons[typeClass];
                        }
                        else
                        {
                           row.icon = icons[typeDataType];
                        }
                     }
                  }
               }
            }

            ListModule(this.privateModule, 1, listClasses);
            // TODO: Implement this with name space
            /*
            {
               GlobalData data;
               for(data = globalData.first; data; data = data.next)
               {
                  DataRow row = membersList.FindString(data.name);
                  if(!data.dataType)
                     data.dataType = ProcessTypeString(data.dataTypeString, false);
                  if(!row)
                  {
                     row = membersList.AddString(data.name);

                     if(data.dataType && data.dataType.kind == TypeEnum)
                     {
                        row.icon = icons[typeEnumValue];
                     }
                     else
                     {
                        BitmapResource bitmap = null;
                        if(data.dataType && data.dataType.kind == classType && data.dataType._class && data.dataType._class)
                        {
                           char * bitmapName = (char *)eClass_GetProperty(data.dataType._class.registered, "icon");
                           if(bitmapName)
                           {
                              bitmap = { bitmapName };
                              membersList.AddResource(bitmap);
                           }
                        }
                        row.icon = bitmap ? bitmap : icons[typeData];
                     }
                  }
               }
            }
            */

            {
               DataRow row = membersList.AddString("Min");
               row.icon = icons[typeMethod];

               row = membersList.AddString("Max");
               row.icon = icons[typeMethod];

               row = membersList.AddString("Abs");
               row.icon = icons[typeMethod];

               row = membersList.AddString("Sgn");
               row.icon = icons[typeMethod];
            }
         }
      }
   }

   void OverrideVirtualFunction(ClassFunction function, Method method, Class _class, bool isInstance, bool extraIndent)
   {
      EditBoxStream f { editBox = editBox };
      int position = 0;
      EditLine l1, l2;
      int x1,y1,x2,y2;

      updatingCode = true;

      if(!method.dataType)
         method.dataType = ProcessTypeString(method.dataTypeString, false);

      DeleteJunkBefore(f, function.loc.start.pos, &position);
      f.DeleteBytes(function.loc.end.pos - function.loc.start.pos - 1);

      // ADDING METHOD HERE
      {
         Type dataType = method.dataType;
         Type returnType = dataType.returnType;
         Type param;
         // Class moduleClass = eSystem_FindClass(this.privateModule, "Module");

         if(insideDef.prev)
             f.Printf("\n\n");
         else
            f.Printf("\n");
         if(extraIndent) f.Printf("   ");
         f.Printf("   ");
         OutputType(f, returnType, false);

         f.Printf(" ");

         if(dataType.thisClass && !dataType.classObjectType && (!isInstance || !insideClass || !eClass_IsDerived(insideClass, dataType.thisClass.registered)))
         {
            if(dataType.thisClass.shortName)
               f.Printf(dataType.thisClass.shortName);
            else
               f.Printf(dataType.thisClass.string);
            f.Printf("::");
         }
         f.Printf(method.name);
         f.Printf("(");
         for(param = dataType.params.first; param; param = param.next)
         {
            // Decided not to write void...
            if(param.kind != voidType)
            {
               OutputType(f, param, true);
               if(param.next)
                  f.Printf(", ");
            }
         }
         f.Printf(")\n");
         if(extraIndent) f.Printf("   ");
         f.Printf("   %c\n", OpenBracket);

         editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

         f.Printf("\n");

         if(!_class ||
            (
               (isInstance ? _class : _class.base)._vTbl[method.vid] == null /*moduleClass._vTbl[__ecereVMethodID___ecereNameSpace__ecere__com__Module_OnLoad]*/ ||
               (isInstance ? _class : _class.base)._vTbl[method.vid] == DummyMethod)) // Temp Check for DefaultFunction
         {
            if(returnType && returnType.kind == classType && !strcmp(returnType._class.string, "bool"))
            {
               if(extraIndent) f.Printf("   ");
               f.Printf("      return true;\n");
            }
            else if(returnType && returnType.kind != voidType)
            {
               if(extraIndent) f.Printf("   ");
               f.Printf("      return 0;\n");
            }
         }
         else
         {
            if(extraIndent) f.Printf("   ");
            f.Printf("      ");
            if(returnType.kind != voidType)
               f.Printf("return ");
            f.Printf("%s::%s(", isInstance ? _class.name : _class.base.name, method.name);
            for(param = dataType.params.first; param; param = param.next)
            {
               if(param.prev) f.Printf(", ");
               if(param.kind != voidType)
                  f.Printf(param.name);
            }
            f.Printf(");\n");
         }
      }

      if(extraIndent) f.Printf("   ");
      f.Printf("   %c", CloseBracket);
      // f.Printf("\n");

      delete f;

      if(extraIndent) { x1 += 3; x2 += 3; }
      editBox.SetSelPos(l1, y1, x1 + 6, l2, y2, x2 + 6);

      this.updatingCode = false;

   }

   // Return false if we overrided a function and don't want to run params listing
   bool InvokeAutoComplete(bool enumOnly, int pointer, bool caretMove)
   {
      bool didOverride = false;
      EditLine line = editBox.line;
      int lineNum, charPos;
      Expression exp = null;
      EditLine l1, l2;
      int x1,y1, x2,y2;
      //Identifier id = null;
      Expression memberExp = null;
      Identifier realIdentifier = null;

      if(!parsing) return true;
      if(!privateModule) return !didOverride;

      insideFunction = null;

      charPos = editBox.charPos + 1;
      if(!membersListShown)
      {
         EnsureUpToDate();
      }

      editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
      {
         EditBoxStream f { editBox = editBox };

         updatingCode = true;
         editBox.SetSelPos(l1, y1, x1, l2, y2, x2);
         for(;;)
         {
            char ch;
            if(!f.Seek(-1, current))
               break;
            f.Getc(&ch);
            if(!isspace(ch)) break;
            f.Seek(-1, current);
         }
         editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

         lineNum = editBox.lineNumber + 1;
         charPos = editBox.charPos + 1;
         delete f;
         updatingCode = false;
      }

      if(!membersListShown)
      {
         memberExp = FindExpTree(ast, lineNum, charPos);
         if(memberExp && (memberExp.type == TypeKind::memberExp || memberExp.type == pointerExp) && !memberExp.addedThis)
         {
         }
         else if(!pointer)
         {
            editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
            {
               EditBoxStream f { editBox = editBox };
               char ch = 0;

               updatingCode = true;

               editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

               f.Getc(&ch);
               if(ch == '}' || ch == ',' || ch == ')')
               {
                  f.Seek(-1, current);
                  ch = ' ';
               }
               if(isspace(ch))
               {
                  for(;;)
                  {
                     char ch;
                     if(!f.Seek(-1, current))
                        break;
                     f.Getc(&ch);
                     if(!isspace(ch)) break;
                     f.Seek(-1, current);
                  }
               }
               else
                  f.Seek(-1, current);

               editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

               lineNum = editBox.lineNumber + 1;
               charPos = editBox.charPos + 1;
               delete f;
               updatingCode = false;
            }

            realIdentifier = FindCtxTree(ast, lineNum, charPos);
            exp = ctxInsideExp;
         }
      }

      editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
      lineNum = editBox.lineNumber + 1;
      charPos = editBox.charPos/* + 1*/;

      {
         int rowCount;
         char tempString[1024];
         char * string = null;
         CodePosition idStart { };
         CodePosition idEnd { };

         if(membersListShown)
         {
            const char * buffer = membersLine.text;
            int c;
            bool firstChar = true;
            int len = 0;
            string = tempString;

            for(c = membersLoc.start.charPos; c<membersLoc.end.charPos; c++)
            {
               bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
               if(!isSpace) firstChar = false;
               if(!firstChar)
                  string[len++] = buffer[c];
            }
            string[len] = 0;
         }
         else //if(realIdentifier)//if(id)
         {
            /*
            char * buffer = id.string;
            int c;
            bool firstChar = true;
            int len = 0;
            string = tempString;
            for(c = 0; c<= charPos - id.loc.start.charPos; c++)
            {
               bool isSpace = (buffer[c] == ' ' || buffer[c] == '\t');
               if(!isSpace) firstChar = false;
               if(!firstChar)
                  string[len++] = buffer[c];
            }
            string[len] = 0;
            */
            int x = 0, y;
            int len = 0;
            EditLine editLine = editBox.line;
            bool firstChar = true;
            bool done = false;

            string = tempString;
            for(y = lineNum-1; y >= 0; y--)
            {
               const char * buffer = editLine.text;
               int lineCount = editLine.count;
               for(x = (y == lineNum-1) ? (Min(charPos, lineCount) - 1 ): lineCount-1; x >= 0; x--)
               {
                  bool isSpace = (buffer[x] == ' ' || buffer[x] == '\t');
                  if(!isSpace)
                  {
                     if(firstChar)
                     {
                        idEnd.charPos = x + 2;
                        idEnd.line = y + 1;
                     }
                     firstChar = false;
                  }
                  // TESTING THIS CODE HERE FOR NOT CONSIDERING bool when doing ctrl-space past it
                  else if(firstChar)
                  {
                     idEnd.charPos = x + 2;
                     idEnd.line = y + 1;
                     done = true;
                     break;
                  }
                  if(!firstChar)
                  {
                     if(!isalnum(buffer[x]) && buffer[x] != '_')
                     {
                        x++;
                        done = true;
                        break;
                     }
                     memmove(string+1, string, len++);
                     string[0] = buffer[x];
                  }
               }

               //if(done || firstChar)
               if(done || !firstChar)
                  break;
               editLine = editLine.prev;
            }
            string[len] = 0;
            if(!strcmp(string, "case"))
            {
               idEnd.charPos += 4;
               x+=4;
               string[0] = '\0';
            }
            else if(!strcmp(string, "return"))
            {
               idEnd.charPos += 6;
               x+=6;
               string[0] = '\0';
            }
            else if(!strcmp(string, "delete"))
            {
               idEnd.charPos += 6;
               x+=6;
               string[0] = '\0';
            }
            else if(!strcmp(string, "new"))
            {
               idEnd.charPos += 3;
               x+=3;
               string[0] = '\0';
            }
            else if(!strcmp(string, "renew"))
            {
               idEnd.charPos +=5;
               x+=5;
               string[0] = '\0';
            }
            if(x < 0) x = 0;

            idStart.charPos = x + 1;
            idStart.line = y + 1;
         }

         if(!membersListShown)
         {
            membersList.Clear();
            if(memberExp && (memberExp.type == ExpressionType::memberExp || memberExp.type == pointerExp) && !memberExp.addedThis)
            {
               Type type = memberExp.member.exp.expType;
               if(pointer == 2 && type)
               {
                  if(type.kind == pointerType || type.kind == arrayType)
                     type = type.type;
                  /*else
                     type = null;*/
               }
               ListMembers(type);
            }
            else if(!pointer)
            {
               ListSymbols(exp, enumOnly, string, realIdentifier);
            }
            membersList.Sort(null, 1);
         }

         if(insideFunction)
         {
            // Virtual function override
            Identifier id = GetDeclId(insideFunction.declarator);
            char * string = id ? id.string : null;

            Method method = eClass_FindMethod(GetThisClass(), string, this.privateModule);
            if(method)
            {
               if(method.type != virtualMethod || (!insideInstance && method._class == GetThisClass()))
                  insideFunction = null;
               else
               {
                  OverrideVirtualFunction(insideFunction, method, GetThisClass(), insideInstance, insideInstance && insideClass);
                  didOverride = true;
               }
            }
         }
         if(!didOverride) //insideFunction)
         {
            rowCount = membersList.rowCount;
            if(rowCount)
            {
               DataRow row = string ? membersList.FindSubString(string) : null;
               if(row && !membersList.FindSubStringAfter(row, string) && !caretMove)
               {
                  const char * newString = row.string;
                  if(!membersListShown)
                  {
                     membersLoc.start.line = idStart.line-1;
                     membersLoc.start.charPos = idStart.charPos-1;
                     //membersLoc.end = membersLoc.start;
                      membersLoc.end.charPos = idEnd.charPos-1;
                      membersLoc.end.line = idEnd.line-1;
                     //membersLoc.end.charPos = idStart.charPos + strlen(string)-1; //end.charPos-1;
                     //membersLoc.end.charPos = idStart.charPos + strlen(string)-1; //end.charPos-1;
                     membersLine = line;
                  }
                  else
                  {
                     membersList.Destroy(0);
                     membersListShown = false;
                  }

                  editBox.GoToPosition(membersLine, membersLoc.start.line, membersLoc.start.charPos);
                  editBox.Delete(
                     line, membersLoc.start.line, membersLoc.start.charPos,
                     line, membersLoc.end.line, membersLoc.end.charPos);
                  editBox.PutS(newString);
               }
               else
               {
                  if(!row)
                  {
                     row = membersList.FindSubStringi(string);
                     if(row)
                        membersList.currentRow = row;
                     membersList.currentRow.selected = false;
                  }
                  else
                     membersList.currentRow = row;

                  if(!membersListShown)
                  {
                     Point caret;

                     // TESTING THESE ADDITIONS TO THE IF SO THAT CARET ISNT MOVED IF NOT ON TOP OF A WORD
                     if(string && string[0] && lineNum == idStart.line && charPos >= idStart.charPos-1 && charPos <= idEnd.charPos-1)
                        editBox.SetSelPos(l1, y1, idStart.charPos-1, l2, y2, idStart.charPos-1);
                     editBox.GetCaretPosition(caret);
                     editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

                     membersList.master = this;

                     caret.y += editBox.GetCaretSize();
                     caret.x -= 20;
                     membersList.Create();

                     {
                        int x = caret.x + editBox.absPosition.x - app.desktop.absPosition.x - editBox.scroll.x;
                        int y = caret.y + editBox.absPosition.y - app.desktop.absPosition.y - editBox.scroll.y;
                        Window parent = membersList.parent;

                        if(!paramsAbove && (paramsShown || y + membersList.size.h > parent.clientSize.h))
                        {
                           y -= editBox.GetCaretSize() + membersList.size.h;
                           membersAbove = true;
                        }
                        else
                           membersAbove = false;

                        membersList.position = { x, y };
                     }

                     membersLine = l1;
                     membersLoc.start.line = lineNum - 1;

                     if(string && string[0])
                     {
                        membersLoc.start.charPos = idStart.charPos-1;
                        membersLoc.end = membersLoc.start;
                        //membersLoc.end.charPos = id.loc.end.charPos-1;
                        membersLoc.end.charPos = idStart.charPos + strlen(string)-1; //end.charPos-1;
                     }
                     else
                     {
                        membersLoc.start.charPos = charPos;
                        membersLoc.end = membersLoc.start;
                        membersLoc.end.charPos = charPos;
                     }
                     membersListShown = true;

                     // Hack to keep caret shown
                     editBox.GetCaretPosition(caret);
                     editBox.SetCaret(caret.x, caret.y, editBox.GetCaretSize());
                  }
                  if(row)
                     membersList.SetScrollPosition(0, row.index * membersList.rowHeight);
               }
            }
         }
      }

      SetCurrentContext(globalContext);
      SetThisClass(null);

      return !didOverride;
   }

   void InvokeParameters(bool exact, bool reposition, bool caretMove)
   {
      int lineNum, charPos;
      EditLine l1, l2;
      int x1,y1, x2,y2;

      if(!parsing) return;

      charPos = editBox.charPos + 1;
      EnsureUpToDate();

      editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
      {
         EditBoxStream f { editBox = editBox };
         char ch;

         updatingCode = true;
         editBox.SetSelPos(l1, y1, x1, l2, y2, x2);

         f.Getc(&ch);
         if(ch == '}' || ch == ',' || ch == ')')
         {
            f.Seek(-1, current);
            ch = ' ';
         }
         if(isspace(ch))
         {
            for(;;)
            {
               char ch;
               if(!f.Seek(-1, current))
                  break;
               f.Getc(&ch);
               if(!isspace(ch)) break;
               f.Seek(-1, current);
            }
         }
         else
            f.Seek(-1, current);

         editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);

         lineNum = editBox.lineNumber + 1;
         charPos = editBox.charPos + 1;
         delete f;
         updatingCode = false;
      }

      charPos = Min(charPos, l1.count + 1);
      if(!caretMove)
         FindParamsTree(ast, lineNum, charPos);

      // Not sure about this == ExpCall... paramsInsideExp doesn't seem to necessarily be a ExpCall
      if(exact && ((::functionType && paramsInsideExp.type == callExp && paramsInsideExp.call.exp.loc.end.charPos != charPos-1) /*|| instanceType*/))
      {
         ::functionType = null;
         ::instanceType = null;
      }

      //if((::functionType || ::instanceType) && (!paramsShown || insideExp != functionExp || ::paramsID != this.paramsID))
      if((::functionType || ::instanceType) && (!paramsShown || true /*paramsInsideExp.destType != functionExp.destType */|| ::paramsID != this.paramsID))
      {

         int x, y;
         Window parent = paramsList.parent;

         if(this.functionType != ::functionType || this.instanceType != ::instanceType)
            reposition = false;

         if(!this.paramsShown || reposition || paramsInsideExp != functionExp || ::instanceType) // Added instanceType here, otherwise instance popups never reposition...
                                                                                                          // ( Dummy exp: always ends up with same memory)
         {
            editBox.GetSelPos(&l1, &y1, &x1, &l2, &y2, &x2, false);
            editBox.GetCaretPosition(paramsPosition);
            this.paramsPosition.y += editBox.GetCaretSize();
         }

         FreeType(this.functionType);
         FreeType(this.instanceType);

         this.functionType = ::functionType;
         this.instanceType = ::instanceType;

         if(this.functionType) this.functionType.refCount++;
         if(this.instanceType) this.instanceType.refCount++;

         this.paramsID = ::paramsID;
         functionExp = paramsInsideExp;

         paramsList.master = this;

         paramsList.Create();

         x = paramsPosition.x + editBox.absPosition.x - app.desktop.absPosition.x - editBox.scroll.x;
         y = paramsPosition.y + editBox.absPosition.y - app.desktop.absPosition.y - editBox.scroll.y;

         if(!this.membersAbove && ( this.membersListShown || y + paramsList.size.h > parent.clientSize.h) )
         {
            y -= editBox.GetCaretSize() + paramsList.clientSize.h;
            paramsAbove = true;
         }
         else
            paramsAbove = false;
         if(x + paramsList.size.w > parent.clientSize.w)
         {
            x = parent.clientSize.w - paramsList.size.w;
            if(x < 0) x = 0;
         }

         paramsList.position = { x, y };

         // Hack to keep caret shown
         {
            Point caret;
            editBox.GetCaretPosition(caret);
            editBox.SetCaret(caret.x, caret.y, editBox.GetCaretSize());
         }

         this.paramsShown = true;
      }
      else if((!::functionType && !::instanceType) || reposition)
      {
         paramsList.Destroy(0);
         paramsShown = false;

         FreeType(this.functionType);
         FreeType(this.instanceType);
         this.functionType = null;
         this.instanceType = null;
         this.paramsID = -1;
      }

      SetCurrentContext(globalContext);
      SetThisClass(null);
   }

   bool ViewDesigner()
   {
      if(designer)
      {
         designer.visible = true;
         designer.Activate();
      }
      return true;
   }
};

CodeEditor NewCodeEditor(Window parent, WindowState state, bool modified)
{
   CodeEditor document { state = state, parent = parent, modifiedDocument = modified };
   document.Create();
   return document;
}

static int nofdigits(int v)
{
   if(v == MININT) return 10 + 1;
   if(v < 0) return nofdigits(-v) + 1;
   if(v >= 10000)
   {
      if(v >= 10000000)
      {
         if(v >= 100000000)
         {
            if(v >= 1000000000)
               return 10;
            return 9;
         }
         return 8;
      }
      if(v >= 100000)
      {
         if(v >= 1000000)
            return 7;
         return 6;
      }
      return 5;
   }
   if(v >= 100)
   {
      if(v >= 1000)
         return 4;
      return 3;
   }
   if(v >= 10)
      return 2;
   return 1;
}
