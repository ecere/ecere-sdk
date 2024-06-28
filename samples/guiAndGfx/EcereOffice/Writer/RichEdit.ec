import "ecere"
import "HTMLView"
import "ewd"

#define UTF8_IS_FIRST(x)   (__extension__({ byte b = x; (!(b) || !((b) & 0x80) || (b) & 0x40); }))
#define UTF8_NUM_BYTES(x)  (__extension__({ byte b = x; (b & 0x80 && b & 0x40) ? ((b & 0x20) ? ((b & 0x10) ? 4 : 3) : 2) : 1; }))

class RichEdit : HTMLView
{
   hasVertScroll = true;
   hasHorzScroll = true;

   bool readOnly, edit, selecting;
   int caretX, caretY;

   edit = true;

   bool loadHTML(File f, const String path)
   {
      bool result = true;
      Block fontBlock;

#if 0 //defined(_DEBUG)
      {
         ConsoleFile con { };
         char fn[100];
         sprintf(fn, "File://%p", con);
         f.CopyTo(fn);
         delete con;
      }
#endif
      f.Seek(0, start);
      textBlock = null;

      OpenFile(f, path);

      fontBlock = (Block)html.body.subBlocks.first;
      if(fontBlock && fontBlock.type == TEXT)
         textBlock = fontBlock, fontBlock = null;
      if(!fontBlock)
         fontBlock = html.body;

      if(!textBlock)
         textBlock = fontBlock.subBlocks.first;
      if(!textBlock)
      {
         textBlock = { type = TEXT, parent = fontBlock, font = fontBlock.font, text = CopyString("") };
         fontBlock.subBlocks.Insert(null, textBlock);
         selBlock = textBlock;
      }
      selBlock = textBlock;
      curPosition = selPosition = 0;

      ComputeMinSizes();
      ComputeSizes();
      positionCaret(true);
      Update(null);

      return result;
   }

   bool loadDocument(File f, const String path)
   {
      bool result = false;
      TempFile out { };

      ewd2html(f, out, false);

      result = loadHTML(out, path);

      delete out;

      return result;
   }

   bool saveDocument(File f)
   {
      return writeEWD(html, f);
   }

