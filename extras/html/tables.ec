import "HTMLView"

class Column : struct
{
   Column prev, next;
   int w;         // Actual width for current rendering
   int minW, lineW;
   int rowSpan;
   int width;
   int desire;
};

void ComputeTable(Surface surface, Block table, int textPos, int * width, int * height, int maxW, int maxH, RenderFlags flags, int sy, int sx)
{
   if(flags.minW || flags.lineW || flags.width)
   {
      Block row;
      Column column;

      int w = 0, h = 0;
      int startX = sx;

      // Pass 1: Figure out column widths

      for(column = table.columns.first; column; column = column.next)
      {
         column.w = 0;

         if(flags.minW)
         {
            column.minW = 0;
            column.width = 0;
         }
         if(flags.lineW)
         {
            column.lineW = 0;
         }
         // Temporary variable:
         column.rowSpan = 0;
      }

      for(row = table.subBlocks.first; row && row.type != TABLE; )
      {
         if(row.type == TR)
         {
            Block cell;
            column = table.columns.first;
            for(cell = row.subBlocks.first; cell; cell = cell.next)
            {
               if(cell.type == TD)
               {
                  int c;
                  bool centered = false;
                  int minW = 0, lineW = 0;
                  Block block;
                  int textPos = 0;
                  // Disconnect the cell
                  Block parent = cell.parent;
                  Block next = cell.next;
                  cell.parent = null;
                  cell.next = null;

                  while(column && column.rowSpan)
                     column = column.next;

                  if(!column)
                  {
                     column = Column { rowSpan = cell.rowSpan };
                     // if(cell.rowSpan) Do proper thing if 0 rowSpan

                     table.columns.Add(column);
                  }

                  // Process whole cell
                  block = cell.subBlocks.first;
                  for(;block;)
                  {
                     int w;
                     Block nextCellBlock;
                     int nextCellPos;

                     // Minimum width for this column
                     if(flags.minW)
                     {
                        if(cell.noWrap)
                        {
                           ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &w, MAXINT, 0, RenderFlags { lineW = true }, 0, null, null, null, true, sy, sx);
                           /*if(cell.pWidth)
                              w = Max(maxW * cell.pWidth / 100, w);*/
                        }
                        else
                           ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &w, 0, 0, flags, 0, null, null, null, true, sy, sx);

                        // Width specified absolute is minimum width
                        /*
                        if(cell.width)
                           w = Max(cell.width, w);
                        */

                        minW = Max(minW, w);
                     }
                     if(flags.lineW)
                     {
                        // Width specified absolute will not extend
                        if(maxW < cell.minW || cell.width)
                        {
                           //lineW = cell.minW;
                           lineW = Max(cell.minW, cell.width);
                           break;
                        }
                        else
                        {
                           ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &w, maxW, 0, RenderFlags { lineW = true }, 0, null, null, null, true, sy, sx);
                           if(cell.pWidth)
                              w = Max(maxW * cell.pWidth / 100, w);
                           lineW = Max(lineW, w);
                        }
                     }

                     textPos = nextCellPos;
                     block = nextCellBlock;
                  }

                  cell.parent = parent;
                  cell.next = next;

                  minW += table.cellPadding * 2;
                  lineW += table.cellPadding * 2;

                  if(flags.minW)
                     cell.minW = minW;
                  if(flags.lineW)
                     cell.lineW = lineW;

                  // First only process non spanning cells
                  if(cell.span == 1)
                  {
                     if(flags.minW)
                     {
                        column.width = Max(column.width, cell.width);
                        column.minW = Max(column.minW, cell.minW);
                     }
                     if(flags.lineW)
                     {
                        column.lineW = Max(column.lineW, cell.lineW);
                        column.minW = Max(column.minW, cell.minW);                        
                     }
                  }

                  for(c = 0; c<cell.span && column; c++)
                     column = column.next;
               }
            }

            for(column = table.columns.first; column; column = column.next)
               if(column.rowSpan)
                  column.rowSpan--;

            row = NextBlockUp(surface, row, null, 0);
         }
         else
            row = NextBlock(surface, row, null, 0);
      }

      // Start with bare minimum
      table.w = 0;
      w = 0;
      for(column = table.columns.first; column; column = column.next)
      {
         column.w = column.minW;
         w += column.w;
      }
      if(w > table.w)
         table.w = w;

      //if(flags.width)
      {
         if(flags.lineW /*&& flags.width*/)
         {
            // Expand using lineW
            if(!table.pWidth && !table.width)
            {
               int totalLineW = 0;

               for(column = table.columns.first; column; column = column.next)
                  column.rowSpan = 0;
               for(row = table.subBlocks.first; row && row.type != TABLE; )
               {
                  if(row.type == TR)
                  {
                     Block cell;
                     int rowLineW = 0;

                     column = table.columns.first;

                     for(cell = row.subBlocks.first; cell; cell = cell.next)
                     {
                        int c;
                        int sumColW = 0;

                        while(column && column.rowSpan)
                           column = column.next;

                        for(c = 0; c<cell.span && column; c++)
                        {
                           column.rowSpan = cell.rowSpan;
                           sumColW += column.w;
                           column = column.next;  
                        }
                        rowLineW += Max(sumColW, cell.lineW);
                     }
                     totalLineW = Max(totalLineW, rowLineW);
                     row = NextBlockUp(surface, row, null, 0);
                  }
                  else
                     row = NextBlock(surface, row, null, 0);

                  // MOVED THIS UP HERE
                  for(column = table.columns.first; column; column = column.next)
                     if(column.rowSpan) column.rowSpan--;
               }

               totalLineW = Min(maxW, totalLineW);
               table.w = Max(table.w, totalLineW);
               /*
               for(column = table.columns.first; column; column = column.next)
                  if(column.rowSpan) column.rowSpan--;
               */
            }
         }

         // Expand table more (only expand absolute if we're in that pass)
         if(table.pWidth && (flags.width))
         {
            table.w = Max(table.w, maxW * table.pWidth / 100);
         }
         else if(table.width)
         {
            table.w = Max(table.w, table.width);
         }

         // Repartition the rest of the space in the columns according to column.lineW
         if(w < table.w)
         {
            int needed = 0;
            
            // Step 1: Weights how to distribute
            for(column = table.columns.first; column; column = column.next)
            {
               column.rowSpan = 0;
               column.desire = 0;
            }
            for(row = table.subBlocks.first; row && row.type != TABLE; )
            {
               if(row.type == TR)
               {
                  Block cell;
                  Column columnStart = table.columns.first;

                  for(cell = row.subBlocks.first; cell; cell = cell.next)
                  {
                     int c;
                     int totalW = 0;

                     while(columnStart && columnStart.rowSpan)
                        columnStart = columnStart.next;
                  
                     for(c = 0, column = columnStart; c<cell.span && column; c++)
                     {
                        column.rowSpan = cell.rowSpan;
                        if(cell.span == 1)
                           totalW += column.w;
                        column = column.next;  
                     }
                     if(cell.span == 1 && totalW < cell.lineW)
                     {
                        for(c = 0, column = columnStart; c<cell.span && column; c++, column = column.next)
                        {
                           int desire = cell.lineW - totalW;
                           column.desire += desire / cell.span;
                        }
                        needed += cell.lineW - totalW;
                     }

                     columnStart = column;  
                  }
                  for(column = table.columns.first; column; column = column.next)
                     if(column.rowSpan) column.rowSpan--;
                  row = NextBlockUp(surface, row, null, 0);
               }
               else
                  row = NextBlock(surface, row, null, 0);
            }

            // Take care of spanning across columns (minw)
            for(column = table.columns.first; column; column = column.next)
               column.rowSpan = 0;

            for(row = table.subBlocks.first; row && row.type != TABLE; )
            {
               if(row.type == TR)
               {
                  Block cell;
                  Column columnStart = table.columns.first;

                  for(cell = row.subBlocks.first; cell; cell = cell.next)
                  {
                     int c;
                     int totalW = 0;
                     int sumDesires = 0;

                     while(columnStart && columnStart.rowSpan)
                        columnStart = columnStart.next;

                     for(c = 0, column = columnStart; c<cell.span && column; c++)
                     {
                        column.rowSpan = cell.rowSpan;
                        totalW += column.w;
                        sumDesires += column.desire;
                        column = column.next;  
                     }
                     if(cell.span > 1 && totalW < cell.minW)
                     {
                        for(c = 0, column = columnStart; c<cell.span && column; c++)
                        {
                           if(column.desire)
                           {
                              int given = (column.desire) * (cell.minW - totalW) / sumDesires;
                              column.minW += given;
                           }
                           column = column.next;
                        }

                        // Check if we've got enough now...
                        totalW = 0;
                        for(c = 0, column = columnStart; c<cell.span && column; c++)
                        {
                           totalW += column.minW;
                           column = column.next;  
                        }

                        if(totalW < cell.minW)
                        {
                           for(c = 0, column = columnStart; c<cell.span && column; c++)
                           {
                              column.minW = Max(column.minW, (cell.minW - totalW) / cell.span);
                              column = column.next;
                           }
                        }
                     }
                     columnStart = column;  
                  }
                  for(column = table.columns.first; column; column = column.next)
                     if(column.rowSpan) column.rowSpan--;
                  row = NextBlockUp(surface, row, null, 0);
               }
               else
                  row = NextBlock(surface, row, null, 0);
            }

            for(column = table.columns.first; column; column = column.next)
            {
               if(column.minW > column.w)
               {
                  w += column.minW - column.w;
                  column.w = column.minW;
               }
            }
            
            
            // Repeat Step 1: Weights how to distribute
            needed = 0;
            for(column = table.columns.first; column; column = column.next)
            {
               column.rowSpan = 0;
               column.desire = 0;
            }
            for(row = table.subBlocks.first; row && row.type != TABLE; )
            {
               if(row.type == TR)
               {
                  Block cell;
                  Column columnStart = table.columns.first;

                  for(cell = row.subBlocks.first; cell; cell = cell.next)
                  {
                     int c;
                     int totalW = 0;

                     while(columnStart && columnStart.rowSpan)
                        columnStart = columnStart.next;
                  
                     for(c = 0, column = columnStart; c<cell.span && column; c++)
                     {
                        column.rowSpan = cell.rowSpan;
                        if(/*cell.span == 1 && */cell.width)
                           totalW += column.w;
                        column = column.next;  
                     }
                     if(/*cell.span == 1 && */totalW < cell.lineW && cell.width)
                     {
                        for(c = 0, column = columnStart; c<cell.span && column; c++, column = column.next)
                        {
                           int desire = cell.lineW - totalW;
                           column.desire += desire / cell.span;
                        }
                        needed += cell.lineW - totalW;
                     }

                     columnStart = column;  
                  }
                  for(column = table.columns.first; column; column = column.next)
                     if(column.rowSpan) column.rowSpan--;
                     row = NextBlockUp(surface, row, null, 0);
               }
               else
                  row = NextBlock(surface, row, null, 0);
            }
                        
            // Step 2: Do the distribution
            if(needed)
            {
               for(column = table.columns.first; column; column = column.next)
               {
                  if(column.width)
                  {
                     int give = (column.desire) * (table.w - w) / needed;
                     give = Min(give, column.width - column.w);
                     if(give > 0)
                        column.w += give;
                  }
               }
            }
            w = 0;
            for(column = table.columns.first; column; column = column.next)
               w += column.w;
         }

         if(w<table.w)
         {
            // Repease Step 1: Weights how to distribute
            int needed = 0;
            for(column = table.columns.first; column; column = column.next)
            {
               column.rowSpan = 0;
               column.desire = 0;
            }
            for(row = table.subBlocks.first; row && row.type != TABLE; )
            {
               if(row.type == TR)
               {
                  Block cell;
                  Column columnStart = table.columns.first;

                  for(cell = row.subBlocks.first; cell; cell = cell.next)
                  {
                     int c;
                     int totalW = 0;

                     while(columnStart && columnStart.rowSpan)
                        columnStart = columnStart.next;
                  
                     for(c = 0, column = columnStart; c<cell.span && column; c++)
                     {
                        column.rowSpan = cell.rowSpan;
                        if(/*cell.span == 1 && */!cell.width)
                           totalW += column.w;
                        column = column.next;  
                     }
                     if(/*cell.span == 1 && */totalW < cell.lineW && !cell.width)
                     {
                        for(c = 0, column = columnStart; c<cell.span && column; c++, column = column.next)
                        {
                           int desire = cell.lineW - totalW;
                           column.desire += desire / cell.span;
                        }
                        needed += cell.lineW - totalW;
                     }

                     columnStart = column;  
                  }
                  for(column = table.columns.first; column; column = column.next)
                     if(column.rowSpan) column.rowSpan--;
                  row = NextBlockUp(surface, row, null, 0);
               }
               else
                  row = NextBlock(surface, row, null, 0);
            }
            
            // Step 2: Do the distribution
            if(needed)
            {
               for(column = table.columns.first; column; column = column.next)
               {
                  if(!column.width)
                  {
                     int give = (column.desire) * (table.w - w) / needed;
                     column.w += give;
                  }
               }
            }

            w = 0;
            for(column = table.columns.first; column; column = column.next)
               w += column.w;
         }
         
         // Repartition the rest of the space in the columns
         if(w < table.w)
         {
            int numNotFixed = 0;
            int totalLineW = 0;
            for(column = table.columns.first; column; column = column.next)
            {
               if(!column.width)
               {
                  numNotFixed++;
                  totalLineW += column.lineW;
               }
            }
            if(numNotFixed)
            {
               for(column = table.columns.first; column; column = column.next)
               {
                  if(!column.width)
                  {
                     int give;
                     if(totalLineW)
                        give = (table.w - w) * column.lineW / totalLineW;
                     else
                        give = (table.w - w) / numNotFixed;
                     column.w += give;
                  }
               }
            }
            else
            {
               for(column = table.columns.first; column; column = column.next)
                  totalLineW += column.lineW;
               for(column = table.columns.first; column; column = column.next)
               {
                  int give;
                  if(totalLineW)
                     give = (table.w - w) * column.lineW / totalLineW;
                  else
                     give = (table.w - w) / table.columns.count;
                  column.w += give;
               }
            }
            w = 0;
            for(column = table.columns.first; column; column = column.next)
               w += column.w;
         }


         {
            /*switch(table.halign)
            {
               case middle:
                  startX = Max(left, (left + right - table.w)/2);
                  break;
               case HorizontalAlignment::right:
                  startX = Max(left, right - table.w);
                  break;
            }*/
         }

         // Pass 2: Figure out heights
         h = 0;
         for(column = table.columns.first; column; column = column.next)
            column.rowSpan = 0;
         for(row = table.subBlocks.first; row && row.type != TABLE; )
         {
            if(row.type == TR)
            {
               Block cell;
               OldList leftObjects { };
               OldList rightObjects { };

               row.height = 0;

               column = table.columns.first;
               row.h = 0;

               sx = startX;
               for(cell = row.subBlocks.first; cell; cell = cell.next)
               {
                  if(cell.type == TD)
                  {
                     bool centered = false;
                     Block block;
                     int textPos = 0;
                     int c;
                     int cellMaxH = row.h;
                     int lineH = 0;
                     int y = 0;
                     AlignedObject object, nextObject;

                     // Disconnect the cell
                     Block parent = cell.parent;
                     Block next = cell.next;
                     cell.parent = null;
                     cell.next = null;

                     if(column)
                     {
                        if(column.rowSpan)
                           column = column.next;
                        // TOCHECK: Added column null check here..
                        if(column && cell.rowSpan)
                           column.rowSpan = cell.rowSpan;
                     }

                     cell.w = 0;
                     for(c = 0; (!cell.span || c<cell.span) && column; c++)
                     {
                        cell.w += column.w;
                        column = column.next;
                     }

                     cell.h = 0;

                     block = cell.subBlocks.first;
                     for(;block;)
                     {
                        int newLineH, lineW;
                        Block nextCellBlock;
                        int nextCellPos;
                        bool changeLine;
                        int cellW = cell.w;

                        for(object = leftObjects.last; object; object = nextObject)
                        {
                           nextObject = object.prev;
                           if(y < object.untilY || object.next)
                              cellW -= object.w;
                           else
                              leftObjects.Delete(object);
                        }
                        for(object = rightObjects.last; object; object = nextObject)
                        {
                           nextObject = object.prev;
                           if(y < object.untilY || object.next)
                              cellW -= object.w;
                           else
                              rightObjects.Delete(object);
                        }
                        cellW = Max(cellW, 0);
 
                        // TRIED ADDING THIS CODE HERE...
                        {
                           int x;
                           int left, right;
                           // Compute aligned objects
                           left = sx + table.cellPadding; // Add cell border/margins here?
                           right = sx + cellW - table.cellPadding; // Subtract cell border/margins here?

                           for(object = leftObjects.last; object; object = nextObject)
                           {
                              nextObject = object.prev;
                              if(y < object.untilY || object.next)
                                 left += object.w;
                              else
                                 leftObjects.Delete(object);
                           }
                           for(object = rightObjects.last; object; object = nextObject)
                           {
                              nextObject = object.prev;
                              if(y < object.untilY || object.next)
                                 right -= object.w;
                              else
                                 rightObjects.Delete(object);
                           }
                           right = Max(left, right);

                           if(cell.halign == middle /*|| thisLineCentered*/)
                           {
                              x = (left + right - lineW)/2;
                              x = Max(x, left);
                           }
                           else if(cell.halign == HorizontalAlignment::right)
                           {
                              x = right - lineW;
                              x = Max(x, left);
                           }
                           else
                              x = left;

                           newLineH = ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &lineW, right - left /*cellW*/, cellMaxH, flags, y, &leftObjects, &rightObjects, &changeLine, true, sy, x);
                        }
                        textPos = nextCellPos;
                        block = nextCellBlock;

                        lineH = Max(lineH, newLineH);
                        if(changeLine)
                        {
                           //cell.h += lineH;
                           //cellMaxH -= lineH;

                           cell.h += newLineH;
                           y += newLineH;
                           cellMaxH -= newLineH;
                           //lineH = 0;
                        }
                     }

                     for(object = leftObjects.last; object; object = nextObject)
                     {
                        nextObject = object.prev;
                        y = Max(y, object.untilY);
                        leftObjects.Delete(object);
                     }
                     for(object = rightObjects.last; object; object = nextObject)
                     {
                        nextObject = object.prev;
                        y = Max(y, object.untilY);
                        rightObjects.Delete(object);
                     }
                     sx += cell.w;
                     cell.h = y;

                     //cell.h += lineH;
                     //cellMaxH -= lineH;

                     cell.parent = parent;
                     cell.next = next;

                     row.height = Max(row.height, cell.height);

                     cell.h = Max(cell.h, cell.height);

                     row.h = Max(row.h, cell.h);
                  }
               }
               // row.h = Max(row.h, row.height);
               h += row.h;
               sy += row.h;

               for(column = table.columns.first; column; column = column.next)
               {
                  if(column.rowSpan)
                     column.rowSpan--;
               }
               row = NextBlockUp(surface, row, null, 0);
            }
            else
               row = NextBlock(surface, row, null, 0);
         }

         if(table.pHeight)
            table.h = maxH * table.pHeight / 100;
         else if(table.height)
            table.h = table.height;
         else
            table.h = 0;

         if(h > table.h)
         {
            table.h = h;
         }

         if(table.h > h)
         {
            int numNotFixed = 0;
            // Repartition the rest of the space in the rows
            for(row = table.subBlocks.first; row && row.type != TABLE; )
            {
               if(row.type == TR)
               {
                  if(!row.height)
                     numNotFixed++;
                  row = NextBlockUp(surface, row, null, 0);
               }
               else
                  row = NextBlock(surface, row, null, 0);
            }
            if(numNotFixed)
            {
               for(row = table.subBlocks.first; row && row.type != TABLE; )
               {
                  if(row.type == TR)
                  {
                     row.h += (table.h - h) / numNotFixed;
                     row = NextBlockUp(surface, row, null, 0);
                  }
                  else
                     row = NextBlock(surface, row, null, 0);
               }
            }
         }
      }
   }

   *height = table.h;
   *width = table.w;
}

