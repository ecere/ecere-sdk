import IMPORT_STATIC "ecere"

int wrapText(Surface surface, const String text, int sx, int sy, int ex, int ey)
{
   const String start = text;
   const String drawUntil = null;
   int w = 0;
   int y = sy;
   int tw, th;
   int lh;

   surface.TextExtent("W", 1, &tw, &th);
   lh = th;
   surface.Clip({ sx, sy, ex, ey });

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
            surface.TextExtent(drawUntil ? drawUntil : start, (int)(nextSpace - (drawUntil ? drawUntil : start)), &tw, &th);
            if(!th) th = lh;
            if(w + tw < ex - sx || !drawUntil)
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
         if(drawUntil)
         {
            surface.WriteText(sx, y, start, (int)(drawUntil - start));
            w = 0;
            y += th;
            if(!*drawUntil)
               break;
            start = drawUntil + 1;
            drawUntil = null;
         }
         else
         {
            surface.WriteText(sx, y, start, strlen(start));
            y += th;
            break;
         }
      }
   }

   surface.Clip(null);
   return y;
}

int wrapTextExtent(DisplaySystem displaySystem, Font font, const String text, int ex, int ey, int * wtw, int * wth)
{
   const String start = text;
   const String drawUntil = null;
   int w = 0;
   int y = 0;
   int tw, th;
   int lh;

   displaySystem.FontExtent(font, "W", 1, &tw, &th);
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
            displaySystem.FontExtent(font, drawUntil ? drawUntil : start, (int)(nextSpace - (drawUntil ? drawUntil : start)), &tw, &th);
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
               displaySystem.FontExtent(font, start, (int)(drawUntil - start), &w, &th);
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
