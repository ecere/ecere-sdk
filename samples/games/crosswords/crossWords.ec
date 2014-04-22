#ifdef STATIC
import static "ecere"
#else
import "ecere"
#endif

import remote "CrossWordsServer"

define TileSize = 32;

enum SquareValue
{
   normal,
   doubleLetter, dl = doubleLetter,
   tripleLetter, tl = tripleLetter,
   doubleWord,   dw = doubleWord,
   tripleWord,   tw = tripleWord
};
enum Direction
{
   horizontal,
   vertical
};

define TrayHeight = 550;
define TrayLeft = 50;
define TrayWidth = 300;

define ThrowHeight = 620;

define BoardX = 20;
define BoardY = 20;

define MaxPlayers = 4;

SquareValue squareValues[15][15] =
{
   { tw, 0, 0,dl, 0, 0, 0,tw, 0, 0, 0,dl, 0, 0,tw },
   {  0,tw, 0, 0, 0,tl, 0, 0, 0,tl, 0, 0, 0,tw, 0 },
   {  0, 0,tw, 0, 0, 0,dl, 0,dl, 0, 0, 0,tw, 0, 0 },
   { dl, 0, 0,tw, 0, 0, 0,dl, 0, 0, 0,tw, 0, 0,dl },
   {  0, 0, 0, 0,tw, 0, 0, 0, 0, 0,tw, 0, 0, 0, 0 },
   {  0,tl, 0, 0, 0,tl, 0, 0, 0,tl, 0, 0, 0,tl, 0 },
   {  0, 0,dl, 0, 0, 0,dl, 0,dl, 0, 0, 0,dl, 0, 0 },
   { tw, 0, 0,dl, 0, 0, 0,tw, 0, 0, 0,dl, 0, 0,tw },
   {  0, 0,dl, 0, 0, 0,dl, 0,dl, 0, 0, 0,dl, 0, 0 },
   {  0,tl, 0, 0, 0,tl, 0, 0, 0,tl, 0, 0, 0,tl, 0 },
   {  0, 0, 0, 0,tw, 0, 0, 0, 0, 0,tw, 0, 0, 0, 0 },
   { dl, 0, 0,tw, 0, 0, 0,dl, 0, 0, 0,tw, 0, 0,dl },
   {  0, 0,tw, 0, 0, 0,dl, 0,dl, 0, 0, 0,tw, 0, 0 },
   {  0,tw, 0, 0, 0,tl, 0, 0, 0,tl, 0, 0, 0,tw, 0 },
   { tw, 0, 0,dl, 0, 0, 0,tw, 0, 0, 0,dl, 0, 0,tw }
};
Color valueColors[SquareValue] =
{
   0, skyBlue, slateBlue, pink, red
};

enum Letters
{
   a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z, blank, empty
};
enum Languages
{
   english, french
};

// FRANCAIS
int lettersCount[Languages][Letters] =
{
   {
      9, 2, 2, 4, 12, 2, 3, 2, 9, 1, 1, 4, 2, 6, 8, 2, 1, 6, 4, 6, 4, 2, 2, 1, 2, 1,   2, 0
   },
   {
      9, 2, 2, 3, 15, 2, 2, 2, 8, 1, 1, 5, 3, 6, 6, 2, 1, 6, 6, 6, 6, 2, 1, 1, 1, 1,   2, 0
   }
};

int lettersValue[Languages][Letters] =
{
   {
      1, 3, 3, 2, 1,  4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3,10, 1, 1, 1, 1, 4, 4, 8, 4, 10,  0, 0
   },
   {
      1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 10, 1, 2, 1, 1, 3, 8, 1, 1, 1, 1, 4, 10, 10, 10, 10,  0, 0
   }
};

CrossWords crossWords {};

class DefineBlank : Window
{
   text = "Please choose the value of your blank tile";
   size = { 250, 480 };
   borderStyle = fixed;
   ListBox list
   {
      this;
      position = { 20, 20 };
      size = { 80, 420 };

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         if(list.currentRow) button.disabled = false;
         return true;
      }

