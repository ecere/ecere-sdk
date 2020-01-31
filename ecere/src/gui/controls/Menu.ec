namespace gui::controls;

import "Window"

private define SELECTION_COLOR = guiApp.currentSkin.selectionColor; //Color { 10, 36, 106 };
private define SELECTION_TEXT = guiApp.currentSkin.selectionText; //Color { 10, 36, 106 };
private define menuBarColor = Color { 211, 218, 237 };
private define popupMenuColor = Color { 229,234,245 };

class ItemPtr : struct
{
   ItemPtr prev, next;
   MenuItem item, oldItem;
   InsertedFlags inserted;
   Window master;
};

#define ITEM_DISABLED(i)   ((i).disabled || ((i).subMenu && !(i).subMenu.items.count))

class InsertedFlags { bool deleteLink:1, deleteItem:1, cleanItem:1, placed:1; };

#define ITEM_TEXT(item)    (item.subMenu ? item.subMenu.text : item.text)
#define ITEM_HOTKEY(item)  (item.subMenu ? item.subMenu.hotKey : item.hotKey)

#define DIVIDER_HEIGHT  (guiApp.textMode ? textCellH : 8)

#define INTERIM_MENU (isMenuBar || interim)
//#define INTERIM_MENU interim

static int strcmpTillTab(const char * a, const char * b)
{
   if(a && !b) return 1;
   else if(b && !a) return -1;
   else
   {
      int c;
      for(c = 0; a[c] && b[c] && a[c] != '\t' && b[c] != '\t'; c++)
         if(a[c] > b[c]) return 1;
         else if(b[c] > a[c]) return -1;
      if(a[c] && a[c] != '\t') return 1;
      else if(b[c] && b[c] != '\t') return -1;
      return 0;
   }
}

public class MenuItem
{
public:
   property Menu parent
   {
      set
      {
         if(menu != value)
         {
            if(menu)
               menu.RemoveItem(this);
            if(value)
               value.AddItem(this);
         }
      }
   };
   property const char * text
   {
      set
      {
         if(copyText)
         {
            delete (char *)text;
            text = CopyString(value);
         }
         else
            text = value;

         manualAccelText = (value && strchr(value, '\t'));

         if(accelerator && !manualAccelText)
            property::accelerator = accelerator;
      }
   };
   property Key hotKey { set { hotKey = value; } };
   property Key accelerator
   {
      set
      {
         accelerator = value;

         if(!manualAccelText && text)
         {
            char accelString[50] = "\t";
            char * newText;
            char * tabPos;
            int length = 0;

            if(value.ctrl)  strcat(accelString, $"Ctrl+");
            if(value.alt)   strcat(accelString, $"Alt+");
            if(value.shift) strcat(accelString, $"Shift+");

            if(value.code == k0)
               strcat(accelString, "0");
            else if(value.code >= k1 && value.code <= k9)
            {
               accelString[strlen(accelString)] = (char)('1' + value.code - k1);
               accelString[strlen(accelString)+1] = 0;
            }
            else
            {
               Key accel = value.code;
               ObjectNotationType onType = none;
               char tempString[50];
               const char * result = accel.OnGetString(tempString, null, &onType);
               int len = strlen(accelString);
               if(result) strcpy(accelString + len, result);
               // accelString[len] = toupper(accelString[len]);
            }

            tabPos = strchr(text, '\t');
            if(tabPos)
               length = tabPos - text;
            else
               length = strlen(text);

            newText = new char[length+strlen(accelString)+1];
            memcpy(newText, text, length);
            newText[length] = 0;
            strcat(newText, accelString);
            if(copyText) delete (void *)text;
            text = newText;
            copyText = true;
         }
      }
   };

   property bool checked
   {
      set
      {
         checked = value;
         if(menu && radio && value)
         {
            // Find the group
            ItemPtr groupFirst = menu.items.first;
            ItemPtr otherItemPtr;
            for(otherItemPtr = menu.items.first; otherItemPtr; otherItemPtr = otherItemPtr.next)
            {
               MenuItem otherItem = otherItemPtr.item;
               if(otherItem.isDivider)
                  groupFirst = otherItemPtr.next;
               else if(!otherItem.placement)
               {
                  if(otherItem == this)
                     break;
               }
            }
            for(otherItemPtr = groupFirst; otherItemPtr; otherItemPtr = otherItemPtr.next)
            {
               MenuItem otherItem = otherItemPtr.item;
               if(otherItem.isDivider)
                  break;
               else if(!otherItem.placement && otherItem.radio && otherItem != this)
                  otherItem.checked = false;
            }
         }
         // Should callback be called here? guess not ;)
      }
      get { return checked; }
   };
   property bool disabled { set { if(this) disabled = value; } };
   property bool checkable { set { checkable = value; } };
   property bool isRadio { set { radio = value; } };

   property uint64 id { set { id = value; } get { return id; } };
   property BitmapResource bitmap
   {
      set
      {
         delete bitmaps[0];
         delete bitmaps[1];
         delete bitmaps[2];
         bitmaps[0] = value;
         bitmaps[1] = value ? (value.alphaBlend ? value : { fileName = value.fileName, monochrome = true }) : null;
         bitmaps[2] = value ? { fileName = value.fileName, grayed = true } : null;
         if(value)
         {
            incref bitmaps[0];
            incref bitmaps[1];
            incref bitmaps[2];
         }
      }
      get { return bitmaps[0]; }
   };
   property bool copyText
   {
      set
      {
         if(value)
         {
            if(text && !copyText)
               text = CopyString(ITEM_TEXT(this));
         }
         else
         {
            if(copyText)
               delete (void *)text;
         }
         copyText = value;
      }
   };
   property bool bold { set { bold = value; } get { return bold; } };
   property bool deletable { set { deletable = value; } get { return deletable; } };

   virtual bool Window::NotifySelect(MenuItem selection, Modifiers mods);

private:
   bool isDivider;
   bool placement;

   uint64 id;
   Key hotKey;
   Key accelerator;
   const char * text;
   BitmapResource bitmaps[3];
   bool checkable, radio;
   bool checked;
   bool disabled;
   Menu menu;
   Menu subMenu;
   bool copyText;
   bool manualAccelText;
   bool bold;
   bool deletable;

   ~MenuItem()
   {
      if(copyText)
         // delete ITEM_TEXT(this);
         delete (void *)text;
      delete subMenu;
      delete bitmaps[0];
      delete bitmaps[1];
      delete bitmaps[2];
   }
};

public class MenuDivider : MenuItem
{
   MenuDivider()
   {
      isDivider = true;
   }

//   property Menu parent { set {} };
};

public class MenuPlacement : MenuItem
{
   MenuPlacement()
   {
      placement = true;
   }

public:
/*
   property Menu parent { set {} };
   property const char * text { set {} };
   property Key hotKey { set {} };
*/
};

