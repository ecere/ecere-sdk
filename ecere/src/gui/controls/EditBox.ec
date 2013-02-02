namespace gui::controls;

/*
selectionForeground = white;
disabled: defaultTextColor = Color { 85, 85, 85 };
*/

import "Window"
import "ReplaceDialog"
import "FindDialog"
import "GoToDialog"
import "Array"

public class SyntaxColorScheme
{
public:
   Color commentColor;
   Color charLiteralColor;
   Color stringLiteralColor;
   Color preprocessorColor;
   Color numberColor;
   private Array<Color> keywordColors { };

   public property Container<Color> keywordColors
   {
      set { keywordColors.Copy((void *)value); }
      get { return keywordColors; }
   }
};

#include <stdarg.h>

#define MAXWORDLEN   64

#define XOFFSET   (3 + (/*style.lineNumbers?6 * this.space.w:*/0))
// #define YOFFSET   1
#define YOFFSET   (style.multiLine ? 1 : ((clientSize.h + 1 - space.h) / 2))

#define IS_ALUNDER(ch) (/*(ch) == '_' || */CharMatchCategories((ch), letters|numbers|marks|connector))

#define UTF8_IS_FIRST(x)   (__extension__({ byte b = x; (!(b) || !((b) & 0x80) || ((b) & 0x40)); }))
#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))
#define UTF8_GET_CHAR(string, numBytes) \
   __extension__( \
   { \
      unichar ch; \
      byte b = (string)[0]; \
      int i; \
      byte mask = 0x7F; \
      numBytes = 1; \
      ch = 0; \
      if(b & 0x80 && b & 0x40) \
      { \
         mask >>= 2; \
         numBytes++; \
         if(b & 0x20) \
         { \
            numBytes++; \
            mask >>= 1; \
            if(b & 0x10) \
            { \
               numBytes++; \
               mask >>= 1; \
            } \
         } \
      } \
      for(i = 0; i<numBytes; i++) \
      { \
         ch <<= 6; \
         ch |= (string)[i] & mask; \
         mask = 0x3F; \
      } \
      ch; \
   })

class EditBoxBits
{
   bool autoEmpty:1, readOnly:1, multiLine:1, stuckCaret:1, freeCaret:1, select:1, hScroll:1, vScroll:1, smartHome:1;
   bool noCaret:1, noSelect:1, tabKey:1, useTab:1, tabSel:1, allCaps:1, syntax:1, wrap:1;

   // Syntax States
   bool inMultiLineComment:1, inPrep:1, escaped:1, continuedSingleLineComment:1;

   bool recomputeSyntax:1;
   bool cursorFollowsView:1;
   
   // bool lineNumbers:1;
   bool autoSize:1;
};

/* TODO:
void UnregisterClass_EditBox()
{
   int g;
   for(g = 0; g<NUM_KEYWORD_GROUPS; g++)
   {
      if(keyLen[g])
         free(keyLen[g]);
   }
}
*/

default:
extern int __ecereVMethodID_class_OnFree;
private:

static class ArrayImpl
{
   uint size;
   Class type;
   byte * array;
};

public class OldArray
{
   uint size;

   ~OldArray()
   {
      int c;
      void ** array = (void **)((ArrayImpl)this).array;
      if(type.type == normalClass || type.type == noHeadClass)
      {
         for(c = 0; c<size; c++)
            type._vTbl[__ecereVMethodID_class_OnFree](type, array[c]);
      }
      // TODO: Call OnFree for structClass
      delete ((ArrayImpl)this).array;
   }

public:   
   Class type;
   property uint size
   {
      set
      {
         if(((ArrayImpl)this).array)
         {
            if(value == size) 
               return;
            ((ArrayImpl)this).array = renew0 ((ArrayImpl)this).array byte[type.typeSize * value];
         }
         else if(value)
            ((ArrayImpl)this).array = new0 byte[value * type.typeSize];
         size = value;
      }
      get { return size; }
   }
   property void * data
   {
      set
      {
         memcpy(((ArrayImpl)this).array, value, type.typeSize * size);
      }
   }
};

public class UndoAction : struct
{
public:
   subclass(UndoAction) type;
   virtual void Undo(void * data) { type.Undo(this, data); }
   virtual void Redo(void * data) { type.Redo(this, data); }
#ifdef _DEBUG
   virtual void Print(void * data)  { type.Print(this, data); }
#endif
   ~UndoAction()
   {
      if(((Class)type).Destructor)
         ((void (*)(void *))((Class)type).Destructor)(this);
   }
};

public class UndoBuffer
{
   Array<UndoAction> actions { size = 8 };
public:
   int count;
   int curAction;
   void * data;
   int dontRecord;
   bool insideRedo;

   dontRecord = 0;

   ~UndoBuffer()
   {
      actions.Free();
   }
   
   void Undo()
   {
      dontRecord++;
      if(curAction > 0)
      {
         UndoAction action = actions[--curAction];
#ifdef _DEBUG
         /*Print("Undoing: ");
         action.Print(data);*/
#endif
         action.Undo(data);
      }
      dontRecord--;
   }

   void Redo()
   {
      dontRecord++;
      insideRedo = true;
      if(curAction < count)
      {
         UndoAction action = actions[curAction];
         curAction++;
#ifdef _DEBUG
         /*Print("Redoing: ");
         action.Print(data);*/
#endif
         action.Redo(data);
      }
      insideRedo = false;
      dontRecord--;
   }

   void Record(UndoAction action)
   {
      if(!dontRecord && !insideRedo)
      {
         if(curAction < count)
         {
            int c;
            for(c = curAction; c < count; c++)
               delete actions[c];
         }

         count = curAction;

         if(count >= actions.size)
            actions.size += actions.size / 2;

#ifdef _DEBUG
         /*Print("Recording: ");
         action.Print(data);*/
#endif
         actions[count++] = action;
         curAction = count;

         if(actions.size > count + count / 2 && count + count / 2 >= 8)
            actions.size = count + count / 2;
      }
      else
         delete action;
   }
};

static class AddCharAction : UndoAction
{
   int y, x;
   unichar ch;
   int addedSpaces, addedTabs;
   type = class(AddCharAction);

   void Undo(EditBox editBox)
   {
      editBox.GoToPosition(null, (ch == '\n') ? (y + 1) : y, (ch == '\n') ? 0 : (x + 1));
      editBox.BackSpace();
      if(addedTabs || addedSpaces)
         editBox.DelCh(editBox.line, y, x - (addedSpaces + addedTabs), editBox.line, y, x, false);
      editBox.UpdateDirty();
   }

   void Redo(EditBox editBox)
   {
      editBox.GoToPosition(null, y, x);
      editBox.PutCh(ch);
      editBox.UpdateDirty();
   }
#ifdef _DEBUG
   void Print(EditBox editBox)
   {
      PrintLn("AddChar: y = ", y, "x = ", x, ", ch = ", ch, ", addedSpaces = ", addedSpaces, ", addedTabs = ", addedTabs);
   }
#endif
};

static class AddTextAction : UndoAction
{
   int y1, x1, y2, x2;
   char * string;
   int addedSpaces, addedTabs;
   type = class(AddTextAction);

#ifdef _DEBUG
   void Print(EditBox editBox)
   {
      PrintLn("AddText: y1 = ", y1, "x1 = ", x1, ", y2 = ", y2, ", x2 = ", x2, ", string = ", string, ", addedSpaces = ", addedSpaces, ", addedTabs = ", addedTabs);
   }
#endif
   ~AddTextAction()
   {
      delete string;
   }

   void Undo(EditBox editBox)
   {
      EditLine l1, l2;
      int c;

      editBox.GoToPosition(null, y1, x1);
      l1 = editBox.line;
      l2 = editBox.lines.first;
      for(c = 0; c < y2 && l2; c++, l2 = l2.next);

      editBox.DelCh(l1, y1, x1, l2, y2, x2, true);
      if(addedTabs || addedSpaces)
         editBox.DelCh(editBox.line, y1, x1 - (addedSpaces + addedTabs), editBox.line, y1, x1, false);

      editBox.SetViewToCursor(true);
      editBox.Modified();
   }

   void Redo(EditBox editBox)
   {
      editBox.GoToPosition(null, y1, x1);
      editBox.PutS(string);
   }
};

static class DelTextAction : UndoAction
{
   int y1, x1, y2, x2;
   char * string;
   bool placeAfter;
   int addedSpaces;
   type = class(DelTextAction);

#ifdef _DEBUG
   void Print(EditBox editBox)
   {
      PrintLn("DelText: y1 = ", y1, "x1 = ", x1, ", y2 = ", y2, ", x2 = ", x2, ", string = ", string, ", addedSpaces = ", addedSpaces, ", placeAfter = ", placeAfter);   
   }
#endif
   void Undo(EditBox editBox)
   {
      editBox.GoToPosition(null, y1, x1);
      editBox.PutS(string);

      if(!placeAfter)
      {
         editBox.GoToPosition(null, y1, x1);
         editBox.selY = y2;
         editBox.selX = x2;
         { int c; editBox.selLine = editBox.lines.first; for(c = 0; c < editBox.selY && editBox.selLine; c++, editBox.selLine = editBox.selLine.next); }
         //editBox.SetViewToCursor(true);

         if(addedSpaces)
            editBox.DelCh(editBox.line, y1, x1 - addedSpaces, editBox.line, y1, x1, false);
      }
      else
      {  
         editBox.selY = y1;
         editBox.selX = x1;
         { int c; editBox.selLine = editBox.lines.first; for(c = 0; c < editBox.selY && editBox.selLine; c++, editBox.selLine = editBox.selLine.next); }         
         //editBox.SetViewToCursor(true);

         if(addedSpaces)
            editBox.DelCh(editBox.selLine, y1, x1 - addedSpaces, editBox.selLine, y1, x1, false);
      }
   }

   void Redo(EditBox editBox)
   {
      EditLine l1, l2;
      int c;

      editBox.GoToPosition(null, y1, x1);
      l1 = editBox.line;

      l2 = editBox.lines.first;
      for(c = 0; c < y2 && l2; c++, l2 = l2.next);

      editBox.DelCh(l1, y1, x1, l2, y2, x2, true);
      editBox.SetViewToCursor(true);
      editBox.Modified();
   }

   ~DelTextAction()
   {
      delete string;
   }
};

static class ReplaceTextAction : UndoAction
{
   int y1, x1, y2, x2, y3, x3;
   char * oldString;
   char * newString;
   bool placeAfter;
   int addedSpaces, addedTabs;

   type = class(ReplaceTextAction);

#ifdef _DEBUG
   void Print(EditBox editBox)
   {
      PrintLn("ReplaceText: y1 = ", y1, "x1 = ", x1, ", y2 = ", y2, ", x2 = ", x2, ", y3 = ", y3, ", x3 = ", x3, ", oldString = ", oldString, ", newString = ", newString, ", addedSpaces = ", addedSpaces, ", addedTabs = ", addedTabs, ", placeAfter = ", placeAfter);   
   }
#endif
   void Undo(EditBox editBox)
   {
      EditLine l1, l3;
      int c;

      editBox.GoToPosition(null, y1, x1);
      l1 = editBox.line;
      l3 = editBox.lines.first;
      for(c = 0; c < y3 && l3; c++, l3 = l3.next);

      editBox.DelCh(l1, y1, x1, l3, y3, x3, true);

      editBox.PutS(oldString);
      if(addedSpaces || addedTabs)
         editBox.DelCh(l1, y1, x1 - (addedSpaces + addedTabs), l1, y1, x1, false);

      //editBox.PutS(oldString);
      if(!placeAfter)
      {
         editBox.GoToPosition(null, y1, x1);
         editBox.selY = y2;
         editBox.selX = x2;
         { int c; editBox.selLine = editBox.lines.first; for(c = 0; c < editBox.selY && editBox.selLine; c++, editBox.selLine = editBox.selLine.next); }
      }
      else
      {
         editBox.selY = y1;
         editBox.selX = x1;
         { int c; editBox.selLine = editBox.lines.first; for(c = 0; c < editBox.selY && editBox.selLine; c++, editBox.selLine = editBox.selLine.next); }
      }
   }

   void Redo(EditBox editBox)
   {
      EditLine l1, l2;
      int c;

      editBox.GoToPosition(null, y1, x1);
      l1 = editBox.line;
      l2 = editBox.lines.first;
      for(c = 0; c < y2 && l2; c++, l2 = l2.next);

      editBox.DelCh(l1, y1, x1, l2, y2, x2, true);

      editBox.PutS(newString);
   }

   ~ReplaceTextAction()
   {
      delete oldString;
      delete newString;
   }
};
/*
static class MoveTextAction : UndoAction
{
   int fy1, fx1, fy2, fx2; 
   int ty, tx;
   type = class(MoveTextAction);

   void Undo(EditBox editBox)
   {

   }

   void Redo(EditBox editBox)
   {

   }
};
*/
public class EditLine : struct
{
   EditLine prev, next;
   char * buffer;
   uint size, count;
   int length;
   EditBox editBox;
public:
   property char * text
   {
      set
      {
         // Only works for single line edit for now...
         EditBox editBox = this.editBox;
         editBox.Clear();
         editBox.PutS(text);
      }
      get { return this ? buffer : null; }
   };
   property EditLine prev { get { return this ? prev : null; } };
   property EditLine next { get { return this ? next : null; } };
   property int count { get { return this ? count : 0; } };
private:
   void Free()
   {
      delete buffer;
   }

   // This makes sure the buffer always contains at least count characters
   // Keeps a count/2 pad for avoiding always reallocating memory.
   bool AdjustBuffer(int count)
   {
      char * buffer;
      int newSize;
      
      // Adds '\0' byte
      count = count+1;

      newSize =  (count + (count >> 1));

      // Shrink down the buffer
      if(size > newSize)
      {
         buffer = new char[newSize];
         if(!buffer) return false;

         if(this.buffer)
         {
            CopyBytes(buffer, this.buffer, count);
            delete this.buffer;
         }
         this.buffer = buffer;
         size = newSize;
         return true;
      }
      // Increase the buffer
      else if(size < count)
      {
          buffer = new char[newSize];
          if(!buffer) return false;

          if(this.buffer)
          {
             CopyBytes(buffer, this.buffer, this.count + 1); // size);
             delete this.buffer;
          }
          this.buffer = buffer;
          size = newSize;
          return true;
      }
      else
         return true;
   }
};

public struct BufferLocation
{
   EditLine line;
   int y, x;

   void AdjustDelete(BufferLocation start, BufferLocation end)
   {
      // Location is before, nothing to do
      if(y < start.y || (y == start.y && x < start.x))
         return;
      // Location is inside deleted bytes, point to the start
      if((y >= start.y && (y > start.y || x >= start.x)) &&
         (y >= end.y && (y > end.y || x >= end.x)))
      {
         // Location is after
         if(y >= end.y)
         {
            // Location is on another line
            if(y > end.y)
               y -= end.y - start.y;
            // Location is the last touched line
            else 
            {
               if(x >= end.x)
               {
                  line = start.line;
                  y = start.y;
                  //if(start.line == end.line)
                     x -= end.x - start.x;
               }
            }
         }
      }
      else
         this = start;
   }

   // Assuming no carriage return before first character ???? fixed?
   void AdjustAdd(BufferLocation start, BufferLocation end)
   {
      int numLines = end.y - start.y;
      if(y >= start.y)
      {
         if(y > start.y)
            y += numLines;
         else
         {
            if(x > start.x || (x == start.x /*&& (numLines ? true : false)*/))
            {
               int c;
               for(c = 0, line = start.line; c<numLines; c++)
                  line = line.next;
               y += numLines;
               //x += numLines ? end.x : (end.x - start.x);            
               x += end.x - start.x;
            }
         }
      }
   }
};

public enum EditBoxFindResult { notFound, found, wrapped };

static char * keyWords1[] =
{
   // C
   "return","break","continue","default","switch","case","if","else","for","while", "do","long","short",
   "void", "char","int","float","double","unsigned","static", "extern", "struct", "union", "typedef","enum",
   "const",   "sizeof",
   "#include", "#define", "#pragma", "#if", "#else", "#elif", "#ifdef", "#ifndef", "#endif", "#undef", "#line",
   "__attribute__", "__stdcall", "_stdcall",
   "__declspec", "goto",
    "inline", "__inline__", "_inline", "__inline", "__typeof","__extension__",
   "asm", "__asm", "_asm", "volatile", "#cpu", "__stdcall__",

   // eC
   "class", "private", "public",
   "property","import",
   "delete", "new", "new0", "renew", "renew0", "define",
   "get", "set",
   "remote",
   "dllexport", "dllimport", "stdcall",
   "subclass", "__on_register_module", "namespace", "using",
   "typed_object", "any_object", "incref", "register", "watch", "stopwatching", "firewatchers", "watchable", "class_designer",
   "class_fixed", "class_no_expansion", "isset", "class_default_property", "property_category", "class_data", "class_property",
   "virtual", "thisclass","unichar", "dbtable", "dbindex", "database_open", "dbfield",

   // Types
   "uint", "uint32", "uint16", "uint64", "bool", "byte", "int64", "uintptr", "intptr",

   // Values
   "this", "true", "false", "null", "value",


   // C++
   "protected",
   /* "defined" */
   null
};

static char * keyWords2[] =
{
   "defined", "warning", null
};

static char ** keyWords[] = { keyWords1, keyWords2 };
#define NUM_KEYWORD_GROUPS (sizeof(keyWords) / sizeof(char **))
//static int * keyLen[NUM_KEYWORD_GROUPS];
static int keyLen[NUM_KEYWORD_GROUPS][sizeof(keyWords1)];

static char searchString[1025], replaceString[1025];
static bool matchCase = false, wholeWord = false, searchUp = false;

static GoToDialog goToDialog
{
   autoCreate = false, isModal = true, text = $"Go To"
};

public class EditBox : CommonControl
{
   class_property(icon) = "<:ecere>controls/editBox.png";
public:

   // Notifications
   virtual bool Window::NotifyModified(EditBox editBox);
   virtual void Window::NotifyCaretMove(EditBox editBox, int line, int charPos);
   virtual void Window::NotifyUpdate(EditBox editBox);
   virtual bool Window::NotifyDoubleClick(EditBox editBox, EditLine line, Modifiers mods);
   virtual void Window::NotifyOvrToggle(EditBox editBox, bool overwrite);
   virtual bool Window::NotifyKeyDown(EditBox editBox, Key key, unichar ch);

   virtual bool Window::NotifyCharsAdded(EditBox editBox, BufferLocation before, BufferLocation after, bool pasteOperation);
   virtual bool Window::NotifyCharsDeleted(EditBox editBox, BufferLocation beforeLoc, BufferLocation after, bool pasteOperation);
   virtual bool Window::NotifyDropped(EditBox editBox, int x, int y);

   virtual bool Window::NotifyUnsetModified(EditBox editBox);

   // Why was this commented out?
   //     It is required otherwise updating font property from property sheet doesn't immediately reflect in form designer,
   // and the scrollArea property isn't compared properly either.
   watch(font)
   {
      font = fontObject;
      if(font) ComputeFont();
      SetInitSize(initSize);
   };

   watch(hasVertScroll)
   {
      if(hasVertScroll)
         style.vScroll = true;
   };

   watch(hasHorzScroll)
   {
      if(hasHorzScroll)
         style.hScroll = true;
   };