      bool NotifyDoubleClick(ListBox listBox, int x, int y, Modifiers mods)
      {
         if(!button.disabled)
            button.NotifyClicked(this, button, 0,0,0);
         return true;
      }
   };
   DataField field { class(Letters) };
   Button button
   {
      this;
      text = "Choose";
      size = { 80 };
      isDefault = true;
      position = { 130, 420 };
      disabled = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy((DialogResult)(Letters)list.currentRow.GetData(field));
         return true;
      }
   };

   DefineBlank()
   {
      Letters c;
      list.AddField(field);
      for(c = 0; c<Letters::blank; c++)
      {
         list.AddRow().SetData(field, c);
      }
   }
}

class CrossWords : Window
{
   Letters boardLetters[15][15];
   Letters lastBoard[15][15];
   Letters blankValues[15][15];
   bool gameStarted;
   int turn;
   int playerID;
   Languages language;

   Letters throwLetters[7];
   int numThrowLetters;

   bool dragging;
   int dragLetter;
   int dragY, dragX;
   int startX, startY;
   int moveX, moveY;
   bool out;
   int lastX;
   int dragPos;

   ServerConnection server;

   Letters letters[7];
   int numLetters;
   int positions[7];
   char playerNames[MaxPlayers][256];
   int playerScores[MaxPlayers];

   int totalScore;