static void RenderCell(HTMLView browser, Surface surface, Block cell, int cellX, int y)
{
   bool centered = false;
   Block block = cell;
   int textPos = 0;
   Block row = cell.parent;
   int x;
   int maxH = row.h;
   int cellW = cell.w;
   int lineH = 0;
   AlignedObject object, nextObject;
   OldList leftObjects { };
   OldList rightObjects { };
   Block table;

   // Disconnect the cell
   Block parent = cell.parent;
   Block next = cell.next;
   table = cell;
   while(table && table.type != TABLE) table = table.parent;

   cell.parent = null;
   cell.next = null;
   
   /*
   if(cell.width)
      cellW = cell.width;
   */

   if(cell.bitmap)
   {
      ColorAlpha fg = surface.GetForeground();
      surface.SetForeground(white);

      // surface.Stretch(cell.bitmap, x,y,0,0,cell.w,cell.h,cell.bitmap.width, cell.bitmap.height);
      surface.Tile(cell.bitmap, cellX,y,cellW,row.h);

      surface.SetForeground(fg);
   }
   else if(cell.bgColor)
   {
      surface.SetBackground(cell.bgColor);
      surface.Area(cellX, y, cellX+cellW-1, y+row.h-1);
   }

   //surface.SetForeground(Color { 85,85,255 });
   //surface.Rectangle(cellX, y, cellX+cellW-1, y+row.h-1);

   if(cell.valign == middle)
   {
      y += (row.h - cell.h) / 2;
   }
   else if(cell.valign == bottom)
   {
      y += row.h - cell.h;
   }

   // Render whole cell
   while(block && table)
   {
      int lineW, newLineH;
      Block nextCellBlock;
      int nextCellPos;
      int thisLineCentered = centered;
      int left, right;
      int maxW;
      bool changeLine;

      void * font = surface.GetFont();

      // Compute aligned objects
      left = cellX + table.cellPadding; // Add cell border/margins here?
      right = cellX + cellW - table.cellPadding; // Subtract cell border/margins here?

      for(object = leftObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            left += object.w;
         else
            leftObjects.Delete(object);
      }
      for(object = rightObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            right -= object.w;
         else
            rightObjects.Delete(object);
      }
      right = Max(left, right);
      maxW = right - left;

      newLineH = ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &lineW, maxW, maxH, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);

      surface.TextFont(font);

      if(cell.halign == middle || thisLineCentered)
      {
         x = (left + right - lineW)/2;
         x = Max(x, left);
      }
      else if(cell.halign == HorizontalAlignment::right)
      {
         x = right - lineW;
         x = Max(x, left);
      }
      else
         x = left;

      lineH = Max(lineH, newLineH);

      RenderLine(browser, surface, x, y, cellW, newLineH, block, textPos, nextCellBlock, nextCellPos, left, right);

      if(changeLine)
      {
         //y += lineH;
         //maxH -= lineH;
         y += newLineH;
         maxH -= newLineH;
         //lineH = 0;
      }
      textPos = nextCellPos;
      block = nextCellBlock;
   }
   //y += lineH;
   //maxH -= lineH;
   for(object = leftObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      leftObjects.Delete(object);
   }
   for(object = rightObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      rightObjects.Delete(object);
   }

   cell.parent = parent;
   cell.next = next;
}