   // Properties
   property bool textHorzScroll { property_category $"Behavior" set { style.hScroll = value; } get { return style.hScroll; } };      // Should cut the text on set to false
   property bool textVertScroll { property_category $"Behavior" set { style.vScroll = value; } get { return style.vScroll; } };
   property bool readOnly
   {
      property_category $"Behavior" 
      set
      {
         style.readOnly = value;
         itemEditCut.disabled = value || !selection;
         itemEditDelete.disabled = value || !selection;
         itemEditPaste.disabled = value;
      }
      get { return style.readOnly; }
   };
   property bool multiLine { property_category $"Behavior" set { style.multiLine = value; } get { return style.multiLine; } };
   property bool freeCaret { property_category $"Behavior" set { style.freeCaret = value; } get { return style.freeCaret; } };
   property bool tabKey { property_category $"Behavior" set { style.tabKey = value; } get { return style.tabKey; } };
   property int tabSize { property_category $"Behavior" set { tabSize = value; } get { return tabSize; } };
   property bool tabSelection { property_category $"Behavior" set { style.tabSel = value; if(value) style.tabKey = true; } get { return style.tabSel; } };
   property bool smartHome { property_category $"Behavior" set { style.smartHome = value; } get { return style.smartHome; } };
   property bool autoEmpty { property_category $"Behavior" set { style.autoEmpty = value; } get { return style.autoEmpty; } };
   property bool noCaret { property_category $"Behavior" set { style.noCaret = value; if(value) { style.readOnly = true; style.stuckCaret = true; } } get { return style.noCaret; } };
   property int maxLineSize { property_category $"Behavior" set { maxLineSize = value; } get { return maxLineSize; } };
   property int maxNumLines { property_category $"Behavior" set { maxLines = value; } get { return maxLines; } };
   property bool useTab { property_category $"Behavior" set { style.useTab = value; itemEditInsertTab.checked = value; } get { return style.useTab; } };
   property bool syntaxHighlighting { property_category $"Appearance" set { style.syntax = value; } get { return style.syntax; } };
   property bool noSelect { property_category $"Behavior" set { style.noSelect = value; } get { return style.noSelect; } };
   property bool allCaps { property_category $"Behavior" set { style.allCaps = value; } get { return style.allCaps; } };
   property bool autoSize { property_category $"Behavior" set { style.autoSize = value; } get { return style.autoSize; } };
   property bool wrap { set { style.wrap = value; Update(null); } get { return style.wrap; } };
   //property bool lineNumbers { set { style.lineNumbers = value; } get { return style.lineNumbers; } };
   property int numLines { get { return this ? lineCount : 0; } };
   property int lineNumber { get { return y; } };  // TODO: Change to property of EditLine    this.line.number
   property int column { get { return col; } };   // TODO: Add Set
   property int charPos { get { return x; } };   // TODO: Add Set
   property EditLine firstLine { get { return lines.first; } };      // Change these to a List<EditLine>... (this.lines[10].text)
   property EditLine lastLine  { get { return lines.last; } };
   property EditLine line { get { return this.line; } }; // TODO: Add Set   this.line = this.lines[10]
   property char * contents
   {
      property_category $"Data" 
      set
      {
         if(this)
         {
            Deselect();
            DelCh(this.lines.first, 0, 0, this.lines.last, this.lineCount-1, ((EditLine)(this.lines.last)).count, true);
            if(value)
               AddS(value);
            //SetViewToCursor(true);
            UpdateDirty();
            Home();
         }
      }

      get
      {
         char * buffer = null;
         if(this)
         {
            /* Can't implement this right now because of memory leak... Need string reference counting...
            if(style.multiLine)
            {
               
               EditLine line;
               int len = 0;

               for(line = lines.first; line; line = line.next)
                  len += strlen(line.buffer);

               buffer = new char[len+1];
               len = 0;
               for(line = lines.first; line; line = line.next)
               {
                  int lineLen = strlen(line.buffer);
                  memcpy(buffer + len, line.buffer, lineLen);
                  len += lineLen;
               }
               buffer[len] = '\0';
            else
               */
               buffer = this.line ? this.line.buffer : null;
         }
         return buffer;
      }
   };
   property bool overwrite { get { return overwrite; } };
   property bool caretFollowsScrolling { get { return style.cursorFollowsView; } set { style.cursorFollowsView = value; } }

   property char * multiLineContents
   {
      get
      {
         char * buffer = null;
         if(style.multiLine)
         {
            
            EditLine line;
            int len = 0;

            for(line = lines.first; line; line = line.next)
               len += strlen(line.buffer)+1;

            buffer = new char[len+1];
            len = 0;
            for(line = lines.first; line; line = line.next)
            {
               int lineLen = strlen(line.buffer);
               memcpy(buffer + len, line.buffer, lineLen);
               len += lineLen;
               if(line.next) buffer[len++] = '\n';
            }
            buffer[len] = '\0';         
         }
         return buffer;
      }
   }

   /*
   char * GetLineText()
   {
      if(this)
      {
         return this.line.buffer;
      }
      return null;
   }

   void SetLineText(char * text)
   {
      if(this)
      {
         EditLine_SetText(this.line, text);
      }
   }
   */
   property Color selectionColor { set { selectionColor = value; } get { return selectionColor; } isset { return selectionColor ? true : false; } };
   property Color selectionText  { set { selectionText = value; } get { return selectionText; } isset { return selectionText ? true : false; } };
   property SyntaxColorScheme syntaxColorScheme { set { delete colorScheme; colorScheme = value; incref colorScheme; } }

   // selectionStart.line, selectionStart.column (With Set)
   // selection.line1, selection.line2, selection.column1, selection.column2  (Read only)

   // Methods
private:
   Font font;
   EditBoxBits style;
   int tabSize;
   int maxLineSize;
   int maxLines;
   OldList lines;
   int lineCount;
   // Font Space size
   Size space, large;
   
   // Position of Caret (Not necessarily displayed position)
   int x,y;
   int col;
   // Position of beginning of block (Block ends at (x,y))
   int selX, selY;
   // line is line at carret, selLine is line at beginning of block
   EditLine line, selLine, dropLine;
   // Mouse selection Moving virtual caret
   int dropX, dropY;

   bool selection;

   // ViewX is x offset in pixels, ViewY is y offset in lines
   int viewX, viewY;
   // viewLine is first displayed line
   EditLine viewLine; 

   // start and end of area to redraw
   int startY, endY;

   // MaxLine is the longest line
   EditLine maxLine;
   // MaxLength is the longest line's length
   int maxLength;

   // MouseSelect is true once button is pressed, overwrite is true if mode is on
   bool mouseSelect, mouseMove, overwrite, wordSelect;
   // Timer is used for mouse selection scrolling
   Timer timer
   {
      window = this, delay = 0.1;

      bool DelayExpired()
      {
         // LineDown();
         /*
         if(this.viewY > 200)
            GoToLineNum(0);
         */
         OnMouseMove(mouseX, mouseY, -1);
         return true;
      }
   };

   // (mouseX,mouseY) is the position of the mouse in the edit box
   int mouseX, mouseY;

   bool modified;

   void (* FontExtent)(Display display, Font font, char * text, int len, int * width, int * height);

   Color backColor;
   bool rightButtonDown;
   bool pasteOperation;
   int caretX, caretY;
   UndoBuffer undoBuffer { data = this };
   int savedAction;
   Color selectionColor, selectionText;
   SyntaxColorScheme colorScheme { };

   menu = Menu { };