   text = "Ecere Crosswords Game";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 700, 700 };
   background = green;

   FontResource letterFont { "Arial", 17, true, window = this };
   FontResource valueFont { "Arial", 8, true, window = this  };
   FontResource scoreFont { "Arial", 6, true, window = this  };
   FontResource wingdings { "Wingdings", 30, true, window = this };

   bool OnClose(bool parentClosing)
   {
      return !gameStarted || MessageBox { master = this, type = yesNo, text = "Ecere Crosswords", contents = "Are you sure you want to quit?" }.Modal() == yes;
   }

   bool OnCreate()
   {
      int x,y;
      for(y = 0; y<15; y++)
         for(x = 0; x<15; x++)
            lastBoard[y][x] = blankValues[y][x] = boardLetters[y][x] = empty;
      return true;
   }

   void DrawLetter(Surface surface, Letters a, int x, int y, bool blank)
   {
      if(!blank)
      {
         surface.SetBackground(sandyBrown);
         surface.Area(x+2, y+2, x + TileSize-1, y + TileSize-1);
      }
      if(a != Letters::blank)
      {
         char ch = (char)a + 'A';
         surface.SetForeground(blank ? gray : black);
         surface.TextFont(letterFont.font);
         surface.WriteText(x + 5, y, &ch, 1);

         if(!blank)
         {
            surface.TextFont(valueFont.font);
            surface.WriteTextDotsf(right, x, y + TileSize - 14, TileSize+1, "%d", lettersValue[language][a]);
         }
      }
   }

   void DrawSquare(Surface surface, int cx, int cy)
   {
      SquareValue value = squareValues[cy][cx];
      Color color = valueColors[value];
      int num = (value == doubleLetter || value == doubleWord) ? 2 : 3;
      int x = cx * TileSize + BoardX;
      int y = cy * TileSize + BoardY;

      if(boardLetters[cy][cx] != empty)
      {
         DrawLetter(surface, boardLetters[cy][cx], x, y, false);
         if(boardLetters[cy][cx] == blank && blankValues[cy][cx] != empty)
            DrawLetter(surface, blankValues[cy][cx], x, y, true);
      }
      if(value)
      {
         int c;
         surface.SetBackground(color);
         surface.SetForeground(color);

         for(c = 0; c<num; c++)
         {
            int a = TileSize * (c+1) / (num+1);
            surface.PutPixel(x + a, y);
            surface.PutPixel(x + a+1, y);
            surface.PutPixel(x + a-1, y+1);
            surface.PutPixel(x + a, y+1);
            surface.PutPixel(x + a+1, y+1);
            surface.PutPixel(x + a+2, y+1);

            surface.PutPixel(x, y + a);
            surface.PutPixel(x, y + a+1);
            surface.PutPixel(x+1, y + a-1);
            surface.PutPixel(x+1, y + a);
            surface.PutPixel(x+1, y + a+1);
            surface.PutPixel(x+1, y + a+2);

            surface.PutPixel(x + a, y+TileSize+1);
            surface.PutPixel(x + a+1, y+TileSize+1);
            surface.PutPixel(x + a-1, y+TileSize);
            surface.PutPixel(x + a, y+TileSize);
            surface.PutPixel(x + a+1, y+TileSize);
            surface.PutPixel(x + a+2, y+TileSize);

            surface.PutPixel(x+TileSize+1, y + a);
            surface.PutPixel(x+TileSize+1, y + a+1);
            surface.PutPixel(x+TileSize, y + a-1);
            surface.PutPixel(x+TileSize, y + a);
            surface.PutPixel(x+TileSize, y + a+1);
            surface.PutPixel(x+TileSize, y + a+2);
         }

         if(boardLetters[cy][cx] == empty)
         {
            surface.Area(x + 2, y + 2, x + TileSize - 1, y + TileSize - 1);
            surface.SetForeground(black);
            if(cx == 7 && cy == 7)
            {
               unichar star = 0xAB;
               char utf8[4];
               int len = UTF32toUTF8Len(&star, 1, utf8, 4);
               surface.TextFont(wingdings.font);
               surface.WriteText(x - 1, y - 4, utf8, len);
            }
            else
            {
               surface.TextFont(scoreFont.font);
               if(language == french)
               {
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize / 4 - 5, (value == doubleLetter || value == tripleLetter) ? "Lettre" : "Mot");
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize * 2 / 4 - 5, "Compte");
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize * 3 / 4 - 5, (value == doubleLetter || value == doubleWord) ? "Double" : "Triple");
               }
               else
               {
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize / 4 - 5, (value == doubleLetter || value == doubleWord) ? "Double" : "Triple");
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize * 2 / 4 - 5, (value == doubleLetter || value == tripleLetter) ? "Letter" : "Word");
                  surface.CenterTextf(x + TileSize/2+1, y + TileSize * 3 / 4 - 5, "Score");
               }
            }
         }
      }
      else if(boardLetters[cy][cx] == empty)
      {
         surface.SetBackground(burlyWood);
         surface.Area(x + 2, y + 2, x + TileSize - 1, y + TileSize - 1);
      }
   }

   void OnRedraw(Surface surface)
   {
      int c;
      int x, y;
      surface.SetForeground(white);
      for(y = 0; y<16; y++)
      {
         surface.HLine(BoardX, BoardX + TileSize * 15, BoardY + y * TileSize);
         surface.HLine(BoardX, BoardX + TileSize * 15, BoardY + y * TileSize+1);
      }

      for(x = 0; x<16; x++)
      {
         surface.VLine(BoardY + 0, BoardY + TileSize * 15, BoardX + x * TileSize);
         surface.VLine(BoardY + 0, BoardY + TileSize * 15, BoardX + x * TileSize+1);
      }
      for(y = 0; y<15; y++)
         for(x = 0; x<15; x++)
         {
            DrawSquare(surface, x, y);
         }

      for(c = 0; c<numLetters; c++)
      {
         if(dragging && c == dragLetter)
            DrawLetter(surface, letters[c], TrayLeft + moveX, TrayHeight - moveY, false);
         else
            DrawLetter(surface, letters[c], TrayLeft + positions[c], TrayHeight, false);
      }

      for(c = 0; c<numThrowLetters; c++)
      {
         DrawLetter(surface, throwLetters[c], TrayLeft + c * TileSize, ThrowHeight, false);
      }

      if(gameStarted && turn == playerID)
      {
         surface.SetForeground(red);
         surface.TextFont(letterFont.font);
         surface.WriteTextf(540, 400, "Your turn");
      }
   }

   bool OnLeftButtonDown(int mx, int my, Modifiers mods)
   {
      int c;

      // Picking Letters on the board
      if(gameStarted && turn == playerID)
      {
         if(mx > BoardX && mx < BoardX + TileSize * 15 &&
            my > BoardY && my < BoardY + TileSize * 15)
         {
            int x = (mx - BoardX) / TileSize;
            int y = (my - BoardY) / TileSize;
            if(boardLetters[y][x] != empty && lastBoard[y][x] == empty)
            {
               letters[numLetters] = boardLetters[y][x];
               dragLetter = numLetters;

               boardLetters[y][x] = empty;
               blankValues[y][x] = empty;
               numLetters++;
               dragging = true;

               dragY = my;
               dragPos = -1;
               Capture();
               out = true;

               moveX = x * TileSize + BoardX - TrayLeft;
               moveY = TrayHeight - BoardY - y * TileSize;

               startX = moveX;
               startY = moveY;
               lastX = moveX;
               dragX = mx;
            }
         }
      }

      // Picking letters in your hand
      for(c = 0; c < numLetters; c++)
      {
         int x1 = TrayLeft + positions[c];
         int y1 = TrayHeight;
         if(mx >= x1 && my >= y1 && mx < x1 + TileSize && my < y1 + TileSize)
         {
            dragging = true;
            dragY = my;
            dragX = mx;
            moveY = 0;
            startY = 0;
            moveX = positions[c];
            startX = positions[c];
            lastX = positions[c];
            dragLetter = c;
            dragPos = -1;
            out = false;

            Capture();
            break;
         }
      }

      // Picking letters to throw
      if(my > ThrowHeight && mx >= TrayLeft && mx < TrayLeft + numThrowLetters * TileSize)
      {
         int c = (mx - TrayLeft) / TileSize;
         letters[numLetters] = throwLetters[c];
         dragLetter = numLetters;

         memmove(throwLetters + c, throwLetters + c + 1, sizeof(int) * (numThrowLetters - c - 1));
         numThrowLetters--;

         numLetters++;
         dragging = true;

         dragY = my;
         dragPos = -1;
         Capture();
         out = true;

         moveX = c * TileSize;
         moveY = TrayHeight - ThrowHeight;

         startX = moveX;
         startY = moveY;
         lastX = moveX;
         dragX = mx;
      }
      return true;
   }

   int ::ComparePositions(int * a, int * b)
   {
      int posA = (*a == crossWords.dragLetter) ? crossWords.moveX : crossWords.positions[*a];
      int posB = (*b == crossWords.dragLetter) ? crossWords.moveX : crossWords.positions[*b];

      if(posA < posB)
         return -1;
      else if(posA > posB)
         return 1;
      else
         return 0;
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         int x;
         int y;
         int ordered[7];
         int c;
         bool collision = false;

         y = startY + dragY - my;

         x = startX + mx - dragX;
         moveX = x;

         if(y < 0 && y > -TileSize && moveX >= TrayLeft && moveX < TrayLeft + TrayWidth) y = 0;

         moveY = y;

         for(c = 0; c<numLetters; c++)
            ordered[c] = c;

         if(y < TileSize && y > -TileSize && moveX + TileSize >= 0 && moveX <= TrayWidth)
         {
            qsort(ordered, numLetters, sizeof(int), ComparePositions);

            if(!out && dragPos != -1 && ordered[dragPos] != dragLetter)
            {
               int pos;
               int oldValue = ordered[dragPos];
               for(c = 0; c<numLetters; c++)
                  if(ordered[c] == dragLetter)
                  {
                     pos = c;
                     break;
                  }
               if(pos < dragPos)
               {
                  memmove(ordered + pos, ordered + pos + 1, (dragPos - pos) * sizeof(int));
                  ordered[dragPos] = dragLetter;
               }
               else
               {
                  memmove(ordered + dragPos + 1, ordered + dragPos, (pos - dragPos) * sizeof(int));
                  ordered[dragPos] = dragLetter;
               }

               ordered[dragPos] = dragLetter;
               ordered[pos] = oldValue;
            }

            if(moveX + TileSize >= 0 && moveX <= TrayWidth)
            {
               for(c = 0; c<numLetters; c++)
               {
                  if(c != dragLetter)
                  {
                     if(positions[c] + TileSize > moveX &&
                        positions[c] < moveX + TileSize)
                        break;
                  }
               }
               // COLLISION! (Insert in between?)
               if(out && c != numLetters)
                  collision = true;
            }

            if(moveX >= lastX || collision)
            {
               int end;

               for(c = 0; c<numLetters; c++)
               {
                  if(ordered[c] == dragLetter)
                  {
                     c++;
                     break;
                  }
               }

               end = moveX + TileSize;

               for(; c < numLetters; c++)
               {
                  if(((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) < end)
                  {
                     if(ordered[c] != dragLetter)
                        positions[ordered[c]] = end;
                     else
                        moveX = end;
                  }
                  end = ((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) + TileSize;
               }

               // RIGHT LIMIT
               end = TrayWidth;
               for(c = numLetters-1; c>= 0; c--)
               {
                  if(((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) + TileSize > end)
                  {
                     if(ordered[c] != dragLetter)
                        positions[ordered[c]] = end - TileSize;
                     else
                        moveX = end - TileSize;
                  }
                  end = (ordered[c] == dragLetter) ? moveX : positions[ordered[c]];
               }
            }
            if(moveX < lastX || collision)
            {
               int end;
               for(c = numLetters-1; c>=0; c--)
               {
                  if(ordered[c] == dragLetter)
                  {
                     c--;
                     break;
                  }
               }

               end = moveX;
               for(; c >= 0; c--)
               {
                  if(((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) + TileSize > end)
                  {
                     if(ordered[c] != dragLetter)
                        positions[ordered[c]] = end - TileSize;
                     else
                        moveX = end - TileSize;
                  }
                  end = (ordered[c] == dragLetter) ? moveX : positions[ordered[c]];
               }

               // LEFT LIMIT
               end = 0;
               for(c = 0; c<numLetters; c++)
               {
                  if(((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) < end)
                  {
                     if(dragLetter != ordered[c])
                        positions[ordered[c]] = end;
                     else
                        moveX = end;
                  }
                  end = ((ordered[c] == dragLetter) ? moveX : positions[ordered[c]]) + TileSize;
               }
            }
         }

         qsort(ordered, numLetters, sizeof(int), ComparePositions);
         out = moveY >= TileSize || moveY < -TileSize;
         lastX = moveX;

         for(c = 0; c<numLetters; c++)
            if(ordered[c] == dragLetter)
            {
               dragPos = c;
               break;
            }

         // Dropping On the board
         if(gameStarted && turn == playerID)
         {
            if(mx > BoardX && mx < BoardX + TileSize * 15 &&
               my > BoardY && my < BoardY + TileSize * 15)
            {
               x = (mx - BoardX) / TileSize;
               y = (my - BoardY) / TileSize;
               if(boardLetters[y][x] == empty)
               {
                  moveX = x * TileSize + BoardX - TrayLeft;
                  moveY = TrayHeight - BoardY - y * TileSize;
               }
            }
         }
         Update(null);
      }
      return true;
   }

   void FixLetters()
   {
      int end;
      int ordered[7];
      int c;

      for(c = 0; c<numLetters; c++)
         ordered[c] = c;
      qsort(ordered, numLetters, sizeof(int), ComparePositions);

      end = 0;

      for(c = 0; c < numLetters; c++)
      {
         if(positions[ordered[c]] < end)
            positions[ordered[c]] = end;
         end = positions[ordered[c]] + TileSize;
      }

      // RIGHT LIMIT
      end = TrayWidth;
      for(c = numLetters-1; c>= 0; c--)
      {
         if(positions[ordered[c]] + TileSize > end)
            positions[ordered[c]] = end - TileSize;
         end = positions[ordered[c]];
      }
   }

   bool OnLeftButtonUp(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         dragging = false;
         ReleaseCapture();

         if(my > ThrowHeight)
         {
            throwLetters[numThrowLetters++] = letters[dragLetter];

            memmove(letters + dragLetter, letters + dragLetter + 1, sizeof(int) * (numLetters - dragLetter - 1));
            memmove(positions + dragLetter, positions + dragLetter + 1, sizeof(int) * (numLetters - dragLetter - 1));
            numLetters--;
            dragLetter = -1;
         }

         // Dropping Letters on the board
         if(gameStarted && turn == playerID)
         {
            if(mx > BoardX && mx < BoardX + TileSize * 15 &&
               my > BoardY && my < BoardY + TileSize * 15)
            {
               int x = (mx - BoardX) / TileSize;
               int y = (my - BoardY) / TileSize;
               if(boardLetters[y][x] == empty)
               {
                  boardLetters[y][x] = letters[dragLetter];
                  memmove(letters + dragLetter, letters + dragLetter + 1, sizeof(int) * (numLetters - dragLetter - 1));
                  memmove(positions + dragLetter, positions + dragLetter + 1, sizeof(int) * (numLetters - dragLetter - 1));
                  numLetters--;
                  dragLetter = -1;
                  if(boardLetters[y][x] == blank)
                  {
                     DefineBlank dialog { master = this };
                     blankValues[y][x] = (Letters)dialog.Modal();
                  }
               }
            }
         }

         if(dragLetter != -1)
         {
            positions[dragLetter] = moveX;
            dragLetter = -1;
            FixLetters();
         }

         Update(null);
      }
      return true;
   }

   DataField scoreFields[MaxPlayers];

   Button playBtn
   {
      this, text = "Play", bevel = false, position = { 520, 540 };
      font = { "Arial", 20, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!numThrowLetters && gameStarted && turn == playerID)
         {
            int x, y;
            PlayedMove move { };
            for(y = 0; y<15; y++)
            {
               for(x = 0; x<15; x++)
               {
                  if(lastBoard[y][x] == empty && boardLetters[y][x] != empty)
                  {
                     move.tiles[move.numTiles].x = x;
                     move.tiles[move.numTiles].y = y;
                     move.tiles[move.numTiles].letter = boardLetters[y][x];
                     move.tiles[move.numTiles].blankValue = blankValues[y][x];
                     move.numTiles++;
                  }
               }
            }
            if(move.numTiles <= 7 && move.numTiles > 0)
            {
               if(server.PlayTiles(move))
               {
                  memcpy(lastBoard, boardLetters, sizeof(lastBoard));
                  AddLetters(move);
                  Update(null);
               }
            }
         }
         return true;
      }
   };

   void AddLetters(PlayedMove move)
   {
      int end = 0;
      int c;

      for(c = 0; c<numLetters; c++)
         if(positions[c] + TileSize > end)
            end = positions[c] + TileSize;

      for(c = 0; c<move.numTiles; c++)
      {
         letters[numLetters] = move.tiles[c].letter;
         positions[numLetters] = end;
         end += TileSize;
         numLetters++;
      }
      FixLetters();
   }

   Button dumpBtn
   {
      this, text = "Throw / Pass", bevel = false, position = { 430, 622 };
      font = { "Arial", 20, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         bool placed = false;
         for(y = 0; y<15; y++)
            for(x = 0; x<15; x++)
               if(boardLetters[y][x] != lastBoard[y][x])
                  placed = true;

         if(!placed && gameStarted && turn == playerID)
         {
            int c;
            PlayedMove move { };
            for(c = 0; c<numThrowLetters; c++)
            {
               move.tiles[move.numTiles].letter = throwLetters[c];
               move.numTiles++;
            }

            if(server.DiscardTiles(move))
            {
               numThrowLetters = 0;
               AddLetters(move);
               Update(null);
            }
         }
         return true;
      }
   };
   Button connectBtn
   {
      this, text = "Connect", bevel = false, position = { 520, 122 };
      font = { "Arial", 20, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!server)
         {
            server = ServerConnection
            {
               void OnDisconnect(int code)
               {
                  if(crossWords)
                  {
                     delete crossWords.server;
                     crossWords.gameStarted = false;
                     crossWords.Update(null);
                  }
                  DCOMClientObject::OnDisconnect(code);
               }

               void GameStarted(PlayerList list, PlayedMove tiles)
               {
                  int x,y;
                  int c;
                  crossWords.scores.Clear();
                  crossWords.scores.ClearFields();
                  crossWords.language = list.language;

                  for(c = 0; c<MaxPlayers; c++)
                  {
                     strcpy(crossWords.playerNames[c], list.players[c]);
                     crossWords.scoreFields[c] = null;

                     if(crossWords.playerNames[c][0])
                        crossWords.scores.AddField(crossWords.scoreFields[c] = DataField { dataType = class(int), header = crossWords.playerNames[c], width = 40 });
                  }

                  crossWords.gameStarted = true;

                  for(y = 0; y<15; y++)
                     for(x = 0; x<15; x++)
                        crossWords.lastBoard[y][x] = crossWords.blankValues[y][x] = crossWords.boardLetters[y][x] = empty;

                  crossWords.numLetters = 0;
                  crossWords.numThrowLetters = 0;
                  crossWords.dragging = false;
                  crossWords.dragLetter = -1;

                  crossWords.AddLetters(tiles);
                  crossWords.Update(null);
                  crossWords.turn = -1;
                  do
                  {
                     crossWords.turn++;
                     if(crossWords.turn == MaxPlayers) crossWords.turn = 0;
                  } while(!crossWords.playerNames[crossWords.turn][0]);
               }

               void MovePlayed(PlayedMove move)
               {
                  int c;
                  for(c = 0; c<move.numTiles; c++)
                  {
                     int x = move.tiles[c].x;
                     int y = move.tiles[c].y;
                     crossWords.boardLetters[y][x] = move.tiles[c].letter;
                     crossWords.blankValues[y][x] = move.tiles[c].blankValue;
                  }
                  crossWords.playerScores[move.player] += move.score;
                  crossWords.scores.AddRow().SetData(crossWords.scoreFields[move.player], crossWords.playerScores[move.player]);

                  crossWords.Update(null);
                  memcpy(crossWords.lastBoard, crossWords.boardLetters, sizeof(crossWords.lastBoard));

                  do
                  {
                     crossWords.turn++;
                     if(crossWords.turn == MaxPlayers) crossWords.turn = 0;
                  } while(!crossWords.playerNames[crossWords.turn][0]);
               }
            };
            incref server;
            if(server.Connect(serverAddress.contents, 1494)) //3114))
            {
               playerID = server.Join();
               if(playerID != -1)
                  server.SetName(playerName.contents);
            }
            else
               delete server;
         }
         return true;
      }
   };
   Button startBtn
   {
      this, text = "Start", bevel = false, position = { 520, 222 };
      font = { "Arial", 20, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(crossWordsGame)
            crossWordsGame.NewGame();
         return true;
      }
   };
   Button hostBtn
   {
      this, text = "Host (Français)", bevel = false, position = { 520, 322 };
      font = { "Arial", 16, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!crossWordsGame || !crossWordsGame.gameStarted)
         {
            crossWordsService.Stop();
            delete crossWordsGame;

            scores.Clear();
            scores.ClearFields();
            crossWordsGame = CrossWordsGame { };
            crossWordsGame.language = language = french;
            crossWordsService.Start();
            Update(null);
         }
         return true;
      }
   };
   Button hostEnglishBtn
   {
      this, text = "Host (English)", bevel = false, position = { 520, 362 };
      font = { "Arial", 16, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!crossWordsGame || !crossWordsGame.gameStarted)
         {
            crossWordsService.Stop();
            delete crossWordsGame;

            scores.Clear();
            scores.ClearFields();
            crossWordsGame = CrossWordsGame { };
            crossWordsGame.language = language = english;
            crossWordsService.Start();
            Update(null);
         }
         return true;
      }
   };

   EditBox playerName
   {
      this, text = "Name", contents = "[Your Name]", position = { 520, 10 }, size = { 100, 24 };
   };
   EditBox serverAddress
   {
      this, text = "Server", contents = "localhost", position = { 520, 40 }, size = { 100, 24 };
   };
   ListBox scores
   {
      master = this, hasMinimize = true, hasHeader = true, anchor = { right = 0 }, text = "Scores", size = { 300, 300 };
   };

   ~CrossWords()
   {
      // server.Disconnect(0);
      delete server;
   }
}
// TOCHECK: Doesn't work at the end
/*
Color valueColors[SquareValue] =
{
   0, SkyBlue, SlateBlue, Pink, Red
};
*/

class CrossWordsApp : GuiApplication
{
   bool Init()
   {
      SetLoggingMode(debug, 0);
      return true;
   }

   void Terminate()
   {
      Unlock();
      crossWordsService.Stop();
      Lock();
      delete crossWordsGame;
   }
}

DCOMService crossWordsService { port = 1494 };
