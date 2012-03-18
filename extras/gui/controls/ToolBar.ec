#ifdef BUILDING_ECERE_COM
namespace gui::controls;
import "Window"
import "Array"
import "Stacker"
import "IconBag"
#else
#ifdef ECERE_STATIC
// TOCHECK: these two import directives will crash the form designer when ToolBar.ec is included in ecere.epj
//public import static "ecere"
#else
//public import "ecere"
#endif
public import "IconBag"
#endif

public class ToolBar/*<class TT>*/ : public Stacker
{
   direction = horizontal;
   background = formColor;
   opacity = 1.0f;
   //tabCycle = true;
   //isActiveClient = true;
   //moveable = false;
   gap = 0;
   //inactive = true;

   anchor = Anchor { left = 0, right = 0 };
   clientSize = { h = 32 };
   borderStyle = bevel;

public:

   IconBag/*<TT>*/ iconBag;

   // Notifications
   virtual bool Window::NotifyClicked(Button button, int x, int y, Modifiers mods);

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
         ToolButton button = (ToolButton)it.data;
         button.visible = false;
         button.Destroy(0);
         delete button;
      }
      OnResize(clientSize.w, clientSize.h);
   }

   void Select(ToolButton button)
   {
      button.checked = true;
      button.Activate();
      button.NotifyClicked(button.master, button, 0, 0, 0);
      MakeControlVisible(button);
   }

   void AddButton(ToolButton button)
   {
      incref button;
      if(created)
      {
         button.Create();
         // Find a more elegant manner to force updating of positions?
         OnResize(clientSize.w, clientSize.h);
      }
   }

   void RemoveButton(ToolButton button)
   {
      Iterator<Window> it { controls };
      while(it.Next())
      {
         if(button == (ToolButton)it.data)
         {                     
            if(it.Next() || (it.Prev() && it.Prev()))
            {
               ToolButton newSelection = (ToolButton)it.data;
               newSelection.checked = true;
               newSelection.NotifyClicked(newSelection.master, newSelection, 0, 0, 0);
            }
            break;
         }
      }
      button.visible = false;
      button.Destroy(0);
      delete button;
      OnResize(clientSize.w, clientSize.h);
   }

   ToolButton FindButtonByID(int id)
   {
      ToolButton button = null;
      
      Iterator<Window> it { controls };
      while(it.Next())
      {
         ToolButton b = (ToolButton)it.data;
         if(eClass_IsDerived(b._class, class(ToolButton)) && b.id == id)
         {                     
            button = b;
            break;
         }
      }
      
      // This alternate technique works outside but give very weird results when used inside. :S
      /*
      ToolButton b;
      for(b = (ToolButton)firstChild; b; b = (ToolButton)b.next)
      {
         if(eClass_IsDerived(b._class, class(ToolButton)) && b.id == id)
         {
            button = b;
            break;
         }
      }
      */
      return button;
   }

   bool OnCreate()
   {
      OnResize(clientSize.w, clientSize.h);
      return true;
   }

   property ToolButton selectedButton
   {
      get
      {
         ToolButton button = null;
         Iterator<Window> it { controls };
         while(it.Next())
         {
            ToolButton b = (ToolButton)it.data;
            if(eClass_IsDerived(b._class, class(ToolButton)) && b.checked)
            {                     
               button = b;
               break;
            }
         }
         return button;
      }
   }

};

/*public class ToolSpace : Window
{
}*/

public class ToolButton/*<class TT>*/ : public Button
{
   //text = "Unknonw", bevelOver = true, isRadio = true, bitmap = null, minClientSize = { 44, 22 }; isRemote = true;
   bevelOver = true;
   //isRadio = true;
   bitmap = null;
   size = Size { 24, 24 };
   //isRemote = true;
   borderStyle = none;
   opacity = 0.0f;
   bitmapAlignment = left;

public:
   Window focusHolder;

private:
   watch(id)
   {
      SetBitmap();
   };

   watch(parent)
   {
      if(parent && eClass_IsDerived(parent._class, class(ToolBar)))
      {
         ToolBar parent = (ToolBar)this.parent;
         parent.AddButton(this);
      }
   };

