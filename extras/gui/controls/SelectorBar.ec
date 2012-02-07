#ifdef BUILDING_ECERE_COM
namespace gui::controls;
import "Window"
import "Array"
#else
#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif
#endif

static void DrawStipple(Surface surface, Size clientSize)
{
   int x1 = 0;
   int y1 = 0;
   int x2 = clientSize.w - 1;
   int y2 = clientSize.h - 1;
   if((x2 - x1) & 1) x2--;
   if((y2 - y1) & 1) y2--;

   surface.LineStipple(0x5555);
   surface.Rectangle(x1, y1, x2, y2);
   surface.LineStipple(0);            
}

public class SelectorBar : Stacker
{
   direction = horizontal;
   background = activeBorder;
   //tabCycle = true;
   //isActiveClient = true;

   clientSize = { h = 40 };

public:
   /*Label label
   {
      this, anchor = { left = 8, top = 12 }, labeledWindow = this;

      void OnRedraw(Surface surface)
      {
         Label::OnRedraw(surface);
         if(labeledWindow.active)
            DrawStipple(surface, clientSize);
      }
   };*/

   void Clear()
   {
      Iterator<Window> it { controls };
      while(it.Next())
      {
         Window button = it.data;
         button.visible = false;
         button.Destroy(0);
      }
   }

   void Select(SelectorButton button)
   {
      button.checked = true;
      button.Activate();
      button.NotifyClicked(button.master, button, 0, 0, 0);
      MakeControlVisible(button);
   }

   void AddButton(SelectorButton button)
   {
      if(created)
         button.Create();
   }

   void RemoveButton(SelectorButton button)
   {
      Iterator<Window> it { controls };
      while(it.Next())
      {
         if(button == (SelectorButton)it.data)
         {
            if(it.Next() || (it.Prev() && it.Prev()))
            {
               SelectorButton newSelection = (SelectorButton)it.data;
               newSelection.checked = true;
               newSelection.NotifyClicked(newSelection.master, newSelection, 0, 0, 0);
            }
            break;
         }
      }
      button.visible = false;
      button.Destroy(0);
   }

   SelectorButton FindButtonByID(int id)
   {
      SelectorButton button = null;
      Iterator<Window> it { controls };
      while(it.Next())
      {
         Window b = it.data;
         if(eClass_IsDerived(b._class, class(SelectorButton)) && b.id == id)
         {
            button = (SelectorButton)b;
            break;
         }
      }
      return button;
   }

   bool OnCreate()
   {
      OnResize(clientSize.w, clientSize.h);
      return true;
   }

   property SelectorButton selectedButton
   {
      get
      {
         SelectorButton button = null;
         Iterator<Window> it { controls };
         while(it.Next())
         {
            Window w = it.data;
            if(eClass_IsDerived(w._class, class(SelectorButton)))
            {
               SelectorButton b = (SelectorButton)w;
               if(b.checked)
               {
                  button = (SelectorButton)b;
                  break;
               }
            }
         }
         return button;
      }
   }

   ~SelectorBar()
   {
      Clear();
   }
};

public class SelectorButton : Button
{
   text = "Unknonw", bevelOver = true, isRadio = true, bitmap = null, minClientSize = { 44, 22 }; isRemote = true;

public:
   Window focusHolder;

   watch(parent)
   {
      if(parent && eClass_IsDerived(parent._class, class(SelectorBar)))
      {
         SelectorBar parent = (SelectorBar)this.parent;
         parent.AddButton(this);
      }
   };

   watch(checked)
   {
      if(parent && eClass_IsDerived(parent._class, class(SelectorBar)) && checked)
      {
         SelectorButton b;
         SelectorBar selector = (SelectorBar)parent;
         for(b = (SelectorButton)parent.firstChild; b; b = (SelectorButton)b.next)
         {
            if(b.nonClient) continue;
            if(eClass_IsDerived(b._class, class(SelectorButton)) && b != this)
            {
               b.font = null;
               b.checked = false;
            }
         }
         font = { font.faceName, font.size, bold = true }; 
         // this should not be required: the font change should resize the control and Stacker should adapt automatically
         // why does it not?
         selector.OnResize(selector.clientSize.w, selector.clientSize.h);
         selector.MakeControlVisible(this);
      }
   };

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool result;
      Activate();
      result = Button::OnLeftButtonDown(x, y, mods);
      if(focusHolder && !checked)
         focusHolder.Activate();
      return result;
   }
};

class EditableSelectorButton : SelectorButton
{
   EditBox editBox;
   bool renameable;

   virtual bool Window::OnRename(EditableSelectorButton button, char ** oldName, char ** newName);

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == f2 && !editBox)
      {
         if(!checked)
         {
            checked = true;
            NotifyClicked(master, this, 0, 0, 0);
         }
         OnLeftButtonDown(0, 0, 0);
         return false;
      }
      return SelectorButton::OnKeyDown(key, ch);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Activate();
      if(renameable && checked && !editBox)
      {
         editBox =
         {
            this, anchor = { 2, 2, 2, 2 }, /*opacity = 0, */borderStyle = 0, textHorzScroll = true;

            bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
            {
               EditBox::OnActivate(active, previous, goOnWithActivation, direct);
               if(!active && !destroyed)
               {
                  ((EditableSelectorButton)master).editBox = null;
                  Destroy(0);
                  //OnLeavingEdit();
                  if(master && ((EditableSelectorButton)master).focusHolder)
                     ((EditableSelectorButton)master).focusHolder.Activate();
                  delete this;
               }               
               return true;
            }
            
            bool NotifyModified(EditBox editBox)
            {
               char * oldName = CopyString(text);
               char * newName = CopyString(editBox.contents);
               
               if(OnRename(master, this, &oldName, &newName))
               {
                  SelectorBar selector = (SelectorBar)parent;
                  text = newName;
                  if(selector)
                     selector.MakeControlVisible(this);
               }
               
               delete oldName;
               delete newName;
               
               //OnLeavingEdit();? //master.someControl.Activate();
               if(focusHolder)
                  focusHolder.Activate();

               return true;
            }

            bool OnKeyDown(Key key, unichar ch)
            {
               if((SmartKey)key == enter || key == escape)
               {
                  if(key == escape)
                  {
                     EditableSelectorButton button = (EditableSelectorButton)master;
                     if(button.editBox)
                        button.editBox.SetModified(false);
                  }
                  Deactivate();
                  return false;
               }
               else
                  return EditBox::OnKeyDown(key, ch);
            }
         };
         incref editBox;
         editBox.contents = text;         
         editBox.Create();
         editBox.SetModified(false);
         editBox.SelectAll();
      }
      return Button::OnLeftButtonDown(x, y, mods);
   }
}

