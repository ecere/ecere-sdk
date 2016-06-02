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

// class RepButton WAS ALREADY DEFINED IN date.ec! The version here broke CalendarControl behavior.

static define stackerScrolling = 16;

class StackerBits
{
   bool reverse:1, scrollable:1, flipSpring:1, autoSize:1, endButtons:1, hoverScroll:1;

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
   property bool hoverScroll
   {
      set { bits.hoverScroll = value; }
      get { return bits.hoverScroll; }
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
      nonClient = true, parent = this, visible = false, bevelOver = true, keyRepeat = true, opacity = 0; delay0 = 0.1;
      clickThrough = true;

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
      nonClient = true, parent = this, visible = false, bevelOver = true, keyRepeat = true, opacity = 0; delay0 = 0.1;
      clickThrough = true;

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
   bool needScrollers;

   bool NeedScrollers(int width, int height)
   {
      bool result = false;
      if(bits.scrollable && bits.endButtons)
      {
         int y = margin, c;
         bool r = bits.reverse;
         int inc = bits.reverse ? -1 : 1;
         Window flip = null;

         for(c = r ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
         {
            Window child = controls[c];
            if(flip && child == flip) break;
            if(child.nonClient || !child.visible) continue;
            if(direction == vertical)
               y += child.size.h + gap;
            else
               y += child.size.w + gap;

            // If this child is the flipper, we flip
            if(flipper && !flip && child == flipper)
            {
               flip = child;
               if(r) { r = false; inc = 1; c = -1; }
               else  { r = true;  inc =-1; c = controls.count; }
               y = margin;
            }
         }
         result = (y > ((direction == horizontal) ? width : height));
      }
      return result;
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      Window::GetDecorationsSize(w, h);
      if(needScrollers)
      {
         if(direction == vertical) *h += left.size.h + right.size.h + 8; else *w += left.size.w + right.size.w + 8;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      needScrollers = NeedScrollers(*w, *h);
      Window::SetWindowArea(x, y, w, h, cw, ch);
      if(needScrollers)
      {
         if(direction == vertical) *y += left.size.h + 4; else *x += left.size.w + 4;
      }
   }

   ~Stacker()
   {
      controls.Free();
   }

   bool OnCreate()
   {
      bits.holdChildMonitoring = true;
      return true;
   }

   bool OnPostCreate()
   {
      bits.holdChildMonitoring = false;
      OnResize(clientSize.w, clientSize.h);

      if(direction == vertical)
      {
         left.bitmap = { "<:ecere>elements/arrowUp.png" };
         left.size.h = 10;
         left.anchor = { top = 2, left = 2, right = 2 };

         right.bitmap = { "<:ecere>elements/arrowDown.png" };
         right.size.h = 10;
         right.anchor = { bottom = 2, left = 2, right = 2 };
      }
      else
      {
         left.bitmap = { "<:ecere>elements/arrowLeft.png" };
         left.size.w = 10;
         left.anchor = { left = 2, top = 2, bottom = 2 };

         right.bitmap = { "<:ecere>elements/arrowRight.png" };
         right.size.w = 10;
         right.anchor = { right = 2, top = 2, bottom = 2 };
      }
      return true;
   }

   gap = 5;
   direction = vertical;
   endButtons = true;

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      int limit = direction == vertical ? size.h : size.w;
      int length = direction == vertical ? scrollArea.h : scrollArea.w;
      if(bits.hoverScroll/* && needScrollers*/ && length > limit)
      {
         int pos = direction == vertical ? y : x;
         if(pos > 0)
         {
            int endZoneSize = (bits.endButtons ? left.size.w : 0) + 16;
            //float ratio = (float)pos / (float)limit;
            float ratio = (float)(Min(Max(endZoneSize, pos), limit - endZoneSize) - endZoneSize) / (float)(limit - endZoneSize * 2);
            int offset = (int)(ratio * (length - limit));
            if(direction == vertical)
               scroll.y = offset;
            else
               scroll.x = offset;
            size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
         }
      }
      return true;
   }

   void OnChildAddedOrRemoved(Window child, bool removed)
   {
      if(!child.nonClient)
      {
         if(removed)
         {
            if((child.destroyed && !destroyed) || child.parent != this)
            {
               Iterator<Window> it { controls };
               if(it.Find(child))
               {
                  it.Remove();
                  delete child;
               }
            }
         }
         else
         {
            if((child.created || (!created && child.autoCreate)) && !child.destroyed && child.parent == this)
            {
               if(!controls.Find(child))
               {
                  controls.Add(child);
                  incref child;
               }
            }
         }
         if(!bits.holdChildMonitoring)
            DoResize(clientSize.w, clientSize.h);
      }
   }
   void OnChildVisibilityToggled(Window child, bool visible)
   {
      DoResize(clientSize.w, clientSize.h); // todo: improve with DoPartialResize(size.w, size.h, client);
      // size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
   }
   void OnChildResized(Window child, int x, int y, int w, int h)
   {
      DoResize(clientSize.w, clientSize.h); // todo: improve with DoPartialResize(size.w, size.h, client);
      // size = size;   // TRIGGER SCROLLING UPDATE (Currently required since we aren't using Window scrollbars)
   }

   /*void UpdateControls()
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
   }*/

   void OnResize(int width, int height)
   {
      if(!bits.holdChildMonitoring && !inAutoSize)
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
         int y = margin, c;
         bool r = bits.reverse;
         int inc = bits.reverse ? -1 : 1;
         Window flip = null;

         for(c = r ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
         {
            Anchor anchor;
            Window child = controls[c];
            if(flip && child == flip) break;
            if(child.nonClient || !child.visible) continue;
            anchor = child.anchor;
            if(direction == vertical)
            {
               if(r)
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
               if(r)
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
            // If this child is the flipper, we flip
            if(flipper && !flip && child == flipper)
            {
               flip = child;
               if(r) { r = false; inc = 1; c = -1; }
               else  { r = true;  inc =-1; c = controls.count; }
               y = margin;
            }
         }

         if(needScrollers ||
            ((bits.scrollable && !bits.endButtons) && (y > ((direction == horizontal) ? size.w : size.h))))
         {
            scrollArea = (direction == horizontal) ? { y, 0 } : { 0, y };
            if(bits.endButtons && !left.visible)
            {
               left.visible = true;
               right.visible = true;
            }
         }
         else
         {
            if(left.visible)
            {
               left.visible = false;
               right.visible = false;
            }
            scrollArea = { 0, 0 };
         }

         if(flip)
         {
            if(bits.flipSpring)
            {
               if(direction == vertical)
               {
                  if(r) flip.anchor.bottom = y;
                  else  flip.anchor.top = y;
               }
               else
               {
                  if(r) flip.anchor.right = y;
                  else  flip.anchor.left = y;
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
            inAutoSize = false;
         }

         if(bits.scrollable)
         {
            // FOR WHEN SCROLLING OCCURRED
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
      // This safe loop with 'left' will jam if the Stacker is destroyed
      if(!destroyed && created)
      {
         bool left = true;
         while(left)
         {
            left = false;
            for(w : controls)
            {
               if(!w.destroyed && w.created)
               {
                  w.Destroy(0);
                  left = true;
                  break;
               }
            }
         }
      }
      else
      {
         // If the stacker is already destroyed, just clear everything
         Iterator<Window> it { controls };
         while(it.pointer = null, it.Next())
         {
            Window w = it.data;
            it.Remove();
            w.Destroy(0);
            delete w;
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