public class Menu
{
   class_no_expansion

   int OnCompare(Menu menu)
   {
      return (this != null) != (menu != null);
   }
public:
   void AddItem(MenuItem item)
   {
      if(item)
      {
         ItemPtr ptr;

         for(ptr = items.first; ptr; ptr = ptr.next)
         {
            MenuItem check = ptr.item;
            if(check.placement)
            {
               if(!strcmpTillTab(ITEM_TEXT(check), ITEM_TEXT(item)))
                  break;
            }
         }
         if(!ptr)
         {
            ptr = ItemPtr { };
            items.Add(ptr);
         }
         else
         {
            ptr.inserted = InsertedFlags { placed = true };
            ptr.oldItem = ptr.item;
         }

         ptr.item = item;

         incref item;

         if(!item.placement)
            itemCount++;

         // TOCHECK:
         item.menu = this;
      }
   }

   void RemoveItem(MenuItem item)
   {
      if(item.menu == this)
      {
         ItemPtr ptr;
         for(ptr = items.first; ptr; ptr = ptr.next)
            if(ptr.item == item)
            {
               if(ptr.inserted.placed)
               {
                  ptr.item = ptr.oldItem;
                  ptr.oldItem = null;
               }
               if(!item.placement)
                  itemCount--;
               item.menu = null;
               if(!ptr.inserted.placed)
                  items.Delete(ptr);
               else
                  ptr.inserted = 0;
               delete item;
               break;
            }
      }
   }

   void AddSubMenu(Menu subMenu)
   {
      if(subMenu)
      {
         MenuItem menuItem { };
         ItemPtr ptr { item = menuItem };
         items.Add(ptr);

         incref menuItem;

         itemCount++;
         // TOCHECK:
         menuItem.menu = this;

         if(subMenu)
         {
            menuItem.subMenu = subMenu;
            incref subMenu;
         }
      }
   }

   void AddDynamic(MenuItem addedItem, Window master, bool persistent)
   {
      if(addedItem)
      {
         ItemPtr ptr = null, oldItemPtr;

         for(oldItemPtr = items.first; oldItemPtr; oldItemPtr = oldItemPtr.next)
         {
            if((oldItemPtr.item.subMenu || oldItemPtr.item.placement) && !strcmpTillTab(ITEM_TEXT(oldItemPtr.item), ITEM_TEXT(addedItem)))
            {
               MenuItem oldItem = oldItemPtr.item;
               if(!oldItem.placement)
               {
                  oldItem.subMenu.Merge(addedItem.subMenu, true, master);
               }
               // If sub menu already has a master...
               else
               {
                  oldItemPtr.inserted = InsertedFlags { cleanItem = true };
                  if(!oldItemPtr.oldItem)
                     oldItemPtr.oldItem = oldItem;
                  oldItemPtr.item = addedItem;
               }
               ptr = oldItemPtr;
               break;
            }
         }

         if(!ptr)
         {
            ptr = ItemPtr { };
            items.Add(ptr);
            if(!persistent)
               ptr.inserted = InsertedFlags { deleteLink = true, deleteItem = true };
         }
         else if(!persistent)
            ptr.inserted = InsertedFlags { cleanItem = true, deleteItem = true };

         ptr.item = addedItem;
         ptr.master = master;
         incref addedItem;
         itemCount++;
         addedItem.menu = this;
      }
   }

   MenuItem FindItem(bool (* Window::notifySelect)(MenuItem selection, Modifiers mods), uint64 id)
   {
      ItemPtr ptr;

      for(ptr = items.first; ptr; ptr = ptr.next)
      {
         MenuItem item = ptr.item;
         if(item.subMenu)
         {
            MenuItem subItem = item.subMenu.FindItem(notifySelect, id);
            if(subItem) return subItem;
         }
         else if(!item.isDivider && !item.placement)
         {
            if(item.id == id && item.NotifySelect == notifySelect)
               return item;
         }
      }
      return null;
   }

   void Clear()
   {
      ItemPtr ptr;
      while((ptr = items.first))
      {
         delete ptr.item;
         if(ptr.inserted.cleanItem || ptr.inserted.placed)
         {
            ptr.item = ptr.oldItem;
            ptr.oldItem = null;
            delete ptr.item;
         }
         items.Delete(ptr);
      }
   }

   void Merge(Menu menuBeingMerged, bool menuBar, Window window)
   {
      bool separated = false;
      ItemPtr beingMergedItemPtr;

      for(beingMergedItemPtr = menuBeingMerged.items.first; beingMergedItemPtr; beingMergedItemPtr = beingMergedItemPtr.next)
      {
         MenuItem beingMergedItem = beingMergedItemPtr.item;
         ItemPtr mergeIntoItemPtr = null;

         if(!beingMergedItem) continue;
         if(beingMergedItem.subMenu)
         {
            for(mergeIntoItemPtr = items.first; mergeIntoItemPtr; mergeIntoItemPtr = mergeIntoItemPtr.next)
            {
               if((mergeIntoItemPtr.item.subMenu || mergeIntoItemPtr.item.placement) && !strcmpTillTab(ITEM_TEXT(mergeIntoItemPtr.item), ITEM_TEXT(beingMergedItem)))
               {
                  MenuItem mergeIntoItem = mergeIntoItemPtr.item;
                  if(!beingMergedItem.placement || beingMergedItemPtr.inserted)
                  {
                     if(!mergeIntoItem.placement && !mergeIntoItemPtr.inserted.cleanItem) // Added this last check for ActiveChild overriding ActiveClient's menu
                     {
                        mergeIntoItem.subMenu.Merge(beingMergedItem.subMenu, menuBar, window);
                     }
                     // If sub menu already has a master...
                     else
                     {
                        mergeIntoItemPtr.inserted = InsertedFlags { cleanItem = true };
                        if(!mergeIntoItemPtr.oldItem)
                           mergeIntoItemPtr.oldItem = mergeIntoItem;
                        mergeIntoItemPtr.item = beingMergedItem;
                     }
                     mergeIntoItemPtr.master = window;
                     itemCount++;
                  }
                  break;
               }
            }
         }
         else if(!beingMergedItem.isDivider)
         {
            for(mergeIntoItemPtr = items.first; mergeIntoItemPtr; mergeIntoItemPtr = mergeIntoItemPtr.next)
            {
               MenuItem mergeIntoItem = mergeIntoItemPtr.item;
               if(/*!mergeIntoItem.subMenu && /-*mergeIntoItem.placement && !mergeIntoItemPtr.inserted && */!strcmpTillTab(ITEM_TEXT(mergeIntoItem), ITEM_TEXT(beingMergedItem)))
               {
                  //if(!beingMergedItem.placement || beingMergedItemPtr.inserted)
                  {
                     mergeIntoItemPtr.inserted = InsertedFlags { cleanItem = true };
                     if(!mergeIntoItemPtr.oldItem)
                        mergeIntoItemPtr.oldItem = mergeIntoItem;
                     mergeIntoItemPtr.item = beingMergedItem;
                     mergeIntoItemPtr.master = beingMergedItemPtr.master ? beingMergedItemPtr.master : window;
                     itemCount++;
                  }
                  break;
               }
            }
         }
         if(!mergeIntoItemPtr)
         {
            if(beingMergedItem.placement && !beingMergedItemPtr.inserted)
            {
               // Simply add the placement at the end
               mergeIntoItemPtr = ItemPtr { };
               mergeIntoItemPtr.inserted = InsertedFlags { deleteLink = true, cleanItem = true };
               mergeIntoItemPtr.item = beingMergedItem;
               mergeIntoItemPtr.master = beingMergedItemPtr.master ? beingMergedItemPtr.master : window;
               items.Add(mergeIntoItemPtr);
               itemCount++;
            }
            else
            {
               ItemPtr previous = items.last;
               if(menuBar)
               {
                  // If it is a menu bar, add the item before the first divider
                  for(previous = items.first; previous; previous = previous.next)
                     if(previous.item.isDivider && !previous.inserted)     // Added previous.inserted check
                     {
                        previous = previous.prev;
                        break;
                     }
               }
               else
               {
                  if(previous && !previous.item.isDivider && !separated)
                  {
                     ItemPtr ptr
                     {
                        item = MenuDivider { },
                        inserted = InsertedFlags { deleteLink = true, deleteItem = true }
                     };
                     items.Insert(previous, ptr);
                     previous = ptr;
                     separated = true;
                     itemCount++;
                  }
               }

               if(!beingMergedItem.isDivider || !previous || (previous.item && !previous.item.isDivider))
               {
                  mergeIntoItemPtr = ItemPtr { };
                  items.Insert(previous, mergeIntoItemPtr);
                  mergeIntoItemPtr.inserted = InsertedFlags { deleteLink = true, cleanItem = true };
                  mergeIntoItemPtr.item = beingMergedItem;
                  mergeIntoItemPtr.master = beingMergedItemPtr.master ? beingMergedItemPtr.master : window;
                  itemCount++;
               }
            }
         }
      }
   }

