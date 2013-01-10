import "ecere"

class CheckListBoxButton : Button
{
   isCheckbox = true, inactive = true, size = { 12, 12 };

   bool CheckListBox::NotifyPushed(Button button, int x, int y, Modifiers mods)
   {
      currentRow = (DataRow)button.id;
      ToggleCheck(currentRow);
      return false;
   }

   bool CheckListBox::NotifyReleased(Button button, int x, int y, Modifiers mods)
   {
      return false;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {

      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {

      return true;
   }
}

class CheckListBox : ListBox
{
   Map<int, CheckListBoxButton> buttonMaps { };
   AVLTree<DataRow> rowChecks { };
   int checkIndent;

   checkIndent = 20;

   fullRowSelect = false, collapseControl = true, treeBranches = true, rootCollapseButton = true, 
   noDragging = true;
   // rowHeight = 18;

   void OnDestroy()
   {
      buttonMaps.RemoveAll();
   }
   
   bool NotifyCollapse(CheckListBox listBox, DataRow row, bool collapsed)
   {
      DataRow r;
      for(r = row.firstRow; r && r != row; )
      {
         if(collapsed)
         {
            MapIterator<int, Button> it { map = listBox.buttonMaps };
            if(it.Index((int)r, false))
            {
               Button checkBox = it.data;
               if(checkBox)
               {
                  checkBox.Destroy(0);
                  it.Remove();
               }
            }
         }
         else
         {
            listBox.SetupButtons(r, false);
         }
         if(r.firstRow && !r.collapsed) 
            r = r.firstRow;
         else 
            for(; r != row; r = r.parent)
               if(r.next) { r = r.next; break; }
      }
      for(r = row.GetNextRow(); r; r = r.GetNextRow())
      {
         Button checkBox = listBox.buttonMaps[(int)r];
         if(checkBox)
            checkBox.position.y = 1 + (r.index + listBox.hasHeader) * listBox.rowHeight;
      }
      return true;
   }

   bool CheckPartialChecks(DataRow row)
   {
      DataRow r;
      for(r = row.firstRow; r; r = r.next)
      {
         if(rowChecks.Find(r) || CheckPartialChecks(r))
            return true;
      }
      return false;
   }
   
   void SetupButtons(DataRow row, bool recurse)
   {
      DataRow parent;
      CheckListBoxButton button;
      int indent = checkIndent;

      for(parent = row.parent; parent; parent = parent.parent) indent += 20;
      button = buttonMaps[(int)row];
      if(!button) button = CheckListBoxButton { this };
      button.position = { 2 + indent, 1+(row.index + hasHeader) * rowHeight };
      button.id = (int)row;

      for(parent = row; parent; parent = parent.parent) if(rowChecks.Find(parent)) break;
      if(parent)
      {
         button.checked = true;
         button.buttonState = up;
      }
      else
      {
         button.checked = CheckPartialChecks(row);
         button.buttonState = button.checked ? down : up;
      }
      button.Create();
      buttonMaps[(int)row] = button;
      if(recurse && !row.collapsed)
      {
         DataRow r;
         for(r = row.firstRow; r; r = r.next)
            SetupButtons(r, recurse);
      }
   }

   void UpdateButtons()
   {
      DataRow row;
      for(row = firstRow; row; row = row.next)
         SetupButtons(row, true);
   }

   bool OnCreate()
   {
      if(ListBox::OnCreate())
      {
         DataRow row;
         
         buttonMaps.RemoveAll();

         for(row = firstRow; row; row = row.next)
            SetupButtons(row, true);
         return true;
      }
      return false;
   }

   void ToggleCheck(DataRow row)
   {
      CheckListBoxButton checkBox = buttonMaps[(int)row];
      if(checkBox)
      {
         bool checked = false;
         DataRow r;
         for(r = row; r; r = r.parent)
            if(rowChecks.Find(r))
            { 
               checked = true;
               break;
            }         
         SetCheck(row, !checked);
      }
   }

   void UncheckBoxes(DataRow row)
   {
      if(!row.parent || !row.parent.collapsed)
      {
         CheckListBoxButton button = buttonMaps[(int)row];
         if(button)
         {
            bool wasChecked = button.checked;
            button.checked = false;
            button.buttonState = up;
         }
      }
      // if(!row.collapsed)
      {
         DataRow r;
         for(r = row.firstRow; r; r = r.next)
            UncheckBoxes(r);
      }
      NotifyChanged(master, this, row);
   }
   
   void UnsetChildren(DataRow row)
   {
      DataRow r;
      CheckListBoxButton button = buttonMaps[(int)row];
      if(button)
      {
         bool wasChecked = button.checked;
         button.checked = true;
         button.buttonState = up;
      }

      for(r = row.firstRow; r; r = r.next)
      {
         Iterator<DataRow> it { rowChecks };

         if(it.Find(r))
            it.Remove();
         UnsetChildren(r);
         NotifyChanged(master, this, r);
      }      
   }
   
   void SetCheck(DataRow row, bool checked)
   {
      DataRow parent;
      bool wasChecked = false;

      for(parent = row; parent; parent = parent.parent)
      {
         if(rowChecks.Find(parent)) { wasChecked = true; break; }
      }
      if(checked != wasChecked)
      {
         modifiedDocument = true;
         // NotifyChanged(master, this, row);
         if(checked)
         {
            DataRow rr = row;
            // Check if all siblings are checked, if so go up until we reach a row not fully checked
            while(rr)
            {
               DataRow r;
               for(r = rr.parent.firstRow; r; r = r.next)
               {
                  if(r != rr && !rowChecks.Find(r))
                     break;
               }
               if(r || !row.parent) break;
               rr = rr.parent;
            }

            rowChecks.Add(row);

            // Take out all children from rowChecks, checking them all
            UnsetChildren(row);

            for(parent = row.parent; parent; parent = parent.parent)
            {
               CheckListBoxButton button = buttonMaps[(int)parent];
               if(button)
               {
                  // Partial Check
                  button.checked = true;
                  button.buttonState = down;

                  NotifyChanged(master, this, parent);
               }
            }
         }
         else
         {
            DataRow rr = row;

            while(rr)
            {
               Iterator<DataRow> it { rowChecks };
               if(it.Find(rr))
               {
                  it.Remove();
                  break;
               }
               else
               {
                  DataRow r;
                  for(r = row.parent.firstRow; r; r = r.next)
                  {
                     if(r != rr)
                        rowChecks.Add(r);
                  }
                  rr = rr.parent;
               }
            }
            UncheckBoxes(row);

            for(parent = row.parent; parent; parent = parent.parent)
            {
               CheckListBoxButton button = buttonMaps[(int)parent];
               if(button)
               {
                  if(CheckPartialChecks(parent))
                  {
                     button.checked = true;
                     button.buttonState = down;
                  }
                  else
                  {
                     button.checked = false;
                     button.buttonState = up;
                  }

                  NotifyChanged(master, this, parent);
               }
            }
         }

         NotifyChanged(master, this, row);
      }
   }
   
   bool NotifyKeyDown(CheckListBox listBox, DataRow row, Key key, unichar ch)
   {
      if(key == space)
      {
         listBox.ToggleCheck(row);
         return false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == space)
         return false;
      return ListBox::OnKeyHit(key, ch);
   }

   bool NotifyDoubleClick(CheckListBox listBox, int x, int y, Modifiers mods)
   {
      listBox.OnLeftButtonDown(x, y, mods);
      return false;
   }

   bool NotifyReclick(CheckListBox listBox, DataRow row, Modifiers mods)
   {
      if(row == listBox.currentRow)
         listBox.ToggleCheck(row);
      return true;
   }

public:
   bool IsChecked(DataRow row)
   {
      CheckListBoxButton button = buttonMaps[(int)row];
      DataRow parent;
      for(parent = row; parent; parent = parent.parent) if(rowChecks.Find(parent)) return true;
      // For partially checked because of children:
      if(button && button.checked)
         return true;
      return false;
   }

   // virtual void Window::NotifyChecked(CheckListBox listBox, DataRow row);
};
