public import "ecere"
import "wrapText"

public class Inches        : Distance { public property Feet { set { return value * 12.0f; } get { return this / 12.0f; } } };
// cm = in / 0.39370

// eC ideas:
//  - aliases, especially for use whith short names
//    px.e.: struct Size { int w:width, h:height; };
//  - reaming, when identical data for different purpose
//    px.e.: struct Point : Size { w:x:l:left, h:y:t:top }; // would warn when using a point instead of a size
//  - anonymous casting
//    px.e.: void func(Size s); Point p; func(()p); /* no warning */ func(p); /* warning */

// notes regarding autolayout
//  - this is still just a static model, nothing nearing the implementation of Cassowary algorithm
//    it still can't solve stuff on it's own like "widget1.height == widget2.height * 1.2"
//    it needs to solve just like the formulas in an excel spreadsheet

// todo:
//  - setting from string on all these fancy structures and stuff
//    i.e.: Ux a { }; a.border = "4px green solid rounded";
//  - serialization to multiple formats?
//    econ/json/etc, css?, string?, binary

// why those names? because namespaces don't work!
// Zx : Size
// Ux : User Interface Ux
// Ax : Alignment
// Dx : Direction

enum ZxType { mixed, pixels, ratio, points, inches, centimeters }; // what is a point?

struct Zx
{
   ZxType type;
   int px;//:pixels;
   union
   {
      double rt;//:ratio;
      //double? pt;//:points;
      Inches in;//:inches;
      Centimeters cm;//:centimeters;
   };
   property int
   {
      set { px = value; type = pixels; }
      get { return type == pixels ? px : 0; }
   }
   property double
   {
      set { rt = value; type = ratio; }
      get { return type == ratio ? rt : 0; }
   }
   //int getPixels(int p) { return type == pixels ? px : (int)(rt * p + 0.5); }
   int compute(int span, int dpi)
   {
      if(type == ratio) px = (int)(rt * span + 0.5);
      else if(type == inches) px = (int)(dpi * in + 0.5);
      else if(type == centimeters) px = (int)(dpi * (Inches)cm + 0.5);
      return px;
   }
};

struct ZxPair
{
   Zx a;
   Zx b;
   property double
   {
      set { a = value; b = value; }
      get { return type == ratio && b.rt == a.rt ? a.rt : 0; }
   }
   property int
   {
      set { a = value; b = value; }
      get { return type == pixels && b.px == a.px ? a.px : 0; }
   }
   property ZxType type { get { return b.type == a.type ? a.type : mixed; } }
   void compute(int spanA, int spanB, int dpi)
   {
      a.compute(spanA, dpi);
      b.compute(spanB, dpi);
   }
};

struct ZxQuad
{
   ZxPair k;
   ZxPair l;
   property double
   {
      set { k.a = value; k.b = value; l.a = value; l.b = value; }
      get { return type == ratio && l.b.rt == k.a.rt && l.a.rt == k.a.rt && k.b.rt == k.a.rt ? k.a.rt : 0; }
   }
   property int
   {
      set { k.a = value; k.b = value; l.a = value; l.b = value; }
      get { return type == pixels && l.b.px == k.a.px && l.a.px == k.a.px && k.b.px == k.a.px ? k.a.px : 0; }
   }
   property ZxType type { get { return l.type == k.type ? k.type : mixed; } }
   void compute(int spanK, int spanL, int dpi)
   {
      k.compute(spanK, spanK, dpi);
      l.compute(spanL, spanL, dpi);
   }
};

enum Dx { horizontal, vertical, opposite };
enum InternalAx { mixed/*, inherit*/, front, center, back };
enum Ax : InternalAx { top = front, middle = center, bottom = back, left = front, right = back };
struct AxPair
{
   Ax n;//:with:through:paralel;
   Ax t;//:opposite:across:perpendicular:against;
   property Ax
   {
      set { n = value; t = value; }
      get { return t == n ? t : mixed; }
   }
};

struct Border
{
   ZxQuad size;
   ColorAlpha color;
   //BorderStyle style;
   property double
   {
      set { size = value; }
      get { return (double)size; }
   }
   property int
   {
      set { size = value; }
      get { return (int)size; }
   }
   property ZxQuad
   {
      set { size = value; color = 0; }
      get { this = size; }
   }
   void compute(int spanK, int spanL, int dpi)
   {
      size.compute(spanL, spanL, dpi);
   }
};

FontResource defaultFont { "Tahoma", 8.25f };

