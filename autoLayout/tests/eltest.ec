import "test"

class TestElement1 : TestElementWindow
{
   caption = $"Hix | Element";
   background = lightGray;
   borderStyle = sizable;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = true;
   clientSize = { 480, 220 };
   minClientSize = { 320, 140 };

   contents = ElTestStackedEntries { };
}

class ElTestStackedEntries : Element
{
   //direction = vertical;//horizontal;
   maxSize = { 1.0 };
   CAElement e1 { this, id = 9901, caption = "We1" };
   CAElement e2 { this, id = 9902, caption = "We2" };
   CAElement e3 { this, id = 9903, caption = "We3" };
   CAElement e4 { this, id = 9904, caption = "We4" };
   CAElement e5 { this, id = 9905, caption = "We5" };
   CAElement e6 { this, id = 9906, caption = "We6" };
   CAElement e7 { this, id = 9907, caption = "We7" };
   CAElement e8 { this, id = 9908, caption = "We8" };
}

class CAElement : Element
{
   margin = 4;
   border = 2;
   borderColor = black;
   bgColor = beige;
   padding = 2;
   padding.left = 8;
   padding.right = 8;
}

class Test2 : TestElementWindow
{
   caption = $"Hix | New Frank";
   borderStyle = sizable;
   nativeDecorations = true;

   contents = ElTitleBar { };

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

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      ElTitleBar e = (ElTitleBar)contents;
      e.highlight.bgColor = active ? clHighlight : clBar;
      Update(null);
      Window::OnActivate(active, previous, goOnWithActivation, direct);
      return true;
   }
}

class Test3 : TestElementWindow
{
   background = white;

   contents = ElTest { };

}

class ElTest : Element
{
   id = 9;
   bgColor = lightBlue;
   //minSize = { 300, 300 };
   borderColor = darkBlue;
   margin = 16;
   border = 4;
   padding = 4;
   caption = $"Hello";
   /*Element
   {
      this;
      id = 64;
      bgColor = darkBlue;
      //borderColor = darkBlue;
      /-*margin = { 5, 5, 5, 5 };
      border = { 11, 11, 11, 11 };
      padding = { 22, 22, 22, 22 };*-/
      //hAlignment = center;
      //vAlignment = center;
   };*/
   //Element e1 { this, caption = $"Hello"/*, margin = { 1, 1, 1, 1 }*//*, padding = { 0, 0, 0, 0 }*/ };
}

class TestElementWindow : TestWindow
{
   //displayDriver = "OpenGL";
   caption = $"Hix | Element";
   background = clWindwow;
   //borderStyle = sizable;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = true;
   clientSize = { 480, 220 };
   //minClientSize = { 320, 140 };
   //state = maximized;

   //contents = ElTitleBar { };

   FontResource ::SystemFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f };
#endif
   }

   Element contents;

   bool OnLoadGraphics()
   {
      if(contents) contents.loadGraphics(displaySystem);
      return true;
   }

   void OnResize(int width, int height)
   {
      Element e = contents;
      /*if(e)
         PrintLn("AutoLayoutWindow::OnResize(", width, ", ", height, ")");*/
      if(e)
      {
         int nw = 0;
         int nh = 0;
         e.computeBoxModel(width, height);
         nw = e.minSize.w.getPixels(width);
         nh = e.minSize.h.getPixels(height);
         e.clientSize = { Max(nw, width) - e.bm.left - e.bm.right, Max(nh, height) - e.bm.top - e.bm.bottom };
         //PrintLn(e.clientSize);
         if(e.nodes)
         {
            e.computeContentSize(displaySystem);
            /*if(clientSize.w != contents.clientSize.w || clientSize.h != contents.clientSize.h)
               clientSize = contents.clientSize;*/
            e.autoLayout();
         }
         Update(null);
      }
   }

   void OnRedraw(Surface surface)
   {
      /*surface.background = clBar;
      surface.Area(0, 0, clientSize.w - 1, szBar - 1);
      surface.background = clBorder;
      surface.Area(0, szBar - szBorder, clientSize.w - 1, szBar - 1);
      if(active)
      {
         surface.background = clHighlight;
         surface.Area(szBorder, szBorder, clientSize.w - szBorder - 1, szBorder * 3 - 1);
      }*/

      /*if(contents)
         PrintLn("AutoLayoutWindow::OnRedraw()");*/
      if(contents) contents.render(surface);
   }

   /*bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      return true;
   }*/

   bool OnKeyHit(Key key, unichar ch)
   //bool OnKeyDown(Key key, unichar ch)
   {
      /*if(key == { tab, true, true } || key == { tab, ctrl = true })
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
      }*/
      return true;
   }
}

class ElTitleBar : Col
{
   bgColor = black;
   fgColor = lightGray;
   font = { "Tahoma", 10, true };

   Col header { this, bgColor = clBar, maxSize = { 1.0, szBar }/*, hAlignment = bottom, vAlignment = left*/ };

      Bar highlight { header, bgColor = clBar, maxSize = { 1.0, szBorder * 2 }/*, hAlignment = center, vAlignment = center*/, margin/*padding*/ = { szBorder, szBorder, szBorder, szBorder } };
      Bar main { header, bgColor = clBar/*lightBlue*/, maxSize = { 1.0, szBar - szWindowHighlight }, vAlignment = center };

         CElement { main, id = 101, maxSize = { 8, 8 } };
         //CElement { main, id = 102, caption = $"Hix | New Frank" };
         CElement { main, id = 103, maxSize = { 8, 8 } };
         CElButton { main, id = 121, caption = $"All"/*, checked = true*/ };
         CElButton { main, id = 122, caption = $"Test" };
         CElButton { main, id = 123, caption = $"Ecere" };
         CElButton { main, id = 124, caption = $"Tab With The Longest Name" };
         CElButton { main, id = 125, caption = $"Test" };
         CElButton { main, id = 126, caption = $"No, I'm Longer!" };
         CElButton { main, id = 127, caption = $"No, I am!" };
         CElement { main, id = 141, maxSize = { 8, 8 } };

   Bar border { this, bgColor = clBorder, maxSize = { 1.0, szBorder } }; // need an offset ?
}

class CElButton : CElement
{
   //margin = 8;
   margin.left = 8;
   margin.right = 8;
}

class CElement : Element
{
   fgColor = lightGray;
}

class CPElement : CElement
{
   padding = { 4, 0, 4, 0 };
}
