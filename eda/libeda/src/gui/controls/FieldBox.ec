import "TableEditor"

default:
extern int __ecereVMethodID_class_OnFree;
private:

public class FieldBox : DataBox
{
   size = { 100, 22 };
   borderStyle = deep;

   Field field;
   int64 dataHolder; // THERE SEEMS TO BE A BUG WHEN ACCESSING row ACROSS .so
   TableEditor editor;

   property Row row { get { return editor ? editor.editRow : null; } }
   
   public property TableEditor editor
   {
      set
      {
         editor = value;
         if(editor)
            editor.AddFieldBox(this);
      }
   }

   watch(parent)
   {
      if(eClass_IsDerived(parent._class, class(TableEditor)) && editor != (TableEditor)parent)
      {
         editor = (TableEditor)parent;
         editor.AddFieldBox(this);
      }
   };
   watch(master)
   {
      if(eClass_IsDerived(master._class, class(TableEditor)) && editor != (TableEditor)master)
      {
         editor = (TableEditor)master;
         editor.AddFieldBox(this);
      }
   };

   public property Field field
   {
      set
      {
         Class dataType;
         if(field) type = null;

         if(dataHolder)
         {
            type._vTbl[__ecereVMethodID_class_OnFree](type, dataHolder);
            if(type.type == structClass)
            {
               void * dataPtr = (void *)dataHolder;
               delete dataPtr;
            }
            dataHolder = 0;
         }

         field = value;
         dataType = value ? value.type : null;
         text = field ? field.name : null;

         if(dataType && dataType.type == structClass)
         {
            dataHolder = (int64)new0 byte[dataType.structSize];
            data = (void *)dataHolder;
         }
         else if(dataType && (dataType.type == noHeadClass || dataType.type == normalClass))
         {
            if(eClass_IsDerived(dataType, class(String)))
               dataHolder = (int64)CopyString("");
            else
               dataHolder = (int64)eInstance_New(dataType);
            data = (void *)&dataHolder;
         }
         else
         {
            dataHolder = 0;
            data = &dataHolder;
         }
         if(!type) type = dataType;
      }
   }

   void Clear()
   {
      if(visible)
      {
         if(data)
            SetData(null, false);

         if(type && (type.type == noHeadClass || type.type == normalClass))
         {
            if(eClass_IsDerived(type, class(String)))
               dataHolder = (int64)CopyString("");
            else
               dataHolder = (int64)eInstance_New(type);
            data = (void *)&dataHolder;
         }

         if(created)
            Refresh();
      }
   }

   void Load()
   {
      Row row = this.row;
      if(visible && field && row)
      {
         //Id test = row.sysID;
         SetData(null, false);

         ((bool (*)())(void *)Row::GetData)(row, field, field.type, data);

         if(!dataHolder && type && (type.type == noHeadClass || type.type == normalClass))
         {
            if(eClass_IsDerived(type, class(String)))
               dataHolder = (int64)CopyString("");
            else
               dataHolder = (int64)eInstance_New(type);
            data = (void *)&dataHolder;
         }

         // if(created)
         Refresh();
      }
   }

   virtual void Save()
   {
      bool result;
      Row row = this.row;
      if(visible && field && row)
      {
         Class type = field.type;
         if(!DataBox::SaveData())
            Refresh();

         ((bool (*)())(void *)Row::SetData)(row, field, type, 
            (type.type == noHeadClass || type.type == normalClass) ? *(void **)data : data);
      
         modifiedDocument = false;
      }
   }

   void Init()
   {
      if(visible && created)
         Refresh();
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(!active)
      {
         if(modifiedDocument && !DataBox::SaveData())
            Refresh();
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if((SmartKey)key == enter)
      {
         DataBox::OnKeyDown(key, ch);
         return true;
      }
      else
         return DataBox::OnKeyDown(key, ch);
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if((SmartKey)key == enter)
         parent.CycleChildren(true, false, false, true);
      
      return DataBox::OnKeyHit(key, ch);
   }

   bool Window::NotifyChanged(bool closingDropDown)
   {
      // This gets called on the master and is unaware of the change being user input or internally set
      modifiedDocument = true;
      return true;
   }

   bool Window::NotifyModified()
   {
      // This gets called on the master and is unaware of the change being user input or internally set
      modifiedDocument = true;
      return true;
   }

   ~FieldBox()
   {
      if(data)
         SetData(null, false);

      if(dataHolder)
      {
         type._vTbl[__ecereVMethodID_class_OnFree](type, dataHolder);
         if(type.type == structClass)
         {
            void * dataPtr = (void *)dataHolder;
            delete dataPtr;
         }
         dataHolder = 0;
      }
   }
}
