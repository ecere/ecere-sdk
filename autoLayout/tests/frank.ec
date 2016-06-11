import "test"

define szBorder = 3;
define szHighlight = 1;
define szWindowHighlight = szBorder * 4;
define szBar = 48;
define szMinWidth = 128;

define clBorder = Color { 22, 22, 22 };
//define clHighlight = lightBlue;
define clHighlight = Color { 128, 128, 142 };
define clHighlight2 = Color { 128, 128, 142 };
define clWindwow = Color { 44, 44, 44 };
define clBar = Color { 99, 99, 99 };

class TestHoverScrollTitleTabsBar1 : TestWindow
{
   caption = $"Hix | Old Frank";
   background = clWindwow;
   borderStyle = sizableThin;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = false;
   clientSize = { 480, 220 };
   minClientSize = { 320, 140 };
   //state = maximized;
   font = FontResource { faceName = $"Tahoma", size = 10.0f };

   //FontResource normalFont { faceName = $"Tahoma", size = 10.0f, window = this };
   FontResource boldFont { faceName = $"Tahoma", size = 10.0f, bold = true, window = this };

   CWindow area
   {
      this;
      opacity = 0.0f;
      clickThrough = true;
      //interim = true;
      //inactive = true;
      anchor = { left = 0, top = szWindowHighlight, right = 0 };
      size = { 256, szBar - szWindowHighlight};

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         TestHoverScrollTitleTabsBar1 w = (TestHoverScrollTitleTabsBar1)parent;
         if(w.bar.size.w > w.area.size.w)
         {
            //float r = (float)x / (float)w.area.size.w;
            float r = (float)(Min(Max(16, x), w.area.size.w - 16) - 16) / (float)(w.area.size.w - 32);
            int left = r * (w.bar.size.w - w.area.size.w);
            w.bar.anchor.left = -left;
         }
         return true;
      }
   };

   CSelectorBar bar
   {
      area, this;
      caption = $"View";
      direction = horizontal;
      position = { 0, 0 };
      size = { 256, szBar - szWindowHighlight};
      anchor = { left = 0, top = 0, bottom = 0 };
      autoSize = true;
   };

   CWindow spacer1 { bar, this, size = { 8 } };

   Label barCap { bar, this, labeledWindow = this, clickThrough = true, foreground = lightGray, anchor = { top = (szBar - szWindowHighlight - 14) / 2 - szBorder }, font = boldFont };

   CWindow spacer2 { bar, this, size = { 8 } };

   CButton viewAll { bar, master = this, caption = $"All", checked = true };
   CButton viewTest { bar, master = this, caption = $"Test" };
   CButton viewEcere { bar, master = this, caption = $"Ecere" };
   CButton viewTest2 { bar, master = this, caption = $"Tab With The Longest Name" };
   CButton viewTest3 { bar, master = this, caption = $"Test" };
   CButton viewTest4 { bar, master = this, caption = $"No, I'm Longer!" };
   CButton viewTest5 { bar, master = this, caption = $"No, I am!" };

   CWindow spacer3 { bar, this, size = { 8 } };

   FontResource ::SystemFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f };