   void Clean(Window window)
   {
      ItemPtr ptr, next;
      for(ptr = items.first; ptr; ptr = next)
      {
         MenuItem item = ptr.item;
         next = ptr.next;

         if(ptr.inserted.cleanItem)
         {
            ptr.item = ptr.oldItem;
            ptr.oldItem = null;
         }
         else if(item.subMenu)
            item.subMenu.Clean(window);

         if(ptr.inserted.deleteItem)
            delete item;

         if(ptr.inserted.deleteLink || ptr.inserted.cleanItem)
            itemCount--;
         if(ptr.inserted.deleteLink)
            items.Delete(ptr);
         else
         {
            ptr.inserted.deleteLink = false;
            ptr.inserted.cleanItem = false;
            ptr.inserted.deleteItem = false;
            ptr.master = window;
         }
      }
   }

   Menu FindMenu(const char * name)
   {
      ItemPtr ptr;

      for(ptr = items.first; ptr; ptr = ptr.next)
      {
         MenuItem item = ptr.item;

         if(item.subMenu && item.subMenu.text && !strcmpTillTab(item.subMenu.text, name))
            return item.subMenu;
      }
      return null;
   }

   property Menu parent { set { if(value) value.AddSubMenu(this); } };
   property const char * text { set { if(copyText) delete text; text = copyText ? CopyString(value) : (char *)value; } };
   property Key hotKey { set { hotKey = value; } };
   property bool hasMargin { set { hasMargin = value; } };
   property bool copyText { set { copyText = value; } };

private:
   OldList items;
   char * text;
   int hotKey;
   int w, h;
   Color color;
   int itemHeight;
   int itemCount;
   bool mergeClients;
   bool hasMargin;
   bool copyText;

   Menu()
   {
      color = popupMenuColor;
   }

   ~Menu()
   {
      if(copyText) delete text;
      Clean(null);
      Clear();
   }
};

public class PopupMenu : Window
{
   class_property(icon) = "<:ecere>controls/menu.png";
   bool isMenuBar;
   int rw, rh;
   int totalHeight;
   Menu menu;
   ItemPtr selected;
   bool pressed;
   bool altDown;
   bool keyboardFocus;
   bool mouseInput;
   Time unpressedTime;

   void (* FontExtent)(Display display, Font font, const char * text, int len, int * width, int * height);

   FontResource boldFont { faceName = font.faceName, font.size, bold = true, window = this };
   BitmapResource subArrow { fileName = "<:ecere>elements/arrowRight.png", window = this };
   BitmapResource whiteSubArrow { fileName = "<:ecere>elements/arrowRight.png", monochrome = true, window = this };
   BitmapResource disabledSubArrow { fileName = "<:ecere>elements/arrowRight.png", grayed = true, window = this };

   borderStyle = bevel;
   interim = true;

   ~PopupMenu()
   {
      if(menu) delete menu;
   }

   // Utility Functions
   bool MenuDestroyMasters(bool unselect)
   {
      bool result;
      PopupMenu window = this, master;

      for(; (master = (PopupMenu)window.master); window = master)
      {
         if(!eClass_IsDerived(master._class, _class) || master.isMenuBar)
            break;
      }

      if(eClass_IsDerived(master._class, _class) && master.isMenuBar)
      {
         master.pressed = false;
         if(unselect)
         {
            master.keyboardFocus = false;
            master.selected = null;
         }
         master.Update(null);
      }
      incref window;
      window.master.Activate();
      result = window.Destroy(0);
      delete window;
      // This looks like a hack...
      RestoreCaret();
      return result;
   }

   bool MenuGoToPrevItem()
   {
      ItemPtr selected, current = this.selected;
      for(selected = (current && current.prev) ? current.prev : menu.items.last;
            selected &&
            (selected.item.isDivider || selected.item.placement || ITEM_DISABLED(selected.item)) &&
            selected != current;
            selected = selected.prev ? selected.prev : menu.items.last)
      {
         if(!current) current = selected; // Endless loop with no previously selected popups
      }
      this.selected = selected;
      return selected && selected != current;
   }

   bool MenuGoToNextItem()
   {
      ItemPtr selected, current = this.selected;
      for(selected = (current && current.next) ? current.next : menu.items.first;
            selected &&
            (selected.item.isDivider || selected.item.placement || ITEM_DISABLED(selected.item)) &&
            selected != current;
            selected = selected.next ? selected.next : menu.items.first)
      {
         if(!current) current = selected; // Endless loop with no previously selected popups
      }
      this.selected = selected;
      return selected && selected != current;
   }