   // Edit Menu
   Menu editMenu { menu, $"Edit", e };
   MenuItem itemEditCut
   {
      editMenu, $"Cut\tCtrl+X", t, disabled = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         if(!(style.readOnly))
            Cut();
         return true;
      }
   };
   MenuItem itemEditCopy
   {
      editMenu, $"Copy\tCtrl+C", c, disabled = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         Copy();
         return true;
      }
   };
   MenuItem itemEditPaste
   {
      editMenu, $"Paste\tCtrl+V", p;
   
      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         if(!(style.readOnly))
            Paste();
         return true;
      }
   };
   MenuItem itemEditDelete
   {
      editMenu, $"Delete\tDel", d, disabled = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         if(!(style.readOnly))
            DeleteSelection();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem itemEditSelectAll
   {
      editMenu, $"Select All\tCtrl+A", a;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         SelectAll();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem itemEditUndo
   {
      editMenu, $"Undo\tCtrl+Z", u;
      disabled = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         Undo();
         return true;
      }
   };
   MenuItem itemEditRedo
   {
      editMenu, $"Redo\tCtrl+Y", o;
      disabled = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         Redo();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem
   {
      editMenu, $"Find Previous\tShift-F3", e, shiftF3;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         if(searchString[0])
            Find(searchString, wholeWord, matchCase, false);
         else
            itemEditFind.NotifySelect(this, item, mods);
         return true;
      }
   };
   MenuItem
   {
      editMenu, $"Find Next\tF3", n, f3;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         if(searchString[0])
            Find(searchString, wholeWord, matchCase, true);
         else
            itemEditFind.NotifySelect(this, item, mods);
         return true;
      }
   };
   MenuItem itemEditFind
   {
      editMenu, $"Find...\tCtrl+F", f, ctrlF;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         FindDialog dialog
         {
            editBox = this, master = master, isModal = true, searchString = searchString, matchCase = matchCase, wholeWord = wholeWord,
            searchUp = searchUp;

            // TODO:
            // Fix dialog from above shouldn't be visible
            // void NotifyDestroyed(FindDialog dialog, DialogResult result)
            void NotifyDestroyed(Window window, DialogResult result)
            {
               FindDialog dialog = (FindDialog) window;
               searchUp = dialog.searchUp;
               strcpy(searchString, dialog.searchString);
               matchCase = dialog.matchCase;
               wholeWord = dialog.wholeWord;
            }
         };
         dialog.Create();
         return true;
      }
   };
   MenuItem
   {
      editMenu, $"Replace...\tCtrl+R", r, ctrlR;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         ReplaceDialog dialog
         {
            master = master, 
            isModal = true,
            searchString = searchString,
            replaceString = replaceString,
            matchCase = matchCase,
            wholeWord = wholeWord,
            editBox = this;

            // TODO:
            // void NotifyDestroyed(ReplaceDialog dialog, DialogResult result)
            void NotifyDestroyed(Window window, DialogResult result)
            {
               ReplaceDialog dialog = (ReplaceDialog)window;
               char * replace = dialog.replaceString;
               if(replace)
                  strcpy(replaceString, replace);
               strcpy(searchString, dialog.searchString);
               matchCase = dialog.matchCase;
               wholeWord = dialog.wholeWord;
            }
         };
         dialog.Create();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem
   {
      editMenu, $"Go To...\tCtrl+G", g, ctrlG;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         goToDialog.editBox = this;
         goToDialog.master = master;
         goToDialog.Create();
         return true;
      }
   };
   MenuDivider { editMenu };
   MenuItem itemEditInsertTab
   {
      editMenu, $"Insert Tabs", i, checkable = true;

      bool NotifySelect(MenuItem item, Modifiers mods)
      {
         style.useTab = item.checked;
         return true;
      }
   };

   borderStyle = deep;
   snapVertScroll = true;
   snapHorzScroll = true;

   EditBox()
   {
      static bool syntaxInit = false;
      if(!syntaxInit) 
      {
         int g,c;
         syntaxInit = true;
         for(g = 0; g<NUM_KEYWORD_GROUPS; g++)
         {
            for(c = 0; keyWords[g][c]; c++);
            //keyLen[g] = new int[c];
            for(c = 0; keyWords[g][c]; c++)
            {
               keyLen[g][c] = strlen(keyWords[g][c]);
            }
         }

         colorScheme.commentColor = dimGray;
         colorScheme.charLiteralColor = crimson;
         colorScheme.stringLiteralColor = crimson;
         colorScheme.preprocessorColor = green;
         colorScheme.numberColor = teal;
         colorScheme.keywordColors = [ blue, blue ];
      }

      FontExtent = Display::FontExtent;
      font = fontObject;
      lines.offset = (uint)&((EditLine)0).prev;

      style = EditBoxBits { hScroll = true };

      // cursor = guiApp.GetCursor(IBeam);

      // Default Properties
      /*maxLines = 65536;
      maxLineSize = 1024;*/

      maxLines = MAXINT;
      maxLineSize = MAXINT;

      tabSize = 3;
      
      overwrite = false;
      mouseSelect = this.mouseMove = false;
      line = null;
      lineCount = 0;
      x = selX = selY = 0;
      col = 0;
      y = -1;
      line = selLine = null;
      viewX = 0;   
      viewY = 0;
      maxLength = 0;
      maxLine = null;
      startY = 0;
      endY = clientSize.h;
      wordSelect = false;

      // Default space to 8 in case window is not constructed
      space = { 8, 8 };

      undoBuffer.dontRecord++;
      AddCh('\n');
      undoBuffer.dontRecord--;

      viewLine = lines.first;
      style.recomputeSyntax = true;

      FindMaxLine();

      FixScrollArea();

      UpdateCaretPosition(true);
      return true;
   }

   ~EditBox()
   {
      lines.Free(EditLine::Free);
   }

   void FlushBuffer(Surface surface, EditLine line, int wc, int * renderStart, int * x, int y, int numSpaces, Box box)
   {
      int count = wc - *renderStart;
      if(count)
      {
         if(y + space.h >= box.top && y <= box.bottom)
         {
            int w;

            if(!numSpaces)
            {
               //FontExtent(display, font, line.buffer + *renderStart, count, &w, null);
               surface.TextFont(font);
               surface.TextExtent(line.buffer + *renderStart, count, &w, null);
               if(*x + w + XOFFSET > 0)
                  surface.WriteText(XOFFSET + *x,y, line.buffer + *renderStart, count);
               *x += w;
            }
            else
            {
               w = numSpaces; // * space.w;
               if(*x + w + XOFFSET > 0 && surface.GetTextOpacity())
                  surface.Area(XOFFSET + *x - 1, y, XOFFSET + *x + w, y + space.h-1);
                  // WHATS UP WITH THIS...  surface.Area(XOFFSET + *x, y, XOFFSET + *x + w, y + space.h-1);
               *x += w;
            }      
         }
         *renderStart = wc;
      }
   }

   int CheckColors(EditLine line, int wc, bool selection, int selX, int editX, bool *selected, 
                   Color selectionForeground, Color selectionBackground, Color textColor, Color *foreground, Color *background, bool *opacity, bool *overwrite)
   {
      bool flush = false;

      if(selection)
      {
         if((wc == selX && line == selLine) || (wc == editX && line == this.line))
         {
            *selected ^= 1;

            *foreground = (*selected) ? selectionForeground : textColor;
            *background = selectionBackground;
            *opacity = *selected;

            flush = true;
         }
      }

      // Overwrite Carret
      if(this.overwrite && active)
      {
         if((style.stuckCaret && wc == line.count && !line.next) ||
            (!mouseMove && line == this.line && wc == editX))
         {
            *overwrite = true;
            flush = true;
         }
      }
      return flush;
   }

   void FigureStartSyntaxStates(EditLine firstLine, bool reset)
   {
      if(style.syntax)
      {
         bool inMultiLineComment = reset ? false : style.inMultiLineComment;
         bool inString = false;
         bool inQuotes = false;
         bool inPrep = reset ? false : style.inPrep;
         bool inSingleLineComment = false;
         bool escaped = reset ? false : style.escaped;
         bool continuedSingleLineComment = reset ? false : style.continuedSingleLineComment;

         EditLine line = reset ? lines.first : firstLine;
         // int maxBackUp = 1000, c;
         // for(c = 0, line = viewLine; c < maxBackUp && line && line.prev; line = line.prev);
         for(; line != viewLine; line = line.next)
         {
            char * text = line.buffer;
            int c;
            char ch;
            bool lastWasStar = false;
            bool firstWord = true;
            if(!escaped) inPrep = false;
            inSingleLineComment = continuedSingleLineComment;
            escaped = false;
            inString = false;
            inQuotes = false;

            firstWord = true;
            for(c = 0; (ch = text[c]); c++)
            {
               bool wasEscaped = escaped;
               bool backLastWasStar = lastWasStar;
               escaped = false;
               lastWasStar = false;
               if(ch == '/')
               {
                  if(!inSingleLineComment && !inMultiLineComment && !inQuotes && !inString)
                  {
                     if(text[c+1] == '/')
                     {
                        inSingleLineComment = true;
                     }
                     else if(text[c+1] == '*')
                     {
                        inMultiLineComment = true;
                     }
                  }
                  else if(backLastWasStar)
                     inMultiLineComment = false;
               }
               else if(ch == '*')
               {
                  if(!c || text[c-1] != '/') lastWasStar = true;
               }
               else if(ch == '\"' && !inSingleLineComment && !inMultiLineComment && !inQuotes)
               {
                  if(inString && !wasEscaped)
                  {
                     inString = false;
                  }
                  else
                  {
                     inString = true;
                  }
               }
               else if(ch == '\'' && !inSingleLineComment && !inMultiLineComment && !inString)
               {
                  if(inQuotes && !wasEscaped)
                     inQuotes = false;
                  else
                  {
                     inQuotes = true;
                  }
               }
               else if(ch == '\\')
               {
                  if(!wasEscaped)
                     escaped = true;
               }
               else if(ch == '#' && !inQuotes && !inString && !inMultiLineComment && !inSingleLineComment)
               {
                  if(firstWord)
                  {
                     inPrep = true;
                  }
               }
               else if(ch != ' ' && ch != '\t')
                  firstWord = false;
            }
            continuedSingleLineComment = inSingleLineComment && (line.count && line.text[line.count - 1] == '\\');
         }
         
         style.continuedSingleLineComment = continuedSingleLineComment;
         style.inMultiLineComment = inMultiLineComment;
         style.inPrep = inPrep;
         style.escaped = escaped;
      }
   }
   
   /*void OnDrawOverChildren(Surface surface)
   {
      if(style.lineNumbers)
      {
         int currentLineNumber = this.viewY + 1;
         int i;
         char lineText[256];
         for(i = 0; i * space.h < box.height; i++)
         {
            // ********* LINE NUMBERING *********
            surface.SetForeground(Color{60, 60, 60});
            //Highlight current line
            if(this.caretY / space.h == currentLineNumber - 1)
               surface.SetBackground(Color{220, 220, 220});
            else
               surface.SetBackground(Color{230, 230, 230});
            surface.textOpacity = true;
            
            sprintf(lineText,"%5u ", currentLineNumber % 100000);
            if(currentLineNumber > this.lineCount)
               surface.WriteText(0,i*space.h+1,"      ",6);
            else
               surface.WriteText(0,i*space.h+1,lineText,6);
            
            currentLineNumber++;
         }
      }
   }*/

   void OnRedraw(Surface surface)
   {
      EditLine line;
      int y = YOFFSET;
      bool selected = false, selection = true;
      int selX, editX;
      Color selectionBackground = selectionColor ? selectionColor : SELECTION_COLOR;
      Color selectionForeground = selectionText ? selectionText : SELECTION_TEXT;
      Color defaultTextColor = property::foreground;
      Color textColor;
      Box box;
      int maxW = clientSize.w;
      
      Color foreground, background;
      bool opacity;

      // Overwrite Caret Stuff
      bool overWrite = false;
      int overWriteX, overWriteY;
      byte overWriteCh;

      // ****** SYNTAX STATES ******
      bool inMultiLineComment = style.inMultiLineComment;
      bool inString = false;
      bool inQuotes = false;
      bool inPrep = style.inPrep;
      bool inSingleLineComment = false;
      bool escaped = style.escaped;
      bool continuedSingleLineComment = style.continuedSingleLineComment;
      // ****** ************* ******

      if(!isEnabled)
         defaultTextColor = Color { 85, 85, 85 };
      textColor = defaultTextColor;

      if(
         Abs(selectionBackground.r - property::background.r) + 
         Abs(selectionBackground.g - property::background.g) + 
         Abs(selectionBackground.b - property::background.b) < 92)
      {
         selectionBackground = formColor;
         selectionForeground = selectionColor ? selectionColor : SELECTION_COLOR;
      }

      surface.TextFont(this.font);
   /*
      surface.SetBackground(GDefaultPalette()[RND_Get(1, 15)]);
      surface.Area(0,0,MAXINT,MAXINT);
   */

      if(!isEnabled)
      {
         surface.SetBackground(formColor);
         surface.Area(0,0,clientSize.w, clientSize.h);
      }

      if(this.selX == this.x && this.selY == this.y)
         selection = false;

      if(style.freeCaret)
      {
         editX = this.x;
         selX  = this.selX;
      }
      else
      {  
         editX = Min(this.x,this.line.count);
         selX  = Min(this.selX,this.selLine.count);
      }

      selected = (this.selY < this.viewY) ^ (this.y < this.viewY);

      foreground = selected ? selectionForeground : textColor;
      background = selectionBackground;
      opacity = selected;
   /*
      opacity = true;
      background = WHITE;
   */
      surface.SetForeground(foreground);
      surface.SetBackground(background);
      surface.TextOpacity(opacity);

      surface.GetBox(box);

      for(line = this.viewLine; line; line = line.next)
      {
         int x = -this.viewX;
         int end;
         int c;
         int start = 0;
         Color newTextColor = textColor = defaultTextColor;
         bool lineComplete = false;
        

         // ****** SYNTAX HIGHLIGHTING ******
         bool lastWasStar = false;
         bool firstWord = true;
         if(!escaped) inPrep = false;
         inSingleLineComment = continuedSingleLineComment;
         escaped = false;
         inString = false;
         inQuotes = false;
         // *********************************

   /*   === DEBUGGING TOOL FOR MAXLINE ===

         if(line == this.maxLine)
         {
            surface.SetBackground(GREEN|0xFF000000);
            surface.TextOpacity(true);
         }
         else
         {
            surface.TextOpacity(selected ? true : false);
            surface.SetBackground(selected ? SELECTION_COLOR|0xFF000000 : BLACK|0xFF000000);
         }
   */
         
         if(line == this.selLine && line == this.line)
         {
            end = Max(line.count, this.x);
            end = Max(end, this.selX);
         }
         else if(line == this.selLine)
            end = Max(line.count, this.selX);
         else if(line == this.line)
            end = Max(line.count, this.x);
         else
            end = line.count;

         for(c=0; c<end; )
         {
            int bufferLen = 0;
            int wordLen = 0;
            bool spacing = true;
            bool cantHaveWords = false;
            int w = 0;

            if(lineComplete)
            {
               x = -viewX;
               y += space.h;
               lineComplete = false;
            }
            
            textColor = newTextColor;
            if(!selected)
            {
               foreground = textColor;
               surface.SetForeground(textColor);
            }

            // Look at words
            for(; c<end && !cantHaveWords;)
            {
               if(wordLen)
               {
                  bufferLen += wordLen;
                  wordLen = 0;
               }
#ifdef _DEBUG
               /*if(line.count > 4000)
               {
                  printf("oh");
                  CheckMemory();
               }*/
#endif
               // Parse Words
               for(; c<line.count; c++)
               {
                  unichar ch = line.buffer[c];
                  unichar bf = (wordLen == 1) ? line.buffer[c-1] : 0;
                  //if(ch == ' ' || ch == '\t' || (wordLen && (ch == '(' || ch == ')' || ch == ';' || ch == ':')) || (wordLen == 1 && line.buffer[c-1] == '('))
                  if(CharMatchCategories(ch, separators) || /*ch == ' ' ||*/ ch == '\t' ||
                     (wordLen && !CharMatchCategories(ch, numbers|letters|marks|connector) && ch != '#' /*&& ch != '_'*/) || 
                     (bf && !CharMatchCategories(bf, numbers|letters|separators|marks|connector) && bf != '#' && bf != '\t' /*&& bf != '_' && bf != ' '*/))
                     break;
                  wordLen++;
               }

               if(!wordLen)
               {
               
                  for(; c<line.count; c++)
                  {
                     unichar ch = line.buffer[c];
                     if(ch == '\t' || ch == ' ')
                     {
                        cantHaveWords = true;
                        if(bufferLen)
                           break;
                     }
                     if(ch != ' ' && ch != '\t')
                        break;
                     wordLen++;
                  }

                  if(c == line.count && c < end)
                  {
                     if(bufferLen)
                     {
                        c -= wordLen;
                        break;
                     }
                     wordLen += end - c;
                     c = end;
                     cantHaveWords = true;
                  }

                  if(c < end)
                     escaped = false;
                  lastWasStar = false;
               }
               else
               {
                  if(isEnabled)
                  {
                     bool backEscaped = escaped;
                     bool backLastWasStar = lastWasStar;
                     bool backInMultiLineComment = inMultiLineComment;
                     bool backInString = inString;
                     bool backInQuotes = inQuotes;
                     bool backInPrep = inPrep;
                     bool backInSingleLineComment = inSingleLineComment;

                     char * word = line.buffer + c - wordLen;
                     int g,ccc;
                     bool wasEscaped = escaped;
                     escaped = false;
                     lastWasStar = false;

                     // Determine Syntax Highlighting
                     newTextColor = defaultTextColor;
                     if(style.syntax)
                     {
                        if(inSingleLineComment || inMultiLineComment)
                        {
                           newTextColor = colorScheme.commentColor;
                        }
                        else if(inQuotes)
                        {
                           newTextColor = colorScheme.charLiteralColor;
                        }
                        else if(inString)
                        {
                           newTextColor = colorScheme.stringLiteralColor;
                        }
                        else if(inPrep)
                        {
                           newTextColor = colorScheme.preprocessorColor;
                        }
                        if(wordLen == 1 && word[0] == '/')
                        {
                           if(!inSingleLineComment && !inMultiLineComment && !inQuotes && !inString)
                           {
                              if(word[1] == '/')
                              {
                                 inSingleLineComment = true;
                                 newTextColor = colorScheme.commentColor;
                              }
                              else if(word[1] == '*')
                              {
                                 inMultiLineComment = true;
                                 newTextColor = colorScheme.commentColor;
                              }
                           }
                           else if(backLastWasStar)
                              inMultiLineComment = false;
                        }
                        else if(wordLen == 1 && word[0] == '*')
                        {
                           if(!c || word[-1] != '/')
                              lastWasStar = true;
                        }
                        else if(!inSingleLineComment && !inMultiLineComment && !inQuotes && wordLen == 1 && word[0] == '\"')
                        {
                           if(inString && !wasEscaped)
                           {
                              inString = false;
                           }
                           else
                           {
                              inString = true;
                              newTextColor = colorScheme.stringLiteralColor;
                           }
                        }
                        else if(!inSingleLineComment && !inMultiLineComment && !inString && wordLen == 1 && word[0] == '\'')
                        {
                           if(inQuotes && !wasEscaped)
                              inQuotes = false;
                           else
                           {
                              inQuotes = true;
                              newTextColor = colorScheme.charLiteralColor;
                           }
                        }
                        else if(wordLen == 1 && word[0] == '\\')
                        {
                           if(!wasEscaped)
                              escaped = true;
                        }
                        else if(!inQuotes && !inString && !inMultiLineComment && !inSingleLineComment && 
                           ( ( isdigit(word[0]) /*&& (!c || word[-1] == ' ' || word[-1] == '\t')*/ ) || (word[0] == '.' && isdigit(word[1]))))
                        {
                           newTextColor = colorScheme.numberColor;
                        }
                        else
                        {
                           if(!inQuotes && !inString && !inMultiLineComment && !inSingleLineComment && word[0] == '#')
                           {
                              if(firstWord)
                              {
                                 inPrep = true;
                                 newTextColor = colorScheme.preprocessorColor; 
                              }
                           }
                           if(!inQuotes && !inString && !inMultiLineComment && !inSingleLineComment)
                           {
                              for(g = 0; g < ((inPrep && word[0] != '#') ? 2 : 1); g++)
                              {
                                 char ** keys = keyWords[g];
                                 int * len = keyLen[g];
                                 for(ccc = 0; keys[ccc]; ccc++)
                                 {
                                    if(len[ccc] == wordLen && !strncmp(keys[ccc], word, wordLen))
                                    {
                                       newTextColor = colorScheme.keywordColors[g];
                                       break;
                                    }
                                 }
                              }
                           }
                        }
                        firstWord = false;

                        // If highlighting for this word is different, break
                        if(newTextColor != textColor)
                        {
                           if(bufferLen)
                           {
                              // Better solution than going back?
                              c -= wordLen;

                              // Reset syntax flags
                              escaped = backEscaped;
                              lastWasStar = backLastWasStar;
                              inMultiLineComment = backInMultiLineComment;
                              inString = backInString;
                              inQuotes = backInQuotes;
                              inPrep = backInPrep;
                              inSingleLineComment = backInSingleLineComment;
                              break;
                           }
                           else
                           {
                              textColor = newTextColor;
                              if(!selected)
                              {
                                 foreground = textColor;
                                 surface.SetForeground(textColor);
                              }
                           }
                        }
                     }
                  }
               
                  // If we're not breaking, this can't be rendered as spacing anymore
                  spacing = false;

                  // Do word wrapping here
                  if(style.wrap)
                  {
                     //if(!numSpaces)
                     {
                        int tw;
                        FontExtent(display, font, line.buffer + start, bufferLen + wordLen, &tw, null);
                        w = tw;
                     }
                     /*else
                     {
                        w += numSpaces * space.w;
                     }*/
                     if(x + viewX + w > maxW)
                     {
                        c -= wordLen;
                        lineComplete = true;                        
                        break;
                     }
                  }
               }
               bufferLen += wordLen;
               wordLen = 0;
            }

            {
               int renderStart = start;
               bool flush = false;
               int numSpaces = 0;
               int wc;

               // Render checking if we need to split because of selection or to find where to draw insert caret
               for(wc = start; wc < start + bufferLen; wc++)
               {
                  flush = CheckColors(line, wc, selection, selX, editX, &selected, selectionForeground,
                     selectionBackground, textColor, &foreground, &background, &opacity, &overWrite);
                  if(overWrite == true)
                  {
                     overWriteCh = (wc < line.count) ? line.buffer[wc] : ' ';
                     if(overWriteCh == '\t') overWriteCh = ' ';
                  }

                  if(flush)
                  {
                     FlushBuffer(surface, line, wc, &renderStart, &x, y, numSpaces, box);
                     if(overWrite == true)
                     {
                        overWriteX = x;
                        overWriteY = y;
                        overWrite = 2;
                     }
                     numSpaces = 0;

                     surface.TextOpacity(opacity);
                     surface.SetBackground(background);
                     surface.SetForeground(foreground);

                     flush = false;
                  }

                  if(spacing)
                  {
                     if(wc < line.count && line.buffer[wc] == '\t')
                     {
                        numSpaces += (tabSize * space.w) - ((x + numSpaces + viewX) % (tabSize * space.w));
                     }
                     else
                     {
                        numSpaces += space.w;
                     }
                  }
               }
               FlushBuffer(surface, line, wc, &renderStart, &x, y, numSpaces, box);
               start += bufferLen;
            }
         }

         if(CheckColors(line, c, selection, selX, editX, &selected, selectionForeground,
                        selectionBackground, textColor, &foreground, &background, &opacity, &overWrite))
         {
            if(overWrite == true)
            {
               overWriteX = x;
               overWriteY = y;
               overWriteCh = ' ';
               overWrite = 2;
            }
            surface.TextOpacity(opacity);
            surface.SetBackground(background);
            surface.SetForeground(foreground);
         }

         if(style.freeCaret && selected)
         {
            surface.SetBackground(selectionBackground);
            surface.Area(x + XOFFSET - 1,y,clientSize.w-1,y+this.space.h-1);
            // TEST: surface.Area(x + XOFFSET,y,clientSize.w-1,y+this.space.h-1);
         }


         /*
         if(style.freeCaret && selected)
         {
            surface.SetBackground(selectionBackground);
            surface.Area(x + XOFFSET - 1,y,clientSize.w-1,y+this.space.h-1);
         }
         */
         
         continuedSingleLineComment = inSingleLineComment && (line.count && line.text[line.count - 1] == '\\');

         y+=this.space.h;
         if(y > box.bottom) // >=clientSize.h) 
            break;
      }

      if(overWrite)
      {
         surface.TextOpacity(true);
         surface.SetForeground(black);
         surface.SetBackground(Color {255,255,85});
         surface.WriteText(XOFFSET + overWriteX,overWriteY, &overWriteCh, 1);
      }
   }

   void FixScrollArea()
   {
      if(style.hScroll || style.vScroll)
      {
         int width = maxLength + XOFFSET;
         int height = lineCount * space.h;
         if(style.freeCaret && line)
         {
            if(x > selX)
            {
               if(x > line.count)
                  width = Max(line.length + (x - line.count) * space.w, maxLength);
            }
            else
            {
               if(selX > selLine.count)
                  width = Max(selLine.length + (selX - selLine.count) * space.w, maxLength);
            }
         }

         width += space.w;
         SetScrollLineStep(8, space.h);
         SetScrollArea(width, height, true);
      }
   }

   void ComputeLength(EditLine line)
   {
      int c;
      int tabOccur = 0;
      int tabWidth;
      int x = 0;

      for(c = 0; c < line.count; )
      {
         int len = 1;
         int start = c;
         int w;
         if(c < line.count)
         {
            byte ch = 0;
            int numBytes;
            for(len = 0; c < line.count; c += numBytes)
            {
               ch = line.buffer[c];
               numBytes = UTF8_NUM_BYTES(ch);

               if(ch == ' ' || ch == '\t')
               {
                  if(!len) c++;
                  break;
               }
               len += numBytes;
            }
            if(!len && ch == ' ')
            {
               len = 1;
               w = space.w;
            }
            else if(!len && ch == '\t')
            {
               w = (tabSize * space.w) - (x % (tabSize * space.w));
               len = 1;
            }
            else
               FontExtent(display, font, line.buffer + start, len, &w, null); 
         }
         else
         {
            w = space.w;
            c++;
         }
         x += w;
      }               
      line.length = x;

      if(line.length > this.maxLength)
      {
         this.maxLine = line;
         this.maxLength = line.length;
      }
   }

   void FindMaxLine()
   {
      EditLine line;

      this.maxLength = 0;
      this.maxLine = null;

      for(line = lines.first; line; line = line.next)
      {
         if(line.length > this.maxLength)
         {
            this.maxLength = line.length;
            this.maxLine = line;
         }
      }
   }

   void SelDirty()
   {
      if(this.selY != this.y)
         DirtyAll();
      else if(this.selX != this.x)  // commented out to erase caret: if(this.selX != this.x) 
         DirtyLine(this.y);
   }

   void ComputeColumn()
   {
      // Adjust new edit X position according to tabs
      int c, position = 0;
      unichar ch;
      int nb;
      for(c = 0; c<this.line.count && c<this.x; c+= nb)
      {
         ch = UTF8_GET_CHAR(this.line.buffer + c, nb);
         // TODO: MIGHT WANT TO RETHINK WHAT COLUMN SHOULD BE REGARDING TABS
         if(ch == '\t')
            position += this.tabSize - (position % this.tabSize);
         else
            position ++;
      }
      position += this.x - c;
      this.col = position;
   }

   int DelCh(EditLine l1, int y1, int c1, EditLine l2, int y2, int c2, bool placeAfter)
   {
      return _DelCh(l1, y1, c1, l2, y2, c2, placeAfter, null);
   }
   
   bool HasCommentOrEscape(EditLine line)
   {
      bool hadComment = strstr(line.buffer, "/*") || strstr(line.buffer, "*/");
      int c;
      
      if(!hadComment)
      {
         for(c = line.count-1; c >= 0; c--)
         {
            char ch = line.buffer[c];
            if(ch == '\\')
            {
               hadComment = true;
               break;
            }
            else //if(ch != ' ' && ch != '\t')
               break;
         }
      }
      return hadComment;
   }
   
   int _DelCh(EditLine l1, int y1, int c1, EditLine l2, int y2, int c2, bool placeAfter, int * addedSpacesPtr)
   {
      EditLine line = l1, next;
      char * buffer;
      int oldCount1, oldCount2;
      int y, firstViewY, firstY, firstDropY, firstSelY;
      int newLineCount;
      int extras = 0;
      DelTextAction action = null;
      bool hadComment = false;
      int start = c1;

      if(style.syntax)
         hadComment = HasCommentOrEscape(line);

      if(y2 > y1 || c2 > c1)
      {
         if(start < l1.count)
         {
            while(!UTF8_IS_FIRST(l1.buffer[start]) && start)
               start--;
         }
      }
      oldCount1 = l1.count;
      buffer = l1.buffer;
      while(c1 < oldCount1)
      {
         byte ch = buffer[c1];
         if(UTF8_IS_FIRST(ch)) break;
         c1--;         
         extras++;
      }
      oldCount2 = l2.count;
      buffer = l2.buffer;
      while(c2 < oldCount2)
      {
         byte ch = buffer[c2];
         if(UTF8_IS_FIRST(ch)) break;
         c2++;
         extras++;
      }

      if(!undoBuffer.dontRecord && (y2 > y1 || c2 > c1))
      {
         int len;
         char * string;
         
         len = GetText(null, l1, y1, start, l2, y2, c2, false, false);
         string = new char[len];
         action = DelTextAction { y1 = y1, x1 = start, y2 = y2, x2 = c2, string = string, placeAfter = placeAfter };
         GetText(string, l1, y1, start, l2, y2, c2, false, false);
         Record(action);
      }

      //oldCount1 = l1.count;
      //oldCount2 = l2.count;

      {
         BufferLocation before = { l1,y1,c1}, after = { l2,y2,c2 };
         NotifyCharsDeleted(master, this, &before, &after, this.pasteOperation);
      }

      if(c2 > oldCount2) c2 = oldCount2;
      if(!(style.freeCaret))
         if(c1 > oldCount1) c1 = oldCount1;
      newLineCount = c1 + l2.count-c2;
      if(l1 == l2)
      {
         /*
         if(!line.size)
            printf("");
         buffer = new char[line.size ? line.size : 1];
         */
         buffer = new char[line.size];
         if(!buffer) return;
         CopyBytes(buffer,l2.buffer,oldCount1 + 1/*line.count + 1*//*line.size*/);
      }
      else
         buffer = l2.buffer;

      if(!line.AdjustBuffer(newLineCount)) 
         return;

#ifdef _DEBUG
      /*if(newLineCount > 4000 || newLineCount < 0)
         printf("Warning");*/
#endif
      line.count = newLineCount;

      memmove(l1.buffer+c1, buffer+c2,line.count-c1);
      if(c1>oldCount1)
      {
         if(action)
         {
            action.addedSpaces = c1-oldCount1;
#ifdef _DEBUG
            if(action.addedSpaces > action.x1)
            {
               printf("bug!");
            }
#endif
         }
         if(addedSpacesPtr) *addedSpacesPtr = c1-oldCount1;
         FillBytes(l1.buffer+oldCount1,' ',c1-oldCount1);
      }
      line.buffer[line.count] = '\0';

      if(l1 == l2)
      {
         delete buffer;
         DirtyLine(y1);
         /*
         this.dropX -= c2-c1;
         this.dropX = Max(this.dropX,0);
         this.x -= c2-c1-1;
         this.x = Max(this.x,0);
         */
      }
      else
         DirtyEnd(y1);

      y = y1;
      firstViewY = this.viewY;
      firstY = this.y;
      firstDropY = this.dropY;
      firstSelY = this.selY;
      for(line = l1;line;line = next, y++)
      {
         next = line.next;
         if(line!=l1)
         {
            this.lineCount--;
            delete line.buffer;
       
            if(line == this.viewLine)
            {
               if(this.viewLine.next)
               {
                  this.viewLine = this.viewLine.next;
                  //this.viewY++;
                  style.recomputeSyntax = true;
               }
               else 
               {
                  this.viewLine = this.viewLine.prev;
                  this.viewY--;
                  style.recomputeSyntax = true;
               }
            }
            else if(y < firstViewY)
               this.viewY--;
            if(line == this.line)
            {
               if(this.line.next)
               {
                  this.line = this.line.next;
                  this.x = this.line.count;
                  //this.y++;
               }
               else 
               {
                  this.line = this.line.prev;
                  this.x = this.line.count;
                  this.y--;
               }
               ComputeColumn();
            }
            else if(y < firstY)
               this.y--;
            if(line == this.dropLine)
            {
               if(this.dropLine.next)
               {
                  this.dropLine = this.dropLine.next;
                  this.dropX = this.dropLine.count;
               }
               else 
               {
                  this.dropLine = this.dropLine.prev;
                  this.dropX = this.dropLine.count;
                  this.dropY--;
               }
            }
            else if(y < firstDropY)
               this.dropY--;
            if(line == this.selLine)
            {
               if(this.selLine.next)
               {
                  this.selLine = this.selLine.next;
                  this.selX = this.selLine.count;
               }
               else 
               {
                  this.selLine = this.selLine.prev;
                  this.selX = this.selLine.count;
                  this.selY--;
               }
            }
            else if(y < firstSelY)
               this.selY--;
            lines.Delete(line);
         }
         if(line == l2) break;
      }
      ComputeLength(l1);
      FindMaxLine();
      if(style.autoSize) AutoSize();
      if(style.syntax && (hadComment || HasCommentOrEscape(this.line)))
      {
         DirtyAll();
         style.recomputeSyntax = true;
      }
      return extras;
   }

   bool DelSel(int * addedSpacesPtr)
   {
      if(this.line != this.selLine || this.x != this.selX)
      {
         if(this.selY < this.y)
         {
            _DelCh(this.selLine, this.selY, this.selX, this.line, this.y, this.x, true, addedSpacesPtr);
            this.x = this.selX;
            this.y = this.selY;
            this.line = this.selLine;
         }
         else if(this.selY > this.y)
         {
            _DelCh(this.line, this.y, this.x, this.selLine, this.selY, this.selX, false, addedSpacesPtr);
            this.selX = this.x;
            this.selY = this.y;
            this.selLine = this.line;
         }
         else if(this.selX < this.x)
         {
            _DelCh(this.selLine, this.selY, this.selX, this.line, this.y, this.x, true, addedSpacesPtr);
            this.x = this.selX;
            this.y = this.selY;
            this.line = this.selLine;
         }
         else
         {
            _DelCh(this.line, this.y, this.x, this.selLine, this.selY, this.selX, false, addedSpacesPtr);
            this.selX = this.x;
            this.selY = this.y;
            this.selLine = this.line;
         }
         ComputeColumn();
         return true;
      }
      return false;
   }

   bool AddToLine(char * stringLine, int count, bool LFComing, int * addedSpacesPtr, int * addedTabsPtr)
   {
      bool hadComment = false;
      // Add the line here
      EditLine line = this.line;
         
      // The purpose of this is solely to lock a max number of characters if no HSCROLLING is present
      if(!style.hScroll && created)
      {
         int endX = (style.freeCaret) ? this.x : Min(this.x, line.count);
         int max;
         int x;
         int c;

         // Lock if no place to display.
         if(LFComing)
            max = endX;
         else if(endX > this.x)
            max = Max(this.x, line.count);
         else
            max = line.count;

         for(x = 0, c = 0; c < max+count; )
         {
            int w;
            int numBytes = 1;
            char * string;
            if(c < Min(this.x, line.count))
               string = line.buffer + c;
            else if(c < endX)
               string = " ";
            else if(c < endX + count)
               string = stringLine + c - endX;
            else
               string = line.buffer + c - endX - count;

            if(*string == '\t')
            {
               w = (tabSize * space.w) - (x % (tabSize * space.w));
            }
            else
            {
               numBytes = UTF8_NUM_BYTES(*string);
               FontExtent(display, this.font, string, numBytes, &w, null);
            }
            x += w;

            if(x >= clientSize.w) 
            {
               count = c - max;
               break;
            }
            c += numBytes; // - 1;
         }
      }

      if(count > 0)
      {
         int addedSpaces = 0;
         int addedTabs = 0;
         
         // Add blank spaces if EES_FREECARET
         if(this.x > line.count)
         {
            if(style.freeCaret)
            {
               if(style.useTab)
               {
                  int wantedPosition;
                  int position = 0;
                  int c;

                  for(c = 0; c<line.count; c++)
                  {
                     if(this.line.buffer[c] == '\t')
                        position += this.tabSize - (position % this.tabSize);
                     else
                        position ++;
                  }
                  wantedPosition = position + (this.x - line.count);

                  // A tab is too much...
                  if(position + (this.tabSize - (position % this.tabSize)) > wantedPosition)
                     addedSpaces = wantedPosition - position;
                  else
                  {
                     // Put a first tab
                     addedTabs = 1;
                     position += this.tabSize - (position % this.tabSize);
                     // Add as many tabs as needed
                     addedTabs += (wantedPosition - position) / this.tabSize;
                     position += (addedTabs-1) * this.tabSize;
                     // Finish off with spaces
                     addedSpaces = wantedPosition - position;
                  }
               }
               else
                  addedSpaces = this.x - line.count;
            }
         }
         this.x = Min(this.x, line.count);

         if(line.count + count + addedSpaces + addedTabs > this.maxLineSize)
            return false;

         DirtyLine(this.y);

         if(style.syntax)
            hadComment = HasCommentOrEscape(line);

         // Adjust the size of the line
         if(!line.AdjustBuffer(line.count+count+addedTabs+addedSpaces))
            return false;

         {
            BufferLocation before = { this.line, this.y, this.x }, after = { this.line, this.y, this.x };
            bool hasComment;
         
            memmove(line.buffer+this.x+count, line.buffer+this.x,line.count-this.x);
            CopyBytes(line.buffer + this.x + addedTabs + addedSpaces, stringLine, count);
            if(addedTabs)
            {
               *addedTabsPtr = addedTabs;
               FillBytes(line.buffer+line.count,'\t',addedTabs);
#ifdef _DEBUG
      if(addedTabs > 4000 || addedTabs < 0)
         printf("Warning");
#endif
               line.count += addedTabs;
            }
            else if(addedTabs)
               *addedTabsPtr = 0;
            if(addedSpaces)
            {
               FillBytes(line.buffer+line.count,' ',addedSpaces);
#ifdef _DEBUG
      if(addedSpaces > 4000 || addedSpaces < 0)
         printf("Warning");
#endif
               line.count += addedSpaces;
               if(addedSpacesPtr) *addedSpacesPtr = addedSpaces;
            }      
            else if(addedSpacesPtr)
               *addedSpacesPtr = 0;
#ifdef _DEBUG
      if(count > 4000 || count < 0)
         printf("Warning");
#endif
            line.count += count;
            this.x += count + addedTabs + addedSpaces;
            this.selX = this.x;
            this.selY = this.y;
            this.selLine = this.line;

            line.buffer[line.count] = '\0';

            ComputeLength(line);
            ComputeColumn();

            after.x = this.x; 

            hasComment = HasCommentOrEscape(line);
            if(!undoBuffer.insideRedo)
            {
               int backDontRecord = undoBuffer.dontRecord;
               undoBuffer.dontRecord = 0;
               NotifyCharsAdded(master, this, &before, &after, this.pasteOperation);
               if(style.autoSize) AutoSize();
               undoBuffer.dontRecord = backDontRecord;
            }
            if(style.syntax && (hadComment || hasComment || line != this.line))
            {
               style.recomputeSyntax = true;
               DirtyAll();
            }
         }
      }
      return true;
   }

   void Emptyline(EditLine line, int y)
   {
      if(line.next)
         DelCh(line, y, 0, line.next, y+1, 0, true);
      else
         DelCh(line, y, 0, line, y, line.count, true);
   }

   void GoToEnd(bool deselect)
   {
      if(this.line)
      {
         this.line = this.lines.last;
         if(this.y != this.lineCount-1)
            DirtyAll();
         else if (this.x != this.line.count)
            DirtyLine(this.lineCount-1);
         this.y = this.lineCount-1;
         this.x = this.line.count;
         ComputeColumn();
         if(deselect)
            Deselect();
      }
   }

   void GoToHome(bool deselect)
   {
      if(this.line)
      {
         this.line = this.lines.first;
         if(this.y != 0)
            DirtyAll();
         else if (this.x !=0)
            DirtyLine(this.lineCount-1);
         this.y = 0;
         this.x = 0;
         this.col = 0;
         if(deselect)
            Deselect();
      }
   }

   // Returns true if it needs scrolling
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

   // Minimal Update Management Functions
   void DirtyAll()
   {
      this.startY = 0;
      this.endY = clientSize.h-1;
   //   ErrorLog("DirtyAll\n");
   }

   void DirtyEnd(int y)
   {
      if((y - this.viewY)*this.space.h < this.startY)
         this.startY = (y - this.viewY)*this.space.h+ YOFFSET;
      this.endY = clientSize.h-1;
      //ErrorLog("DirtyEnd %d\n", y);
   }
        
   void DirtyLine(int y)
   {
      if(y >= this.viewY)
      {
         if((y - this.viewY)*this.space.h < this.startY)
            this.startY = (y - this.viewY)*this.space.h + YOFFSET;
         if((y - this.viewY+1)*this.space.h > this.endY)
            this.endY = (y - this.viewY+1)*this.space.h-1 + YOFFSET;
      }
      //ErrorLog("DirtyLine %d\n", y);
   }

   void UpdateDirty()
   {
      Box box;

      if(style.recomputeSyntax)
      {
         FigureStartSyntaxStates(lines.first, true);
         style.recomputeSyntax = false;
      }
      box.left  = 0;
      if(this.startY > this.endY) return;
      if(this.startY <= 0 && this.endY >= clientSize.h-1)
      {
         Update(null);
      }
      else
      {
         box.right = clientSize.w-1;
         box.top   = this.startY;
         box.bottom  = this.endY;
         Update(box);
      }
      this.startY = clientSize.h;
      this.endY = 0;
   }

   bool IsMouseOnSelection()
   {
      bool mouseOnSelection = false;

      int x, y;
      int minY = Min(this.selY, this.y);
      int maxY = Max(this.selY, this.y);
      int minX = Min(this.selX, this.x);
      int maxX = Max(this.selX, this.x);

      FindMouse(this.mouseX - this.space.w / 2, this.mouseY, &x, &y, null, false);

      if(maxX != minX || maxY != minY)
      {
         if(y > minY && y < maxY)
            mouseOnSelection = true;
         else if(y == minY && y == maxY)
            mouseOnSelection = (x < maxX && x >= minX);
         else if(y == minY)
         {
            if(y == this.selY)
               mouseOnSelection = (x >= this.selX);
            else if(y == this.y)
               mouseOnSelection = (x >= this.x);
         }
         else if(y == maxY)
         {
            if(y == this.selY)
               mouseOnSelection = (x < this.selX);
            else if(y == this.y)
               mouseOnSelection = (x < this.x);
         }
      }
      return mouseOnSelection;
   }

   void UpdateCaretPosition(bool setCaret)
   {
      if(line)
      {
         if(mouseMove || (!overwrite && !style.noCaret))
         {
            int max = this.mouseMove ? this.dropX : this.x;
            int y = this.mouseMove ? this.dropY : this.y;
            EditLine line = this.mouseMove ? this.dropLine : this.line;
            int c, x = 0;
            if(!(style.freeCaret))
               max = Min(max, line.count);

            if(FontExtent && display)
            {
               for(c = 0; c < max; )
               {
                  int len = 1;
                  int start = c;
                  int w;
                  if(c < line.count)
                  {
                     byte ch = 0;
                     int numBytes;
                     for(len = 0; c < Min(max, line.count); c += numBytes)
                     {
                        ch = line.buffer[c];
                        numBytes = UTF8_NUM_BYTES(ch);

                        if(ch == ' ' || ch == '\t')
                        {
                           if(!len) c++;
                           break;
                        }
                        len += numBytes;
                     }
                     if(!len && ch == ' ')
                     {
                        w = space.w;
                        len = 1;
                     }
                     else if(!len && ch == '\t')
                     {
                        w = (tabSize * space.w) - (x % (tabSize * space.w));
                        len = 1;
                     }
                     else
                        FontExtent(display, this.font, line.buffer + start, len, &w, null); 
                  }
                  else
                  {
                     w = space.w;
                     c++;
                  }
                  x += w;
               }               
            }
            if(setCaret)
               caretX = x;
            caretY = y * this.space.h;
            SetCaret(x + XOFFSET-2, y * space.h + YOFFSET, space.h);
         }
         else
            SetCaret(0, 0, 0);

         NotifyCaretMove(master, this, y + 1, x + 1);

         SelectionEnables();
      }
   }

   void SelectionEnables()
   {
      if((x != selX || y != selY) && !selection)
      {
         if(!style.readOnly)
         {
            itemEditCut.disabled = false;
            itemEditDelete.disabled = false;
         }
         itemEditCopy.disabled = false;

         this.selection = true;
      }
      else if((x == selX && y == selY) && selection)
      {
         itemEditCut.disabled = true;
         itemEditCopy.disabled = true;
         itemEditDelete.disabled = true;

         this.selection = false;
      }
   }

   void SetSelectCursor()
   {
      if(!inactive || !style.noSelect)
      {
         if(this.mouseMove)
            cursor = guiApp.GetCursor(arrow);
         else if(this.mouseSelect)
            cursor = guiApp.GetCursor(iBeam);
         else
         {
            if(IsMouseOnSelection())
               cursor = guiApp.GetCursor(arrow);
            else
               cursor = guiApp.GetCursor(iBeam);
         }
      }
   }

   int AdjustXPosition(EditLine line, int position, bool half, int * px, int max, int sc)
   {
      int c = sc;
      int x = px ? *px : 0;
      while(true)
      {
         int start = c;
         int numBytes = 1;
         int len = 1;
         int w;
         if(c < Min(max, line.count))
         {
            byte ch = 0;
            int numBytes;
            for(len = 0; c < Min(max, line.count); c += numBytes)
            {
               ch = line.buffer[c];
               numBytes = UTF8_NUM_BYTES(ch);

               if(ch == ' ' || ch == '\t')
               {
                  if(!len) c++;
                  break;
               }
               len += numBytes;
            }
            if(!len && ch == ' ')
            {
               w = space.w;
               len = 1;
            }
            else if(!len && ch == '\t')
            {
               w = (tabSize * space.w) - (x % (tabSize * space.w));
               len = 1;
            }
            else
               FontExtent(display, font, line.buffer + start, len, &w, null); 
         }
         else 
         {
            if(style.freeCaret && c < max)
               w = space.w;
            else 
            {
               if(px) *px = x;
               return c;
            }
            c++;
         }
         if(x + (((half && len == 1) ? (w / 2) : w)) >= position) 
         {
            int lastW;
            while(len > 0)
            {
               int a = start + len;
               lastW = w;
               if(a <= line.count)
                  while(a > 0 && !UTF8_IS_FIRST(line.buffer[--a]));
               else
                  a--;
               if(a > start)
                  FontExtent(display, font, line.buffer + start, a - start, &w, null);
               else
                  w = 0;
               if(position > x + (half ? ((w + lastW) / 2) : lastW)) break;
               len = a - start;
            }
            if(px) *px = x + w;
            return Min(this.maxLineSize - 1, start + len);
         }
         x += w;
      }
   }

   void SetCursorToViewX()
   {
      bool selecting = this.x != selX || y != selY;

      // Horizontal Adjustment
      int x = 0;
      int c = AdjustXPosition(line, viewX, false, &x, MAXINT, 0);
      if(this.x < c)
         this.x = x;
      else
      { 
         c = AdjustXPosition(line, viewX + clientSize.w - 1, false, &x, MAXINT, c);
         if(this.x > c)
            this.x = c;
     }

      if(!selecting)
      {
         selX = this.x;
         selY = y;
         selLine = line;
      }

      UpdateCaretPosition(false);

      UpdateDirty();
      SetSelectCursor();
   }

   void SetCursorToViewY()
   {
      int c, numLines;
      EditLine oldLine = this.line;
      
      bool selecting = this.x != this.selX || this.y != this.selY;

      numLines = clientSize.h / this.space.h;

      // Vertical Adjustment
      if(this.viewY > this.y)
      {
         this.y = this.viewY;
         this.line = this.viewLine;
      }

      if(this.viewY + numLines <=  this.y)
      {
         EditLine line;

         this.y = this.viewY-1;
         for(c = 0, line = this.viewLine; line && c<numLines; line = line.next, c++)
         {
            this.line = line;
            this.y++;
         }
      }

      if(this.line != oldLine)
      {
         this.x = AdjustXPosition(this.line, caretX, true, null, MAXINT, 0);
         ComputeColumn();
      }

      if(!selecting)
      {
         this.selX = this.x;
         this.selY = this.y;
         this.selLine = this.line;
      }

      UpdateCaretPosition(false);

      UpdateDirty();
      SetSelectCursor();
   }

   /*
   bool SaveFile(char * fileName)
   {
      File f = eFile_Open(fileName, FO_WRITE);
      if(f)
      {
         Save(f, false);
         eWindow_SetModified(false);
         eInstance_Delete(f);
         return true;
      }
      return false;
   }
   */

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(line)
      {
         if(!style.multiLine)
         {
            x = (active && this.active && !style.readOnly) ? line.count : 0;
            selX = 0;
            ComputeColumn();
            SetViewToCursor(true);
            DirtyLine(0);
            UpdateDirty();
         }
         // Update(null);
         if(!active && modified)
         {
            modified = false;
            if(!NotifyModified(master, this))
            {
               modified = true;
               *goOnWithActivation = false;
            }
         }
      }
      if(!active)
      {
         ReleaseCapture();
         if(timer) timer.Stop();

         mouseSelect = false;
         wordSelect = false;
      }
      return true;
   }

   void AutoSize()
   {
      //if(created)
      {
         if(multiLine)
         {
            // todo: resize width based on largest on-screen-line extent...
            int sh = 0;
            display.FontExtent(font, " ", 1, null, &sh);
            if(sh)
            {
               int nh = 0;
               nh = lineCount * sh + 2;
               size.h = nh < minClientSize.h ? minClientSize.h : nh;
            }
         }
         else
         {
            int tw = 0;
            int sh = 0;
            int nw = 0;
            int nh = 0;
            MinMaxValue dw = 0;
            MinMaxValue dh = 0;
            int len = line ? strlen(line.text) : 0;
            GetDecorationsSize(&dw, &dh);
            display.FontExtent(font, " ", 1, null, &sh);
            if(len) display.FontExtent(font, line.text, len, &tw, null);
            nw = dw+tw+12;
            if(nw < minClientSize.w) nw = minClientSize.w;
            nh = dh+sh+4;
            if(nh < minClientSize.h) nh = minClientSize.h;
            size = { nw, nh };
         }
      }
   }

   bool OnResizing(int *w, int *h)
   {
      if(!*h)
         *h = space.h + 2;
      if(!*w)
         //*w = 80;
         *w = space.h * 80 / 14;
      return true;
   }

   void OnResize(int w, int h)
   {
   /*
      if(!hasHorzScroll && !hasVertScroll && viewLine)
         SetViewToCursor(true);
   */
      //if(!hasHorzScroll && !hasVertScroll && viewLine)
      if(viewLine)
         SetViewToCursor(true);
      //else
   //     FixScrollArea();
   }

   bool OnMiddleButtonDown(int x, int y, Modifiers mods)
   {
      if(style.readOnly) return true;
      // We really shouldn't be pasting here, Unix middle button paste is for the selection (not the clipboard), good for the terminal
      // Middle button already serves as a dragger as well.
      // Paste();
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      this.rightButtonDown = true;
      // Copy();
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      // Context Menu
      if(!parent.inactive && rightButtonDown)
      {
         PopupMenu popup;
         Menu contextMenu { };

         MenuItem { contextMenu, $"Cut\tCtrl+X", t, NotifySelect = itemEditCut.NotifySelect, disabled = !selection || style.readOnly };
         MenuItem { contextMenu, $"Copy\tCtrl+C", c, NotifySelect = itemEditCopy.NotifySelect, disabled = !selection };
         MenuItem { contextMenu, $"Paste\tCtrl+V", p, NotifySelect = itemEditPaste.NotifySelect, disabled = style.readOnly };
         MenuItem { contextMenu, $"Delete\tDel", d, NotifySelect = itemEditDelete.NotifySelect, disabled = !selection || style.readOnly };
         MenuDivider { contextMenu };
         MenuItem { contextMenu, $"Select All\tCtrl+A", a, NotifySelect = itemEditSelectAll.NotifySelect };

         popup = PopupMenu { master = this, menu = contextMenu,
   /*
            nonClient = true, interim = false, parent = parent, 
            position = { x + clientStart.x + parent.clientStart.x + position.x, y + cientStart.y + parent.sy + clientStart.y + position.y };
   */
            position = { x + clientStart.x + absPosition.x - guiApp.desktop.position.x, y + clientStart.y + absPosition.y - guiApp.desktop.position.y }
         };
         popup.Create();
      }
      rightButtonDown = false;
      return true;
   }

   bool OnLeftButtonDown(int mx, int my, Modifiers mods)
   {
      int x,y;
      EditLine line;

      if(style.noSelect) return true;

      // Should we have a separate 'selectOnActivate' style?
      if(!mods.isActivate || (style.readOnly && style.multiLine))
      {
         Capture();
         mouseSelect = true;
      }

      mouseX = mx - XOFFSET;
      mouseY = my;

      FindMouse(mouseX, mouseY, &x, &y, &line, true);
#ifdef _DEBUG
      //PrintLn("OnLeftButtonDown: ", x, ", ", y);
#endif
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
#ifdef _DEBUG
            //PrintLn("MouseMove: ", x, ", ", y);
#endif
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
#ifdef _DEBUG
                   /*  {
                        byte * c = ((EditBox)this).multiLineContents, * c2;
                        int l1 = c ? strlen(c) : 0, l2;
                        Undo();
                        Redo();
                        c2 = ((EditBox)this).multiLineContents;
                        l2 = c2 ? strlen(c2) : 0;
                        if(l1 != l2 || (l1 && strcmp(c, c2)))
                        {
                           PrintLn("Fail!");
                        }
                        delete c;
                     }
                     */
#endif
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
#ifdef _DEBUG
            //PrintLn("Dropped: ", x, ", ", y);
#endif
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
#ifdef _DEBUG
         //PrintLn("MouseMove: ", "dropX = ", x, ", dropY = ", y);
#endif
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
#ifdef _DEBUG
         //PrintLn("MouseSelect: ", "x = ", x, ", y = ", y);
#endif
      }
      SetSelectCursor();
      return true;
   }

   bool OnLeftDoubleClick(int mx, int my, Modifiers mods)
   {
      int x,y;
      EditLine line;
#ifdef _DEBUG
      //PrintLn("OnLeftDoubleClick: ", mx, ", ", my, ", mods = ", mods);
#endif
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

   bool OnPostCreate()
   {
      /*if(isDocument)
      {
         Menu fileMenu { menu, "File", F };
         saveDialog = fileDialog;
         MenuItem { fileMenu, $"Save\tCtrl+S", S, CtrlS, NotifySelect = MenuFileSave };
         MenuItem { fileMenu, $"Save As...", A, NotifySelect = MenuFileSaveAs };
      }*/
      if(style.autoSize) AutoSize();
      return true;
   }

   void ComputeFont()
   {
      if(FontExtent)
      {
         FontExtent(display, font, " ", 1, (int *)&space.w, (int *)&space.h);
         FontExtent(display, font, "W", 1, (int *)&large.w, (int *)&large.h);

         space.w = Max(space.w, 1);
         large.w = Max(large.w, 1);
         space.h = Max(space.h, 1);
         large.h = Max(large.h, 1);

         {
            EditLine line;
            for(line = lines.first; line; line = line.next)
               ComputeLength(line);
            FindMaxLine();
         }

         if(viewLine)
            SetViewToCursor(true);

         FixScrollArea();

         Update(null);
      }
   }

   bool OnLoadGraphics()
   {
      FontExtent = Display::FontExtent;
      font = fontObject;
      ComputeFont();
      // UpdateCaretPosition(true);
      return true;
   }

   void OnUnloadGraphics()
   {
      this.font = null;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      bool shift = (key.shift) ? true : false;
#ifdef _DEBUG
      //PrintLn("OnKeyHit: code = ", key.code, ", mods = ", key.modifiers, ", ch = ", (int)ch);
#endif
      if(!ch && !key.alt && !key.ctrl)
      {
         key.code = (SmartKey)key.code;
      }

      switch(key.code) //(ch || key.alt || key.ctrl) ? key.code : (Key)(SmartKey)key.code)
      {
         case backSpace:
            if(style.readOnly) break;
            if(style.stuckCaret) GoToEnd(true);
            if(!(style.freeCaret))
            {
               this.x = Min(this.x, this.line.count);
            }
            if(key.ctrl)
            {
               int y;
               bool done = false;
               EditLine line = this.line;
               int c;
               for(y = this.y; y>= 0; y--)
               {
                  c = (y == this.y) ? (this.x-1) : line.count-1;

                  // Slow down when going on lines...
                  if(y != this.y) break;

                  for(; c>=0; c--)
                  {
                     //if(this.line.buffer[c] != '\t' && this.line.buffer[c] != ' ')
                     if(IS_ALUNDER(line.buffer[c]))
                        break;
                  }
                  for(; c>=0; c--)
                  {
                     if(!IS_ALUNDER(line.buffer[c]))
                     {
                     //if(this.line.buffer[c] == '\t' || this.line.buffer[c] == ' ')
                        done = true;
                        break;
                     }
                  }
                  if(done)
                     break;
                  if(line.prev)
                     line = line.prev;
                  else
                     break;
               }
               //if(this.x != 0)
               {
                  DelCh(line,y,c+1,this.line,this.y,this.x, true);
                  this.x = this.selX = Min(c+1, line.count);
                  this.y = this.selY = y;
                  this.line = this.selLine = line;
                  SetViewToCursor(true);
               }
               ComputeColumn();
            }
            else
            {
               BackSpace();
            }
            return false;
            //break;
         case del:
            if(style.readOnly) break;
            if(style.stuckCaret) break;

            if(shift)
            {
               Cut();
            }
            else
            {
               // Delete selection
               if(this.line != this.selLine || this.x != this.selX)
               {
                  DelSel(null);
                  SetViewToCursor(true);
                  Modified();
               }
               // Delete word
               else if(key.ctrl)
               {
                  if(this.x < this.line.count)
                  {
                     int i;
                     int length;
                     for(i = this.x; i < this.line.count; i++)
                     {
                        if(!IS_ALUNDER(this.line.buffer[i]))
                           break;
                     }
                     
                     for(; i < this.line.count; i++)
                     {
                        //Delete trailing whitespace
                        if(IS_ALUNDER(this.line.buffer[i]))
                           break;
                     }
                     DelCh(this.line, this.y, this.x, this.line, this.y, i, false);
                     SetViewToCursor(true);
                     Modified();
                  }
                  else if(this.line.next)
                  {
                     DelCh(this.line, this.y, this.x, this.line.next, this.y+1, 0, false);
                     SetViewToCursor(true);
                     Modified();
                  }
               }
               else 
               {
                  if(!(style.freeCaret))
                  {
                     this.selX = this.x = Min(this.x, this.line.count);
                     ComputeColumn();
                  }
                  if(this.x < this.line.count)
                  {
                     DelCh(this.line, this.y, this.x, this.line, this.y, this.x+1, false);
                  }
                  else if(this.line.next)
                  {
                     DelCh(this.line, this.y, this.x, this.line.next, this.y+1, 0, false);
                  }
                  SetViewToCursor(true);
                  Modified();
               }
            }
            return false;
            //break;
         case enter:
         case keyPadEnter:
         {
            if(!key.alt && !key.ctrl)
            {
               int c;
               int position = 0;
               bool stuffAfter = false;
               char * addString;
               int len = 0;

               if(style.stuckCaret) GoToEnd(true);
               if(style.readOnly) break;
               if(!(style.multiLine)) break;

               for(c = 0; c<this.line.count && c<this.x; c++)
               {
                  if(this.line.buffer[c] == '\t')
                     position += this.tabSize - (position % this.tabSize);
                  else if(this.line.buffer[c] == ' ')
                     position++;
                  else
                     break;
               }
               if(!line.count)
                  position = x;

               if(this.x < this.line.count)
                  stuffAfter = true;
                  
               //If last character is a { indent one tab
               if(this.line.buffer[this.x - 1] == '{')
               {
                  //Except if the next non space character is a }
                  bool indent = false;
                  int i;
                  for(i = this.x; i < this.line.size; i++)
                     if(this.line.buffer[i] != ' ' && this.line.buffer[i] != '\t')
                     {
                        if(this.line.buffer[i] != '}')
                           indent = true;
                        break;
                     }
                  if(indent)
                     position += this.tabSize;
               }

               addString = new char[position + 2];
               addString[len++] = '\n';
               addString[len] = '\0';

               if(stuffAfter || !style.freeCaret)
               {
                  for(c = 0; c<position; )
                  {
                     if(style.useTab && c + this.tabSize <= position)
                     {
                        addString[len++] = '\t';
                        c += this.tabSize;
                     }
                     else
                     {
                        addString[len++] = ' ';
                        c++;
                     }
                  }
                  addString[len] = '\0';
               }
               if(AddS(addString))
               {
                  if(!stuffAfter && style.freeCaret)
                  {
                     this.x = this.selX = position;
                     ComputeColumn();
                  }
                  FindMaxLine();
                  SetViewToCursor(true);
                  Modified();
               }
               delete addString;
               return false;
            }
            break;
         }
         case left:
         {
            if(style.stuckCaret) break;
            if(!(style.freeCaret))
            {
               this.x = Min(this.x, this.line.count);
               this.selX = Min(this.selX, this.selLine.count);
               ComputeColumn();
            }
            if(!shift) SelDirty();
            if(key.ctrl)
            {
               bool foundAlpha = false;
               bool found = false;
               int y = this.y;
               EditLine line, lastLine;
               int lastC, lastY;

               for(line = this.line; (line && !found); line = line.prev, y--)
               {
                  int start;
                  int c;

                  if(this.x == 0 && line != this.line)
                  {
                     foundAlpha = true;
                     lastC = line.count;
                     lastY = y;
                     lastLine = line;
                     break;
                  }

                  if(line == this.line) start = this.x -1; else start = line.count-1;
                  start = Min(start, line.count-1);

                  for(c = start; c >= 0;)
                  {
                     int numBytes;
                     unichar ch = UTF8_GET_CHAR(line.buffer + c, numBytes);
                     if(IS_ALUNDER(ch))
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastY = y;
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
                     while(--c)
                     {
                        byte ch = line.buffer[c];
                        if(UTF8_IS_FIRST(ch)) break;
                     } 

                  }
                  // No next word found, 
                  if(!found && ( this.x > 0 || (!line.count && this.x)))
                  {
                     foundAlpha = true;
                     lastC = 0;
                     lastY = y;
                     lastLine = line;
                     break;
                  }
               }
               if(foundAlpha)
               {
                  DirtyLine(this.y);
                  this.x = lastC;
                  this.y = lastY;
                  this.line = lastLine;
                  DirtyLine(this.y);
                  ComputeColumn();
               }
            }
            else
            {
               if(x > 0)
               {
                  if(x <= line.count)
                  {
                     byte * buffer = line.buffer;
                     while(--x)
                     {
                        byte ch = buffer[x];
                        if(UTF8_IS_FIRST(ch)) break;
                     } 
                  }
                  else
                     x--;
                  DirtyLine(y);
               }
               else if(line.prev)
               {
                  line = line.prev;
                  DirtyLine(y);
                  x = line.count;
                  y--;
                  DirtyLine(y);
               }
               ComputeColumn();
            }
            if(!shift) Deselect();
            SetViewToCursor(true);
            //break;
            return false;
         }
         case right:
         {
            if(style.stuckCaret) break;
            if(!(style.freeCaret))
            {
               this.x = Min(this.x, this.line.count);
               this.selX = Min(this.selX, this.selLine.count);
               ComputeColumn();
            }
            if(!shift) SelDirty();
            if(!shift && (this.x != this.selX || this.y != this.selY));
            else if(key.ctrl)
            {
               bool onAChar = false;
               if(this.selX != this.x || this.selY != this.y)
                  onAChar = true;
               if(this.x<this.line.count)
                  if(this.line.buffer[this.x] != '\t' && this.line.buffer[this.x] !=' ')
                     onAChar = true;
               if(key.shift && onAChar &&
                  ((this.y > this.selY)||((this.selY == this.y)&&(this.x >= this.selX))))
               {
                  bool foundAlpha = false;
                  bool found = false;
                  EditLine line, lastLine;
                  int y = this.y;
                  int lastC, lastY, lastNumBytes;
                  
                  for(line = this.line; (line && !found); line = line.next, y++)
                  {
                     int start = (line == this.line) ? this.x : 0;
                     int c;
                     int numBytes;
                     for(c = start; c < line.count; c += numBytes)
                     {
                        unichar ch = UTF8_GET_CHAR(line.buffer + c, numBytes);
                        if(IS_ALUNDER(ch))
                        {
                           foundAlpha = true;
                           lastC = c;
                           lastNumBytes = numBytes;
                           lastY = y;
                           lastLine = line;
                        }
                        else if(foundAlpha)
                        {
                           found = true;
                           break;
                        }
                     }
                     if(!found && (c != this.x || line != this.line))
                     {
                        found = true;
                        lastLine = line;
                        lastC = line.count;
                        lastNumBytes = 0;
                        lastY = y;
                        break;
                     }
                  }  
                  if(found)
                  {
                     DirtyLine(this.y);
                     this.x = lastC + lastNumBytes;
                     this.y = lastY;
                     this.line = lastLine;
                     DirtyLine(this.y);
                     ComputeColumn();
                  }
               }
               else
               {
                  bool foundAlpha = false;
                  bool found = false;
                  EditLine line;
                  int y = this.y;

                  for(line = this.line; (line && !found); line = line.next, y++)
                  {
                     int start = (line == this.line) ? this.x : 0;
                     int c;
                     int numBytes;
                     for(c = start; c < line.count; c += numBytes)
                     {
                        unichar ch = UTF8_GET_CHAR(line.buffer + c, numBytes);
                        if(!IS_ALUNDER(ch))
                           foundAlpha = true;
                        else if(foundAlpha)
                        {
                           found = true;
                           DirtyLine(this.y);
                           this.x = c;
                           this.y = y;
                           this.line = line;
                           DirtyLine(this.y);
                           ComputeColumn();
                           break;
                        }
                     }
                     // No next word found, 
                     if(!found && (c != this.x || line != this.line))
                     {
                        found = true;
                        DirtyLine(this.y);
                        this.x = line.count;
                        this.y = y;
                        this.line = line;
                        DirtyLine(this.y);
                        ComputeColumn();
                     }
                     foundAlpha = true;
                  }
               }
            }
            else
            {
               if(x < line.count || (style.freeCaret && line.count < maxLineSize))
               {
                  if(x < line.count)
                  {
                     byte * buffer = line.buffer;
                     while(++x)
                     {
                        byte ch = buffer[x];
                        if(UTF8_IS_FIRST(ch)) break;
                     } 
                  }
                  else
                     x++;
                  ComputeColumn();
                  DirtyLine(y);
               }
               else
               {
                  if(line.next)
                  {
                     DirtyLine(y);
                     line = line.next;
                     y++;
                     x = 0;
                     col = 0;
                     DirtyLine(y);
                  }
               }
            }
            if(!shift) Deselect();
            SetViewToCursor(true);
            // break;
            return false;
         }
         case up:
            if(key.ctrl)
            {
               if(!style.vScroll || hasVertScroll) break;
               LineUp();
               return false;
            }
            else
            {
               if(style.stuckCaret) break;
               
               if(!shift) SelDirty();
               DirtyLine(this.y);

               if(style.wrap)
               {
               }
               else if(line.prev)
               {
                  line = line.prev;
                  this.y--;
                  this.x = AdjustXPosition(line, caretX, true, null, MAXINT, 0);
               }
               
               DirtyLine(this.y);
               if(!shift) Deselect();
               ComputeColumn();
               SetViewToCursor(false);

               /*
               if(caretY == this.y * space.h)
               {
                  if(line.prev)
                  {
                     line = line.prev;
                     this.y--;
                     if(!style.freeCaret)
                        this.x = Min(this.x, line.count);
                     caretY = MAXINT;
                  }
                  else
                     return false;
               }

               {
                  int th = space.h;
                  int textPos = 0;
                  int sx = 0, sy = this.y * space.h;
                  char * text = line.text;
                  int maxW = clientSize.w - sx;
                  display.FontExtent(font, " ", 1, null, &th);

                  do
                  {
                     int startPos = textPos;
                     int width = 0;
                     int x = 0;
                     bool lineComplete = false;

                     if(!style.wrap && caretY == MAXINT)
                     {
                        caretY = sy + th;
                        //textPos = line.count;
                        //lineComplete = true;
                     }

                     for(; (style.freeCaret || textPos < line.count) && !lineComplete;)
                     {
                        int w = 0;
                        int len;
                        char * nextSpace = (textPos < line.count) ? strchr(text + textPos, ' ') : (text + textPos);

                        if(nextSpace)
                           len = (nextSpace - (text + textPos));
                        else
                           len = line.count - textPos;
                        
                        if(textPos < line.count)
                        {
                           display.FontExtent(font, text + textPos, len, &w, null);
                        }
                        if(nextSpace) { w += space.w; len++; }

                        if(style.wrap && x + width + w > maxW && x > 0)
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
                        if((!style.freeCaret && textPos >= line.count) || (sy == caretY - th && caretX <= x + width + sx))
                        {
                           x += width;
                           this.x = textPos;
                           while(this.x > 0 && x + sx > caretX && this.x > startPos)
                           {
                              int len;
                              if(this.x > line.count)
                                 this.x--;
                              else
                                 while(this.x > 0 && !UTF8_IS_FIRST(text[--this.x]));
                              len = this.x - startPos;
                              display.FontExtent(font, text + startPos, len, &x, null);
                           }

                           DirtyLine(this.y);
                           if(!shift) Deselect();
                           ComputeColumn();
                           SetViewToCursor(false);
                           return false;
                        }
                     }
                     if(sy == caretY - th || textPos >= line.count)
                     {
                        if(textPos >= line.count)
                        {
                           int c = textPos - 1;
                           while(c > 0 && text[c] == ' ') c--;
                           this.x = c + 1;
                        }
                        else
                           this.x = line.count;

                        DirtyLine(this.y);
                        if(!shift) Deselect();
                        ComputeColumn();
                        SetViewToCursor(false);
                        return false;
                     }
                     sy += th;
                     sx = 0;
                  } while(textPos < line.count);

                  DirtyLine(this.y);
                  if(!shift) Deselect();
                  ComputeColumn();
                  SetViewToCursor(false);
                  return false;
               }
               */
               
               // PREVIOUS CODE
               /*
               if(this.line.prev)
               {
                  int x = AdjustXPosition(this.line, this.line.prev, true, null, MAXINT, 0);
                  if(!shift) SelDirty();
                  this.line = this.line.prev;
                  DirtyLine(this.y);
                  this.y--;

                  DirtyLine(this.y);
                  this.x = x;
                  if(!shift) Deselect();

                  ComputeColumn();

                  SetViewToCursor(false);
               }
               */

            }
            // break;
            return style.multiLine ? false : true;
         case down:
            if(key.ctrl)
            {
               if(!style.vScroll || hasVertScroll)
                  break;
               LineDown();
               return false;
            }
            else
            {
               if(style.stuckCaret) break;
               {
                  int th = space.h;
                  int textPos = 0;
                  int sx = 0, sy = this.y * this.space.h;
                  int maxW = clientSize.w - sx;
                  char * text = line.buffer;

                  if(!shift) SelDirty();
                  DirtyLine(this.y);
                  
                  if(style.wrap)
                  {
                     /*
                     if(AdjustXPosition(line, maxW, this.x, line.count, true, null, MAXINT, 0) <= line.count)
                     {

                     }
                     */
                  }
                  else if(line.next)
                  {
                     line = line.next;
                     this.y++;
                     this.x = AdjustXPosition(line, caretX, true, null, MAXINT, 0);
                  }

                  if(!shift) Deselect();
                  ComputeColumn();
                  if(this.selX != this.x || this.selY != this.y)
                     DirtyLine(this.y);
                  SetViewToCursor(false);
                  
                  /*
                  while(!textPos || (style.freeCaret || textPos<line.count))
                  {
                     int startPos = textPos;
                     int width = 0;
                     int x = 0;
                     bool lineComplete = false;
                     if(!style.wrap && sy <= caretY)
                     {
                        textPos = line.count;
                        lineComplete = true;
                     }
                     for(; (style.freeCaret || textPos<line.count) && !lineComplete;)
                     {
                        int w = 0;
                        int len;
                        char * nextSpace = (textPos < line.count) ? strchr(text + textPos, ' ') : (text + textPos);

                        if(nextSpace)
                           len = (nextSpace - (text + textPos));
                        else
                           len = line.count - textPos;
                        
                        if(textPos < line.count)
                        {
                           display.FontExtent(font, text + textPos, len, &w, &th);
                        }
                        if(nextSpace) { w += space.w; len++; }
                        if(style.wrap && x + width + w > maxW && x > 0)
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
                        if(sy > caretY && ((!style.freeCaret && textPos >= line.count) || caretX <= x + width + sx))
                        {
                           this.x = textPos;
                           x += width;
                           while(this.x > 0 && x + sx > caretX && textPos > startPos)
                           {
                              int len;
                              if(this.x > line.count)
                                 this.x--;
                              else
                                 while(this.x > 0 && !UTF8_IS_FIRST(text[--this.x]));
                                 
                              len = this.x - startPos;
                              display.FontExtent(font, text + startPos, len, &x, null);
                           }
                           
                           if(!shift) Deselect();
                           ComputeColumn();

                           SetViewToCursor(false);
                           return false;
                        }
                     }
                     if(sy > caretY)
                     {
                        this.x = line.count;

                        DirtyLine(this.y);
                        if(!shift) Deselect();
                        ComputeColumn();

                        SetViewToCursor(false);
                        return false;
                     } 
                     else if(textPos >= line.count && line.next)
                     {
                        startPos = 0;
                        textPos = 0;
                        line = line.next;
                        this.y++;
                        sy = this.y * this.space.h;
                        sx = 0; //textBlock.startX;
                        text = line.buffer;
                     }
                     else
                     {
                        sy += th;
                        sx = 0; //textBlock.startX;
                     }
                  }
                  */
                  /*
                  if(line.next)
                  {
                     line = line.next;
                     this.x = Min(this.x, line.count);
                     //int x = AdjustXPosition(this.line, this.line.next, true, null, MAXINT, 0);
                     this.y++;
                     if(!shift) Deselect();
                     ComputeColumn();

                     if(this.selX != this.x || this.selY != this.y)
                        DirtyLine(this.y);

                     SetViewToCursor(false);
                  }
                  */
               }
               /* PREVIOUS CODE
               if(this.line.next)
               {
                  int x = AdjustXPosition(this.line, this.line.next, true, null, MAXINT, 0);
                  if(!shift) SelDirty();
                  this.line = this.line.next;
                  DirtyLine(this.y);
                  this.y++;
                  this.x = x;
                  if(!shift) Deselect();
                  ComputeColumn();

                  if(this.selX != this.x || this.selY != this.y)
                     DirtyLine(this.y);

                  SetViewToCursor();
               }
               */
            }
            // break;
            return style.multiLine ? false : true;
         case home:
         {
            if(style.stuckCaret) break;
            if(!(style.freeCaret))
               this.selX = Min(this.selX, this.selLine.count);

            if(!shift) SelDirty();
            if(key.ctrl)
            {
               this.line = this.lines.first;
               if(this.y != 0 || this.x != 0)
                  DirtyAll();
               this.y = 0;
               this.x = 0;
               this.col = 0;
            }
            else
            {
               if(style.smartHome)
               {
                  EditLine line = this.line;
                  int c;
                  for(c=0; line.buffer[c]; c++)
                     if(line.buffer[c] != ' ' && line.buffer[c] != '\t')
                        break;
                  if(c != 0 || this.x)
                     DirtyLine(this.y);
                  if(this.x != c) 
                     this.x = c;
                  else
                     this.x = 0;
               }
               else
               {
                  /*if(this.x != 0)
                     DirtyLine(this.y);*/
                  this.x = 0;
               }
               ComputeColumn();
            }
            if(!shift) Deselect();
            SetViewToCursor(true);
            //break;
            return false;
         }
         case end:
         {
            if(style.stuckCaret) break;
            if(!(style.freeCaret))
               this.selX = Min(this.selX, this.selLine.count);

            if(!shift) SelDirty();
            if(key.ctrl)
            {
               GoToEnd(false);
            }
            else if(this.x != this.line.count)
            {
               this.x = this.line.count;
               //DirtyLine(this.y);
               ComputeColumn();
            }
            if(!shift) Deselect();
            SetViewToCursor(true);
            //break;
            return false;
         }
         case tab:
            if(style.tabKey && !key.ctrl)
            {
               if(this.selY != this.y && style.tabSel)
               {
                  EditLine firstLine, lastLine;
                  EditLine line;
                  int y, x;

                  // Do multi line selection tabbing here
                  if(this.selY < this.y)
                  {
                     firstLine = this.selLine;
                     lastLine = this.line;
                     y = this.selY;
                     x = this.x;
                  }
                  else
                  {
                     // Selecting going up
                     firstLine = this.line;
                     lastLine = this.selLine;
                     y = this.y;
                     x = this.selX;
                  }
                  ComputeColumn();
                  if(shift)
                  {
                     for(line = firstLine; line; line = line.next, y++)
                     {
                        if(line != lastLine || x)
                        {
                           int c;
                           int lastC = 0;
                           BufferLocation before = { line, y, 0 }, after = { line, y, 0 };

                           for(c=0; c<line.count && lastC < this.tabSize; c++, lastC++)
                           {
                              if(line.buffer[c] == '\t')
                              {
                                 lastC++;
                                 break;
                              }
                              else if(line.buffer[c] != ' ')
                                 break;
                           }
                           after.x = lastC;

                           NotifyCharsDeleted(master, this, &before, &after, this.pasteOperation);
                           if(lastC)
                           {
                              int len = GetText(null, line, y, 0, line, y, lastC, false, false);
                              char * string = new char[len];
                              DelTextAction action { y1 = y, x1 = 0, y2 = y, x2 = lastC, string = string, placeAfter = true };
                              GetText(string, line, y, 0, line, y, lastC, false, false);
                              Record(action);
                           }
                           memmove(line.buffer,line.buffer+lastC,line.size-lastC);
                           if(!line.AdjustBuffer(line.count-lastC)) 
                              break;
                           line.count-=lastC;
                           if(style.autoSize) AutoSize();
                           DirtyLine(y);
                        }

                        if(line == lastLine) break;
                     }
                  }
                  else
                  {
                     for(line = firstLine; line; line = line.next, y++)
                     {
                        if(line.count)
                        {
                           if(line != lastLine || x)
                           {
                              if(style.useTab)
                              {
                                 if(line.count + 1 <= this.maxLineSize)
                                 {
                                    BufferLocation before = { line, y, 0 }, after = { line, y, 1 };

                                    if(!line.AdjustBuffer(line.count+1)) 
                                       break;

                                    NotifyCharsAdded(master, this, &before, &after, this.pasteOperation);
                                    if(style.autoSize) AutoSize();
                                    {
                                       AddCharAction action { ch = '\t', x = 0, y = y };
                                       Record(action);
                                    }

                                    memmove(line.buffer+1,line.buffer,line.size-1);
                                    line.count++;
                                    line.buffer[0] = '\t';
                                 }
                              }
                              else
                              {
                                 if(line.count + this.tabSize <= this.maxLineSize)
                                 {
                                    int c;
                                    BufferLocation before = { line, y, 0 }, after = { line, y, this.tabSize };
                                    NotifyCharsAdded(master, this, &before, &after, this.pasteOperation);
                                    if(style.autoSize) AutoSize();

                                    if(!line.AdjustBuffer(line.count+this.tabSize)) 
                                       break;

                                    {
                                       char * string = new char[this.tabSize + 1];
                                       memset(string, ' ', this.tabSize);
                                       string[this.tabSize] = '\0';
                                       Record(AddTextAction { string = string, x1 = 0, y1 = y, x2 = this.tabSize, y2 = y });
                                    }

                                    memmove(line.buffer+this.tabSize,line.buffer,line.size-(this.tabSize));
                                    line.count+=this.tabSize;
                                    for(c=0; c<this.tabSize; c++)
                                       line.buffer[c] = ' ';
                                 }
                              }
                              DirtyLine(y);
                           }
                        }
                        if(line == lastLine) break;
                     }
                  }
               }
               else
               {
                  if(style.useTab)
                  {
                     // Insert character
                     AddCh('\t');
                  }
                  else
                  {
                     int start, c;
                     char * addString = new char[this.tabSize + 1];
                     int len = 0;
                     if(!(style.freeCaret))
                     {
                        this.x = Min(this.x, this.line.count);
                        ComputeColumn();
                     }
                     // Insert spaces
                     start = this.x;
                     for(c=start; ((c == start) || ((c) % this.tabSize)); c++)
                     {
                        addString[len++] = ' ';
                     }
                     addString[len] = 0;
                     AddS(addString);
                     delete addString;
                  }
               }
               Modified();
               SetViewToCursor(true);
               return false;
            }
            break;
         case pageDown:
            if(key.ctrl)
            {
               if(!(style.hScroll) || hasHorzScroll) break;
               if(this.viewX < this.maxLength)
               {
                  //this.viewX+=this.space.w*this.tabSize;
                  //DirtyAll();
                  SetScrollPosition((this.viewX + this.space.w*this.tabSize), this.viewY * this.space.h);
               }
            }
            else
            {
               PageDown();
               DirtyAll();
               if(!shift) Deselect();
               SetCursorToViewX();
               SetCursorToViewY();
            }
            return false;
            // break;
         case pageUp:
            if(key.ctrl)
            {
               if(!(style.hScroll) || hasHorzScroll) break;
               if(this.viewX > 0)
               {
                  //this.viewX-=this.space.w*this.tabSize;
                  //this.viewX = Max(this.viewX,0);
                  //DirtyAll();
                  SetScrollPosition((this.viewX-this.space.w*this.tabSize), this.viewY * this.space.h);
                  // SetCursorToView();
               }
            }
            else
            {
               PageUp();
               DirtyAll();
               if(!shift) Deselect();
               SetCursorToViewX();
               SetCursorToViewY();
            }
            // break;
            return false;
         case insert:
            if(key.ctrl)
            {
               Copy();
               return false;
            }
            else if(key.shift)
            {
               if(!(style.readOnly))
                  Paste();
               return false;
            }
            else
            {
               this.overwrite ^= 1;
               UpdateCaretPosition(true);
               if(this.overwrite)
                  SetCaret(0,0,0);
               DirtyLine(this.y);
               UpdateDirty();
               NotifyOvrToggle(master, this, this.overwrite);
            }
            break;
         case hotKey: 
            break;
         default:
            
            switch(key)
            {
               case ctrlA:
                  // Select All
                  if(style.noSelect) break;

                  {
                     //Save current view position
                     int tempX = this.viewX;
                     int tempY = this.viewY;
                     
                     this.selX = 0;
                     this.selY = 0;
                     this.selLine = this.lines.first;
                     this.y = this.lineCount-1;
                     this.line = this.lines.last;
                     this.x = this.line.count;
                     ComputeColumn();
                     DirtyAll();
                     SetViewToCursor(true);
                     
                     //Restore previous view position
                     SetScrollPosition(tempX, tempY * this.space.h);
                     
                     UpdateDirty();
                     SetSelectCursor();
                     SelectionEnables();
                  }
                  // TOCHECK: Was there any good reason why we weren't returning false here?
                  return false; // break;
               case ctrlC:
                  Copy();
                  return false;
               case ctrlV:
                  if(!(style.readOnly))
                  {
                     Paste();
                     return false;
                  }
                  break;
               case ctrlX:
               {
                  if(style.readOnly) break;
                  Cut();
                  return false;
               }
               case ctrlL:
               {
                  if(style.readOnly) break;
                  ClearLine();
                  return false;
               }
               case ctrlZ:
                  if(style.readOnly) break;
                  Undo();
                  return false;
               case ctrlY:
                  if(style.readOnly) break;
                  Redo();
                  return false;
               default:
                  if(style.readOnly) break;
                  if(key.shift && key.code == rightBracket)
                  {
                     //Only indent back if you are exactly at one tab.
                     {
                        bool whitespace = true;
                        int i;
                        char * newline;
                        int putsize;
                        
                        int indentwidth;
                        EditLine line = this.line;
                        
                        //Only remove one tab if there is nothing else on the line.
                        for(i = 0; i < this.line.count; i++)
                        {
                           if(this.line.buffer[i] != ' ' && this.line.buffer[i] != '\t')
                           {
                              PutCh(ch);
                              return false;
                           }
                        }
                        
                        //Find opening {
                        i = 1;
                        while(i && line)
                        {
                           int pos;
                           
                           indentwidth = 0;
                           for(pos = line.count - 1; pos >= 0; pos--)
                           {
                              char c = line.buffer[pos];
                              if(c == ' ')
                                 indentwidth++;
                              else if(c == '\t')
                                 indentwidth += this.tabSize;
                              else
                                 //Counting backwards, so when you find a character, indentation is reset
                                 indentwidth = 0;
                              if(i && c == '}')
                                 i++;
                              if(i && c == '{')
                                 i--;
                           }
                           line = line.prev;
                        }
                        
                        //Place the } to get an undo:
                        PutCh(ch);
                        
                        this.x = this.line.count;
                        this.selX = 0;
                        
                        if(!style.useTab)
                           putsize = indentwidth;
                        else
                           putsize = indentwidth / this.tabSize + indentwidth % this.tabSize;
                        
                        newline = new char[putsize+2];
                        newline[putsize] = '}';
                        newline[putsize+1] = '\0';
                        
                        i = 0;
                        if(style.useTab)
                           for(; i < indentwidth / this.tabSize; i++)
                              newline[i] = '\t';
                        for(;i < putsize; i++)
                           newline[i] = ' ';
                        
                        AddS(newline);
                        
                        delete newline;
                     }
                     return false;
                  } else if(!key.ctrl && !key.alt && ch != 128 && ch >= 32)
                  {
                     PutCh(ch);
                     return false;
                  }
                  break;
            }
            break;
      }
      return true;
   }

   void OnHScroll(ScrollBarAction action, int position, Key key)
   {
#ifdef _DEBUG
      //PrintLn("OnHScroll: ", action, ", pos = ", position, ", key = ", key);
#endif
      this.viewX = position;
      if(action != setRange)
      {
         if(!this.mouseMove && style.cursorFollowsView)
            SetCursorToViewX();
      }
      DirtyAll();
      UpdateDirty();
   }

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      int oldViewY = this.viewY;

#ifdef _DEBUG
      //PrintLn("OnVScroll: ", action, ", pos = ", position, ", key = ", key);
#endif
      position /= this.space.h;

      if(position < this.viewY)
      {
         for(; position < this.viewY && this.viewLine.prev; this.viewLine = this.viewLine.prev, this.viewY--);
         style.recomputeSyntax = true;
      }
      else if(position > this.viewY)
      {
         EditLine oldViewLine = viewLine;
         for(; position > this.viewY && this.viewLine.next; this.viewLine = this.viewLine.next, this.viewY++);
         FigureStartSyntaxStates(oldViewLine, false);
      }
      
      if(action != setRange)
      {
         if(!this.mouseMove && style.cursorFollowsView && !SelSize()) SetCursorToViewY();
      }

      if(this.x != this.selX || this.y != this.selY)
         DirtyLine(this.y);

      {
         Scroll(0, (this.viewY - oldViewY) * this.space.h);

         /*
         int numLines = clientSize.h / this.space.h;
         int y;
         if(Abs(this.viewY - oldViewY) < numLines)
            
         
         if(this.viewY > oldViewY)
         {
            for(y = oldViewY; y <this.viewY; y++)
               DirtyLine(y + numLines);
         }
         else
         {
            for(y = this.viewY; y <oldViewY; y++)
               DirtyLine(y + numLines);
         }*/
      }
      //DirtyAll();

      // Fix dirt of stuff before first line...
      if(this.viewY - oldViewY > 0)
      {
         Box box { 0,0, clientSize.w-1, YOFFSET-1 };
         Update(box);
      }
      
      UpdateDirty();
   }

   bool _AddCh(unichar ch, int * addedSpacesPtr, int * addedTabsPtr)
   {
      EditLine line;
      int length, endX;
      bool result;
      ReplaceTextAction replaceAction = null;
      AddCharAction addCharAction = null;
      int addedSpaces = 0, addedTabs = 0;

      if(ch == '\r') return true;
      if(style.stuckCaret /*|EES_READONLY)*/ ) 
         GoToEnd(true);
   
      if(ch == '\n' && !(style.multiLine) && this.line) return false;
      
      if(!undoBuffer.dontRecord)
      {
         if(selX != x || selY != y)
         {
            char buffer[5];
            char * newString;
            char * oldString;
            int len = GetText(null, selLine, selY, selX, this.line, y, x, false, false);
            oldString = new char[len];
            UTF32toUTF8Len(&ch, 1, buffer, 4);
            newString = CopyString(buffer);
            GetText(oldString, selLine, selY, selX, this.line, y, x, false, false);

            replaceAction = ReplaceTextAction { newString = newString, oldString = oldString, placeAfter = false };
            if(selY < y || (selY == y && selX < x))
            {
               replaceAction.x1 = selX;
               replaceAction.y1 = selY;
               replaceAction.x2 = x;
               replaceAction.y2 = y;
            }
            else
            {
               replaceAction.x1 = x;
               replaceAction.y1 = y;
               replaceAction.x2 = selX;
               replaceAction.y2 = selY;
            }
            Record(replaceAction);
            undoBuffer.dontRecord++;
         }
         else
         {
            addCharAction = AddCharAction { y = y, x = x, ch = ch };
            Record(addCharAction);
         }
      }

      if(ch == '\n')
      {
         DelSel(&addedSpaces);
         if(this.lineCount+1 > this.maxLines)
         {
            if(style.autoEmpty)
               Emptyline(this.lines.first,0);
            else
               return false;
         }
         if(!(style.vScroll)) 
         {
            // Make sure it fits, but we need a default line is this.font is too big for window
            if(this.space.h * (this.lineCount+1) > clientSize.h && this.line)
               return false;
         }
         if((this.y >= 0) && this.y < this.viewY)
         {
            this.viewY++;
            DirtyAll();
         }
         line = EditLine { };
         if(!line)
            return false;
         lines.Insert(this.line, line);
         line.editBox = this;
         line.buffer = null;
         line.count = 0;
         line.size = 0;
         length = 0;

         // If we're displacing the lines from a current line ...
         if(this.line)
         {
            if(this.line.buffer)
            {
               endX = this.x;
               if(this.line.count < endX) endX = this.line.count;
               length = this.line.count - endX;
            }
         }
         if(!line.AdjustBuffer(length)) 
            return false;
         if(this.line)
         {
            if(this.line.buffer)
            {
               CopyBytes(line.buffer,this.line.buffer+endX, length+1);
#ifdef _DEBUG
      if(endX > 4000 || endX < 0)
         printf("Warning");
#endif
               this.line.count = endX;
               this.line.buffer[this.line.count] = '\0';
               this.line.AdjustBuffer(this.line.count);
               ComputeLength(this.line);
            }
         }
         {
            BufferLocation before = { this.line, this.y, this.x }, after;

            this.line = line;
            this.x = 0;
            this.col = 0;

            ComputeLength(this.line);

#ifdef _DEBUG
      if(length > 4000 || length < 0)
         printf("Warning");
#endif
            line.count = length;
            DirtyEnd(this.y);
            this.y++;
            this.lineCount++;
            line.buffer[line.count] = '\0';
            result = true;

            after.line = this.line, after.y = this.y, after.x = this.x;

            NotifyCharsAdded(master, this, &before, &after, this.pasteOperation);
            if(style.autoSize) AutoSize();
         }
      }
      else
      {
         char string[5];
         int count = UTF32toUTF8Len(&ch, 1, string, 5);
         DelSel(&addedSpaces);
         result = AddToLine(string, count, false, addedSpaces ? null : &addedSpaces, &addedTabs);
         if(addedSpacesPtr) *addedSpacesPtr = addedSpaces;
         if(addedTabsPtr) *addedTabsPtr = addedTabs;
      }
      this.selX = this.x;
      this.selY = this.y;
      this.selLine = this.line;

      if(replaceAction)
      {
         replaceAction.x3 = x;
         replaceAction.y3 = y;
         replaceAction.addedSpaces = addedSpaces;
         replaceAction.addedTabs = addedTabs;
         undoBuffer.dontRecord--;
      }
      if(addCharAction)
      {
         addCharAction.addedSpaces = addedSpaces;
         addCharAction.addedTabs = addedTabs;
      }
      return result;
   }