#endif
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      MinMaxValue aw = 0, ah = 0;
      *x = *y = 0;
      *x += szBorder;
      *y += szBorder;
      GetDecorationsSize(&aw, &ah);
      *cw = *w - aw;
      *ch = *h - ah;
      *cw = Max(*cw, 0);
      *ch = Max(*ch, 0);
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;
      *w += szBorder * 2;
      *h += szBorder * 2;
   }

   bool IsMouseMoving(int x, int y, int w, int h)
   {
      return Box { szBorder, szBorder, w - szBorder - 1, szBorder + szBar - szBorder - 1 }.IsPointInside({ x, y });
   }

   void PreShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving)
   {
      surface.alphaWrite = write;
      surface.blend = false;

      surface.background = clBorder;
      surface.Area(0, 0, clientStart.x + clientSize.w + szBorder - 1, szBorder - 1);
      surface.Area(0, 0, szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
      surface.Area(clientStart.x + clientSize.w - 1, 0, clientStart.x + clientSize.w + szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
      surface.Area(0, clientStart.y + clientSize.h - 1, clientStart.x + clientSize.w + szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
   }

   void ShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving)
   {
   }

   void OnRedraw(Surface surface)
   {
      surface.background = clBar;
      surface.Area(0, 0, clientSize.w - 1, szBar - 1);
      surface.background = clBorder;
      surface.Area(0, szBar - szBorder, clientSize.w - 1, szBar - 1);
      if(active)
      {
         surface.background = clHighlight;
         surface.Area(szBorder, szBorder, clientSize.w - szBorder - 1, szBorder * 3 - 1);
      }
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      Update(null);
      return true;
   }

   /*bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      return true;
   }*/

   bool OnKeyHit(Key key, unichar ch)
   //bool OnKeyDown(Key key, unichar ch)
   {
      if(key == { tab, true, true } || key == { tab, ctrl = true })
      {
         Button b = bar.selectedButton;
         if(b)
         {
            Map<int, Button> btns { };
            MapNode<int, Button> mn;
            for(b = (Button)bar.firstChild; b; b = (Button)b.next)
            {
               if(b.nonClient) continue;
               if(eClass_IsDerived(b._class, class(Button)))
                  btns[b.position.x] = b;
            }
            b = bar.selectedButton;
            for(mn = btns.root.minimum; mn && mn.value != b; mn = mn.next);
            if(mn)
            {
               //for(mn = mn.next ? mn.next : btns.root.minimum; mn && mn.value != b; mn = mn.next ? mn.next : btns.root.minimum)
               mn = key.shift ? mn.prev ? mn.prev : btns.root.maximum : mn.next ? mn.next : btns.root.minimum;
               b = mn.value;
               bar.Select(b);
            }
         }
      }
      return true;
   }
}

//class CButton : SelectorButton { }
//#if 0
class CButton : Button
{
   bevelOver = true;
   isRadio = true;
   bitmap = null;
   minClientSize = { 44, 22 };
   isRemote = true;
   clickThrough = true;

   borderStyle = none;
   //bevelOver = false;
   background = clBar;
   foreground = lightGray;
   opacity = 1.0f;

   anchor = { top = 0, bottom = 0 };
   font = boldFont;

   //bool mouseOver;

   FontResource normalFont { faceName = $"Tahoma", size = 10.0f, window = this };
   FontResource boldFont { faceName = $"Tahoma", size = 10.0f, bold = true, window = this };

public:
   Window focusHolder;

   watch(parent)
   {
      if(parent && eClass_IsDerived(parent._class, class(SelectorBar)))
      {
         SelectorBar parent = (SelectorBar)this.parent;
         // Fix Cycling order
         /*if(cycle)
            parent.childrenCycle.Move(cycle, null);*/

         // Currently, it could be done this way outside libecere:
         /*if(parent.controls.count)
         {
            parent.controls.lastIterator.data.Activate();
            inactive = true;
            inactive = false;
         }*/

         parent.AddButton(this);
      }
   };

   watch(checked)
   {
      if(!checked)
         background = clBar;
      else
         background = clWindwow;
      if(parent && checked && eClass_IsDerived(parent._class, class(SelectorBar)))
      {
         Button b;
         //SelectorBar selector = (SelectorBar)parent;
         for(b = (Button)parent.firstChild; b; b = (Button)b.next)
         {
            if(b.nonClient) continue;
            if(eClass_IsDerived(b._class, class(Button)) && b != this)
               b.checked = false;
         }
         //selector.OnResize(selector.clientSize.w, selector.clientSize.h);
         //selector.MakeControlVisible(this);
      }
   };

   /*bool CButton::NotifyMouseOver(Button button, int x, int y, Modifiers mods)
   {
      mouseOver = true;
      PrintLn("MouseOver");
      return true;
   }

   bool CButton::NotifyMouseLeave(Button button, Modifiers mods)
   {
      mouseOver = false;
      PrintLn("MouseLeave");
      return true;
   }*/

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool result;
      Activate();
      result = Button::OnLeftButtonDown(x, y, mods);
      if(focusHolder && !checked)
         focusHolder.Activate();
      return result;
   }

   void OnRedraw(Surface surface)
   {
      int tw = 0, th = 0;
      int tx = 0, ty = 0;
      //PrintLn(buttonState);
      if(text)
      {
         surface.font = (checked || /*mouseOver*/buttonState == over || buttonState == down) ? boldFont.font : normalFont.font;
         surface.TextExtent(text, strlen(text), &tw, &th);
         tx = (clientSize.w - tw - 4) / 2;
         ty = (clientSize.h - th) / 2;
      }
      if(text && !checked && (/*mouseOver*/buttonState == over || buttonState == down))
      {
         surface.background = clHighlight2;
         surface.Area(tx - szBorder, ty - szBorder, tx + tw + szBorder - 1, ty + th + szBorder - 1);
      }
      if(text)
         WriteCaption(surface, tx, ty);
      if(checked)
      {
         surface.background = clBorder;
         surface.Area(0, 0, clientSize.w - 1, szBorder - 1);
         surface.Area(0, 0, szBorder - 1, clientSize.h - 1);
         surface.Area(clientSize.w - szBorder, 0, clientSize.w - 1, clientSize.h - 1);
         if(parent.active)
         {
            surface.background = clHighlight;
            surface.Area(szBorder * 2, szBorder * 2, clientSize.w - szBorder * 2 - 1, szBorder * 2 + szHighlight - 1);
         }
      }
      else
      {
         surface.background = clBorder;
         surface.Area(0, clientSize.h - szBorder, clientSize.w - 1, clientSize.h - 1);
      }
   }
}
//#endif // 0

