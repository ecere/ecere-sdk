namespace gui::controls;

import "Window"

public enum TabsPlacement
{
   top, bottom, left, right
};

class TabButton : Button
{
   Tab tab;

   borderStyle = 0;
   opacity = 0;
   drawBehind = true;

   bool OnKeyHit(Key key, unichar ch)
   {
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Button::OnLeftButtonDown(x, y, mods);
      Button::OnLeftButtonUp(x, y, mods);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      ColorKey keys[2] = { { silver, 0.0f }, { white, 1.0f } };
      ColorKey rKeys[2] = { { white, 0.0f }, { silver, 1.0f } };
      // Text
      int tw = 0, th = 0;
      int x, y;
      int w = clientSize.w, h = clientSize.h;
      bool checked = this.checked;
      ButtonState state = buttonState;
      if(state == down) state = over;

      surface.SetForeground(gray);

      x = 0;
      y = 0;

      switch(((TabControl)parent.parent).placement)
      {
         case bottom:
            if(checked) w++;
            surface.DrawLine(x,0,    x,h-3);
            surface.DrawLine(w-2,0,  w-2,h-3);
            break;
         case top:
            if(checked) w++;
            surface.DrawLine(x,2,    x,h-1);
            surface.DrawLine(w-2,2,  w-2,h-1);
            break;
         case right:
            if(checked) h++;
            surface.DrawLine(0,y,    w-3,y);
            surface.DrawLine(0,h-2,  w-3,h-2);
            break;
         case left:
            if(checked) h++;
            surface.DrawLine(2,y,    w-1,y);
            surface.DrawLine(2,h-2,  w-1,h-2);
            break;
      }
      if(!checked)
      {
         if(state == over)
         {
            keys[0].color = lightGray;
            rKeys[1].color = lightGray;
         }
         switch(((TabControl)parent.parent).placement)
         {
            case bottom: surface.Gradient(keys, sizeof(keys) / sizeof(ColorKey), 1, vertical, x+1, 0, w-3, h - 3); break;
            case top:    surface.Gradient(rKeys, sizeof(rKeys) / sizeof(ColorKey), 1, vertical, x+1, 2, w-3, h - 1); break;

            case right:  surface.Gradient(keys, sizeof(keys) / sizeof(ColorKey), 1, horizontal, 0, y+1, w-3, h - 3); break;
            case left:   surface.Gradient(rKeys, sizeof(rKeys) / sizeof(ColorKey), 1, horizontal, 2, y+1, w-1, h - 3); break;
         }
      }
      else
      {
         surface.SetBackground(background /*white*/);
         switch(((TabControl)parent.parent).placement)
         {
            case bottom: surface.Area(x+1, 0, w-3, h - 3); break;
            case top:    surface.Area(x+1, 2, w-3, h - 1); surface.foreground = white; surface.VLine(2, h - 1, x+1); break;
            case right:  surface.Area(0, y+1, w-3, h - 3); break;
            case left:   surface.Area(2, y+1, w-1, h - 3); break;
         }
      }

      if(state == over || checked)
         surface.SetForeground(lightBlue);
      else
         surface.SetForeground(white);

      switch(((TabControl)parent.parent).placement)
      {
         case bottom:
            surface.DrawLine(x+2,h-2, w-4, h-2);
            surface.DrawLine(x+1,  h-3, w-3, h-3);
            break;
         case top:
            surface.DrawLine(x+2,1, w-4, 1);
            surface.DrawLine(x+1,2, w-3, 2);
            break;
         case right:
            surface.DrawLine(w-2, y+2,  w-2, h-4);
            surface.DrawLine(w-3, y+1,  w-3, h-3);
            break;
         case left:
            surface.DrawLine(1, y+2,  1, h-4);
            surface.DrawLine(2, y+1,  2, h-3);
            break;
      }
      if(state == over || checked)
         surface.SetForeground(slateBlue);
      else
         surface.SetForeground(gray);

      switch(((TabControl)parent.parent).placement)
      {
         case bottom:
            surface.DrawLine(x+2,h-1, w-4, h-1);
            surface.PutPixel(x,h-3);
            surface.PutPixel(x+1,h-2);

            surface.PutPixel(w-2, h - 3);
            surface.PutPixel(w-3, h - 2);
            break;
         case top:
            surface.DrawLine(x+2,0, w-4,0);
            surface.PutPixel(x, 2);
            surface.PutPixel(x+1, 1);

            surface.PutPixel(w-2, 2);
            surface.PutPixel(w-3, 1);
            break;
         case right:
            surface.DrawLine(w-1,y+2, w-1, h-4);
            surface.PutPixel(w-3, y);
            surface.PutPixel(w-2, y+1);

            surface.PutPixel(w - 3, h-2);
            surface.PutPixel(w - 2, h-3);
            break;
         case left:
            surface.DrawLine(0,y+2, 0, h-4);
            surface.PutPixel(2, y);
            surface.PutPixel(1, y+1);

            surface.PutPixel(2, h-2);
            surface.PutPixel(1, h-3);
            break;
      }

      surface.SetForeground(foreground);
      if(text)
         surface.TextExtent(text, strlen(text),&tw, &th);
      y = (clientSize.h - th - 1)/2 + (checked ? 0 : -2);

      if(ellipsis)
      {
         int width = clientSize.w - 2*6;
         int x = 6;

         surface.WriteTextDots(alignment, x, y, width, text, strlen(text));
      }
      else
      {
         int width = clientSize.w - 2 * 6;
         x = 6;

         if(tw < width)
         {
            if(alignment == right)
               x += width - tw - 1;
            else if(alignment == center)
               x += (width - tw) / 2;
         }
         WriteCaption(surface, x, y);
      }

      // Draw Active Stipple
      if(active)
      {
         int x1 = 5;
         int y1 = 4;
         int x2 = clientSize.w - 6;
         int y2 = clientSize.h - 5;
         if((x2 - x1) & 1) x2++;
         if((y2 - y1) & 1) y2++;

         surface.LineStipple(0x5555);
         surface.Rectangle(x1, y1, x2, y2);
         surface.LineStipple(0);
      }
   }
}