static void RenderRow(HTMLView browser, Surface surface, Block row, Block table, int x, int y)
{
   Block cell;
   int c = 0;
   Column column = table.columns.first;
   for(cell = row.subBlocks.first; cell; cell = cell.next)
   {
      if(cell.type == TD)
      {
         int c;

         while(column && column.rowSpan)
            column = column.next;

         RenderCell(browser, surface, cell, x, y);

         for(c = 0; c<cell.span && column; c++)
         {
            column.rowSpan = cell.rowSpan;
            x += column.w;
            column = column.next;  
         }
      }
      c++;
   }
}

void RenderTable(HTMLView browser, Surface surface, int x, int y, int w, int h, int left, int right, Block table)
{
   Block row;
   Column column;

   switch(table.halign)
   {
      case middle:
         x = Max(left, (left + right - table.w)/2);
         break;
      case HorizontalAlignment::right:
         x = Max(left, right - table.w);
         break;
   }

   if(table.bitmap)
   {
      ColorAlpha fg = surface.GetForeground();
      surface.SetForeground(white);

      // surface.Stretch(table.bitmap, x,y,0,0,table.w,table.h,table.bitmap.width, table.bitmap.height);
      surface.Tile(table.bitmap, x,y,table.w,table.h);

      surface.SetForeground(fg);
   }
   else if(table.bgColor)
   {
      surface.SetBackground(table.bgColor);
      surface.Area(x,y,x+table.w-1,y+table.h-1);
   }

   for(column = table.columns.first; column; column = column.next)
      column.rowSpan = 0;

   for(row = table.subBlocks.first; row && row.type != TABLE; )
   {
      if(row.type == TR)
      {
         RenderRow(browser, surface, row, table, x, y);
         y += row.h;
         for(column = table.columns.first; column; column = column.next)
         {
            if(column.rowSpan)
               column.rowSpan--;
         }
         row = NextBlockUp(surface, row, null, 0);
      }
      else
         row = NextBlock(surface, row, null, 0);   
   }
}


