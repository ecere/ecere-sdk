public import "ecere"
import "wrapText"

// Add 'unset' ?
enum UnitType { percent, pixels, points };

struct Dimension
{
   UnitType type;
   union { double d; int i; };
   property double { set { d = value; type = percent; } get { return 0; } /* TODO: Compute this? Avoid use? */ }
   property int    { set { i = value; type = pixels; } get { return 0; } /* TODO: Compute this? Avoid use? */ }
   int getPixels(int p) { return (type == pixels) ? i : (int)(d * p + 0.5); }
};

struct DimensionBox
{
   Dimension left, top, right, bottom;
   property double { set { left = value; top = value; right = value; bottom = value; } get { return 0; } /* TODO: Compute this? Avoid use? */ }
   property int    { set { left = value; top = value; right = value; bottom = value; } get { return 0; } /* TODO: Compute this? Avoid use? */ }
};

struct Dimensions { Dimension w, h; };

enum Direction { horizontal, vertical };

enum HVAlignment : Alignment { bottom = right, top = left };
enum SelfAlignment : HVAlignment { inherit };

FontResource defaultFont { "Tahoma", 8.25f };

class Element
{
private:
   uint64 id;
   List<Element> nodes;
   DimensionBox margin;
   DimensionBox border;
   DimensionBox padding;
   Size contentSize; // Computed from the content (Max of Text/Primitives extent and Children minimum extent)
   Element parent;

   Dimensions minSize, maxSize;  // Size specification
   Size clientSize;
   Size scrollSize;
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

private:
   Box mgn; // margin
   Box brd; // border
   Box pdg; // padding
   Box bm; // combined for box model


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