public:

   /****************************************************************************
                                 EDIT BOX METHODS
   ****************************************************************************/


   bool AddCh(unichar ch)
   {
      return _AddCh(ch, null, null);
   }

   void Modified()
   {
      this.modified = true;
      NotifyUpdate(master, this);
      modifiedDocument = true;
   }

   void Delete(EditLine line1, int y1, int x1, EditLine line2, int y2, int x2)
   {
      Deselect();
      DelCh(line1, y1, x1, line2, y2, x2, false);
      SetViewToCursor(true);
      UpdateDirty();
      Modified();
   }

   void Undo()
   {
      undoBuffer.Undo();
      itemEditUndo.disabled = undoBuffer.curAction == 0;
      itemEditRedo.disabled = undoBuffer.curAction == undoBuffer.count;
      if(savedAction == undoBuffer.curAction)
      {
         modifiedDocument = false;
         SetModified(false);
         NotifyUnsetModified(master, this);
      }
   }

   void Redo()
   {
      undoBuffer.Redo();
      itemEditUndo.disabled = undoBuffer.curAction == 0;
      itemEditRedo.disabled = undoBuffer.curAction == undoBuffer.count;
      if(savedAction == undoBuffer.curAction)
      {
         modifiedDocument = false;
         SetModified(false);
         NotifyUnsetModified(master, this);
      }
   }

   void Record(UndoAction action)
   {
      if(!undoBuffer.dontRecord)
      {
         undoBuffer.Record(action);
         itemEditUndo.disabled = undoBuffer.curAction == 0;
         itemEditRedo.disabled = undoBuffer.curAction == undoBuffer.count;
      }
   }

   void SelectAll()
   {
      Select(
         this.lines.first, 0,0,
         this.lines.last, this.lines.count-1, strlen(((EditLine)this.lines.last).buffer));
   }

   void Select(EditLine line1, int y1, int x1, EditLine line2, int y2, int x2)
   {
      SelDirty();
      this.selX = x1;
      this.selY = y1;
      this.selLine = line1 ? (EditLine)line1 : this.lines.first;
      this.x = line2 ? x2 : ((EditLine)this.lines.last).count;
      this.y = line2 ? y2 : (this.lineCount-1);
      this.line = line2 ? (EditLine)line2 : this.lines.last;
      ComputeColumn();
      SelDirty();
      SetViewToCursor(true);
      UpdateDirty();
   }

   // TODO: Fix this vs modifiedDocument window property
   void SetModified(bool flag)
   {
      if(this)
      {
         this.modified = false;
         if(flag && !NotifyModified(master, this))
            this.modified = true;
      }
   }

   // BASIC OUTPUT
   bool AddS(char * string)
   {
      if(this)
      {
         bool ret = true;
         char * line;
         int c, count;
         int addedSpaces = 0, addedTabs = 0;
         AddTextAction action = null;
         ReplaceTextAction replaceAction = null;

         this.pasteOperation = true;

         if(style.stuckCaret /*|EES_READONLY)*/ ) 
            GoToEnd(true);

         if(!undoBuffer.dontRecord)
         {
            char * placeString = CopyString(string);
            if(!style.multiLine)
            {
               int i;
               char ch; 
               for(i = 0; (ch = placeString[i]); i++)
                  if(ch == '\n')
                  {
                     placeString[i] = '\0';
                     placeString = renew placeString byte[i+1];
                     break;
                  }
            }
            
            if(selX != x || selY != y)
            {
               char * newString;
               char * oldString;
               int len = GetText(null, selLine, selY, selX, this.line, y, x, false, false);
               oldString = new char[len];
               newString = placeString;
               GetText(oldString, selLine, selY, selX, this.line, y, x, false, false);

               replaceAction = ReplaceTextAction { newString = newString, oldString = oldString, placeAfter = false };
               if(selY < y || (selY == y && selX < x))
               {
                  replaceAction.x1 = selX;
                  replaceAction.y1 = selY;
                  replaceAction.x2 = x;
                  replaceAction.y2 = y;
               }
               else
               {
                  replaceAction.x1 = x;
                  replaceAction.y1 = y;
                  replaceAction.x2 = selX;
                  replaceAction.y2 = selY;
               }
               Record(replaceAction);
            }
            else if(string[0])
            {
               if(string[0] == '\n')
                  action = AddTextAction { y1 = y, x1 = Min(this.line.count, x), string = placeString };
               else
                  action = AddTextAction { y1 = y, x1 = x, string = placeString };
               
               Record(action);
            }
            else
               delete placeString;
         }

         undoBuffer.dontRecord++;
         DelSel(&addedSpaces);

         count = 0;
         line = string;
         for(c = 0; string[c]; c++)
         {
            if(string[c] == '\n' || string[c] == '\r')
            {
               if(!AddToLine(line,count, true, addedSpaces ? null : &addedSpaces, addedTabs ? null : &addedTabs))
               {
                  ret = false;
                  break;
               }
               if(string[c] == '\n')
               {
                  if(!AddCh('\n'))
                  {
                     count = 0;
                     ret = false;
                     break;
                  }
               }
               // Reset for next line
               count = 0;
               line = string+c+1;
               /*
               if(string[c] == '\r' && *line == '\n') 
               {
                  line++;
                  c++;
               }*/
            }
            else
            {
               count++;
            }
         }

         // Why was this here?
         // FindMaxLine();

         // Add the line here
         if(ret && count)
            if(!AddToLine(line,count,false, addedSpaces ? null : &addedSpaces, addedTabs ? null : &addedTabs))
            {
               ret = false;
            }
         FindMaxLine();

         undoBuffer.dontRecord--;
         if(action)
         {
            action.y2 = y;
            action.x2 = x;
            action.addedSpaces = addedSpaces;
            action.addedTabs = addedTabs;
         }
         else if(replaceAction)
         {
            replaceAction.y3 = y;
            replaceAction.x3 = x;
            replaceAction.addedSpaces = addedSpaces;
            replaceAction.addedTabs = addedTabs;
         }

         UpdateCaretPosition(true);

         this.pasteOperation = false;

         return ret;
      }
      return false;
   }

   // CONSOLE OUTPUT
   void Clear()
   {
      if(this)
      {
         Deselect();
         DelCh(this.lines.first, 0, 0, this.lines.last, this.lineCount-1, ((EditLine)(this.lines.last)).count, true);
         SetViewToCursor(true);
         UpdateDirty();
         Modified();
      }
   }

   void PutCh(unichar ch)
   {
      bool result;
      
      if((ch >= 32 /*&& ch <=126*/) || ch == '\n')
      //if((ch >= 32) || ch == '\n')
      {
         int addedSpaces = 0, addedTabs = 0;
         ReplaceTextAction replaceAction = null;
         AddCharAction addCharAction = null;

         if(style.allCaps)
            ch = (ch < 128) ? toupper(ch) : ch;     // TODO: UNICODE TO UPPER

         if(this.x < this.line.count && this.overwrite)
         {
            char buffer[5];
            char * newString;
            char * oldString;
            int len = GetText(null, line, y, x, line, y, x+1, false, false);
            oldString = new char[len];
            UTF32toUTF8Len(&ch, 1, buffer, 4);
            newString = CopyString(buffer);
            GetText(oldString, line, y, x, line, y, x+1, false, false);
            replaceAction = ReplaceTextAction { newString = newString, oldString = oldString, placeAfter = false };
            replaceAction.x1 = x;
            replaceAction.y1 = y;
            replaceAction.x2 = x+1;
            replaceAction.y2 = y;
            Record(replaceAction);

            undoBuffer.dontRecord++;
            DelCh(this.line, this.y, this.x, this.line, this.y, this.x+1, true);
            undoBuffer.dontRecord--;
         }
         else if(!undoBuffer.dontRecord)
         {
            if(selX != x || selY != y)
            {
               char buffer[5];
               char * newString;
               char * oldString;
               int len = GetText(null, line, y, x, selLine, selY, selX, false, false);
               oldString = new char[len];
               UTF32toUTF8Len(&ch, 1, buffer, 4);
               newString = CopyString(buffer);
               GetText(oldString, line, y, x, selLine, selY, selX, false, false);
               replaceAction = ReplaceTextAction { newString = newString, oldString = oldString, placeAfter = true };
               if(selY < y || (selY == y && selX < x))
               {
                  replaceAction.x1 = selX;
                  replaceAction.y1 = selY;
                  replaceAction.x2 = x;
                  replaceAction.y2 = y;
               }
               else
               {
                  replaceAction.x1 = x;
                  replaceAction.y1 = y;
                  replaceAction.x2 = selX;
                  replaceAction.y2 = selY;
               }
               Record(replaceAction);
            }
            else
            {
               addCharAction = AddCharAction { y = y, x = x, ch = ch };
               Record(addCharAction);
            }
         }
         undoBuffer.dontRecord++;
         result = _AddCh(ch, &addedSpaces, &addedTabs);
         if(replaceAction)
         {
            replaceAction.x3 = x;
            replaceAction.y3 = y;
            replaceAction.addedSpaces = addedSpaces;
            replaceAction.addedTabs = addedTabs;
         }  
         if(addCharAction)
         {
            addCharAction.addedSpaces = addedSpaces;
            addCharAction.addedTabs = addedTabs;
         }
         undoBuffer.dontRecord--;
         if(ch == '\n')
            FindMaxLine();
         Modified();
         if(result) SetViewToCursor(true);
      }
   }

   void PutS(char * string)
   {
      if(this)
      {
         AddS(string);
         SetViewToCursor(true);
         Modified();
      }
   }

   void Printf(char * format, ...)
   {
      if(this)
      {
         char temp[MAX_F_STRING];
         va_list args;
         va_start(args, format);
         vsnprintf(temp, sizeof(temp), format, args);
         temp[sizeof(temp)-1] = 0;
         va_end(args);
         PutS(temp);
      }
   }

   void SetContents(char * format, ...)
   {
      if(this)
      {
         Deselect();
         DelCh(this.lines.first, 0, 0, this.lines.last, this.lineCount-1, ((EditLine)(this.lines.last)).count, true);
         if(format)
         {
            char temp[MAX_F_STRING];
            va_list args;
            va_start(args, format);
            vsnprintf(temp, sizeof(temp), format, args);
            temp[sizeof(temp)-1] = 0;
            va_end(args);

            AddS(temp);
         }
         UpdateDirty();
         Home();
      }
   }

   void BackSpace()
   {
      if(!DelSel(null))
      {
         if(x > 0)
         {
            x -= 1 + DelCh(line, y, x-1, line, y, x, true);
            Modified();
         }
         else if(this.line.prev)
         {
            EditLine line = this.line.prev;
            int x = line.count;
            int y = this.y;

            DelCh(line, this.y-1, x, this.line, this.y, this.x, true);
            this.line = line;
            this.y = y-1;
            this.x = x;
            Modified();
         }
         this.selX = this.x;
         this.selY = this.y;
         this.selLine = this.line;
         ComputeColumn();
      }
      else
         Modified();
      SetViewToCursor(true);
   }

   void ClearLine()
   {
      Emptyline(this.line,this.y);
      this.selX = this.x = 0;
      this.col = 0;
      this.selY = this.y;
      this.selLine = this.line;

      SetViewToCursor(true);
      Modified();
   }

   // CARET CONTROL
   void End()
   {
      if(this)
      {
         GoToEnd(true);
         SetViewToCursor(true);
      }
   }
   void Home()
   {
      if(this)
      {
         GoToHome(true);
         SetViewToCursor(true);
      }
   }

   bool GoToLineNum(int lineNum)
   {
      if(this.line)
      {
         int c;
         EditLine line = this.lines.first;
         for(c = 0; c < lineNum && line; c++, line = line.next);
         if(line)
         {
            if(this.y != c)
               DirtyAll();
            else
               DirtyLine(c);
            this.y = c;
            this.line = line;
            Deselect();
            SetViewToCursor(true);
            return true;
         }
      }
      return false;
   }

   bool GoToPosition(EditLine line, int y, int x)
   {
      /*
      if(!line)
      {
         line = this.line;
         y = this.y;
      }
      */
      if(!line)
      {
         int c;
         for(line = this.lines.first, c = 0; c<y && line; c++, line = line.next);
      }

      if(line)
      {
         if(this.y != y)
            DirtyAll();
         else
            DirtyLine(y);
         this.x = x;
         this.y = y;
         this.line = line;
         ComputeColumn();
         Deselect();
         SetViewToCursor(true);
         return true;
      }
      return false;
   }

   // VIEW POSITIONING
   void SetViewToCursor(bool setCaret)
   {
      if(created)
      {
         int w;
         int c, numLines;
         EditLine line;
         int x;
         int checkX, checkY;
         EditLine checkLine;
         bool dontScroll = false;
         bool selected;
         int viewX, viewY;

         FixScrollArea();

         selected = selX != this.x || selY != y;
         
         viewX = this.viewX;
         viewY = this.viewY;

         if(mouseMove)
         {
            checkLine = dropLine;
            checkX = dropX;
            checkY = dropY;
         }
         else
         {
            checkLine = this.line;
            checkX = this.x;
            checkY = y;
         }

         numLines = clientSize.h / space.h;

         // This is broken. The EditBox now doesn't do anything different when adding to it,
         // regardless of the previous scrolling position. It should be read and then set again
         // if one wishes to preserve it.
         /*  // Don't scroll view to cursor if we're in a EES_NOCARET box
         if(style.noCaret && this.viewY < lineCount - numLines - 1)
            dontScroll = true;
         */

         // Horizontal Adjustment
         if(!dontScroll && checkLine)
         {
            x = 0;
            if(mouseMove)
               dropX = AdjustXPosition(this.line, MAXINT, true, &x, checkX, 0);
            else
            {
               this.x = AdjustXPosition(this.line, MAXINT, true, &x, checkX, 0);
               ComputeColumn();
            }

            if(style.hScroll)
            {
               if(x + space.w >= this.viewX + clientSize.w && clientSize.w >= space.w)
                  viewX = x - clientSize.w+space.w;
               if(x < this.viewX + clientSize.w/2 - space.w)
                  viewX = Max(0, x - clientSize.w/2 + space.w);
            }
         }

         if(!dontScroll) 
         {
            if(style.vScroll)
            {
               // Vertical Adjustment
               if(viewY > checkY) viewY = checkY;
               if(viewY + numLines <= checkY)
               {
                  if(clientSize.h >= space.h)
                  {
                     for(line = viewLine; line && (viewY + numLines <= checkY); line = line.next)
                        viewY++;
                  }
                  else
                     viewY = checkY;
               }
            }
            else
            {
               if(mouseMove)
                  for(;dropLine && dropLine.prev && dropY >= numLines;)
                  {
                     dropLine = dropLine.prev;
                     dropY--;                  
                  }
               else
                  for(;this.line && this.line.prev && this.y >= numLines;)
                  {
                     this.line = this.line.prev;
                     y--;                  
                  }
            }

            SetScrollPosition(viewX, viewY * this.space.h);

            UpdateCaretPosition(setCaret);

            if(!selected)
            {
               selX = this.x;
               selY = this.y;
               selLine = this.line;
            }
         }

         UpdateDirty();
         SetSelectCursor();
         SelectionEnables();
      }
   }

   void CenterOnCursor()
   {
      int numLines = clientSize.h / this.space.h;
      int y = this.y - numLines / 2;
      int viewY;
      bool figureSyntax = false;
      EditLine oldViewLine = viewLine;
      if(y > this.lineCount - numLines) y = this.lineCount-numLines;
      if(y < 0) y = 0;

      viewY = y;

      for(;y < this.viewY; y++)
      {
         this.viewLine = this.viewLine.prev;
         style.recomputeSyntax = true;
      }
      for(;y > this.viewY; y--)
      {
         this.viewLine = this.viewLine.next;
         figureSyntax = true;
      }
      if(figureSyntax)
         FigureStartSyntaxStates(oldViewLine, false);

      this.viewY = viewY;

      SetScrollPosition(this.viewX, viewY * this.space.h);
      UpdateCaretPosition(true);
      UpdateDirty();
   }

   void SetCursorToView()
   {
      SetCursorToViewX();
      SetCursorToViewY();
   }

   void PageDown()
   {
      int c, numLines;
      EditLine line;

      numLines = clientSize.h / this.space.h;

      if(style.noCaret)
      {
         for(c=0, line = this.viewLine.next; line && c<numLines && (this.viewY < this.lineCount - numLines); line = line.next, c++);
         SetScrollPosition(this.viewX, (this.viewY + c) * this.space.h);
      }
      else
      {
         EditLine oldLine = this.line;
         bool lastOne = false;
         EditLine oldViewLine = this.viewLine;
         bool figureSyntax = false;

         if(this.y >= this.lineCount-1) return;

         for(c=0, line = this.line.next; line && c<numLines; line = line.next, c++)
         {
            if(this.viewY + numLines < this.lines.count)
            {
               this.viewLine = this.viewLine.next;
               this.viewY++;
               figureSyntax = true;
            }
            else if(c && !lastOne)
               break;
            else
               lastOne = true;

            this.line = line;
            this.y++;
         }
         if(figureSyntax)
            FigureStartSyntaxStates(oldViewLine, false);
         this.x = AdjustXPosition(line, caretX, true, null, MAXINT, 0);
         ComputeColumn();

         SetViewToCursor(false);
      }
   }

   void PageUp()
   {
      int c, numLines;
      EditLine line;
      
      if(this.y == 0) return;

      numLines = clientSize.h / this.space.h;

      if(style.noCaret)
      {
         for(c=0, line = this.viewLine.prev; line && c<numLines; line = line.prev, c++);
         SetScrollPosition(this.viewX, (this.viewY - c) * this.space.h);
      }
      else
      {
         EditLine oldLine = this.line;

         for(c=0, line = this.line.prev; line && c<numLines; line = line.prev, c++)
         {
            this.line = line;
            this.y--;

            if(this.viewLine.prev)
            {
               this.viewLine = this.viewLine.prev;
               this.viewY--;
               style.recomputeSyntax = true;
            }
         }

         this.x = AdjustXPosition(line, caretX, true, null, MAXINT, 0);
         ComputeColumn();

         SetViewToCursor(false);
      }
   }

   void LineUp()
   {

      if(this.viewLine.prev)
      {
         //DirtyAll();
         // this.viewLine = this.viewLine.prev;
         //this.viewY--;

         SetScrollPosition(this.viewX, (this.viewY - 1) * this.space.h);
      }
   }


   void LineDown()
   {
      if(this.viewLine.next)
      {
         //DirtyAll();
         // this.viewLine = this.viewLine.next;
         // this.viewY++;
         
         SetScrollPosition(this.viewX, (this.viewY + 1) * this.space.h);
      }
   }

   // Selection
   uint SelSize()
   {
      EditLine l1, l2, line;
      int x1, x2, nx1, nx2;
      int count;
      int start, end;
      int size;

      if(!this.selLine) return 0;
      if(this.selLine == this.line && this.selX == this.x) return 0;
      if(this.selY < this.y)
      {
         l1 = this.selLine;
         x1 = this.selX;
         l2 = this.line;
         x2 = this.x;
      }
      else if(this.selY > this.y)
      {
         l1 = this.line;
         x1 = this.x;
         l2 = this.selLine;
         x2 = this.selX;
      }
      else if(this.selX < this.x)
      {
         l1 = l2 = this.line;
         x1 = this.selX;
         x2 = this.x;
      }
      else
      {
         l1 = l2 = this.line;
         x1 = this.x;
         x2 = this.selX;
      }
      nx1 = Min(x1,l1.count);
      nx2 = Min(x2,l2.count);
      
      // Find Number of Bytes Needed
      size = 0;
      for(line = l1; line; line = line.next)
      {  
         if(line == l1) start = nx1; else start = 0;
         if(line == l2) end = nx2; else end = line.count;
         size += end-start;
         if(style.freeCaret && line == l2)
         {
            if(l1 == l2)
               count = Max(x2-Max(x1,l1.count),0);
            else
               count = Max(x2-l2.count,0);
            size+=count;
         }

         if(line == l2) break;
         // Add Carriage Return / line Feed
         size++;
         size++;
      }
      return size;
   }

   void GetSelPos(EditLine * l1, int *y1, int *x1, EditLine * l2, int * y2, int * x2, bool reorder)
   {
      if(this)
      {
         if(!reorder || this.selY < this.y)
         {
            if(l1) *l1 = this.selLine;
            if(y1) *y1 = this.selY;
            if(x1) *x1 = this.selX;
            if(l2) *l2 = this.line;
            if(y2) *y2 = this.y;
            if(x2) *x2 = this.x;
         }
         else if(this.selY > this.y)
         {
            if(l1) *l1 = this.line;
            if(y1) *y1 = this.y;
            if(x1) *x1 = this.x;
            if(l2) *l2 = this.selLine;
            if(y2) *y2 = this.selY;
            if(x2) *x2 = this.selX;
         }
         else if(this.selX < this.x)
         {
            if(l1) *l1 = this.line;
            if(y1) *y1 = this.selY;
            if(x1) *x1 = this.selX;
            if(l2) *l2 = this.line;
            if(y2) *y2 = this.y;
            if(x2) *x2 = this.x;
         }
         else
         {
            if(l1) *l1 = this.line;
            if(y1) *y1 = this.y;
            if(x1) *x1 = this.x;
            if(l2) *l2 = this.line;
            if(y2) *y2 = this.selY;
            if(x2) *x2 = this.selX;
         }
      }
   }

   void SetSelPos(EditLine l1, int y1, int x1, EditLine l2, int y2, int x2)
   {
      if(this && (this.selY != y1 || this.selX != x1 || this.y != y2 || this.x != x2))
      {
         this.selLine = (EditLine)l1;
         this.selY = y1;
         this.selX = x1;
         this.line = (EditLine)l2;
         this.y = y2;
         this.x = x2;
         ComputeColumn();
         SetViewToCursor(true);
      }
   }

   int GetText(char * text, EditLine _l1, int _y1, int _x1, EditLine _l2, int _y2, int _x2, bool addCr, bool addSpaces)
   {
      EditLine l1, l2, line;
      int x1, x2, nx1, nx2;
      int count;
      int start, end;
      int numChars = 0;

      if(_y2 < _y1)
      {
         l1 = _l2;
         x1 = _x2;
         l2 = _l1;
         x2 = _x1;
      }
      else if(_y2 > _y1)
      {
         l1 = _l1;
         x1 = _x1;
         l2 = _l2;
         x2 = _x2;
      }
      else if(_x2 < _x1)
      {
         l1 = l2 = _l1;
         x1 = _x2;
         x2 = _x1;
      }
      else
      {
         l1 = l2 = _l1;
         x1 = _x1;
         x2 = _x2;
      }
      nx1 = Min(x1,l1.count);
      nx2 = Min(x2,l2.count);

      // Copy text
      for(line = l1; line; line = line.next)
      {  
         if(line == l1) start = nx1; else start = 0;
         if(line == l2) end = nx2; else end = line.count;
         if(text)
         {
            CopyBytes(text, line.buffer + start, end - start);
            text += end-start;
         } 
         numChars += end-start;
         
         if(style.freeCaret && line == l2 && addSpaces)
         {
            if(l1 == l2)
               count = Max(x2-Max(x1,l1.count),0);
            else
               count = Max(x2-l2.count,0);
            if(text)
            {
               FillBytes(text,' ',count);
               text += count;
            }
            else
               numChars += count;
         }
         if(line == l2) break;
         // Add line Feed
         if(addCr)
         {
            if(text)
               *(text++) = '\r';
            numChars++;
         } 
         if(text)
            *(text++) = '\n';
         numChars++; 
      }
      // '\0' terminate Terminate
      if(text)
         *(text) = '\0';
      numChars++;
      return numChars;
   }

   void GetSel(char * text, bool addCr)
   {
      GetText(text, line, y, x, selLine, selY, selX, addCr, true);
   }

   void Deselect()
   {
      SelDirty();
      this.selLine = this.line;
      this.selX = this.x;
      this.selY = this.y;
   }

   // CLIPBOARD
   void Copy()
   {
      if(this)
      {
         int size = SelSize();
         if(size)
         {
            // Try to allocate memory
            ClipBoard clipBoard { };
            if(clipBoard.Allocate(size+1))
            {
               GetSel(clipBoard.memory, true);   
               // Save clipboard
               clipBoard.Save();
            }
            delete clipBoard;
         }
      }
   }

   void Paste()
   {
      if(this)
      {
         ClipBoard clipBoard { };
         if(clipBoard.Load())
            PutS(clipBoard.memory);
         delete clipBoard;
      }
   }

   void Cut()
   {
      if(this)
      {
         Copy();
         if(DelSel(null))
         {
            SetViewToCursor(true);
            Modified();
         }
      }
   }

   void DeleteSelection()
   {
      if(this)
      {
         DelSel(null);
         SetViewToCursor(true);
         Modified();
      }
   }

   // FILE INTERFACE
   void Save(File f, bool cr)
   {
      EditLine line;
      savedAction = undoBuffer.curAction;

      for(line = this.lines.first; line; line = line.next)
      {  
         f.Write(line.buffer, line.count,1);
         if(line.next)
         {
            if(cr) f.Putc('\r');
            f.Putc('\n');
         }
      }
   }

   #define BUFFER_SIZE  16384
   void Load(File f)
   {
      undoBuffer.dontRecord++;
      if(f)
      {
         char buffer[BUFFER_SIZE];
     
         for(;;)
         {
            int count = f.Read(buffer, 1, BUFFER_SIZE-1);
            buffer[count] = '\0';
            AddS(buffer);
            if(!count) break;
         }
         Home();
      }
      undoBuffer.dontRecord--;
      undoBuffer.count = 0;
      undoBuffer.curAction = 0;
      itemEditUndo.disabled = undoBuffer.curAction == 0;
      itemEditRedo.disabled = undoBuffer.curAction == undoBuffer.count;
   }

   EditBoxFindResult Find(char * text, bool matchWord, bool matchCase, bool isSearchDown)
   {
      EditLine line;
      int num;
      bool firstPass = true;
      EditBoxFindResult result = found;

      if(!this.line) return notFound;
      num = this.y;

      for(line = this.line;;)
      {
         char * string;

         if(!line) 
         {
            if(isSearchDown)
            {
               line = this.lines.first;
               num = 0;
               result = wrapped;
            }
            else
            {
               line = this.lines.last;
               num = this.lineCount - 1;
               result = wrapped;
            }
         }
         
         if(isSearchDown)
            string = SearchString(line.buffer, firstPass ? Min(this.x,line.count) : 0,text,matchCase,matchWord);
         else
            string = RSearchString(line.buffer,text,firstPass ? (Min(this.x,line.count)-1) : line.count,matchCase,matchWord);

         if(string)
         {
            Select((void *)line,num,string - line.buffer,(void *)line,num,string - line.buffer + strlen(text));
            return result;
         } 
         if(line == this.line && !firstPass) break;

         if(isSearchDown)
         {
            line = line.next;
            num++;
         }
         else
         {
            line = line.prev;
            num--;
         }

         firstPass = false;
      }
      return notFound;
   }

   EditBoxFindResult FindInSelection(char * text, bool matchWord, bool matchCase, EditLine l2, int y2, int x2)
   {
      EditLine line;
      int y;
      int searchLen = strlen(text);
      for(line = (EditLine)this.line, y = this.y; y <= y2; line = line.next, y++)
      {
         char * string = SearchString(line.buffer, (y == this.y) ? Min(this.x,line.count) : 0,text,matchCase,matchWord);
         if(string && (y < y2 || (string - line.buffer) + searchLen <= x2))
         {
            Select((void *)line,y,string - line.buffer,(void *)line,y,string - line.buffer + strlen(text));
            return found;
         } 
      }
      return notFound;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
#ifdef _DEBUG
      //PrintLn("OnKeyDown: code = ", key.code, ", mods = ", key.modifiers, ", ch = ", (int)ch);
#endif
      if(!NotifyKeyDown(master, this, key, ch))
         return false;
      else 
      {
         switch(key)
         {
            case escape:
            {
               if(this.mouseMove)
               {
                  this.mouseMove = false;
                  OnLeftButtonUp(0,0,0);
                  SetViewToCursor(true);
                  return false;
               }
            }
         }
      }
      return true;
   }
};