static bool PickCell(HTMLView browser, Surface surface, Block cell, int cellX, int y,
                     int pickX, int pickY, Block* pickBlock, int * pickTextPos)
{
   bool result = false;
   bool centered = false;
   Block block = cell;
   int textPos = 0;
   Block row = cell.parent;
   int x;
   int maxH = row.h;
   int cellW = cell.w;
   int lineH = 0;
   AlignedObject object, nextObject;
   OldList leftObjects { };
   OldList rightObjects { };

   // Disconnect the cell
   Block parent = cell.parent;
   Block next = cell.next;
   Block table = cell;

   while(table && table.type != TABLE) table = table.parent;

   cell.parent = null;
   cell.next = null;

   if(cell.valign == middle)
   {
      y += (row.h - cell.h) / 2;
   }
   else if(cell.valign == bottom)
   {
      y += row.h - cell.h;
   }

   // Render whole cell
   for(;block && table && !result;)
   {
      int lineW, newLineH;
      Block nextCellBlock;
      int nextCellPos;
      int thisLineCentered = centered;
      int left, right;
      int maxW;
      bool changeLine;

      void * font = surface.GetFont();

      // Compute aligned objects
      left = cellX + table.cellPadding; // Add cell border/margins here?
      right = cellX + cellW - table.cellPadding; // Subtract cell border/margins here?

      for(object = leftObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            left += object.w;
         else
            leftObjects.Delete(object);
      }
      for(object = rightObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            right -= object.w;
         else
            rightObjects.Delete(object);
      }
      right = Max(left, right);
      maxW = right - left;

      newLineH = ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &lineW, maxW, maxH, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);

      surface.TextFont(font);

      if(cell.halign == middle || thisLineCentered)
      {
         x = (left + right - lineW)/2;
         x = Max(x, left);
      }
      else if(cell.halign == HorizontalAlignment::right)
      {
         x = right - lineW;
         x = Max(x, left);
      }
      else
         x = left;

      lineH = Max(lineH, newLineH);

      result = PickLine(browser, surface, x, y, cellW, newLineH, block, textPos, nextCellBlock, nextCellPos, left, right, pickX, pickY, pickBlock, pickTextPos);

      if(changeLine)
      {
         //y += lineH;
         //maxH -= lineH;
         y += newLineH;
         maxH -= newLineH;
         //lineH = 0;
      }
      textPos = nextCellPos;
      block = nextCellBlock;
   }
   //y += lineH;
   //maxH -= lineH;
   for(object = leftObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      leftObjects.Delete(object);
   }
   for(object = rightObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      rightObjects.Delete(object);
   }

   cell.parent = parent;
   cell.next = next;
   return result;
}