class Ux
{
private:
   uint64 id;
   ZxQuad margin;
   /*ZxQuad*/Border border;
   ZxQuad padding;
   ZxPair minSize;
   ZxPair maxSize;
   Dx direction;
   AxPair alignment;
   ColorAlpha bgColor;
   ColorAlpha fgColor;

   List<Ux> nodes;
   Ux parent;
   Size availSize;
   Size clientSize;
   Box bm; // box model

   String caption;

   FontResource font;
   Font fontObject;
   BitmapResource bitmap;
   Bitmap bmpObject;
   ColorAlpha bitmapTint;
   bitmapTint = white;

public:
   property Ux parent
   {
      set
      {
         if(!value.nodes) value.nodes = { };
         value.nodes.Add(this);

         parent = value;
      }
   }

#if 0
   const String caption;

   bool hScroll, vScroll;

   Size contentSize; // Computed from the content (Max of Text/Primitives extent and Children minimum extent)
   Size scrollSize;
   Point scroll;
   bool autoLayoutFlag;
   Point position; // Position relative to parent's client area, including margin offset
   Point tlPosition;
   HVAlignment hAlignment, vAlignment; // Alignment of content (children or graphics) ?
   SelfAlignment selfHAlignment, selfVAlignment;
#endif // 0

private:
   void loadGraphics(DisplaySystem displaySystem)
   {
      if(!fontObject)
      {
         Ux e = this;
         FontResource font;
         while(e && !e.font) e = e.parent;
         font = e ? e.font : defaultFont;
         displaySystem.LoadResource(font);
         fontObject = font.font;
      }

      if(!bmpObject && bitmap)
      {
         displaySystem.LoadResource(bitmap);
         bmpObject = bitmap.bitmap;
      }

      for(n : nodes)
         n.loadGraphics(displaySystem);
   }

   void computeBoxModel(int w, int h)
   {
      int spanK = direction == horizontal ? w : h;
      int spanL = direction == horizontal ? h : w;
      margin.compute(spanK, spanL, 72);
      border.compute(spanK, spanL, 72);
      padding.compute(spanK, spanL, 72);
      //ZxPair minSize;
      //ZxPair maxSize;
      /*mgn =
      {
         left = margin.left.getPixels(w);
         right = margin.right.getPixels(w);
         top = margin.top.getPixels(h);
         bottom = margin.bottom.getPixels(h);
      };
      brd =
      {
         left = border.left.getPixels(w);
         right = border.right.getPixels(w);
         top = border.top.getPixels(h);
         bottom = border.bottom.getPixels(h);
      };
      pdg =
      {
         left = padding.left.getPixels(w);
         right = padding.right.getPixels(w);
         top = padding.top.getPixels(h);
         bottom = padding.bottom.getPixels(h);
      };*/
#if 0
      bm =
      {
         left = margin.left + brd.left + pdg.left;
         right = mgn.right + brd.right + pdg.right;
         top = mgn.top + brd.top + pdg.top;
         bottom = mgn.bottom + brd.bottom + pdg.bottom;
      };
#endif
   }

   void computeContentSize(DisplaySystem displaySystem)
   {
      int cw = clientSize.w, ch = clientSize.h;
      int minimum = 0, thickness = 0;
      Size graphicsSize { };
      int rcw = cw, rch = ch;
      for(n : nodes)
      {
         Ux e = n;
#if 0
         if(e.autoLayoutFlag)
         {
            int xw = e.maxSize.w.getPixels(cw);
            int xh = e.maxSize.h.getPixels(ch);
            int nw = e.minSize.w.getPixels(cw);
            int nh = e.minSize.h.getPixels(ch);
            int w = 0, h = 0;
            e.computeBoxModel(cw, ch);

            if(xw) xw += e.bm.left + e.bm.right;
            if(xh) xh += e.bm.top + e.bm.bottom;
            nw += e.bm.left + e.bm.right;
            nh += e.bm.top + e.bm.bottom;

            //if(xw > w) // w is 0
               w = Min(xw, rcw);
            //if(xh > h) // h is 0
               h = Min(xh, rch);

            // take the max size if bigger
            //if(xw && xw < w) w = xw; // w s already the smaller of xw or rcw
            //if(xh && xh < h) h = xh; // h s already the smaller of xh or rch
            // take the min size if smaller
            if(nw && nw > w) w = nw;
            if(nh && nh > h) h = nh;

            if(!w) w = cw;
            if(!h) h = ch;

            /*w -= e.bm.left + e.bm.right;
            h -= e.bm.top + e.bm.bottom;*/

            e.clientSize = { w, h };

            e.computeContentSize(displaySystem);
            if(!e.hScroll && e.contentSize.w > nw) nw = e.contentSize.w;
            if(!e.vScroll && e.contentSize.h > nh) nh = e.contentSize.h;

            if(direction == horizontal)
               rcw -= nw;
            else
               rch -= nh;

            if(direction == horizontal)
            {
               minimum += nw;
               if(nh > thickness) thickness = nh;
            }
            else
            {
               minimum += nh;
               if(nw > thickness) thickness = nw;
            }
         }
#endif // 0
      }
      if(caption)
      {
         /*if(!cw) cw = MAXINT;
         if(!ch) ch = MAXINT;*/

         //displaySystem.FontExtent(fontObject, caption, strlen(caption), (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         wrapTextExtent(displaySystem, fontObject, caption, cw, ch, (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         if(graphicsSize.w)
            graphicsSize.w += 1;
      }

#if 0
      // Set the content size to the max of (minimum extent of children, graphics extent)
      if(direction == horizontal)
         contentSize = { Max(graphicsSize.w, minimum), Max(graphicsSize.h, thickness) };
      else
         contentSize = { Max(graphicsSize.w, thickness), Max(graphicsSize.h, minimum) };
#endif // 0
   }

