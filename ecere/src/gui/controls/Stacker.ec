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

public class RepButton : Button
{
public:
   bool pressing;
   isRemote = true;
   inactive = true;
   
   property Seconds delay { set { timer2.delay = value; } }
   property Seconds delay0 { set { timer.delay = value; } }
   
   bool OnKeyHit(Key key, unichar ch)
   {
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         NotifyPushed(master, this, 0,0, key.modifiers);
         return false;
      }
      return true;
   }

   bool OnKeyUp(Key key, unichar ch)
   {
      if(key == hotKey)
      {
         NotifyReleased(master, this, 0,0, key.modifiers);
         return false;
      }
      return true;
   }

   bool NotifyPushed(RepButton button, int x, int y, Modifiers mods)
   {
      button.pressing = true;
      button.NotifyClicked(this, button, x, y, mods);
      button.timer.Start();
      return true;
   }

   bool NotifyMouseLeave(RepButton button, Modifiers mods)
   {
      button.timer.Stop();
      button.timer2.Stop();
      return true;
   }

   bool NotifyReleased(RepButton button, int x, int y, Modifiers mods)
   {
      button.pressing = false;
      button.NotifyMouseLeave(this, button, mods);
      return false;
   }

   bool NotifyMouseOver(RepButton button, int x, int y, Modifiers mods)
   {
      if(button.pressing)
         button.timer2.Start();
      return true;
   }

   Timer timer
   {
      this, delay = 0.1;

      bool DelayExpired()
      {
         timer.Stop();
         timer2.Start();
         timer2.DelayExpired(this);
         return true;
      }
   };
   Timer timer2
   {
      this, delay = 0.1;
      bool DelayExpired()
      {
         NotifyClicked(master, this, 0, 0, 0);
         return true;
      }
   };
}

static define stackerScrolling = 16;

public enum FlipStackerSpringMode { none, previous, next };

public class FlipStacker : Window
{
   size = { };
public:
   FlipStackerSpringMode spring;
}

public class Stacker : Window
{
public:

   property ScrollDirection direction { set { direction = value; } get { return direction; } };
   property int gap { set { gap = value; } get { return gap; } };
   property bool reverse { set { reverse = value; } get { return reverse; } };

   property bool scrollable
   {
      set
      {
         if(value != scrollable)
         {
            scrollable = value;
            // how to recall these?
            //GetDecorationsSize(...);
            //SetWindowArea(...);
            OnResize(clientSize.w, clientSize.h);
         }
      }
      get { return scrollable; }
   }