static void PlaceButton(TabButton button, TabsPlacement placement, bool selected, int buttonsOffset)
{
   int of = (selected) ? 0 : 1;
   switch(placement)
   {
      case top:
         button.size = selected ? { 74, 25 } : { 70, 22 };
         button.anchor = Anchor { left = buttonsOffset + (int)button.tab.id * 70 + 2*of, bottom = 0 };
         break;
      case bottom:
         button.size = selected ? { 74, 25 } : { 70, 22 };
         button.anchor = Anchor { left = buttonsOffset + (int)button.tab.id * 70 + 2*of, top = 0 };
         break;
      case left:
         button.size = selected ? { 73, 26 } : { 70, 22 };
         button.anchor = Anchor { top = buttonsOffset + (int)button.tab.id * 22 + 2*of, right = 0 };
         break;
      case right:
         button.size = selected ? { 73, 26 } : { 70, 22 };
         button.anchor = Anchor { top = buttonsOffset + (int)button.tab.id * 22 + 2*of, left = 0 };
         break;
   }
}

static define skinMainColor = Color { 0, 71, 128 };
static define skinBackground = Color { 255, 255, 255 };
static define skinTextColor = skinMainColor;
static define skinInactiveTextColor = Color { 0, 51, 108 };

#define CAPTION      14
#define NAME_OFFSET   2
#define NAME_OFFSETX  4
#define SB_WIDTH  16
#define SB_HEIGHT 16
#define MENU_HEIGHT     25
#define STATUS_HEIGHT   18

public class TabControl : Window
{
   TabsPlacement placement;

   tabCycle = true;
   int numTabs;

   background = white;//formColor;

