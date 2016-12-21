#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

class CheckListBoxButton : Button
{
   isCheckbox = true, inactive = true, size = { 12, 12 };

   bool CheckListBox::NotifyPushed(Button button, int x, int y, Modifiers mods)
   {
      currentRow = (DataRow)(intptr)button.id;
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
   Map<uintptr, CheckListBoxButton> buttonMaps { };
   AVLTree<DataRow> rowChecks { };
   AVLTree<DataRow> rowDisabled { };
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
            MapIterator<uintptr, Button> it { map = listBox.buttonMaps };
            if(it.Index((uintptr)r, false))
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
         Button checkBox = listBox.buttonMaps[(uintptr)r];
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

   public void DeleteRow(DataRow row)
   {
      MapIterator<uintptr, CheckListBoxButton> it { map = buttonMaps };
      NotifyCollapse(master, this, row, true);

      if(it.Index((uintptr)row, false))
      {
         CheckListBoxButton button = it.data;
         if(button)
         {
            button.Destroy(0);
            it.Remove();
         }
      }
      ListBox::DeleteRow(row);
   }

   void SetupButtons(DataRow row, bool recurse)
   {
      DataRow parent;
      CheckListBoxButton button;
      int indent = checkIndent;

      for(parent = row.parent; parent; parent = parent.parent) indent += 20;
      button = buttonMaps[(uintptr)row];
      if(!button) button = CheckListBoxButton { this };
      button.position = { 2 + indent, 1+(row.index + hasHeader) * rowHeight };
      button.id = (uintptr)row;

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
      if(rowDisabled.Find(row))
         button.disabled = true;
      button.Create();
      buttonMaps[(uintptr)row] = button;
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
      CheckListBoxButton checkBox = buttonMaps[(uintptr)row];
      if(checkBox && !checkBox.disabled)
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
         CheckListBoxButton button = buttonMaps[(uintptr)row];
         if(button)
         {
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
      NotifyChecked(master, this, row);
   }

   void UnsetChildren(DataRow row)
   {
      DataRow r;
      CheckListBoxButton button = buttonMaps[(uintptr)row];
      if(button)
      {
         button.checked = true;
         button.buttonState = up;
      }

      for(r = row.firstRow; r; r = r.next)
      {
         Iterator<DataRow, DataRow> it { rowChecks };

         if(it.Find(r))
            it.Remove();
         UnsetChildren(r);
         NotifyChecked(master, this, r);
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
         // NotifyChecked(master, this, row);
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
               if(r || !rr.parent) break;
               rr = rr.parent;
            }

            rowChecks.Add(rr);

            // Take out all children from rowChecks, checking them all
            UnsetChildren(rr);

            NotifyChecked(master, this, rr);

            for(parent = rr.parent; parent; parent = parent.parent)
            {
               CheckListBoxButton button = buttonMaps[(uintptr)parent];
               if(button)
               {
                  button.checked = true;
                  button.buttonState = down;

                  NotifyChecked(master, this, parent);
               }
            }
         }
         else
         {
            DataRow rr = row;

            parent = rr.parent;
            while(rr)
            {
               Iterator<DataRow, DataRow> it { rowChecks };
               if(it.Find(rr))
               {
                  it.Remove();
                  break;
               }
               else
               {
                  DataRow r;
                  for(r = rr.parent.firstRow; r; r = r.next)
                  {
                     if(r != rr)
                        rowChecks.Add(r);
                  }
                  rr = rr.parent;
               }
            }

            UncheckBoxes(row);

            for(; parent; parent = parent.parent)
            {
               CheckListBoxButton button = buttonMaps[(uintptr)parent];
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

                  NotifyChecked(master, this, parent);
               }
            }
         }
      }
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(currentRow)
      {
         if(key == space)
         {
            ToggleCheck(currentRow);
            return false;
         }
      }
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
      if(IsFullyChecked(row))
         return true;
      else
      {
         CheckListBoxButton button = buttonMaps[(uintptr)row];
         // For partially checked because of children:
         if(button && button.checked)
            return true;
      }
      return false;
   }

   bool IsFullyChecked(DataRow row)
   {
      DataRow parent;
      for(parent = row; parent; parent = parent.parent) if(rowChecks.Find(parent)) return true;
      return false;
   }

   virtual void Window::NotifyChecked(CheckListBox listBox, DataRow row);

   void SetDisabled(DataRow row, bool disabled)
   {
      CheckListBoxButton checkBox = buttonMaps[(uintptr)row];
      if(checkBox)
         checkBox.disabled = disabled;

      if(rowDisabled.Find(row))
      {
         if(!disabled)
            rowDisabled.TakeOut(row);
      }
      else
      {
         if(disabled)
            rowDisabled.Add(row);
      }
   }
};
