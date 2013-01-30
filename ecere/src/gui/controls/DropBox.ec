namespace gui::controls;

import "Window"

#include <stdarg.h>

//#define BTN_WIDTH       20
#define BTN_WIDTH       16
#define ROW_HEIGHT      listBox.rowHeight /*16*/

default:
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnGetString;

private:

class DropBoxBits { bool noHighlight:1, noStipple:1, editText:1, activeColor:1, showNone:1, changeContents:1; };

public class DropBox : CommonControl
{
   tabCycle = true;
   borderStyle = deep;
   style.activeColor = true;

   class_property(icon) = "<:ecere>controls/dropBox.png";

   watch(foreground)
   {
      listBox.foreground = foreground;
   };
   watch(background)
   {
      listBox.background = background;
   };

public:
   property bool activeStipple
   {
      property_category $"Appearance" 
      set
      {
         style.noStipple = !value;
         Update(null);
      }
      get { return !style.noStipple; }
   };
   property bool showButton
   {
      property_category $"Appearance" 
      set
      {
         button.visible = value;
         listBox.borderStyle = value ? contour : none;
      }
      get { return button.visible; }
   };
   property Alignment alignment
   {
      property_category $"Appearance" 
      set
      {
         alignment = value;
         if(field)
            field.alignment = value;
      }
      get { return alignment; }
   };
   property bool noHighlight
   {
      property_category $"Appearance" 
      set
      {
         if(this)
         {
            style.noHighlight = value;
            listBox.fullRowSelect = !value;
            Update(null);
         }
      }
      get { return style.noHighlight; }
   };
   property bool activeColor
   {
      property_category $"Appearance" 
      set
      {
         if(this)
         {
            style.activeColor = value;
            Update(null);
         }
      }
      get { return style.activeColor; }
   };
   property DataRow currentRow
   {
      property_category $"Private" 
      set
      {
         if(this)
         {
            currentRow = value;
            listBox.currentRow = value ? value : (style.showNone ? noneRow : null);
            if(style.editText && style.changeContents)
            {
               char tempString[4096];
               if(currentRow)
                  editBox.contents = (char *)dataType._vTbl[__ecereVMethodID_class_OnGetString](dataType, currentRow.GetData(null), tempString, null, null);
               else
                  editBox.contents = "";
            }                  
            Update(null);
            if(style.editText)
            {
               if(editBox.modifiedDocument)
               {
                  NotifyTextEntry(master, this, editBox.contents, false);
                  editBox.modifiedDocument = false;
               }
               // editBox.Deactivate();
            }
         }
      }
      get { return currentRow; }
   };
   property DataRow firstRow { get { return this ? listBox.firstRow : null; } };
   property char * contents { property_category $"Data" set { if(editBox) editBox.contents = value; } get { return editBox ? editBox.contents : null; } };
   property bool editText
   {
      property_category $"Behavior" 
      set
      {
         if(this)
         {
            if(value)
            {
               if(!editBox)
               {
                  editBox = EditBox
                  {
                     this, textHorzScroll = true, borderStyle = 0;
                     anchor = Anchor { left = 0, top = 0, right = BTN_WIDTH, bottom = 0 };
                     // visible = false, modifyVirtualArea = false;
                  };
                  incref editBox;
                  editBox.Create();
                  button.inactive = false;
               }      
               style.editText = true;
               tabCycle = false;
            }
            else
            {
               if(editBox)
               {
                  editBox.Destroy(0);
                  delete editBox;
                  button.inactive = true;
               }
               style.editText = false;
            }
         }
      }
      get { return style.editText; }
   };
   property EditBox editBox { get { return editBox; } }
   property Seconds typingTimeout { property_category $"Behavior" set { listBox.typingTimeout = value; } get { return listBox.typingTimeout; } };
   property int rowHeight { property_category $"Appearance" set { listBox.rowHeight = value; } get { return listBox.rowHeight; } };
   property int maxShown
   {
      property_category $"Behavior" 
      set
      {
         listBoxMaxShown = value;
         OnPosition(position.x, position.y, clientSize.w, clientSize.h);
      }
      get { return listBoxMaxShown; }
   };
   property Window pullDown
   {
      get { return pulledWindow; }
   }
   property bool showNone
   {
      set
      {
         if(value != style.showNone)
         {
            if(style.showNone)
            {
               listBox.DeleteRow(noneRow);
               noneRow = null;
            }
            style.showNone = value;
            if(value)
            {
               noneRow = listBox.AddRowNone();
            }
         }
      }
      get { return style.showNone; }
   }
   property Color selectionColor { set { selectionColor = value; } get { return selectionColor; } isset { return selectionColor ? true : false; } };
   property bool changeContents
   {
      set { style.changeContents = value; }
      get { return style.changeContents; }
   }

