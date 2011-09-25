import "ecere"

public enum BlokusColor : byte { none, blue, yellow, red, green };

public enum PlayerColor : byte
{
   blue, yellow, red, green;
   property BlokusColor
   {
      // TOFIX: get { return (BlokusColor)((int)this+1); }
      get { return (BlokusColor)*(int *)&this+1; }
   }
};

static Color colors[BlokusColor] = { 0, blue, goldenrod, red, green };
byte playerPieces[PlayerColor][21];
bool firstPiece[PlayerColor];
Point corners[PlayerColor] =
{
   { 0, 0 },
   { bs-1, 0 },
   { bs-1, bs-1 },
   { 0, bs-1 }
};

define numPieces = 21;
define bs = 20;
define squareWidth = 30;

BlokusColor board[bs * bs];
PlayerColor playerColor = blue;

struct Piece
{
   int w, h;
   byte blocks[25];
};

Piece pieces[numPieces] =
{
   {
      1, 1,
      { 1 }
   },
   {
      1, 2,
      {
         1,
         1
      }
   },
   {
      1,3,
      {
         1,
         1,
         1
      }
   },
   {
      2, 2,
      {
         1,0,
         1,1
      }
   },
   {
      1, 4,
      {
         1,
         1,
         1,
         1
      }
   }
   {
      2,3,
      {
         0,1,
         0,1,
         1,1
      }
   },
   {
      2, 3,
      {
         1,0,
         1,1,
         1,0
      }
   },
   {
      2,2,
      {
         1,1,
         1,1
      }
   },
   {
      3,2,
      {
         1,1,0,
         0,1,1
      }
   },
   {
       1, 5,
      {
         1,
         1,
         1,
         1,
         1
      }
   },
   {
      2, 4,
      {
         0,1,
         0,1,
         0,1,
         1,1
      }
   },
   {
      2, 4,
      {
         0,1,
         0,1,
         1,1,
         1,0
      }
   },
   {
      2,3,
      {
         0,1,
         1,1,
         1,1
      }
   },
   {
      2,3,
      {
         1,1,
         0,1,
         1,1
      }
   },
   {
      2,4,
      {
         1,0,
         1,1,
         1,0,
         1,0
      }
   },
   {
      3,3,
      {
         0,1,0,
         0,1,0,
         1,1,1
      }
   },
   {
      3,3,
      {
         1,0,0,
         1,0,0,
         1,1,1
      }
   },
   {
      3,3,
      {
         1,1,0,
         0,1,1,
         0,0,1
      }
   },
   {
      3,3,
      {
         1,0,0,
         1,1,1,
         0,0,1
      }
   },
   {
      3,3,
      {
         1,0,0,
         1,1,1,
         0,1,0
      }
   },
   {
      3,3,
      {
         0,1,0,
         1,1,1,
         0,1,0
      }
   }
};

int PieceBlock(int p, int x, int y, int direction, bool flip)
{
   Piece * piece = &pieces[p];
   int w = piece->w, h = piece->h;
   int rx, ry;
   switch(direction)
   {
      case 0: rx = x; ry = y; break;
      case 1: ry = h-1 - x; rx = y; break;
      case 2: ry = h-1 - y; rx = w -1- x; break;
      case 3: ry = x; rx = w-1-y; break;
   }
   if(rx < w && ry < h && rx  >= 0 && ry >= 0)
      return piece->blocks[ry * w + (flip ? (w-1-rx) : rx)];
   return 0;
}