   void MenuPopupChild(int x, int y, Menu childMenu)
   {
      if(childMenu)
      {
         RestoreCaret();
         if(childMenu.itemCount)
         {
            PopupMenu child { master = this, menu = childMenu };

            if(INTERIM_MENU)
            {
               Window parent = this.parent;
               Window desktop = guiApp.desktop;

               x += parent.absPosition.x + parent.clientStart.x - desktop.position.x;
               y += parent.absPosition.y + parent.clientStart.y - desktop.position.y;
   /*
               x += parent.absPosition.x + parent.clientStart.x;
               y += parent.absPosition.y + parent.clientStart.y;
   */
               child.parent = desktop;
            }
            else
            {
               child.stayOnTop = true;
               child.parent = parent;
               child.interim = false;
            }
            child.position = Point { x, y };
            // child.id = id;
            // child.displayDriver = "GDI";
            child.Create();
         }
      }
   }

   bool MenuPopupSelected()
   {
      if(isMenuBar)
      {
         int selectedX = guiApp.textMode ? 0 : 2;

         if(selected && selected.item)     // Why was this null from OnKeyHit?
         {
            ItemPtr selected = this.selected, ptr;
            bool helpBreak = false;
            Window parent = this.parent;
            Window activeClient = parent.activeClient;
            bool systemButtons = activeClient && activeClient.state == maximized;

            keyboardFocus = true;
            pressed = true;

            //if(!INTERIM_MENU)
            if(firstSlave)
               firstSlave.Destroy(0);

            for(ptr = menu.items.first; ptr; ptr = ptr.next)
            {
               MenuItem item = ptr.item;
               int len;
               if(item.placement) continue; //&& !ptr.inserted) continue;

               if(ptr == selected)
               {
                  Menu childMenu = item.subMenu;

                  this.selected = ptr;

                  if(selected.item.subMenu)
                     MenuPopupChild(selectedX, 0, childMenu);

                  keyboardFocus = true;
                  pressed = true;
                  this.selected = ptr;

                  Update(null);
                  return false; // true
               }
               if(item.isDivider)
               {
                  if(!helpBreak)
                  {
                     ItemPtr nextPtr;
                     int breakX = clientSize.w + 2 - (systemButtons ? 48 : 0);
                     for(nextPtr = ptr.next; nextPtr; nextPtr = nextPtr.next)
                     {
                        MenuItem nextItem = nextPtr.item;
                        if(!nextItem.isDivider && ITEM_TEXT(nextItem))
                        {
                           int len;
                           FontExtent(display, fontObject, ITEM_TEXT(nextItem), strlen(ITEM_TEXT(nextItem)), &len, null);
                           breakX -= len + 16;
                        }
                     }
                     if(selectedX < breakX) selectedX = breakX;
                     helpBreak = true;
                  }
               }
               else if(ITEM_TEXT(item))
               {
                  FontExtent(display, fontObject, ITEM_TEXT(item), strlen(ITEM_TEXT(item)), &len, null);
                  selectedX += len + 16;
               }
            }
            Update(null);
         }
      }
      else
      {
         if(selected && selected.item.subMenu)
         {
            Menu childMenu = selected.item.subMenu;
            int y = 0;
            int selectedY = 0;
            ItemPtr ptr;

            for(ptr = menu.items.first; ptr; ptr = ptr.next)
            {
               MenuItem item = ptr.item;

               if(item.placement) continue; //&& !ptr.inserted) continue;
               if(selected == ptr)
               {

                  selectedY = y;
                  break;
               }
               y += (item.isDivider) ? DIVIDER_HEIGHT : rh;
            }
            if(ptr)
            {
               PopupMenu slave = (PopupMenu)firstSlave;
               if(!slave || slave.menu != childMenu)
               {
                  if(firstSlave) firstSlave.Destroy(0);
                  MenuPopupChild(position.x + size.w, position.y + selectedY, childMenu);
                  Update(null);
                  return true;
               }
            }
         }
      }
      return false;
   }

   bool MenuItemSelection(Menu parentMenu, ItemPtr selectionPtr, Key key)
   {
      MenuItem selection = selectionPtr.item;
      if(!ITEM_DISABLED(selection))
      {
         Window master = this;

         if(!isMenuBar)
            master = master.master;

         if(selectionPtr.master)
            master = selectionPtr.master;
         while(eClass_IsDerived(master._class, _class) && master.master)
            master = master.master;

         if(selection.checkable)
            selection.checked = !selection.checked;
         else if(selection.radio)
         {
            if(selection.checked) return false;
            selection.checked = !selection.checked;
         }

         if(!isMenuBar)
            MenuDestroyMasters(true);

         /*return */selection.NotifySelect(master, selection, key.modifiers);
         return true;
      }
      return false;
   }

   bool CheckAccelerators(Menu menu, Key key)
   {
      ItemPtr ptr;

      for(ptr = menu.items.first; ptr; ptr = ptr.next)
      {
         MenuItem item = ptr.item;
         if(item.subMenu)
         {
            if(!CheckAccelerators(item.subMenu, key))
               return false;
         }
         else if(!item.isDivider)
         {
            if(item.accelerator == key)
            {
               if(MenuItemSelection(menu, ptr, key))
                  return false;
            }
         }
      }
      return true;
   }

   ItemPtr FindSelected(int mx, int my, int * selectedX, int * selectedY)
   {
      Menu menu = this.menu;
      // Mouse moved inside menu
      ItemPtr selected = null;

      *selectedX = 0;
      *selectedY = 0;

      if(isMenuBar && menu)
      {
         ItemPtr ptr;
         int x = 0;
         int len;
         bool helpBreak = false;
         Window parent = this.parent;
         Window activeClient = parent.activeClient;
         bool systemButtons = activeClient && activeClient.state == maximized;

         for(ptr = menu.items.first; ptr; ptr = ptr.next)
         {
            MenuItem item = ptr.item;
            if(item.placement) continue; //&& !ptr.inserted) continue;
            if(item.isDivider)
            {
               if(!helpBreak)
               {
                  ItemPtr nextPtr;

                  int breakX = clientSize.w - (systemButtons ? 48 : 0);
                  for(nextPtr = ptr.next; nextPtr; nextPtr = nextPtr.next)
                  {
                     MenuItem nextItem = nextPtr.item;
                     if(!nextItem.isDivider && ITEM_TEXT(nextItem))
                     {
                        int len;
                        FontExtent(display, fontObject, ITEM_TEXT(nextItem), strlen(ITEM_TEXT(nextItem)), &len, null);
                        breakX -= len + 16;
                     }
                  }
                  if(x < breakX) x = breakX;
                  helpBreak = true;
               }
            }
            else
            {
               const char * text = ITEM_TEXT(item);
               FontExtent(display, fontObject, text, text ? strlen(text) : 0, &len, null);
               if((mx >= x - 16 && mx < x + len + 16))
               {
                  if(!ITEM_DISABLED(item))
                     selected = ptr;
                  if(guiApp.textMode)
                     *selectedX = x;
                  else
                     *selectedX = x + 2;
                  *selectedY = -position.y;
                  break;
               }
               x += len + 16;
            }
         }
      }
      else if(menu)
      {
         ItemPtr ptr;
         int y = 0;
         for(ptr = menu.items.first; ptr; ptr = ptr.next)
         {
            MenuItem item = ptr.item;
            if(item.placement) continue; //&& !ptr.inserted) continue;
            if(mx >= 2 && (my >= y && my < y + rh) && !item.isDivider)
            {
               if(!ITEM_DISABLED(item))
                  selected = ptr;
               *selectedY = y;
               *selectedX = position.x + size.w;
               break;
            }
            if(guiApp.textMode)
               y += textCellH;
            else
               y += (item.isDivider) ? DIVIDER_HEIGHT : rh;
         }
      }
      return selected;
   }