   bool OnCreate()
   {
      TempFile f { };
      Block fontBlock, newBlock;
      f.PrintLn(
         "<html><body><font size='3'></font></body></html>"
      );
      f.Seek(0, start);
      OpenFile(f, null);
      delete f;

      fontBlock = html.body.subBlocks.first;

      newBlock = { type = TEXT, parent = fontBlock, font = fontBlock.font, text = CopyString("") };
      fontBlock.subBlocks.Insert(null, newBlock);
      textBlock = newBlock;
      selBlock = textBlock;
      return HTMLView::OnCreate();
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool result = HTMLView::OnLeftButtonDown(x, y, mods);

      if(edit && textBlock)
      {
         Block b = null;
         int c = 0;
         if(PickHTML(x, y, &b, &c))
         {
            textBlock = b;

            curPosition = c;
            selBlock = textBlock;
            selPosition = curPosition;

            positionCaret(true);
            selecting = true;
            Update(null);
            Capture();
         }
      }
      return result;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(selecting)
      {
         ReleaseCapture();
         selecting = false;
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(edit && selecting)
      {
         Block b = null;
         int c = 0;
         if(PickHTML(x, y, &b, &c))
         {
            textBlock = b;
            curPosition = c;
         }

         positionCaret(true);
         Update(null);
      }
      return HTMLView::OnMouseMove(x, y, mods);
   }

   bool OnLeftDoubleClick(int mx, int my, Modifiers mods)
   {
      if(edit && textBlock)
      {
         int c;
         int start = -1;
         int numBytes;

         PickHTML(mx, my, &textBlock, &curPosition);
         selPosition = curPosition;
         selBlock = textBlock;

         // TODO: Word spanning multiple formatting...
         for(c = curPosition; c >= 0; c--)
         {
            unichar ch;
            while(c > 0 && !UTF8_IS_FIRST(textBlock.text[c])) c--;
            ch = UTF8GetChar(textBlock.text + c, &numBytes);
            if(!CharMatchCategories(ch, letters|numbers|marks|connector))
               break;
            start = c;
         }
         if(start != -1)
         {
            for(c = start; c < textBlock.textLen; c += numBytes)
            {
               unichar ch = UTF8GetChar(textBlock.text + c, &numBytes);
               if(!CharMatchCategories(ch, letters|numbers|marks|connector))
                  break;
            }
            selPosition = start;
            curPosition = c;

            positionCaret(true);
            Update(null);
            return false;
         }
      }
      return true;
   }

   bool OnOpen(char * href)
   {

      return true;
   }

   bool sameFont(Block a, Block b)
   {
      if(!a || !b) return false;

      while(a && a.type != FONT && a.parent)
         a = a.parent;
      while(b && b.type != FONT && b.parent)
         b = b.parent;

      return a.attribs == b.attribs &&
         a.font.size == b.font.size &&
         a.textColor == b.textColor &&
         !strcmpi(a.font.face, b.font.face);
   }

   void deleteSelection()
   {
      if(textBlock != selBlock || curPosition != selPosition)
      {
         if(textBlock == selBlock)
         {
            // Within same block
            int start = Min(curPosition, selPosition);
            int end = Max(curPosition, selPosition);
            memmove(textBlock.text + start, textBlock.text + end, textBlock.textLen - end);
            textBlock.textLen -= end-start;
            textBlock.text = renew textBlock.text char[textBlock.textLen + 1];
            curPosition = start;
            selPosition = start;
         }
         else
         {
            int startSel, endSel;
            Block startSelBlock = null, endSelBlock = null, b;
            bool keepTwoBlocks = false;

            NormalizeSelection(&startSelBlock, &startSel, &endSelBlock, &endSel);

            if(startSelBlock.type == TEXT && endSelBlock.type == TEXT && sameFont(startSelBlock, endSelBlock))
            {
               // Merge the text
               startSelBlock.text = renew startSelBlock.text char[startSel + endSelBlock.textLen - endSel + 1];
               memcpy(startSelBlock.text + startSel, endSelBlock.text + endSel, endSelBlock.textLen - endSel + 1);
               startSelBlock.textLen = startSel + endSelBlock.textLen - endSel;
            }
            else
            {
               // Keep Two Blocks
               keepTwoBlocks = true;
               startSelBlock.text = renew startSelBlock.text char[startSel + 1];
               startSelBlock.textLen = startSel;

               if(endSelBlock.text)
                  memmove(endSelBlock.text, endSelBlock.text + endSel, endSelBlock.textLen - endSel + 1);
               endSelBlock.text = renew endSelBlock.text char[endSelBlock.textLen - endSel + 1];
               endSelBlock.textLen = endSelBlock.textLen - endSel;
            }

            b = startSelBlock;
            do
            {
               b = GetNextBlock(b);
            } while(b && b.type != TEXT && b.type != BR);

            while(b)
            {
               bool isEnd = b == endSelBlock;
               Block parent, next = b;

               if(isEnd && keepTwoBlocks) break;

               do
               {
                  next = GetNextBlock(next);
               } while(next && (next.type != TEXT && next.type != BR));
               parent = b.parent;

               parent.subBlocks.Remove(b);
               delete b;

               while(parent && !parent.subBlocks.count)
               {
                  Block p = parent.parent;
                  p.subBlocks.Remove(parent);
                  delete parent;
                  parent = p;
               }

               if(isEnd)
                  break;
               b = next;
            }
            textBlock = startSelBlock;
            selBlock = startSelBlock;
            curPosition = startSel;
            selPosition = startSel;
         }
         ComputeMinSizes();
         ComputeSizes();
         positionCaret(true);
         Update(null);
      }
   }

   String getSelectionString()
   {
      String selection = null;
      if(textBlock == selBlock)
      {
         // Within same block
         int start = Min(curPosition, selPosition);
         int end = Max(curPosition, selPosition);
         int len = end - start;
         selection = new char[len + 1];
         memcpy(selection, textBlock.text + start, len);
         selection[len] = 0;
      }
      else
      {
         int startSel, endSel;
         Block startSelBlock = null, endSelBlock = null, b;
         int totalLen = 0;

         NormalizeSelection(&startSelBlock, &startSel, &endSelBlock, &endSel);

         // Compute length
         for(b = startSelBlock; b; b = GetNextBlock(b))
         {
            int start = (b == startSelBlock) ? startSel : 0;
            int end = (b == endSelBlock) ? endSel : b.textLen;
            int len = end - start;
            totalLen += len;
            if(b == endSelBlock)
               break;
            else if(b.type == BR)
               totalLen++;
         }

         selection = new char[totalLen + 1];
         totalLen = 0;
         for(b = startSelBlock; b; b = GetNextBlock(b))
         {
            int start = (b == startSelBlock) ? startSel : 0;
            int end = (b == endSelBlock) ? endSel : b.textLen;
            int len = end - start;
            memcpy(selection + totalLen, b.text + start, len);
            totalLen += len;
            if(b == endSelBlock)
               break;
            else if(b.type == BR)
               selection[totalLen++] = '\n';
         }
         selection[totalLen] = 0;
      }
      return selection;
   }

   void copySelection()
   {
      String s = getSelectionString();
      if(s)
      {
         int len = strlen(s);
         ClipBoard cb { };
         if(cb.Allocate(len + 1))
         {
            memcpy(cb.text, s, len + 1);
            cb.Save();
         }
         delete cb;
         delete s;
      }
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(edit)
      {
         switch(key)
         {
            case escape:
               OnLeftButtonDown(0,0,0);
               return false;
            case Key { end, shift = true }:
            case end:
               curPosition = textBlock.textLen;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               positionCaret(true);
               Update(null);
               break;
            case Key { home, shift = true }:
            case home:
               curPosition = 0;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               positionCaret(true);
               Update(null);
               break;
            case Key { home, ctrl = true, shift = true }:
            case ctrlHome:
               curPosition = 0;
               while(textBlock.prev) // && textBlock.prev.prev)   // FIXME: Write a getNextLineBlock() function...
                  textBlock = textBlock.prev; //.prev;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               positionCaret(true);
               Update(null);
               return false;
            case Key { end, ctrl = true, shift = true }:
            case ctrlEnd:
               while(textBlock.next)// && textBlock.next.next) // FIXME: Write a getNextLineBlock() function...
                  textBlock = textBlock.next; //.next;
               curPosition = textBlock.textLen;
               if(!key.shift)
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
               }
               positionCaret(true);
               Update(null);
               return false;
         }
      }
      else
         return HTMLView::OnKeyDown(key, ch);
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(edit)
      {
         switch(key)
         {
            case Key { up, shift = true }:
            case up:
            {
               if(caretY == textBlock.startY)
               {
                  Block block = textBlock;
                  bool passedBR = false;

                  while(true)
                  {
                     if(block.subBlocks.last)
                        block = block.subBlocks.last;
                     else if(block.prev)
                        block = block.prev;
                     else
                     {
                        block = block.parent;
                        while(block && !block.prev) block = block.parent;
                        if(block) block = block.prev;
                     }
                     if(block && block.type == BR)
                        passedBR = true;
                     if(!block || (passedBR && block.type == TEXT))
                        break;
                  }

                  if(passedBR)
                  {
                     textBlock = block;
                     curPosition = Min(curPosition, textBlock.textLen);
                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     Update(null);
                     positionCaret(false);
                     caretY = MAXINT;
                  }
                  else
                     return false;
               }

               {
                  int th = 0;
                  int textPos = 0;
                  int sx = textBlock.startX, sy = textBlock.startY;
                  char * text = textBlock.text;
                  int maxW;
                  Block block = textBlock;
                  while(block && block.type != TD) block = block.parent;
                  if(block)
                  {
                     Block table = block;
                     while(table && table.type != TABLE) table = table.parent;
                     if(table)
                        maxW = block.w - 2* table.cellPadding;
                     else
                        maxW = clientSize.w - 10 - sx;
                  }
                  else
                     maxW = clientSize.w - 10 - sx;
                  display.FontExtent(textBlock.font.font, " ", 1, null, &th);

                  do
                  {
                     int startPos = textPos;
                     int width = 0;
                     int x = 0;
                     bool lineComplete = false;
                     for(; textPos<textBlock.textLen && !lineComplete;)
                     {
                        int w;
                        int len;
                        char * nextSpace = strchr(text + textPos, ' ');

                        if(nextSpace)
                           len = (nextSpace - (text + textPos)) + 1;
                        else
                           len = textBlock.textLen - textPos;

                        display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

                        if(x + width + w > maxW && x > 0)
                        {
                           lineComplete = true;
                           break;
                        }
                        textPos += len;
                        width += w;
                        if(nextSpace)
                        {
                           x += width;
                           width = 0;
                        }
                        if(textPos == textBlock.textLen || (sy == caretY - th && caretX <= x + width + sx))
                        {
                           x += width;
                           curPosition = textPos;
                           while(curPosition > 0 && x + sx > caretX && textPos > startPos)
                           {
                              int len;
                              while(curPosition > 0 && !UTF8_IS_FIRST(text[--curPosition]));
                              len = curPosition - startPos;
                              display.FontExtent(textBlock.font.font, text + startPos, len, &x, null);
                           }
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);

                           positionCaret(false);
                           return false;
                        }
                     }
                     if(sy == caretY - th || textPos == textBlock.textLen)
                     {
                        if(textPos != textBlock.textLen)
                        {
                           int c = textPos - 1;
                           while(c > 0 && text[c] == ' ') c--;
                           curPosition = c + 1;
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);
                        }
                        else
                        {
                           curPosition = textBlock.textLen;
                           if(!key.shift)
                           {
                              selPosition = curPosition;
                              selBlock = textBlock;
                           }
                           Update(null);
                        }
                        positionCaret(false);
                        return false;
                     }
                     sy += th;
                     sx = textBlock.startX;
                  } while(textPos < textBlock.textLen);
                  return false;
               }
               return false;
            }
            case Key { down, shift = true }:
            case down:
            {
               int th = 0;
               int textPos = 0;
               int sx = textBlock.startX, sy = textBlock.startY;
               char * text = textBlock.text;
               int maxW;
               Block block = textBlock;
               while(block && block.type != TD) block = block.parent;
               if(block)
               {
                  Block table = block;
                  while(table && table.type != TABLE) table = table.parent;
                  if(table)
                     maxW = block.w - 2* table.cellPadding;
                  else
                     maxW = clientSize.w - 10 - sx;
               }
               else
                  maxW = clientSize.w - 10 - sx;
               display.FontExtent(textBlock.font.font, " ", 1, null, &th);

               while(!textPos || textPos < textBlock.textLen)
               {
                  int startPos = textPos;
                  int width = 0;
                  int x = 0;
                  bool lineComplete = false;
                  for(; (textPos < textBlock.textLen) && !lineComplete;)
                  {
                     int w;
                     int len;
                     char * nextSpace = strchr(text + textPos, ' ');

                     if(nextSpace)
                        len = (nextSpace - (text + textPos)) + 1;
                     else
                        len = textBlock.textLen - textPos;

                     display.FontExtent(textBlock.font.font, text + textPos, len, &w, &th);

                     if(x + width + w > maxW && x > 0)
                     {
                        lineComplete = true;
                        break;
                     }
                     textPos += len;
                     width += w;
                     if(nextSpace)
                     {
                        x += width;
                        width = 0;
                     }
                     if(sy > caretY && (textPos == textBlock.textLen || caretX <= x + width + sx))
                     {
                        curPosition = textPos;
                        x += width;
                        while(curPosition > 0 && x + sx > caretX && textPos > startPos)
                        {
                           int len;
                           while(curPosition > 0 && !UTF8_IS_FIRST(text[--curPosition]));
                           len = curPosition - startPos;
                           display.FontExtent(textBlock.font.font, text + startPos, len, &x, null);
                        }
                        if(!key.shift)
                        {
                           selPosition = curPosition;
                           selBlock = textBlock;
                        }
                        Update(null);
                        positionCaret(false);
                        return false;
                     }
                  }
                  if(sy > caretY)
                  {
                     curPosition = textBlock.textLen;
                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     Update(null);
                     positionCaret(false);
                     return false;
                  }
                  else if(textPos == textBlock.textLen && textBlock.next && textBlock.next.next)   // FIXME: Write a getNextLineBlock() function...
                  {
                     startPos = 0;
                     textPos = 0;
                     textBlock = textBlock.next.next;
                     sy = textBlock.startY;
                     sx = textBlock.startX;
                     text = textBlock.text;
                  }
                  else
                  {
                     sy += th;
                     sx = textBlock.startX;
                  }
               }

               /*if(textBlock.next && textBlock.next.next)
               {
                  textBlock = textBlock.next.next;
                  selPosition = curPosition = Min(curPosition, textBlock.textLen);
                  selBlock = textBlock;
                  positionCaret(false);
               }*/
               break;
            }
            case Key { right, shift = true, ctrl = true }:
            case ctrlRight:
            {
               bool foundAlpha = false;
               bool found = false;
               Block block = textBlock, lastBlock = null;
               int lastC = 0;
               bool passedBR = false;

               while(block)
               {
                  int start = (block == textBlock) ? curPosition : 0;
                  int c;
                  for(c = start; c < block.textLen; c++)
                  {
                     char ch = block.text[c];
                     bool isAlUnder = CharMatchCategories(ch, letters|numbers|marks|connector);
                     if(key.shift ? isAlUnder : !isAlUnder)
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastBlock = block;
                     }
                     else if(foundAlpha)
                     {
                        found = true;
                        if(!key.shift)
                        {
                           selPosition = curPosition = c;
                           selBlock = textBlock = block;
                           Update(null);
                           positionCaret(true);
                        }
                        break;
                     }
                  }
                  // No next word found,
                  if(!found && (/*c != curPosition || */passedBR)) //block != textBlock))
                  {
                     found = true;
                     lastBlock = block;
                     lastC = block.textLen-1;
                     if(key.shift)
                        break;
                     else
                     {
                        selPosition = curPosition = block.textLen;
                        selBlock = textBlock = block;
                        Update(null);
                        positionCaret(true);
                     }
                  }
                  if(found) break;

                  if(!key.shift && start < block.textLen)
                     foundAlpha = true;

                  while(true)
                  {
                     if(block.subBlocks.first)
                        block = block.subBlocks.first;
                     else if(block.next)
                        block = block.next;
                     else
                     {
                        block = block.parent;
                        while(block && !block.next) block = block.parent;
                        if(block) block = block.next;
                     }
                     if(block && block.type == BR)
                        passedBR = true;
                     if(!block || block.type == TEXT)
                        break;
                  }

                  if(!block && !found && lastBlock)
                  {
                     curPosition = lastC+1;
                     textBlock = lastBlock;
                     if(!key.shift && !found)
                     {
                        selBlock = textBlock;
                        selPosition = curPosition;
                     }
                     positionCaret(true);
                     Update(null);
                  }
                  else if(!block && !found && key.shift)
                  {
                     curPosition = textBlock.textLen;
                     positionCaret(true);
                     Update(null);
                  }

                  if(!key.shift && passedBR)
                     foundAlpha = true;
               }
               if(key.shift && found)
               {
                  curPosition = lastC+1;
                  textBlock = lastBlock;
                  positionCaret(true);
                  Update(null);
               }
               else if(!key.shift && !found)
               {
                  // Deselect
                  selBlock = textBlock;
                  selPosition = curPosition;
                  Update(null);
               }
               break;
            }
            case Key { left, ctrl = true, shift = true }:
            case ctrlLeft:
            {
               bool foundAlpha = false;
               bool found = false;
               Block block = textBlock, lastBlock = null;
               int lastC = 0;
               bool passedBR = false;

               while(block && !found)
               {
                  int start, c;
                  if(curPosition == 0 && block != textBlock && passedBR)
                  {
                     foundAlpha = true;
                     if(!lastBlock)
                     {
                        lastC = block.textLen;
                        lastBlock = block;
                     }
                     break;
                  }
                  start = (block == textBlock ? curPosition : block.textLen)-1;
                  for(c = start; c>=0; c--)
                  {
                     if(CharMatchCategories(block.text[c], letters|numbers|marks|connector))
                     {
                        foundAlpha = true;
                        lastC = c;
                        lastBlock = block;
                     }
                     else if(foundAlpha)
                     {
                        found = true;
                        break;
                     }
                  }
                  if(found) break;

                  // No next word found,
                  /*if(curPosition > 0)
                  {
                     foundAlpha = true;
                     lastC = 0;
                     lastBlock = block;
                     break;
                  }*/

                  while(true)
                  {
                     if(block.subBlocks.last)
                        block = block.subBlocks.last;
                     else if(block.prev)
                        block = block.prev;
                     else
                     {
                        block = block.parent;
                        while(block && !block.prev) block = block.parent;
                        if(block) block = block.prev;
                     }
                     if(block && block.type == BR)
                        passedBR = true;
                     if(!block || block.type == TEXT)
                        break;
                  }
               }
               if(foundAlpha)
               {
                  textBlock = lastBlock;
                  curPosition = lastC;
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  positionCaret(true);
                  Update(null);
               }
               if(!key.shift && !found)
               {
                  // Deselect
                  selBlock = textBlock;
                  selPosition = curPosition;
                  Update(null);
               }
               break;
            }
            case Key { right, shift = true }:
            case right:
               if(!key.shift && (textBlock != selBlock || curPosition != selPosition))
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
                  positionCaret(true);
                  Update(null);
               }
               else if(curPosition < textBlock.textLen)
               {
                  curPosition += UTF8_NUM_BYTES(textBlock.text[curPosition]);
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  positionCaret(true);
                  Update(null);
               }
               else
               {
                  Block block = textBlock;
                  bool passedBR = textBlock.type == BR;

                  while(true)
                  {
                     if(block.subBlocks.first)
                        block = block.subBlocks.first;
                     else if(block.next)
                        block = block.next;
                     else
                     {
                        block = block.parent;
                        while(block && !block.next) block = block.parent;
                        if(block) block = block.next;
                     }
                     if(block && block.type == BR)
                        passedBR = true;
                     if(!block || ((block.type == TEXT && block.textLen) || (block.type == BR && textBlock.startY != block.startY)))
                        break;
                  }
                  if(block)
                  {
                     textBlock = block;
                     curPosition = 0;
                     if(!passedBR && curPosition < textBlock.textLen)
                        curPosition += UTF8_NUM_BYTES(textBlock.text[curPosition]);

                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     positionCaret(true);
                     Update(null);
                  }
               }
               break;
            case Key { left, shift = true }:
            case left:
               if(!key.shift && (textBlock != selBlock || curPosition != selPosition))
               {
                  selPosition = curPosition;
                  selBlock = textBlock;
                  positionCaret(true);
                  Update(null);
               }
               else if(curPosition > 0)
               {
                  while(curPosition > 0 && !UTF8_IS_FIRST(textBlock.text[--curPosition]));
                  if(!key.shift)
                  {
                     selPosition = curPosition;
                     selBlock = textBlock;
                  }
                  positionCaret(true);
                  Update(null);
               }
               else
               {
                  Block block = textBlock;
                  bool passedBR = false; //block.type == BR;

                  while(true)
                  {
                     if(block.subBlocks.last)
                        block = block.subBlocks.last;
                     else if(block.prev)
                        block = block.prev;
                     else
                     {
                        block = block.parent;
                        while(block && !block.prev) block = block.parent;
                        if(block) block = block.prev;
                     }
                     if(block && block.type == BR)
                        passedBR = true;
                     if(!block || ((block.type == TEXT && block.textLen) || block.type == BR))
                        break;
                  }
                  if(block)
                  {
                     textBlock = block;
                     curPosition = textBlock.textLen;
                     if(!passedBR && curPosition > 0)
                        while(curPosition > 0 && !UTF8_IS_FIRST(textBlock.text[--curPosition]));
                     if(!key.shift)
                     {
                        selPosition = curPosition;
                        selBlock = textBlock;
                     }
                     positionCaret(true);
                     Update(null);
                  }
               }
               break;
            case backSpace:
            case Key { backSpace, shift = true }:
               if(readOnly) break;
               if(textBlock == selBlock && curPosition == selPosition)
               {
                  Block block = textBlock, brBlock = null;
                  bool change = false;

                  if(!curPosition)
                  {
                     while(true)
                     {
                        if(block.subBlocks.last)
                           block = block.subBlocks.last;
                        else if(block.prev)
                           block = block.prev;
                        else
                        {
                           block = block.parent;
                           while(block && !block.prev) block = block.parent;
                           if(block) block = block.prev;
                        }
                        if(block && block.type == BR)
                           brBlock = block;
                        if(!block || brBlock || (block.type == TEXT && block.textLen))
                           break;
                     }
                     if(!brBlock && block)
                     {
                        selBlock = textBlock = block;
                        selPosition = curPosition = block.textLen;
                     }
                  }

                  if(curPosition)
                  {
                     int c = curPosition;
                     int nb = 1;
                     while(c > 0 && !UTF8_IS_FIRST(textBlock.text[--c])) nb++;
                     memmove(textBlock.text + curPosition - nb, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                     textBlock.textLen -= nb;
                     textBlock.text = renew textBlock.text char[textBlock.textLen + 1];
                     curPosition -= nb;
                     selPosition = curPosition;
                     selBlock = textBlock;
                     change = true;
                  }
                  else if(brBlock)
                  {
                     Block prevBlock = block;
                     if(textBlock.type == TEXT && prevBlock && prevBlock.type == TEXT && sameFont(textBlock, prevBlock))
                     {
                        prevBlock.text = renew prevBlock.text char[prevBlock.textLen + textBlock.textLen + 1];
                        memcpy(prevBlock.text + prevBlock.textLen, textBlock.text, textBlock.textLen + 1);

                        curPosition = prevBlock.textLen;
                        prevBlock.textLen += textBlock.textLen;
                        textBlock.parent.subBlocks.Remove(textBlock);
                        delete textBlock;
                        selBlock = textBlock = prevBlock;
                        selPosition = curPosition;
                     }
                     brBlock.parent.subBlocks.Remove(brBlock);
                     delete brBlock;

                     change = true;
                  }
                  if(change)
                  {
                     ComputeMinSizes();
                     ComputeSizes();
                     positionCaret(true);
                     Update(null);
                  }
               }
               else
                  deleteSelection();
               break;
            case del:
               if(readOnly) break;
               if(textBlock != selBlock || curPosition != selPosition)
                  deleteSelection();
               else
               {
                  bool changed = false;
                  Block block = textBlock, brBlock = block.type == BR ? block : null;

                  if(brBlock || curPosition == textBlock.textLen)
                  {
                     while(true)
                     {
                        if(block.subBlocks.first)
                           block = block.subBlocks.first;
                        else if(block.next)
                           block = block.next;
                        else
                        {
                           block = block.parent;
                           while(block && !block.next) block = block.parent;
                           if(block) block = block.next;
                        }
                        if(block && block.type == BR)
                           brBlock = block;
                        if(!block || (block.type == TEXT && block.textLen))
                           break;
                     }

                     if(!brBlock && block)
                     {
                        textBlock = block;
                        curPosition = 0;
                     }
                  }

                  if(textBlock.textLen > curPosition)
                  {
                     int nb = UTF8_NUM_BYTES(textBlock.text[curPosition]);
                     memmove(textBlock.text + curPosition, textBlock.text + curPosition + nb, textBlock.textLen - curPosition + 1 - nb + 1);
                     textBlock.textLen -= nb;
                     textBlock.text = renew textBlock.text char[textBlock.textLen + 1];

                     changed = true;
                  }
                  else if(block && block != textBlock)
                  {
                     Block nextBlock = block;

                     if(textBlock.type == BR)
                        textBlock = nextBlock;
                     else if(sameFont(nextBlock, textBlock))
                     {
                        textBlock.text = renew textBlock.text char[textBlock.textLen + nextBlock.textLen + 1];
                        memcpy(textBlock.text + textBlock.textLen, nextBlock.text, nextBlock.textLen + 1);
                        textBlock.textLen += nextBlock.textLen;
                        if(nextBlock)
                        {
                           nextBlock.parent.subBlocks.Remove(nextBlock);
                           delete nextBlock;
                        }
                        changed = true;
                     }
                     if(brBlock)
                     {
                        brBlock.parent.subBlocks.Remove(brBlock);
                        delete brBlock;
                        changed = true;
                     }
                  }
                  selBlock = textBlock;
                  selPosition = curPosition;

                  if(changed)
                  {
                     ComputeMinSizes();
                     ComputeSizes();
                     positionCaret(true);
                     Update(null);
                  }
               }
               break;
            case enter:
            {
               int th = 0;
               Block block;
               Block newBlock;
               int startY, startX;

               if(readOnly) break;
               deleteSelection();

               block = { type = BR, parent = textBlock.parent, font = textBlock.font };
               newBlock = { type = TEXT, parent = textBlock.parent, font = textBlock.font };
               startY = textBlock.startY;
               startX = textBlock.startX;

               display.FontExtent(textBlock.font.font, " ", 1, null, &th);
               textBlock.parent.subBlocks.Insert(textBlock, block);
               textBlock.parent.subBlocks.Insert(block, newBlock);

               startY += th;

               newBlock.textLen = textBlock.textLen - curPosition;
               newBlock.text = new char[newBlock.textLen+1];
               if(textBlock.type == TEXT)
               {
                  memcpy(newBlock.text, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                  textBlock.textLen = curPosition;
                  textBlock.text[curPosition] = 0;
               }
               else
                  newBlock.text[0] = 0;

               newBlock.startY = startY;
               newBlock.startX = startX;
               selPosition = curPosition = 0;
               selBlock = textBlock = newBlock;

               ComputeMinSizes();
               ComputeSizes();
               positionCaret(true);
               Update(null);
               break;
            }
            case ctrlX:
            case Key { del, shift = true }:
               if(readOnly) break;
               // Cut
               copySelection();
               deleteSelection();
               break;
            case ctrlC:
            case ctrlInsert:
               // Copy
               copySelection();
               break;
               // Paste
            case shiftInsert:
            case ctrlV:
               if(!readOnly)
               {
                  ClipBoard clipBoard { };
                  if(clipBoard.Load())
                  {
                     int c;
                     char * text = clipBoard.memory;
                     char ch;
                     int start = 0;
                     Block parent;
                     FontEntry font;

                     deleteSelection();

                     parent = textBlock.parent;
                     font = textBlock.font;

                     for(c = 0; ; c++)
                     {
                        ch = text[c];
                        if(ch == '\n' || ch == '\r' || !ch)
                        {
                           int len = c - start;
                           textBlock.text = renew textBlock.text char[textBlock.textLen + 1 + len];
                           memmove(textBlock.text + curPosition + len, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                           memcpy(textBlock.text + curPosition, text + start, len);
                           textBlock.textLen += len;
                           curPosition += len;
                           selPosition = curPosition;
                           selBlock = textBlock;
                           if(!ch) break;
                           {
                              Block block { type = BR, parent = parent, font = font };
                              Block newBlock { type = TEXT, parent = parent, font = font };
                              int startY = textBlock.startY, startX = textBlock.startX;
                              int th = 0;

                              display.FontExtent(textBlock.font.font, " ", 1, null, &th);
                              textBlock.parent.subBlocks.Insert(textBlock, block);
                              textBlock.parent.subBlocks.Insert(block, newBlock);

                              startY += th;

                              newBlock.textLen = textBlock.textLen - curPosition;
                              newBlock.text = new char[newBlock.textLen+1];
                              memcpy(newBlock.text, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);
                              textBlock.textLen = curPosition;
                              textBlock.text[curPosition] = 0;

                              newBlock.startY = startY;
                              newBlock.startX = startX;
                              selPosition = curPosition = 0;
                              selBlock = textBlock;
                              textBlock = newBlock;
                           }
                           if(ch == '\r' && text[c+1] == '\n') c++;
                           start = c + 1;
                        }
                     }
                     ComputeMinSizes();
                     ComputeSizes();
                     positionCaret(true);
                     Update(null);
                  }
                  delete clipBoard;
               }
               break;
            case ctrlB: case ctrlI:
            case ctrl1: case ctrl2: case ctrl3: case ctrl4: case ctrl5:
            case ctrl6: case ctrl7: case ctrl8: case ctrl9: case ctrl0:
            case Key { code = equal, ctrl = true }:
            case Key { code = minus, ctrl = true }:
            {
               Block font = textBlock.parent;
               Block parent = font.parent;
               uint flag = key == ctrlB ? 1 : key == ctrlI ? 2 : 0;
               uint attribs = font.font.attribs ^ flag;
               Color color = key.code == k0 ? black :
                  key.code >= k1 && key.code <= k9 ? GetDefaultPalette()[key.code - k1 + 1] : font.textColor;
               float size = font.font.size;
               FontEntry entry;

               if(key == Key { code = equal, ctrl = true })
                  size *= 1.333333333333333333333333;
               else if(key == Key { code = minus, ctrl = true })
                  size /= 1.333333333333333333333333;

               for(entry = fontCache.first; entry; entry = entry.next)
               {
                  if(!strcmpi(entry.face, font.font.face) &&
                     entry.size == size &&
                     entry.attribs == attribs)
                     break;
               }
               if(!entry)
               {
                  display.Lock(false);
                  entry = FontEntry
                  {
                     font = displaySystem.LoadFont(font.font.face, size, attribs),
                     size =  size, attribs = attribs, face = CopyString(font.font.face)
                  };
                  fontCache.Add(entry);
                  display.Unlock();
               }

               if(textBlock.type == BR || textBlock.text[0] || textBlock.prev)
               {
                  Block fontBlock
                  {
                     parent = parent,
                     type = FONT,
                     font = entry, textColor = color, size = size, attribs = attribs, face = CopyString(font.font.face)
                  };
                  bool afterCurrent = (textBlock.type == BR || curPosition || !textBlock.textLen);

                  // TODO: Cut blocks in two
                  parent.subBlocks.Insert(afterCurrent ? font : font.prev, fontBlock);
                  if(textBlock.type == TEXT && textBlock.text[0])
                  {
                     Block newBlock { type = TEXT, parent = fontBlock, font = fontBlock.font, text = CopyString("") };

                     // Move anything after this block to the new font block...
                     if(afterCurrent)
                     {
                        Block block = textBlock.next;
                        while(block)
                        {
                           Block next = block.next;
                           font.subBlocks.Remove(block);
                           fontBlock.subBlocks.Add(block);
                           block.parent = fontBlock;
                           block.font = fontBlock.font;
                           block = next;
                        }
                     }

                     selBlock = textBlock = newBlock;
                     selPosition = curPosition = 0;
                     fontBlock.subBlocks.Insert(null, newBlock);
                  }
                  else if(afterCurrent)
                  {
                     Block block = textBlock;
                     while(block)
                     {
                        Block next = block.next;
                        font.subBlocks.Remove(block);
                        fontBlock.subBlocks.Add(block);
                        block.parent = fontBlock;
                        block.font = fontBlock.font;
                        block = next;
                     }
                  }
               }
               else
               {
                  delete font.face;
                  font.font = entry, font.textColor = color, font.size = size, font.attribs = attribs,
                  font.face = CopyString(font.font.face);
                  textBlock.font = font.font;
               }

               ComputeMinSizes();
               ComputeSizes();
               positionCaret(true);
               Update(null);

               break;
            }
            case ctrlA:
            {
               selBlock = html.body.subBlocks.first;
               while(selBlock && selBlock.type != TEXT) // && selBlock.type != BR)
                  selBlock = GetNextBlock(selBlock);
               selPosition = 0;
               textBlock = selBlock;
               while(true)
               {
                  Block next = GetNextBlock(textBlock);
                  while(next && next.type != TEXT) // && next.type != BR)
                     next = GetNextBlock(next);

                  if(next)
                     textBlock = next, curPosition = textBlock.textLen;
                  else
                     break;
               }
               ComputeMinSizes();
               ComputeSizes();
               positionCaret(true);
               Update(null);
               break;
            }
            default:
            {
               // eC BUG HERE: (Should be fixed)
               if(!readOnly && !key.ctrl && !key.alt && ch >= 32 && ch != 128 /*&& ch < 128*/)
               {
                  char string[5];
                  int len = UTF32toUTF8Len(&ch, 1, string, 5);
                  int c;

                  deleteSelection();

                  if(textBlock.type != TEXT)
                  {
                     Block parent = textBlock.parent;
                     Block newBlock { type = TEXT, parent = parent, font = parent.font, text = CopyString(""); };
                     parent.subBlocks.Insert(textBlock.prev, newBlock);
                     textBlock = newBlock;
                     curPosition = 0;
                  }

                  textBlock.text = renew textBlock.text char[textBlock.textLen + len + 1];
                  memmove(textBlock.text + curPosition + len, textBlock.text + curPosition, textBlock.textLen - curPosition + 1);

                  for(c = 0; c<len; c++)
                  {
                     textBlock.text[curPosition] = string[c];
                     textBlock.textLen++;
                     curPosition++;
                  }
                  selPosition = curPosition;
                  selBlock = textBlock;

                  ComputeMinSizes();
                  ComputeSizes();
                  positionCaret(true);
                  Update(null);
               }
            }
         }
      }
      return true;
   }

   void OnResize(int width, int height)
   {
      HTMLView::OnResize(width, height);
      positionCaret(true);
   }

   bool findCaretLine(Surface surface, int x, int y, int w, int h, Block startBlock, int startTextPos, Block endBlock,
      int endTextPos, int left, int right, Block textBlock, int pos, int * psx, int * psy)
   {
      bool result = false;
      int textPos = startTextPos;
      Block block = startBlock;
      int startSel, endSel;
      Block startSelBlock = null, endSelBlock = null;
      int prevGlyph = 0;
      if(this.textBlock != this.selBlock || this.curPosition != this.selPosition)
         this.NormalizeSelection(&startSelBlock, &startSel, &endSelBlock, &endSel);

      for(;;)
      {
         Color fore = surface.foreground, back = surface.background;
         if(block == endBlock && textPos >= endTextPos)
            break;

         switch(block.type)
         {
            case INPUT:
               if(block.window)
                  x += block.window.size.w;
               break;
            case BODY:
               break;
            case IMAGE:
            {
               int bw = block.pWidth ? (w * block.pWidth / 100) : block.w;
               //int bh = block.pHeight ? (h * block.pHeight / 100) : block.h;
               int dx; //, dy;

               //ColorAlpha fg = surface.GetForeground();
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
               /*
               switch(block.valign)
               {
                  case bottom: dy = y + h - bh; break;
                  case top: dy = y; break;
                  case middle: dy = y + (h - bh) / 2; break;
               }
               */
               x += bw;
               break;
            }
            case BR:
            {
               if(block == textBlock)
               {
                  int th;

                  surface.TextExtent(" ", 1, null, &th);
                  *psx = x;
                  *psy = h - th + y;
                  result = true;
               }
               break;
            }
            case TEXT:
            {
               int tw, th;
               int endPos = (block == endBlock) ? endTextPos : block.textLen;
               int len = endPos - textPos;

               if(startSelBlock && block == startSelBlock && startSel >= textPos && startSel <= textPos + len)
               {
                  int l = startSel - textPos;
                  if(block.text)
                  {
                     int pPrevGlyph = prevGlyph;
                     surface.TextExtent2(block.text + textPos, l, &tw, &th, prevGlyph, &prevGlyph, null);
                     if(block == textBlock && pos >= textPos && pos <= textPos + l)
                     {
                        int ttw;
                        surface.TextExtent2(block.text + textPos, pos - textPos, &ttw, null, pPrevGlyph, &pPrevGlyph, null);
                        if(!th)
                           surface.TextExtent(" ", 1, null, &th);

                        *psx = x + ttw;
                        *psy = h - th + y;
                        result = true;
                        break;
                     }
                     x += tw;
                  }
                  textPos += l;
                  this.isSelected = true;
                  len -= l;
               }

               if(endSelBlock && block == endSelBlock && endPos > textPos && endSel >= textPos && endSel < textPos + len)
                  len = endSel - textPos;

               if(block.text)
               {
                  int pPrevGlyph = prevGlyph;
                  if(this.isSelected)
                  {
                     surface.background = Color { 10, 36, 106 };
                     surface.foreground = white;
                     surface.textOpacity = true;
                  }
                  surface.TextExtent2(block.text + textPos, len, &tw, &th, prevGlyph, &prevGlyph, null);
                  if(block == textBlock && pos >= textPos && pos <= textPos + len)
                  {
                     int ttw;
                     surface.TextExtent2(block.text + textPos, pos - textPos, &ttw, null, pPrevGlyph, &pPrevGlyph, null);
                     if(!th)
                        surface.TextExtent(" ", 1, null, &th);
                     *psx = x + ttw;
                     *psy = h - th + y;
                     result = true;
                     break;
                  }

                  x += tw;
                  if(this.isSelected)
                  {
                     surface.background = back;
                     surface.foreground = fore;
                     surface.textOpacity = false;
                  }
               }
               textPos += len;
               if(block == endSelBlock && textPos >= endSel)
                  this.isSelected = false;

               if(endPos > textPos)
               {
                  int l = endPos - textPos;
                  if(block.text)
                  {
                     int pPrevGlyph = prevGlyph;
                     surface.TextExtent2(block.text + textPos, l, &tw, &th, prevGlyph, &prevGlyph, null);
                     if(block == textBlock && pos >= textPos && pos <= textPos + l)
                     {
                        int ttw;
                        surface.TextExtent2(block.text + textPos, pos - textPos, &ttw, null, pPrevGlyph, &pPrevGlyph, null);
                        if(!th)
                           surface.TextExtent(" ", 1, null, &th);
                        *psx = x + ttw;
                        *psy = h - th + y;
                        result = true;
                        break;
                     }

                     x += tw;
                  }
                  textPos += l;
               }
               break;
            }
            case FONT:
            case ANCHOR:
               surface.TextFont(block.font.font);
               break;
           case TABLE:
               // TODO: FindCaretTable(this, surface, x, y, w, h, left, right, block);
               block = NextBlockUp(surface, block, null, RenderFlags { render = true });
               textPos = 0;
               break;
         }
         if(result) break;

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

   void findCaretPos(Block textBlock, int pos, int * psx, int * psy)
   {
      int sx = 0, sy = 0;
      Block block = html.body;
      int y = TOP_MARGIN;
      int textPos = 0;
      int centered = 0;
      int maxH = clientSize.h - BOTTOM_MARGIN;
      OldList leftObjects { };
      OldList rightObjects { };
      Font font;
      Surface surface = display.GetSurface(0,0,null);
      AlignedObject object, nextObject;

      if(html.defaultFont && html.defaultFont.font)
         surface.TextFont(html.defaultFont.font.font);

      while(block)
      {
         Block nextBlock;
         int nextTextPos;
         int w, newH;
         int left, right;
         int x, maxW;
         int thisLineCentered = centered;
         bool changeLine;

         left = LEFT_MARGIN;
         right = clientSize.w - RIGHT_MARGIN;

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

         font = surface.font;
         newH = ComputeLine(surface, block, textPos, &nextBlock, &nextTextPos, &centered, &w, maxW, maxH - y, RenderFlags {}, y, &leftObjects, &rightObjects, &changeLine, false, 0, 0);
         surface.font = font;
         if(thisLineCentered)
            x = Max(left,(left + right - w) / 2);
         else
            x = left;

         surface.TextFont(font);

         if(findCaretLine(surface, x - scroll.x, y - scroll.y, maxW, newH, block, textPos,
            nextBlock, nextTextPos, left - scroll.x, right - scroll.x, textBlock, pos, &sx, &sy))
            break;

         if(changeLine)
            y += newH;
         block = nextBlock;
         textPos = nextTextPos;
      }
      delete surface;

      *psx = sx;
      *psy = sy;
   }

   // Temporary brute force clean up...
   void clearEmptyBlocks()
   {
      Block block = html.body;

      while(block)
      {
         Block next = GetNextBlock(block);

         if(block.type == FONT && !block.subBlocks.first)
         {
            block.parent.subBlocks.Remove(block);
            delete block;
         }
         else if(block.type == TEXT && block != textBlock && !block.textLen)
         {
            block.parent.subBlocks.Remove(block);
            delete block;
         }
         block = next;
      }
   }

   void positionCaret(bool setCaretX)
   {
      if(edit && textBlock)
      {
         int sx, sy;
         int th;

         clearEmptyBlocks();
         findCaretPos(textBlock, curPosition, &sx, &sy);

         display.FontExtent(textBlock.font.font, " ", 1, null, &th);

         if(setCaretX)
            caretX = sx;
         caretY = sy;
         SetCaret(sx-1, sy, th);
         {
            Point scrollPos = scroll;
            bool doScroll = false;
            if(sy - scroll.y + th > clientSize.h)
            {
               scrollPos.y = sy + th - clientSize.h;
               doScroll = true;
            }
            else if(sy - scroll.y < 0)
            {
               scrollPos.y = sy;
               doScroll = true;
            }
            if(sx - scroll.x + 10 > clientSize.w)
            {
               scrollPos.x = sx + 10 - clientSize.w;
               doScroll = true;
            }
            else if(sx - scroll.x < 10)
            {
               scrollPos.x = sx - 10;
               doScroll = true;
            }
            if(doScroll)
               scroll = scrollPos;
         }
      }
      else
         SetCaret(0,0,0);
   }
}