   void updateTLPosition()
   {
#if 0
      for(n : nodes)
      {
         Ux e = n;
         e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
         n.updateTLPosition();
      }
#endif // 0
   }

   void autoLayout()
   {
#if 0
      int cw = clientSize.w, ch = clientSize.h;
      int totalMax = 0;
      int totalUsed[Alignment] = { 0 };
      int thickness = direction == vertical ? clientSize.w : clientSize.h;
      int start = 0;
      SelfAlignment lastAlignment = (direction == horizontal) ? nodes[0].selfHAlignment : nodes[0].selfVAlignment;
      int totalMin = 0;
      if(lastAlignment == inherit) lastAlignment = (direction == horizontal) ? hAlignment : vAlignment;
      cw -= bm.left + bm.right;
      ch -= bm.top + bm.bottom;

      // Allocate extra space
      for(n : nodes)
      {
         Ux e = n;
         e.clientSize = { };
         if(e.autoLayoutFlag)
         {
            if(direction == horizontal)
            {
               int xw = e.maxSize.w.getPixels(cw);
               int nw = e.minSize.w.getPixels(cw);
               int w = Max(nw, e.contentSize.w);
               int mm = bm.left + bm.right;
               /*int mm = mgn.left + mgn.right;
               int mb = brd.left + brd.right;
               int mp = pdg.left + pdg.right;*/
               if(xw && xw < w) w = xw;

               totalMin += w + mm;// + mm + mb + mp;

               if(xw && w > xw) xw = w;

               totalMax += Max(w, xw) + mm;// + mm + mb + mp;
               totalUsed[e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment] += Max(xw, w) + mm;// + mm + mb + mp;
            }
            else
            {
               int xh = e.maxSize.h.getPixels(ch);
               int nh = e.minSize.h.getPixels(ch);
               int h = Max(nh, e.contentSize.h);
               int mm = bm.top + bm.bottom;
               /*int mm = mgn.top + mgn.bottom;
               int mb = brd.top + brd.bottom;
               int mp = pdg.top + pdg.bottom;*/
               if(xh && xh < h) h = xh;

               totalMin += h + mm;// + mm + mb + mp;

               if(xh && h > xh) xh = h;

               totalMax += Max(h, xh) + mm;// + mm + mb + mp;
               totalUsed[e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment] += Max(xh, h) + mm;// + mm + mb + mp;
            }
         }
      }

      if(direction == horizontal)
      {
         if(totalUsed[lastAlignment] < cw)
         {
            if(lastAlignment == right)
               start = (cw - totalUsed[lastAlignment]);
            else if(lastAlignment == center)
               start = (cw - totalUsed[lastAlignment]) / 2;
         }
      }
      else
      {
         if(totalUsed[lastAlignment] < ch)
         {
            if(lastAlignment == right)
               start = (ch - totalUsed[lastAlignment]);
            else if(lastAlignment == center)
               start = (ch - totalUsed[lastAlignment]) / 2;
         }
      }

      for(n : nodes)
      {
         Ux e = n;
         int w = e.hScroll ? 0 : e.contentSize.w;
         int h = e.vScroll ? 0 : e.contentSize.h;
         int nw = e.minSize.w.getPixels(cw);
         int nh = e.minSize.h.getPixels(ch);
         int xw = e.maxSize.w.getPixels(cw);
         int xh = e.maxSize.h.getPixels(ch);
         bool positionUpdated = false;

         if(nw > w) w = nw;
         if(nh > h) h = nh;

         xw += e.bm.left + e.bm.right;
         xh += e.bm.top + e.bm.bottom;
         nw += e.bm.left + e.bm.right;
         nh += e.bm.top + e.bm.bottom;

         /*w += mgn.left + mgn.right;
         h += mgn.top + mgn.bottom;
         xw += mgn.left + mgn.right;
         xh += mgn.top + mgn.bottom;

         w += brd.left + brd.right;
         h += brd.top + brd.bottom;
         xw += brd.left + brd.right;
         xh += brd.top + brd.bottom;

         w += pdg.left + pdg.right;
         h += pdg.top + pdg.bottom;
         xw += pdg.left + pdg.right;
         xh += pdg.top + pdg.bottom;*/

         if(xw && w > xw) w = xw;
         if(xh && h > xh) h = xh;

         if(direction == horizontal)
         {
            SelfAlignment alignment = e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment;
            int y = 0;
            xw = (w < xw && totalMax > totalMin && cw > totalMin) ? (int)(w + (xw - w) * Min(1.0f, (float)(cw - totalMin) / (totalMax - totalMin))) : 0;

            if(xw > w) w = xw;
            if(xh > h) h = xh;
            if(h > thickness) h = thickness;

            w = Min(w, Max(0, cw - start));

            if(alignment != lastAlignment && totalUsed[alignment] < cw && lastAlignment != right && (lastAlignment != center || alignment == right))
            {
               int newStart = (cw - totalUsed[alignment]);
               if(alignment == center)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment = alignment;
            }

            switch(e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment)
            {
               case right: y = thickness - h; break;
               case center: y = (thickness - h) / 2; break;
            }
            e.position = { start, y + bm.top/*mgn.top + brd.top + pdg.top*/ };
            start += w;
         }
         else
         {
            SelfAlignment alignment = e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment;
            int x = 0;
            xh = (h < xh && totalMax > totalMin && ch > totalMin) ? (int)(h + (xh - h) * Min(1.0f, (float)(ch - totalMin) / (totalMax - totalMin))) : 0;

            if(xh > h) h = xh;
            if(xw > w) w = xw;
            if(w > thickness) w = thickness;

            h = Min(h, Max(0, ch - start));

            if(alignment != lastAlignment && totalUsed[alignment] < ch && lastAlignment != right && (lastAlignment != center || alignment == right))
            {
               int newStart = (ch - totalUsed[alignment]);
               if(alignment == center)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment = alignment;
            }

            switch(e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment)
            {
               case right: x = thickness - w; break;
               case center: x = (thickness - w) / 2; break;
            }

            e.position = { x + bm.left/*mgn.left + brd.left + pdg.left*/, start };
            start += h;
         }

         w -= e.bm.left + e.bm.right;
         h -= e.bm.top + e.bm.bottom;

         /*w -= mgn.left + mgn.right;
         h -= mgn.top + mgn.bottom;

         w -= brd.left + brd.right;
         h -= brd.top + brd.bottom;

         w -= pdg.left + pdg.right;
         h -= pdg.top + pdg.bottom;*/

         if(w != e.clientSize.w || h != e.clientSize.h)
         {
            e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
            e.clientSize = { w, h };
            if(e.autoLayoutFlag && e.nodes)
               e.autoLayout();
         }
         else
         {
            if(e.tlPosition.x != e.position.x + tlPosition.x || e.tlPosition.y != e.position.y + tlPosition.y )
               positionUpdated = true;
            e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
            if(positionUpdated && e.nodes)
               e.updateTLPosition();
         }
      }
#endif // 0
   }

