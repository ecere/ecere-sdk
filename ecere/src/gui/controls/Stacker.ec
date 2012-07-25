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

class StackerBits
{
   bool reverse:1, scrollable:1, flipSpring:1, autoSize:1, endButtons:1;

   // internals
   bool holdChildMonitoring:1;
}

public class Stacker : Window
{
public:

   property ScrollDirection direction { set { direction = value; } get { return direction; } };
   property int gap { set { gap = value; } get { return gap; } };
   property bool reverse { set { bits.reverse = value; } get { return bits.reverse; } };

   property bool scrollable
   {
      set
      {
         if(value != bits.scrollable)
         {
            bits.scrollable = value;
            // how to recall these?
            //GetDecorationsSize(...);
            //SetWindowArea(...);
            OnResize(clientSize.w, clientSize.h);
         }
      }
      get { return bits.scrollable; }
   }

   property Array<Window> controls { get { return controls; } };

   property Window flipper { set { flipper = value; } get { return flipper; } };
   property bool flipSpring { set { bits.flipSpring = value; } get { return bits.flipSpring; } };
   property bool autoSize
   {
      set
      {
         bits.autoSize = value;
         if(value)
         {
            // Auto Size implementation conflicts with this base Window property, resulting in overhead and potential glitches:
            // dontAutoScrollArea = false;
            modifyVirtualArea = false;
         }
      }
      get { return bits.autoSize; }
   };
   property int margin { set { margin = value; } get { return margin; } };
   property bool endButtons
   {
      set
      {
         if(bits.endButtons && scrollable && !value)
         {
            left.visible = false;
            right.visible = false;
         }
         bits.endButtons = value;
         if(value && scrollable)
         {
            left.visible = true;
            right.visible = true;
         }
      }
      get { return bits.endButtons; }
   };

private:
   StackerBits bits;
   ScrollDirection direction;
   int gap;
   int margin;
   Array<Window> controls { };
   Window flipper;

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      if(bits.endButtons)
      {
         bool ld = false, rd = false;
         left.disabled = false;
         right.disabled = false;
         if(direction == horizontal)
         {
            if(position == 0) ld = true;
            if(position + clientSize.w >= scrollArea.w) rd = true;
         }
         else
         {
            if(position == 0) ld = true;
            if(position + clientSize.h >= scrollArea.h) rd = true;
         }
         if(left.disabled != ld)  { left.disabled = ld;  left.OnLeftButtonUp(-1,0,0); }
         if(right.disabled != rd) { right.disabled = rd; right.OnLeftButtonUp(-1,0,0); }
      }
   }

   RepButton left
   {
      nonClient = true, parent = this, visible = false, bevelOver = true, keyRepeat = true, opacity = 0;

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
      nonClient = true, parent = this, visible = false, bevelOver = true, keyRepeat = true, opacity = 0;

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

   bool inAutoSize;

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      Window::GetDecorationsSize(w, h);
      if(bits.scrollable && bits.endButtons)
      {
         if(direction == vertical) *h += left.size.h + right.size.h + 8; else *w += left.size.w + right.size.w + 8;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      Window::SetWindowArea(x, y, w, h, cw, ch);
      if(bits.scrollable && bits.endButtons)
      {
         if(direction == vertical) *y += left.size.h + 4; else *x += left.size.w + 4;
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
         left.bitmap = { "<:ecere>elements/arrowUp.png" };
         left.anchor = { top = 2, left = 2, right = 2 };

         right.bitmap = { "<:ecere>elements/arrowDown.png" };
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
   endButtons = true;

   void OnChildAddedOrRemoved(Window child, bool removed)
   {
      if(!bits.holdChildMonitoring)
         UpdateControls();
   }
   void OnChildVisibilityToggled(Window child, bool visible)
   {
      DoResize(size.w, size.h); // todo: improve with DoPartialResize(size.w, size.h, client);
      size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
   }
   void OnChildResized(Window child, int x, int y, int w, int h)
   {
      DoResize(size.w, size.h); // todo: improve with DoPartialResize(size.w, size.h, client);
      size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
   }

   void UpdateControls()
   {
      Window child;
      Array<Window> newControls { };
      for(c : controls; !c.nonClient)
      {
         child = null;
         if(!c.destroyed)
         {
            for(child = firstChild; child; child = child.next)
            {
               if(c == child)
               {
                  newControls.Add(child);
                  break;
               }
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
         if(child.nonClient || child.destroyed || !child.created) continue;
         if(!newControls.Find(child))
         {
            newControls.Add(child);
            incref child;
         }
      }
      delete controls;
      controls = newControls;
      newControls = null;
   }

   void OnResize(int width, int height)
   {
      if(!inAutoSize)
         DoResize(width, height);
   }

   void DoResize(int width, int height)
   {
      // TOIMPROVE: this needs to maintain an order and allow for dynamically adding
      //            children. inserting in the order should also be possible.
      // TOIMPROVE: in Window.ec... it should be possible to change the order of children
      //            at runtime. it should also be possible to choose where dynamically
      //            created children are inserted.

      if(created)
      {
         int y, c;
         bool r = bits.reverse;
         int inc = bits.reverse ? -1 : 1;
         Window child;
         Window flip = null;
         y = margin;

         for(c = bits.reverse ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
         {
            Anchor anchor;
            child = controls[c];
            if(flip && child == flip) break;
            if(child.nonClient || !child.visible) continue;
            anchor = child.anchor;
            if(direction == vertical)
            {
               if(bits.reverse)
               {
                  if(!anchor.bottom.type || anchor.bottom.distance != y)
                     child.anchor.bottom = y;
               }
               else
               {
                  if(!anchor.top.type || anchor.top.distance != y)
                     child.anchor.top = y;
               }
               y += child.size.h + gap;
            }
            else
            {
               if(bits.reverse)
               {
                  if(!anchor.right.type || anchor.right.distance != y)
                     child.anchor.right = y;
               }
               else
               {
                  if(!anchor.left.type || anchor.left.distance != y)
                     child.anchor.left = y;
               }
               y += child.size.w + gap;
            }
            Flip(flipper, child, controls, margin, &bits, &inc, &c, &y, &flip);
         }

         if(flip)
         {
            if(bits.flipSpring)
            {
               if(direction == vertical)
               {
                  if(bits.reverse) flip.anchor.bottom = y;
                  else             flip.anchor.top = y;
               }
               else
               {
                  if(bits.reverse) flip.anchor.right = y;
                  else             flip.anchor.left = y;
               }
            }
         }
         else if(bits.autoSize)
         {
            inAutoSize = true;
            if(direction == vertical)
               //this.clientSize.h = y - gap + margin;
               this.size.h = y - gap + margin + (this.size.h - this.clientSize.h);
            else
               //this.clientSize.w = y - gap + margin;
               this.size.w = y - gap + margin + (this.size.w - this.clientSize.w);
            //Update(null);
            inAutoSize = false;
         }

         if(bits.scrollable && y > ((direction == horizontal) ? width : height))
         {
            scrollArea = (direction == horizontal) ? { y, 0 } : { 0, y };
            if(bits.endButtons)
            {
               left.visible = true;
               right.visible = true;
            }
         }
         else
         {
            left.visible = false;
            right.visible = false;
            scrollArea = { 0, 0 };
         }

         if(bits.scrollable)
         {
            // FOR WHEN SCROLLING OCCURED
            for(child : controls; !child.nonClient && child.visible)
               child.anchor = child.anchor;

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

      bits.holdChildMonitoring = true;
      for(child = firstChild; child; child = next)
      {
         next = child ? child.next : null;
         if(!child.nonClient)
         {
            child.Destroy(0);
            child.parent = null;
         }
      }
      bits.holdChildMonitoring = false;
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

   public Window GetNextStackedItem(Window current, bool previous, Class filter)
   {
      Window result = null;
      Window next = null;
      Window child;
      bool direction = !(reverse^previous);
      int c;
      for(c = (!direction) ? controls.count-1 : 0; c<controls.count && c>-1; c += (!direction) ? -1 : 1)
      {
         child = controls[c];
         if(child.nonClient || !child.created || !child.visible) continue;
         if(filter && !eClass_IsDerived(child._class, filter)) continue;
         next = child;
         break;
      }
      if(current)
      {
         for(c = direction ? controls.count-1 : 0; c<controls.count && c>-1; c += direction ? -1 : 1)
         {
            child = controls[c];
            if(child.nonClient || !child.created || !child.visible) continue;
            if(!eClass_IsDerived(child._class, filter)) continue;
            if(child == current)
               break;
            next = child;
         }
         result = next;
      }
      else
         result = next;
      return result;
   }
}

static void Flip(Window flipper, Window child, Array<Window> controls, int margin, StackerBits * bits, int * inc, int * c, int * y, Window * flip)
{
   if(flipper && !*flip && child == flipper)
   {
      *flip = child;
      (*bits).reverse = !(*bits).reverse;
      *inc = (*bits).reverse ? -1 : 1;
      *c = (*bits).reverse ? controls.count : -1;
      *y = margin;
   }
}