class CWindow : Window
{
   opacity = 0.0f;
   clickThrough = true;
   //interim = true;
   //inactive = true;
}

class CSelectorBar : SelectorBar
{
   //scrollable = true;
   //interim = true;
   gap = 0;
   clickThrough = true;
   opacity = 0.0f;
   void OnRedraw(Surface surface)
   {
   }
}

class CStackFillWindow : CWindow
{
   watch(parent)
   {
      StackerFiller_ParentWatch(this);
   };
}

void Window::StackerFiller_ParentWatch()
{
   if(eClass_IsDerived(parent._class, class(Stacker)))
   {
      Stacker p = (Stacker)parent;
      int m = p.margin;
      if(p.direction == horizontal)
         anchor = { top = m, bottom = m };
      else
         anchor = { left = m, right = m };
   }
}

#if 0
class TestNextGenHoverScrollTitleTabsBar1 : TestWindow
{
   caption = $"Hix | TestElementWindow";
   background = clWindwow;
   borderStyle = sizableThin;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = false;
   clientSize = { 480, 220 };
   minClientSize = { 320, 140 };
   //state = maximized;
   anchor = { top = 360, right = 100 };
   font = FontResource { faceName = $"Tahoma", size = 10.0f };

   //FontResource normalFont { faceName = $"Tahoma", size = 10.0f, window = this };
   FontResource boldFont { faceName = $"Tahoma", size = 10.0f, bold = true, window = this };

   CWindow area
   {
      this;
      anchor = { left = 0, top = szWindowHighlight, right = 0 };
      size = { 256, szBar - szWindowHighlight};

      bool OnMouseMove(int x, int y, Modifiers mods)
      {
         TestHoverScrollTitleTabsBar1 w = (TestHoverScrollTitleTabsBar1)parent;
         if(w.bar.size.w > w.area.size.w)
         {
            float r = (float)x / (float)w.area.size.w;
            int left = r * (w.bar.size.w - w.area.size.w);
            w.bar.anchor.left = -left;
         }
         return true;
      }
   };

   CSelectorBar bar
   {
      area, this;
      caption = $"View";
      direction = horizontal;
      position = { 0, 0 };
      size = { 256, szBar - szWindowHighlight};
      anchor = { left = 0, top = 0, right = 0, bottom = 0 };
      //autoSize = true;
      //scrollable = false;
      //inactive = false;
      //inactive = true;
      opacity = 1.0f;
      background = lightBlue;
      flipper = rtabs;//viewAll;//spacer3;
      flipSpring = true;
      id = 555;
      //gap = 8;
   };

   //CWindow spacer1 { bar, this, id = 5, size = { 8 } };

   Label barCap { bar, this, id = 6, labeledWindow = this, clickThrough = true, foreground = lightGray, anchor = { top = (szBar - szWindowHighlight - 14) / 2 - szBorder }, font = boldFont };

   //CWindow spacer2 { bar, this, id = 7, size = { 8 } };

