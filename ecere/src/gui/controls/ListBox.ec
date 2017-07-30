namespace gui::controls;

import "Window"

static define branchesColor = Color { 85, 85, 85 };
static define headerCollapseForeground = Color { 135, 135, 135 };
static define dataBoxBackground = Color { 67, 134, 198 };
static define dataBoxForeground = lightYellow;

#define SNAPDOWN(x, d) \
      if(Abs(x) % (d)) \
      { \
         if(x < 0) x -= ((d) - Abs(x) % (d)); else x -= x % (d); \
      }

#include <stdarg.h>

static class ListBoxCell : struct
{
   ListBoxCell prev, next;
   bool isSet;
   // data follows
   void * data[1];
};

#define RESIZE_BORDER   5
#define PLUSY  4
#define EXTRA_SPACE 8

class ListBoxBits
{
   bool header:1, freeSelect:1 /*Exclusive to ELS_MULTISELECT*/, fullRowSelect:1, multiSelect:1, autoScroll:1, alwaysHL : 1, moveRows:1, resizable:1;
   bool moveFields:1, clearHeader:1, alwaysEdit:1, collapse:1, treeBranch:1, rootCollapse:1, heightSet:1;
   bool sortable:1, noDragging:1, fillLastField:1, expandOnAdd:1;
};

public class DataDisplayFlags
{
   public bool selected:1, fullRow:1, current:1, active:1, dropBox:1, header:1, firstField:1;
};

enum SelectedFlag { unselected, selected, tempSelected, tempUnselected };

default:
extern int __ecereVMethodID_class_OnEdit;
extern int __ecereVMethodID_class_OnDisplay;
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnFree;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnCopy;
extern int __ecereVMethodID_class_OnSaveEdit;

private:

public class DataField
{
   class_no_expansion;
public:
   property Class dataType
   {
      set { dataType = value; if(value) { alignment = (Alignment)value.defaultAlignment; } }  // NOTE: Class::defaultAlignment does not seem to be used anywhere
      get { return dataType; }
   }
   property bool editable { set { editable = value; } };
   property bool fixed { set { fixed = value; } get { return fixed; } };
   property Alignment alignment
   {
      set
      {
         alignment = value;
         if(headButton) headButton.alignment = value;
         if(listBox) listBox.Update(null);
      }
      get { return alignment; }
   };
   property int width
   {
      set
      {
         width = Max(value, -EXTRA_SPACE);
         if(listBox)
            listBox.AdaptToFieldWidth(this, false);
      }
      get { return width; }
   };
   property int index { get { return this ? index : 0; } };
   property int position
   {
      set
      {
         if(listBox)
         {
            int index = 0;
            DataField field;
            for(field = listBox.fields.first; field; field = field.next)
            {
               if(index == value - 2)
                  break;
               index++;
            }
            Move(field);
         }
      }
      get
      {
         if(listBox)
         {
            int index = 0;
            DataField field;
            for(field = listBox.fields.first; field; field = field.next)
            {
               if(this == field)
               {
                  return index + 1;
               }
               index++;
            }
         }
         return -1;
      }
   };
   property int sortOrder { get { return this ? sortOrder : 0; } };
   property const char * header
   {
      set
      {
         header = value;
         if(headButton)
            headButton.text = header;
      }
   };
   property void * userData
   {
      set
      {
         userData = value;
      }
      get
      {
         return this ? userData : null;
      }
   };
   property bool freeData
   {
      set { freeData = value; } get { return freeData; }
   };
   property DataField prev { get { return prev; } };
   property DataField next { get { return next; } };

   void Move(DataField after)
   {
      if(prev != after)
      {
         listBox.fields.Move(this, after);

         // Fix up positions
         listBox.OnResize(listBox.clientSize.w, listBox.clientSize.h);
         listBox.Update(null);
      }
   }

   void AutoSize()
   {
      if(listBox && dataType)
      {
         Display display = listBox.display;
         Font boldFont = listBox.boldFont.font;
         Font font = listBox.fontObject;
         DataRow row;
         int width = 0;
         if(header)
            display.FontExtent(boldFont, header, strlen(header), &width, null);
         width += EXTRA_SPACE;
         for(row = listBox.firstRow; row; row = row.GetNextRow())
         {
            ListBoxCell cell;
            uint i;
            for(i = 0, cell = row.cells.first; i != index; i++, cell = cell.next);
            if(cell && cell.isSet && dataType)
            {
               static char tempString[4096];
               const String string;
               int tw = 0;
               if(dataType.type == normalClass || dataType.type == noHeadClass)
                  string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, cell.data[0], tempString, userData, null);
               else
                  string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)dataType._vTbl[__ecereVMethodID_class_OnGetString])(dataType, cell.data, tempString, userData, null);
               if(string)
                  display.FontExtent(row.header ? boldFont : font, string, strlen(string), &tw, null);
               else
                  display.FontExtent(row.header ? boldFont : font, "", 0, &tw, null);
               if(tw > width) width = tw;
            }
         }
         if(width)
            property::width = width;
      }
   }

private:
   DataField()
   {
      // property::dataType = "String";
      property::dataType = "char *";
      // width = 80;
      freeData = true;
   }

   ~DataField()
   {
      Free();
   }

   void Free()
   {
      headButton.Destroy(0);
      delete headButton;
      if(listBox)
      {
         DataField field;
         listBox.fields.Remove(this);
         for(field = listBox.fields.first; field; field = field.next)
         {
            if(field.index >= index)
               field.index--;
         }
         if(listBox.currentField == this)
            listBox.currentField = null;
         listBox.numFields--;
         listBox.OnResize(listBox.clientSize.w, listBox.clientSize.h);
         listBox = null;
      }
   }

   DataField prev, next;
   const char * header;
   Class dataType;
   int width;
   uint index;
   int x;
   Button headButton;
   int sortOrder;
   Alignment alignment;
   bool editable;
   ListBox listBox;
   bool defaultField;
   void * userData;
   bool freeData;
   bool fixed;
};

public class DataRow
{
   class_no_expansion
#ifdef _DEBUG
   bool skipCheck;
#endif
public:
   property int64 tag { set { if(this) tag = value; } get { return this ? tag : 0; } };
   property DataRow previous { get { return prev; } };
   property DataRow next { get { return next; } };
   property int index { get { return (this && (!parent || parent.IsExpanded())) ? index : -1; } };
   property const char * string
   {
      set { SetData(listBox.fields.first, value); }
      get { return GetData(listBox.fields.first); }
   };
   property bool isHeader { set { header = value; } get { return this ? header : false; } };
   property BitmapResource icon { set { if(this) icon = value; } get { return this ? icon : null; } };
   property bool collapsed
   {
      set
      {
         if(this && collapsed != value)
         {
            collapsed = value;
            if(parent.IsExpanded())
            {
               DataRow search;
               int ix;

               if(value)
               {
                  for(search = subRows.first; search; search = search.next)
                     search.selectedFlag = 0;

                  if(listBox.clickedRow && !listBox.clickedRow.parent.IsExpanded())
                  {
                     listBox.clickedRow = GetNextRow();
                     if(!listBox.clickedRow)
                        listBox.clickedRow = this;
                  }
                  if(listBox.currentRow && !listBox.currentRow.parent.IsExpanded())
                  {
                     listBox.SetCurrentRow(this, true);
                  }
                  if(listBox.firstRowShown && !listBox.firstRowShown.parent.IsExpanded())
                  {
                     listBox.firstRowShown = GetPrevRow();
                     if(!listBox.firstRowShown)
                        listBox.firstRowShown = this;
                  }
               }

               ix = index+1;
               for(search = GetNextRow(); search; search = search.GetNextRow())
                  search.index = ix++;
               listBox.rowCount = ix;

               listBox.HideEditBox(false, false, true);

               listBox.SetScrollArea(
                  listBox.width,
                  (listBox.rowCount * listBox.rowHeight) +
                  ((listBox.style.header) ? listBox.rowHeight : 0) -
                  ((!((listBox.clientSize.h+1) % listBox.rowHeight)) ? listBox.rowHeight : 0), true);
               listBox.Update(null);
               listBox.NotifyCollapse(listBox.master, listBox, this, value);
            }
         }
#ifdef _DEBUG
         if(this && !skipCheck)
            listBox.CheckConsistency();
#endif
      }
      get { return this ? collapsed : false; }
   };
   property bool selected
   {
      set
      {
         if(this)
         {
            selectedFlag = value ? selected : unselected;
            listBox.Update(null);
         }
      }
      get { return selectedFlag == selected || selectedFlag == tempSelected; }
   };
   property DataRow parent
   {
      set
      {
         if(this && (value != this))
         {
            DataRow search;
            DataRow after = value ? value.subRows.last : listBox.rows.last;
            int ixCount = (!collapsed && subRows.count) ? GetLastRow().index - index + 1 : 1;
            if(parent.IsExpanded())
            {
               for(search = GetNextRow(); search; search = search.GetNextRow())
                  search.index -= ixCount;
               listBox.rowCount -= ixCount;
            }

            listBox.HideEditBox(false, false, true);

            /*
            if(this == listBox.clickedRow)
            {
               listBox.clickedRow = GetNextRow();
               if(!listBox.clickedRow)
                  listBox.clickedRow = GetPrevRow();
            }

            if(this == listBox.currentRow)
            {
               DataRow newCurrentRow = GetNextRow();
               if(!listBox.newCurrentRow)
                  listBox.newCurrentRow = GetPrevRow();
               listBox.SetCurrentRow(newCurrentRow, true);
            }

            if(this == listBox.firstRowShown)
            {
               listBox.firstRowShown = GetPrevRow();
               if(!listBox.firstRowShown)
                  listBox.firstRowShown = GetNextRow();
            }
            */

            (parent ? parent.subRows : listBox.rows).Remove(this);

            if(value)
               value.subRows.Insert(after, this);
            else
               listBox.rows.Insert(after, this);

            parent = value;

            if(value && listBox.style.expandOnAdd)
            {
#ifdef _DEBUG
               value.skipCheck = true;
#endif
               value.collapsed = false;
#ifdef _DEBUG
               value.skipCheck = false;
#endif
            }

            if(value.IsExpanded())
            {
               DataRow search;

               if(after && after.subRows.first && !after.collapsed)
               {
                  search = after.GetLastRow();
                  index = search.index + 1;
               }
               else
                  index = after ? (after.index + 1) : (index + 1);

               listBox.rowCount += ixCount;

               {
                  int ix = index+1;
                  for(search = GetNextRow(); search; search = search.GetNextRow())
                     search.index = ix++;
               }

               listBox.SetScrollArea(
                  listBox.width,
                  (listBox.rowCount * listBox.rowHeight) +
                  ((listBox.style.header) ? listBox.rowHeight : 0) -
                  ((!((listBox.clientSize.h+1) % listBox.rowHeight)) ? listBox.rowHeight : 0), true);
               if(listBox.style.autoScroll)
                  listBox.SetScrollPosition(0, MAXINT - listBox.rowHeight);
            }
            // TESTING THIS HERE...
            if(listBox.created)
               listBox.Sort(listBox.sortField, listBox.sortField.sortOrder);

            {
               int headerSize = ((listBox.style.header) ? listBox.rowHeight : 0);
               int height = listBox.clientSize.h + 1 - headerSize;
               if(listBox.currentRow && listBox.currentRow.index * listBox.rowHeight > listBox.scroll.y + height - listBox.rowHeight)
                  listBox.SetScrollPosition(listBox.scroll.x, listBox.currentRow.index * listBox.rowHeight - height + listBox.rowHeight);
               else if(!listBox.currentRow || listBox.currentRow.index * listBox.rowHeight < listBox.scroll.y)
               {
                  int line = listBox.currentRow ? listBox.currentRow.index * listBox.rowHeight : 0;
                  listBox.SetScrollPosition(listBox.scroll.x, line);
               }
               else
                  listBox.OnVScroll(0, listBox.scroll.y, 0);
            }
            listBox.Update(null);
         }
      }
      get
      {
         return parent;
      }
   };
   property DataRow lastRow { get { return this ? subRows.last : null; } };
   property DataRow firstRow { get { return this ? subRows.first : null; } };

   void Edit(DataField field)
   {
      if(this)
      {
         if(listBox)
         {
            if(!field || !field.editable)
            {
               for(field = listBox.fields.first; field; field = field.next)
                  if(field.editable) break;
            }
            if(field && field.editable)
            {
               listBox.SetCurrentRow(this, true);
               listBox.PopupEditBox(field, false);
            }
         }
      }
   }

   // NOTE: This does not support reparenting (Use row.parent = first)
   void Move(DataRow after)
   {
      if(this)
      {
         incref this;
         if(listBox && prev != after)
         {
            DataRow search;
            int headerSize = ((listBox.style.header) ? listBox.rowHeight : 0);
            int height = listBox.clientSize.h + 1 - headerSize;
            int ixCount = (!collapsed && subRows.count) ? GetLastRow().index - index + 1 : 1;

            if(!after || after.index < index)
            {
               if((after && after == listBox.firstRowShown.prev) || (!after && !parent /*&& listBox.firstRowShown.prev*/))
                  listBox.firstRowShown = this;

               // All rows between AFTER (exclusive) and ROW (exclusive) are incremented by one
               // ROW is equal to AFTER's index + 1

               for(search = after ? after.next : (parent ? parent.subRows.first : listBox.rows.first); search && search != this; search = search.GetNextRow())
                  search.index += ixCount;

               if(after && after.subRows.first && !after.collapsed)
               {
                  search = after.GetLastRow();
                  index = search.index + 1;
               }
               else
                  index = after ? (after.index + 1) : parent ? parent.index + 1 : 0;

               // Fix indices of sub rows
               if(!collapsed)
               {
                  int c, ix = index+1;
                  for(c = 1, search = GetNextRow(); search && c < ixCount; c++, search = search.GetNextRow())
                     search.index = ix++;
               }
            }
            else
            {
               DataRow nextRow;
               int afterIXCount = 1;

               nextRow = GetNextRow();
               if(this == listBox.firstRowShown)
                  listBox.firstRowShown = nextRow;

               // All rows between ROW (exclusive) and AFTER (inclusive) are decremented by one
               // ROW is equal to AFTER's index

               for(search = nextRow; search; search = search.GetNextRow())
               {
                  search.index -= ixCount;
                  if(search == after) break;
               }

               // Fix up's after's sub rows
               if(after && !after.collapsed)
               {
                  DataRow last = after.GetLastRow();
                  if(last != after)
                  {
                     int ix = after.index+1;
                     for(search = after.GetNextRow(); search; search = search.GetNextRow())
                     {
                        afterIXCount++;
                        search.index = ix++;
                        if(search == last) break;
                     }
                  }
               }
               index = after.index + afterIXCount;

               // Fix indices of sub rows
               if(!collapsed)
               {
                  int c, ix = index+1;
                  for(c = 1, search = GetNextRow(); search && c < ixCount; c++, search = search.GetNextRow())
                     search.index = ix++;
               }
            }
            (parent ? parent.subRows : listBox.rows).Move(this, after);

#ifdef _DEBUG
            listBox.CheckConsistency();
#endif

            listBox.HideEditBox(true, false, true);
            if(listBox)
            {
               if(listBox.currentRow && listBox.currentRow.index * listBox.rowHeight > listBox.scroll.y + height - listBox.rowHeight)
                  listBox.SetScrollPosition(listBox.scroll.x, listBox.currentRow.index * listBox.rowHeight - height + listBox.rowHeight);
               else if(!listBox.currentRow || listBox.currentRow.index * listBox.rowHeight < listBox.scroll.y)
               {
                  int line = listBox.currentRow ? listBox.currentRow.index * listBox.rowHeight : 0;
                  //SNAPUP(line, listBox.rowHeight);
                  listBox.SetScrollPosition(listBox.scroll.x, line);
               }
               else
                  listBox.OnVScroll(0, listBox.scroll.y, 0);

               listBox.modifiedDocument = true;

               listBox.Update(null);
            }
         }
         delete this;
      }
   }

