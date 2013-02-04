#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "EDA.ec"
import "gui"

default:
extern int __ecereVMethodID_class_OnGetString;
extern int __ecereVMethodID_class_OnCompare;
extern int __ecereVMethodID_class_OnUnserialize;
extern int __ecereVMethodID_class_OnSerialize;
extern int __ecereVMethodID_class_OnFree;

static void UnusedFunction()
{
   int a;
   a.OnGetString(0,0,0);
   a.OnFree();
   a.OnCopy(null);
   a.OnCompare(null);
   a.OnSaveEdit(null,0);
   a.OnEdit(null,null,0,0,0,0,0);
   a.OnDisplay(null,0,0,0,0,0,0);
   a.OnGetDataFromString(null);
   a.OnUnserialize(null);
   a.OnSerialize(null);
}
private:

public class Id : uint
{
   class_data Table * table;     class_property Table * table     { set { class_data(table) = value; } get { return class_data(table); } };
   //class_data Field * idField; class_property Field * idField { set { class_data(nameField) = value; } get { return class_data(idField); } };
   //class_data Field * displayField; class_property Field * displayField { set { class_data(displayField) = value; } get { return class_data(displayField); } };
   class_data Field * nameField; class_property Field * nameField { set { class_data(nameField) = value; } get { return class_data(nameField); } };
   class_data char * addText;   class_property char * addText  { set { class_data(addText) = value; } };
   class_data void * Refill;    class_property void * Refill   { set { class_data(Refill) = value; } };

   Window OnEdit(DataBox dataBox, void * obsolete, int x, int y, int w, int h, void * userData)
   {
      if(this || !this) {     // FIXME
         TableDropBox dropBox = dataBox.keepEditor ? (TableDropBox)dataBox.editor /*obsolete*/ : null;
         if(!dropBox)
         {
/*
            if(eClass_IsDerived(dataBox._class, class(FieldDropBox)))
            {
               FieldDropBox fieldDropBox = (FieldDropBox)dataBox;

            }
            else if(eClass_IsDerived(dataBox._class, class(FieldBox)))
            {
               FieldBox fieldBox = (FieldBox)dataBox;

            }
*/

            dropBox = TableDropBox
            {
               dataBox, borderStyle = 0, anchor = { 0, 0, 0, 0 }, 
               modifyVirtualArea = false, activeStipple = false;
               showNone = true;
               nameField = *class_data(nameField);
               table = *class_data(table);

               bool DataBox::NotifySelect(DropBox control, DataRow row, Modifiers mods)
               {
                  uint id = row ? row.tag : 0;
                  SetData(&id, mods.closingDropDown);
                  return true;
               }

               bool DataBox::NotifyTextEntry(DropBox _dropBox, char * string, bool confirmed)
               {
                  TableDropBox dropBox = (TableDropBox)_dropBox;
                  //Table tbl = dropBox.table.db.OpenTable(dropBox.table.name, { tableRows });
                  //if(tbl)
                  {
                     /*FieldIndex indexedFields[1];
                     Row r { };*/
                     char * trimmed = new char[strlen(string) + 1];
                     /*indexedFields[0] = { dropBox.nameField };
                     tbl.GenerateIndex(1, indexedFields, false);
                     r.tbl = tbl;*/
                     DataRow row = null;

                     TrimLSpaces(string, trimmed);
                     TrimRSpaces(trimmed, trimmed);

                     /*if(r.Find(dropBox.nameField, middle, nil, trimmed))
                     {
                        if(dropBox.filterField)
                        {
                           // TODO: Improve this... Multi field?
                           while(true)
                           {
                              DataRow row;
                              Id id = 0;
                              Field fldId = dropBox.table.FindField(defaultIdField);
                              r.GetData(fldId, id);
                              row = dropBox.FindSubRow(id);
                              if(row)
                              {
                                 dropBox.SelectRow(row);
                                 break;
                              }
                              //if(!r.Find(dropBox.nameField, next, nil, trimmed))
                              if(!r.Next())
                                 break;
                           }
                        }
                        else
                        {
                           Id id = 0;
                           Field fldId = dropBox.table.FindField(defaultIdField);
                           r.GetData(fldId, id);
                           dropBox.SelectRow(dropBox.FindSubRow(id));
                        }
                     }
                     */

                     {
                        for(row = dropBox.firstRow; row; row = row.next)
                        {
                           char * string = row.string;
                           if(string && !strcmp(trimmed, string))
                              break;
                        }
                     }
                     if(row)
                     {
                        dropBox.SelectRow(row);
                     }
                     else
                     {
                        dropBox.changeContents = false;
                        dropBox.contents = trimmed;
                        dropBox.SelectRow(null);
                        dropBox.changeContents = true;
                     }
                     //delete r;
                  }
                  return true;
               }
            };
            if(class_data(Refill))
               dropBox.Refill = class_data(Refill);

            // dropBox.Refill();
         }
         dataBox.OnConfigure(dropBox);
         dropBox.Create();
         dropBox.currentRow = dropBox.FindSubRow(this);
         if(!dropBox.currentRow && this)
            dataBox.SetData((uint *)&this, false);
         {
            DataRow r = dropBox.currentRow;
            if(r)
               for(r = r.parent; r; r = r.parent)
                  r.collapsed = false;
         }
         return dropBox;
      }
      return null;
   }