   //CStackFillWindow ltabs { bar, this, id = 20, size = { 8 }, background = green };
   //CWindow ltabs { bar, this, id = 20, size = { 8 }, background = green };

   //CButton viewAll { bar, this, id = 26, caption = $"All", checked = true };

   CWindow rtabs { bar, this, id = 50, size = { 8, 48 }, opacity = 1.0f, background = red };
   //CStackFillWindow rtabs { bar, this, id = 50, size = { 8, 48 }, opacity = 1.0f, background = red };

   //CButton viewTest { right, master = this, caption = $"Test" };
   //CButton viewEcere { right, master = this, caption = $"Ecere" };
   //CButton viewTest2 { right, master = this, caption = $"Tab With The Longest Name" };
   //CButton viewTest3 { right, master = this, caption = $"Test" };
   //CButton viewTest4 { right, master = this, caption = $"No, I'm Longer!" };
   //CButton viewTest5 { right, master = this, caption = $"No, I am!" };

   CWindow spacer3 { bar, this, id = 56, size = { 8 }, background = blue, opacity = 1.0f, anchor = {} };

   FontResource ::SystemFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f };
#endif
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      MinMaxValue aw = 0, ah = 0;
      *x = *y = 0;
      *x += szBorder;
      *y += szBorder;
      GetDecorationsSize(&aw, &ah);
      *cw = *w - aw;
      *ch = *h - ah;
      *cw = Max(*cw, 0);
      *ch = Max(*ch, 0);
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;
      *w += szBorder * 2;
      *h += szBorder * 2;
   }

   bool IsMouseMoving(int x, int y, int w, int h)
   {
      return Box { szBorder, szBorder, w - szBorder - 1, szBorder + szBar - szBorder - 1 }.IsPointInside({ x, y });
   }

   void PreShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving)
   {
      surface.alphaWrite = write;
      surface.blend = false;

      surface.background = clBorder;
      surface.Area(0, 0, clientStart.x + clientSize.w + szBorder - 1, szBorder - 1);
      surface.Area(0, 0, szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
      surface.Area(clientStart.x + clientSize.w - 1, 0, clientStart.x + clientSize.w + szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
      surface.Area(0, clientStart.y + clientSize.h - 1, clientStart.x + clientSize.w + szBorder - 1, clientStart.y + clientSize.h + szBorder - 1);
   }

   void ShowDecorations(Font captionFont, Surface surface, const char * name, bool active, bool moving)
   {
   }

   bool OnPostCreate()
   {
      //bar.flipper = rtabs;//viewAll;//spacer3;
      //bar.flipSpring = true;
      //PrintLn("OnPostCreate -- rtabs.id == ", rtabs.id);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      surface.background = clBar;
      surface.Area(0, 0, clientSize.w - 1, szBar - 1);
      surface.background = clBorder;
      surface.Area(0, szBar - szBorder, clientSize.w - 1, szBar - 1);
      if(active)
      {
         surface.background = clHighlight;
         surface.Area(szBorder, szBorder, clientSize.w - szBorder - 1, szBorder * 3 - 1);
      }
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      Update(null);
      Window::OnActivate(active, previous, goOnWithActivation, direct);
      return true;
   }

   /*bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      return true;
   }*/

   bool OnKeyHit(Key key, unichar ch)
   //bool OnKeyDown(Key key, unichar ch)
   {
      if(key == { tab, true, true } || key == { tab, ctrl = true })
      {
         Button b = bar.selectedButton;
         if(b)
         {
            Map<int, Button> btns { };
            MapNode<int, Button> mn;
            for(b = (Button)bar.firstChild; b; b = (Button)b.next)
            {
               if(b.nonClient) continue;
               if(eClass_IsDerived(b._class, class(Button)))
                  btns[b.position.x] = b;
            }
            b = bar.selectedButton;
            for(mn = btns.root.minimum; mn && mn.value != b; mn = mn.next);
            if(mn)
            {
               //for(mn = mn.next ? mn.next : btns.root.minimum; mn && mn.value != b; mn = mn.next ? mn.next : btns.root.minimum)
               mn = key.shift ? mn.prev ? mn.prev : btns.root.maximum : mn.next ? mn.next : btns.root.minimum;
               b = mn.value;
               bar.Select(b);
            }
         }
      }
      return true;
   }
}
#endif // 0