   // Window Overrides
   void OnRedraw(Surface surface)
   {
      bool hasMargin = menu ? menu.hasMargin : false;
      int x = 0;
      int y = 0;
      int height;
      bool helpBreak = false;
      Window parent = this.parent;
      Window activeClient = parent.activeClient;
      bool systemButtons = activeClient && activeClient.state == maximized;
      int bitmapOffset = 0;
      bool hasBitmap = false;
      bool isRadio = false;

      surface.TextFont(fontObject);
      surface.TextExtent(" ", 1, null, &height);
      surface.SetBackground(SELECTION_COLOR);

      if(!isMenuBar)
      {
         if(menu)
         {
            ItemPtr ptr;
            for(ptr = menu.items.first; ptr; ptr = ptr.next)
            {
               if(ptr.item.bitmaps[0])
               {
                  hasBitmap = true;
                  break;
               }
            }

            for(ptr = menu.items.first; ptr; ptr = ptr.next)
            {
               if(ptr.item.radio)
               {
                  isRadio = true;
                  break;
               }
            }
         }

         if(guiApp.textMode)
            bitmapOffset = 16;
         else
            bitmapOffset = hasMargin ? 27 : (hasBitmap ? 18 : 12);
         if(hasBitmap && isRadio)
            bitmapOffset += 18;
      }
      else if(guiApp.textMode)
         bitmapOffset = 8;
      else
      {
         // Shiny gradient for menu bar
         ColorKey keys[2] =
         {
            { white, 0 },
            { popupMenuColor, 1 }
         };
         surface.Gradient(keys, sizeof(keys)/sizeof(ColorKey), 1, vertical, 0,0, clientSize.w-1, 7);
      }

      if(menu)
      {
         ItemPtr ptr;
         for(ptr = menu.items.first; ptr; ptr = ptr.next)
         {
            MenuItem item = ptr.item;
            if(item.placement) continue; //&& !ptr.inserted) continue;
            if(!isMenuBar && selected == ptr)
            {
               surface.SetForeground(SELECTION_TEXT);
               if(guiApp.textMode)
               {
                  surface.TextOpacity(true);
                  surface.Area(0,y,clientSize.w-1,y+rh-1);
               }
               else
                  surface.Area(/*(hasMargin ? bitmapOffset : 0) +*/ 2,y,clientSize.w-3,y+rh);
            }
            else
            {
               surface.SetForeground(foreground);
               if(guiApp.textMode)
                  surface.TextOpacity(false);
            }

            if(item.isDivider)
            {
               if(isMenuBar)
               {
                  if(!helpBreak)
                  {
                     ItemPtr nextPtr;
                     int breakX = clientSize.w - (systemButtons ? 48 : 0);
                     for(nextPtr = ptr.next; nextPtr; nextPtr = nextPtr.next)
                     {
                        MenuItem nextItem = nextPtr.item;
                        int len;
                        if(!nextItem.isDivider && ITEM_TEXT(nextItem))
                        {
                           surface.TextExtent(ITEM_TEXT(nextItem), strlen(ITEM_TEXT(nextItem)), &len, null);
                           breakX -= len + 16;
                        }
                     }
                     if(x < breakX) x = breakX;
                     helpBreak = true;
                  }
               }
               else
               {
                  if(guiApp.textMode)
                  {
                     surface.SetForeground(Color { 85, 85, 85 });
                     surface.DrawingChar(196);
                     surface.HLine(x + 2, x + rw - 5, y + (rh) / 2);
                     surface.DrawingChar(' ');
                  }
                  else
                  {
                     int start = x + hasMargin ? bitmapOffset : 2;
                     int end   = x + rw - (hasMargin ? 13 : 5);
                     surface.foreground = Color { 85, 85, 85 };
                     surface.HLine(start, end, y + (DIVIDER_HEIGHT) / 2);
                     surface.foreground = white;
                     surface.HLine(start, end, y + (DIVIDER_HEIGHT) / 2 + 1);
                  }
               }
            }
            else
            {
               if(selected == ptr && guiApp.textMode)
               {
                  surface.SetBackground(SELECTION_COLOR);
                  surface.SetForeground(SELECTION_TEXT /*background*/);
                  surface.TextOpacity(true);
               }
               if(guiApp.textMode)
               {
                  Interface::WriteKeyedTextDisabled(surface, x + bitmapOffset,
                     y + (rh - height)/2, ITEM_TEXT(item), ITEM_HOTKEY(item), ITEM_DISABLED(item));
                  if(item.checked)
                     surface.WriteText(x, y, "\373", 1);
               }
               else
               {
                  int textY = y + (rh - height)/2;
                  BitmapResource bitmap = item.disabled ? item.bitmaps[2] : ((selected == ptr) ? item.bitmaps[1] : item.bitmaps[0]);
                  if(!isMenuBar && bitmap)
                  {
                     Bitmap icon = bitmap.bitmap;
                     if(icon)
                        surface.Blit(icon, x + (isRadio ? 18 : 0) + (hasMargin ? 5 : 3), y + (rh - icon.height)/2, 0,0, icon.width, icon.height);
                  }

                  if(item.bold)
                     surface.TextFont(boldFont.font);
                  else
                     surface.TextFont(fontObject);

                  if(ITEM_DISABLED(item) && selected == ptr)
                  {
                     surface.SetForeground(formColor);
                     Interface::WriteKeyedText(surface, x + bitmapOffset + 5,
                        textY, ITEM_TEXT(item), ITEM_HOTKEY(item));
                  }
                  else
                     Interface::WriteKeyedTextDisabled(surface, x + bitmapOffset + 5,
                        textY, ITEM_TEXT(item), ITEM_HOTKEY(item), ITEM_DISABLED(item));

                  // A nice vertical separation line
                  if(hasMargin && !isMenuBar)
                  {
                     surface.foreground = Color { 85, 85, 85 };
                     surface.VLine(clientArea.top, clientArea.bottom, x + bitmapOffset - 2);
                     surface.foreground = white;
                     surface.VLine(clientArea.top, clientArea.bottom, x + bitmapOffset - 1);
                  }
                  surface.foreground = foreground;
                  if(item.checked)
                  {
                     surface.DrawLine(x+5, y+9, x+8,y+12);
                     surface.DrawLine(x+5, y+10, x+8,y+13);
                     surface.DrawLine(x+8, y+12, x+12,y+4);
                     surface.DrawLine(x+8, y+13, x+12,y+5);
                  }
               }
            }

            if(!isMenuBar)
            {
               // Draw little arrow
               if(item.subMenu)
               {
                  surface.SetForeground(foreground);

                  if(guiApp.textMode)
                  {
                     surface.SetForeground((selected == ptr) ? (background) : (foreground));
                     surface.WriteText(clientSize.w-8, y+(rh - 8)/2, "\020", 1);
                  }
                  else
                  {
                     Bitmap arrow = (selected == ptr) ? whiteSubArrow.bitmap : subArrow.bitmap;
                     if(ITEM_DISABLED(ptr.item)) arrow = disabledSubArrow.bitmap;

                     if(arrow)
                        surface.Blit(arrow, clientSize.w-14, y+(rh - 8)/2, 0,0, arrow.width, arrow.height);
                     /*
                     surface.VLine(y+(rh - 8)/2, y+(rh - 8)/2+7, clientSize.w-10);
                     surface.SetForeground(Color { 85, 85, 85 });
                     surface.DrawLine(clientSize.w-10, y+(rh - 8)/2, clientSize.w-4, y+rh / 2);
                     surface.SetForeground(formColor);
                     surface.DrawLine(clientSize.w-10, y+(rh - 8)/2+7, clientSize.w-4, y+rh / 2);
                     */
                  }
               }
               if(guiApp.textMode)
                  y += rh;
               else
                  y += (item.isDivider) ? DIVIDER_HEIGHT : rh;
            }
            else if(ITEM_TEXT(item) && !item.isDivider)
            {
               int len;
               surface.TextExtent(ITEM_TEXT(item), strlen(ITEM_TEXT(item)), &len, null);
               if(selected == ptr && !guiApp.textMode &&
                  (item.subMenu || selected))
               {
                  surface.Bevel(pressed, x, y, len+10, height + 6);
               }
               if(!item.isDivider)
                  x += len + 16;
            }
         }
      }
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      bool result = true;
      if(visible)
      {
         // Non-Interim menus: the slaves don't have focus... pass it down from menu bar
         if(!INTERIM_MENU)
         {
            if(!active && firstSlave)
            {
               if(!firstSlave.OnKeyDown(key, ch))
                  result = false;
            }
         }

         switch(key)
         {
            case leftAlt:
            case rightAlt:
               if(!isMenuBar)
               {
                  altDown = false;
                  MenuDestroyMasters(true);
               }
               else
               {
                  altDown = true;
               }
               return false;
            default:
               altDown = false;
               if(key && menu)
               {
                  ItemPtr ptr;

                  for(ptr = menu.items.first; ptr; ptr = ptr.next)
                  {
                     MenuItem item = ptr.item;
                     if((item.placement && !ptr.inserted) || ITEM_DISABLED(item)) continue;
                     if(((keyboardFocus || !isMenuBar) && ITEM_HOTKEY(item) == key) || (ITEM_HOTKEY(item) | Key { alt = true }) == key)
                     {
                        if(!item.isDivider && !item.subMenu)
                        {
                           if(MenuItemSelection(menu, ptr, key))
                              return false;
                        }
                        else if(item.subMenu)
                        {
                           selected = ptr;
                           MenuPopupSelected();
                           result = false;
                        }
                        break;
                     }
                  }
                  if(ch >= 32 && ch != 128 && !isMenuBar)
                     result = false;
               }
         }

         // Interim menus: the slaves are the ones with the focus
         if(result && INTERIM_MENU)
         {
            Window master = this.master;
            if(eClass_IsDerived(master._class, _class))
            {
               if(!master.OnKeyDown(key, ch))
                  result = false;
            }
         }
      }
      return result;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      switch(key)
      {
         case leftAlt:
         case rightAlt:
            if(isMenuBar && altDown)
            {
               if(!selected)
               {
                  MenuGoToNextItem();
                  keyboardFocus = true;
                  RestoreCaret();
               }
               else
               {
                  selected = null;
                  if(firstSlave) firstSlave.Destroy(0);
                  pressed = false;
                  keyboardFocus = false;
                  RestoreCaret();
               }
               Update(null);
               altDown = false;
               return false;
            }
            break;
      }
      altDown = false;
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      bool result = true;

      if(key == leftAlt || key == rightAlt) return true;

      if(key && isMenuBar)
      {
         if(!keyboardFocus)
         {
            if(key)
               result = CheckAccelerators(menu, key);
            if(result && !key.alt && key != escape)
               return true;
         }
      }

      if(result && visible)
      {
         // Non-Interim menus: the slaves don't have focus... pass it down from menu bar
         if(!INTERIM_MENU)
         {
            if(!active && firstSlave)
            {
               if(!firstSlave.OnKeyHit(key, ch))
                  result = false;
            }
         }

         if(result)
         {
            switch(key)
            {
               case home:
                  if(!isMenuBar)
                  {
                     selected = menu.items.last;
                     if(MenuGoToNextItem())
                        Update(null);
                     result = false;
                  }
                  break;
               case end:
                  if(!isMenuBar)
                  {
                     selected = menu.items.first;
                     if(MenuGoToPrevItem())
                        Update(null);
                     result = false;
                  }
                  break;
               case left:
                  if(isMenuBar)
                  {
                     if(MenuGoToPrevItem())
                        MenuPopupSelected();
                     result = false;
                  }
                  else
                  {
                     PopupMenu master = (PopupMenu)this.master;
                     if(master && !master.isMenuBar)
                     {
                        Destroy(0);
                        if(!INTERIM_MENU)
                           master.Activate();
                        result = false;
                     }
                  }
                  break;
               case right:
                  if(isMenuBar)
                  {
                     if(MenuGoToNextItem() && MenuPopupSelected())
                        result = false;
                  }
                  else
                  {
                     if(selected && !ITEM_DISABLED(selected.item))
                     {
                        if(!MenuPopupSelected())
                        {
                           if(!selected)
                           {
                              selected = menu.items.first;
                              Update(null);
                           }
                        }
                        else
                           result = false;
                     }
                     else if(!((PopupMenu)master).isMenuBar)
                     {
                        if(MenuGoToNextItem())
                           Update(null);
                        result = false;
                     }
                  }
                  break;
               case space:
                  if(isMenuBar)
                  {
                     if(!pressed)
                        return MenuPopupSelected();
                     else
                     {
                        pressed = false;
                        if(firstSlave) firstSlave.Destroy(0);
                        Update(null);
                     }
                  }
                  break;
               case down: case Key::altDown:
                  if(isMenuBar)
                  {
                     return MenuPopupSelected();
                  }
                  else
                  {
                     if(MenuGoToNextItem())
                        Update(null);
                     result = false;
                  }
                  break;
               case up: case altUp:
                  if(!isMenuBar)
                  {
                     if(MenuGoToPrevItem())
                        Update(null);
                     result = false;
                  }
                  break;
               case enter: case altEnter:
               case keyPadEnter: case altKeyPadEnter:
                  if(selected)
                  {
                     if(!selected.item.isDivider && !selected.item.subMenu)
                     {
                        if(MenuItemSelection(menu, selected, key))
                           result = false;
                     }
                  }
                  break;
               case del:
                  if(selected && selected.item.deletable)
                  {
                     if(!selected.item.isDivider && !selected.item.subMenu)
                     {
                        key.modifiers.isSideEffect = true;
                        if(MenuItemSelection(menu, selected, key))
                        {
                           menu.RemoveItem(selected.item);
                           result = false;
                        }
                     }
                  }
                  break;
               case escape:
                  if(isMenuBar)
                  {
                     result = selected ? false : true;
                     selected = null;
                     pressed = false;
                     keyboardFocus = false;
                     RestoreCaret();
                     Update(null);
                     return result;
                  }
                  else
                  {
                     PopupMenu master = (PopupMenu)this.master;
                     if(eClass_IsDerived(master._class, _class) && master.isMenuBar)
                     {
                        ItemPtr selected = master.selected;
                        Destroy(0);
                        master.pressed = true;
                        master.selected = selected;
                        master.keyboardFocus = true;
                     }
                     else
                        Destroy(0);

                     result = false;
                  }
                  break;
               default:
                  if(key && menu)
                  {
                     //ItemPtr ptr;

                     if(ch >= 32 && !isMenuBar)
                        return false;
                     /*
                     for(ptr = menu.items.first; ptr; ptr = ptr.next)
                     {
                        MenuItem item = ptr.item;
                        if((item.placement && !ptr.inserted) || ITEM_DISABLED(item)) continue;
                        if(ITEM_HOTKEY(item) == key || (ITEM_HOTKEY(item) | Key { alt = true }) == key)
                        {
                           if(!item.isDivider && !item.subMenu)
                           {
                              if(MenuItemSelection(menu, ptr, key))
                                 return false;
                           }
                           else if(item.subMenu)
                           {
                              selected = ptr;
                              MenuPopupSelected();
                           }
                           break;
                        }
                     }*/
                  }
            }
            if(result && isMenuBar && pressed)
               result = false;
         }
         // Interim menus: the slaves are the ones with the focus
         if(result && INTERIM_MENU)
         {
            Window master = this.master;
            if(eClass_IsDerived(master._class, _class))
            {
               if(!master.OnKeyHit(key, ch))
                  result = false;
            }
         }
      }
      return result;
   }

