import "Window"

namespace gui::controls;

struct ToolTipTextLine
{
   char * string;
   int len;
   int width;
};

public class ToolTip : Window
{
   borderStyle = contour;
   background = lightYellow;
   autoCreate = false;
   interim = true;
   clickThrough = true;
   creationActivation = doNothing;

   Window tippedWindow;
   Point pos;

   bool (* OrigOnMouseOver)(Window window, int x, int y, Modifiers mods);
   bool (* OrigOnMouseLeave)(Window window, Modifiers mods);
   bool (* OrigOnMouseMove)(Window window, int x, int y, Modifiers mods);
   bool (* OrigOnLeftButtonDown)(Window window, int x, int y, Modifiers mods);

   int lh, maxW;
   Array<ToolTipTextLine> lines { };
   String tip;
   int margin; margin = 2;
   Point offset; offset = { 0, 20 };
   bool over;

   public property const String tip
   {
      set
      {
         delete tip;
         lines.Free();
         if(value)
         {
            int c;
            char ch, next;
            int start = 0;

            tip = CopyString(value);
            next = tip[0];
            for(c = 0; (ch = next); c++)
            {
               next = tip[c+1];
               if(ch == '\n' || next == '\0')
               {
                  lines.Add({ tip + start, c - start + (next == '\0') });
                  start = c+1;
               }
            }
         }
      }
      get { return tip; }
   }

   bool OnLoadGraphics()
   {
      maxW = 0;
      display.FontExtent(fontObject, " ", 1, null, &lh);
      for(l : lines)
      {
         int w;
         display.FontExtent(fontObject, l.string, l.len, &w, null);
         l.width = w;
         if(w > maxW) maxW = w;
      }
      clientSize = { maxW + 2*margin, lh * lines.count + 2*margin };
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      closeTimer.Start();
      return true;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      closeTimer.Stop();
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Destroy(0);
      return true;
   }

   Timer timer
   {
      this, 0.5, userData = this;

      bool DelayExpired()
      {
         timer.Stop();
         position =
         {
            pos.x + offset.x + tippedWindow.clientStart.x +
               tippedWindow.absPosition.x - parent.position.x;
            pos.y + offset.y + tippedWindow.clientStart.y +
               tippedWindow.absPosition.y - parent.position.y;
         };
         Create();
         return true;
      }
   };

   Timer closeTimer
   {
      this, 0.3, userData = this;

      bool DelayExpired()
      {
         closeTimer.Stop();
         Destroy(0);

         return true;
      }
   };

   watch(parent)
   {
      if(tippedWindow && tippedWindow == master)
      {
         tippedWindow.OnMouseOver = OrigOnMouseOver;
         tippedWindow.OnMouseLeave = OrigOnMouseLeave;
         tippedWindow.OnMouseMove = OrigOnMouseMove;
         tippedWindow.OnLeftButtonDown = OrigOnLeftButtonDown;
         master = null;
         delete tippedWindow;
      }
      if(parent && parent.parent)
      {
         Window value = parent;
         parent = null;
         tippedWindow = value;
         incref tippedWindow;
         master = tippedWindow;
         OrigOnMouseOver = value.OnMouseOver;
         OrigOnMouseLeave = value.OnMouseLeave;
         OrigOnMouseMove = value.OnMouseMove;
         OrigOnLeftButtonDown = value.OnLeftButtonDown;
         tippedWindow.OnMouseOver = OnMouseOverHandler;
         tippedWindow.OnMouseLeave = OnMouseLeaveHandler;
         tippedWindow.OnMouseMove = OnMouseMoveHandler;
         tippedWindow.OnLeftButtonDown = OnLeftButtonDownHandler;
      }
   };
   ~ToolTip()
   {
      timer.Stop();
      closeTimer.Stop();
      if(tippedWindow)
      {
         tippedWindow.OnMouseOver = OrigOnMouseOver;
         tippedWindow.OnMouseLeave = OrigOnMouseLeave;
         tippedWindow.OnMouseMove = OrigOnMouseMove;
         tippedWindow.OnLeftButtonDown = OrigOnLeftButtonDown;
         delete tippedWindow;
      }
      delete tip;
   }

   ToolTip ::Find(Window window)
   {
      OldLink link;

      // NOTE: Window::nextSlave is slow and not suitable for iteration
      for(link = window.slaves.first; link; link = link.next)
      {
         Window w = link.data;
         if(eClass_IsDerived(w._class, class(ToolTip)))
            return (ToolTip)w;
      }
      return null;
   }

