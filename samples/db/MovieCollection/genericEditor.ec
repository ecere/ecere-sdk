import "EDA"

class GenericEditor : Window
{
   text = " ";
   tabCycle = true;
   size = { 800, 600 };

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
         if(!list.fldName)
            list.fldName = value.FindField("Name");
         list.table = value;
         for(f = value.firstField; f; f = f.next)
         {
            if(strcmpi(f.name, "ID"))
            {
               FieldDataBox box { editor = editor, field = f, text = f.name, size = { 200, 20 }, position = { 20, y + 16} };
               Label label { editor.editArea, position = { 20, y }, labeledWindow = box };
               incref box;
               incref label;
               dataBoxes.Add(box);
               labels.Add(label);
               y += 40;
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