   property ListBox listBox { get { return listBox; } }

   // Notifications
   virtual bool Window::NotifySelect(DropBox dropBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifyClose(DropBox dropBox);
   virtual bool Window::NotifyHighlight(DropBox dropBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifyTextEntry(DropBox dropBox, char * string, bool confirmed);

   virtual Window OnDropDown()
   {
      // NASTY BUG ON WINDOWS IN PROPERTIES SHEET IF WE DON'T RECREATE THE LISTBOX HERE
      // To reproduce, comment out, select borderStyle property, alt-tab to another program, come back, drop down
      // The listBox goes annoyingly to 0, 0
      listBox.Destroy(0);
      listBox.Create();

      ResizeListbox();
      // listBox.visible = true;
      return listBox;   
   }

   virtual void OnCloseDropDown(Window pullDown)
   {
      listBox.visible = false;
      if(style.editText)
      {
         editBox.ActivateEx(true, false, false, false, null, null);
         editBox.SelectAll();
      }
   }

   // Methods
   DataRow AddStringf(char * format, ...)
   {
      if(this)
      {
         DataRow row;

         char string[MAX_F_STRING];
         va_list args;
         string[sizeof(string)-1] = 0;

         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         va_end(args);

         row = AddRow();
         row.SetData(null, string);
         return row;
      }
      return null;
   }

   DataRow AddString(char * string)
   {
      if(this)
      {
         DataRow row;
         row = AddRow();
         row.SetData(null, string);
         return row;
      }
      return null;
   }

   void DeleteRow(DataRow row)
   {
      if(!row) row = currentRow;
      listBox.DeleteRow(row);
      /*
      if(row == currentRow)
         currentRow = null;*/
      Update(null);
   }

   // Convenience function using current rows
   int GetTag()
   {
      return currentRow.tag;
   }

   void * SetData(DataField field, any_object data)
   {
      if(this)
      {
         if(currentRow)
            return currentRow.SetData(field, data);
      }
      return null;
   }

   any_object GetData(DataField field)
   {
      if(this)
      {
         // TODO: Fix this shouldn't be required (memguard?)
         return (void *)currentRow.GetData(field);
      }
      return null;
   }

   void Sort(DataField field, int order)
   {
      listBox.Sort(field, order);
   }

   void AddField(DataField field)
   {
      if(this)
      {
         if(!field)
            field = DataField { alignment = alignment };
         
         listBox.AddField(field);
         this.field = listBox.firstField;
         dataType = this.field.dataType;
      }
   }

   DataRow AddRow()
   {
      DataRow row = null;
      if(this)
      {
         row = listBox.AddRow();
         OnPosition(position.x, position.y, clientSize.w, clientSize.h);
      }
      return row;
   }

   DataRow AddRowAfter(DataRow after)
   {
      DataRow row = null;
      if(this)
      {
         row = listBox.AddRowAfter(after);
         OnPosition(position.x, position.y, clientSize.w, clientSize.h);
      }
      return row;
   }

   int GetRowCount()
   {
      return listBox.rowCount;
   }

   void Clear()
   {
      if(this)
      {
         Window master = this.master;
         listBox.Clear();

         if(currentRow && master)
         {
            currentRow = null;
            NotifySelect(master, this, null, 0);
         }
         currentRow = null;
         if(style.editText && style.changeContents)
            editBox.contents = "";
         Update(null);
         if(style.showNone)
            noneRow = listBox.AddRowNone();
      }
   }

   DataRow FindRow(int tag)
   {
      if(this)
      {
         return listBox.FindRow(tag);
      }
      return null;
   }

   DataRow FindSubRow(int tag)
   {
      if(this)
      {
         return listBox.FindSubRow(tag);
      }
      return null;
   }

   // Drop Box Specific
   void SelectRow(DataRow row)
   {
      if(this)
      {
         currentRow = row;
         if(style.editText && style.changeContents)
         {
            char tempString[4096];
            if(currentRow)
               editBox.contents = (char *)dataType._vTbl[__ecereVMethodID_class_OnGetString](dataType, currentRow.GetData(null), tempString, null, null);
            else
               editBox.contents = "";
         }                  
         listBox.SelectRow(currentRow ? currentRow : (style.showNone ? noneRow : null));

         Update(null);
      }
   }

   bool Save()
   {
      if(editBox && editBox.modifiedDocument)
      {
         NotifyTextEntry(master, this, editBox.contents, true);
         if(editBox)
            editBox.modifiedDocument = false;
         return true;
      }
      return false;
   }

private:
   DropBox()
   {
      listBoxMaxShown = 1000;
      field = listBox.firstField;
      dataType = field.dataType;
      style.changeContents = true;
      return true;
   }

   ~DropBox()
   {
      delete editBox;
   }

   void ResizeListbox()
   {
      int rowCount = Min(listBox.rowCount, listBoxMaxShown);
      int height = rowCount * ROW_HEIGHT;
      listBox.clientSize = { clientSize.w, height };
   }

   void OnPosition(int x, int y, int width, int height)
   {
      if(pulledWindow)
      {
         int lx = absPosition.x - guiApp.desktop.absPosition.x;
         int ly = absPosition.y - guiApp.desktop.absPosition.y;
         int availHeight = pulledWindow.parent.clientSize.h;
         int height = pulledWindow.clientSize.h;

         // If it won't fit below but fits above, place it above...
         if(ly + size.h + height > availHeight && height < ly)
            ly -= height;
         else
         {
            ly += size.h;
            if(ly + height > availHeight)
               height = ((availHeight - ly) / ROW_HEIGHT) * ROW_HEIGHT;
         }
            
         if(!pulledWindow.initSize.w)
            pulledWindow.size.w = size.w;
         else
            // Align it to the right (pull down button)
            lx -= pulledWindow.size.w - size.w;
         pulledWindow.position = { lx, ly };
         pulledWindow.clientSize = { pulledWindow.clientSize.w, height };
      }
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case hotKey:
         case space:
         case right:
         case escape:
            // ADDED THIS CHECK HERE TO NAVIGATE THROUGH GRID LISTBOX
            if(key == right)
            {
               if(eClass_IsDerived(master._class, class(DataBox)))
               {
                  if(eClass_IsDerived(master.master._class, class(ListBox)))
                     return true;
               }
               else if(eClass_IsDerived(master._class, class(ListBox)))
                  return true;
            }
            if(key == escape && !pulledWindow)
            {
               //if(editBox) button.Deactivate();
               //if(editBox) button.Activate();
               if(style.editText)
               {
                  if(editBox.modifiedDocument)
                  {
                     NotifyTextEntry(master, this, editBox.contents, false);
                     editBox.modifiedDocument = false;
                  }
                  //editBox.Deactivate();
               }
               break;
            }
            if(style.editText && (key == space || key == right))
               break;

            if(pulledWindow)
            {
               OnCloseDropDown(pulledWindow);
               pulledWindow = null;
               button.checked = false;
               NotifyClose(master, this);

               if(style.editText)
               {
                  if(editBox.modifiedDocument)
                  {
                     NotifyTextEntry(master, this, editBox.contents, false);
                     editBox.modifiedDocument = false;
                  }
                  editBox.Activate();
               }
            }
            else
            {
               listBox.currentRow = currentRow ? currentRow : (style.showNone ? noneRow : null);
               pulledWindow = OnDropDown();
               OnPosition(position.x, position.y, clientSize.w, clientSize.h);
               if(pulledWindow) pulledWindow.visible = true;
               button.checked = true;
            }         
            Update(null);         
            return false;
         case enter:
         case keyPadEnter:
            if(!pulledWindow)
            {
               if(style.editText)
               {
                  if(editBox.modifiedDocument)
                  {
                     NotifyTextEntry(master, this, editBox.contents, true);
                     editBox.modifiedDocument = false;
                     //editBox.Deactivate();
                  }

                  // Add code to look through listbox and set current row if listbox is used
               }
               break;
            }
            else
            {
               incref this;

               OnCloseDropDown(pulledWindow);
               pulledWindow = null;
               button.checked = false;
               Update(null);
               
               if(!NotifyClose(master, this))
               {
                  delete this;
                  return false;
               }

               // Moved this from below NotifySelect
               currentRow = listBox.currentRow;
               if(currentRow && currentRow.noneRow) currentRow = null;
               if(style.editText && style.changeContents)
               {
                  char tempString[4096];
                  if(currentRow)
                     editBox.contents = (char *)dataType._vTbl[__ecereVMethodID_class_OnGetString](dataType, currentRow.GetData(null), tempString, null, null);
                  else
                     editBox.contents = "";
               }                  

               NotifySelect(master, this, currentRow, key.modifiers | { closingDropDown = true });
               
               delete this;               
               return false;
            }
            return false;
         //default:
         //   return listBox.OnKeyDown(key, ch);
      }
      return true;
   }

   void OnApplyGraphics()
   {
      button.anchor = { right = 0, top = 0, bottom = 0 };
      button.size = { guiApp.textMode ? 8 : BTN_WIDTH, 0 };
   }
   
   /*Timer timer
   {
      window = this, delay = 0.01;

      bool DelayExpired()
      {
         background = active ? red : lime;
         parent.parent.background = parent.parent.active ? red : lime;
         guiApp.desktop.Update(null);
         return true;
      }
   };*/

   void OnRedraw(Surface surface)
   {
      //timer.started = true;
      if(!style.editText)
      {
         if(active && !pulledWindow/*listBox.visible*/)
         {
            if(style.activeColor)
            {
               surface.SetBackground(selectionColor ? selectionColor : SELECTION_COLOR);
               if(!style.noHighlight || !currentRow)
               {
                  surface.Area(0,0, clientSize.w-1,clientSize.h-1);
               }
            }
         }
         if(!isEnabled)
            surface.SetForeground(Color { 85,85,85 } );
         else
            surface.SetForeground((active && style.activeColor && !pulledWindow /*listBox.visible*/) ? SELECTION_TEXT : foreground);
         surface.TextOpacity(true);

         if(currentRow)
         {
            DataDisplayFlags displayFlags { active = active, current = true, dropBox = true, selected = true, fullRow = true };
            dataType._vTbl[__ecereVMethodID_class_OnDisplay](dataType, currentRow.GetData(null), surface, 3, 
               1+(clientSize.h - listBox.rowHeight) / 2, clientSize.w - (button.visible ? button.size.w : 0) - 3, 
               field.userData, alignment, displayFlags);
         }
         else
            surface.WriteText(2,2, "(none)", 6);

         if(!style.noStipple && (!style.noHighlight || !currentRow))
         {
            surface.SetForeground(0xFFFFFF80);
            if(active && !pulledWindow /*listBox.visible*/)
            {
               surface.Rectangle(0,0,clientSize.w-1-BTN_WIDTH,clientSize.h-1);
               surface.SetForeground(black);
               surface.LineStipple(0xAAAA);
               surface.Rectangle(0,0,clientSize.w-1-BTN_WIDTH,clientSize.h-1);
               surface.LineStipple(0);
            }
         }
      }
   }

   bool OnResizing(int *width, int *height)
   {
      int rowHeight = 0;

      display.FontExtent(fontObject, "W", 1, null, &rowHeight); 
      rowHeight = Max(rowHeight, 16);

      if(!*width) *width = Max(*width, rowHeight * 100 / 16);

      //if(!*width) *width = Max(*width, 100);
      //if(!*height) *height = Max(*height, 20);
      if(!*height) *height = Max(*height, rowHeight * 20 / 16);

      return true;
   }

   /*
   watch(font)
   {
      SetInitSize(initSize);
   };
   */

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Update(null);
      if(pulledWindow)
      {
         OnCloseDropDown(pulledWindow);
         button.checked = false;
         pulledWindow = null;
      
         if(!NotifyClose(master, this))
            return false;
      }
      else
      {
         listBox.currentRow = currentRow ? currentRow : (style.showNone ? noneRow : null);
         pulledWindow = OnDropDown();
         OnPosition(position.x, position.y, clientSize.w, clientSize.h);
         if(pulledWindow) pulledWindow.visible = true;
         if(listBox.freeSelect)
            pulledWindow.OnLeftButtonDown(-2,-2, 0);
         button.checked = true;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      DataRow currentRow = this.currentRow;
      
      if(!pulledWindow /*listBox.visible*/)
      {
         int c;
         if(style.showNone && !currentRow) currentRow = noneRow;

         switch(key)
         {
            case wheelDown:
            case down: currentRow = currentRow ? currentRow.next : null; break;
            case wheelUp:
            case up:   currentRow = currentRow ? currentRow.prev : null; break;
            case pageDown:
               for(c = 0; c<listBoxMaxShown && currentRow && currentRow.next; c++, currentRow = currentRow.next);
               break;
            case pageUp:
               for(c = 0; c<listBoxMaxShown && currentRow && currentRow.prev; c++, currentRow = currentRow.prev);
               break;
            case end:
               for(; currentRow && currentRow.next; currentRow = currentRow.next);
               break;
            case home:
               for(; currentRow && currentRow.prev; currentRow = currentRow.prev);
               break;
            default:
               if(!editBox || button.active || !editBox.active || editBox.OnKeyHit(key, ch))
               {
                  return listBox.OnKeyHit(key, ch);
               }
               else
                  return false;
         }
         if(currentRow)
         {
            if(currentRow.noneRow) currentRow = null;
            property::currentRow = currentRow;
            //return
               NotifySelect(master, this, currentRow, key.modifiers);
            //return false;
         }
         return false;
      }
      else
      {
         if(listBox.vertScroll)
         {
            if(key == wheelUp)
               listBox.vertScroll.Action(up, 0, key);
            else if(key == wheelDown)
               listBox.vertScroll.Action(down, 0, key);
         }
         return listBox.OnKeyHit(key, ch);
      }
      return true;
   }

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      // WAS !active JUST MISSING HERE ?
      if(!active && style.editText)
      {
         if(editBox.modifiedDocument)
         {
            if(editBox) editBox.modifiedDocument = false;
            NotifyTextEntry(master, this, editBox.contents, true); //false);
            // MOVED THIS ABOVE TO AVOID INFINITE RECURSION
            // if(editBox) editBox.modifiedDocument = false;
         }
         //editBox.Deactivate();
      }
      Update(null);
      return true;
   }

