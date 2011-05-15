import "HTMLView"
import "tables"

/*static */Block NextBlockUp(Surface surface, Block block, int * centered, RenderFlags flags)
{
   for(;block;)
   {
      // Do we have younger siblings?
      if(block.next)
      {
         if(block.type == FONT || block.type == ANCHOR)
         {
            surface.TextFont(block.prevFont.font.font);
            if(flags.render)
               surface.SetForeground(block.prevFont.textColor);
         }
         block = block.next;
         break;
      }

      block = block.parent;

      // Getting out of a block
      if(block)
      {
         if(block.type == FONT || block.type == ANCHOR)
         {
            surface.TextFont(block.prevFont.font.font);
            if(flags.render)
               surface.SetForeground(block.prevFont.textColor);
         }
         else if(block.type == CENTER)
         {
            if(centered)
               (*centered)--;
         }
      }
   }
   return block;
}

/*static */Block NextBlock(Surface surface, Block block, int * centered, uint flags)
{
   // Do we have children?
   if(block.subBlocks.first)
      block = block.subBlocks.first;
   else
   {
      block = NextBlockUp(surface, block, centered, flags);
   }
   return block;
}

int ComputeLine(Surface surface, Block startBlock, int startTextPos, Block * nextBlock, int * nextTextPos, int * centered, int * w, 
   int maxW, int maxH, uint flags, int y, OldList leftObjects, OldList rightObjects, bool * changeLine, bool computeStartY, int sy, int sx)
{
   int h = 0;
   int x = 0;
   bool lineComplete = false;
   AlignedObject object;

   Block block = startBlock;
   int textPos = startTextPos;
   int width = 0, height = 0;

   int centeredBefore = *centered;

   if(changeLine)
      *changeLine = true;

   *nextBlock = block;
   *nextTextPos = textPos;

   for(;!lineComplete && block;)
   {
      if(computeStartY && startTextPos == 0)
      {
         block.startX = x + sx;
         block.startY = y + sy;
      }
      switch(block.type)
      {
         case INPUT:
         {
            if(block.window)
            {
               width += block.window.size.w;
               height = Max(height, block.window.size.h);
            }
            break;
         }
         case IMAGE:
         {
            int bw = block.pWidth ? (maxW * block.pWidth / 100) : block.w;
            int bh = block.pHeight ? (maxH * block.pHeight / 100) : block.h;

            if(block.halign == left || block.halign == right)
            {
               height = Max(height, bh);
               h = Max(h, height);
               if(changeLine)
                  *changeLine = false;
               if(leftObjects && rightObjects)
               {
                  object = AlignedObject { w = bw, untilY = y + bh };
                  if(block.halign == left)
                     leftObjects.Add(object);
                  else
                     rightObjects.Add(object);
               }
               lineComplete = true;
               *nextBlock = NextBlockUp(surface, block, centered, flags);
               *nextTextPos = 0;
            }
            else
            {
               *nextBlock = block;
               *nextTextPos = 0;
               h = Max(h, height);
               x += width;
               width = 0;
               if(x + width + bw > maxW && x > 0)
               {
                  lineComplete = true;
               }
               else
               {
                  width += bw;
                  height = Max(height, bh);
               }
            }
            break;
         }
         case TEXT:
         {
            char * text = block.text;
            int th;

            // TO FIX: THIS USED TO BE COMMENTED... PUT IT BACK FOR DOCUMENTOR
            surface.TextExtent(" ", 1, null, &th);
            height = Max(height, th);


            for(; textPos<block.textLen && !lineComplete;)
            {
               int w;
               int len;
               char * nextSpace = strchr(text + textPos, ' ');

               if(nextSpace)
                  len = (nextSpace - (text + textPos)) + 1;
               else
                  len = block.textLen - textPos;
               
               surface.TextExtent(text + textPos, len, &w, &th);

               if(x + width + w > maxW && x > 0)
               {
                  lineComplete = true;
                  break;
               }

               textPos += len;

               width += w;
               height = Max(height, th);

               if(nextSpace)
               {
                  *nextTextPos = textPos;
                  *nextBlock = block;
                  h = Max(h, height);
                  x += width;
                  width = 0;
               }
            }
            break;
         }
         case FONT:
         case ANCHOR:
            surface.TextFont(block.font.font);
            break;
         case BR:
         {
            int th;
            surface.TextExtent(" ", 1, null, &th);

            lineComplete = true;
            *nextBlock = NextBlock(surface, block, null, flags);
            *nextTextPos = 0;
            height = Max(height, th);
            h = Max(h, height);
            x += width;
            width = 0;
            break;
         }
         case CENTER:
            (*centered)++;
            break;
         case TABLE:
            if(width || x)
            {
               lineComplete = true;
               *nextBlock = block;
               *nextTextPos = 0;
               h = Max(h, height);
               x += width;
               width = 0;
            }
            else if(block.halign == left || block.halign == right)
            {
               ComputeTable(surface, block, textPos, &width, &height, maxW, maxH, flags, y + sy, x + sx);
               x += width;
            
               *nextBlock = NextBlockUp(surface, block, centered, flags);
               *nextTextPos = 0;
               h = Max(h, height);
               if(changeLine)
                  *changeLine = false;

               if(leftObjects && rightObjects)
               {
                  object = AlignedObject { w = block.w, untilY = y + block.h };
                  if(block.halign == left)
                     leftObjects.Add(object);
                  else
                     rightObjects.Add(object);
               }
               lineComplete = true;
            }
            else
            {
               ComputeTable(surface, block, textPos, &width, &height, maxW, maxH, flags, y + sy, x + sx);
               lineComplete = true;
               *nextBlock = NextBlockUp(surface, block, centered, flags);
               *nextTextPos = 0;
               h = Max(h, height);
               x += width;
               width = 0;
            }
            break;
      }

      if(lineComplete || !block)
         break;

      if(textPos >= block.textLen)
      {
         textPos = 0;
         block = NextBlock(surface, block, centered, flags);
         // Break line after </center>
         if(centeredBefore != *centered)
         {
            lineComplete = true;
            *nextBlock = block;
            *nextTextPos = 0;
            h = Max(h, height);
            x += width;
            width = 0;
         }
      }
   }
   if(!lineComplete)
   {
      *nextBlock = null;
      *nextTextPos = 0;
      h = Max(h, height);
      x += width;
      width = 0;
   }
   *w = x;
   if(x > 1000000)
   {
      printf("bug");
   }
   return h;
}