   Window tabButtons { this, opacity = 0, drawBehind = true };

   Tab curTab;
   TabButton curButton;

   int buttonsOffset;

   public property TabsPlacement placement { set { placement = value; } get { return placement; } }
   public property int buttonsOffset { set { buttonsOffset = value; } get { return buttonsOffset; } }
   public property Tab curTab
   {
      set
      {
         if(value)
         {
            if(value.button)
            {
               // value.button.Activate();
               value.button.MakeActive();
               value.button.NotifyClicked(value.button.master, value.button, 0,0, 0);
            }
         }
      }
      get { return curTab; }
   }

   bool IsInside(int x, int y)
   {
      if(Window::IsInside(x, y))
      {
         Point tbAbsPos = tabButtons.absPosition;
         x += absPosition.x - tbAbsPos.x;
         y += absPosition.y - tbAbsPos.y;

         if(tabButtons.IsInside(x, y))
         {
            Window button;
            for(button = tabButtons.firstChild; button; button = button.next)
            {
               int bx = x + tbAbsPos.x - button.absPosition.x;
               int by = y + tbAbsPos.y - button.absPosition.y;
               if(button.IsInside(bx, by))
                  return true;
            }
         }
         else
            return true;
      }
      return false;
   }

   void ShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving)
   {
      if(placement == bottom && ((BorderBits)borderStyle).fixed)
      {
         int top = 0, border = 0, bottom = 0;
         if(state == minimized)
            top = border = bottom = 0;
         else if(((BorderBits)borderStyle).sizable)
         {
            top = 0;
            border = 0;
            bottom = 0;
         }
         else if(((BorderBits)borderStyle).fixed)
         {
            top = 0;
            border = 0;
            bottom = 0;
         }

         if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
         {
            surface.SetForeground(gray);
            surface.Rectangle(0,1, size.w-1, CAPTION+1);

            surface.SetForeground(white);
            surface.Rectangle(1, 1, clientSize.w-2, CAPTION-1);

            surface.SetBackground(skinBackground);
            surface.Area(2, 2, size.w-3, CAPTION+1);

            surface.SetForeground((active ? skinTextColor : skinInactiveTextColor));
            surface.TextOpacity(false);
            surface.TextFont(captionFont);
            if(name)
            {
               int buttonsSize = border +
                  ((hasMaximize || hasMinimize) ? 52 : 18);
               surface.WriteTextDots(left, border + NAME_OFFSETX, top + NAME_OFFSET,
                  size.w - (buttonsSize + border + 4), name, strlen(name));
            }
         }

         if(state != minimized && hasHorzScroll && hasVertScroll)
         {
            if(sbh && sbh.visible && sbv && sbv.visible)
            {
               surface.SetBackground(formColor);
               surface.Area(
                  clientStart.x + clientSize.w,
                  clientStart.y + clientSize.h,
                  clientStart.x + clientSize.w + SB_WIDTH - 1,
                  clientStart.y + clientSize.h + SB_HEIGHT - 1);
            }
         }
      }
      else
      {
         Window::ShowDecorations(captionFont, surface, name, active, moving);
      }

      {
         surface.SetForeground(white);
         surface.Rectangle(
            clientStart.x + 1 + (placement == left) * 80,
            clientStart.y + 1 + (placement == top) * 30,
            clientStart.x + clientSize.w - (placement == right) * 80 - 2,
            clientStart.y + clientSize.h - (placement == bottom) * 30 - 2);
         surface.SetForeground(gray);
         surface.Rectangle(
            clientStart.x + (placement == left) * 80,
            clientStart.y + (placement == top) * 30,
            clientStart.x + clientSize.w - (placement == right) * 80 - 1,
            clientStart.y + clientSize.h - (placement == bottom) * 30 - 1);
      }

      if(curButton)
      {
         Box box;
         //int id = curTab ? (int)curTab.id : 0;
         Button button = curButton;
         int x = button.position.x;
         int y = button.position.y;

         switch(placement)
         {
            case TabsPlacement::bottom:
               box = { /*((id == 0) ? 0 : */x/*)*/ + 1 + clientStart.x, clientSize.h-32 + clientStart.y + 1, x + clientStart.x + button.size.w - 2, clientSize.h-28 + clientStart.y + 1 };
               break;
            case TabsPlacement::top:
               box = { /*((id == 0) ? 0 : */x/*)*/ + 1 + clientStart.x, clientStart.y + 30, x + clientStart.x + button.size.w - 2, clientStart.y + 31 };
               break;
            case TabsPlacement::left:
               box = { 78 + clientStart.x, /*((id == 0) ? 0 : */y/*)*/ + 1 + clientStart.y, 81 + clientStart.x, y + button.size.h + clientStart.y - 2 };
               break;
            case TabsPlacement::right:
               box = { clientSize.w - 80, /*((id == 0) ? 0 : */y/*)*/ + 1 + clientStart.y, clientSize.w - 78 + clientStart.x + 1, y + clientStart.y + button.size.h - 2 };
               break;
         }
         surface.Clip(box);
         surface.SetBackground(background /*white*/);
         surface.Clear(colorBuffer);
         surface.Clip(null);

         surface.SetForeground(white);
         switch(placement)
         {
            case TabsPlacement::bottom:   surface.VLine(clientSize.h-32 + clientStart.y + 1, clientSize.h-28 + clientStart.y + 1, x + 1 + clientStart.x); break;
            case TabsPlacement::top:      surface.VLine(clientStart.y + 30, clientStart.y + 31, x + 1 + clientStart.x); break;
            case TabsPlacement::left:     surface.HLine(78 + clientStart.x, 81 + clientStart.x, y + 1 + clientStart.y); break;
            case TabsPlacement::right:    surface.HLine(clientStart.y + 30, clientStart.y + 31, y + 1 + clientStart.y); break;
         }
      }
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      if(placement == bottom && ((BorderBits)borderStyle).fixed)
      {
         *w = *h = 0;
         if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
            *h += CAPTION;
         if(hasMenuBar && state != minimized)
            *h += MENU_HEIGHT;
         if(statusBar && state != minimized)
            *h += STATUS_HEIGHT;
      }
      else
         Window::GetDecorationsSize(w, h);
   }

   bool IsMouseResizing(int x, int y, int w, int h, bool *resizeX, bool *resizeY, bool *resizeEndX, bool *resizeEndY)
   {
      if(placement == bottom && ((BorderBits)borderStyle).fixed)
      {
         bool result = false;

         *resizeX = *resizeY = *resizeEndX = *resizeEndY = false;

         if(((BorderBits)borderStyle).sizable && (state == normal))
         {
            // TopLeft Corner
            if(Box { 0, 0,2, 2 }.IsPointInside({x, y}))
               result = *resizeX = *resizeY = true;
            // TopRight Corner
            if(Box { w-2, 0, w-1, 2 }.IsPointInside({x, y}))
               result = *resizeEndX = *resizeY = true;
            // BottomLeft Corner
            if(Box { 0, h-2, 1, h-1 }.IsPointInside({x, y}))
               result = *resizeX = *resizeEndY = true;
            // BottomRight Corner
            if(Box { w-2, h-32, w-1, h-25 }.IsPointInside({x, y}))
               result = *resizeEndX = *resizeEndY = true;

            // Left Border
            if(Box { 0,0, 1, h-1 }.IsPointInside({x, y}))
               result = *resizeX = true;
            // Right Border
            if(Box { w-1, 0, w-2, h-1 }.IsPointInside({x, y}))
               result = *resizeEndX = true;
            // Top Border
            if(Box { 0, 0, w-1, 2 }.IsPointInside({x, y}))
               result = *resizeY = true;
            // Bottom Border
            if(Box { numTabs * 70, h-32, w-2, h-25 }.IsPointInside({x, y}))
               result = *resizeEndY = true;
         }
         return result;
      }
      else
         return Window::IsMouseResizing(x, y, w, h, resizeX, resizeY, resizeEndX, resizeEndY);
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      if(placement == bottom && ((BorderBits)borderStyle).fixed)
      {
         MinMaxValue aw = 0, ah = 0;

         *x = *y = 0;

         GetDecorationsSize(&aw, &ah);

         if(hasMenuBar)
            *y += MENU_HEIGHT;

         if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
            *y += CAPTION;

         if(((BorderBits)borderStyle).contour && !((BorderBits)borderStyle).fixed)
         {
            *x += 1;
            *y += 1;
         }

         // Reduce client area
         *cw = *w - aw;
         *ch = *h - ah;

         *cw = Max(*cw, 0);
         *ch = Max(*ch, 0);
      }
      else
         Window::SetWindowArea(x, y, w, h, cw, ch);
   }

   bool OnCreate()
   {
      switch(placement)
      {
         case top:
            tabButtons.anchor = { top = 5, left = 0, right = 5 };
            tabButtons.size = { h = 25 };
            break;
         case bottom:
            tabButtons.anchor = { bottom = 5, left = 0, right = 5 };
            tabButtons.size = { h = 25 };
            break;
         case left:
            tabButtons.anchor = { top = 0, left = 5, bottom = 5 };
            tabButtons.size = { w = 75 };
            break;
         case right:
            tabButtons.anchor = { top = 0, bottom = 5, right = 5 };
            tabButtons.size = { w = 75 };
            break;
      }
      return true;
   }

   bool OnPostCreate()
   {
      // curButton.Activate();
      curButton.MakeActive();
      return true;
   }

   bool NotifyClicked(Button button, int x, int y, Modifiers mods)
   {
      if(curTab == (Tab)(intptr)button.id && curTab.created)
         return true;
      //curButton.Activate();
      curButton.MakeActive();

      if(!curTab || curTab == (Tab)(intptr)button.id || curTab.Destroy(0))
      {
         curButton.checked = false;
         button.checked = true;
         curTab = (Tab)(intptr)button.id;

         if(curButton)
            PlaceButton(curButton, placement, false, buttonsOffset);

         curButton = (TabButton)button;
         curButton.MakeActive();
         // curButton.Activate();

         PlaceButton(curButton, placement, true, buttonsOffset);
         Update(null);

         curTab.Create();
      }
      else
      {
         return false;
      }
      return true;
   }

   public void AddTab(Tab tab)
   {
      if(tab.parent != this)
      {
         tab.parent = this;
         return;
      }
      tab.autoCreate = false;
      tab.id = numTabs;
      if(!tab.button)
      {
         tab.button = TabButton
         {
            parent = tabButtons,
            master = this, stayDown = true,
            text = tab.text, id = (int64)(intptr)tab, NotifyClicked = NotifyClicked,
            tab = tab,
            background = background;
         };
         incref tab.button;
      }

      if(created)
      {
         tab.button.Create();
         // This was causing leaks with RemoveTab / AddTab usage in Cartographer...
         // RemoveTab() does not dec'ref...
         // incref tab;
      }

      numTabs++;
      if(!curTab)
      {
         curTab = tab;
         curButton = tab.button;
         tab.button.checked = true;
         tab.autoCreate = true;
      }

      PlaceButton(tab.button, placement, curTab == tab, buttonsOffset);
      switch(placement)
      {
         case top: tab.anchor = { left = 2, bottom = 2, right = 2, top = 32 }; break;
         case bottom: tab.anchor = { left = 2, bottom = 32, right = 2, top = 2 }; break;
         case left: tab.anchor = { left = 82, bottom = 2, right = 2, top = 2 }; break;
         case right: tab.anchor = { left = 2, bottom = 2, right = 82, top = 2 }; break;
      }
   }

   public void RemoveTab(Tab tab)
   {
      Window child;
      Tab fallbackTab = null;
      // tab.parent = null;
      for(child = tabButtons.children.first; child; child = child.next)
      {
         if(child._class == class(TabButton))
         {
            TabButton button = (TabButton)child;
            if(button.id == (int64)(intptr)tab)
            {
               if(button.created)
               {
                  button.Destroy(0);
                  numTabs--;
               }
               break;
            }
            else if(button.created)
               fallbackTab = button.tab;
         }
      }
      if(curTab == tab && curTab.created)
      {
         if(!fallbackTab)
            fallbackTab = tabButtons.children.first ? ((TabButton)tabButtons.children.first).tab : null;
         if(fallbackTab && fallbackTab.button.created)
            fallbackTab.SelectTab();
         else
         {
            curTab.Destroy(0);
            curTab = null;
         }
         /*curTab = fallbackTab;
         curButton = curTab.button;
         curButton.checked = true;
         curTab.autoCreate = true;*/
      }
   }

   ~TabControl()
   {
      Window child, next;
      for(child = tabButtons.firstChild; child; child = next)
      {
         next = child.next;
         delete child;
      }

      for(child = firstChild; child; child = next)
      {
         next = child.next;
         if(eClass_IsDerived(child._class, class(Tab)))
            child.parent = null;
      }
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      SmartKey smartKey = (SmartKey)key;
      if(tabButtons.active && (smartKey == left || smartKey == right))
      {
         // BIG MESS... USE AN ARRAY INSTEAD?
         TabButton newButton = null, button;
         int cleft = curButton.anchor.left.distance, ctop = curButton.anchor.top.distance;

         for(button = (TabButton)tabButtons.firstChild; button; button = (TabButton)button.next)
         {
            int pleft = button.anchor.left.distance, nleft = newButton ? newButton.anchor.left.distance : 0;
            int ptop = button.anchor.top.distance, ntop = newButton ? newButton.anchor.top.distance : 0;
            if(button == curButton) continue;
            if((smartKey == left && (pleft < cleft || ptop < ctop) && (!newButton || pleft > nleft || ptop > ntop)) ||
               (smartKey == right && (pleft > cleft || ptop > ctop) && (!newButton || pleft < nleft || pleft < ptop)))
               newButton = button;
         }
         if(!newButton)
         {
            for(button = (TabButton)tabButtons.firstChild; button; button = (TabButton)button.next)
            {
               int pleft = button.anchor.left.distance, nleft = newButton ? newButton.anchor.left.distance : 0;
               int ptop = button.anchor.top.distance, ntop = newButton ? newButton.anchor.top.distance : 0;
               if(button == curButton) continue;
               if(!newButton || (smartKey == right && (pleft < nleft || ptop < ntop)) || (smartKey == left && (pleft > nleft || ptop > ntop)))
                  newButton = button;
            }
         }

         if(newButton)
         {
            property::curTab = newButton.tab;
            tabButtons.MakeActive();
            // tabButtons.Activate();
         }
         return false;
      }
      return true;
   }
}

public class Tab : Window
{
   TabButton button;
   TabControl tabControl;

   //borderStyle = contour;
   //background = lightBlue;
   tabCycle = true;

   watch(parent)
   {
      if(parent && eClass_IsDerived(parent._class, class(TabControl)))
      {
         tabControl = (TabControl)parent;
         tabControl.AddTab(this);
      }
      else if(!parent && tabControl)
      {
         tabControl.RemoveTab(this);
         tabControl = null;
      }
   };

   public property TabControl tabControl
   {
      set { parent = value; }
      get { return (TabControl)parent; }
   }

   public void SelectTab()
   {
      button.NotifyClicked(button.master, button, 0, 0, 0);
   }

   public property bool isAdded
   {
      get { return button && button.created; }
   }

   watch(caption)
   {
      if(button)
         button.text = text;
   };
}