   watch(checked)
   {
      if(parent && eClass_IsDerived(parent._class, class(ToolBar)) && checked)
      {
         ToolButton b;
         ToolBar tool = (ToolBar)parent;
         for(b = (ToolButton)parent.firstChild; b; b = (ToolButton)b.next)
         {
            if(eClass_IsDerived(b._class, class(ToolButton)) && b != this)
            {
               b.font = null;
               b.checked = false;
            }
         }
         font = { font.faceName, font.size, bold = true }; 
         tool.OnResize(tool.clientSize.w, tool.clientSize.h);
         tool.MakeControlVisible(this);
      }
   };

   watch(text)
   {
      if(parent && eClass_IsDerived(parent._class, class(ToolBar)))
         parent.OnResize(parent.clientSize.w, parent.clientSize.h);
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

   void SetBitmap()
   {
      if(id)
      {
         if(parent && eClass_IsDerived(parent._class, class(ToolBar)))
         {
            ToolBar toolBar = (ToolBar)parent;
            if(toolBar.iconBag && toolBar.iconBag.icons && toolBar.iconBag.icons.count)
               bitmap = id <= toolBar.iconBag.icons.count ? toolBar.iconBag.icons[id] : null;
         }
      }
      else
         bitmap = null;
   }

   void OnApplyGraphics()
   {
      if(!bitmap && id)
         SetBitmap();
   }

   bool Window::NotifyClicked(ToolButton button, int x, int y, Modifiers mods)
   {
      ToolBar bar = (ToolBar)button.parent;
      return bar.NotifyClicked(bar.master, button, x,y, mods);
   }
}

public class ToggleToolButton : ToolButton
{
   toggle = true;
   size = Size { 24, 24 };
   
   bool Window::NotifyClicked(ToggleToolButton button, int x, int y, Modifiers mods)
   {
      ToolBar bar = (ToolBar)button.parent;
      return bar.NotifyClicked(bar.master, button, x,y, mods);
   }
}

public class GroupToggleToolButton : ToolButton
{
   toggle = true;
   size = Size { 24, 24 };
   GroupToggleToolButton * selected;
   
   bool Window::NotifyClicked(GroupToggleToolButton button, int x, int y, Modifiers mods)
   {
      bool configured = (bool)button.selected;
      bool preselection = (configured && (*button.selected));
      bool reclick = preselection ? (*button.selected == button) : false;
      ToolBar bar = (ToolBar)button.parent;
      if(configured && preselection && !reclick)
      {
         (*button.selected).checked = false;
         *button.selected = button;
      }
      return bar.NotifyClicked(bar.master, button, x,y, mods);
   }
}

public class OptionToolButton : ToolButton
{
   toggle = true;
   size = Size { 24, 24 };
   OptionToolButton * selected;

   bool Window::NotifyClicked(OptionToolButton button, int x, int y, Modifiers mods)
   {
      bool configured = (bool)button.selected;
      bool preselection = (configured && (*button.selected));
      bool reclick = preselection ? (*button.selected == button) : false;
      if(configured && !preselection)
         *button.selected = button;
      else if(configured && !reclick)
      {
         (*button.selected).checked = false;
         *button.selected = button;
      }
      button.checked = true;
      if(!reclick)
      {
         ToolBar bar = (ToolBar)button.parent;
         return bar.NotifyClicked(bar.master, button, x,y, mods);
      }
      return true;
   }
}

class EditableToolButton : ToolButton
{
   EditBox editBox;
   bool renameable;

   virtual bool Window::OnRename(EditableToolButton button, char ** oldName, char ** newName);

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
      return ToolButton::OnKeyDown(key, ch);
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
                  ((EditableToolButton)master).editBox = null;
                  Destroy(0);
                  //OnLeavingEdit();
                  if(master && ((EditableToolButton)master).focusHolder)
                     ((EditableToolButton)master).focusHolder.Activate();
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
                  ToolBar tool = (ToolBar)parent;
                  text = newName;
                  if(tool)
                  {
                     tool.OnResize(tool.clientSize.w, tool.clientSize.h);
                     tool.MakeControlVisible(this);
                  }
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
                     EditableToolButton button = (EditableToolButton)master;
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