void RenderLine(HTMLView browser, Surface surface, int x, int y, int w, int h, Block startBlock, int startTextPos, Block endBlock, int endTextPos, int left, int right)
{
   int textPos = startTextPos;
   Block block = startBlock;
   bool lineComplete = false;

   for(;;)
   {
      if(block == endBlock && textPos >= endTextPos)
         break;

      switch(block.type)
      {
         case INPUT:
         {
            if(block.window)
            {
               x += block.window.size.w;
            }
            break;
         }
         case BODY:
            surface.SetForeground(block.textColor);
            break;
         case IMAGE:
         {
            int bw = block.pWidth ? (w * block.pWidth / 100) : block.w;
            int bh = block.pHeight ? (h * block.pHeight / 100) : block.h;

            int dx, dy;

            ColorAlpha fg = surface.GetForeground();
            surface.SetForeground(white);

            switch(block.halign)
            {
               case HorizontalAlignment::left:
                  block.valign = top;
                  dx = x;
                  break;
               case HorizontalAlignment::right:
                  block.valign = top;
                  dx = x + w - bw;
                  dx = Max(x, dx);
                  break;
               case middle:
                  dx = x;
                  break;
            }

            switch(block.valign)
            {
               case bottom: dy = y + h - bh; break;
               case top: dy = y; break;
               case middle: dy = y + (h - bh) / 2; break;
            }

            if(block.bitmap)
            {
               if(bw == block.bitmap.width && bh == block.bitmap.height)
                  surface.Blit(block.bitmap, dx,dy,0,0,bw,bh);
               else
                  surface.Stretch(block.bitmap, dx,dy,0,0,bw,bh,block.bitmap.width, block.bitmap.height);
            }
            else if(block.imageEntry && block.imageEntry.missing)
            {
               surface.Bevel(false, dx, dy, bw, bh);
               if(browser.missing.bitmap)
                  surface.Blit(browser.missing.bitmap, dx + 5, dy + 5, 0,0, 
                     browser.missing.bitmap.width, browser.missing.bitmap.height);
            }
            surface.SetForeground(fg);
            x += bw;
            break;
         }
         case TEXT:
         {
            if(block.text)
            {
               int len, tw, th;
               if(block == endBlock)
                  len = endTextPos - textPos;
               else
                  len = block.textLen - textPos;
               surface.TextExtent(block.text + textPos, len, &tw, &th);
               surface.WriteText(x, y + h - th, block.text + textPos, len);
               textPos += len;
               x += tw;
            }
            break;
         }
         case FONT:
         case ANCHOR:
            surface.TextFont(block.font.font);
            surface.SetForeground(block.textColor);
            break;
        case TABLE:
            RenderTable(browser, surface, x, y, w, h, left, right, block);
            lineComplete = true;
            block = NextBlockUp(surface, block, null, RenderFlags { render = true });
            textPos = 0;
            break;
      }

      if(block == endBlock && textPos >= endTextPos)
         break;

      if(textPos >= block.textLen)
      {
         block = NextBlock(surface, block, null, RenderFlags { render = true });
         textPos = 0;
      }
   }
}