   bool OnLoadGraphics()
   {
      Font font = fontObject;
      int maxW = 0, maxH = 0;
      int width, height;

      totalHeight = 0;

      background = isMenuBar ? menuBarColor : (menu ? menu.color : popupMenuColor);
      FontExtent = Display::FontExtent;
      if(menu)
      {
         ItemPtr ptr;

         // Default width & height for merging menus into menu bars
         if(isMenuBar)
         {
            FontExtent(display, font, "W",1, &maxW, &maxH);
            if(!guiApp.textMode)
               maxH += 6;
         }

         for(ptr = menu.items.first; ptr; ptr = ptr.next)
         {
            MenuItem item = ptr.item;
            if(item.placement) continue; //&& !ptr.inserted) continue;
            width = 0;
            height = 0;
            if(!item.isDivider)
            {
               if(ITEM_TEXT(item))
               {
                  FontExtent(display, font,ITEM_TEXT(item),strlen(ITEM_TEXT(item)),&width, &height);
                  if(strstr(ITEM_TEXT(item), "\t"))
                     width += 8;
               }
               if(item.bitmap && item.radio)
                  width += 20;
               if(item.subMenu) width += 20;
               if(!guiApp.textMode)
                  height += 6;
            }
            else
            {
               if(!guiApp.textMode)
                  height = DIVIDER_HEIGHT;
               else
                  height = textCellH;
            }

            if(width > maxW) maxW = width;
            if(height > maxH) maxH = height;

            totalHeight += height;

            if(item.bitmaps[0]) AddResource(item.bitmaps[0]);
            if(item.bitmaps[1]) AddResource(item.bitmaps[1]);
            if(item.bitmaps[2]) AddResource(item.bitmaps[2]);
         }
         maxW += menu.hasMargin ? 32 : 24;
         if(menu.text)
         {
            FontExtent(display, font,menu.text,strlen(menu.text),&width, &height);
            if(width > maxW) maxW = width;
            if(height > maxH) maxH = height;
         }
         rw = menu.w;
         rh = menu.h;

         maxW += 10;
         if(rw < maxW) rw = maxW;
         if(rh < maxH) rh = maxH;
      }
      return true;
   }