class Blokus : Window
{
   text = "Blokus";
   background = black;
   borderStyle = sizable;
   minClientSize = { 800, 700 };
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 1280, 728 };
   nativeDecorations = true;
                                                                                                                            //allo

   int selectedPiece;
   bool dragging, onBoard;
   Point drag, offset;
   Point squareDragged;
   Point boardPos;
   int direction;
   bool flip;

   void DrawSquare(Surface surface, int x, int y, BlokusColor color)
   {
      surface.background = colors[color];
      surface.Area(x+1, y+1, x + squareWidth-1, y + squareWidth-1);      
      surface.foreground = lightGray;
      surface.VLine(y+5, y + 15, x + 5);
      surface.HLine(x+5, x + 18, y + 5);
      surface.foreground = white;
      surface.Rectangle(x + 2,y+2, x + squareWidth-2, y + squareWidth - 2);                                                              /////   esteban
   }

   Blokus()
   {
      PlayerColor c;
      int p;
      for(c = blue; c <= green; c++)
      //TOFIX: for(c = 0; c < 4; c++)
      {
         for(p = 0; p < numPieces; p++)
            playerPieces[c][p] = 1;
         firstPiece[c] = true;
      }
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         Piece * piece = &pieces[selectedPiece];
         int w = (direction & 1) ? piece->h : piece->w;
         int h = (direction & 1) ? piece->w : piece->h;
         drag = { offset.x + mx, offset.y + my }; 

         if(mx - squareDragged.x * squareWidth >= 20 - 10 && mx - squareDragged.x * squareWidth < 20 + ((bs-w)+1) * squareWidth + 10 && 
            my - squareDragged.y * squareWidth >= 20 - 10 && my - squareDragged.y * squareWidth < 20 + ((bs-h)+1) * squareWidth + 10)
         {
            int x, y;
            x = Max(0,mx - squareDragged.x * squareWidth - 20) / squareWidth;
            y = Max(0,my - squareDragged.y * squareWidth - 20) / squareWidth;
            x = Min(x, bs-w);
            y = Min(y, bs-h);
            drag.x = 20 + x * squareWidth;
            drag.y = 20 + y * squareWidth;
            boardPos = { x, y };
            onBoard = true;
         }
         else
            onBoard = false;
         Update(null);
      }
      return true;
   }

   bool OnLeftButtonUp(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         if(onBoard)
         {
            Piece * piece = &pieces[selectedPiece];
            int x, y;
            bool valid = true;
            bool touchCorner = false;
            BlokusColor color = playerColor;
            
            for(y = 0; y < 5; y++)
               for(x = 0; x < 5; x++)
                  if(PieceBlock(selectedPiece, x, y, direction, flip))
                  {
                     int bx = x + boardPos.x, by = y + boardPos.y;
                     if(board[by * bs + bx] ||
                        (by > 0    && board[(by-1) * bs + bx] == color) ||
                        (by < bs-1 && board[(by+1) * bs + bx] == color) ||
                        (bx > 0    && board[by * bs + bx - 1] == color) ||
                        (bx < bs-1 && board[by * bs + bx + 1] == color))
                     {
                        valid = false;
                        break;
                     }
                     if((by > 0     && bx > 0    && board[(by-1) * bs + (bx-1)] == color) ||
                        (by > 0     && bx < bs-1 && board[(by-1) * bs + (bx+1)] == color) ||
                        (by < bs-1  && bx > 0    && board[(by+1) * bs + (bx-1)] == color) ||
                        (by < bs-1  && bx < bs-1 && board[(by+1) * bs + (bx+1)] == color))
                        touchCorner = true;
                  }
            if(valid && firstPiece)
            {
               for(y = 0; y < 5; y++)
                  for(x = 0; x < 5; x++)
                     if(PieceBlock(selectedPiece, x, y, direction, flip))
                     {
                        int bx = x + boardPos.x, by = y + boardPos.y;
                        if(bx == corners[playerColor].x && by == corners[playerColor].y)
                        {
                           touchCorner = true;
                           break;
                        }
                     }
            }

            if(valid && touchCorner)
            {
               for(y = 0; y < 5; y++)
                  for(x = 0; x < 5; x++)
                     if(PieceBlock(selectedPiece, x, y, direction, flip))
                        board[(y + boardPos.y) * bs + x + boardPos.x] = color;
               playerPieces[playerColor][selectedPiece] = 0;

               firstPiece[playerColor] = false;
               if(++playerColor > green) playerColor = 0;
            }
         }
         dragging = false;
         ReleaseCapture();
         Update(null);
      }
      return true;
   }

   bool OnRightButtonDown(int mx, int my, Modifiers mods)
   {
      Piece * piece = &pieces[selectedPiece];
      int x = squareDragged.x, y = squareDragged.y;
      int w,h;

      w = (direction & 1) ? piece->h : piece->w;
      h = (direction & 1) ? piece->w : piece->h;

      offset.x += squareDragged.x * squareWidth;
      offset.y += squareDragged.y * squareWidth;
      squareDragged = (direction & 1) ? { x, h-1-y } : { w-1-x, y };
      flip ^= true;
      offset.x -= squareDragged.x * squareWidth;
      offset.y -= squareDragged.y * squareWidth;

      OnMouseMove(mx,my,mods);

      Update(null);
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == wheelDown || key == wheelUp)
      {
         Piece * piece = &pieces[selectedPiece];
         int mx = drag.x - offset.x, my = drag.y - offset.y;

         int rx, ry;
         int x = squareDragged.x, y = squareDragged.y;
         int w,h;

         if(key == wheelDown)
         {
            if(++direction == 4) direction = 0;
         }
         else
         {
            if(--direction == -1) direction = 3;
         }
         w = (direction & 1) ? piece->h : piece->w;
         h = (direction & 1) ? piece->w : piece->h;

         offset.x += squareDragged.x * squareWidth;
         offset.y += squareDragged.y * squareWidth;
         if(key == wheelDown)
            squareDragged = { w-1-y, x };
         else
            squareDragged = { y, h-1-x };
            
         offset.x -= squareDragged.x * squareWidth;
         offset.y -= squareDragged.y * squareWidth;

         OnMouseMove(mx,my,0);

         Update(null);
      }
      return true;
   }

   bool OnLeftButtonDown(int mx, int my, Modifiers mods)
   {
      if( mx > squareWidth * bs + 40)
      {
         int bx, by;
         bool selected = false;
         int pieceNum = 0;
         Point offset;
         int rh = 0;
         int c;
         // Draw Player Pieces
         bx = squareWidth * bs + 40;
         by = 20;
         for(c = 0; c < numPieces; c++)
         {
            if(playerPieces[playerColor][c])
            {
               int w = pieces[c].w, h = pieces[c].h;
               int y;
               for(y = 0; y < 5; y++)
               {
                  int x;
                  for(x = 0; x < 5; x++)
                  {
                     if(PieceBlock(c, x, y, 0, false))
                     {
                        int dx = bx + x * squareWidth;
                        int dy = by + y * squareWidth;
                        if(mx >= dx && mx < dx + squareWidth &&
                           my >= dy && my < dy + squareWidth)
                        {
                           selected = true;
                           pieceNum = c;
                           offset = { bx - mx, by - my };
                           squareDragged = { x, y };
                           break;
                        }
                     }
                     if(selected) break;
                  }
                  if(selected) break;
               }
               if(selected) break;
               bx += w * squareWidth + squareWidth;
               if(h > rh) rh = h;
               if(bx + 5 * squareWidth > clientSize.w)
               {
                  bx = squareWidth * bs + 40;
                  by += (rh+1) * squareWidth;
                  rh = 0;
               }
            }
         }
         if(selected)
         {
            Update(null);
            direction = 0;
            flip = 0;
            selectedPiece = pieceNum;
            this.offset = offset;
            dragging = true;
            OnMouseMove(mx, my, mods);
            Capture();
            
         }
      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      int c;
      int bx = 20;//(clientSize.w - squareWidth * bs) / 2;
      int by = 20;//(clientSize.h - squareWidth * bs) / 2;
      int x, y;
      
      surface.foreground = aqua;
      for(c = 0; c <= bs; c++)
      {
         surface.HLine(bx,bx+squareWidth*bs, by + c * squareWidth);
         surface.VLine(by,by+squareWidth*bs, bx + c * squareWidth);
      }

      surface.background = colors[blue];
      x = bx;
      y = by;
      surface.Area(x - 10, y - 10, x + 10, y-1);
      surface.Area(x - 10, y - 10, x - 1, y+10);

      surface.background = colors[yellow];
      x = bx + bs*squareWidth;
      y = by;
      surface.Area(x + 10, y - 10, x - 10, y-1);
      surface.Area(x + 10, y - 10, x + 1,  y+10);

      surface.background = colors[red];
      x = bx + bs*squareWidth;
      y = by + bs*squareWidth;
      surface.Area(x + 10, y + 1, x - 10, y+10);
      surface.Area(x + 10, y - 10, x + 1,  y+10);

      surface.background = colors[green];
      x = bx;
      y = by + bs*squareWidth;
      surface.Area(x - 10, y + 1, x + 10, y+10);
      surface.Area(x - 10, y - 10, x - 1,  y+10);

      for(y = 0; y < bs; y++)
      {
         for(x = 0; x < bs; x++)
         {
            BlokusColor color = board[y * bs + x];
            if(color)
            {
               DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, color);
            }
         }
      }

      {
         int rh = 0;
         // Draw Player Pieces
         bx = squareWidth * bs + 40;
         by = 20;
         for(c = 0; c < numPieces; c++)
         {
            if(playerPieces[playerColor][c])
            {
               int w = pieces[c].w, h = pieces[c].h;
               for(y = 0; y < 5; y++)
               {
                  for(x = 0; x < 5; x++)
                  {
                     if(PieceBlock(c, x, y, 0, false))
                     {
                        if(!dragging || selectedPiece != c)
                           DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, playerColor);
                     }
                  }
               }
               if(h > rh) rh = h;
               bx += w * squareWidth + squareWidth;
               if(bx + 5 * squareWidth > clientSize.w)
               {
                  bx = squareWidth * bs + 40;
                  by += rh * squareWidth + squareWidth;
                  rh = 0;
               }
            }
         }
         // Draw Dragged piece
         if(dragging)
         {
            for(y = 0; y < 5; y++)
               for(x = 0; x < 5; x++)
               {
                  if(PieceBlock(selectedPiece, x, y, direction, flip))
                  {
                     DrawSquare(surface, drag.x + x * squareWidth, drag.y + y * squareWidth, playerColor);
                     
                     if(x == 0 || !PieceBlock(selectedPiece, x-1, y, direction, flip))
                     {
                        surface.foreground = white;
                        surface.VLine(drag.y + y * squareWidth-1, drag.y + (y+1) * squareWidth+1, drag.x + x * squareWidth - 1);
                        surface.foreground = lime;
                        surface.VLine(drag.y + y * squareWidth-2, drag.y + (y+1) * squareWidth+2, drag.x + x * squareWidth - 2);
                     }

                     if(y == 0 || !PieceBlock(selectedPiece, x, y-1, direction, flip))
                     {
                        surface.foreground = white;
                        surface.HLine(drag.x + x * squareWidth-1, drag.x + (x+1) * squareWidth+1, drag.y + y * squareWidth - 1);
                        surface.foreground = lime;
                        surface.HLine(drag.x + x * squareWidth-2, drag.x + (x+1) * squareWidth+2, drag.y + y * squareWidth - 2);
                     }

                     if(x == 4 || !PieceBlock(selectedPiece, x+1, y, direction, flip))
                     {
                        surface.foreground = white;
                        surface.VLine(drag.y + y * squareWidth-1, drag.y + (y+1) * squareWidth+1, drag.x + (x+1) * squareWidth + 1);
                        surface.foreground = lime;
                        surface.VLine(drag.y + y * squareWidth-2, drag.y + (y+1) * squareWidth+2, drag.x + (x+1) * squareWidth + 2);
                     }

                     if(y == 4 || !PieceBlock(selectedPiece, x, y+1, direction, flip))
                     {
                        surface.foreground = white;
                        surface.HLine(drag.x + x * squareWidth-1, drag.x + (x+1) * squareWidth+1, drag.y + (y+1) * squareWidth + 1);
                        surface.foreground = lime;
                        surface.HLine(drag.x + x * squareWidth-2, drag.x + (x+1) * squareWidth+2, drag.y + (y+1) * squareWidth + 2);
                     }
                  }
               }
         }
      }
   }

   Button button1
   {
      this, text = "Pass", position = { 24, 656 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(++playerColor > green)
            playerColor = blue;
         Update(null);
         return true;
      }

   };
}

Blokus blokus {};
// yay its done