   bool Window::OnMouseOverHandler(int x, int y, Modifiers mods)
   {
      ToolTip toolTip = ToolTip::Find(this);
      if(toolTip)
      {
         toolTip.over = true;
         toolTip.pos = { x, y };
         toolTip.closeTimer.Stop();
         if(!mods.isSideEffect && !toolTip.created && rootWindow.active && !mods.left)
            toolTip.timer.Start();
         return toolTip.OrigOnMouseOver ? toolTip.OrigOnMouseOver(this, x, y, mods) : true;
      }
      return true;
   }

   bool Window::OnMouseLeaveHandler(Modifiers mods)
   {
      ToolTip toolTip = ToolTip::Find(this);
      if(toolTip)
      {
         toolTip.over = false;
         if(toolTip.timer.started)
            toolTip.timer.Stop();
         toolTip.closeTimer.Start();
         return toolTip.OrigOnMouseLeave ? toolTip.OrigOnMouseLeave(this, mods) : true;
      }
      return true;
   }

   bool Window::OnLeftButtonDownHandler(int x, int y, Modifiers mods)
   {
      ToolTip toolTip = ToolTip::Find(this);
      if(toolTip)
      {
         toolTip.timer.Stop();
         toolTip.Destroy(0);
         return toolTip.OrigOnLeftButtonDown ? toolTip.OrigOnLeftButtonDown(this, x, y, mods) : true;
      }
      return true;
   }

   bool Window::OnMouseMoveHandler(int x, int y, Modifiers mods)
   {
      ToolTip toolTip = ToolTip::Find(this);
      if(toolTip && toolTip.over)
      {
         toolTip.pos = { x, y };
         toolTip.closeTimer.Stop();
         if(!mods.isSideEffect && !toolTip.created && rootWindow.active && !mods.left)
         {
            toolTip.timer.Stop();
            toolTip.timer.Start();
         }
         return toolTip.OrigOnMouseMove ? toolTip.OrigOnMouseMove(this, x, y, mods) : true;
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int y = margin;
      for(l : lines)
      {
         surface.WriteText(margin, y, l.string, l.len);
         y += lh;
      }
   }
}

// NOTE: I'm putting this here for now because I don't have time to update all the makefiles right now
import "Stacker"

public class ToolBar : Stacker
{
   direction = horizontal;
   background = formColor;
   gap = 0;
   inactive = true;

   anchor = Anchor { left = 0, right = 0 };
   clientSize = { h = 32 };
   borderStyle = bevel;

   watch(master)
   {
      Window w;
      for(w = firstChild; w; w = w.next)
         w.master = master;
   };
}

public class ToolButton : Button
{
   bevelOver = true;
   size = Size { 24, 24 };
   opacity = 0;
   bitmapAlignment = center;
   MenuItem * menuItemPtr;

   watch(master)
   {
      if(menuItemPtr)
      {
         Window master = this.master;
         if(master && master.parent && !eClass_IsDerived(master._class, class(Stacker)))
         {
            MenuItem menuItem = this.menuItem;
            BitmapResource bmp;

            if(menuItem && (bmp = menuItem.bitmap))
            {
               //bitmap = bmp;
               // We cannot reuse the same BitmapResource object here, as a BitmapResource is meant to be added with AddResource to a single Window
               bitmap = { fileName = bmp.fileName, grayed = bmp.grayed, monochrome = bmp.monochrome, transparent = bmp.transparent, alphaBlend = bmp.alphaBlend, keepData = bmp.keepData };
            }
         }
      }
   };

   NotifyClicked = SelectMenuItem;

   bool Window::SelectMenuItem(Button button, int x, int y, Modifiers mods)
   {
      ToolButton toolButton = (ToolButton)button;
      MenuItem menuItem = toolButton.menuItem;
      return menuItem ? menuItem.NotifySelect(this, menuItem, 0) : 0;
   }

public:
   property MenuItem * menuItemPtr { set { menuItemPtr = value; } }
   property MenuItem menuItem
   {
      get
      {
         MenuItem menuItem = menuItemPtr ? *(MenuItem *)((byte *)master + (uintptr)menuItemPtr) : null;
         return menuItem;
      }
   }
}

public class ToolSeparator : Window
{
   size = Size { 4, 24 };
   opacity = 0;

   void OnRedraw(Surface surface)
   {
      int x = clientSize.w / 2 - 1;
      surface.foreground = Color { 85, 85, 85 };
      surface.VLine(0, 23, x);
      surface.foreground = white;
      surface.VLine(0, 23, x+1);
   }
}
