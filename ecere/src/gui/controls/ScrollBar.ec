namespace gui::controls;

import "Window"

#define SB_WIDTH  16
#define SB_HEIGHT 16

#define SNAPDOWN(x, d) \
      if(Abs(x) % (d)) \
      { \
         if(x < 0) x -= ((d) - Abs(x) % (d)); else x -= x % (d); \
      }

#define SNAPUP(x, d) \
      if(Abs(x) % (d)) \
      { \
         if(x > 0) x += ((d) - Abs(x) % (d)); else x += x % (d); \
      }

class ScrollBarBits { bool vertical:1, snap:1, window:1; };

public enum ScrollDirection { horizontal, vertical };
public enum ScrollBarAction { none, up, down, pageDown, pageUp, setPosition, home, end, setRange, wheelUp, wheelDown };
public class ScrollBar : CommonControl
{
   class_property(icon) = "<:ecere>controls/scrollBarHorizontal.png";

public:
   bool Action(ScrollBarAction action, int newPosition, Key key)
   {
      if(this)
      {
         int sbWidth = guiApp.textMode ? 8 : SB_WIDTH;
         int oldPosition = position;
         Window master = this.master;

         // Setup Range and Thumb Size
         range = total - seen + 1;
      /*   if(sbStyle.snap)
            SNAPDOWN(range, lineStep);*/
         range = Max(range, 1);

         if(thumb)
            ComputeThumb();

         // Change position
         switch(action)
         {
            case up:         position -= lineStep; break;
            case down:       position += lineStep; break;
            case pageUp:     position -= pageStep; break;
            case pageDown:   position += pageStep; break;
            case setPosition:   position = newPosition; break;
            case setRange:   position = newPosition; break;
            case home:       position = 0; break;
            case end:        position = range-1; break;
            case wheelUp:    position -= lineStep * 3; break;
            case wheelDown:  position += lineStep * 3; break;
         }

         if(sbStyle.snap)
            SNAPUP(position, lineStep);
            // SNAPDOWN(position, lineStep);

         if(position < 0) position = 0;
         if(position >= range)
            position = range - 1;

         if(thumb)
            PositionThumb();

         // Notify the master
         if(master)
            NotifyScrolling(master, this, action, position, key);
         return position != oldPosition;
      }
      return false;
   }

   virtual void Window::NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key);

   property ScrollDirection direction { property_category $"Appearance" set { sbStyle.vertical = value == vertical; } get { return sbStyle.vertical ? vertical : horizontal; } };
   property bool windowOwned { set { sbStyle.window = value; } /* get { return sbStyle.window; } */ };
   property bool snap { property_category $"Behavior" set { sbStyle.snap = value; } get { return sbStyle.snap; } };
   property int range
   {
      property_category $"Behavior"
      set
      {
         total = value + seen - 1;
         Action(setRange, position, 0);
      }
      get { return range; }
   };
   // Improve this, needs to be done in 2 so updates commented out for seen
   property int seen
   {
      property_category $"Behavior"
      set
      {
         if(this)
         {
            value = Max(1,value);
            if(sbStyle.snap)
               SNAPDOWN(value, lineStep);
            seen = value;
            Action(setRange, position, 0);
         }
      }
      get { return seen; }
   };
   property int total
   {
      property_category $"Behavior"
      set
      {
         if(this)
         {
            if(!value) value = seen;
            total = value;
            Action(setRange, position, 0);
         }
      }
      get { return total; }
   };

   property int lineStep { property_category $"Behavior" set { if(this) lineStep = value; } get { return lineStep; } };
   property int pageStep { property_category $"Behavior" set { if(this) pageStep = value; } get { return pageStep; } };
   property int thumbPosition { property_category $"Behavior" set { Action(setPosition, value, 0); } get { return position; } };