   any_object GetData(DataField field)
   {
      if(this)
      {
         ListBoxCell cell = listBox.GetCell(&this, &field);
         if(cell && cell.isSet)
         {
            if((field.dataType.type == normalClass || field.dataType.type == noHeadClass))
               return cell.data[0];
            else
               return cell.data;
         }
      }
      return null;
   }

   void * SetData(DataField field, any_object newData)
   {
      if(this)
      {
         ListBoxCell cell = listBox.GetCell(&this, &field);
         if(cell)
         {
            Class dataType = field.dataType;

            if(dataType)
            {
               if(dataType.type == normalClass || dataType.type == noHeadClass)
               {
                  if(cell.data[0] && field.freeData)
                     ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, cell.data[0]);

                  if(eClass_IsDerived(dataType, class(char *)) && field.freeData)
                     ((void (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCopy])(dataType, cell.data, newData);
                  else
                     cell.data[0] = (void *)newData;
               }
               else
               {
                  // Free old data first
                  ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, cell.data);
                  ((void (*)(void *, void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnCopy])(dataType, cell.data, newData);
               }
            }
            cell.isSet = true;
            listBox.modifiedDocument = true;
            listBox.Update(null);
            if(dataType && (dataType.type == normalClass || dataType.type == noHeadClass))
               return cell.data;
            else
               return &cell.data;
         }
      }
      return null;
   }

   void UnsetData(DataField field)
   {
      if(this)
      {
         ListBoxCell cell = listBox.GetCell(&this, &field);
         if(cell)
         {
            Class dataType = field.dataType;

            if(dataType)
            {
               if(dataType.type == normalClass || dataType.type == noHeadClass)
               {
                  if(cell.data[0] && field.freeData)
                     ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, cell.data[0]);
                  cell.data[0] = null;
               }
               else
               {
                  int size = (field.dataType && field.dataType.typeSize) ?
                     (sizeof(class ListBoxCell) + field.dataType.typeSize - sizeof(void *)) : sizeof(class ListBoxCell);
                  // Free old data first
                  ((void (*)(void *, void *))(void *)dataType._vTbl[__ecereVMethodID_class_OnFree])(dataType, cell.data);
                  FillBytes(cell.data, 0, size - (uint)(uintptr)&((ListBoxCell)0).data);
               }
            }
            cell.isSet = false;
            listBox.Update(null);
         }
      }
   }

   DataRow FindRow(int64 tag)
   {
      DataRow row = null;
      for(row = subRows.first; row; row = row.next)
      {
         if(!row.noneRow && row.tag == tag)
            break;
      }
      return row;
   }

   DataRow FindSubRow(int64 tag)
   {
      DataRow row = null;
      for(row = subRows.first; row; row = row.next)
      {
         if(!row.noneRow && row.tag == tag)
            break;
         if(row.subRows.first)
         {
            DataRow subRow = row.FindSubRow(tag);
            if(subRow)
               return subRow;
         }
      }
      return row;
   }

   DataRow AddRowAfter(DataRow after)
   {
      if(this)
      {
         DataRow row { };
         incref row;
         if(row)
         {
            DataField field;
            int c;
            subRows.Insert(after, row);
            row.listBox = listBox;
            *&row.parent = this;

            row.cells.Clear();
            for(c = 0; c<listBox.fields.count; c++)
            {
               for(field = listBox.fields.first; field; field = field.next)
                  if((int)field.index == c)
                     break;
               if(field)
               {
                  int size = (field.dataType && field.dataType.typeSize) ?
                     (sizeof(class ListBoxCell) + field.dataType.typeSize - sizeof(void *)) : sizeof(class ListBoxCell);
                  ListBoxCell cell = (ListBoxCell)new0 byte[size];
                  row.cells.Add(cell);
                  FillBytes(cell.data, 0, size - (uint)(uintptr)&((ListBoxCell)0).data);
                  cell.isSet = false;
               }
            }

            if(IsExpanded())
            {
               DataRow search;

               if(after && after.subRows.first && !after.collapsed)
               {
                  for(search = after.subRows.last; !search.collapsed && search.subRows.last; )
                     search = search.subRows.last;
                  row.index = search.index + 1;
               }
               else
                  row.index = after ? (after.index + 1) : (index + 1);

               listBox.rowCount++;

               for(search = row.GetNextRow(); search; search = search.GetNextRow())
                  search.index++;

               listBox.SetScrollArea(
                  listBox.width,
                  (listBox.rowCount * listBox.rowHeight) +
                  ((listBox.style.header) ? listBox.rowHeight : 0) -
                  ((!((listBox.clientSize.h+1) % listBox.rowHeight)) ? listBox.rowHeight : 0), true);
               if(listBox.style.autoScroll)
                  listBox.SetScrollPosition(0, MAXINT - listBox.rowHeight);
            }

            listBox.modifiedDocument = true;
         }
#ifdef _DEBUG
         listBox.CheckConsistency();
#endif
         return row;
      }
      return null;
   }

   DataRow AddRow()
   {
      if(this)
         return AddRowAfter(subRows.last);
      return null;
   }

   DataRow AddStringf(const char * format, ...)
   {
      if(this)
      {
         DataRow row;
         char string[MAX_F_STRING];
         va_list args;
         va_start(args, format);
         vsnprintf(string, sizeof(string), format, args);
         string[sizeof(string)-1] = 0;
         va_end(args);

         row = AddRow();
         row.SetData(null, string);
         return row;
      }
      return null;
   }

   DataRow AddString(const char * string)
   {
      if(this)
      {
         DataRow row;
         row = AddRow();
         row.SetData(listBox.fields.first, string);
         return row;
      }
      return null;
   }