static bool PickRow(HTMLView browser, Surface surface, Block row, Block table, int x, int y,
                    int pickX, int pickY, Block* pickBlock, int * pickTextPos)
{
   bool result = false;
   Block cell;
   int c = 0;
   Column column = table.columns.first;
   for(cell = row.subBlocks.first; cell; cell = cell.next)
   {
      if(cell.type == TD)
      {
         int c;

         while(column && column.rowSpan)
            column = column.next;

         result = PickCell(browser, surface, cell, x, y, pickX, pickY, pickBlock, pickTextPos);
         if(result)
            break;

         for(c = 0; c<cell.span && column; c++)
         {
            column.rowSpan = cell.rowSpan;
            x += column.w;
            column = column.next;  
         }
      }
      c++;
   }
   return result;
}

bool PickTable(HTMLView browser, Surface surface, int x, int y, int w, int h, int left, int right, Block table,
               int pickX, int pickY, Block* pickBlock, int * pickTextPos)
{
   bool result = false;
   Block row;
   Column column;

   switch(table.halign)
   {
      case middle:
         x = Max(left, (left + right - table.w)/2);
         break;
      case HorizontalAlignment::right:
         x = Max(left, right - table.w);
         break;
   }

   for(column = table.columns.first; column; column = column.next)
      column.rowSpan = 0;

   for(row = table.subBlocks.first; row && row.type != TABLE; )
   {
      if(row.type == TR)
      {
         result = PickRow(browser, surface, row, table, x, y, pickX, pickY, pickBlock, pickTextPos);
         y += row.h;
         for(column = table.columns.first; column; column = column.next)
         {
            if(column.rowSpan)
               column.rowSpan--;
         }
         if(result)
            break;
         row = NextBlockUp(surface, row, null, 0);
      }
      else
         row = NextBlock(surface, row, null, 0);   
   }
   return result;
}

