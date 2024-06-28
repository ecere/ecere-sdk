namespace gui::controls;

import "Window"

default:
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnGetDataFromString;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnUnserialize;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnEdit;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnSaveEdit;
private:

public class DataBox : CommonControl
{
public:
   Class type;
   void * data;
   void * fieldData;
   Window editor;
   bool readOnly;
   bool keepEditor;
   bool autoSize;
   bool needUpdate;
   String stringValue;
   needUpdate = true;

   ~DataBox()
   {
      delete stringValue;
   }

   virtual void SetData(any_object newData, bool closingDropDown)
   {
      //((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCopy])(type, data, newData);
      needUpdate = true;
      if(type)
      {
         if(type.type == normalClass || type.type == noHeadClass)
         {
            if(((void **)data)[0])
               ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, ((void **)data)[0]);
            ((void **)data)[0] = newData;
         }
         else
         {
            // Free old data first
            ((void (*)(void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnFree])(type, data);
            ((void (*)(void *, void *, void *))(void *)type._vTbl[__ecereVMethodID_class_OnCopy])(type, data, newData);
         }
      }
      if(created)
         NotifyChanged(master, this, closingDropDown);
      //editor.Activate();
   }

   bool SaveData()      // TODO: Clear this up, along with Saving DataBox
   {
      bool (* onSaveEdit)(void *, void *, Window, void *) = (void *)type._vTbl[__ecereVMethodID_class_OnSaveEdit];
      if(editor && (!onSaveEdit || onSaveEdit(type, data, editor, null)))
      {
         Refresh();
         NotifyChanged(master, this, false);
         // Refresh();
         return true;
      }
      return false;
   }

   void Modified()
   {
      NotifyModified(master);
   }

   void Refresh()
   {
      needUpdate = true;
      if(created)
      {
         if(!keepEditor)
         {
            editor.Destroy(0);
            editor = null;
         }
         OnPostCreate();
      }
   }

   virtual bool Window::NotifyModified();
   virtual bool Window::NotifyChanged(DataBox dataBox, bool closingDropDown);
   virtual void OnConfigure(Window editor);

private:
   bool inAutoSize;

   watch(background)     { if(editor) editor.background = background; };
   watch(foreground)     { if(editor) editor.foreground = foreground; };
   //watch(selectionColor) { if(editor) editor.selectionColor = selectionColor; };
   //watch(selectionText)  { if(editor) editor.selectionText = selectionText; };
   watch(opacity)        { if(editor) editor.opacity = opacity; };

   bool OnPostCreate()
   {
      // Right now for read-only DataBoxes the only reason we'd want to create an editor is for autoSize purposes, when using the default EditBox editor that supports it.
      // ( A tweak for enum classes is in typeEdit.ec, as the base class editor invokes it )
      if(type/* && (!readOnly || (autoSize && type._vTbl[__ecereVMethodID_class_OnEdit] == class(Instance)._vTbl[__ecereVMethodID_class_OnEdit]))*/ &&
         (type.type == normalClass || type.type == noHeadClass || data))
      {
         Window prevEditor = editor;
         editor = ((Window (*)(void *, void *, DataBox, void *, int, int, int, int, void*))(void *)type._vTbl[__ecereVMethodID_class_OnEdit])(type,
            (type.type == normalClass || type.type == noHeadClass) ? (data ? (*(void **)data) : null) : data,
            this, null, 0, 0, clientSize.w, clientSize.h, fieldData);
         if(prevEditor && editor != prevEditor)
            prevEditor.Destroy(0);
         if(editor && readOnly && !eClass_IsDerived(editor._class, class(EditBox)) &&
               !(autoSize && type._vTbl[__ecereVMethodID_class_OnEdit] == class(Instance)._vTbl[__ecereVMethodID_class_OnEdit]))
         {
            editor.Destroy(0);
            editor = null;
            return true;
         }
         if(editor)
         {
            // editor.anchor = { 0, 0, 0, 0 };
            editor.background = background;
            editor.foreground = foreground;
            editor.opacity = opacity;
            if(eClass_IsDerived(editor._class, class(EditBox)))
            {
               ((EditBox)editor).readOnly = readOnly;
               if(autoSize)
                  ((EditBox)editor).autoSize = autoSize;
               ((EditBox)editor).clickThrough = true;
            }
            else if(eClass_IsDerived(editor._class, class(Button)) && autoSize)
               size = editor.size;
         }
         else
         {
            // TODO: Should returning 0 from OnPostCreate cancel creation?
            Destroy(0);
            return false;
         }
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      if(type && data && (!editor || !editor.created || editor.anchor.left)) // ColorDropBox lets part of the DataBox show
      {
         char tempString[1024];
         if(type._vTbl[__ecereVMethodID_class_OnDisplay] == class(Instance)._vTbl[__ecereVMethodID_class_OnDisplay])
         {
            if(needUpdate)
            {
               const String s;
               if(type.type == noHeadClass || type.type == normalClass)
                  s = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, *(void **)this.data, tempString, fieldData, null);
               else
                  s = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)type._vTbl[__ecereVMethodID_class_OnGetString])(type, this.data, tempString, fieldData, null);
               delete stringValue;
               stringValue = CopyString(s);
               needUpdate = false;
            }
            ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)class(String)._vTbl[__ecereVMethodID_class_OnDisplay])(class(String), stringValue, surface, 3, 1, clientSize.w, fieldData, type.defaultAlignment, 0);
         }
         else
         {
            if(type.type == noHeadClass || type.type == normalClass)
               ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)type._vTbl[__ecereVMethodID_class_OnDisplay])(type, *(void **)this.data, surface, 3, 1, clientSize.w, fieldData, type.defaultAlignment, 0);
            else
               ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)type._vTbl[__ecereVMethodID_class_OnDisplay])(type, this.data, surface, 3, 1, clientSize.w, fieldData, type.defaultAlignment, 0);
         }
      }
   }

   void OnDestroy()
   {
      editor = null;
      CommonControl::OnDestroy();
   }

   void OnPosition(int x, int y, int width, int height)
   {
      if(editor)
         editor.OnPosition(editor.position.x, editor.position.y, editor.size.w, editor.size.h);
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      return editor ? editor.OnKeyHit(key, ch) : true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if((SmartKey)key == enter)
      {
         SaveData();
         return false;
      }
      else if((SmartKey)key == escape)
      {
         Refresh();
         return true;
      }
      return editor ? editor.OnKeyDown(key, ch) : true;
   }

   void OnChildResized(Window child, int x, int y, int w, int h)
   {
      if(!inAutoSize && autoSize == true)
      {
         inAutoSize = true;
         clientSize = { w, h };
         inAutoSize = false;
      }
   }
};

public class SavingDataBox : DataBox
{
   class_property(icon) = "<:ecere>controls/dataBox.png";
   borderStyle = deep;
   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(!active && editor && !editor.modalSlave)
      {
         if(!SaveData())
            Refresh();
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if((SmartKey)key == enter)
      {
         if(!SaveData())
            // Force Refresh on Enter if SaveData didn't do it
            Refresh();
         return false; //true; // REVIEW: No way to prevent other keyboard action?
      }
      return DataBox::OnKeyDown(key, ch);
   }

   bool OnResizing(int * w, int * h)
   {
      if(!*w || !*h)
      {
         int spaceH;
         display.FontExtent(fontObject, " ", 1, null, &spaceH);
         if(!*h)
            *h = spaceH + 2;
         if(!*w)
            *w = spaceH * 80 / 14;
      }
      return true;
   }
}