   bool OnResizing(int * w, int * h)
   {
      Window master = this.master;
      Window masterMenuBar = master.menuBar;
      if(this != masterMenuBar)
         *w = Max(*w, rw);

      if(isMenuBar)
         *h = Max(*h, rh + 2);
      else if(menu)
         *h = Max(*h, totalHeight + 2);

      if(this != masterMenuBar)
      {
         if(!*w)
            *w = 80;
         if(!*h)
            *h = 20;
      }
      return true;
   }

   bool OnMoving(int *x, int *y, int w, int h)
   {
      if(!isMenuBar)
      {
         Window parent = this.parent;
         if(INTERIM_MENU)
         {
            if(*y + h > parent.clientSize.h)
            {
               PopupMenu master = (PopupMenu)this.master;
               *y -= h;
               if(eClass_IsDerived(master._class, _class))
               {
                  if(master.isMenuBar)
                     *y -= master.size.h;
                  else
                     *y += h - clientSize.h + rh;
               }
               *y = Max(*y, 0);
            }
            *x = Min(*x, ((parent == guiApp.desktop && guiApp.virtualScreen.w) ? guiApp.virtualScreen.w : parent.clientSize.w) - w);
         }
         else if(nonClient)
         {
            *x = Min(*x, parent.size.w - w);
            *y = Min(*y, parent.size.h - h);
         }
         else
         {
            *x = Min(*x, parent.clientSize.w - w);
            *y = Min(*y, parent.clientSize.h - h);
         }
         if(parent == guiApp.desktop)
         {
            // Just in case...
            *x = Max(*x, guiApp.virtualScreenPos.x);
            *y = Max(*y, guiApp.virtualScreenPos.y);
         }
         else
         {
            // Just in case...
            *x = Max(*x, 0);
            *y = Max(*y, 0);
         }
      }
      return true;
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      int selectedX, selectedY;
      ItemPtr selected;

      if(mods.isSideEffect) return true;

      selected = FindSelected(mx, my, &selectedX, &selectedY);

      if((!mods.isSideEffect || !this.selected) && (/*selected && */
         selected != this.selected && (!selected || !ITEM_DISABLED(selected.item)) && (selected || !keyboardFocus)))
      {
         if(!isMenuBar || pressed)
         {
            bool pressed = this.pressed;

            if(firstSlave) firstSlave.Destroy(0);

            this.selected = selected;

            if(this.selected)
            {
               Menu childMenu = selected.item.subMenu;

               this.pressed = pressed;

               if(this.selected.item.subMenu)
                  MenuPopupChild(selectedX, position.y + selectedY, childMenu);

               if(pressed)
                  keyboardFocus = true;
            }
         }
         else
            this.selected = selected;
         Update(null);
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(isMenuBar)
      {
         // Had to boost this to 0.1 for Windows Basic / XP theme / Remote Desktop
         // Aero & Classic were fast enough for 0.01
         if(GetTime() - unpressedTime < 0.1)
            return true;
         if(INTERIM_MENU)
         {
            int selectedX, selectedY;
            if(!mods.isActivate && !pressed)
            {
               pressed = true;
               keyboardFocus = true;
               selected = null;
               OnMouseMove(x,y, mods);
            }
            else
            {
               if(firstSlave) firstSlave.Destroy(0);
               selected = FindSelected(x, y, &selectedX, &selectedY);

               pressed = false;
               //selected = null;
               //keyboardFocus = false;
               Update(null);
            }
         }
         else
         {
            if(pressed)
            {
               pressed = false;
               keyboardFocus = false;
               if(firstSlave) firstSlave.Destroy(0);
               Update(null);
            }
            else
            {
               pressed = true;
               keyboardFocus = true;
               selected = null;
               OnMouseMove(x, y, mods);
            }
         }
      }
      else //if(!INTERIM_MENU)       // Why was this commented out?
      {
         if(!(x >= 0 && y >= 0 && x < clientSize.w && y < clientSize.h))
         {
            MenuDestroyMasters(false);
            return false;
         }
      }
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= 0 && y >= 0 && x < clientSize.w && y < clientSize.h)
      {
         if(isMenuBar)
         {
            Window master = this.master;
            Window activeClient = master.activeClient;
            if(activeClient.state == maximized)
               activeClient.ShowSysMenu(absPosition.x + x, absPosition.y + y);
         }
      }
      return true;
   }