   char * OnGetString(char * tempString, void * fieldData, bool * needClass)
   {
      if(&this)
      {
         // FIXME
         Table tbl = *class_data(table);
         Field idField = tbl.FindField(defaultIdField);
         Row r;
         idRowCacheMutex.Wait();
         if(!tbl.cachedIdRow)
         {
            tbl.cachedIdRow = Row { tbl };
            incref tbl.cachedIdRow;
         }
         r = tbl.cachedIdRow;

         if(this)
         {
            if(r.Find(idField, middle, nil, this))
            {
               String name = null;
               Field * nameField = class_data(nameField);
               if(nameField)
               {
#ifdef _DEBUG
                  char * fn = nameField->name;
#endif
                  // Get name data from row
                  int64 data = 0;
                  Class type = nameField->type;
                  if(type.type == unitClass && !type.typeSize)
                  {
                     Class dataType = eSystem_FindClass(type.module, type.dataTypeString);
                     if(dataType)
                        type = dataType;
                  }
                  if(type.type == structClass)
                     data = (int64)new0 byte[type.structSize];
                  ((bool (*)())(void *)r.GetData)(r, *nameField, type, (type.type == structClass) ? (void *)data : &data);

                  if(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass)
                     name = (String)type._vTbl[__ecereVMethodID_class_OnGetString](type, (void *)&data, tempString, null, null);
                  else
                     name = (String)type._vTbl[__ecereVMethodID_class_OnGetString](type, (void *)data, tempString, null, null);

                  strcpy(tempString, name ? name : "");
                  if(!(type.type == systemClass || type.type == unitClass || type.type == bitClass || type.type == enumClass))
                     type._vTbl[__ecereVMethodID_class_OnFree](type, data);
               }
               else
               {
                  PrintLn("Id::OnGetString -- data type"/*, this._class.name, */" has no class_data(nameField)");
               }
            }
            else
               sprintf(tempString, "(Invalid %s entry: %d)", tbl.name, this);
         }
         else
         {
            sprintf(tempString, $"(Click to add a new %s...)", $"item"/*class_data(addText)*/);
         }
         // delete r;
         idRowCacheMutex.Release();
      }
      return tempString;
   }
}

public class IdList
{
public:
   int count;
   Id * ids;
   class_data Class type;
   class_property Class type
   {
      set {  class_data(type) = value; }
      get { return class_data(type); }
   };

