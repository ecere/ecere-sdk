public import "ecere"

import "GraphicalElement"
import "TIManager"

int wrapTextExtentFM(LWFontManager fm, GEFont geFont, LWFMFont font, const String text, int ex, int ey, int * wtw, int * wth)
{
   const String start = text;
   const String drawUntil = null;
   int w = 0;
   int y = 0;
   int tw, th;
   int lh;
   Box box;
   float pixelSize = (geFont ? geFont.size : 12) * 96 / 72;

   fm.setState(font, pixelSize, { left, top }, 0, 1); // FIXME: outline padding width
   fm.getExtent(0, 0, "W", 1, box);
   tw = box.right - box.left;
   th = box.bottom - box.top;
   th = (int)(font.lineHeight * pixelSize);
   lh = th;

   *wtw = 0;
   *wth = th;

   while(true)
   {
      bool canAddMore = false;
      if(ey - y >= 2*th)
      {
         const String s = drawUntil ? drawUntil + 1 : start;
         const String nextSpace = strchr(s, ' ');
         const String newLine = strchr(s, '\n');
         if(newLine && (!nextSpace || (newLine < nextSpace)))
            nextSpace = newLine;
         if(!nextSpace)
            nextSpace = strchr(s, 0);
         if(nextSpace)
         {
            fm.getExtent(0, 0, drawUntil ? drawUntil : start, (int)(nextSpace - (drawUntil ? drawUntil : start)), box);
            tw = box.right - box.left;
            th = box.bottom - box.top;
            th = (int)(font.lineHeight * pixelSize);

            if(!th) th = lh;
            if(w + tw < ex || !drawUntil)
            {
               drawUntil = nextSpace;
               w += tw;
               if(*nextSpace != 0 && *nextSpace != '\n')
                  canAddMore = true;
            }
         }
      }
      if(!canAddMore)
      {
         if(!drawUntil && !y && !w)
         {
            drawUntil = strchr(start, '\0');
            if(drawUntil)
            {
               fm.getExtent(0, 0, start, (int)(drawUntil - start), box);
               w = box.right - box.left;
               th = box.bottom - box.top;
               th = (int)(font.lineHeight * pixelSize);
            }
         }
         if(drawUntil)
         {
            *wtw = Max(*wtw, w);
            *wth = Max(*wth, y + th);
            w = 0;
            y += th;
            if(!*drawUntil)
               break;
            start = drawUntil + 1;
            drawUntil = null;
         }
         else
         {
            *wtw = Max(*wtw, w);
            *wth = Max(*wth, y + th);
            y += th;
            break;
         }
      }
   }
   return y;
}

struct Dimension
{
   GraphicalUnit type;
   union { double d; int i; };
   property double { set { d = value; type = percent; } get { return 0; }  /* TODO: Compute this? Avoid use? */ }
   property int    { set { i = value; type = pixels; } get { return 0; } /* TODO: Compute this? Avoid use? */ }
   int getPixels(int p) { return (type == pixels) ? i : (int)(d * p + 0.5); }
};

struct DimensionBox { Dimension left, top, right, bottom; };

struct Dimensions { Dimension w, h; };

enum Direction { horizontal, vertical };

GEFont defaultFont { "Tahoma", 8.25f };

class Element : MultiGraphicalElement
{
private:
   DimensionBox margin, border, padding;  // The Box model
   Size contentSize; // Computed from the content (Max of Text/Primitives extent and Children minimum extent)

   Dimensions minSize, maxSize;  // Size specification
   Size clientSize;
   // BorderStyle borderStyle;
   Point scroll;
   bool hScroll, vScroll;
   const String caption;
   ColorAlpha bgColor, fgColor, borderColor;
   Direction direction;
   bool autoLayoutFlag;
   Point position; // Position relative to parent's client area, including margin offset
   Point tlPosition;
   Alignment2D alignment; // Alignment of content (children or graphics) ?
   Alignment2D selfAlignment { unset, unset };

   autoLayoutFlag = true;
   fgColor = black;
   bgColor = 0;

   GEFont font;
   Image image;

   RoundedRectangle gRect { parent = this };
   Text gText { parent = this };

   /*
   List<Primitive> primitives;   // Displays above elements
   List<Primitive> bgPrimitives; // Displays behind elements, need to figure out how to scale to width (e.g. Rectangle with a gradient)
   List<Effects> effects;
   */