   void render(Surface surface)
   {
#if 0
      //int cw = clientSize.w, ch = clientSize.h;
      int x, y, x2, y2;
      // clientSize excludes box model
      x = tlPosition.x + mgn.left;
      y = tlPosition.y + mgn.top;
      x2 = x + brd.left + pdg.left + clientSize.w + pdg.right + brd.right - 1;
      y2 = y + brd.top + pdg.top + clientSize.h + pdg.bottom + brd.bottom - 1;
      // clientSize includes box model
      /*x = tlPosition.x + mgn.left;
      y = tlPosition.y + mgn.top;
      x2 = tlPosition.x + clientSize.w - mgn.right - 1;
      y2 = tlPosition.y + clientSize.h - mgn.bottom - 1;*/
      if(brd.left || brd.top || brd.right || brd.bottom) // to improve: draw sides individually
      {
         surface.background = borderColor;
         surface.Area(x, y, x2, y2);
         /*surface.Area(tlPosition.x + mgn.left, tlPosition.y + mgn.top,
               tlPosition.x + mgn.left + clientSize.w + mgn.right - 1, tlPosition.y + mgn.top + clientSize.h + mgn.bottom - 1);*/
      }

      x += brd.left;
      y += brd.top;
      x2 -= brd.right;
      y2 -= brd.bottom;
      surface.background = bgColor;
      /*surface.Area(tlPosition.x + , tlPosition.y, tlPosition.x + clientSize.w - 1, tlPosition.y + clientSize.h - 1);
      surface.background = bgColor;
      surface.Area(tlPosition.x + mgn.left + brd.left, tlPosition.y + mgn.top + brd.top,
            tlPosition.x + mgn.left + pdg.left + clientSize.w + pdg.right - 1, tlPosition.y + mgn.top + pdg.top + clientSize.h + pdg.bottom - 1);*/
      surface.Area(x, y, x2, y2);

      x += pdg.left;
      y += pdg.top;
      x2 -= pdg.right;
      y2 -= pdg.bottom;
      if(bmpObject)
      {
         int sw = bmpObject.width, sh = bmpObject.height;
         int bx = x + (clientSize.w - sw) / 2; // who asked for centering ?
         int by = y + (clientSize.h - sh) / 2;
         surface.blitTint = bitmapTint;
         surface.Blit(bmpObject, bx,by,0,0, sw,sh);
      }
      if(caption)
      {
         int sw = contentSize.w;
         int sh = contentSize.h;
         int tx = x;
         int ty = y;
         if(hAlignment == center)
            tx += (clientSize.w - sw) / 2;
         /*else
            x += mgn.left + brd.left + pdg.left;*/
         if(vAlignment == center)
            ty += (clientSize.h - sh) / 2;
         /*else
            y += mgn.top + brd.top + pdg.top;*/

         surface.foreground = fgColor;
         surface.font = fontObject;
         // surface.WriteText(x, y, caption, strlen(caption));
         //wrapText(surface, caption, tx, ty, tlPosition.x + clientSize.w, tlPosition.y + clientSize.h);
         wrapText(surface, caption, tx, ty, x2, y2);
      }
      if(nodes)
      {
         for(n : nodes)
            n.render(surface);
      }
#endif // 0
   }

}