   public void Clear()
   {
      if(this)
      {
         delete ids;
         count = 0;
      }
   }
   
   public bool Includes(Id id)
   {
      if(this)
      {
         int c;
         for(c = 0; c < count; c++)
            if(ids[c] == id) 
               return true;
      }
      return false;
   }

   public bool Add(Id id)
   {
      int c;
      for(c = 0; c < count; c++)
         if(ids[c] == id) break;
      if(c == count)
      {
         ids = renew ids Id[count + 1];
         ids[count] = id;
         count++;
         return true;
      }
      return false;
   }

   public bool Delete(Id id)
   {
      int c;
      for(c = 0; c < count; c++)
         if(ids[c] == id)
         {
            if(c < count - 1)
               memcpy(ids + c, ids + c + 1, (count - 1 - c) * sizeof(Id));
            ids = renew ids Id[count - 1];
            count--;
            return true;
         }
      return false;
   }

   void OnUnserialize(IOChannel channel)
   {
      int c, count;

      this = null;

      channel.Unserialize(count);
      if(count != MAXDWORD)
      {
         IdList idList = eInstance_New(_class); //IdList { };
         idList.count = count;
         idList.ids = new Id[count];
         for(c = 0; c < count; c++)
         {
            Id id;
            channel.Unserialize(id);
            //Add(id);
            idList.ids[c] = id;
         }
         this = idList;
      }
   }

   void OnSerialize(IOChannel channel)
   {
      if(this)
      {
         int c;
         channel.Serialize(count);
         for(c = 0; c < count; c++)
            channel.Serialize(ids[c]);
      }
      else
      {
         Id none = MAXDWORD;
         channel.Serialize(none);
      }
   }
   /*
   void OnDisplay(Surface surface, int x, int y, int width, void * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {

   }
   */
   
   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      stringOutput[0] = 0;
      if(this)
      {
         int c;
         for(c = 0; c<count; c++)
         {
            char tempString[256];
            Class type = class_data(type);
            if(c) strcat(stringOutput, ", ");

            if(type)
               type._vTbl[__ecereVMethodID_class_OnGetString](type, &ids[c], tempString, null, null);
            // strcatf(stringOutput, "%d", ids[c]);
            strcat(stringOutput, tempString);
         }
      }
      return stringOutput;
   }

   bool OnGetDataFromString(char * string)
   {
      char value[256];
      this = IdList { };
      while(GetAlNum(&string, value, sizeof(value)))
         if(isdigit(value[0]))
            Add(atoi(value));
      return true;
   }

   int OnCompare(IdList b)
   {
      if(!this && !b) return 0;
      else if(this && !b) return 1;
      else if(!this && b) return -1;
      else if(count > b.count) return 1;
      else if(count < b.count) return -1;
      else
      {
         int c;
         for(c = 0; c<count; c++)
         {
            int idA = ids[c], idB = b.ids[c];
            if(idA > idB) return 1;
            else if(idA < idB) return -1;
         }         
      }
      return 0;
   }

   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      ListBox list
      {
         dataBox,
         borderStyle = 0,
         alwaysEdit = true,
         anchor = { 0, 0, 0, 0 };

         bool DataBox::NotifyChanged(ListBox listBox, DataRow row)
         {
            Id id = row.GetData(null);
            if(!id)
            {
               if(row.next)
                  listBox.DeleteRow(row);
            }            
            else
            {
               if(row == listBox.lastRow)
               {
                  row = listBox.AddRow();
                  row.SetData(null, 0);
                  listBox.scroll.y = listBox.scrollArea.h;
               }
               else if(row.next == listBox.lastRow)
                  listBox.scroll.y = listBox.scrollArea.h;
            }
            Modified();
            return true;
         }
      };

      int c;
      DataRow r;
      /*if(!this)
         this = eInstance_New(_class);
         */
      if(this || !this)    // FIXME
      {
         Class type = class_data(type);
         list.AddField({ type, editable = true });
      }
      for(c = 0; c < (this ? count : 0); c++)
      {
         r = list.AddRow();
         r.SetData(null, ids[c]);
      }
      r = list.AddRow();
      r.SetData(null, 0);
      list.Create();
      list.modifiedDocument = false;
      return list;
   }

   bool OnSaveEdit(Window window, void * object)
   {
      ListBox list = (ListBox) window;
      if(list.modifiedDocument)
      {
         DataRow r;
         if(!this)
            this = eInstance_New(_class);
         Clear();
         for(r = list.firstRow; r; r = r.next)
         {
            Id id = r.GetData(null);
            if(id)
               Add(id);         
         }
         return true;
      }
      return false;
   }
   
   ~IdList()
   {
      delete ids;
   }
}