private:
   ScrollBar()
   {
      lineStep = 1;
      pageStep = 5;
      seen = 1;
      total = 100;
      range = total - seen + 1;
      return true;
   }

   background = Color { 224,224,224 };

   ScrollBarBits sbStyle;
   int lineStep, pageStep;
   int range, seen, total;

   bool ButtonMouseLeave(Window control, Modifiers mods)
   {
      timer.Stop();
      timer2.Stop();
      return true;
   }

   bool ButtonReleased(Window control, int x, int y, Modifiers mods)
   {
      action = none;
      ButtonMouseLeave(control, mods);
      return true;
   }

   bool ButtonMouseOver(Window control, int x, int y, Modifiers mods)
   {
      if(action == up || action == down)
         timer2.Start();
      return true;
   }

   public Button downBtn
   {
      this, inactive = true;
      NotifyMouseLeave = ButtonMouseLeave, NotifyReleased = ButtonReleased, NotifyMouseOver = ButtonMouseOver;

      bool NotifyPushed(Button button, int x, int y, Modifiers mods)
      {
         action = down;
         Action(action, 0, Key { modifiers = mods });
         timer.Start();
         return true;
      }
   };
   public Button upBtn
   {
      this, inactive = true;
      NotifyMouseLeave = ButtonMouseLeave, NotifyReleased = ButtonReleased, NotifyMouseOver = ButtonMouseOver;

      bool NotifyPushed(Button button, int x, int y, Modifiers mods)
      {
         action = up;
         Action(action, 0, Key { modifiers = mods });
         timer.Start();
         return true;
      }
   };
   public Button thumb
   {
      this, stayUp = true, NotifyReleased = ButtonReleased;

      bool NotifyPushed(Button button, int x, int y, Modifiers mods)
      {
         thumbClick.x = x;
         thumbClick.y = y;
         action = setPosition;
         return true;
      }

      bool NotifyMouseMove(Button control, int x, int y, Modifiers mods)
      {
         if(action == setPosition && !mods.isSideEffect)
         {
            int position;
            int height;

            if(sbStyle.vertical)
            {
               height = (clientSize.h - upBtn.size.h - downBtn.size.h - thumbSize);
               if(guiApp.textMode)
               {
                  SNAPUP(height, textCellH);
               }
               position = y - thumbClick.y + thumb.position.y;
               if(height)
                  position = (int)((int64)(position - SB_HEIGHT) * (range - 1) / height);
               if(guiApp.textMode)
               {
                  SNAPUP(position, textCellH);
               }
            }
            else
            {
               height = (clientSize.w - upBtn.size.w - downBtn.size.w - thumbSize);
               if(guiApp.textMode)
               {
                  SNAPUP(height, textCellW);
               }
               position = x - thumbClick.x + thumb.position.x;
               if(height)
                  position = (int)((int64)(position - upBtn.size.w) * (range - 1) / height);
               if(guiApp.textMode)
               {
                  SNAPUP(position, textCellW);
               }
            }

            if(height)
            {
               if(sbStyle.snap)
                  SNAPDOWN(position, lineStep);
               if(position == 0)
                  Action(setPosition, position, Key { modifiers = mods });
               else
                  Action(setPosition, position, Key { modifiers = mods });
            }
         }
         return true;
      }
   };

   bool fixedThumb;

   int position, mousePosition;
   public int thumbSize;
   int thumbPos;
   Timer timer
   {
      userData = this, delay = 0.5;

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
      userData = this, delay = 0.1;
      bool DelayExpired()
      {
         if(action != up && action != down)
         {
            if(inside)
            {
               if(mousePosition < thumbPos)
                  action = pageUp;
               else if(mousePosition >= thumbPos + thumbSize)
                  action = pageDown;
               else
                  action = none;
               if(action)
                  Action(action, 0, 0);
               Update(null);
            }
         }
         else
            Action(action, 0, 0);
         return true;
      }
   };

   ScrollBarAction action;
   bool draggingThumb;
   Point pos, thumbClick;
   bool inside;

   void OnRedraw(Surface surface)
   {
      int sbWidth = SB_WIDTH;

      if(guiApp.textMode)
      {
         sbWidth = 8;
         surface.DrawingChar(177);
         surface.SetForeground(Color { 0, 0, 170 });
         surface.Area(0,0, clientSize.w-1, clientSize.h-1);
      }

      if((action == pageUp || action == pageDown) && inside)
      {
         surface.SetBackground(Color { 85, 85, 85 });
         if(sbStyle.vertical)
         {
            if(action == pageUp)
               surface.Area(0, SB_HEIGHT, clientSize.w-1, thumbPos+thumbSize/2-1);
            else if(action == pageDown)
               surface.Area(0, thumbPos +thumbSize/2, clientSize.w-1, clientSize.h - SB_HEIGHT-1);
         }
         else
         {
            if(action == pageUp)
               surface.Area(sbWidth, 0, thumbPos + thumbSize/2-1, clientSize.h-1);
            if(action == pageDown)
               surface.Area(thumbPos+thumbSize/2, 0, clientSize.w - sbWidth - 1, clientSize.h-1);
         }
      }
   }

   bool OnPostCreate()
   {
      if(sbStyle.vertical)
      {
         downBtn.size.h = SB_HEIGHT;
         downBtn.anchor = Anchor { left = 0, right = 0, bottom = 0 };
         downBtn.bitmap = { fileName = "<:ecere>elements/arrowDown.png" };
         downBtn.symbol = 31;

         upBtn.size.h = SB_HEIGHT;
         upBtn.anchor = Anchor { left = 0, right = 0, bottom = 0 };
         upBtn.bitmap = { fileName = "<:ecere>elements/arrowUp.png" };
         upBtn.symbol = 30;
      }
      else
      {
         downBtn.size.w = SB_HEIGHT;
         downBtn.anchor = Anchor { top = 0, bottom = 0, right = 0 };
         downBtn.bitmap = { fileName = "<:ecere>elements/arrowRight.png" };
         downBtn.symbol = 16;

         upBtn.size.w = SB_HEIGHT;
         upBtn.anchor = Anchor { left = 0, top = 0, bottom = 0 };
         upBtn.bitmap = { fileName = "<:ecere>elements/arrowLeft.png" };
         upBtn.symbol = 17;
      }
      Action(setPosition, position, 0);
      return true;
   }

   void PositionThumb()
   {
      if(range > 1)
      {
         // Move the thumb
         if(sbStyle.vertical)
         {
            int height = (clientSize.h - upBtn.size.h - downBtn.size.h - thumbSize);
            if(guiApp.textMode)
            {
               SNAPUP(height, textCellH);
            }
            thumbPos = upBtn.size.h + (int)((int64)position * height / (range - 1));
            if(guiApp.textMode)
            {
               SNAPUP(thumbPos, textCellH);
            }

            thumb.SetInitSize({ size.w,thumbSize });
            thumb.Move(0,thumbPos, size.w,thumbSize);
         }
         else
         {
            int width = (clientSize.w - upBtn.size.w - downBtn.size.w - thumbSize);
            if(guiApp.textMode)
            {
               SNAPUP(width, textCellW);
            }
            thumbPos = upBtn.size.w + (int)((int64)position * width / (range - 1));
            if(guiApp.textMode)
            {
               SNAPUP(thumbPos, textCellW);
            }

            thumb.SetInitSize({ thumbSize, size.h });
            thumb.Move(thumbPos, 0, thumbSize, size.h);
         }
      }
   }

   void OnApplyGraphics()
   {
      int sbWidth = SB_WIDTH;
      if(guiApp.textMode)
      {
         sbWidth = 8;
         upBtn.background = Color { 0, 170, 170 };
         downBtn.background = Color { 0, 170, 170 };
         thumb.background = Color { 0, 170, 170 };
         background = Color { 0, 170, 170 };
      }
      else
      {
         // What to do here?
         upBtn.background = formColor;
         downBtn.background = formColor;
         thumb.background = formColor;
         background = Color { 224, 224, 224 };
      }
      if(sbStyle.vertical)
      {
         downBtn.size.h = SB_HEIGHT;
         downBtn.anchor = Anchor { left = 0, bottom = 0, right = 0 };

         upBtn.size.h = SB_HEIGHT;
         upBtn.anchor = Anchor { left = 0, right = 0, top = 0 };

         thumb.SetInitSize({ Max(clientSize.w, sbWidth), thumbSize });
         thumb.Move(0,0, Max(clientSize.w, sbWidth), thumbSize);
      }
      else
      {
         downBtn.size.w = SB_HEIGHT;
         downBtn.anchor = Anchor { top = 0, bottom = 0, right = 0 };

         upBtn.size.w = SB_HEIGHT;
         upBtn.anchor = Anchor { left = 0, top = 0, bottom = 0 };

         thumb.SetInitSize({ thumbSize, Max(clientSize.h, SB_HEIGHT) });
         thumb.Move(0,0, thumbSize, Max(clientSize.h, SB_HEIGHT));
      }

      PositionThumb();
   }

   bool OnResizing(int *w, int *h)
   {
      int sbWidth = guiApp.textMode ? 8 : SB_WIDTH;
      if(sbStyle.vertical)
      {
         if(!*h) *h = 100;
         *w = Max(*w, sbWidth);
         *h = Max(*h, SB_HEIGHT * 2 + SB_HEIGHT);
      }
      else
      {
         if(!*w) *w = 100;
         *h = Max(*h, SB_HEIGHT);
         *w = Max(*w, sbWidth * 2 + sbWidth);
      }
      return true;
   }

   void ComputeThumb()
   {
      if(!fixedThumb)
      {
         int sbWidth = guiApp.textMode ? 8 : SB_WIDTH;
         if(total)
         {
            int size;
            if(sbStyle.vertical)
               size = clientSize.h - upBtn.size.h - downBtn.size.h;
            else
               size = clientSize.w - upBtn.size.w - downBtn.size.w;
            thumbSize = seen * size / total;
         }
         else
            thumbSize = 0;

         if(sbStyle.vertical)
         {
            thumbSize = Min(thumbSize, clientSize.h - upBtn.size.h -  downBtn.size.h - 1);
            thumbSize = Max(thumbSize, SB_HEIGHT);
         }
         else
         {
            thumbSize = Min(thumbSize, clientSize.w - upBtn.size.w - downBtn.size.w - 1);
            thumbSize = Max(thumbSize, sbWidth);
         }
      }
      else if(sbStyle.vertical)
         thumbSize = thumb.size.h;
      else
         thumbSize = thumb.size.w;
   }

   void OnResize(int w, int h)
   {
      if(thumb)
      {
         if(!sbStyle.window)
            Action(setPosition, position, 0);
         else
         {
            // This makes sure our thumb size is recomputed
            ComputeThumb();
            PositionThumb();
         }
      }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      int pos = (sbStyle.vertical) ? y : x;

      Capture();

      if(pos < thumbPos)
         action = pageUp;
      else
         action = pageDown;

      Action(action, 0, Key { modifiers = mods });
      timer.Start();

      Update(null);
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      action = none;
      ButtonReleased(null, x, y, mods);
      ReleaseCapture();
      Update(null);
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      mousePosition = sbStyle.vertical ? y : x;
      return true;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      inside = true;
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      inside = false;
      if(action == pageDown || action == pageUp)
         Update(null);
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case home: Action(home, 0, key); break;
         case end:  Action(end, 0, key); break;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case left:
         case up:     Action(up, 0, key); break;
         case right:
         case down:
            Action(down, 0, key);
            break;
         case pageUp:   Action(pageUp, 0, key); break;
         case pageDown:  Action(pageDown, 0, key); break;
      }
      return true;
   }

   watch(disabled)
   {
      thumb.visible = !disabled;
   };
};

void SBSetSeen(ScrollBar sb, int value)
{
   value = Max(1,value);
   if(sb.sbStyle.snap)
      SNAPDOWN(value, *&sb.lineStep);
   *&sb.seen = value;
   sb.range = Max(sb.total - sb.seen + 1, 1);
}

void SBSetTotal(ScrollBar sb, int value)
{
   if(!value) value = *&sb.seen;
   *&sb.total = value;
   sb.range = Max(sb.total - sb.seen + 1, 1);
}
