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

#define OPTIMIZED_RUNTIME_LOOPS

static void Dummy()
{
   Window a;
   Class b;
   eClass_IsDerived(a._class, class(Window));
   //a.OnApplyGraphics();
   //a.OnRedraw(null);
}

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

public enum FlipStackerSpringMode { none, spring };

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

   property Window flipper { set { flipper = value; } get { return flipper; } };
   property FlipStackerSpringMode flipMode { set { flipMode = value; } get { return flipMode; } };

private:
   ScrollDirection direction;
   int gap;
   bool scrollable;
   Array<Window> controls { };
   bool reverse;
   Window flipper;
   FlipStackerSpringMode flipMode;

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

   void Stacker::NotifyChild(Window child, bool removing)
   {
      UpdateControls();
   }
   void Stacker::NotifyClientCreation(Window client)
   {
      DoResize(size.w, size.h); // todo: improve with DoPartialResize(size.w, size.h, client);
   }
   void Stacker::NotifyClientVisibility(Window client)
   {
      DoResize(size.w, size.h); // todo: improve with DoPartialResize(size.w, size.h, client);
   }
   void Stacker::NotifyClientResize(Window client)
   {
      DoResize(size.w, size.h); // todo: improve with DoPartialResize(size.w, size.h, client);
   }

   void UpdateControls()
   {
      Window child;
      Array<Window> newControls { };
      for(c : controls)
      {
         for(child = firstChild; child; child = child.next)
         {
            if(child.nonClient) continue;
            if(c == child)
            {
               newControls.Add(child);
               incref child;
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
         bool r = reverse;
         int inc = reverse ? -1 : 1;
         Window child;
         Window flip = null;

         overseeing = true;

         y = 0;
#ifdef OPTIMIZED_RUNTIME_LOOPS
         if(direction == vertical)
         {
            for(c = reverse ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
            {
               child = controls[c];
               if(flip && child == flip) break;
               if(child.nonClient || !child.visible) continue;
               if(reverse/* && (int)child.anchor.bottom != y*/) child.anchor.bottom = y;
               else      /* if((int)child.anchor.top != y)*/    child.anchor.top = y;
               y += child.size.h + gap;
               Flip(flipper, child, controls, &reverse, &inc, &c, &y, &flip);
            }
         }
         else
         {
            for(c = reverse ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
            {
               child = controls[c];
               if(flip && child == flip) break;
               if(child.nonClient || !child.visible) continue;
               if(reverse/* && (int)child.anchor.right != y*/) child.anchor.right = y;
               else      /* if((int)child.anchor.left != y)*/  child.anchor.left = y;
               y += child.size.w + gap;
               Flip(flipper, child, controls, &reverse, &inc, &c, &y, &flip);
            }
         }
#else
         for(c = reverse ? controls.count-1 : 0; c<controls.count && c>-1; c += inc)
         {
            child = controls[c];
            if(flip && child == flip) break;
            if(child.nonClient || !child.visible) continue;
            if(direction == vertical)
            {
               if(reverse/* && (int)child.anchor.bottom != y*/) child.anchor.bottom = y;
               else      /* if((int)child.anchor.top != y)*/    child.anchor.top = y;
               y += child.size.h + gap;
            }
            else
            {
               if(reverse/* && (int)child.anchor.right != y*/) child.anchor.right = y;
               else      /* if((int)child.anchor.left != y)*/  child.anchor.left = y;
               y += child.size.w + gap;
            }
            Flip(flipper, child, controls, &reverse, &inc, &c, &y, &flip);
         }
#endif

         if(flip)
         {
            if(flipMode == spring)
            {
               if(direction == vertical)
               {
                  if(reverse/* && (int)child.anchor.bottom != y*/) flip.anchor.bottom = y;
                  else      /* if((int)child.anchor.top != y)*/    flip.anchor.top = y;
               }
               else
               {
                  if(reverse/* && (int)child.anchor.right != y*/) flip.anchor.right = y;
                  else      /* if((int)child.anchor.left != y)*/  flip.anchor.left = y;
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

         if(scrollable)
         {
            // FOR WHEN SCROLLING OCCURED
            for(child : controls)
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

         overseeing = false;
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
            // delete child;
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
      int c;// = !direction ? controls.count-1 : 0;
      for(c = (!direction) ? controls.count-1 : 0; c<controls.count && c>-1; c += (!direction) ? -1 : 1)
      {
         //PrintLn(c);
         child = controls[c];
         if(child.nonClient || !child.created || !child.visible) continue;
         if(filter && !eClass_IsDerived(child._class, filter)) continue;
         next = child;
         /*if(next.text)
            PrintLn(next.text);*/
         break;
      }
      //PrintLn("outloop-c-is-", c);
      if(current)
      {
         //next = controls[c];
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

static inline void Flip(Window flipper, Window child, Array<Window> controls, bool * reverse, int * inc, int * c, int * y, Window * flip)
{
   if(flipper && !*flip && child == flipper)
   {
      *flip = child;
      *reverse = !*reverse;
      *inc = *reverse ? -1 : 1;
      *c = *reverse ? controls.count : -1;
      *y = 0;
   }
}