   bool OnLeftButtonUp(int mx, int my, Modifiers mods)
   {
      if(mx >= 2 /*0*/ && my >= 0 && mx < clientSize.w && my < clientSize.h)
      {
         Menu menu = this.menu;
         int y = 0;

         // Button up
         if(!isMenuBar && menu)
         {
            ItemPtr ptr;
            for(ptr = menu.items.first; ptr; ptr = ptr.next)
            {
               MenuItem item = ptr.item;
               if(item.placement) continue; //&& !ptr.inserted) continue;
               if(my >= y && my < y + rh && !item.isDivider)
               {
                  selected = ptr;
                  break;
               }
               if(guiApp.textMode)
                  y += textCellH;
               else
                  y += (item.isDivider) ? DIVIDER_HEIGHT : rh;
            }
            Update(null);
         }
         if(!isMenuBar || pressed)
         {
            if(selected)
            {
               if(!selected.item.isDivider && !selected.item.subMenu)
               {
                  if(isMenuBar)
                  {
                     pressed = false;
                     keyboardFocus = false;
                     Update(null);
                  }
                  if(MenuItemSelection(menu, selected, Key { modifiers = mods }))
                     return false;
               }
            }
            else if(pressed)
            {
               pressed = false;
               keyboardFocus = false;
               if(firstSlave) firstSlave.Destroy(0);
            }
         }
      }
      return true;
   }

   OnRightButtonUp = OnLeftButtonUp;

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      if(isMenuBar)
      {
         int selectedX, selectedY;
         ItemPtr selected = FindSelected(x, y, &selectedX, &selectedY);
         if(!selected)
         {
            Window master = this.master;
            Window activeClient = master.activeClient;
            // TOFIX: Fix need for a cast here...
            while(activeClient && !((BorderBits)activeClient.borderStyle).fixed)
               activeClient = activeClient.activeClient;
            if(activeClient && activeClient.state == maximized)
               activeClient.SetState(normal, false, mods);
         }
      }
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      if(!pressed && !firstSlave)
      {
         selected = null;
         Update(null);
         ReleaseCapture();
      }
      return true;
   }

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      if(!isMenuBar)
      {
         if(!active)
         {
            if(INTERIM_MENU)
            {
               PopupMenu master = (PopupMenu)this.master;
               if(eClass_IsDerived(master._class, _class) && master.isMenuBar) // && swap != master && swap && swap.master != master)
               {
                  {
                     master.unpressedTime = GetTime();
                     master.pressed = false;
                     master.selected = null;
                     master.keyboardFocus = false;
                     // master.Update(null);

                     // TOFIX: Redraw bug here without this...
                     master.master.Update(null);
                  }
               }
               Destroy(0);
            }
            else
            {
               Window master;
               bool destroy = true;

               if(swap)
               {
                  for(master = swap.master; master; master = master.master)
                     if(this == master)
                     {
                        destroy = false;
                        break;
                     }
               }
               if(destroy)
               {
                  for(master = this.master; master; master = master.master)
                     if(swap == master)
                     {
                        if(eClass_IsDerived(master._class, _class))
                           destroy = false;
                        break;
                     }
               }
               if(destroy)
               {
                  if(MenuDestroyMasters(false))
                     return false;
               }
            }
            return false;
         }
      }
      // With new activation code this is not required anymore (double effect if there)
      else
      {
         //if(!active)
         {
            selected = null;
            unpressedTime = GetTime();
            pressed = false;
            altDown = false;
            keyboardFocus = false;
            if(firstSlave) firstSlave.Destroy(0);
            Update(null);
         }
      }
      return true;
   }


public:
   property Menu menu
   {
      set
      {
         delete menu;
         menu = value;
         if(menu)
            incref menu;
         if(created)
         {
            selected = null;
            if(firstSlave) firstSlave.Destroy(0);
            OnLoadGraphics();
            Move(position.x, position.y, size.w, size.h);

            if(!text)
            {
               if(interim || isMenuBar)
                  text = master.text;
               else
                  text = menu.text;
            }
         }
      }
      get { return menu; }
   };
   property bool isMenuBar { set { isMenuBar = value; } };
   property bool focus { get { return keyboardFocus; } };
};