static void PositionCell(HTMLView browser, Surface surface, Block cell, int cellX, int y)
{
   bool centered = false;
   Block block = cell;
   int textPos = 0;
   Block row = cell.parent;
   int x;
   int maxH = row.h;
   int cellW = cell.w;
   int lineH = 0;
   AlignedObject object, nextObject;
   OldList leftObjects { };
   OldList rightObjects { };

   // Disconnect the cell
   Block parent = cell.parent;
   Block next = cell.next;
   Block table;

   table = cell;
   while(table && table.type != TABLE) table = table.parent;
   cell.parent = null;
   cell.next = null;

   if(cell.valign == middle)
   {
      y += (row.h - cell.h) / 2;
   }
   else if(cell.valign == bottom)
   {
      y += row.h - cell.h;
   }

   // Render whole cell
   for(;block && table;)
   {
      int lineW, newLineH;
      Block nextCellBlock;
      int nextCellPos;
      int thisLineCentered = centered;
      int left, right;
      int maxW;
      bool changeLine;

      void * font = surface.GetFont();

      // Compute aligned objects
      left = cellX + table.cellPadding; // Add cell border/margins here?
      right = cellX + cellW - table.cellPadding; // Subtract cell border/margins here?

      for(object = leftObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            left += object.w;
         else
            leftObjects.Delete(object);
      }
      for(object = rightObjects.last; object; object = nextObject)
      {
         nextObject = object.prev;
         if(y < object.untilY || object.next)
            right -= object.w;
         else
            rightObjects.Delete(object);
      }
      right = Max(left, right);
      maxW = right - left;

      newLineH = ComputeLine(surface, block, textPos, &nextCellBlock, &nextCellPos, &centered, &lineW, maxW, maxH, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);

      surface.TextFont(font);

      if(cell.halign == middle || thisLineCentered)
      {
         x = (left + right - lineW)/2;
         x = Max(x, left);
      }
      else if(cell.halign == HorizontalAlignment::right)
      {
         x = right - lineW;
         x = Max(x, left);
      }
      else
         x = left;

      lineH = Max(lineH, newLineH);

      PositionLine(browser, surface, x, y, cellW, newLineH, block, textPos, nextCellBlock, nextCellPos, left, right);

      if(changeLine)
      {
         //y += lineH;
         //maxH -= lineH;
         y += newLineH;
         maxH -= newLineH;
         //lineH = 0;
      }
      textPos = nextCellPos;
      block = nextCellBlock;
   }
   //y += lineH;
   //maxH -= lineH;
   for(object = leftObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      leftObjects.Delete(object);
   }
   for(object = rightObjects.last; object; object = nextObject)
   {
      nextObject = object.prev;
      y = Max(y, object.untilY);
      rightObjects.Delete(object);
   }

   cell.parent = parent;
   cell.next = next;
}


