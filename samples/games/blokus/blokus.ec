import "ecere"

public enum BlokusColor : byte { none, blue, yellow, red, green };

static Color colors[BlokusColor] = { 0, blue, yellow, red, green };
byte playerPieces[4][21];


define numPieces = 21;
define bs = 20;
define squareWidth = 30;

BlokusColor board[bs * bs];

struct Piece
{
   int w, h;
   byte blocks[25];
};

Piece pieces[numPieces] =
{
   {
      1, 1,
      {  // 1
         1,0,0,0,0,
         0,0,0,0,0,
         0,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      1, 2,
      {  // 2
         1,0,0,0,0,
         1,0,0,0,0,
         0,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      1,3,
      {  // 3
         1,0,0,0,0,
         1,0,0,0,0,
         1,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2, 2,
      {  // 4
         1,0,0,0,0,
         1,1,0,0,0,
         0,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      1, 4,
      {  // 5
         1,0,0,0,0,
         1,0,0,0,0,
         1,0,0,0,0
         1,0,0,0,0,
         0,0,0,0,0
      }
   }
   {
      2,3,
      {  // 6
         0,1,0,0,0,
         0,1,0,0,0,
         1,1,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2, 3,
      {  // 7
         1,0,0,0,0,
         1,1,0,0,0,
         1,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2,2,
      {  // 8
         1,1,0,0,0,
         1,1,0,0,0,
         0,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,2,
      {  // 9
         1,1,0,0,0,
         0,1,1,0,0,
         0,0,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
       1, 5,
      {  // 10
         1,0,0,0,0,
         1,0,0,0,0,
         1,0,0,0,0
         1,0,0,0,0,
         1,0,0,0,0
      }
   },
   {
      2, 4,
      {  // 11
         0,1,0,0,0,
         0,1,0,0,0,
         0,1,0,0,0
         1,1,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2, 4,
      {  // 12
         0,1,0,0,0,
         0,1,0,0,0,
         1,1,0,0,0
         1,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2,3,
      {
         0,1,0,0,0,
         1,1,0,0,0,
         1,1,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2,3,
      {
         1,1,0,0,0,
         0,1,0,0,0,
         1,1,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      2,4,
      {
         1,0,0,0,0,
         1,1,0,0,0,
         1,0,0,0,0
         1,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         0,1,0,0,0,
         0,1,0,0,0,
         1,1,1,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         1,0,0,0,0,
         1,0,0,0,0,
         1,1,1,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         1,1,0,0,0,
         0,1,1,0,0,
         0,0,1,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         1,0,0,0,0,
         1,1,1,0,0,
         0,0,1,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         1,0,0,0,0,
         1,1,1,0,0,
         0,1,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   },
   {
      3,3,
      {
         0,1,0,0,0,
         1,1,1,0,0,
         0,1,0,0,0
         0,0,0,0,0,
         0,0,0,0,0
      }
   }
};

int PieceBlock(int p, int x, int y, int direction)
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
      return piece->blocks[ry * 5 + rx];
   return 0;
}

class Blokus : Window
{
   text = "Blokus";                                                                                                                         //allo
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 1280, 700 };
   minClientSize = { 800, 700 };
   nativeDecorations = true;

   int selectedPiece;
   bool dragging, onBoard;
   Point drag, offset;
   Point squareDragged;
   int direction;

   void PlacePiece(int px, int py, int piece, BlokusColor color)
   {
      int x, y;
      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
         {
            board[(py + y) * bs + (px + x)] = pieces[piece].blocks[y * 5 + x] * color;
         }
   }

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
      int c,p;
      for(c = 0; c < 4; c++)
      {
         for(p = 0; p < numPieces; p++)
            playerPieces[c][p] = 1;
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
            onBoard = true;
         }
         Update(null);
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(dragging)
      {
         dragging = false;
         ReleaseCapture();
         Update(null);
      }
      return true;
   }

   bool OnRightButtonDown(int mx, int my, Modifiers mods)
   {
      Piece * piece = &pieces[selectedPiece];
      int rx, ry;
      int x = squareDragged.x, y = squareDragged.y;
      int w,h;

      if(++direction == 4) direction = 0;
      w = (direction & 1) ? piece->h : piece->w;
      h = (direction & 1) ? piece->w : piece->h;

      offset.x += squareDragged.x * squareWidth;
      offset.y += squareDragged.y * squareWidth;
      squareDragged = { w-1-y, x };
      offset.x -= squareDragged.x * squareWidth;
      offset.y -= squareDragged.y * squareWidth;

      OnMouseMove(mx,my,mods);

      Update(null);
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
            if(playerPieces[0][c])
            {
               int w = pieces[c].w, h = pieces[c].h;
               int y;
               for(y = 0; y < 5; y++)
               {
                  int x;
                  for(x = 0; x < 5; x++)
                  {
                     if(pieces[c].blocks[y*5+x])
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
            if(playerPieces[0][c])
            {
               int w = pieces[c].w, h = pieces[c].h;
               for(y = 0; y < 5; y++)
               {
                  for(x = 0; x < 5; x++)
                  {
                     if(pieces[c].blocks[y*5+x])
                     {
                        if(!dragging || selectedPiece != c)
                           DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, (BlokusColor)1);
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
                  if(PieceBlock(selectedPiece, x, y, direction))
                     DrawSquare(surface, drag.x + x * squareWidth, drag.y + y * squareWidth, (BlokusColor)1);
               }
         }
      }
   }
}

Blokus blokus {};