   property Array<Window> controls { get { return controls; } };

private:
   ScrollDirection direction;
   int gap;
   bool scrollable;
   Array<Window> controls { };
   bool reverse;
   RepButton left
   {
      this, visible = false, bevelOver = true, nonClient = true, keyRepeat = true, opacity = 0;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(direction == horizontal)
         {
            scroll.x -= stackerScrolling;
            if(scroll.x == 0) { left.disabled = true; left.OnLeftButtonUp(-1,0,0); }
         }
         else
         {
            scroll.y -= stackerScrolling;
            if(scroll.y == 0) { left.disabled = true; left.OnLeftButtonUp(-1,0,0); }
         }
         right.disabled = false;
         size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
         return true;
      }
   };
   RepButton right
   {
      this, visible = false, bevelOver = true, nonClient = true, keyRepeat = true, opacity = 0;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(direction == horizontal)
         {
            scroll.x += stackerScrolling;
            if(scroll.x + clientSize.w >= scrollArea.w) { right.disabled = true; right.OnLeftButtonUp(-1,0,0); }
         }
         else
         {
            scroll.y += stackerScrolling;
            if(scroll.y + clientSize.h >= scrollArea.h) { right.disabled = true; right.OnLeftButtonUp(-1,0,0); }
         }
         left.disabled = false;
         size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
         return true;
      }
   };

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      Window::GetDecorationsSize(w, h);
      if(scrollable)
      {
         if(direction == vertical) *h += left.size.w + right.size.w + 8; else *w += left.size.h + right.size.h + 8;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      Window::SetWindowArea(x, y, w, h, cw, ch);
      if(scrollable)
      {
         if(direction == vertical) *y += left.size.w + 4; else *x += left.size.h + 4;
      }
   }

   ~Stacker()
   {
      controls.Free();
   }

   bool OnPostCreate()
   {
      OnResize(clientSize.w, clientSize.h);

      if(direction == vertical)
      {
         left.bitmap = { "<:ecere>elements/arrowTop.png" };
         left.anchor = { top = 2, left = 2, right = 2 };

         right.bitmap = { "<:ecere>elements/arrowBottom.png" };
         right.anchor = { bottom = 2, left = 2, right = 2 };
      }
      else
      {
         left.bitmap = { "<:ecere>elements/arrowLeft.png" };
         left.anchor = { left = 2, top = 2, bottom = 2 };

         right.bitmap = { "<:ecere>elements/arrowRight.png" };
         right.anchor = { right = 2, top = 2, bottom = 2 };
      }
      return true;
   }

   gap = 5;
   direction = vertical;

   void OnResize(int width, int height)
   {
      // TOIMPROVE: this needs to maintain an order and allow for dynamically adding
      //            children. inserting in the order should also be possible.
      // TOIMPROVE: in Window.ec... it should be possible to change the order of children
      //            at runtime. it should also be possible to choose where dynamically
      //            created children are inserted.

      if(created)
      {
         int y, c;
         Window child;
         Window previousChild = null;
         FlipStacker flip = null;
         Array<Window> newControls { };

         for(c : controls)
         {
            for(child = firstChild; child; child = child.next)
            {
               if(child.nonClient) continue;
               if(c == child)
               {  // add the controls that are still children to the list in the original order
                  newControls.Add(child);
                  break;
               }
            }
            if(!child)
            {
               child = c;
               delete child;
            }
         }
         for(child = firstChild; child; child = child.next)
         {
            if(child.nonClient) continue;
            if(!newControls.Find(child))
            {  // add any addition control at the end if the list to preserve the original order
               // are those two loops required because Window changes the order of children during runtime?
               // when focusing controls for example?
               newControls.Add(child);
               incref child;
            }
         }

         delete controls;
         controls = newControls;
         newControls = null;

         y = 0;
         //for(child = reverse ? lastChild : firstChild; child; child = reverse ? child.prev : child.next)
         for(c = reverse ? controls.count-1 : 0; c<controls.count && c>-1; c += reverse ? -1 : 1)
         {
            child = controls[c];
            if(child.nonClient || !child.visible/* || !child.created*/) continue;
            // would be nice to have a short version of this... like eClass_IsOrIsDerived(child._class, class(FlipStacker))
            if(child._class == class(FlipStacker) || eClass_IsDerived(child._class, class(FlipStacker)))
            {
               flip = (FlipStacker)child;
               break;
            }
            previousChild = child;

            if(direction == vertical)
            {
               if(reverse) child.anchor.bottom = y;
               else        child.anchor.top = y;
               y += child.size.h + gap;
            }
            else
            {
               if(reverse) child.anchor.right = y;
               else        child.anchor.left = y;
               y += child.size.w + gap;
            }
         }

         if(flip)
         {
            y = 0;
            child = null;
            //for(child = reverse ? firstChild : lastChild; child && child != (Window)flip; child = reverse ? child.next : child.prev)
            for(c = (reverse ? 0 : controls.count-1); c<controls.count && c>-1 && child != (Window)flip; c += (reverse ? 1 : -1))
            {
               child = controls[c];
               if(child.nonClient || !child.visible/* || !child.created*/) continue;
               if(direction == vertical)
               {
                  if(reverse) child.anchor.top = y;
                  else        child.anchor.bottom = y;
                  y += child.size.h + gap;
               }
               else
               {
                  if(reverse) child.anchor.left = y;
                  else        child.anchor.right = y;
                  y += child.size.w + gap;
               }
            }
            if(flip.spring == previous && previousChild)
            {
               if(direction == vertical)
               {
                  if(reverse) previousChild.anchor.top = y;
                  else        previousChild.anchor.bottom = y;
               }
               else
               {
                  if(reverse) previousChild.anchor.left = y;
                  else        previousChild.anchor.right = y;
               }
            }
         }

         if(scrollable && y > ((direction == horizontal) ? width : height))
         {
            scrollArea = (direction == horizontal) ? { y, 0 } : { 0, y };
            left.visible = true;
            right.visible = true;
         }
         else
         {
            left.visible = false;
            right.visible = false;
            scrollArea = { 0, 0 };
         }

         // FOR WHEN SCROLLING OCCURED
         for(child : controls)
            child.anchor = child.anchor;

         if(scrollable)
         {
            if(direction == horizontal)
            {
               left.disabled = (scroll.x == 0);
               right.disabled = (scroll.x + clientSize.w >= scrollArea.w);
            }
            else
            {
               left.disabled = (scroll.y == 0);
               right.disabled = (scroll.y + clientSize.h >= scrollArea.h);
            }
            if(left.disabled && left.buttonState == down) left.OnLeftButtonUp(-1,0,0);
            if(right.disabled && right.buttonState == down) right.OnLeftButtonUp(-1,0,0);
         }
      }
   }

   public void DestroyChildren()
   {
      Window child, next;

      for(child = firstChild; child; child = next)
      {
         next = child ? child.next : null;
         if(!child.nonClient)
         {
            child.Destroy(0);
            child.parent = null;
            delete child;
         }
      }
   }

   public void MakeControlVisible(Window control)
   {
      if(direction == horizontal)
      {
         int x;
         if(control.position.x - stackerScrolling < scroll.x)
         {
            x = control.position.x;
            if(clientSize.w > control.size.w)
               x -=(clientSize.w - control.size.w - stackerScrolling) / 2;
            scroll.x = Max(x, 0);
            size = size;
         }
         else if(control.position.x + control.size.w + stackerScrolling > scroll.x + clientSize.w)
         {
            x = control.position.x;
            if(clientSize.w > control.size.w)
               x -=(clientSize.w - control.size.w + stackerScrolling) / 2;
            scroll.x = Max(x, 0);
            size = size;
         }
      }
      else
      {
         int y;
         if(control.position.y - stackerScrolling < scroll.y)
         {
            y = control.position.y;
            if(clientSize.h > control.size.h)
               y -=(clientSize.h - control.size.h - stackerScrolling) / 2;
            scroll.y = Max(y, 0);
            size = size;
         }
         else if(control.position.y + control.size.h + stackerScrolling > scroll.y + clientSize.h)
         {
            y = control.position.y;
            if(clientSize.h > control.size.h)
               y -=(clientSize.h - control.size.h + stackerScrolling) / 2;
            scroll.y = Max(y, 0);
            size = size;
         }
      }
   }
}