static void FreeString(String string)
{
   delete string;
}

public class StringList
{
   StringBinaryTree strings
   {  
      CompareKey = (void *)BinaryTree::CompareString;
      FreeKey = (void *)FreeString;
   };

   void Clear()
   {
      strings.Free();
   }
   
   bool Includes(String string)
   {
      return strings.FindString(string) != null;
   }

   bool Add(String string)
   {
      BTNode node { key = (uintptr)CopyString(string) };
      if(strings.Add(node))
         return true;
      else
      {
         FreeString((String)node.key);
         delete node;
      }
      return false;
   }

   bool Delete(String string)
   {
      BTNode node = strings.FindString(string);
      if(node)
      {
         strings.Delete(node);
         return true;
      }
      return false;
   }

   void _OnUnserialize(IOChannel channel)
   {
      channel.Get(strings);
   }
   
   void OnUnserialize(IOChannel channel)
   {
      this = eInstance_New(class(StringList));
      _OnUnserialize(channel);
   }

   void OnSerialize(IOChannel channel)
   {
      channel.Put(strings);
   }

   int OnCompare(StringList b)
   {
      BTNode nodeA = strings.first, nodeB = b.strings.first;
      for(; nodeA || nodeB; nodeA = nodeA ? nodeA.next : null, nodeB = nodeB ? nodeB.next : null)
      {
         int result;
         if(nodeA && !nodeB) return 1;
         else if(nodeB && !nodeA) return -1;
         else
         {
            result = strcmp((char *)nodeA.key, (char *)nodeB.key);
            if(result) return result;
         }
      }         
      return 0;
   }

   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      ListBox list
      {
         dataBox,
         borderStyle = 0,
         alwaysEdit = true,
         anchor = { 0, 0, 0, 0 };

         bool OnKeyHit(Key key, unichar ch)
         {
            return (key == enter) ? false : ListBox::OnKeyHit(key, ch);
         }
         
         bool DataBox::NotifyChanged(ListBox listBox, DataRow row)
         {
            String string = row.GetData(null);
            if(!string || !string[0])
            {
               if(row.next)
               {
                  listBox.DeleteRow(row);
                  listBox.firstChild.Activate();
               }
            }            
            else
            {
               if(row == listBox.lastRow)
               {
                  row = listBox.AddRow();
                  row.SetData(null, null);
                  listBox.scroll.y = listBox.scrollArea.h;
               }
               else
               {
                  row = row.next;
                  /*
                  if(row.next == listBox.lastRow)
                     listBox.scroll.y = listBox.scrollArea.h;
                  */
               }
               listBox.SelectRow(row);
            }
            Modified();
            return true;
         }

         bool DataBox::NotifyEdited(ListBox listBox, DataRow row)
         {
            listBox.firstChild.Activate();
            return true;
         }

         bool DataBox::NotifyModified(ListBox listBox, DataRow row)
         {
            String string = row.GetData(null);
            if(!string || !string[0])
            {
               if(row.next)
               {
                  listBox.DeleteRow(row);
                  listBox.firstChild.Activate();
               }
            }            
            else
            {
               if(row == listBox.lastRow)
               {
                  row = listBox.AddRow();
                  row.SetData(null, null);
                  listBox.scroll.y = listBox.scrollArea.h;
               }
               else if(row.next == listBox.lastRow)
                  listBox.scroll.y = listBox.scrollArea.h;
            }
            Modified();
            return true;
         }
      };