bool PickLine(HTMLView browser, Surface surface, int x, int y, int w, int h, Block startBlock, int startTextPos, 
              Block endBlock, int endTextPos, int left, int right, int pickX, int pickY, Block* pickBlock, int * pickTextPos)
{
   bool result = false;
   int textPos = startTextPos;
   Block block = startBlock;
   bool lineComplete = false;

   for(;!result;)
   {
      if(block == endBlock && textPos >= endTextPos)
         break;

      switch(block.type)
      {
         case INPUT:
         {
            if(block.window)
            {
               x += block.window.size.w;
            }
            break;
         }
         case IMAGE:
         {
            int bw = block.pWidth ? (w * block.pWidth / 100) : block.w;
            int bh = block.pHeight ? (h * block.pHeight / 100) : block.h;
            int dx, dy;

            switch(block.halign)
            {
               case HorizontalAlignment::left:
                  block.valign = top;
                  dx = x;
                  break;
               case HorizontalAlignment::right:
                  block.valign = top;
                  dx = x + w - bw;
                  dx = Max(x, dx);
                  break;
               case middle:
                  dx = x;
                  break;
            }

            switch(block.valign)
            {
               case bottom: dy = y + h - bh; break;
               case top: dy = y; break;
               case middle: dy = y + (h - bh) / 2; break;
            }

            if(block.bitmap || block.src)
            {
               if(pickX >= dx && pickY >= dy && pickX < dx + bw && pickY < dy + bh)
               {
                  *pickBlock = block;
                  *pickTextPos = 0;
                  result = true;
               }
            }
            x += bw;
            break;
         }
         case TEXT:
         {
            int len, tw, th;
            if(block == endBlock)
               len = endTextPos - textPos;
            else
               len = block.textLen - textPos;
            surface.TextExtent(block.text + textPos, len, &tw, &th);
            // eSurface_WriteText(surface, x, y + h - th, block.text + textPos, len);

            if(pickX >= x && pickY >= y+h-th && pickX < x + tw && pickY < y+h)
            {
               result = true;
               *pickBlock = block;
               // Have to properly compute this
               *pickTextPos = 0;
            }
            textPos += len;
            x += tw;
            break;
         }
         case FONT:
         case ANCHOR:
            surface.TextFont(block.font.font);
            break;
        case TABLE:
            result = PickTable(browser, surface, x, y, w, h, left, right, block, pickX, pickY, pickBlock, pickTextPos);
            lineComplete = true;
            block = NextBlockUp(surface, block, null, RenderFlags { render = true });
            textPos = 0;
            break;
      }

      if(block == endBlock && textPos >= endTextPos)
         break;

      if(textPos >= block.textLen)
      {
         block = NextBlock(surface, block, null, RenderFlags { render = true });
         textPos = 0;
      }
   }
   return result;
}

              
void PositionLine(HTMLView browser, Surface surface, int x, int y, int w, int h, Block startBlock, int startTextPos, 
                  Block endBlock, int endTextPos, int left, int right)
{
   int textPos = startTextPos;
   Block block = startBlock;
   bool lineComplete = false;

   for(;;)
   {
      if(block == endBlock && textPos >= endTextPos)
         break;

      switch(block.type)
      {
         case INPUT:
         {
            if(block.window)
            {
               Window parent = block.window.parent;
               block.window.Move(
                  x + parent.scroll.x, y + parent.scroll.y, 
                  block.window.size.w, block.window.size.h);
               //block.window.visible = false;
               x += block.window.size.w;
               if(block.inputType == text)
               {
                  printf("");
               }
            }
            break;
         }
         case IMAGE:
         {
            int bw = block.pWidth ? (w * block.pWidth / 100) : block.w;
            int bh = block.pHeight ? (h * block.pHeight / 100) : block.h;
            int dx, dy;

            switch(block.halign)
            {
               case HorizontalAlignment::left:
                  block.valign = top;
                  dx = x;
                  break;
               case HorizontalAlignment::right:
                  block.valign = top;
                  dx = x + w - bw;
                  dx = Max(x, dx);
                  break;
               case middle:
                  dx = x;
                  break;
            }

            switch(block.valign)
            {
               case bottom: dy = y + h - bh; break;
               case top: dy = y; break;
               case middle: dy = y + (h - bh) / 2; break;
            }

            x += bw;
            break;
         }
         case TEXT:
         {
            int len, tw, th;
            if(block == endBlock)
               len = endTextPos - textPos;
            else
               len = block.textLen - textPos;
            surface.TextExtent(block.text + textPos, len, &tw, &th);
            // eSurface_WriteText(surface, x, y + h - th, block.text + textPos, len);

            textPos += len;
            x += tw;
            break;
         }
         case FONT:
         case ANCHOR:
            surface.TextFont(block.font.font);
            break;
        case TABLE:
            PositionTable(browser, surface, x, y, w, h, left, right, block);
            lineComplete = true;
            block = NextBlockUp(surface, block, null, RenderFlags { render = true });
            textPos = 0;
            break;
      }

      if(block == endBlock && textPos >= endTextPos)
         break;

      if(textPos >= block.textLen)
      {
         block = NextBlock(surface, block, null, RenderFlags { render = true });
         textPos = 0;
      }
   }
}
