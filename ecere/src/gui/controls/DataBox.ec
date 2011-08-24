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

   virtual void SetData(any_object newData, bool closingDropDown)
   {
      //type._vTbl[__ecereVMethodID_class_OnCopy](type, data, newData);

      if(type)
      {
         if(type.type == normalClass || type.type == noHeadClass)
         {
            if(((void **)data)[0])
               type._vTbl[__ecereVMethodID_class_OnFree](type, ((void **)data)[0]);
            ((void **)data)[0] = newData;
         }
         else
         {
            // Free old data first
            type._vTbl[__ecereVMethodID_class_OnFree](type, data);
            type._vTbl[__ecereVMethodID_class_OnCopy](type, data, newData);
         }
      }
      if(created)
         NotifyChanged(master, closingDropDown);
      //editor.Activate();
   }

   bool SaveData()      // TODO: Clear this up, along with Saving DataBox
   {
      if(editor && type._vTbl[__ecereVMethodID_class_OnSaveEdit](type, data, editor, null))
      {
         Refresh();
         NotifyChanged(master, false);
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
   virtual bool Window::NotifyChanged(bool closingDropDown);
   virtual void OnConfigure(Window editor);

private:

   bool OnPostCreate()
   {
      if(type && !readOnly && (type.type == normalClass || type.type == noHeadClass || data))
      {
         // IMPORTANT FIX: If keepEditor is true, we were passing editor rather than the editor's current master
         editor = (Window)type._vTbl[__ecereVMethodID_class_OnEdit](type, 
            (type.type == normalClass || type.type == noHeadClass) ? (data ? (*(void **)data) : null) : data, 
            this, (keepEditor && editor) ? editor.master : this, 0, 0, clientSize.w, clientSize.h, fieldData);// null);
         if(editor)
         {
            // editor.anchor = { 0, 0, 0, 0 };
            editor.background = background;
            editor.foreground = foreground;
            editor.opacity = opacity;
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
      if(type)
      {
         //type._vTbl[__ecereVMethodID_class_OnDisplay](type, this.data, surface, 3, 2, clientSize.w, null, type.defaultAlignment, 0);
         if(type.type == noHeadClass || type.type == normalClass)
            type._vTbl[__ecereVMethodID_class_OnDisplay](type, *(void **)this.data, surface, 3, 1, clientSize.w, fieldData, type.defaultAlignment, 0);
         else
            type._vTbl[__ecereVMethodID_class_OnDisplay](type, this.data, surface, 3, 1, clientSize.w, fieldData, type.defaultAlignment, 0);
      }
   }

   void OnDestroy()
   {
      editor = null;
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
         return true;
      }
      return DataBox::OnKeyDown(key, ch);
   }
}