private:
   DataRow()
   {
      subRows.offset = (uint)(uintptr)&((DataRow)0).prev;
   }

   ~DataRow()
   {
      ListBoxCell cell, next;
      uint cellIndex = 0;
      DataRow subRow;

      // Delete SubRows
      while((subRow = subRows.first))
      {
         subRows.Remove(subRow);
         delete subRow;
      }

      for(cell = cells.first; cell; cell = next, cellIndex++)
      {
         if(listBox)
         {
            DataField field;
            for(field = listBox.fields.first; field && field.index != cellIndex; field = field.next);
            if(field && field.dataType)
            {
               // TOCHECK: Is this check good? Will need incref/decref sometime?
               if(field.dataType.type == normalClass || field.dataType.type == noHeadClass)
               {
                  if(cell.data[0] && field.freeData)
                     ((void (*)(void *, void *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnFree])(field.dataType, cell.data[0]);
               }
               else
                  ((void (*)(void *, void *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnFree])(field.dataType, cell.data);
            }
         }
         next = cell.next;
         delete cell;
      }
   }

   bool IsExpanded()
   {
      return !this || (!collapsed && (!parent || parent.IsExpanded()));
   }

   int Compare(DataRow b, DataField sortField)
   {
      int result = 0;
      ListBoxCell cell1, cell2;
      uint index;
      for(index = 0, cell1 = cells.first, cell2 = b.cells.first;
          index != sortField.index;
          index++, cell1 = cell1.next, cell2 = cell2.next);
      if(noneRow && !b.noneRow) return -1;
      else if(!noneRow && b.noneRow) return 1;
      else if(noneRow && b.noneRow) return 0;

      if(!cell1.isSet && !cell2.isSet)
         result = 0;
      else if(!cell1.isSet)
         result = -1;
      else if(!cell2.isSet)
         result = 1;
      else if(sortField.dataType._vTbl[__ecereVMethodID_class_OnCompare])
      {
         if(sortField.dataType.type == normalClass || sortField.dataType.type == noHeadClass)
         {
            result = ((int (*)(void *, void *, void *))(void *)sortField.dataType._vTbl[__ecereVMethodID_class_OnCompare])(sortField.dataType,
               cell1.isSet ? cell1.data[0] : null,
               cell2.isSet ? cell2.data[0] : null);
         }
         else
         {
            result = ((int (*)(void *, void *, void *))(void *)sortField.dataType._vTbl[__ecereVMethodID_class_OnCompare])(sortField.dataType,
               cell1.isSet ? cell1.data : null,
               cell2.isSet ? cell2.data : null);
         }
      }
      return sortField.sortOrder * result;
   }

   void _SortSubRows(DataField field, int order)
   {
      DataRow search;
      for(search = subRows.first; search; search = search.next)
         search._SortSubRows(field, order);
      subRows.Sort(Compare, field);
   }

   public void SortSubRows(bool scrollToCurrent)
   {
      if(this && listBox && listBox.sortField)
      {
         _SortSubRows(listBox.sortField, listBox.sortField.sortOrder);

         {
            DataRow search;
            int ix = index;
            for(search = this; search; search = search.GetNextRow())
               search.index = ix++;
         }
         if(scrollToCurrent)
         {
            int headerSize = ((listBox.style.header) ? listBox.rowHeight : 0);
            int height = listBox.clientSize.h + 1 - headerSize;
            if(listBox.currentRow && listBox.currentRow.index * listBox.rowHeight > listBox.scroll.y + height - listBox.rowHeight)
               listBox.SetScrollPosition(listBox.scroll.x, listBox.currentRow.index * listBox.rowHeight - height + listBox.rowHeight);
            else if(!listBox.currentRow || listBox.currentRow.index * listBox.rowHeight < listBox.scroll.y)
               listBox.SetScrollPosition(listBox.scroll.x, listBox.currentRow ? listBox.currentRow.index * listBox.rowHeight : 0);
            listBox.OnVScroll(0, listBox.scroll.y, 0);
         }
      }
   }

   public DataRow GetPrevRow()
   {
      DataRow row;
      // Find Previous row
      if(prev)
      {
         for(row = prev; row && !row.collapsed && row.subRows.last; row = row.subRows.last);
      }
      else
         row = parent;
      return row;
   }

   public DataRow GetNextRow()
   {
      DataRow row;
      // Find Next row
      if(subRows.first && !collapsed)
         row = subRows.first;
      else
      {
         for(row = this; row; row = row.parent)
         {
            if(row.next) { row = row.next; break; }
         }
      }
      return row;
   }

   private DataRow GetLastRow()
   {
      DataRow row = this;
      while(row && !row.collapsed && row.subRows.last)
         row = row.subRows.last;
      return row;
   }

   DataRow prev, next;
   OldList cells;
   int64 tag;
   SelectedFlag selectedFlag;
   ListBox listBox;
   bool header;
   OldList subRows;
   DataRow parent;
   bool collapsed;
   BitmapResource icon;
   int index;
   bool noneRow;
};

public class ListBox : CommonControl
{
   hasVertScroll = true;
   // background = white;
   borderStyle = deep;
   snapVertScroll = true;

   class_property(icon) = "<:ecere>controls/listBox.png";

public:
   // Properties
   property bool freeSelect { property_category $"Behavior" set { style.freeSelect = value; } get { return style.freeSelect; } };
   property DataRow currentRow { property_category $"Private" /*"Behavior"*/ set { if(this) SetCurrentRow(value, false); } get { return this ? currentRow : null; } };
   property DataField currentField
   {
      get { return currentField; }
      // TODO: Document what this does
      set
      {
         currentField = value;
         HideEditBox(true, true, false);
         if(value && value.editable)
            PopupEditBox(currentField, false);
      }
   };

   property int rowHeight
   {
      property_category $"Appearance"
      isset { return style.heightSet; }
      set
      {
         if(value)
         {
            style.heightSet = true;
            rowHeight = value;
            SetScrollLineStep(8, value);
         }
         else
         {
            style.heightSet = false;
            OnLoadGraphics();
            OnApplyGraphics();
         }
      }
      get { return this ? rowHeight : 0; }
   };
   property Seconds typingTimeout
   {
      property_category $"Behavior"
      set
      {
         typedString[0] = '\0';
         typingTimer.delay = value;
         typingTimeOut = value;
      }
      get { return typingTimeOut; }
   };
   property bool moveRows { property_category $"Behavior" set { style.moveRows = value; } get { return style.moveRows; } };
   property bool moveFields { property_category $"Behavior" set { style.moveFields = value; } get { return style.moveFields; } };
   property bool resizable { property_category $"Behavior" set { style.resizable = value; } get { return style.resizable; } };
   property bool autoScroll { property_category $"Behavior" set { style.autoScroll = value; } get { return style.autoScroll; } };
   property bool alwaysHighLight { property_category $"Appearance" set { style.alwaysHL = value; } get { return style.alwaysHL; } };
   property bool hasClearHeader { property_category $"Appearance" set { style.clearHeader = value; if(value) property::hasHeader = true; } get { return style.clearHeader; } };
   property bool hasHeader
   {
      property_category $"Appearance"
      set
      {
         if(value && !style.header)
         {
            endBevel = Button
            {
               this;
               stayOnTop = true;
               bevel = !guiApp.textMode && !style.clearHeader;
               dontScrollVert = true;
               inactive = true;
               size.h = rowHeight;
               NotifyPushed = HeaderPushed;
               NotifyClicked = HeaderClicked;
               NotifyDoubleClick = HeaderDoubleClicked;
               NotifyReleased = HeaderReleased;
               NotifyMouseMove = HeaderMouseMove;
            };
            incref endBevel;
            endBevel.Create();
            endBevel.visible = false;
         }
         style.header = value;
      }
      get { return style.header; }
   };
   property bool multiSelect { property_category $"Behavior" set { style.multiSelect = value; } get { return style.multiSelect; } };
   property bool alwaysEdit { property_category $"Behavior" set { style.alwaysEdit = value; } get { return style.alwaysEdit; } };
   property bool fullRowSelect { property_category $"Appearance" set { style.fullRowSelect = value; } get { return style.fullRowSelect; } };
   property bool collapseControl { property_category $"Appearance" set { style.collapse = value; } get { return style.collapse; } };
   property bool treeBranches { property_category $"Appearance" set { style.treeBranch = value; } get { return style.treeBranch; } };
   property bool rootCollapseButton { property_category $"Appearance" set { style.rootCollapse = value; } get { return style.rootCollapse; } };
   property bool sortable { property_category $"Behavior" set { style.sortable = value; } get { return style.sortable; } };
   property bool noDragging { property_category $"Behavior" set { style.noDragging = value; } get { return style.noDragging; } };
   property bool fillLastField
   {
      property_category $"Behavior"
      set
      {
         style.fillLastField = value;
      }
      get { return style.fillLastField; }
   };
   property int numSelections
   {
      get
      {
         int numSelections = 0;
         if(this && style.multiSelect)
         {
            DataRow row;
            for(row = rows.first; row; row = row.GetNextRow())
               if(row.selectedFlag == selected || row.selectedFlag == tempSelected)
                  numSelections++;
         }
         return numSelections;
      }
   };
   property int currentIndex
   {
      get { return currentRow ? currentRow.index : -1; }
   };
   property DataRow lastRow { get { return this ? rows.last : null; } };
   property DataRow firstRow { get { return this ? rows.first : null; } };
   property int rowCount { get { return rowCount; } };
   property DataField firstField { get { return this ? fields.first : null; } };
   property Color selectionColor { set { selectionColor = value; } get { return selectionColor; } isset { return selectionColor ? true : false; } };
   property Color selectionText  { set { selectionText = value; } get { return selectionText; } isset { return selectionText ? true : false; } };
   property Color stippleColor { set { stippleColor = value; } get { return stippleColor; } };
   property bool expandOnAdd { set { style.expandOnAdd = value; } get { return style.expandOnAdd; } };

   // Notifications
   virtual bool Window::NotifySelect(ListBox listBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifyHighlight(ListBox listBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifyReclick(ListBox listBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifySort(ListBox listBox, DataField field, Modifiers mods);
   virtual bool Window::NotifyChanged(ListBox listBox, DataRow row);
   virtual bool Window::NotifyKeyDown(ListBox listBox, DataRow row, Key key, unichar ch);
   virtual bool Window::NotifyEdited(ListBox listBox, DataRow row);
   virtual bool Window::NotifyEditDone(ListBox listBox, DataRow row);
   virtual bool Window::NotifyMovedField(ListBox listBox, DataField field, Modifiers mods);
   virtual bool Window::NotifyMove(ListBox listBox, DataRow row, Modifiers mods);
   virtual bool Window::NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods);
   virtual bool Window::NotifyRightClick(ListBox listBox, int x, int y, Modifiers mods);
   virtual bool Window::NotifyResized(ListBox listBox, DataField field, Modifiers mods);
   virtual bool Window::NotifyCollapse(ListBox listBox, DataRow row, bool collapsed);
   virtual bool Window::NotifyKeyHit(ListBox listBox, DataRow row, Key key, unichar ch);
   virtual bool Window::NotifyModified(ListBox listBox, DataRow row);
   virtual bool Window::NotifyEditing(ListBox listBox, DataRow row);
   virtual void Window::NotifyMoved(ListBox listBox, DataRow row, Modifiers mods);

#ifdef _DEBUG
   private void CheckConsistency()
   {
#if 0
      DataRow r;
      int index = 0;
      for(r = rows.first; r; r = r.GetNextRow())
      {
         if(r.index != index++)
            PrintLn("bug");
      }
#endif
   }
#endif

   // Methods
   void AddField(DataField addedField)
   {
      if(this)
      {
         DataField field;
         if(fields.first && ((DataField)fields.first).defaultField)
         {
            DataField defaultField = fields.first;
            defaultField.Free();
            delete defaultField;
         }
         if(!addedField)
         {
            addedField = DataField { };
         }

         incref addedField;
         addedField.listBox = this;
         fields.Add(addedField);

         addedField.sortOrder = 1;
         addedField.index = numFields;
         numFields++;
         if(style.header)
         {
            addedField.headButton.Destroy(0);
            delete addedField.headButton;
            addedField.headButton = Button
            {
               this;
               stayOnTop = true;
               inactive = true;
               dontScrollVert = true;
               id = (int64)(intptr)addedField;
               text = addedField.header;
               bevel = (!guiApp.textMode && !style.clearHeader);
               ellipsis = true;
               alignment = addedField.alignment;
               NotifyPushed = HeaderPushed;
               NotifyClicked = HeaderClicked;
               NotifyDoubleClick = HeaderDoubleClicked;
               NotifyReleased = HeaderReleased;
               NotifyMouseMove = HeaderMouseMove;
            };
            incref addedField.headButton;
            addedField.headButton.Create();

            if(guiApp.textMode)
               addedField.headButton.background = Color { 0, 170, 0 };
         }
         if(rows.first)
         {
            DataRow row;
            field = addedField;
            for(row = rows.first; row; )
            {
               int size = (field.dataType && field.dataType.typeSize) ?
                  (sizeof(class ListBoxCell) + field.dataType.typeSize - sizeof(void *)) : sizeof(class ListBoxCell);
               ListBoxCell cell = (ListBoxCell)new0 byte[size];
               row.cells.Add(cell);
               FillBytes(cell.data, 0, size - (uint)(uintptr)&((ListBoxCell)0).data);
               cell.isSet = false;

               if(row.subRows.first)
                  row = row.subRows.first;
               else
               {
                  for(; row; row = row.parent)
                  {
                     if(row.next) { row = row.next; break; }
                  }
               }
            }
         }
         OnResize(clientSize.w, clientSize.h);
      }
   }

   void ClearFields()
   {
      if(this)
      {
         DataField field;
         Clear();    // Ensure data is cleared first
         while((field = fields.first))
         {
            field.Free();
            delete field;
         }
         endBevel.visible = false;
         sortField = null;
      }
   }

   void RemoveField(DataField field)
   {
      if(this)
      {
         if(field)
         {
            int index = field.index;
            DataRow row;

            if(sortField == field)
               sortField = null;

            for(row = rows.first; row; )
            {
               int c;
               ListBoxCell cell;

               for(cell = row.cells.first, c = 0; c < index && cell; c++, cell = cell.next);
               if(cell && index == c)
               {
                  if(field.dataType)
                  {
                     // TOCHECK: Is this check good? Will need incref/decref sometime?
                     if(field.dataType.type == normalClass || field.dataType.type == noHeadClass)
                     {
                        if(cell.data[0] && field.freeData)
                           ((void (*)(void *, void *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnFree])(field.dataType, cell.data[0]);
                     }
                     else
                        ((void (*)(void *, void *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnFree])(field.dataType, cell.data);
                  }

                  row.cells.Remove(cell);
                  delete cell;
               }

               if(row.subRows.first)
                  row = row.subRows.first;
               else
               {
                  for(; row; row = row.parent)
                  {
                     if(row.next) { row = row.next; break; }
                  }
               }
            }

            field.Free();
            delete field;
         }
         if(!fields.count)
            endBevel.visible = false;
      }
   }

   DataRow AddRowNone()
   {
      DataRow row { noneRow = true };
      incref row;
      if(row)
      {
         DataRow search;

         row.index = 0;
         rows.Insert(null, row);
         row.listBox = this;

         for(search = row.GetNextRow(); search; search = search.GetNextRow())
            search.index++;

         rowCount++;
         row.cells.Clear();

         firstRowShown = row;

         SetScrollArea(
            width,
            (rowCount * rowHeight) +
            ((style.header) ? rowHeight : 0) -
            ((!((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);
         if(style.autoScroll)
            SetScrollPosition(0, MAXINT - rowHeight);
         modifiedDocument = true;
         return row;
      }
      return null;
   }

   DataRow AddRow()
   {
      if(this)
      {
         if(fields.first)
         {
            DataRow row { };
            incref row;
            if(row)
            {
               DataField field;
               int c;

               // Find very last row
               {
                  DataRow lastRow;
                  for(lastRow = rows.last; lastRow && !lastRow.collapsed && lastRow.subRows.last; lastRow = lastRow.subRows.last);
                  row.index = lastRow ? (lastRow.index + 1) : 0;
               }

               rows.Add(row);
               row.listBox = this;
               rowCount++;

               row.cells.Clear();
               for(c = 0; c<fields.count; c++)
               {
                  for(field = fields.first; field; field = field.next)
                     if((int)field.index == c)
                        break;
                  if(field)
                  {
                     int size = (field.dataType && field.dataType.typeSize) ?
                        (sizeof(class ListBoxCell) + field.dataType.typeSize - sizeof(void *)) : sizeof(class ListBoxCell);
                     ListBoxCell cell = (ListBoxCell) new0 byte[size];
                     row.cells.Add(cell);
                     FillBytes(cell.data, 0, size - (uint)(uintptr)&((ListBoxCell)0).data);
                     cell.isSet = false;
                  }
               }

               if(!firstRowShown)
               {
                  firstRowShown = row;
               }

               if(rowHeight)
                  SetScrollArea(
                     width,
                     (rowCount * rowHeight) +
                     ((style.header) ? rowHeight : 0) -
                     ((!((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);
               if(style.autoScroll)
                  SetScrollPosition(0, MAXINT - rowHeight);
               modifiedDocument = true;
            }
#ifdef _DEBUG
            CheckConsistency();
#endif
            return row;
         }
      }
      return null;
   }

   DataRow AddRowAfter(DataRow after)
   {
      if(fields.first)
      {
         DataRow row { };
         incref row;
         if(row)
         {
            DataRow search;
            DataField field;
            int c;

            if(after && after.subRows.first && !after.collapsed)
            {
               for(search = after.subRows.last; !search.collapsed && search.subRows.last; )
                  search = search.subRows.last;
               row.index = search.index + 1;
            }
            else
               row.index = after ? (after.index + 1) : 0;
            rows.Insert(after, row);
            row.listBox = this;

            for(search = row.GetNextRow(); search; search = search.GetNextRow())
               search.index++;

            rowCount++;
            row.cells.Clear();
            for(c = 0; c<fields.count; c++)
            {
               for(field = fields.first; field; field = field.next)
                  if((int)field.index == c)
                     break;
               if(field)
               {
                  int size = (field.dataType && field.dataType.typeSize) ?
                     (sizeof(class ListBoxCell) + field.dataType.typeSize - sizeof(void *)) : sizeof(class ListBoxCell);
                  ListBoxCell cell = (ListBoxCell) new0 byte[size];
                  row.cells.Add(cell);
                  FillBytes(cell.data, 0, size - (uint)(uintptr)&((ListBoxCell)0).data);
                  cell.isSet = false;
               }
            }
            if(!firstRowShown || !after)
            {
               firstRowShown = row;
            }

            SetScrollArea(
               width,
               (rowCount * rowHeight) +
               ((style.header) ? rowHeight : 0) -
               ((!((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);
            if(style.autoScroll)
               SetScrollPosition(0, MAXINT - rowHeight);
            modifiedDocument = true;
#ifdef _DEBUG
            CheckConsistency();
#endif
            return row;
         }
      }
      return null;
   }

   DataRow AddStringf(const char * format, ...)
   {
      if(this)
      {
         DataRow row;

         char string[MAX_F_STRING];
         va_list args;

         va_start(args, format);
         vsnprintf(string, sizeof(string), format ? format : "", args);
         string[sizeof(string)-1] = 0;
         va_end(args);

         row = AddRow();
         row.SetData(fields.first, string);
         return row;
      }
      return null;
   }

   DataRow AddString(const char * string)
   {
      if(this)
      {
         DataRow row;
         row = AddRow();
         row.SetData(fields.first, string);
         return row;
      }
      return null;
   }

   void SelectRow(DataRow row)
   {
      SetCurrentRow(row, true);
   }

   void DeleteRow(DataRow row)
   {
      if(!row) row = currentRow;
      if(row)
      {
         DataRow sub, next, search;
         // Trying to move this here (Messed up deleting watches)
         //HideEditBox(false, false, true);

         // Delete Sub Rows
         for(sub = row.subRows.first; sub; sub = next)
         {
            next = sub.next;
            DeleteRow(sub);
         }

         if(row.parent.IsExpanded())
         {
            for(search = row.GetNextRow(); search; search = search.GetNextRow())
               search.index--;
            rowCount--;
         }

         HideEditBox(false, false, true);

         if(row == clickedRow)
         {
            clickedRow = row.GetNextRow();
            if(!clickedRow)
               clickedRow = row.GetPrevRow();
         }

         if(row == currentRow)
         {
            DataRow newCurrentRow = row.GetNextRow();
            if(!newCurrentRow)
               newCurrentRow = row.GetPrevRow();
            SetCurrentRow(newCurrentRow, true);
         }

         if(row == firstRowShown)
         {
            firstRowShown = row.GetPrevRow();
            if(!firstRowShown)
               firstRowShown = row.GetNextRow();
         }

         (row.parent ? row.parent.subRows: rows).Remove(row);
         delete row;

         //HideEditBox(false, false, true);

         SetScrollArea(
            width,
            (rowCount * rowHeight) +
            ((style.header) ? rowHeight : 0) -
            ((!((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);

         modifiedDocument = true;

         Update(null);
#ifdef _DEBUG
         CheckConsistency();
#endif
      }
   }

   DataRow FindRow(int64 tag)
   {
      if(this)
      {
         DataRow row = null;
         for(row = rows.first; row; row = row.next)
         {
            if(!row.noneRow && row.tag == tag)
               break;
         }
         return row;
      }
      return null;
   }

   DataRow FindString(const char * searchedString)
   {
      DataField field;
      bool checkNextField = true;

      for(field = fields.first; field; field = field.next)
      {
         if(field.dataType._vTbl[__ecereVMethodID_class_OnGetString])
         {
            DataRow row;
            for(row = rows.first; row; row = row.GetNextRow())
            {
               if(!row.noneRow)
               {
                  void * data = row.GetData(field);
                  char tempString[1024] = "";
                  bool needClass = false;
                  const char * string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, data, tempString, null, &needClass);

                  if(string && string[0])
                     checkNextField = false;
                  if(string && string[0] && !strcmp(string, searchedString))
                     return row;
               }
            }
         }
         if(!checkNextField) break;
      }
      return null;
   }

   DataRow FindSubString(const char * subString)
   {
      DataField field;
      bool checkNextField = true;
      int len = subString ? strlen(subString) : 0;

      if(len)
      {
         for(field = fields.first; field; field = field.next)
         {
            if(field.dataType._vTbl[__ecereVMethodID_class_OnGetString])
            {
               DataRow row;
               for(row = rows.first; row; row = row.GetNextRow())
               {
                  if(!row.noneRow)
                  {
                     void * data = row.GetData(field);
                     char tempString[1024] = "";
                     bool needClass = false;
                     const char * string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, data, tempString, null, &needClass);

                     if(string && string[0])
                        checkNextField = false;
                     if(string && string[0] && !strncmp(string, subString, len))
                        return row;
                  }
               }
            }
            if(!checkNextField) break;
         }
      }
      return null;
   }

   DataRow FindSubStringi(const char * subString)
   {
      DataField field;
      bool checkNextField = true;
      int len = subString ? strlen(subString) : 0;
      DataRow result = null;
      const char * bestResult = null;
      int bestLen = 0;

      if(len)
      {
         for(field = fields.first; field; field = field.next)
         {
            if(field.dataType._vTbl[__ecereVMethodID_class_OnGetString])
            {
               DataRow row;
               for(row = rows.first; row; row = row.GetNextRow())
               {
                  if(!row.noneRow)
                  {
                     void * data = row.GetData(field);
                     char tempString[1024] = "";
                     bool needClass = false;
                     const char * string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, data, tempString, null, &needClass);

                     if(string && string[0])
                        checkNextField = false;
                     if(string && string[0])
                     {
                        int stringLen = strlen(string);

                        if(!strnicmp(string, subString, Min(len, stringLen)))
                        {
                           if(bestLen < Min(len, stringLen))
                              bestResult = 0;
                           if(!bestResult || strcmpi(string, bestResult) < 0)
                           {
                              bestLen = Min(len, stringLen);
                              bestResult = string;
                              result = row;
                           }
                        }
                     }
                  }
               }
            }
            if(!checkNextField) break;
         }
      }
      return result;
   }

   DataRow FindSubStringAfter(DataRow after, const char * subString)
   {
      DataField field;
      bool checkNextField = true;
      int len = subString ? strlen(subString) : 0;

      if(len)
      {
         for(field = fields.first; field; field = field.next)
         {
            if(field.dataType._vTbl[__ecereVMethodID_class_OnGetString])
            {
               DataRow row;
               for(row = after.GetNextRow(); row && row != after; row = row.GetNextRow(), (!row) ? (row = rows.first) : null)
               {
                  if(!row.noneRow)
                  {
                     void * data = row.GetData(field);
                     char tempString[1024] = "";
                     bool needClass = false;
                     const char * string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, data, tempString, null, &needClass);

                     if(string && string[0])
                        checkNextField = false;
                     if(string && string[0] && !strncmp(string, subString, len))
                        return row;
                  }
               }
            }
            if(!checkNextField) break;
         }
      }
      return null;
   }

   DataRow FindSubRow(int64 tag)
   {
      if(this)
      {
         DataRow row = null;

         for(row = rows.first; row; row = row.next)
         {
            if(!row.noneRow && row.tag == tag)
               break;
            if(!row.noneRow && row.subRows.first)
            {
               DataRow subRow = row.FindSubRow(tag);
               if(subRow)
                  return subRow;
            }
         }
         return row;
      }
      return null;
   }

   void Clear()
   {
      if(this)
      {
         Window master = this.master;

         HideEditBox(false, true, false);
         editData.Destroy(0);

         firstRowShown = currentRow = null;
         ClearEx();

         if(master)
         {
            if(style.freeSelect)
               NotifyHighlight(master, this, currentRow ? currentRow : null, 0);
            else
               NotifySelect(master, this, currentRow ? currentRow : null, 0);
         }

         if(style.alwaysEdit && currentRow)
            currentRow.Edit(currentField);


         rowCount = 0;

         SetScrollArea(
               width,
               (rowCount * rowHeight) +
               ((style.header) ? rowHeight : 0) -
               ((rowHeight && !((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);
         Update(null);
      }
   }

   void Sort(DataField field, int order)
   {
      if(this)
      {
         DataRow search;
         int headerSize = ((style.header) ? rowHeight : 0);
         int height = clientSize.h + 1 - headerSize;

         if(!field) field = fields.first;
         sortField = field;
         field.sortOrder = order ? order : 1;
         rows.Sort(DataRow::Compare, field);

         for(search = rows.first; search; search = search.next)
            search._SortSubRows(field, order);

         {
            int index = 0;
            for(search = rows.first; search; search = search.GetNextRow())
               search.index = index++;
         }

         if(currentRow && currentRow.index * rowHeight > scroll.y + height - rowHeight)
            SetScrollPosition(scroll.x, currentRow.index * rowHeight - height + rowHeight);
         else if(!currentRow || currentRow.index * rowHeight < scroll.y)
            SetScrollPosition(scroll.x, currentRow ? currentRow.index * rowHeight : 0);

         OnVScroll(0, scroll.y, 0);

         // SetScrollPosition(0, scroll.y);
         // Update(null);
      }
   }

   void StopEditing(bool save)
   {
      HideEditBox(save, false, true);
   }

   void GetMultiSelection(OldList list)
   {
      list.Clear();
      if(this && style.multiSelect)
      {
         DataRow row;

         for(row = rows.first; row; row = row.GetNextRow())
         {
            if(row.selectedFlag == selected || row.selectedFlag == tempSelected)
            {
               list.Add(OldLink { data = row });
            }
         }
      }
   }

   // Convenience Current Row Methods
   void * SetData(DataField field, any_object data)
   {
      return currentRow.SetData(field, data);
   }

   any_object GetData(DataField field)
   {
      return (void *)currentRow.GetData(field);
   }

   int64 GetTag()
   {
      return currentRow ? currentRow.tag : 0;
   }

private:
   ListBox()
   {
      DataField defaultField { };
      rows.offset = (uint)(uintptr)&((DataRow)0).prev;
      fields.offset = (uint)(uintptr)&((DataField)0).prev;
      style.fullRowSelect = true;
      style.fillLastField = true;
      style.expandOnAdd = true;
      typingTimeOut = 0.5;
      rowHeight = 16;   // Stuff depending on creation and default property checking
      maxShown = 10;

      defaultField.defaultField = true;

      AddField(defaultField);

      typedString = new char[1];
      typedString[0] = '\0';
      dropIndex = -1;
      return true;
   }

   ~ListBox()
   {
      DataField field;

      delete editData;
      delete typedString;
      delete endBevel;

      ClearEx();

      while((field = fields.first))
      {
         // fields.Remove(field);
         field.Free();
         delete field;
      }
   }

   void ClearEx()
   {
      DataRow row;
      clickedRow = null;
      while((row = rows.first))
      {
         rows.Remove(row);
         delete row;
      }
   }

   ListBoxCell GetCell(DataRow * row, DataField * field)
   {
      ListBoxCell cell = null;
      if(!*row) *row = currentRow;
      if(*row)
      {
         if(!*field) *field = this ? currentField : null;
         if(!*field && this)
         {
            for(*field = fields.first; (*field).index != 0; *field = (*field).next);
         }
         if(*field)
         {
            uint index;
            if(field->listBox == this)
            {
               for(index = 0, cell = (*row).cells.first; cell && index != (*field).index; index++, cell = cell.next);
            }
         }
      }
      return cell;
   }

   void HideEditBox(bool save, bool alwaysStopEdit, bool repositionOnly)
   {
      if(editData && editData.visible)
      {
         if(save)
            editData.SaveData();

         editData.visible = false;
         NotifyEditDone(master, this, currentRow);

         // ENSURE DATA BOX IS NOT VISIBLE
         editData.visible = false;

         if(style.alwaysEdit && !alwaysStopEdit)
         {
            /*
            int height = rowHeight - (style.alwaysEdit ? 1 : 0);
            int y = currentRow.index * rowHeight + (style.header ? rowHeight : 0);
            int x = currentField.x;
            int width = (!currentField.next && style.fillLastField && (!hasHorzScroll || clientSize.w - currentField.x > currentField.width + EXTRA_SPACE)) ?
                  clientSize.w - currentField.x : (currentField.width + EXTRA_SPACE);

            if(!style.alwaysEdit)
            {
               editData.position = { x, y };
               editData.size = { width, height };
            }
            else
            {
               editData.position = { x, y - editData.clientStart.y };
               editData.size = { width, height + editData.clientStart.y * 2 };
            }
            editData.visible = true;
            if(style.alwaysEdit)
               editData.Deactivate();
            */
            PopupEditBox(currentField, repositionOnly);
         }

         /*else
            currentField = null;*/
      }
   }

#ifdef _DEBUG
   static bool DebugFindRow(DataRow parent, DataRow row)
   {
      bool found = false;
      DataRow r;
      for(r = parent.subRows.first; r; r = r.next)
      {
         if(r == row)
         {
            found = true;
            break;
         }
         if(DebugFindRow(r, row))
         {
            found = true;
            break;
         }
      }
      return found;
   }
#endif

   void SetCurrentRow(DataRow row, bool notify)
   {
#if _DEBUG
      if(this && row)
      {
         bool found = false;
         DataRow r;
         for(r = rows.first; r; r = r.next)
         {
            if(r == row)
            {
               found = true;
               break;
            }
            if(DebugFindRow(r, row))
            {
               found = true;
               break;
            }
         }
         if(!found)
            PrintLn("ERROR: Setting currentRow to a row not found in ListBox!!");
      }
#endif
      if(this && (currentRow != row || (currentRow && currentRow.selectedFlag == unselected)))
      {
         int headerSize = ((style.header) ? rowHeight : 0);
         int height = clientSize.h + 1 - headerSize;

         // true: destroy edit box
         HideEditBox(true, true, false);

         if(!(style.multiSelect) && currentRow)
            currentRow.selectedFlag = unselected;

         currentRow = row;

         if(style.multiSelect)
         {
            DataRow selRow;

            for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
               selRow.selectedFlag = unselected;
            if(currentRow)
               currentRow.selectedFlag = selected;

            clickedRow = row;
         }
         else if(currentRow)
            currentRow.selectedFlag = selected;

         if(currentRow && currentRow.index * rowHeight > scroll.y + height - rowHeight)
            SetScrollPosition(scroll.x,
               currentRow.index * rowHeight - height + rowHeight);
         else if(!currentRow || currentRow.index * rowHeight < scroll.y)
         {
            int line = currentRow ? currentRow.index * rowHeight : 0;
            //SNAPUP(line, rowHeight);
            SetScrollPosition(scroll.x, line);
         }

         if(notify)
         {
            Window master = this.master;
            if(master)
            {
               if(style.freeSelect && visible)
                  NotifyHighlight(master, this, currentRow ? currentRow : null, 0);
               else
                  NotifySelect(master, this, currentRow ? currentRow : null, 0);
               if(style.alwaysEdit && currentRow)
                  currentRow.Edit(currentField);
            }
         }

         Update(null);
      }
   }

   void RepositionFieldEditor()
   {
      if(editData && editData.visible)
      {
         int height = rowHeight - (style.alwaysEdit ? 1 : 0);
         int x = 0;
         int y = currentRow.index * rowHeight + (style.header ? rowHeight : 0);
         int width = 0;
         DataField field;

         if(style.collapse && !(style.treeBranch))
            x += 15;
         for(field = fields.first; field; field = field.next)
         {
            width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
               clientSize.w - field.x : (field.width + EXTRA_SPACE);
            if(field == currentField) break;
            x += width;
         }
         if(!style.alwaysEdit)
         {
            editData.position = { x, y - editData.clientStart.y };
            editData.size = { width, height + editData.clientStart.y * 2 };
         }
         else
         {
            editData.position = { x, y };
            editData.size = { width, height };
         }
      }
   }

   void PopupEditBox(DataField whichField, bool repositionOnly)
   {
      if((!editData || !editData.visible || currentField != whichField) && currentRow)
      {
         // true: destroy edit box
         HideEditBox(true, true, false);
         if(whichField)
         {
            int height = rowHeight - (style.alwaysEdit ? 1 : 0);
            int x = 0;
            int y = currentRow.index * rowHeight + (style.header ? rowHeight : 0);
            int width = 0;
            //void * data = currentRow.GetData(whichField);
            DataField field;
            DataRow row = null;
            ListBoxCell cell;

            if(style.collapse && !(style.treeBranch))
               x += 15;

            for(field = fields.first; field; field = field.next)
            {
               width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
                  clientSize.w - field.x : (field.width + EXTRA_SPACE);
               if(field == whichField) break;
               x += width;
            }

            currentField = whichField;
            cell = GetCell(&row, &currentField);

            if(!editData)
            {
               editData = DataBox
               {
                  this;
                  background = dataBoxBackground;
                  foreground = dataBoxForeground;

                  bool NotifyChanged(DataBox dataBox, bool closingDropDown)
                  {
                     DataRow row = null;
                     DataField field = null;
                     ListBoxCell cell = GetCell(&row, &field);
                     if(cell)
                     {
                        cell.isSet = true;
                        modifiedDocument = true;
                        Update(null);
                        NotifyChanged(master, this, currentRow);
                     }
                     return true;
                  }

                  bool NotifyModified()
                  {
                     //DataRow row = null;
                     //DataField field = null;
                     //ListBoxCell cell = GetCell(&row, &field);
                     //cell.isSet = true;
                     modifiedDocument = true;
                     //Update(null);
                     NotifyModified(master, this, currentRow);
                     return true;
                  }

                  bool OnKeyDown(Key key, unichar ch)
                  {
                     bool result = DataBox::OnKeyDown(key, ch);
                     if(visible && active)   // Added this check here, because we will not use enter/escape otherwise, and lose DataBox's result
                     {
                        if((SmartKey)key == enter || (SmartKey)key == escape)
                           return true;
                     }
                     return result;
                  }
               };
               incref editData;
            }
            else
               editData.Destroy(0);
            editData.type = whichField.dataType;
            editData.fieldData = whichField.userData;
            editData.borderStyle = style.alwaysEdit ? 0 : deep;
            editData.data = cell ? cell.data : null;

            if(!repositionOnly)
               // Might not really need this anymore...
               NotifyEditing(master, this, currentRow);

            editData.Create();
            if(!style.alwaysEdit)
            {
               editData.position = { x, y - editData.clientStart.y };
               editData.size = { width, height + editData.clientStart.y * 2 };
            }
            else
            {
               editData.position = { x, y };
               editData.size = { width, height };
            }
            if(!repositionOnly)
               editData.Refresh();
            editData.visible = true;

            if(style.alwaysEdit)
               editData.Deactivate();

            //   MOVED THIS HIGHER FOR DATALIST EDITOR
            if(!repositionOnly)
               // Might not really need this anymore...
               NotifyEdited(master, this, currentRow);
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      DataRow row;
      int y = (style.header) ? rowHeight : 0;
      bool isActive = active;
      Font font = fontObject;
      Font boldFont = this.boldFont.font;

      // Draw gray grid
      if(style.alwaysEdit && style.fullRowSelect)
      {
         // Horizontal lines
         int y = (style.header) ? rowHeight : 0;
         int x = -scroll.x - 1;// + EXTRA_SPACE;// / 2 - 1;
         int w = clientSize.w;
         int h = clientSize.h;
         DataRow row;
         DataField field;

         // Fill out indent column
         if(style.collapse && !(style.treeBranch) && (style.header || rows.first))
         {
            x += 15;
            surface.SetBackground(formColor);
            surface.Area(-scroll.x, 0, x, clientSize.h);
         }

         surface.SetForeground(formColor);
         for(row = firstRowShown; row; row = row.GetNextRow())
         {
            y += rowHeight;
            surface.HLine(x + 1, w-1, y-1);
            if(y >= h)
               break;
         }

         // Vertical lines
         for(field = fields.first; field; field = field.next)
         {
            int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
               clientSize.w - field.x : (field.width + EXTRA_SPACE);
            if(field.prev && y > 0)
               surface.VLine(0, y-1, x);
            x += width;
         }
      }

      surface.foreground = this.foreground;
      surface.TextOpacity(false);

      // Draw the tree branches
      if(style.treeBranch)
      {
         int y = -scroll.y + ((style.header) ? rowHeight : 0);
         surface.LineStipple(0x5555);
         surface.SetForeground(branchesColor);
         for(row = rows.first; row; row = row.GetNextRow() )
         {
            int x = -scroll.x + EXTRA_SPACE / 2-1;
            int rowStart = -scroll.x;
            int indent = 0;
            DataRow parent;
            int plusIndent;

            for(parent = row.parent; parent; parent = parent.parent)
               if(!parent.header) indent += 20;
            if(style.rootCollapse) indent += 20;

            plusIndent = (style.treeBranch) ? (indent - 20 + 4) : indent;

            x += indent;

            // Vertical line
            if(row.subRows.first)
            {
               int numRows = 0;
               int y1 = y + PLUSY + 4;
               int y2;
               DataRow child;

               for(child = row.collapsed ? null : row.subRows.first; child && child != row; )
               {
                  numRows++;
                  if(child.subRows.first && !child.collapsed && child != row.subRows.last)
                     child = child.subRows.first;
                  else if(child.next)
                     child = child.next;
                  else
                  {
                     for(; child && child != row; child = child.parent)
                     {
                        if(child.next)
                        {
                           child = child.next;
                           break;
                        }
                     }
                  }
               }
               y2 = y + numRows * rowHeight + PLUSY + 4;
               surface.VLine(y1, y2, rowStart + plusIndent + 7 + 20);
            }
            surface.HLine(rowStart + plusIndent + 7, rowStart + indent, y + PLUSY + 4);

            y += rowHeight;
            if(y >= clientSize.h)
               break;
         }
         // Root Vertical Lines
         if(style.rootCollapse && rows.first)
         {
            int numRows = 0;
            int y1, y2;
            DataRow child;
            y = -scroll.y + ((style.header) ? rowHeight : 0);
            y1 = y + PLUSY + 4;
            for(child = rows.first; child && child != rows.last; )
            {
               numRows++;
               if(child.subRows.first && !child.collapsed && child != rows.last)
                  child = child.subRows.first;
               else if(child.next)
                  child = child.next;
               else
               {
                  for(; child; child = child.parent)
                  {
                     if(child.next)
                     {
                        child = child.next;
                        break;
                     }
                  }
               }
            }
            y2 = y + numRows * rowHeight + PLUSY + 4;
            surface.VLine(y1, y2, -scroll.x + 11);
         }
         surface.LineStipple(0);
      }

      for(row = firstRowShown; row; row = row.GetNextRow() )
      {
         int x = -scroll.x + EXTRA_SPACE / 2-1;
         DataField field;
         ListBoxCell cell;
         Color foreground = this.foreground /*black*/, background = this.background /*white*/;
         DataDisplayFlags dataDisplayFlags = 0;
         int rowStart = -scroll.x;
         int indent = 0;
         DataRow parent;
         Bitmap icon = row.icon ? row.icon.bitmap : null;
         int collapseRowStart = 0;
         bool lastWasHeader = row.header;

         for(parent = row.parent; parent; parent = parent.parent)
         {
            if(!parent.header || lastWasHeader)
            {
               if(style.treeBranch)
                  indent += 20;
               else
                  indent += 15;
            }
         }
         if(style.rootCollapse) indent += 20;
         x += indent;

         dataDisplayFlags.fullRow = style.fullRowSelect;
         dataDisplayFlags.active = isActive;
         dataDisplayFlags.header = row.header;

         surface.Clip(null);
         if(style.collapse)
         {
            collapseRowStart = rowStart;

            if(!(style.treeBranch))
            {
               x += 15;
               rowStart += 15;
            }
         }

         if(style.multiSelect)
         {
            dataDisplayFlags.selected = row.selectedFlag == selected || row.selectedFlag == tempSelected;
            dataDisplayFlags.current = row == currentRow || (!currentRow && row == firstRowShown);
         }
         else
         {
            dataDisplayFlags.selected = row.selectedFlag == selected || row.selectedFlag == tempSelected;
            dataDisplayFlags.current = row == currentRow || (!currentRow && row == firstRowShown);
            /*
            if(row == currentRow)
            {
               dataDisplayFlags.current = true;
               dataDisplayFlags.selectedFlag = true;
            }
            else if(!currentRow && row == firstRowShown)
            {
               dataDisplayFlags.current = true;
            }*/
         }

         surface.TextOpacity(true);

         background = this.background;
         foreground = this.foreground;

         // Draw the current row background
         if(row.header)
         {
            Color colors[] = { formColor, azure, mistyRose, linen, floralWhite, lavender, lavenderBlush, lemonChiffon };
            int level = 0;
            DataRow p = row;
            while((p = p.parent)) level++;
            background = colors[level % (sizeof(colors)/sizeof(colors[0]))];
            surface.SetBackground(background);
            surface.Area(rowStart, y, clientSize.w, (y + rowHeight) - 1);
            foreground = branchesColor;
         }
         else if(dataDisplayFlags.selected)
         {
            if(dataDisplayFlags.selected && (isActive || style.alwaysHL || (style.alwaysEdit && style.fullRowSelect)))
            {
               if(!isActive && style.alwaysEdit)
                  background = formColor;
               else
                  background = selectionColor ? selectionColor : SELECTION_COLOR;
               if(style.fullRowSelect)
               {
                  int offset = (style.alwaysEdit) ? 2 : 1;
                  surface.SetBackground(background);
                  surface.Area(rowStart, y, clientSize.w, (y + rowHeight) - offset);
               }
               if(isActive || !(style.alwaysEdit))
                  foreground = selectionText ? selectionText : SELECTION_TEXT;
               else
                  foreground = branchesColor;
            }
         }

         if(icon)
         {
            surface.Blit(icon, x + (20 - icon.width) /2,y + 2,0,0, icon.width, icon.height);
            x += 20;
         }

         if(row.noneRow)
         {
            int width = clientSize.w;
            Box clip;
            dataDisplayFlags.firstField = true;
            clip.left = x - EXTRA_SPACE / 2+1;
            clip.top = y;
            clip.right = x + width - EXTRA_SPACE/2 - 0;
            clip.bottom = y + rowHeight - 1;
            surface.Clip(&clip);

            surface.TextFont(font);

            surface.SetForeground(foreground);
            surface.SetBackground(background);

            ((void (*)(void *, const void *, void *, int, int, int, void *, uint, uint))(void *)class(String)._vTbl[__ecereVMethodID_class_OnDisplay])(class(String), "(none)", surface, x, y - 1 + (rowHeight - fontH)/2, width - EXTRA_SPACE/2, null, Alignment::left, dataDisplayFlags);
         }
         else
         {
            if(opacity < 1) surface.TextOpacity(false);
            // Draw the rows
            for(field = fields.first; field; field = field.next)
            {
               uint index;
               int width = ((!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) || row.header) ?
                  clientSize.w - field.x : (field.width + EXTRA_SPACE);

               // Box clip = { x, y+1, x + field.width - EXTRA_SPACE - 1, y + rowHeight - 2 };
               Box clip;

               //width -= EXTRA_SPACE;

               if(!field.prev) width -= indent;


               dataDisplayFlags.firstField = field.prev ? false : true;

               if(!dataDisplayFlags.firstField && !dataDisplayFlags.fullRow)
               {
                  background = this.background;
                  foreground = this.foreground;
               }

               if(!isActive && dataDisplayFlags.selected && style.alwaysEdit && field.editable && opacity)
               {
                  surface.Clip(null);
                  surface.SetBackground(background);
                  surface.Area(x-3, y, x+width-1, y + rowHeight-2);
               }

               clip.left = x - EXTRA_SPACE / 2+1;
               clip.top = y;
               clip.right = x + width - EXTRA_SPACE/2 - 0;
               clip.bottom = y + rowHeight - 1;
               surface.Clip(&clip);

               for(index = 0, cell = row.cells.first; cell && index != field.index; index++, cell = cell.next);
               // Should always be as many cells in the row as fields in the listbox
               if(cell && cell.isSet && field.dataType)
               {
                  if(row.header)
                     surface.TextFont(boldFont);
                  else
                     surface.TextFont(font);

                  surface.SetForeground(foreground);
                  surface.SetBackground(background);

                  if(field.dataType.type == noHeadClass || field.dataType.type == normalClass)
                     ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnDisplay])(field.dataType, cell.data[0], surface, x, y - 1 + (rowHeight - fontH)/2, width - EXTRA_SPACE/2, field.userData, field.alignment, dataDisplayFlags);
                  else
                     ((void (*)(void *, void *, void *, int, int, int, void *, uint, uint))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnDisplay])(field.dataType, cell.data, surface, x, y - 1 + (rowHeight - fontH)/2, width - EXTRA_SPACE/2, field.userData, field.alignment, dataDisplayFlags);
               }

               if(!isActive && dataDisplayFlags.selected && style.alwaysEdit && field.editable)
                  background = formColor;

               if(!dataDisplayFlags.firstField && !dataDisplayFlags.fullRow)
               {
                  background = formColor;
                  foreground = this.background;
               }

#ifdef _DEBUG
               // surface.WriteTextf(x + 100, y,  "ix: %d", row.index);
#endif

               x += width;// + EXTRA_SPACE;

               if(row.header) break;
            }
         }

         if(style.collapse)
         {
            int plusIndent = (style.treeBranch) ? (indent - 20 + 4) : indent;
            surface.Clip(null);
            if(row.subRows.first && (row.parent || !(style.treeBranch) || (style.rootCollapse)))
            {
               surface.SetForeground(row.header ? headerCollapseForeground : this.foreground);
               surface.Rectangle(collapseRowStart + 3 + plusIndent, y + PLUSY, collapseRowStart + 11 + plusIndent, y + PLUSY + 8);

               surface.SetBackground(row.header ? (formColor) : (this.background)); //white
               surface.Area(collapseRowStart + 4 + plusIndent, y + PLUSY + 1, collapseRowStart + 10 + plusIndent, y + PLUSY + 7);

               surface.HLine(collapseRowStart + 5 + plusIndent, collapseRowStart + 9 + plusIndent, y+PLUSY+4);
               if(row.collapsed)
                  surface.VLine(y + PLUSY + 2, y + PLUSY + 6, collapseRowStart + 7 + plusIndent);
            }

         }

         // Draw the current row stipple
         if(style.fullRowSelect && !(style.alwaysEdit) && (dataDisplayFlags.current) && isActive)
         {
            surface.Clip(null);
            if(isActive)
            {
               surface.LineStipple(0x5555);
               if(dataDisplayFlags.selected)
                  surface.SetForeground(stippleColor);
               else
                  surface.SetForeground(this.foreground);
            }
            else
               surface.SetForeground(selectionColor ? selectionColor : SELECTION_COLOR);
            surface.Rectangle(0, y, clientSize.w-1, (y + rowHeight) - 1);
            surface.LineStipple(0);
         }

         y += rowHeight;
         if(y >= clientSize.h)
            break;
      }
      if(firstRowShown) surface.Clip(null);
      if(dragRow && dropIndex != -1)
      {
         int ix = dropIndex;
         int y;

         if(!style.multiSelect && currentRow.index < dropIndex)
            ix++;
         surface.DrawingChar(223);

         y = style.header ? rowHeight : 0;
         y += ix * rowHeight - scroll.y;

         surface.SetForeground(Color { 85, 85, 255 });
         surface.HLine(0, clientSize.w-1, y);
         surface.HLine(0, clientSize.w-1, y + 1);
      }
   }

   void OnDrawOverChildren(Surface surface)
   {
      if(draggingField && dropField)
      {
         int position = dropField.x;
         if(draggingField.x < position)
            position += dropField.width + EXTRA_SPACE;

         surface.SetForeground(Color { 85, 85, 255 });
         surface.VLine(0, rowHeight - 1, position - scroll.x - 2);
         surface.VLine(0, rowHeight - 1, position - scroll.x);
      }
      if(sortField && !style.clearHeader && style.header)
      {
         DataField field = sortField;
         int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
            clientSize.w - field.x : (field.width + EXTRA_SPACE);
         int tw = 0, th = 0;
         if(field.header)
            surface.TextExtent(field.header, strlen(field.header), &tw, &th);
         if(tw < width - EXTRA_SPACE)
         {
            bool up = field.sortOrder == 1;
            int x = 4, y = 4;
            Box clip =
            {
               field.x + 2 - scroll.x, 0,
               field.x + width + EXTRA_SPACE - 1 - scroll.x, rowHeight
            };
            surface.Clip(&clip);
            if(field.alignment == left || field.alignment == center)
            {
               if(field.alignment == center)
                  x = field.x + (width + EXTRA_SPACE - tw) / 2 + tw + EXTRA_SPACE + 4;
               else
                  x = field.x + tw + EXTRA_SPACE + 4;

               x = Min(x, field.x + width - 4);
            }
            else if(field.alignment == right)
            {
               x = field.x + width - tw - 2*EXTRA_SPACE - 4;
               x = Max(x, field.x + 2);
            }
            x -= scroll.x;

            if(guiApp.textMode)
            {
               // surface.SetForeground((wmenu.selectedFlag == item) ? white : black);
               // surface.WriteText(clientSize.w-8, y+(wmenu.rh - 8)/2, "\020", 1);
            }
            else
            {
               if(up)
               {
                  surface.SetForeground(Color { 128,128,128 } );
                  surface.DrawLine(x + 3, y, x, y + 5);
                  surface.PutPixel(x + 1, y + 5);
                  surface.PutPixel(x + 1, y + 3);
                  surface.PutPixel(x + 2, y + 1);

                  surface.SetForeground(white);
                  surface.DrawLine(x + 4, y, x + 7, y + 5);
                  surface.PutPixel(x + 6, y + 5);
                  surface.PutPixel(x + 6, y + 3);
                  surface.PutPixel(x + 5, y + 1);

                  surface.DrawLine(x, y + 6, x + 7, y + 6);
               }
               else
               {
                  surface.SetForeground(Color { 128,128,128 });
                  surface.DrawLine(x + 3, y+6, x, y+1);
                  surface.PutPixel(x + 1, y+1);
                  surface.PutPixel(x + 1, y+3);
                  surface.PutPixel(x + 2, y+5);

                  surface.SetForeground(white);
                  surface.DrawLine(x + 4, y+6, x + 7, y+1);
                  surface.PutPixel(x + 6, y+1);
                  surface.PutPixel(x + 6, y+3);
                  surface.PutPixel(x + 5, y+5);

                  surface.DrawLine(x, y, x + 7, y);
               }
            }
            surface.Clip(null);
         }
      }

   }

   void OnResize(int w, int h)
   {
      DataField field;
      bool showEndBevel = false;
      int x = 0;
      if(style.collapse && !style.treeBranch)
         x += 15;
      for(field = fields.first; field; field = field.next)
      {
         int width = field.width + EXTRA_SPACE;
         field.x = x;
         x += width;
      }
      width = x;

      SetScrollArea(
         width,
         (rowCount * rowHeight) +
         ((style.header) ? rowHeight : 0) -
         ((!((clientSize.h+1) % rowHeight)) ? rowHeight : 0), true);

      for(field = fields.first; field; field = field.next)
      {
         int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
            clientSize.w - field.x : (field.width + EXTRA_SPACE);
         if(style.header && field.headButton)
         {
            showEndBevel = true;
            if(width > 0)
            {
               field.headButton.position = { field.x, 0 };
               field.headButton.size = { width, rowHeight };
               field.headButton.visible = true;
            }
            else
               field.headButton.visible = false;
         }
      }

      if(!style.fillLastField && showEndBevel && endBevel)
      {
         endBevel.position = { x, 0 };
         endBevel.size = { clientSize.w + 2 - x, rowHeight };
         endBevel.visible = true;
      }
      else if(endBevel)
         endBevel.visible = false;

      if(style.alwaysEdit && editData && editData.visible)
      {
         HideEditBox(true, false, true);
      }
      else if(editData && editData.visible)
         RepositionFieldEditor();
   }

   void AdaptToFieldWidth(DataField field, bool doScroll)
   {
      OnResize(clientSize.w, clientSize.h);

      // Scroll appropriately
      if(doScroll)
      {
         if(field.x + field.width + EXTRA_SPACE - clientSize.w > scroll.x &&
                 field.x >= field.x + field.width + EXTRA_SPACE - clientSize.w)
         {
            SetScrollPosition(field.x + field.width + EXTRA_SPACE - clientSize.w, scroll.y);
         }
         else if(field.x + field.width + EXTRA_SPACE - clientSize.w > scroll.x ||
                 field.x < scroll.x)
            SetScrollPosition(field.x, scroll.y);
      }
      Update(null);
   }

   bool HeaderPushed(Button control, int x, int y, Modifiers mods)
   {
      DataField field = (DataField)(intptr)control.id;
      // false: dont destroy edit box
      HideEditBox(true, false, true);
      if(style.resizable && ((!field && x < RESIZE_BORDER && fields.last) ||
         (field && x < RESIZE_BORDER && field.prev) ||
         (field && x >= control.clientSize.w - RESIZE_BORDER)))
      {
         if(!field)
            field = fields.last;
         else if(x < RESIZE_BORDER && field.prev)
            field = field.prev;

         if(field.fixed) return false;
         resizingField = field;
         resizeX = x + control.position.x;
         startWidth = field.width;
         oldX = x - scroll.x;
         return false;
      }
      else if(field)
      {
         if(field.fixed) return false;
         draggingField = field;
         if(style.moveFields)
            field.headButton.stayDown = true;
         else if(!style.sortable)
            return false;
      }
      else
         return false;
      return true;
   }

   bool HeaderMouseMove(Button control, int x, int y, Modifiers mods)
   {
      if(resizingField)
      {
         // Resize left
         DataField field = resizingField;

         x += control.position.x;

         // Tweak to prevent shrinking field if we're actually moving right
         if(x - scroll.x > oldX &&
            startWidth + x - resizeX < field.width)
         {
            oldX = x - scroll.x;
            return true;
         }
         oldX = x - scroll.x;

         field.width = startWidth + x - resizeX;
         field.width = Max(field.width, - EXTRA_SPACE);

         AdaptToFieldWidth(field, true);
      }
      else if(draggingField)
      {
         x += control.position.x;
         if(style.moveFields)
         {
            DataField field = fields.last;
            int fieldX = 0;
            for(field = fields.first; field; field = field.next)
            {
               fieldX += ((field.width || style.resizable) ?
                  field.width : clientSize.w) + EXTRA_SPACE;
               if(fieldX > x)
                  break;
            }
            if(draggingField == field)
            {
               // Reset scroll position
               if(field.x + field.width + EXTRA_SPACE - clientSize.w > scroll.x &&
                       field.x >= field.x + field.width + EXTRA_SPACE - clientSize.w)
               {
                  SetScrollPosition(
                     field.x + field.width + EXTRA_SPACE - clientSize.w,
                     scroll.y);
               }
               else if(field.x + field.width + EXTRA_SPACE - clientSize.w > scroll.x ||
                       field.x < scroll.x)
                  SetScrollPosition(field.x, scroll.y);
               field = null;
            }
            if(dropField != field)
            {
               dropField = field;
               if(field)
               {
                  int position = field.x;
                  // Moving right
                  if(draggingField.x < position)
                  {
                     position += field.width + EXTRA_SPACE - clientSize.w;
                     if(position > scroll.x)
                        SetScrollPosition(position, scroll.y);
                  }
                  // Moving Left
                  else
                  {
                     if(position < scroll.x)
                        SetScrollPosition(position, scroll.y);
                  }

                  movingFields = true;
               }
               Update(null);
            }
         }
      }
      else if(style.resizable)
      {
         DataField field = (DataField)(intptr)control.id;
         if(field)
         {
            if(x < RESIZE_BORDER && field.prev)
            {
               if(!field.prev.fixed)
                  control.cursor = guiApp.GetCursor(sizeWE);
            }
            else if(x >= control.clientSize.w - RESIZE_BORDER)
               control.cursor = guiApp.GetCursor(sizeWE);
            else
               control.cursor = null;
         }
         else
         {
            if(x < RESIZE_BORDER && fields.last)
               control.cursor = guiApp.GetCursor(sizeWE);
            else
               control.cursor = null;
         }
      }
      return true;
   }

   bool HeaderReleased(Button control, int x, int y, Modifiers mods)
   {
      if(resizingField)
      {
         NotifyResized(master, this, resizingField, mods);
         resizingField = null;
      }

      if(draggingField)
      {
         bool result = true;

         if(style.moveFields)
         {
            if(dropField)
            {
               // Find which field
               DataField switchField = fields.last;
               DataField field;
               int fieldX = 0;

               x += draggingField.x;
               for(field = fields.first; field; field = field.next)
               {
                  fieldX += ((field.width || style.resizable) ?
                     field.width : clientSize.w) + EXTRA_SPACE;
                  if(fieldX > x)
                  {
                     switchField = field;
                     break;
                  }
               }
               if(switchField && draggingField != switchField && dropField)
               {
                  for(field = fields.first; field; field = field.next)
                  {
                     if(field == switchField || field == draggingField)
                        break;
                  }

                  // Switch field first: move before
                  if(field == switchField)
                     draggingField.Move(switchField.prev);
                  // Dragged field first: move after
                  else
                     draggingField.Move(switchField);

                  NotifyMovedField(master, this, draggingField, mods);
               }
               draggingField.headButton.stayDown = false;
            }
            if(movingFields)
               result = false;
            dropField = null;
            movingFields = false;
         }
         draggingField = null;
         return result;
      }
      return true;
   }

   bool HeaderClicked(Button control, int x, int y, Modifiers mods)
   {
      if(style.header && !dropField && style.sortable)
      {
         DataField field = (DataField)(intptr)control.id;
         if(sortField == field)
            field.sortOrder *= -1;
         else
            sortField = field;
         if(field)
         {
            Sort(sortField, field.sortOrder);
            NotifySort(master, this, field, mods);
         }
      }
      return true;
   }

   bool HeaderDoubleClicked(Button control, int x, int y, Modifiers mods)
   {
      if(style.resizable)
      {
         DataField field = (DataField)(intptr)control.id;
         if(field)
         {
            if(x < RESIZE_BORDER && field.prev)
               field = field.prev;
            else if(x >= control.clientSize.w - RESIZE_BORDER);
            else
               field = null;
         }
         else
         {
            if(x < RESIZE_BORDER && fields.last)
               field = fields.last;
            else
               field = null;
         }
         if(field)
            field.AutoSize();
      }
      return false;
   }

   watch(visible)
   {
      if(style.freeSelect)
      {
         if(!visible)
         {
            ReleaseCapture();
            rolledOver = dragging = false;
         }
         /*else
            Capture();*/
      }
   };

   bool OnLoadGraphics()
   {
      display.FontExtent(fontObject, "W", 1, null, &fontH);
      if(!style.heightSet)
      {
         rowHeight = Max(fontH + 2, 16) + (style.alwaysEdit ? 1 : 0);
         SetScrollLineStep(8, rowHeight);
      }
      return true;
   }

   void OnApplyGraphics()
   {
      SetScrollLineStep(8, rowHeight);
      if(style.header)
      {
         DataField field;
         for(field = fields.first; field; field = field.next)
         {
            if(field.headButton)
            {
               field.headButton.bevel = (!guiApp.textMode && !style.clearHeader);
               if(guiApp.textMode)
                  field.headButton.background = Color { 0, 170, 0 };
            }
         }
      }
      OnResize(clientSize.w, clientSize.h);
   }

   bool OnResizing(int *w, int *h)
   {
      if(rows.first)
      {
         if(!initSize.w && (!anchor.left.type || !anchor.right.type) && !*w)
         {
            // Use widest item
            DataRow row;
            int maxWidth = 0;
            Font font = fontObject;
            Font boldFont = this.boldFont.font;
            Display display = this.display;

            for(row = rows.first; row; row = row.GetNextRow())
            {
               Bitmap icon = row.icon ? row.icon.bitmap : null;
               int x = -scroll.x + EXTRA_SPACE / 2-1;
               DataField field;
               int indent = 0;
               DataRow parent;
               for(parent = row.parent; parent; parent = parent.parent)
               {
                  if(!parent.header)
                  {
                     if(style.treeBranch)
                        indent += 20;
                     else
                        indent += 15;
                  }
               }
               if(style.rootCollapse) indent += 20;
               x += indent;
               if(style.collapse && !(style.treeBranch)) x += 15;
               if(icon)
                  x += 20;

               // Compute the rows size
               for(field = fields.first; field; field = field.next)
               {
                  if(((style.resizable && (!(style.alwaysEdit) || field.next)) || field.width) && !row.header)
                     x += field.width - (field.prev ? 0 : indent);
                  else
                  {
                     ListBoxCell cell;
                     uint index;
                     for(index = 0, cell = row.cells.first; index != field.index; index++, cell = cell.next);

                     // Should always be as many cells in the row as fields in the listbox
                     if(cell && cell.isSet && field.dataType)
                     {
                        static char tempString[4096];
                        const char * string;
                        int tw, th;
                        if(field.dataType.type == normalClass || field.dataType.type == noHeadClass)
                           string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, cell.data[0], tempString, field.userData, null);
                        else
                           string = ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, cell.data, tempString, field.userData, null);
                        /* GCC-4.4 Bug!
			if(!string) string = "";
                        display.FontExtent(row.header ? boldFont : font, string, strlen(string), &tw, &th);
			*/
			if(string)
                           display.FontExtent(row.header ? boldFont : font, string, strlen(string), &tw, &th);
                        else
                           display.FontExtent(row.header ? boldFont : font, "", 0, &tw, &th);
                        x += tw;
                     }
                     if(row.header) break;
                  }
                  x += EXTRA_SPACE;
               }
               maxWidth = Max(maxWidth, x);
            }
            *w = maxWidth;
         }
         if(!*h)
         {
            *h = Min(maxShown, rowCount) * rowHeight;
         }
      }
      else
      {
         if(!*w) *w = rowHeight * 5;
         if(!*h) *h = rowHeight * 5;
      }
      return true;
   }

   watch(font)
   {
      FontResource font = this.font;
      FontResource boldFont
      {
         faceName = font.faceName, size = font.size, bold = true
      };
      AddResource(boldFont);
      RemoveResource(this.boldFont);
      this.boldFont = boldFont;

      OnLoadGraphics();

      SetInitSize(initSize);
   };

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      bool isTimer = false;
      int realX = x, realY = y;

      if(insideNotifySelect) return true;

      if(style.alwaysEdit && style.resizable &&
         resizingField && !(mods.isSideEffect))
      {
        // Resize left
         DataField field = resizingField;
         field.width = startWidth + x - resizeX;
         field.width = Max(field.width, - EXTRA_SPACE);

         AdaptToFieldWidth(field, true);
      }

      cursor = null;
      if(style.alwaysEdit && style.resizable)
      {
         int vx = -scroll.x - 1;
         DataField field;

         if(style.collapse && !(style.treeBranch))
            vx += 15;

         for(field = fields.first; field; field = field.next)
         {
            int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
               clientSize.w - field.x : (field.width + EXTRA_SPACE);

            if(field.prev)
            {
               if(Abs(x - vx) < 2)
               {
                  cursor = guiApp.GetCursor(sizeWE);
                  break;
               }
            }
            vx += width + EXTRA_SPACE;
         }
      }

      if((editData && editData.visible) || (style.alwaysEdit))
         return true;

      if(x == MAXINT && y == MAXINT)
      {
         x = mouseX;
         y = mouseY;
         isTimer = true;
      }

      // ADDED THIS CHECK FOR FieldDropBox LEAKS
      if(/*!mods.isSideEffect && */(rolledOver || !dragging))
      {
         int rowY = (style.header) ? rowHeight : 0;
         DataRow row = null, nextRow;
         int rowIndex;

         mouseX = x;
         mouseY = y;

         if(dragging &&
            ((vertScroll && vertScroll.visible &&
             (y < 0 || y >= clientSize.h)) ||
             (horzScroll && horzScroll.visible &&
             (x < 0 || x >= clientSize.w))))
         {
            timer.Start();
            if(isTimer)
            {
               if(vertScroll && vertScroll.visible &&
                  (y < 0 || y >= clientSize.h))
                  vertScroll.Action((y<0)?up:down, 0, 0);
               if(horzScroll && horzScroll.visible &&
                  (x < 0 || x >= clientSize.w))
                  horzScroll.Action((x<0)?up:down, 0, 0);
            }
         }
         else
            timer.Stop();

         // This must be done after the scrolling took place
         rowIndex = firstRowShown ? firstRowShown.index : -1;
         y = Max(y, 0);
         y = Min(y, clientSize.h - ((dragRow && style.moveRows) ? rowHeight : 0)-1);
         for(row = firstRowShown; row; row = nextRow, rowIndex ++)
         {
            nextRow = row.GetNextRow();
            rowY += rowHeight;
            if(rowY > y || !nextRow)
            {
               break;
            }
         }

         if(dragRow && style.moveRows)
         {
            if(row && row == currentRow)
               row = row.GetNextRow();

            if(row && row.parent == currentRow)
               row = row.GetNextRow();
         }

         if(row && currentRow != row)
         {
            if(dragRow && style.moveRows)
            {
               if(row.selectedFlag == selected || row.selectedFlag == tempSelected)
                  rowIndex = -1;
               else if(style.multiSelect)
               {
                  DataRow thisRow;
                  for(thisRow = rows.first; thisRow; thisRow = thisRow.GetNextRow())
                     if((thisRow.selectedFlag == selected || thisRow.selectedFlag == tempSelected) ||
                        thisRow == row)
                        break;
                  if(thisRow != row)
                     rowIndex++;
               }
               if(dropIndex != rowIndex)
               {
                  dropIndex = rowIndex;
                  editRow = null;
                  Update(null);
                  movedRow = true;
               }
            }
            else if((style.freeSelect  || dragging) && ((realX>= 0 && realY >= 0 && realX< clientSize.w && realY < clientSize.h) || rolledOver))
            {
               if(!(style.multiSelect))
               {
                  if(currentRow)currentRow.selectedFlag = unselected;
                  if(row)row.selectedFlag = selected;
               }
               currentRow = row;

               if(style.multiSelect)
               {
                  DataRow selRow;

                  for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                  {
                     if(selRow.selectedFlag == tempUnselected) selRow.selectedFlag = selected;
                     else if(selRow.selectedFlag == tempSelected) selRow.selectedFlag = unselected;
                  }

                  if(rowIndex >= clickedRow.index)
                  {
                     for(selRow = clickedRow; selRow; selRow = selRow.GetNextRow())
                     {
                        selRow.selectedFlag = (selRow.selectedFlag == selected) ? tempUnselected : tempSelected;
                        if(selRow == row)
                           break;
                     }
                  }
                  else
                  {
                     for(selRow = row; selRow; selRow = selRow.GetNextRow())
                     {
                        selRow.selectedFlag = (selRow.selectedFlag == selected) ? tempUnselected : tempSelected;
                        if(selRow == clickedRow)
                           break;
                     }
                  }
               }
               Update(null);
               if(style.freeSelect)
                  NotifyHighlight(master, this, currentRow, mods);
               else
               {
                  insideNotifySelect = true;
                  NotifySelect(master, this, currentRow, mods);
                  insideNotifySelect = false;
               }

               if(style.alwaysEdit && currentRow)
                  currentRow.Edit(currentField);
            }
         }
      }
      return true;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      if(dragging)
         rolledOver = true;
      return true;
   }

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      // TOCHECK: WAS THIS MISSING ? CHECK FOR SLOWDOWN
      if(!active) Update(null);

      if(!active && (!swap || !swap.isModal))
      {
         // true: destroy edit box
         HideEditBox(true, true, false);
      }
      else if(!swap || !swap.isModal)
      {
         // Bring back edit box
         if(currentRow && style.alwaysEdit)
         {
            currentRow.Edit(currentField ? currentField : null);
         }
         Update(null);
      }
      return true; //NotifyActivate(master, this, active, swap, 0);
   }


   bool OnButtonDown(int x, int y, Modifiers mods, bool right)
   {
      bool result = true;
      // Check to see if we're dragging the vertical divider
      if(style.alwaysEdit && style.resizable && !right)
      {
         int vx = -scroll.x - 1;// + EXTRA_SPACE;// / 2 - 1;
         DataField field;

         if(style.collapse && !(style.treeBranch))
            vx += 15;

         for(field = fields.first; field; field = field.next)
         {
            int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
               clientSize.w - field.x : (field.width + EXTRA_SPACE);

            if(field.prev)
            {
               if(Abs(x - vx) < 2)
               {
                  resizingField = field.prev;
                  resizeX = x;
                  startWidth = resizingField.width;
                  Capture();
                  SetMouseRangeToClient();
                  break;
               }
            }
            vx += width + EXTRA_SPACE;
         }
      }

      if(!(style.freeSelect))
      {
         int rowY = (style.header) ? rowHeight : 0;
         DataRow row = null;
         int rowIndex = firstRowShown ? firstRowShown.index : -1;
         DataRow previousRow = currentRow;
         DataRow newCurrentRow = null;
         bool moveMultiple = false;
         int numSelected = 0;
         int rowStart = -scroll.x;

         if(style.multiSelect)
         {
            if(!right)
            {
               DataRow row;
               if(!(mods.shift))
               {
                  for(row = rows.first; row; row = row.GetNextRow())
                  {
                     if(row.selectedFlag == tempSelected)
                        row.selectedFlag = selected;
                     else if(row.selectedFlag == tempUnselected)
                        row.selectedFlag = unselected;
                     if(row.selectedFlag == selected)
                        numSelected++;
                  }
               }
            }
         }

         for(row = firstRowShown; row; row = row.GetNextRow(), rowIndex ++)
         {
            rowY += rowHeight;
            if(rowY > y || (style.multiSelect && !row.GetNextRow()))
            {
               int plusIndent = 0;
               if(style.treeBranch)
               {
                  DataRow parent;
                  for(parent = (style.rootCollapse) ? row.parent : (row.parent ? row.parent.parent : null); parent; parent = parent.parent)
                     if(!parent.header)
                        plusIndent += 20;
                  plusIndent += 4;
               }

               /*    THIS WAS TOO STRICT:
               if(style.collapse && row.subRows.first && (row.parent || !(style.treeBranch) || (style.rootCollapse)) &&
                  (x >= rowStart + 3 + plusIndent && y >= rowY - rowHeight + PLUSY && x <= rowStart + 11 + plusIndent && y <= rowY - rowHeight + PLUSY + 8))
               */
               if(style.collapse &&
                  (x >= rowStart && y >= rowY - rowHeight && x <= rowStart + 18 + plusIndent && y <= rowY + rowHeight-1))
               {
                  if(row.subRows.first && (row.parent || !(style.treeBranch) || (style.rootCollapse)) && x >= plusIndent)
                  {
                     row.collapsed = !row.collapsed;
                     return false;
                  }
                  else if(rowY > y)
                     newCurrentRow = row;
               }
               else
               {
                  if(rowY > y)
                  {
                     newCurrentRow = row;
                  }
                  if(style.multiSelect)
                  {
                     // Deselect everything if user didn't clicked on a row
                     if(y >= rowY)
                     {
                        DataRow selRow;
                        for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                           selRow.selectedFlag = unselected;
                        clickedRow = row;
                        //clickedRowIndex = rowIndex;
                     }
                     else if(style.moveRows && !(mods.shift) &&
                        (row.selectedFlag == selected || row.selectedFlag == tempSelected) &&
                        !right && !(mods.isActivate))
                        moveMultiple = true;
                     else
                     {
                        DataRow selRow;
                        if(right)
                        {
                           if(row.selectedFlag == tempUnselected || row.selectedFlag == unselected)
                           {
                              for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                                 selRow.selectedFlag = unselected;
                              row.selectedFlag = selected;
                           }
                           clickedRow = row;
                           //clickedRowIndex = rowIndex;
                        }
                        else
                        {
                           if(!(mods.ctrl))
                           {
                              for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                                 selRow.selectedFlag = unselected;
                           }
                           else
                           {
                              for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                              {
                                 if(selRow != clickedRow)
                                 {
                                    if(selRow.selectedFlag == tempUnselected) selRow.selectedFlag = selected;
                                    else if(selRow.selectedFlag == tempSelected) selRow.selectedFlag = unselected;
                                 }
                              }
                           }

                           if(mods.shift)
                           {
                              if(rowIndex >= clickedRow.index)
                              {
                                 for(selRow = clickedRow; selRow; selRow = selRow.GetNextRow())
                                 {
                                    if(mods.ctrl)
                                    {
                                       if(selRow != clickedRow)
                                       {
                                          if(selRow.selectedFlag)
                                             selRow.selectedFlag = tempUnselected;
                                          else
                                             selRow.selectedFlag = tempSelected;
                                       }
                                    }
                                    else
                                       selRow.selectedFlag = selected;
                                    if(selRow == row)
                                       break;
                                 }
                              }
                              else
                              {
                                 for(selRow = row; selRow; selRow = selRow.GetNextRow())
                                 {
                                    if(mods.ctrl)
                                    {
                                       if(selRow != clickedRow)
                                       {
                                          if(selRow.selectedFlag)
                                             selRow.selectedFlag = tempUnselected;
                                          else
                                             selRow.selectedFlag = tempSelected;
                                       }
                                    }
                                    else
                                       selRow.selectedFlag = selected;
                                    if(selRow == clickedRow)
                                       break;
                                 }
                              }
                           }
                           else
                           {
                              if(mods.ctrl)
                              {
                                 if(row.selectedFlag)
                                    row.selectedFlag = tempUnselected;
                                 else row.selectedFlag = tempSelected;
                              }
                              else
                                 row.selectedFlag = tempSelected;
                              clickedRow = row;
                              //clickedRowIndex = rowIndex;
                           }
                        }
                     }
                  }
               }
               break;
            }
         }

         // true: destroy edit box
         if(newCurrentRow)
         {
            incref newCurrentRow;
         }

         if(currentRow != newCurrentRow)
            HideEditBox(true, true, false);

         if(newCurrentRow)
         {
            if(newCurrentRow._refCount <= 1)
               delete newCurrentRow;
            else
               newCurrentRow._refCount--;
         }

         if(newCurrentRow)
         {
            if(!(style.multiSelect))
            {
               if(currentRow) currentRow.selectedFlag = unselected;
               if(newCurrentRow) newCurrentRow.selectedFlag = selected;
            }
         }

         if(currentRow != newCurrentRow)
         {
            /*
            // true: destroy edit box
            if(newCurrentRow)
            {
               //incref newCurrentRow;
               incref newCurrentRow;
            }

            HideEditBox(true, true, false);
            */

            if(newCurrentRow)
            {
               int headerSize = ((style.header) ? rowHeight : 0);
               int height = clientSize.h + 1 - headerSize;

               /*if(newCurrentRow._refCount <= 1)
                  delete newCurrentRow;
               else
               {
                  newCurrentRow._refCount--;
                  //newCurrentRow._refCount--;
               }
               */
               currentRow = newCurrentRow;

               if(currentRow && currentRow.index * rowHeight > scroll.y + height - rowHeight)
                  SetScrollPosition(scroll.x,
                     currentRow.index * rowHeight - height + rowHeight);
               else if(!currentRow || currentRow.index * rowHeight < scroll.y)
               {
                  int line = currentRow ? currentRow.index * rowHeight : 0;
                  //SNAPUP(line, rowHeight);
                  SetScrollPosition(scroll.x, line);
               }

               // GO THROUGH SetCurrentRow eventually?
               // SetCurrentRow(newCurrentRow, true);
            }
         }

         if(style.freeSelect)
            NotifyHighlight(master, this, currentRow, mods);
         else if((moveMultiple || (!(style.multiSelect) && previousRow == currentRow)) &&
            newCurrentRow && !(mods.shift))
         {
            if(!right)
            {
               if(!(mods.isActivate))
               {
                  if(style.moveRows)
                  {
                     dragRow = currentRow;
                     dropIndex = -1;
                     movedRow = false;

                     Capture();
                  }
                  if(editData && editData.visible && style.alwaysEdit)
                  {
                     DataField field;
                     int sx = -scroll.x;
                     int indent = 0;
                     DataRow parent;

                     if(style.collapse && !style.treeBranch)
                        sx += 15;

                     for(parent = newCurrentRow.parent; parent; parent = parent.parent)
                        if(!parent.header)
                           indent += (style.treeBranch) ? 20 : 15;
                     sx += indent;

                     for(field = fields.first; field; field = field.next)
                     {
                        int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
                           clientSize.w - field.x : (field.width + EXTRA_SPACE);

                        if(!field.prev) width -= indent;
                        if(x >= sx && x < sx + width)
                           break;
                        sx += width;
                     }
                     if(field == currentField)
                        editData.Deactivate();
                     else
                     {
                        currentRow.Edit(field);
                        editData.Activate();
                     }
                  }
                  else if(!(mods.ctrl) && numSelected <= 1)
                     editRow = currentRow;

                  if(style.noDragging && newCurrentRow)
                    NotifyReclick(master, this, newCurrentRow, mods);
               }
               else
               {
                  // If the user clicked exactly on the edited field,
                  // activate it
                  if(editData && editData.visible && newCurrentRow)
                  {
                     DataField field;
                     int sx = -scroll.x;
                     int indent = 0;

                     if(style.collapse && !(style.treeBranch))
                        sx += 15;

                     {
                        DataRow parent;
                        for(parent = newCurrentRow.parent; parent; parent = parent.parent)
                           if(!parent.header)
                              indent += (style.treeBranch) ? 20 : 15;
                        sx += indent;
                     }

                     for(field = fields.first; field; field = field.next)
                     {
                        int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
                           clientSize.w - field.x : (field.width + EXTRA_SPACE);
                        if(!field.prev) width -= indent;
                        if(x >= sx && x < sx + width && newCurrentRow)
                           break;
                        sx += width;
                     }

                     if(field) //x >= sx && x < sx + width && newCurrentRow)
                     {
                        if(field == currentField)
                           editData.Activate();
                        /*else
                           newCurrentRow.Edit(currentField);*/
                     }
                     else if(style.noDragging && newCurrentRow)
                       NotifyReclick(master, this, newCurrentRow, mods);
                  }
                  else if(style.noDragging && newCurrentRow)
                    NotifyReclick(master, this, newCurrentRow, mods);
               }
            }
         }
         else
         {
            DataField f = null;
            if(result && style.alwaysEdit && currentRow)
            {
               if(newCurrentRow)
               {
                  DataField field = null;
                  int sx = -scroll.x;
                  int indent = 0;
                  DataRow parent;

                  if(style.collapse && !style.treeBranch)
                     sx += 15;

                  for(parent = newCurrentRow.parent; parent; parent = parent.parent)
                     if(!parent.header)
                        indent += (style.treeBranch) ? 20 : 15;
                  sx += indent;

                  for(field = fields.first; field; field = field.next)
                  {
                     int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
                        clientSize.w - field.x : (field.width + EXTRA_SPACE);

                     if(!field.prev) width -= indent;
                     if(x >= sx && x < sx + width)
                     {
                        f = currentField = field;
                        break;
                     }
                     sx += width;
                  }
               }
            }
            // Moved NotifySelect after setting currentField for the NotifySelect implementation to be aware of which field is now selected (e.g. WatchesView)
            result = NotifySelect(master, this, currentRow, mods);
            if(result && style.alwaysEdit && currentRow)
            {
               // In case the user specifically clicked on a field (f is set), override any change to currentField that NotifySelect could have done
               currentRow.Edit(f ? f : currentField);

               // If the user clicked exactly on the edited field,
               // activate it
               if(editData && editData.visible && newCurrentRow)
               {
                  if(currentField)
                  {
                     editData.Activate();
                  }
                  else if(style.noDragging && newCurrentRow)
                     NotifyReclick(master, this, newCurrentRow, mods);
               }
            }
            else if(style.noDragging && newCurrentRow)
              NotifyReclick(master, this, newCurrentRow, mods);
         }
      }
      /*
         For drop box to capture...
      else
      {
         if(x < 0 || y < 0 || x >= clientSize.w || y >= clientSize.h)
         {
            bool goOn = true;
            master.parent.Activate();
            Update(null);
            ReleaseCapture();
            return true;
         }
      }
      */
      if(result)
      {
         if(!style.noDragging)
         {
            dragging = true;
            Capture();
         }
         if(x >= 0 && y >= 0 && x < clientSize.w && y < clientSize.h)
            rolledOver = true;
         Update(null);
      }
      else
      {
         dragging = false;
         OnLeftButtonUp(x, y, mods);
      }
      return result;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      return OnButtonDown(x,y, mods, false);
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(resizingField && style.alwaysEdit)
      {
         Window::FreeMouseRange();
         ReleaseCapture();
         resizingField = null;
      }

      if(dragRow || editRow)
      {
         DataRow row, switchRow = rows.last;
         int rowY = (style.header) ? rowHeight : 0;
         while(switchRow.lastRow) switchRow = switchRow.lastRow;
         for(row = firstRowShown; row; row = row.GetNextRow())
         {
            rowY += rowHeight;
            if(rowY > y)
            {
               switchRow = row;
               break;
            }
         }
         if(editRow == switchRow && y >= 0)
         {
            // Find which field
            DataField field;
            int fieldX = 0;
            for(field = fields.first; field; field = field.next)
            {
               int width = (!field.next && style.fillLastField && (!hasHorzScroll || clientSize.w - field.x > field.width + EXTRA_SPACE)) ?
                  clientSize.w - field.x : (field.width + EXTRA_SPACE);
               fieldX += width;

               if(fieldX > x + scroll.x)
                  break;
            }

            if(field && field.editable)
            {
               // true: destroy edit box
               HideEditBox(true, true, false);
               PopupEditBox(field, false);
            }
            else if(!style.noDragging)
               NotifyReclick(master, this, currentRow, mods);
         }
         else if(style.moveRows && switchRow)
         {
            if(dragRow == switchRow && movedRow == false)
            {
               DataRow row = dragRow;
               DataRow selRow;
               if(!(mods.ctrl))
               {
                  for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                     selRow.selectedFlag = unselected;
               }
               else
               {
                  for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                  {
                     if(selRow != clickedRow)
                     {
                        if(selRow.selectedFlag == tempUnselected) selRow.selectedFlag = selected;
                        else if(selRow.selectedFlag == tempSelected) selRow.selectedFlag = unselected;
                     }
                  }
               }
               if(mods.ctrl)
               {
                  if(row.selectedFlag)
                     row.selectedFlag = tempUnselected;
                  else row.selectedFlag = tempSelected;
               }
               else
                  row.selectedFlag = tempSelected;
               clickedRow = row;
            }
            else
            {
               if(style.multiSelect)
               {
                  if(!switchRow.selectedFlag)
                  {
                     bool foundSwitch = false;
                     bool after = false;
                     DataRow next;
                     DataRow afterRow = switchRow.prev;
                     for(row = rows.first; row; row = next)
                     {
                        next = row.GetNextRow();
                        if(row.selectedFlag == selected || row.selectedFlag == tempSelected)
                        {
                           if(!foundSwitch && !after)
                           {
                              after = true;
                              afterRow = switchRow;
                           }
                           if(!after || !(row.selectedFlag == selected || row.selectedFlag == tempSelected) ||
                              !foundSwitch)
                           {
                              row.Move(afterRow);
                              afterRow = row;
                           }
                        }
                        else if(row == switchRow)
                           foundSwitch = true;
                     }
                  }
               }
               else
               {
                  for(row = rows.first; row; row = row.GetNextRow())
                  {
                     if(row == switchRow || row == dragRow)
                        break;
                  }

                  // Switch row first: move before
                  if(row == switchRow)
                  {
                     DataRow actualMoveRow;

                     if(!switchRow.prev && switchRow.parent == dragRow.parent)
                        actualMoveRow = null;
                     else
                     {
                        actualMoveRow = switchRow.prev ? switchRow.prev : switchRow;
                        while(actualMoveRow && actualMoveRow.parent != dragRow.parent && actualMoveRow.parent)
                           actualMoveRow = actualMoveRow.parent;
                     }

                     if(!actualMoveRow || (actualMoveRow && actualMoveRow.parent == dragRow.parent))
                        if(NotifyMove(master, this, actualMoveRow, mods))
                        {
                           dragRow.Move(actualMoveRow);
                           NotifyMoved(master, this, actualMoveRow, mods);
                        }
                  }
                  // Dragged row first: move after
                  else
                  {
                     DataRow actualMoveRow = switchRow;
                     DataRow nextRow = switchRow.GetNextRow();

                     while(nextRow && nextRow.parent != dragRow.parent)
                        nextRow = nextRow.parent ? nextRow.parent.next : null;
                     if(nextRow)
                        actualMoveRow = nextRow.prev;

                     if(!nextRow)
                        actualMoveRow = dragRow.parent ? dragRow.parent.subRows.last : rows.last;

                     if(!actualMoveRow || (actualMoveRow != dragRow && actualMoveRow.parent == dragRow.parent))
                        if(NotifyMove(master, this, actualMoveRow, mods))
                        {
                           dragRow.Move(actualMoveRow);
                           NotifyMoved(master, this, actualMoveRow, mods);
                        }
                  }
               }
            }
         }
         if(dragRow)
            ReleaseCapture();
         dragRow = null;
         editRow = null;
         movedRow = false;
         dropIndex = -1;
         Update(null);
      }

      timer.Stop();
      if(dragging || style.freeSelect)
      {
         if(dragging)
         {
            rolledOver = dragging = false;
         }
         if(x >= 0 && y >= 0 && x < clientSize.w && y < clientSize.h && currentRow && style.freeSelect)
         {
            bool result;
            ReleaseCapture();
            result = NotifySelect(master, this, currentRow, mods);
            if(style.alwaysEdit)
               currentRow.Edit(currentField);
            return result;

         }
         // if(!(style.freeSelect))
         ReleaseCapture();
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      int rowStart = -scroll.x;
      DataRow row;
      int rowY = (style.header) ? rowHeight : 0;
      int plusIndent = 0;
      bool result = true;

      OnLeftButtonUp(x,y,mods);
      if(style.alwaysEdit)
      {
         if(!(style.collapse) || x > 15)
            if(editData && editData.visible)
            {
               editData.Activate();
               result = NotifyDoubleClick(master, this, x, y, mods);
            }
      }
      if(result)
      {
         for(row = firstRowShown; row; row = row.GetNextRow())
         {
            rowY += rowHeight;
            if(rowY > y || (style.multiSelect && !row.GetNextRow()))
            {
               if(style.treeBranch)
               {
                  DataRow parent;
                  for(parent = (style.rootCollapse) ? row.parent : (row.parent ? row.parent.parent : null); parent; parent = parent.parent)
                     if(!parent.header)
                        plusIndent += 20;
                  plusIndent += 4;
               }
               break;
            }
         }

         if((row && style.collapse && (x >= rowStart && x <= rowStart + 18 + plusIndent)) ||
            (result = NotifyDoubleClick(master, this, x, y, mods)))
         {
            if(style.collapse && row && row.subRows.first)
            {
               row.collapsed = !row.collapsed;
               result = false;
            }
         }
      }
      return result;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      return OnButtonDown(x,y, mods, true);
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      OnLeftButtonUp(x,y,mods);
      return NotifyRightClick(master, this, x, y, mods);
   }

   bool GoToLetter(unichar ch, bool keyHit)
   {
      bool result = false;
      DataField field;
      bool checkNextField = true;
      int len = keyHit ? 0 : strlen(typedString);

      typedString = renew typedString char[len + 2];
      typedString[len++] = (char)tolower(ch);         // TODO: FIX UNICODE
      typedString[len] = '\0';

      for(field = fields.first; field; field = field.next)
      {
         DataRow startRow = currentRow ? currentRow : rows.first;

         if(startRow && field.dataType && field.dataType._vTbl[__ecereVMethodID_class_OnGetString] && ch)
         {
            DataRow row, next;
            bool looped = false;
            if(len == 1 && currentRow)
               startRow = (next = startRow.GetNextRow(), (next ? next : rows.first));

            for(row = startRow; row != startRow || !looped; next = row.GetNextRow(), row = next ? next : rows.first)
            {
               void * data = row.GetData(field);
               char tempString[1024] = "";
               bool needClass = false;
               const char * string = data ? ((const char *(*)(void *, void *, char *, void *, bool *))(void *)field.dataType._vTbl[__ecereVMethodID_class_OnGetString])(field.dataType, data, tempString, null, &needClass) : null;

               if(string && string[0])
                  checkNextField = false;
               if(string && string[0] && !strnicmp(string, typedString, len))
               {
                  if(style.multiSelect)
                  {
                     DataRow selRow;

                     clickedRow = row;
                     for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                        selRow.selectedFlag = unselected;
                     row.selectedFlag = selected;
                  }
                  SetCurrentRow(row, true);
                  result = true;
                  break;
               }
               looped = true;
            }
            typingTimer.Stop();
            if(typingTimeOut && !keyHit)
               typingTimer.Start();
            if(!result || !typingTimeOut || keyHit)
               typedString[len-1] = '\0';
         }
         if(!checkNextField || result) break;
      }
      return result;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      DataField field;

      if(key == enter || key == keyPadEnter)
      {
         if(editData && editData.visible && editData.active)
         {
            HideEditBox(true, false, false);
            return false;
         }
      }
      else if(key == escape)
      {
         if(resizingField || movingFields || (editData && editData.visible) || dragRow)
         {
            if(editData && editData.visible && style.alwaysEdit && !editData.active)
               return true;
            // false: dont destroy edit box
            HideEditBox(false, false, false);
            if(resizingField)
            {
               resizingField.width = startWidth;
               AdaptToFieldWidth(resizingField, true);
               resizingField = null;
               ReleaseCapture();
            }
            if(dragRow)
               ReleaseCapture();

            dragRow = null;
            if(dragging)
            {
               dragging = false;
               ReleaseCapture();
            }

            movingFields = false;
            draggingField = null;
            Update(null);
            return false;
         }
      }

      if(!currentField || !currentField.editable)
         for(field = fields.first; field; field = field.next)
         {
            if(field.editable)
            {
               currentField = field;
               break;
            }
         }
      if((key == f2 || (style.alwaysEdit && (key == ctrlV || key == ctrlC || key == ctrlX || key == shiftInsert || key == ctrlInsert || key == shiftDel))) &&
            currentField && currentField.editable)
      {
         PopupEditBox(currentField, false);
         if(editData && editData.visible)
         {
            if(style.alwaysEdit)
            {
               editData.Activate();
               if(key == ctrlV || key == ctrlC || key == ctrlX || key == shiftInsert || key == ctrlInsert || key == shiftDel)
               {
                  editData.OnKeyHit(key, ch);
                  StopEditing(true);
               }
               else
                  // For Installer to pop up file dialog
                  NotifyKeyDown(master, this, currentRow, key, ch);
            }
            return false;
         }
      }

      if(!NotifyKeyDown(master, this, currentRow, key, ch))
         return false;

      // Editable fields...
      if(currentField)
      {
         if(style.alwaysEdit && editData && editData.visible)
            return editData.OnKeyDown(key, ch);
         return true;   // We want to pick up the OnKeyHit to replace contents, but skip GoToLetter
      }

      if(ch >=32 && ch != 128 && !key.alt && !key.ctrl && GoToLetter(ch, false))
      {
         /*if(inactive && window.state != Hidden)
            NotifyHighlight(master, this, currentRow, 0);
         else
         {
            NotifySelect(master, this, currentRow, 0);
         }*/
         return false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(!ch && !key.alt && !key.ctrl)
      {
         key.code = (SmartKey)key.code;
      }
      if(ch >= 32 && !key.alt && !key.ctrl && ch != 128)
      {
         DataField field;
         if(!currentField || !currentField.editable)
            for(field = fields.first; field; field = field.next)
            {
               if(field.editable)
               {
                  currentField = field;
                  break;
               }
            }
         if(currentField && currentField.editable)
         {
            if((!editData || !editData.visible) || !editData.active)
            {
               PopupEditBox(currentField, false);
               if(editData && editData.visible)
               {
                  editData.Activate();
                  editData.OnKeyHit(key, ch);
               }
            }
            return false;
         }
      }

      if(editData && editData.visible && ch && !key.alt && !key.ctrl && editData.active && (key.code != tab || (editData._class == class(EditBox) && ((EditBox)editData).tabKey)))
         return false;

      if(!key.alt && (style.multiSelect || !key.ctrl))
      {
         switch(key.code)
         {
            case left:
               if(style.alwaysEdit)
               {
                  if(currentField)
                  {
                     DataField field;
                     for(field = currentField.prev; field; field = field.prev)
                     {
                        if(field.editable)
                        {
                           currentField = field;
                           HideEditBox(true, true, false);
                           PopupEditBox(currentField, false);
                           return false;
                        }
                     }
                  }
               }
               if(style.collapse && currentRow /*&& !currentField*/)  // THIS PREVENTED COLLAPSING THE PROPERTY SHEET
               {
                  if(currentRow.subRows.first && !currentRow.collapsed)
                  {
                     currentRow.collapsed = true;
                  }
                  else if(currentRow.parent)
                     SetCurrentRow(currentRow.parent, true);
                  return false;
               }
               break;
            case right:
               if(style.collapse && currentRow && currentRow.subRows.first)
               {
                  if(currentRow.collapsed)
                     currentRow.collapsed = false;
                  else
                     SetCurrentRow(currentRow.subRows.first, true);
                  return false;
               }
               else if(style.alwaysEdit)
               {
                  if(currentField)
                  {
                     DataField field;
                     for(field = currentField.next; field; field = field.next)
                     {
                        if(field.editable)
                        {
                           currentField = field;
                           HideEditBox(true, true, false);
                           PopupEditBox(currentField, false);
                           break;
                        }
                     }
                  }
               }
               break;
            case down: case up:
            case pageDown: case pageUp:
            case end: case home:
            {
               int headerSize = ((style.header) ? rowHeight : 0);
               int height = clientSize.h + 1 - headerSize;
               DataRow oldRow;

               // true: destroy edit box
               // !!! TESTING true HERE !!!
               HideEditBox(true, true, false);
               // HideEditBox(false, true, false);

               oldRow = currentRow;

               SNAPDOWN(height, rowHeight);
               if((!currentRow || key.code == home) && key.code != end)
               {
                  currentRow = rows.first;
               }
               else
               {
                  DataRow next;
                  switch(key.code)
                  {
                     case down:
                        if(!(style.multiSelect) && currentRow && !currentRow.selectedFlag)
                           next = currentRow;
                        else
                           next = currentRow.GetNextRow();
                        if(next)
                        {
                           currentRow = next;
                        }
                        break;
                     case up:
                        if(!(style.multiSelect) && currentRow && !currentRow.selectedFlag)
                           next = currentRow;
                        else
                           next = currentRow.GetPrevRow();

                        if(next)
                        {
                           currentRow = next;
                        }
                        break;
                     case end:
                        currentRow = lastRow.GetLastRow();
                        break;
                     case pageUp:
                     {
                        int c;
                        for(c = 0;
                        currentRow && (next = currentRow.GetPrevRow()) && c < height / rowHeight;
                            c++, currentRow = next);
                        break;
                     }
                     case pageDown:
                     {
                        int c;
                        for(c = 0;
                            currentRow && (next = currentRow.GetNextRow()) && c < height / rowHeight;
                            c++, currentRow = next);
                        break;
                     }
                  }
               }
               if(currentRow && currentRow.index * rowHeight > scroll.y + height - rowHeight)
                  SetScrollPosition(scroll.x, currentRow.index * rowHeight - height + rowHeight);
               else if(!currentRow || currentRow.index * rowHeight < scroll.y)
                  SetScrollPosition(scroll.x, currentRow ? currentRow.index * rowHeight : 0);

               if(style.multiSelect)
               {
                  DataRow selRow;

                  if(!(key.shift) && (key.ctrl))
                  {
                     DataRow row;
                     for(row = rows.first; row; row = row.GetNextRow())
                     {
                        if(row.selectedFlag == tempSelected)
                           row.selectedFlag = selected;
                        else if(row.selectedFlag == tempUnselected)
                           row.selectedFlag = unselected;
                     }
                  }

                  if(!(key.ctrl))
                  {
                     for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                        selRow.selectedFlag = unselected;
                  }
                  else
                  {
                     for(selRow = rows.first; selRow; selRow = selRow.GetNextRow())
                     {
                        if(selRow.selectedFlag == tempUnselected) selRow.selectedFlag = selected;
                        else if(selRow.selectedFlag == tempSelected) selRow.selectedFlag = unselected;
                     }
                  }

                  if(key.shift)
                  {
                     if(currentRow.index >= clickedRow.index)
                     {
                        for(selRow = clickedRow; selRow; selRow = selRow.GetNextRow())
                        {
                           if(key.ctrl)
                           {
                              if(selRow.selectedFlag) selRow.selectedFlag = tempUnselected; else selRow.selectedFlag = tempSelected;
                           }
                           else
                              selRow.selectedFlag = selected;
                           if(selRow == currentRow)
                              break;
                        }
                     }
                     else
                     {
                        for(selRow = currentRow; selRow; selRow = selRow.GetNextRow())
                        {
                           if(key.ctrl)
                           {
                              if(selRow.selectedFlag) selRow.selectedFlag = tempUnselected; else selRow.selectedFlag = tempSelected;
                           }
                           else
                              selRow.selectedFlag = selected;
                           if(selRow == clickedRow)
                              break;
                        }
                     }
                  }
                  else
                  {
                     if(!(key.ctrl) && currentRow)
                     {
                        currentRow.selectedFlag = selected;
                     }

                     clickedRow = currentRow;
                  }
               }
               else
               {
                  if(oldRow) oldRow.selectedFlag = unselected;
                  if(currentRow) currentRow.selectedFlag = selected;
               }

               if(currentRow)
               {
                  if(style.freeSelect)
                     NotifyHighlight(master, this, currentRow, 0);
                  else
                     NotifySelect(master, this, currentRow, 0);

                  if(style.alwaysEdit && currentRow)
                     currentRow.Edit(currentField /*null*/);
               }
               Update(null);
               return false;
            }
            case space:
            {
               if(style.multiSelect && currentRow)
               {
                  if(currentRow.selectedFlag)
                  {
                     if(key.ctrl)
                        currentRow.selectedFlag = unselected;
                  }
                  else
                     currentRow.selectedFlag = selected;
                  Update(null);

                  if(style.freeSelect)
                     NotifyHighlight(master, this, currentRow, 0);
                  else
                     NotifySelect(master, this, currentRow, 0);
               }
               break;
            }
         }
      }

      if(!NotifyKeyHit(master, this, currentRow, key, ch))
         return false;

      if(ch >=32 && ch != 128 && !key.alt && !key.ctrl && GoToLetter(ch, true))
      {
         /*if(inactive && window.state != Hidden)
            return NotifyHighlight(master, this, currentRow, 0);
         else
         {
            return NotifySelect(master, this, currentRow, 0);
         }*/
         return false;
      }
      return true;
   }

   void OnHScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      int y = 0;
      DataRow next;

      for(firstRowShown = rows.first; firstRowShown; firstRowShown = next)
      {
         next = firstRowShown.GetNextRow();
         if(y >= position || !next) break;

         y += rowHeight;
      }
      Update(null);
   }

   OldList fields;
   OldList rows;
   int numFields;
   DataRow firstRowShown;
   DataRow clickedRow;
   DataRow currentRow;
   int width;
   DataField sortField;
   int rowCount;
   int rowHeight;
   int fontH;
   public double typingTimeOut;
   char * typedString;

   int mouseX, mouseY;

   Timer timer
   {
      delay = 0.1;
      userData = this;

      bool DelayExpired()
      {
         Modifiers mods { };
         if(guiApp.GetKeyState(shift)) mods.shift = true;
         if(guiApp.GetKeyState(alt)) mods.alt = true;
         if(guiApp.GetKeyState(control)) mods.ctrl = true;
         OnMouseMove(MAXINT, MAXINT, mods);

         return true;
      }
   };

   Timer typingTimer
   {
      delay = 0.5; // typingTimeOut
      userData = this;

      bool DelayExpired()
      {
         typedString[0] = '\0';

         // The next line was commented... Why? When commented typing words stops working ( only first character jumps )
         typingTimer.Stop();
         return true;
      }
   };

   bool dragging, rolledOver;
   int numSelections;
   Button endBevel;

   // For moving rows
   DataRow dragRow;
   int dropIndex;
   bool movedRow;

   // For editing fields
   DataBox editData;
   DataField currentField;
   DataRow editRow;

   // For moving fields
   DataField draggingField, dropField;
   bool movingFields;

   // For resizing fields
   DataField resizingField;
   int resizeX, oldX, startWidth;

   ListBoxBits style;
   FontResource boldFont;
   int maxShown;

   // Only used for OnMouseMove so far, for avoiding problems with consequential mouse moves
   bool insideNotifySelect;
   ColorAlpha selectionColor, selectionText, stippleColor;
   stippleColor = 0xFFFFFF80;
};