public class EditBoxStream : File
{
   EditBox editBox;
   BufferLocation start, sel;
   uint pos;
   byte utf8Bytes[5];
   int numBytes;

   ~EditBoxStream()
   {
      EditBox editBox = this.editBox;

      editBox.x = start.x;
      editBox.y = start.y;
      editBox.line = start.line;

      editBox.selX = sel.x;
      editBox.selY = sel.y;
      editBox.selLine = sel.line;

      editBox.SetViewToCursor(true);
      //editBox.ComputeColumn();
   }

public:
   property EditBox editBox
   {
      set
      {
         editBox = value;

         start.x = value.x;
         start.y = value.y;
         start.line = value.line;

         sel.x = value.selX;
         sel.y = value.selY;
         sel.line = value.selLine;
         numBytes = 0;

         value.GoToHome(true);
      }

      get { return editBox; }
   }

   uint Read(byte * buffer, uint size, uint count)
   {
      uint read = 0;
      EditBox editBox = this.editBox;
      EditLine line = editBox.line;
      int x = editBox.x;
      int y = editBox.y;

      count *= size;

      for(;read < count && line; line = (*&line.next))
      {
         int numBytes = Min(count - read, (*&line.count) - x);
         if(numBytes > 0)
         {
            memcpy(buffer + read, (*&line.buffer) + x, numBytes);
            read += numBytes;
            x += numBytes;
         }
         /*
         for(;read < count && x < (*&line.count);)
         {
            buffer[read++] = (*&line.buffer)[x++];
         }
         */
         if((*&line.next))
         {
            if(read < count)
            {
               buffer[read++] = '\n';
            }
            else
               break;
         }
         if(x == (*&line.count) && (*&line.next))
         {
            x = 0;
            y++;
         }
         else
            break;         
      }

      editBox.line = editBox.selLine = line;
      editBox.x = editBox.selX = x;
      editBox.y = editBox.selY = y;
      pos += read;
      return read / size;
   }