   public Button button
   {
      this, toggle = true, bevel = true, inactive = true,
      anchor = Anchor { right = 0, top = 0, bottom = 0 },
      size = Size { BTN_WIDTH, 0 },
      symbol = 25;
      bitmap = { "<:ecere>elements/arrowDown.png" };

      bool NotifyPushed(Button control, int x, int y, Modifiers mods)
      {
         if(pulledWindow)
         {
            OnCloseDropDown(pulledWindow);
            pulledWindow = null;
            button.checked = false;
            NotifyClose(master, this);
         }
         else
         {
            incref this;
            if(editBox && editBox.modifiedDocument)
            {
               NotifyTextEntry(master, this, editBox.contents, true);
               editBox.modifiedDocument = false;
            }
            pulledWindow = OnDropDown();
            if(pulledWindow)
            {
               OnPosition(position.x, position.y, clientSize.w, clientSize.h);
               if(listBox.freeSelect)
                  pulledWindow.OnLeftButtonDown(-2,-2, 0);
               button.checked = true;
               pulledWindow.visible = true;
            }
            delete this;
         }
         Update(null);
         return true;
      }
   };

   ListBox listBox
   {
      master = this, fullRowSelect = true, freeSelect = true, /* noHighlight = style.noHighlight , */
      interim = true, hasVertScroll = true, borderStyle = contour, position = { absPosition.x, absPosition.y + size.h },
      size.w = size.w, visible = false;

      bool NotifyActivate(Window control, bool active, Window swap)
      {
         if(!active)
         {
            Update(null);
            if(swap != button && swap != this)
            {
               if(editBox && editBox.modifiedDocument)
               {
                  NotifyTextEntry(master, this, editBox.contents, true);
                  editBox.modifiedDocument = false;
               }

               OnCloseDropDown(pulledWindow);
               pulledWindow = null;
               button.checked = false;
               NotifyClose(master, this);
            }
         }
         return true;
      }

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         Update(null);

         // Add code to set text to list box contents if it has an editbox

         if(pulledWindow)
         {
            OnCloseDropDown(pulledWindow);
            pulledWindow = null;
            button.checked = false;
            mods.closingDropDown = true;
            if(!NotifyClose(master, this))
               return false;
         }
         currentRow = (row && !row.noneRow) ? row : null;
         if(style.editText && style.changeContents)
         {
            char tempString[4096];
            if(currentRow)
               editBox.contents = (char *)dataType._vTbl[__ecereVMethodID_class_OnGetString](dataType, currentRow.GetData(null), tempString, null, null);
            else
               editBox.contents = "";
            if(active)
               editBox.SelectAll();
         }                  
         button.Deactivate();
         return NotifySelect(master, this, currentRow, mods);
      }

      bool NotifyHighlight(ListBox control, DataRow row, Modifiers mods)
      {
         return NotifyHighlight(master, this, row, mods);
      }

      bool NotifyKeyDown(ListBox listBox, DataRow selection, Key key, unichar ch)
      {
         return OnKeyDown(key, ch);
         //return true;
      }
   };

   bool OnPostCreate()
   {
      if(font)
         listBox.font = { font.faceName, font.size };
      return true;
   }

   DropBoxBits style;
   Window pulledWindow;
   DataRow currentRow;
   int listBoxMaxShown;
   Class dataType;
   DataField field;
   EditBox editBox;
   Alignment alignment;
   DataRow noneRow;
   Color selectionColor;
};
