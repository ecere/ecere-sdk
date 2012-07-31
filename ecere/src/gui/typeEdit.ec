namespace gui;

import "Window"

static define ROWOFFSET = 1;

class Enumeration : struct
{
   OldList values;
   int largest;
};

static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
   a.OnFree();
   a.OnCopy(null);
   a.OnCompare(null);
   a.OnSaveEdit(null,0);
   a.OnEdit(null,null,0,0,0,0,0);
   a.OnDisplay(null,0,0,0,0,0,0);
   a.OnGetDataFromString(null);
}

default:
extern int __ecereVMethodID_class_OnEdit;
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnSaveEdit;
private:

/*static */Window Enum_OnEdit(Class _class, int * data, Window window, Window master,
                          int x, int y, int w, int h, void * userData)
{
   Enumeration enumeration = _class.data;
   NamedLink item;
   DropBox dropBox
   {
      window, master = master,
      borderStyle = 0, //position = { x, y }, size = { w, h },
      modifyVirtualArea = false, activeStipple = false;
      anchor = { 0, 0, 0, 0 };

      bool DataBox::NotifySelect(DropBox control, DataRow row, Modifiers mods)
      {
         SetData(row.GetData(null), mods.closingDropDown);
         return true;
      }

      bool DataBox::NotifyClose(DropBox dropBox)
      {
         //dropBox.Deactivate();   
         return true;
      }
   };
   // Read only DataBoxes don't really need the edition, but it will be invoked if autoSize is on because the base class OnEdit check succeeded and chained here,
   // and it's thinking the editor is going to be an EditBox. We return an editor so the DataBox goes on with life.
   if(!((DataBox)window).readOnly)
   {
      dropBox.AddField({ dataType = _class, userData = userData });
      dropBox.Create();

      for(item = enumeration.values.first; item; item = item.next)
      {
         DataRow row = dropBox.AddRow();
         row.SetData(null, (uint)item.data); //name);
         if(data && (int)item.data == *data)
            dropBox.currentRow = row;
      }
   }
   return dropBox;
}


static void OnDisplay(Class _class, void * data, Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
{
   static char tempString[16384];
   char * string;
   int len;
   bool needClass = false;
   int w, h;

   tempString[0] = '\0';
   string = (char *)_class._vTbl[__ecereVMethodID_class_OnGetString](_class, data, tempString, fieldData, &needClass);
   len = string ? strlen(string) : 0;

   //surface.TextOpacity(false);

   if(!(displayFlags.fullRow) || (displayFlags.header && displayFlags.current))
   {
      surface.TextExtent(string, len, &w, &h);
      h = Max(h, 16);
   }

   // Draw the selection background
   if(!(displayFlags.fullRow) && (displayFlags.selected) && displayFlags.firstField)
      surface.Area(x - 3, y, x + w + 1, y + h - 1);

   if(string)
   //surface.WriteTextDots(alignment, x, y + 2, width, string, len);
   surface.WriteTextDots(alignment, x, y + ROWOFFSET, width, string, len);

   if(!guiApp.textMode)
   {
      // Draw the current row stipple
      if(displayFlags.current && !(displayFlags.fullRow) && displayFlags.firstField)
      {
         if(displayFlags.active)
         {
            surface.LineStipple(0x5555);
            if(displayFlags.selected)
               surface.SetForeground(0xFFFFFF80);
            else
               surface.SetForeground(black);
         }
         else
            surface.SetForeground(SELECTION_COLOR);
         surface.Rectangle(x - 3, y, x + w + 1, y + h - 1);
         surface.LineStipple(0);
      }
   }
   if((displayFlags.header) && (displayFlags.current) && (displayFlags.fullRow || displayFlags.firstField))
   {
      surface.LineStipple(0xAAAA);
      surface.SetForeground(black);
      surface.Rectangle(x-2, y+1, x+w+1, y + h - 1);
      surface.LineStipple(0);
   }
}

static bool class_OnSaveEdit(Class _class, void ** data, Window editControl, void * object)
{
   if(_class.type == enumClass)
   {
      DropBox dropBox = (DropBox)editControl;
      return dropBox.Save();
   }
   else
   {
      bool changed = false;
      EditBox editBox = (EditBox)editControl;
      if(editBox.modifiedDocument && (!_class.noExpansion || _class._vTbl[__ecereVMethodID_class_OnGetDataFromString] != (void *)Instance::OnGetDataFromString))
      {
         if(_class.type == normalClass || _class.type == noHeadClass)
         {
            _class._vTbl[__ecereVMethodID_class_OnFree](_class, *data);
            changed = _class._vTbl[__ecereVMethodID_class_OnGetDataFromString](_class, data, editBox.line.text);
         }
         else
         {
            _class._vTbl[__ecereVMethodID_class_OnFree](_class, data);
            changed = _class._vTbl[__ecereVMethodID_class_OnGetDataFromString](_class, data, editBox.line.text);
         }
         //changed = true;
      }
      return changed;
   }
}

static Window OnEdit(Class _class, void * data, Window window, Window master,
                     int x, int y, int w, int h, void * fieldData)
{
   if(_class.type == enumClass)
      return Enum_OnEdit(_class, data, window, master, x, y, w, h, fieldData);
   else
   {
      char tempString[MAX_F_STRING] = "";
      // Don't show the editbox right away so that the text is highlighted by default
      char * string = "";
      EditBox editBox
      {
         window, master = master, visible = false, //position = { x, y }, 
         borderStyle = 0,
         modifyVirtualArea = false, //sizeAnchor = { { w, h }, isClientH = true };
         autoSize = (eClass_IsDerived(window._class, class(DataBox)) ? ((DataBox)window).autoSize : false);

         void DataBox::NotifyUpdate(EditBox editBox)
         {
            Modified();
            modifiedDocument = true;
         }

         bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
         {
            opacity = (active && !readOnly) ? 1.0f : parent.opacity;
            return EditBox::OnActivate(active, previous, goOnWithActivation, direct);
         }
      };
      if(!editBox.autoSize)
         editBox.anchor = { 0, 0, 0, 0 };
      else
         editBox.anchor = { 0, 0 };

      if(data)
      {
         bool needClass = false;
         char * result = (char *)_class._vTbl[__ecereVMethodID_class_OnGetString](_class, data, tempString, fieldData, &needClass);
         if(result)
            string = result;
      }
/*#ifdef _DEBUG
      PrintLn(window._class.name);
      if(editBox.autoSize)
         PrintLn("typeEdit::OnEdit -- editBox.autoSize == true");
#endif*/
      editBox.contents = string;
      editBox.visible = true;
      editBox.Create();
      if(!window.active)
      {
         // editBox.contents = string;
         editBox.Deselect();
         editBox.Home();
      }
      return editBox;
   }
   
}

__on_register_module()
{
   Class baseClass = eSystem_FindClass(module, "class");
   eClass_AddMethod(baseClass, "OnDisplay", null, OnDisplay, publicAccess);
   eClass_AddMethod(baseClass, "OnEdit", null, OnEdit, publicAccess);
   eClass_AddMethod(baseClass, "OnSaveEdit", null, class_OnSaveEdit, publicAccess);
}