   bool Seek(int pos, FileSeekMode mode)
   {
      bool result = true;
      EditBox editBox = this.editBox;
      EditLine line = editBox.line;
      numBytes = 0;
      if(mode == FileSeekMode::start)
      {
         pos = pos - this.pos;
         mode = current;
      }
      if(mode == current)
      {
         uint read = 0;
         int x = editBox.x;
         int y = editBox.y;
         if(pos > 0)
         {
            for(;read < pos && line; line = (*&line.next))
            {
               int numBytes = Min(pos - read, (*&line.count) - x);
               if(numBytes > 0)
               {
                  read += numBytes; x += numBytes;
               }

               /*for(;read < pos && x < (*&line.count);)
               {
                  read++; x++;
               }
               */
               if((*&line.next))
               {
                  if(read < pos)
                  {
                     read++;
                     x = 0;
                  }
                  else
                     break;
               }
               else
               {
                  if(read<pos)
                     result = false;
                  break;
               }
               y++;
            }
            this.pos += read;
         }
         else if(pos < 0)
         {
            pos = -pos;
            for(;read < pos && line; line = (*&line.prev))
            {
               int numBytes = Min(pos - read, x);
               if(numBytes > 0)
               {
                  read += numBytes;
                  x -= numBytes;
               }
               /*for(;read < pos && x > 0;)
               {
                  read++; x--;
               }
               */
               if((*&line.prev))
               {
                  if(read < pos)
                  {
                     read++;
                     x = (*&(*&line.prev).count);
                  }
                  else
                     break;
               }
               else
               {
                  if(read<pos)
                     result = false;
                  break;
               }
               y--;
            }
            this.pos -= read;
         }

         editBox.line = editBox.selLine = line;
         editBox.x = editBox.selX = x;
         editBox.y = editBox.selY = y;
      }
      return result;
   }
   
