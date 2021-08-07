namespace gui;

import "Window"

static define ROWOFFSET = 1;

class Enumeration : struct
{
   OldList values;
   int largest;
};

static __attribute__((unused)) void UnusedFunction()
{
   int a = 0;
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
   NamedLink64 item;
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
         row.SetData(null, item.data); //name);
         if(data && item.data == *data)
            dropBox.currentRow = row;
      }
   }
   else
      dropBox.autoCreate = false;
   return dropBox;
}


static void OnDisplay(Class _class, void * data, Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
{
   static char tempString[16384];
   const char * string;
   int len;
   ObjectNotationType onType = none;
   int w, h;

   tempString[0] = '\0';
   string = ((const char * (*)(void *, void *, void *, void *, void *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetString])(_class, data, tempString, fieldData, &onType);
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
            ((void (*)(void *, void *))(void *)_class._vTbl[__ecereVMethodID_class_OnFree])(_class, *data);
            changed = ((bool (*)(void *, void *, const char *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetDataFromString])(_class, data, editBox.line.text);
         }
         else
         {
            ((void (*)(void *, void *))(void *)_class._vTbl[__ecereVMethodID_class_OnFree])(_class, data);
            changed = ((bool (*)(void *, void *, const char *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetDataFromString])(_class, data, editBox.line.text);
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
      const char * string = "";
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
         ObjectNotationType onType = none;
         const char * result = ((const char *(*)(void *, void *, char *, void *, ObjectNotationType *))(void *)_class._vTbl[__ecereVMethodID_class_OnGetString])(_class, data, tempString, fieldData, &onType);
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

public class MultiLineString : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      // Don't show the editbox right away so that the text is highlighted by default
      EditBox editBox
      {
         dataBox, visible = false,
         borderStyle = 0,
         hasHorzScroll = true, hasVertScroll = true,
         modifyVirtualArea = false,
         autoSize = dataBox.autoSize;
         anchor = { 0, 0, 0, 0 };
         multiLine = true;

         void DataBox::NotifyUpdate(EditBox editBox)
         {
            Modified();
            modifiedDocument = true;
         }

         bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
         {
            opacity = active ? 1.0f : parent.opacity;
            return true;
         }
      };
      editBox.contents = this;
      editBox.visible = true;

      editBox.Create();
      if(!dataBox.active)
         editBox.contents = this;
      return editBox;
   }

   bool OnSaveEdit(Window window, void * object)
   {
      bool changed = false;
      EditBox editBox = (EditBox)window;
      if(editBox.modifiedDocument)
      {
         EditLine line;
         int size = 0;
         char * string;

         delete this;

         for(line = editBox.firstLine; line; line = line.next)
            size += line.count+1;
         this = string = new char[size+1];
         size = 0;
         for(line = editBox.firstLine; line; line = line.next)
         {
            memcpy(string + size, line.text, line.count);
            size += line.count;
            if(line.next)
            {
               string[size] = '\n';
               size++;
            }
         }
         string[size] = '\0';

         changed = true;
      }
      return changed;
   }
};

__on_register_module()
{
   Class baseClass = eSystem_FindClass(module, "class");
   eClass_AddMethod(baseClass, "OnDisplay", null, OnDisplay, publicAccess);
   eClass_AddMethod(baseClass, "OnEdit", null, OnEdit, publicAccess);
   eClass_AddMethod(baseClass, "OnSaveEdit", null, class_OnSaveEdit, publicAccess);
}