      BTNode node;
      DataRow r;
      
      /*
      {
         if(!this)
            this = eInstance_New(_class);
      }
      */

      if(this || !this)    // FIXME
      {
      list.AddField({ class(char *), editable = true });
      }
      for(node = strings.first; node; node = node.next)
      {
         r = list.AddRow();
         r.SetData(null, (String)node.key);
      }
      r = list.AddRow();
      r.SetData(null, null);
      list.Create();
      list.modifiedDocument = false;
      return list;
   }

   bool OnSaveEdit(Window window, void * object)
   {
      ListBox list = (ListBox) window;
      if(list.modifiedDocument)
      {
         
         DataRow r;
         if(list.activeChild)
            ((DataBox)list.activeChild).SaveData();

         if(!this)
            this = eInstance_New(_class);

         // TODO: Fix how to get the data box...
         Clear();
         for(r = list.firstRow; r; r = r.next)
         {
            String string = r.GetData(null);
            if(string)
            {
               Add(string);
            }
         }
         return true;
      }
      return false;
   }
   
   ~StringList()
   {
      strings.Free();
   }
}

public class FixedMultiLineString : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      // Don't show the editbox right away so that the text is highlighted by default
      char * string = "";
      EditBox editBox
      {
         dataBox, visible = false,
         borderStyle = 0,
         textHorzScroll = true,
         modifyVirtualArea = false,
         anchor = { 0, 0, 0, 0 };
         multiLine = true;

         void DataBox::NotifyUpdate(EditBox editBox)
         {
            Modified();          
            modifiedDocument = true;
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

public class CIString : String
{
   
}

public class MultiLineString : String
{
   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      // Don't show the editbox right away so that the text is highlighted by default
      char * string = "";
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

public struct DataList : OldList
{
   class_data Class type;
   class_data char * typeName;
   // class_property Class type { set { class_data(type) = value; } };
   class_property char * type { set { class_data(typeName) = value; } };
   class_property Class dataType { get { return class_data(type); } };

   void OnUnserialize(IOChannel channel)
   {
      Class type;
      if(!class_data(type))
         class_data(type) = eSystem_FindClass(__thisModule.application, class_data(typeName));
      type = class_data(type);
      
      this = { };

      while(true)
      {
         bool truth;
         OldLink link;
         channel.Unserialize(truth);
         if(!truth) break;
         link = OldLink { };

         if(type)
         {
            if(type.type == structClass)
               link.data = new0 byte[type.structSize];
            type._vTbl[__ecereVMethodID_class_OnUnserialize](type, (type.type == structClass) ? link.data : &link.data, channel);
         }
         Add(link);
      }
   }

   void OnSerialize(IOChannel channel)
   {
      OldLink node = first;
      Class type;
      if(!class_data(type))
         class_data(type) = eSystem_FindClass(__thisModule.application, class_data(typeName));
      type = class_data(type);

      while(true)
      {
         bool truth = true;
         if(node)
         {
            channel.Serialize(truth);
            if(type.type == bitClass || type.type == unitClass || (type.type == systemClass && type.typeSize))
               type._vTbl[__ecereVMethodID_class_OnSerialize](type, &node.data, channel);
            else
               type._vTbl[__ecereVMethodID_class_OnSerialize](type, node.data, channel);
            node = node.next;
         }
         else
         {
            truth = false;
            channel.Serialize(truth);
            node = null;
         }
         if(!node) break;
      }
   }

   int OnCompare(DataList b)
   {
      OldLink nodeA = first, nodeB = b.first;
      for(; nodeA || nodeB; nodeA = nodeA ? nodeA.next : null, nodeB = nodeB ? nodeB.next : null)
      {
         int result;
         if(nodeA && !nodeB) return 1;
         else if(nodeB && !nodeA) return -1;
         else
         {
            Class type = class_data(type);
            result = type._vTbl[__ecereVMethodID_class_OnCompare](type, 
               (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &nodeA.data : (void *)nodeA.data,
               (type.type == systemClass || type.type == bitClass || type.type == enumClass || type.type == unitClass) ? &nodeB.data : (void *)nodeB.data);
            if(result) return result;
         }
      }         
      return 0;
   }

   Window OnEdit(DataBox dataBox, DataBox obsolete, int x, int y, int w, int h, void * userData)
   {
      ListBox list
      {
         dataBox,
         borderStyle = 0,
         alwaysEdit = true,
         anchor = { 0, 0, 0, 0 };

         bool OnKeyHit(Key key, unichar ch)
         {
            return (key == enter) ? false : ListBox::OnKeyHit(key, ch);
         }
         
         bool DataBox::NotifyChanged(ListBox listBox, DataRow row)
         {
            Class type = ((subclass(DataList))this.type).dataType;
            if(type.type == normalClass && !strcmp(type.dataTypeString, "char *"))
            {
               String string = row.GetData(null);
               if(!string || !string[0])
               {
                  /*if(row.next)
                  {
                     listBox.DeleteRow(row);
                     listBox.firstChild.Activate();
                  }*/
               }            
               else
               {
                  if(row == listBox.lastRow)
                  {
                     /*row = listBox.AddRow();
                     row.SetData(null, null);
                     listBox.scroll.y = listBox.scrollArea.h;*/
                  }
                  else
                  {
                     row = row.next;
                  }
                  listBox.SelectRow(row);
               }
               //Modified();
            }
            return true;
         }
         /*
         bool DataBox::NotifyModified(ListBox listBox, DataRow row)
         {
            Class type = ((subclass(DataList))this.type).dataType;
            if(type.type == normalClass && !strcmp(type.dataTypeString, "char *"))
            {
               String string = row.GetData(null);
               if(!string || !string[0])
               {
                  if(row.next)
                  {
                     listBox.DeleteRow(row);
                     listBox.firstChild.Activate();
                  }
               }            
               else
               {
                  if(row == listBox.lastRow)
                  {
                     row = listBox.AddRow();
                     row.SetData(null, null);
                     listBox.scroll.y = listBox.scrollArea.h;
                  }
                  else if(row.next == listBox.lastRow)
                     listBox.scroll.y = listBox.scrollArea.h;
               }
               Modified();
            }
            return true;
         }
         */
         bool DataBox::NotifyEditing(ListBox listBox, DataRow row)
         {
            Class type = ((subclass(DataList))this.type).dataType;
            DataBox editData = (DataBox)listBox.firstChild;
            // if(type.type != normalClass || strcmp(type.dataTypeString, "char *"))
            {
               if(type)
               {
                  if(type.type == normalClass && !*(void **)editData.data && strcmp(type.dataTypeString, "char *"))
                  {
                     *(void **)editData.data = eInstance_New(type);
                     row.SetData(null, *(void **)editData.data);
                  }
               }

               if(row == listBox.lastRow)
               {
                  listBox.alwaysEdit = false;
                  if(type.type == normalClass || type.type == structClass || type.type == noHeadClass)
                     listBox.AddRow().SetData(null, null);
                  else
                     listBox.AddRow().SetData(null, 0);
                  listBox.scroll.y = listBox.scrollArea.h;
                  listBox.alwaysEdit = true;
               }
            }            
            return true;
         }

         bool DataBox::NotifyEdited(ListBox listBox, DataRow row)
         {
            listBox.firstChild.Activate();
            return true;
         }

         bool DataBox::NotifyEditDone(ListBox listBox, DataRow row)
         {
            Class type = ((subclass(DataList))this.type).dataType;
            // if(type.type != normalClass || strcmp(type.dataTypeString, "char *"))
            if(type)
            {
               void * data = ((type.type == normalClass || type.type == noHeadClass || type.type == structClass) ? row.GetData(null) : *(uint *)row.GetData(null));
               if(!data)
               {
                  //if(strcmp(type.dataTypeString, char *"))
                     //listBox.currentRow = null;
                  if(row != listBox.lastRow)
                  {
                     listBox.alwaysEdit = false;
                     listBox.DeleteRow(row);
                     listBox.alwaysEdit = true;
                  }
               }
            }
            Modified();
            return true;
         }
   
         void OnDestroy()
         {
            Class type = firstField.dataType;
            // if(type.type != normalClass || strcmp(type.dataTypeString, "char *"))
            if(type)
            {
               if(type.type == normalClass && strcmp(type.dataTypeString, "char *"))
                  eInstance_Delete(lastRow.GetData(null));
               if(type.type == normalClass || type.type == structClass || type.type == noHeadClass)
                  lastRow.SetData(null, null);
               else
                  lastRow.SetData(null, 0);
            }
         }
      };

      OldLink node;
      DataRow r;
      Class type;
      if(!class_data(type))
         class_data(type) = eSystem_FindClass(__thisModule.application, class_data(typeName));
      type = class_data(type);
      
      list.AddField({ type, editable = true });
      for(node = first; node; node = node.next)
      {
         r = list.AddRow();
         if(type)
         {
            if(type.type == normalClass && !strcmp(type.dataTypeString, "char *"))
               r.SetData(null, CopyString((String)node.data));
            else
               r.SetData(null, node.data);
         }
      }
      r = list.AddRow();
      if(type.type == normalClass || type.type == structClass || type.type == noHeadClass)
         r.SetData(null, null);
      else
         r.SetData(null, 0);
      list.Create();
      list.modifiedDocument = false;
      return list;
   }

   bool OnSaveEdit(Window window, void * object)
   {
      ListBox list = (ListBox) window;
      if(list.modifiedDocument)
      {
         Class type = class_data(type);
         DataRow r;
         if(list.activeChild)
            ((DataBox)list.activeChild).SaveData();

         if(type.type != normalClass || !strcmp(type.dataTypeString, "char *"))
            OnFree();
         else if(type.type == structClass)
            Free(OldLink::Free);
         else
            Free(null);

         for(r = list.firstRow; r; r = r.next)
         {
            if(type.type == noHeadClass || type.type == normalClass || type.type == structClass)
            {
               void * data = r.GetData(null);
               if(data)
               {
                  if(type.type == normalClass && !strcmp(type.dataTypeString, "char *"))
                     Add(OldLink { data = CopyString(data) });
                  else if(type.type == structClass)
                  {
                     OldLink link { data = new byte[type.structSize] };
                     Add(link);
                     memcpy(link.data, data, type.structSize);
                  }
                  else
                     Add(OldLink { data = data });
               }
            }
            else
            {
               uint i = r.GetData(null);
               if(i)
                  Add(OldLink { data = (void *)i });
            }
         }
         return true;
      }
      return false;
   }

   void OnFree()
   {  
      Class type;
      OldLink node;

      if(!class_data(type))
         class_data(type) = eSystem_FindClass(__thisModule.application, class_data(typeName));
      type = class_data(type);
      while(node = first)
      {
         // TO STUDY: ONFREE SHOULD BE USED ONLY FOR LISTBOX?
         if(type)
         {
            if(type.type == normalClass && strcmp(type.dataTypeString, "char *"))
               eInstance_Delete(node.data);
            else if(type.type == structClass)
               delete node.data;
            else
               type._vTbl[__ecereVMethodID_class_OnFree](type, node.data);
         }
         Delete(node);
      }
   }
};