   void computeContentSize(LWFontManager fontManager)
   {
      int cw = clientSize.w, ch = clientSize.h;
      int minimum = 0, thickness = 0;
      Size graphicsSize { };
      int rcw = cw, rch = ch;
      for(n : elements; eClass_IsDerived(n._class, class(Element)))
      {
         Element e = (Element)n;
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

            e.computeContentSize(fontManager);
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

         LWFMFont font;
         Element p = this;
         GEFont tFont = null;

         while(!p.font && p.parent && eClass_IsDerived(p.parent._class, class(Element)))
            p = (Element)p.parent;

         tFont.OnCopy(p.font);
         tFont.color = fgColor;

         gText.font = tFont;
         gText.text = caption;

         font = fontManager.getFont(gText.font);

         wrapTextExtentFM(fontManager, gText.font, font, caption, cw, ch, (int *)&graphicsSize.w, (int *)&graphicsSize.h);
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
      for(n : elements; eClass_IsDerived(n._class, class(Element)))
      {
         Element e = (Element)n;
         e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
         e.updateTLPosition();
      }
   }

   void autoLayout()
   {
      int cw = clientSize.w, ch = clientSize.h;
      int totalMax = 0;
      int totalUsed[VAlignment] = { 0 };
      int thickness = direction == vertical   ? clientSize.w : clientSize.h;
      int start = 0;
      int totalMin = 0;
      Alignment2D lastAlignment = elements.GetCount() > 2 ? ((Element)elements[2]).selfAlignment : { };
      if(!(int)(direction == horizontal ? lastAlignment.horzAlign : lastAlignment.vertAlign))
         lastAlignment = alignment;

      // Allocate extra space
      for(n : elements; eClass_IsDerived(n._class, class(Element)))
      {
         Element e = (Element)n;
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
               totalUsed[(VAlignment)(e.selfAlignment.horzAlign == unset ? alignment.horzAlign : e.selfAlignment.horzAlign)] += Max(xw, w) + mm;
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
               totalUsed[(VAlignment)(e.selfAlignment.vertAlign == unset ? alignment.vertAlign : e.selfAlignment.vertAlign)] += Max(xh, h) + mm;
            }
         }
      }

      if(direction == horizontal)
      {
         if(totalUsed[(VAlignment)lastAlignment.horzAlign] < cw)
         {
            if(lastAlignment.horzAlign == right)
               start = (cw - totalUsed[(VAlignment)lastAlignment.horzAlign]);
            else if(lastAlignment.horzAlign == center)
               start = (cw - totalUsed[(VAlignment)lastAlignment.horzAlign]) / 2;
         }
      }
      else
      {
         if(totalUsed[lastAlignment.vertAlign] < ch)
         {
            if(lastAlignment.vertAlign == bottom)
               start = (ch - totalUsed[lastAlignment.vertAlign]);
            else if(lastAlignment.vertAlign == middle)
               start = (ch - totalUsed[lastAlignment.vertAlign]) / 2;
         }
      }

      for(n : elements; eClass_IsDerived(n._class, class(Element)))
      {
         Element e = (Element)n;
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
            HAlignment alignment = e.selfAlignment.horzAlign == unset ? this.alignment.horzAlign : e.selfAlignment.horzAlign;
            int y = 0;
            xw = (w < xw && totalMax > totalMin && cw > totalMin) ? (int)(w + (xw - w) * Min(1.0f, (float)(cw - totalMin) / (totalMax - totalMin))) : 0;

            if(xw > w) w = xw;
            if(xh > h) h = xh;
            if(h > thickness) h = thickness;

            w = Min(w, Max(0, cw - start));

            if(alignment != lastAlignment.horzAlign && totalUsed[(VAlignment)alignment] < cw && lastAlignment.horzAlign != right && (lastAlignment.horzAlign != center || alignment == right))
            {
               int newStart = (cw - totalUsed[(VAlignment)alignment]);
               if(alignment == center)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment.horzAlign = alignment;
            }

            switch(e.selfAlignment.vertAlign == unset ? this.alignment.vertAlign : e.selfAlignment.vertAlign)
            {
               case bottom: y = thickness - h; break;
               case middle: y = (thickness - h) / 2; break;
            }
            e.position = { start, y + m.top };
            start += w;
         }
         else
         {
            VAlignment alignment = e.selfAlignment.vertAlign == unset ? this.alignment.vertAlign : e.selfAlignment.vertAlign;
            int x = 0;
            xh = (h < xh && totalMax > totalMin && ch > totalMin) ? (int)(h + (xh - h) * Min(1.0f, (float)(ch - totalMin) / (totalMax - totalMin))) : 0;

            if(xh > h) h = xh;
            if(xw > w) w = xw;
            if(w > thickness) w = thickness;

            h = Min(h, Max(0, ch - start));

            if(alignment != lastAlignment.vertAlign && totalUsed[alignment] < ch && lastAlignment.vertAlign != bottom && (lastAlignment.vertAlign != middle || alignment == bottom))
            {
               int newStart = (ch - totalUsed[alignment]);
               if(alignment == middle)
                  newStart /= 2;
               if(newStart > start)
                  start = newStart;
               lastAlignment.vertAlign = alignment;
            }

            switch(e.selfAlignment.horzAlign == unset ? this.alignment.horzAlign : e.selfAlignment.horzAlign)
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
            if(e.autoLayoutFlag && e.elements)
               e.autoLayout();
         }
         else
         {
            if(e.tlPosition.x != e.position.x + tlPosition.x || e.tlPosition.y != e.position.y + tlPosition.y )
               positionUpdated = true;
            e.tlPosition = { e.position.x + tlPosition.x, e.position.y + tlPosition.y };
            if(positionUpdated && e.elements)
               e.updateTLPosition();
         }
      }


      {
         Element p = this;
         GEFont tFont = null;
         int sw = contentSize.w, sh = contentSize.h;
         int x = tlPosition.x, y = tlPosition.y;

         while(!p.font && p.parent && eClass_IsDerived(p.parent._class, class(Element)))
            p = (Element)p.parent;

         tFont.OnCopy(p.font);
         tFont.color = fgColor;

         gText.font = tFont;
         gText.text = caption;

         // TODO: Use graphical elements to render?
         gRect.box = { x, y, x + cw, y + ch };
         gRect.fill = { bgColor.color, opacity = bgColor.a / 255.0f };
         gRect.stroke = { borderColor.color, opacity = borderColor.a / 255.0f, width = 0 };

         // TODO: Update? pRect.graphic = gRect;

         if(alignment.horzAlign == center)
            x += (cw - sw) / 2;
         if(alignment.vertAlign == middle)
            y += (ch - sh) / 2;
         //pText.position2D = { x, y };
         gText.position2D = { x, y };
         gText.alignment = { left, top };
         // TODO: Update? pText.graphic = gText;
      }
   }

   #if 0 //  Render should now be handled by Graphical Presentations
   void render(Surface surface)
   {
      surface.background = bgColor;
      surface.Area(tlPosition.x, tlPosition.y, tlPosition.x + clientSize.w - 1, tlPosition.y + clientSize.h - 1);
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
      if(elements)
      {
         for(n : elements)
            ((Element)n).render(surface);
      }
   }
   #endif
}