static void PositionRow(HTMLView browser, Surface surface, Block row, Block table, int x, int y)
{
   Block cell;
   int c = 0;
   Column column = table.columns.first;
   for(cell = row.subBlocks.first; cell; cell = cell.next)
   {
      if(cell.type == TD)
      {
         int c;

         while(column && column.rowSpan)
            column = column.next;

         PositionCell(browser, surface, cell, x, y);

         for(c = 0; c<cell.span && column; c++)
         {
            column.rowSpan = cell.rowSpan;
            x += column.w;
            column = column.next;  
         }
      }
      c++;
   }
}

void PositionTable(HTMLView browser, Surface surface, int x, int y, int w, int h, int left, int right, Block table)
{
   Block row;
   Column column;

   switch(table.halign)
   {
      case middle:
         x = Max(left, (left + right - table.w)/2);
         break;
      case HorizontalAlignment::right:
         x = Max(left, right - table.w);
         break;
   }

   for(column = table.columns.first; column; column = column.next)
      column.rowSpan = 0;

   for(row = table.subBlocks.first; row && row.type != TABLE; )
   {
      if(row.type == TR)
      {
         PositionRow(browser, surface, row, table, x, y);
         y += row.h;
         for(column = table.columns.first; column; column = column.next)
         {
            if(column.rowSpan)
               column.rowSpan--;
         }
         row = NextBlockUp(surface, row, null, 0);
      }
      else
         row = NextBlock(surface, row, null, 0);
   }
}