   bool Puts(char * string)
   {
      EditBox editBox = this.editBox;
      BufferLocation start { editBox.line, editBox.y, editBox.x };
      BufferLocation pos;
      
      numBytes = 0;
      editBox.AddS(string);

      pos.line = editBox.line;
      pos.y = editBox.y;
      pos.x = editBox.x;

      this.start.AdjustAdd(start, pos);
      sel.AdjustAdd(start, pos);

      return true;
   }

   // NOTE: BYTE, NOT UNICODE CHARACTER!
   bool Putc(char ch)
   {
      EditBox editBox = this.editBox;
      BufferLocation start = { editBox.line, editBox.y, editBox.x };
      BufferLocation pos;

      if(numBytes < 4)
      {
         utf8Bytes[numBytes++] = ch;
         utf8Bytes[numBytes] = 0;
         if(UTF8Validate(utf8Bytes))
         {
            editBox.AddCh(UTF8_GET_CHAR(utf8Bytes, numBytes));
            numBytes = 0;
            pos.line = editBox.line;
            pos.y = editBox.y;
            pos.x = editBox.x;
            this.start.AdjustAdd(start, pos);
            sel.AdjustAdd(start, pos);
         }
         return true;
      }
      return false; 
   }

   bool Getc(char * ch)
   {
      return Read(ch, 1, 1) ? true : false;
   }

   void DeleteBytes(uint count)
   {
      EditBox editBox = this.editBox;
      if(count)
      {
         BufferLocation pos { editBox.line, editBox.y, editBox.x };
         BufferLocation end = pos;

         uint c = 0;
         for(;;)
         {
            for(;c < count && end.line && end.x < end.line.count;)
            {
               end.x++;
               c++;
            }
            if(c < count && end.line && end.line.next)
            {
               end.line = end.line.next;
               end.y++;
               c++;
               end.x = 0;
            }
            else
               break;
         }

         start.AdjustDelete(pos, end);
         sel.AdjustDelete(pos, end);

         editBox.DelCh(pos.line, pos.y, pos.x, end.line, end.y, end.x, true);
      }
   }
};