class Lx
{
   //property Container<T>
   property Container { set { return { c = value }; } get { return this; } }
   Container c;
}

class GuhixWindow : Window
{
   //displayDriver = "OpenGL";
   caption = $"Hix | Gu";
   background = white;//clWindwow;
   borderStyle = sizableThin;
   hasClose = true;
   hasMaximize = true;
   hasMinimize = true;
   showInTaskBar = true;
   nativeDecorations = false;
   clientSize = { 480, 220 };
   //minClientSize = { 320, 140 };
   //state = maximized;
   anchor = { top = 360, right = 100 };

   //ux = ElTitleBar { };

   Timer loader
   {
      this;
      delay = 0.4;

      bool DelayExpired()
      {
         //d
         return true;
      }
   };

   FontResource ::SystemFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f };
#endif
   }

#if 0
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
#endif // 0

   Ux ux;
   Lx lxx;
   public property Lx lx
   {
      set
      {
         lxx = value;
         {
            //IteratorPointer it = lxx.c.firstIterator;
            IteratorPointer i;
            for(i = lxx.c.GetFirst(); i; i = lxx.c.GetNext(i))
            {
               //
               String s = PrintString(i);
               Ux { ux, caption = s };
            }
            //do
            //{
               //if(ux)
               {
                  //
               }
            //} while(it.Next());
         }
      }
   }

   bool OnLoadGraphics()
   {
      if(ux) ux.loadGraphics(displaySystem);
      return true;
   }

   void OnResize(int width, int height)
   {
      Ux e = ux;
      /*if(e)
         PrintLn("AutoLayoutWindow::OnResize(", width, ", ", height, ")");*/
      if(e)
      {
         int nw = 0;
         int nh = 0;
         e.availSize = { width, height };
         e.computeBoxModel(width, height);
         nw = e.minSize.a.compute(width, 0);
         nh = e.minSize.b.compute(height, 0);
         e.clientSize = { Max(nw, width)/* - e.bm.left - e.bm.right*/, Max(nh, height)/* - e.bm.top - e.bm.bottom*/ };
         //PrintLn(e.clientSize);
         if(e.nodes)
         {
            e.computeContentSize(displaySystem);
            /*if(clientSize.w != ux.clientSize.w || clientSize.h != ux.clientSize.h)
               clientSize = ux.clientSize;*/
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

      /*if(ux)
         PrintLn("AutoLayoutWindow::OnRedraw()");*/
      if(ux) ux.render(surface);
   }

#if 0
   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(this._class == class(Test2))
      {
         ElTitleBar e = (ElTitleBar)ux;
         e.highlight.bgColor = active ? clHighlight : clBar;
         Update(null);
         Window::OnActivate(active, previous, goOnWithActivation, direct);
      }
      return true;
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
#endif // 0
}

#if 0
class Element
{
private:
   List<Element> nodes;
   DimensionBox margin;
   DimensionBox border;
   DimensionBox padding;
   Size contentSize; // Computed from the content (Max of Text/Primitives extent and Children minimum extent)
   Element parent;

   Dimensions minSize, maxSize;  // Size specification
   Size clientSize;
   BorderStyle borderStyle;
   Point scroll;
   bool hScroll, vScroll;
   const String caption;
   ColorAlpha bgColor;
   ColorAlpha fgColor;
   ColorAlpha borderColor;
   Direction direction;
   bool autoLayoutFlag;
   Point position; // Position relative to parent's client area, including margin offset
   Point tlPosition;
   HVAlignment hAlignment, vAlignment; // Alignment of content (children or graphics) ?
   SelfAlignment selfHAlignment, selfVAlignment;

   selfHAlignment = inherit;
   selfVAlignment = inherit;

   autoLayoutFlag = true;
   fgColor = black;
   bgColor = 0;

   FontResource font;
   Font fontObject;
   BitmapResource bitmap;
   Bitmap bmpObject;
   ColorAlpha bitmapTint;
   bitmapTint = white;
   /*
   List<Primitive> primitives;   // Displays above nodes
   List<Primitive> bgPrimitives; // Displays behind nodes, need to figure out how to scale to width (e.g. Rectangle with a gradient)
   List<Effects> effects;
   */

   void loadGraphics(DisplaySystem displaySystem)
   {
      if(!fontObject)
      {
         Element e = this;
         FontResource font;
         while(e && !e.font) e = e.parent;
         font = e ? e.font : defaultFont;
         displaySystem.LoadResource(font);
         fontObject = font.font;
      }

      if(!bmpObject && bitmap)
      {
         displaySystem.LoadResource(bitmap);
         bmpObject = bitmap.bitmap;
      }

      for(n : nodes)
         n.loadGraphics(displaySystem);
   }

   void computeContentSize(DisplaySystem displaySystem)
   {
      int cw = clientSize.w, ch = clientSize.h;
      int minimum = 0, thickness = 0;
      Size graphicsSize { };
      int rcw = cw, rch = ch;
      for(n : nodes)
      {
         Element e = n;
         if(e.autoLayoutFlag)
         {
            int xw = e.maxSize.w.getPixels(cw);
            int xh = e.maxSize.h.getPixels(ch);
            int nw = e.minSize.w.getPixels(cw);
            int nh = e.minSize.h.getPixels(ch);
            int w = 0, h = 0;
            Box m
            {
               left = e.margin.left.getPixels(cw);
               right = e.margin.right.getPixels(cw);
               top = e.margin.top.getPixels(ch);
               bottom = e.margin.bottom.getPixels(ch);
            };

            xw += m.left = m.right;
            xh += m.top = m.bottom;
            nw += m.left = m.right;
            nh += m.top = m.bottom;

            if(xw > w)
               w = Min(xw, rcw);
            //if(xh > h)
               h = Min(xh, rch);

            if(xw && xw < w) w = xw;
            if(xh && xh < h) h = xh;
            if(nw && nw > w) w = nw;
            if(nh && nh > h) h = nh;

            if(!w) w = cw;
            if(!h) h = ch;

            w -= m.left + m.right;
            h -= m.top + m.bottom;

            e.clientSize = { w, h };

            e.computeContentSize(displaySystem);
            if(!e.hScroll && e.contentSize.w > nw) nw = e.contentSize.w;
            if(!e.vScroll && e.contentSize.h > nh) nh = e.contentSize.h;

            if(direction == horizontal)
               rcw -= nw;

            if(direction == horizontal)
            {
               minimum += nw;
               if(nh > thickness) thickness = nh;
            }
            else
            {
               minimum += nh;
               if(nw > thickness) thickness = nw;
            }
         }
      }
      if(caption)
      {
         /*if(!cw) cw = MAXINT;
         if(!ch) ch = MAXINT;*/

         //displaySystem.FontExtent(fontObject, caption, strlen(caption), (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         wrapTextExtent(displaySystem, fontObject, caption, cw, ch, (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         if(graphicsSize.w)
            graphicsSize.w += 1;
      }

      // Set the content size to the max of (minimum extent of children, graphics extent)
      if(direction == horizontal)
         contentSize = { Max(graphicsSize.w, minimum), Max(graphicsSize.h, thickness) };
      else
         contentSize = { Max(graphicsSize.w, thickness), Max(graphicsSize.h, minimum) };
   }

   void updateTLPosition()
   {
      for(n : nodes)
      {
         Element e = n;
         e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
         n.updateTLPosition();
      }
   }

   void autoLayout()
   {
      int cw = clientSize.w, ch = clientSize.h;
      int totalMax = 0;
      int totalUsed[Alignment] = { 0 };
      int thickness = direction == vertical   ? clientSize.w : clientSize.h;
      int start = 0;
      SelfAlignment lastAlignment = (direction == horizontal) ? nodes[0].selfHAlignment : nodes[0].selfVAlignment;
      int totalMin = 0;
      if(lastAlignment == inherit) lastAlignment = (direction == horizontal) ? hAlignment : vAlignment;

      // Allocate extra space
      for(n : nodes)
      {
         Element e = n;
         e.clientSize = { };
         if(e.autoLayoutFlag)
         {
            Box m
            {
               left = e.margin.left.getPixels(cw);
               right = e.margin.right.getPixels(cw);
               top = e.margin.top.getPixels(ch);
               bottom = e.margin.bottom.getPixels(ch);
            };

            if(direction == horizontal)
            {
               int xw = e.maxSize.w.getPixels(cw);
               int nw = e.minSize.w.getPixels(cw);
               int w = Max(nw, e.contentSize.w);
               int mm = m.left + m.right;
               if(xw && xw < w) w = xw;

               totalMin += w + mm;

               if(xw && w > xw) xw = w;

               totalMax += Max(w, xw) + mm;
               totalUsed[e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment] += Max(xw, w) + mm;
            }
            else
            {
               int xh = e.maxSize.h.getPixels(ch);
               int nh = e.minSize.h.getPixels(ch);
               int h = Max(nh, e.contentSize.h);
               int mm = m.top + m.bottom;
               if(xh && xh < h) h = xh;

               totalMin += h + mm;

               if(xh && h > xh) xh = h;

               totalMax += Max(h, xh) + mm;
               totalUsed[e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment] += Max(xh, h) + mm;
            }
         }
      }

      if(direction == horizontal)
      {
         if(totalUsed[lastAlignment] < cw)
         {
            if(lastAlignment == right)
               start = (cw - totalUsed[lastAlignment]);
            else if(lastAlignment == center)
               start = (cw - totalUsed[lastAlignment]) / 2;
         }
      }
      else
      {
         if(totalUsed[lastAlignment] < ch)
         {
            if(lastAlignment == right)
               start = (ch - totalUsed[lastAlignment]);
            else if(lastAlignment == center)
               start = (ch - totalUsed[lastAlignment]) / 2;
         }
      }

      for(n : nodes)
      {
         Element e = n;
         int w = e.hScroll ? 0 : e.contentSize.w;
         int h = e.vScroll ? 0 : e.contentSize.h;
         int nw = e.minSize.w.getPixels(cw);
         int nh = e.minSize.h.getPixels(ch);
         int xw = e.maxSize.w.getPixels(cw);
         int xh = e.maxSize.h.getPixels(ch);
         Box m
         {
            left = e.margin.left.getPixels(cw);
            right = e.margin.right.getPixels(cw);
            top = e.margin.top.getPixels(ch);
            bottom = e.margin.bottom.getPixels(ch);
         };
         bool positionUpdated = false;

         if(nw > w) w = nw;
         if(nh > h) h = nh;

         w += m.left + m.right;
         h += m.top + m.bottom;
         xw += m.left + m.right;
         xh += m.top + m.bottom;

         if(xw && w > xw) w = xw;
         if(xh && h > xh) h = xh;

         if(direction == horizontal)
         {
            SelfAlignment alignment = e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment;
            int y = 0;
            xw = (w < xw && totalMax > totalMin && cw > totalMin) ? (int)(w + (xw - w) * Min(1.0f, (float)(cw - totalMin) / (totalMax - totalMin))) : 0;

            if(xw > w) w = xw;
            if(xh > h) h = xh;
            if(h > thickness) h = thickness;

            w = Min(w, Max(0, cw - start));

            if(alignment != lastAlignment && totalUsed[alignment] < cw && lastAlignment != right && (lastAlignment != center || alignment == right))
            {
               int newStart = (cw - totalUsed[alignment]);
               if(alignment == center)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment = alignment;
            }

            switch(e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment)
            {
               case right: y = thickness - h; break;
               case center: y = (thickness - h) / 2; break;
            }
            e.position = { start, y + m.top };
            start += w;
         }
         else
         {
            SelfAlignment alignment = e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment;
            int x = 0;
            xh = (h < xh && totalMax > totalMin && ch > totalMin) ? (int)(h + (xh - h) * Min(1.0f, (float)(ch - totalMin) / (totalMax - totalMin))) : 0;

            if(xh > h) h = xh;
            if(xw > w) w = xw;
            if(w > thickness) w = thickness;

            h = Min(h, Max(0, ch - start));

            if(alignment != lastAlignment && totalUsed[alignment] < ch && lastAlignment != right && (lastAlignment != center || alignment == right))
            {
               int newStart = (ch - totalUsed[alignment]);
               if(alignment == center)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment = alignment;
            }

            switch(e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment)
            {
               case right: x = thickness - w; break;
               case center: x = (thickness - w) / 2; break;
            }

            e.position = { x + m.left, start };
            start += h;
         }
         w -= m.left + m.right;
         h -= m.top + m.bottom;

         if(w != e.clientSize.w || h != e.clientSize.h)
         {
            e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
            e.clientSize = { w, h };
            if(e.autoLayoutFlag && e.nodes)
               e.autoLayout();
         }
         else
         {
            if(e.tlPosition.x != e.position.x + tlPosition.x || e.tlPosition.y != e.position.y + tlPosition.y )
               positionUpdated = true;
            e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
            if(positionUpdated && e.nodes)
               e.updateTLPosition();
         }
      }
   }

   void render(Surface surface)
   {
      surface.background = bgColor;
      surface.Area(tlPosition.x, tlPosition.y, tlPosition.x + clientSize.w - 1, tlPosition.y + clientSize.h - 1);
      //PrintLn("{ ", tlPosition, ", ", clientSize, " }");
      if(bmpObject)
      {
         int sw = bmpObject.width, sh = bmpObject.height;
         int x = (clientSize.w - sw) / 2;
         int y = (clientSize.h - sh) / 2;
         surface.blitTint = bitmapTint;
         surface.Blit(bmpObject, x,y,0,0, sw,sh);
      }
      if(caption)
      {
         int sw = contentSize.w, sh = contentSize.h;
         int x = tlPosition.x, y = tlPosition.y;
         if(hAlignment == center)
            x += (clientSize.w - sw) / 2;
         if(vAlignment == center)
            y += (clientSize.h - sh) / 2;

         surface.foreground = fgColor;
         surface.font = fontObject;
         // surface.WriteText(x, y, caption, strlen(caption));
         wrapText(surface, caption, x, y, tlPosition.x + clientSize.w, tlPosition.y + clientSize.h);
      }
      if(nodes)
      {
         for(n : nodes)
            n.render(surface);
      }
   }

public:
   property Element parent
   {
      set
      {
         if(!value.nodes) value.nodes = { };
         value.nodes.Add(this);

         parent = value;
      }
   }
}

class AutoLayoutForm : Window
{
   displayDriver = "OpenGL";
   caption = "AutoLayoutForm -- HELLO?";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 480 };

   Element contents;

   bool OnLoadGraphics()
   {
      contents.loadGraphics(displaySystem);
      return true;
   }

   void OnResize(int width, int height)
   {
      int nw = contents.minSize.w.getPixels(width);
      int nh = contents.minSize.h.getPixels(height);
      contents.clientSize = { Max(nw, width), Max(nh, height) };
      if(contents.nodes)
      {
         contents.computeContentSize(displaySystem);
         contents.autoLayout();
      }
      Update(null);
   }

   void OnRedraw(Surface surface)
   {
      contents.render(surface);
   }
}
#endif // 0