/*
class Elemental : Col
{
   Bar r1
   {
      Element b0 { caption = "<<" };
      Bar s1 { };
      Element b1 { caption = "The" };
      Element b2 { caption = "Quick" };
      Element b3 { caption = "Brown" };
      Bar s2 { };
   };
   Bar r2
   {
      Element b4 { caption = "Fox." };
      Element b5 { };
      Element b6 { };
   };
   Bar r3
   {
      Element b7 { caption = "Left" };
      Element b8 { caption = "Address Bar" };
      Element b9 { caption = "Right" };
   };
}

{ [
   { "class == Elemental", bgColor = ivory },
   { "id == Elemental::r1", bgColor = gray, maxSize = { 100%, 100 } },
   { "id == Elemental::b0", fgColor = white, bgColor = navy },
   { "id == Elemental::b1", bgColor = red },
   { "id == Elemental::b2", bgColor = blue, fgColor = white },

   { "id == Elemental::r2", bgColor = lightGray, maxSize = { 100%, 150 } },
   { "id == Elemental::b4", bgColor = yellow },
   { "id == Elemental::b5", bgColor = aquamarine, maxSize = { 25%, 50 } },
   { "id == Elemental::b6", bgColor = tomato, maxSize = { 50%, 50 } },

   { "id == Elemental::r3", bgColor = lightGray, maxSize = { 100%, 0 } },
   { "id == Elemental::b7", bgColor = skyBlue },
   { "id == Elemental::b8", bgColor = teal, maxSize.w = 100% },
   { "id == Elemental::b9", bgColor = maroon }
] };
*/

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

/*
class Elemental : Col
{
   bgColor = ivory;

   Bar header { this, bgColor = blue };
   Bar middle { this, bgColor = white };
      Col col1 { middle, bgColor = lime };
         Element e1 { col1, caption = "Foo", bgColor = gray, selfHAlignment = center, selfVAlignment = center };
      Col col2 { middle, bgColor = skyBlue };
         Element e2 { col2, caption = "Bar", bgColor = lightGray, selfHAlignment = center, selfVAlignment = center };
      Col col3 { middle, bgColor = tomato };
         Element e3 { col3, caption = "Third", bgColor = lightGray, selfHAlignment = center, selfVAlignment = center };
   Bar footer { this, bgColor = red };
}

class Elemental2 : Col
{
   bgColor = skyBlue;

   Bar r1 { this };
      Col c1 { r1, maxSize.w = 0.25, bgColor = blue };
      Col c2 { r1, maxSize.w = 0.5, bgColor = red };
      Col c3 { r1, maxSize.w = 0.25, bgColor = blue };

   Bar r { this, bgColor = beige, maxSize.h = 10 };

   Bar r2 { this };
      Col d1 { r2, maxSize.w = 0.25, bgColor = blue };
      Col d11 { r2, maxSize.w = 0.5, caption = "Hello", bgColor = green };
      Col d2 { r2, maxSize.w = 0.5, bgColor = red };
      Col d3 { r2, maxSize.w = 0.25, bgColor = blue };
      Col d4 { r2, maxSize.w = 0.25, bgColor = green };

   Bar rr { this, bgColor = beige, maxSize.h = 10 };

   Bar r3 { this };
      Col { r3, minSize.w = 30, maxSize.w = 0,  bgColor = blue };
      Col { r3, maxSize.w = 1.0, caption = "Hello", bgColor = green };
      Col { r3, minSize.w = 30, maxSize.w = 0, bgColor = red };
}
*/