   void computeBoxModel(int w, int h)
   {
      mgn =
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
      };
      bm =
      {
         left = mgn.left + brd.left + pdg.left;
         right = mgn.right + brd.right + pdg.right;
         top = mgn.top + brd.top + pdg.top;
         bottom = mgn.bottom + brd.bottom + pdg.bottom;
      };
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
            //PrintLn("contentSize: ", contentSize);
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
      }
      if(caption)
      {
         //char * t = caption;
         /*if(!cw) cw = MAXINT;
         if(!ch) ch = MAXINT;*/

         //displaySystem.FontExtent(fontObject, caption, strlen(caption), (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         wrapTextExtent(displaySystem, fontObject, caption, cw, ch, (int *)&graphicsSize.w, (int *)&graphicsSize.h);
         if(graphicsSize.w)
            graphicsSize.w += 1;
         //PrintLn("graphicsSize: ", graphicsSize);
      }

      // Set the content size to the max of (minimum extent of children, graphics extent)
      if(direction == horizontal)
         contentSize = { Max(graphicsSize.w, minimum), Max(graphicsSize.h, thickness) };
      else
         contentSize = { Max(graphicsSize.w, thickness), Max(graphicsSize.h, minimum) };
      //PrintLn("id(", id, ") graphicsSize: ", graphicsSize, " contentSize: ", contentSize, " clientSize: ", clientSize, "  ", caption);
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
      int thickness = direction == vertical ? clientSize.w : clientSize.h;
      int start = 0;
      SelfAlignment lastAlignment = (direction == horizontal) ? nodes[0].selfHAlignment : nodes[0].selfVAlignment;
      int totalMin = 0;
      if(lastAlignment == inherit) lastAlignment = (direction == horizontal) ? hAlignment : vAlignment;
      cw -= bm.left + bm.right;
      ch -= bm.top + bm.bottom;
      //PrintLn("Element::autoLayout() -- id(", id, ")");

      // Allocate extra space
      //PrintLn("extraSpace:");
      for(n : nodes)
      {
         Element e = n;
         e.clientSize = { };
         if(e.autoLayoutFlag)
         {
            if(direction == horizontal)
            {
               //Alignment a = e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment;
               int xw = e.maxSize.w.getPixels(cw);
               int nw = e.minSize.w.getPixels(cw);
               int w = Max(nw, e.contentSize.w);
               int bm = e.bm.left + e.bm.right;
               if(xw && xw < w) w = xw;

               totalMin += w + bm;

               if(xw && w > xw) xw = w;

               totalMax += Max(w, xw) + bm;
               totalUsed[e.selfHAlignment == inherit ? hAlignment : e.selfHAlignment] += Max(w, xw) + bm;
               //PrintLn("H:nw", nw, ":xw", xw, ":w", w, ":bm", bm, ":tMin", totalMin, ":tMax", totalMax, ":a", a, ":tUsed", totalUsed[a]);
            }
            else
            {
               //Alignment a = e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment;
               int xh = e.maxSize.h.getPixels(ch);
               int nh = e.minSize.h.getPixels(ch);
               int h = Max(nh, e.contentSize.h);
               int bm = e.bm.top + e.bm.bottom;
               if(xh && xh < h) h = xh;

               totalMin += h + bm;

               if(xh && h > xh) xh = h;

               totalMax += Max(h, xh) + bm;
               totalUsed[e.selfVAlignment == inherit ? vAlignment : e.selfVAlignment] += Max(h, xh) + bm;
               //PrintLn("V:nh", nh, ":xh", xh, ":h", h, ":mm", mm, ":tMin", totalMin, ":tMax", totalMax, ":a", a, ":tUsed", totalUsed[a]);
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

      //PrintLn("positioning:");
      for(n : nodes)
      {
         Element e = n;
         int w = e.hScroll ? 0 : e.contentSize.w;
         int h = e.vScroll ? 0 : e.contentSize.h;
         int nw = e.minSize.w.getPixels(cw);
         int nh = e.minSize.h.getPixels(ch);
         int xw = e.maxSize.w.getPixels(cw);
         int xh = e.maxSize.h.getPixels(ch);
         bool positionUpdated = false;

         //PrintLn("a:w", w, ":h", h, ":nw", nw, ":nh", nh, ":xw", xw, ":xh", xh);

         w += e.bm.left + e.bm.right;
         h += e.bm.top + e.bm.bottom;
         if(xw) xw += e.bm.left + e.bm.right;
         if(xh) xh += e.bm.top + e.bm.bottom;
         nw += e.bm.left + e.bm.right;
         nh += e.bm.top + e.bm.bottom;

         //PrintLn("b:w", w, ":h", h, ":nw", nw, ":nh", nh, ":xw", xw, ":xh", xh);

         if(nw > w) w = nw;
         if(nh > h) h = nh;

         if(xw && w > xw) w = xw;
         if(xh && h > xh) h = xh;

         //PrintLn("c:w", w, ":h", h, ":nw", nw, ":nh", nh, ":xw", xw, ":xh", xh);

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
            e.position = { start, y + e.bm.top };
            //PrintLn("H:w", w, ":h", h, ":nw", nw, ":nh", nh, ":xw", xw, ":xh", xh, ":start", start, ":y", y, "id(", e.id, ") position: ", e.position, "  ", caption);
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

            e.position = { x + e.bm.left, start };
            //PrintLn("V:w", w, ":h", h, ":nw", nw, ":nh", nh, ":xw", xw, ":xh", xh, ":x", x, ":start", start, "id(", e.id, ") position: ", e.position, "  ", caption);
            start += h;
         }

         w -= e.bm.left + e.bm.right;
         h -= e.bm.top + e.bm.bottom;

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
         //PrintLn("id(", e.id, ") contentSize: ", e.contentSize, " clientSize: ", e.clientSize, "  ", e.caption);
      }
   }

   void render(Surface surface)
   {
      //int cw = clientSize.w, ch = clientSize.h;
      int x, y, x2, y2;
      // clientSize excludes box model
      //PrintLn("render");
      //PrintLn(":x", tlPosition.x, ":y", tlPosition.y);
      x = tlPosition.x + mgn.left;
      y = tlPosition.y + mgn.top;
      //PrintLn(":x", x, ":y", y);
      //PrintLn("clientSize:w", clientSize.w, ":h", clientSize.h);
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
      //PrintLn(":x", x, ":y", y);
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
      //PrintLn(":x", x, ":y", y);
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

         //PrintLn("wrapText:tx", tx, ":ty", ty, ":sw", tlPosition.x + clientSize.w, ":sh", tlPosition.y + clientSize.h, " - id(", id, ") position: ", position, "  ", caption);
         surface.foreground = fgColor;
         surface.font = fontObject;
         //surface.WriteText(x, y, caption, strlen(caption));
         //wrapText(surface, caption, tx, ty, tlPosition.x + clientSize.w, tlPosition.y + clientSize.h);
         wrapText(surface, caption, x, y, x2, y2);
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
   caption = "";
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
      contents.computeBoxModel(width, height);
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

class Bar : Element
{
   direction = horizontal;
   maxSize = { 1.0, 1.0 };
}

class Col : Element
{
   direction = vertical;
   maxSize = { 1.0, 1.0 };
}
