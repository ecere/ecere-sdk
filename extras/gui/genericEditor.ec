import "EDA"

class GenericEditor : Window
{
   text = " ";
   tabCycle = true;
   size = { 800, 600 };
   fullRender = true;

   Array<FieldDataBox> dataBoxes { };
   Array<Label> labels { };

   void Clear()
   {
      for(l : labels)
         delete l;
      labels.Free();

      for(d : dataBoxes)
         delete d;
      dataBoxes.Free();
   }

   public property Table table
   {
      set
      {
         Field f;
         int y = 8;

         Clear();

         editor.table = value;
         if(!list.fldName && value)
            list.fldName = value.FindField("Name");
         list.table = value;
         for(f = value ? value.firstField : null; f; f = f.next)
         {
            if(strcmpi(f.name, "ID"))
            {
               int h = 20;
               FieldDataBox box { editor = editor, field = f, text = f.name, size = { h = h }, anchor = { left = 20, top = y + 16, right = 20 } };
               Label label { editor.editArea, position = { 20, y }, labeledWindow = box };
               if(eClass_IsDerived(f.type, class(DataList)) || eClass_IsDerived(f.type, class(IdList)) || eClass_IsDerived(f.type, class(MultiLineString)))
               {
                  h = 70;
                  box.size.h = h;
               }
               incref box;
               incref label;
               dataBoxes.Add(box);
               labels.Add(label);
               y += 20 + h;
            }
         }
      }
   }

   ~GenericEditor()
   {
      Clear();
   }

   ListSection list
   {
      this, editor = editor,
      anchor = { left = 0, top = 0, bottom = 0, right = 0.5 }
   };
   EditSection editor
   {
      this,
      anchor = { left = 0.5, top = 0, bottom = 0, right = 0 }
   };
}
