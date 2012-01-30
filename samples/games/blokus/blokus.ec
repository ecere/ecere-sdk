import "ecere"
import "console"

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

static Color colors[2][BlokusColor] =
{
   // TOFIX: (omitting Color { })
   { 0, Color { 64, 64, 96 }, Color { 141, 114, 48 }, Color { 96, 32, 32 }, Color { 64, 96, 64 } },
   { 0, blue, goldenrod, red, green }
};
Point corners[PlayerColor] =
{
   { 0, 0 },
   { bs-1, 0 },
   { bs-1, bs-1 },
   { 0, bs-1 }
};

define numPieces = 21;
define bs = 20;
define squareWidth = 28;
define boardStartX = 20;
define boardStartY = 30;
define piecesY = 20;

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

struct BlokusGameState
{
   byte playerPieces[PlayerColor][numPieces];
   bool firstPiece[PlayerColor];
   BlokusColor board[bs * bs];
   PlayerColor colorTurn;
   PlayerColor rotatingColor;
   int numPlayers;
   bool validPieces[numPieces];
   bool over;
   bool validMove;
   int bonus[4];
   int scores[4];

   void NewGame()
   {
      PlayerColor p;
      int i;

      // TOFIX: for(p = 0; p < PlayerColor::enumSize; p++)
      for(p = blue; p <= green; p++)
      {
         for(i = 0; i < numPieces; i++)
            playerPieces[p][i] = 1;
         firstPiece[p] = true;
         bonus[p] = 0;
         scores[0] = 0;
      }
      for(i = 0; i < bs * bs; i++)
         board[i] = none;

      over = false;
      colorTurn = blue;
      rotatingColor = blue;

      validMove = CheckValidMoves(colorTurn, validPieces);
   }

   bool ValidMove(PlayerColor playerColor, int selectedPiece, int direction, bool flip, int boardX, int boardY)
   {
      Piece * piece = &pieces[selectedPiece];
      int x, y;
      bool valid = true;
      bool touchCorner = false;
      int w = (direction & 1) ? piece->h : piece->w;
      int h = (direction & 1) ? piece->w : piece->h;

      if(!playerPieces[playerColor][selectedPiece]) return false;

      if(boardX < 0 || boardY < 0 || boardX + w > bs || boardY + h > bs) return false;

      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
            if(PieceBlock(selectedPiece, x, y, direction, flip))
            {
               int bx = x + boardX, by = y + boardY;
               if(board[by * bs + bx] ||
                  (by > 0    && board[(by-1) * bs + bx] == playerColor) ||
                  (by < bs-1 && board[(by+1) * bs + bx] == playerColor) ||
                  (bx > 0    && board[by * bs + bx - 1] == playerColor) ||
                  (bx < bs-1 && board[by * bs + bx + 1] == playerColor))
               {
                  valid = false;
                  break;
               }
               if((by > 0     && bx > 0    && board[(by-1) * bs + (bx-1)] == playerColor) ||
                  (by > 0     && bx < bs-1 && board[(by-1) * bs + (bx+1)] == playerColor) ||
                  (by < bs-1  && bx > 0    && board[(by+1) * bs + (bx-1)] == playerColor) ||
                  (by < bs-1  && bx < bs-1 && board[(by+1) * bs + (bx+1)] == playerColor))
                  touchCorner = true;
            }
      if(valid && firstPiece[playerColor])
      {
         for(y = 0; y < 5; y++)
            for(x = 0; x < 5; x++)
               if(PieceBlock(selectedPiece, x, y, direction, flip))
               {
                  int bx = x + boardX, by = y + boardY;
                  if(bx == corners[playerColor].x && by == corners[playerColor].y)
                  {
                     touchCorner = true;
                     break;
                  }
               }
      }

      return valid && touchCorner;
   }

   bool CheckValidMoves(PlayerColor playerColor, bool validPieces[21])
   {
      bool result = false;
      int p;
      for(p = 0; p < numPieces; p++)
      {
         bool validMove = false;
         if(playerPieces[playerColor][p])
         {
            int x, y;
            for(y = 0; y < bs && !validMove; y++)
            {
               for(x = 0; x < bs && !validMove; x++)
               {
                  int flip;
                  int direction;
                  for(direction = 0; direction < 4 && !validMove; direction++)
                  {
                     for(flip = 0; flip <=1 && !validMove; flip++)
                     {
                        if(ValidMove(playerColor, p, direction, flip, x, y))
                           result = validMove = true;
                     }
                  }
               }
            }
         }
         if(validPieces) validPieces[p] = validMove;
      }
      return result;
   }

   void PlayMove(int pieceType, int direction, bool flip, int boardX, int boardY)
   {
      int p;
      int y, x;
      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
            if(PieceBlock(pieceType, x, y, direction, flip))
               board[(y + boardY) * bs + x + boardX] = colorTurn;
      playerPieces[colorTurn][pieceType] = 0;
      scores[colorTurn] = 0;
      for(p = 0; p < numPieces; p++)
      {
         if(playerPieces[colorTurn][p])
         {
            Piece * piece = &pieces[p];
            int y, x;
            for(y = 0; y < piece->h; y++)
               for(x = 0; x < piece->w; x++)
                  if(piece->blocks[y * piece->w + x])
                     scores[colorTurn]--;
         }
      }
      if(scores[colorTurn] == 0)
         bonus[colorTurn] = (pieceType == 0) ? 20 : 15;

      firstPiece[colorTurn] = false;
      if(numPlayers == 3 && colorTurn == green)
      {
         if(++rotatingColor == green) rotatingColor = 0;
      }
      if(++colorTurn > green) colorTurn = 0;

      validMove = CheckValidMoves(colorTurn, validPieces);
      if(!validMove)
         CheckGameOver();
   }

   void Pass()
   {
      if(numPlayers == 3 && colorTurn == green)
      {
         if(++rotatingColor == green) rotatingColor = 0;
      }
      if(++colorTurn > green) colorTurn = 0;

      validMove = CheckValidMoves(colorTurn, validPieces);
      if(!validMove)
         CheckGameOver();
   }

   void CheckGameOver()
   {
      PlayerColor turn = colorTurn;
      int c;
      for(c = 0; c < 3; c++)
      {
         if(++turn > green) turn = 0;
         if(CheckValidMoves(turn, null))
            break;
      }
      if(c == 3)
         over = true;
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
   minClientSize = { 1068 /*800*/, 700 };
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 1280, 728 };
   nativeDecorations = true;
   font = { "Arial", 12, bold = true };
   FontResource yourTurnFont { "Arial", 12, bold = true, italic = true, window = this };

   bool gameStarted;
   PlayerColor firstColor;
   char *playerNames[MaxPlayers];

   // Current game state
   BlokusGameState gameState;

   // User Interaction
   PlayerColor colorPlayed; // Color currently (or next) being played
   int selectedPiece;
   bool dragging, onBoard;
   Point drag, offset;
   Point squareDragged;
   Point boardPos;
   int direction;
   bool flip;
   bool passed[4];

   void NextColorPlayed()
   {
      if(gameState.numPlayers == 1)
      {
         if(++colorPlayed > green) colorPlayed = 0;
      }
      else if(gameState.numPlayers == 2)
      {
         if((colorPlayed+=2) > green) colorPlayed = firstColor;
      }
      else if(gameState.numPlayers == 3)
      {
         colorPlayed = (colorPlayed == firstColor && gameState.rotatingColor == firstColor) ? green : firstColor;
      }
   }

   void UpdatePlayerNames()
   {
      int c;
      if(gameState.numPlayers == 1)
      {
         for(c = 0; c < 4; c++)
            playerNames[c] = panel.playerNames[0];
      }
      else if(gameState.numPlayers == 2)
      {
         for(c = 0; c < 2; c++)
         {
            playerNames[c] = panel.playerNames[c];
            playerNames[c+2] = panel.playerNames[c];
         }
      }
      else if(gameState.numPlayers == 3)
      {
         for(c = 0; c < 3; c++)
            playerNames[c] = panel.playerNames[c];
         playerNames[3] = panel.playerNames[gameState.rotatingColor];
      }
      else if(gameState.numPlayers == 4)
      {
         for(c = 0; c < 4; c++)
            playerNames[c] = panel.playerNames[c];
      }
   }

   void DrawSquare(Surface surface, int x, int y, BlokusColor color, int shade)
   {
      surface.background = colors[shade][color];
      surface.Area(x+1, y+1, x + squareWidth-1, y + squareWidth-1);      
      surface.foreground = lightGray;
      surface.VLine(y+5, y + 15, x + 5);
      surface.HLine(x+5, x + 18, y + 5);
      surface.foreground = white;
      surface.Rectangle(x + 2,y+2, x + squareWidth-2, y + squareWidth - 2);
   }

   void OnDestroy()
   {
      panel.Destroy(0);
      scoresPanel.Destroy(0);
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         Piece * piece = &pieces[selectedPiece];
         int w = (direction & 1) ? piece->h : piece->w;
         int h = (direction & 1) ? piece->w : piece->h;
         drag = { offset.x + mx, offset.y + my }; 

         if(mx - squareDragged.x * squareWidth >= boardStartX - 10 && mx - squareDragged.x * squareWidth < boardStartX + ((bs-w)+1) * squareWidth + 10 && 
            my - squareDragged.y * squareWidth >= boardStartY - 10 && my - squareDragged.y * squareWidth < boardStartY + ((bs-h)+1) * squareWidth + 10)
         {
            int x, y;
            x = Max(0,mx - squareDragged.x * squareWidth - boardStartX) / squareWidth;
            y = Max(0,my - squareDragged.y * squareWidth - boardStartY) / squareWidth;
            x = Min(x, bs-w);
            y = Min(y, bs-h);
            drag.x = boardStartX + x * squareWidth;
            drag.y = boardStartY + y * squareWidth;
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
            if(gameStarted && colorPlayed == gameState.colorTurn)
            {
               Piece * piece = &pieces[selectedPiece];
               if(gameState.ValidMove(gameState.colorTurn, selectedPiece, direction, flip, boardPos.x, boardPos.y))
                  panel.server.PlayPiece(selectedPiece, direction, flip, boardPos.x, boardPos.y);
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
         by = piecesY;
         for(c = 0; c < numPieces; c++)
         {
            if(gameState.playerPieces[colorPlayed][c])
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

   float lightValue, lightDir;
   lightValue = 1;
   lightDir = -.1f;
   Timer turnLightTimer
   {
      this, 0.1, false;

      bool DelayExpired()
      {
         lightValue += lightDir;
         if(lightValue < 0) { lightValue = 0; lightDir = .1f; }
         if(lightValue > 1) { lightValue = 1; lightDir =-.1f; }
         Update(null);
         return true;
      }
   };

   void OnRedraw(Surface surface)
   {
      int c;
      int bx = boardStartX;
      int by = boardStartY;
      int x, y;
      char * s;
      int len, tw;
      Color turnLight = white;
      if(gameStarted && !gameState.over)
      {
         ColorRGB empty = colors[1][gameState.colorTurn] /*gray*/, full = white;
         turnLight = ColorRGB
         {
            empty.r + lightValue * (full.r - empty.r),
            empty.g + lightValue * (full.g - empty.g),
            empty.b + lightValue * (full.b - empty.b)
         };
      }
      
      surface.foreground = aqua;
      for(c = 0; c <= bs; c++)
      {
         surface.HLine(bx,bx+squareWidth*bs, by + c * squareWidth);
         surface.VLine(by,by+squareWidth*bs, bx + c * squareWidth);
      }

      surface.background = colors[blokus.gameStarted][blue];
      x = bx;
      y = by;
      surface.Area(x - 10, y - 10, x + 10, y-1);
      surface.Area(x - 10, y - 10, x - 1, y+10);

      s = playerNames[PlayerColor::blue];
      if(s)
      {
         len = strlen(s);
         surface.foreground = (gameState.colorTurn == blue) ? turnLight : white;
         surface.WriteText(x + 15, y - 20, s, len);
      }

      surface.background = colors[blokus.gameStarted][yellow];
      x = bx + bs*squareWidth;
      y = by;
      surface.Area(x + 10, y - 10, x - 10, y-1);
      surface.Area(x + 10, y - 10, x + 1,  y+10);

      s = playerNames[PlayerColor::yellow];
      if(s)
      {
         len = strlen(s);
         surface.TextExtent(s, len, &tw, null);
         surface.foreground = (gameState.colorTurn == yellow) ? turnLight : white;
         surface.WriteText(x - 15 - tw, y - 20, s, len);
      }

      surface.background = colors[blokus.gameStarted][red];
      x = bx + bs*squareWidth;
      y = by + bs*squareWidth;
      surface.Area(x + 10, y + 1, x - 10, y+10);
      surface.Area(x + 10, y - 10, x + 1,  y+10);
      s = playerNames[PlayerColor::red];
      if(s)
      {
         len = strlen(s);
         surface.TextExtent(s, len, &tw, null);
         surface.foreground = (gameState.colorTurn == red) ? turnLight : white;
         surface.WriteText(x - 15 - tw, y, s, len);
      }

      surface.background = colors[blokus.gameStarted][green];
      x = bx;
      y = by + bs*squareWidth;
      surface.Area(x - 10, y + 1, x + 10, y+10);
      surface.Area(x - 10, y - 10, x - 1,  y+10);
      s = playerNames[PlayerColor::green];
      if(s)
      {
         len = strlen(s);
         surface.foreground = (gameState.colorTurn == green) ? turnLight : white;
         surface.WriteText(x + 15, y, s, len);
      }

      if(gameState.over)
      {
         surface.font = yourTurnFont.font;
         surface.foreground = crimson;
         surface.CenterTextf(x + bs*squareWidth/2, y + 3, "Game Over");
      }
      else if(gameState.numPlayers > 1 && gameStarted && colorPlayed == gameState.colorTurn)
      {
         surface.font = yourTurnFont.font;
         surface.foreground = tomato;
         surface.CenterTextf(x + bs*squareWidth/2, y + 3, "Your turn");
      }

      for(y = 0; y < bs; y++)
      {
         for(x = 0; x < bs; x++)
         {
            BlokusColor color = gameState.board[y * bs + x];
            if(color)
            {
               DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, color, blokus.gameStarted);
            }
         }
      }

      {
         int rh = 0;
         // Draw Player Pieces
         bx = squareWidth * bs + 40;
         by = piecesY;
         for(c = 0; c < numPieces; c++)
         {
            if(gameState.playerPieces[colorPlayed][c])
            {
               int w = pieces[c].w, h = pieces[c].h;
               for(y = 0; y < 5; y++)
               {
                  for(x = 0; x < 5; x++)
                  {
                     if(PieceBlock(c, x, y, 0, false))
                     {
                        if(!dragging || selectedPiece != c)
                           DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, colorPlayed, gameStarted && (gameState.colorTurn != colorPlayed || gameState.validPieces[c]));
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
                     DrawSquare(surface, drag.x + x * squareWidth, drag.y + y * squareWidth, colorPlayed, gameStarted && gameState.colorTurn == colorPlayed);
                     
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

   Console chat
   {
      this, size = { bs*squareWidth }, anchor = { left = boardStartX, top = boardStartY + bs*squareWidth + 20, bottom = 5 };
      font = { "Arial", 11, bold = true };
      editTextColor = white;
      logTextColor = white;
      editHeight = 24;
      log.hasVertScroll = bool::true;
      visible = false;

      bool ProcessCommand(char * command)
      {
         panel.server.SendMessage(command);
         return false;
      }
   };

   Button btnPass
   {
      this, text = "No Move Available! Pass...", anchor = { right = 5, bottom = 5 };
      inactive = true;
      visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         btnPass.visible = false;
         blokus.passed[blokus.gameState.colorTurn] = true;
         panel.server.Pass();
         return true;
      }

   };
}

class BlokusScores : Window
{
   master = blokus;
   moveable = true;
   borderStyle = fixed;
   background = black;
   text = "Blokus Final Scores";
   clientSize = { 580, 210 };
   font = { "Arial", 12, bold = true };

   void OnRedraw(Surface surface)
   {
      PlayerColor p;
      char * s;
      int len;
      char temp[256];
      int grandTotals[4];
      BlokusGameState * state = &blokus.gameState;
      surface.foreground = white;
      s = "Score"; len = strlen(s);
      surface.WriteText(10, 40, s, len);

      s = "Bonus"; len = strlen(s);
      surface.WriteText(10, 60, s, len);

      s = "Total"; len = strlen(s);
      surface.WriteText(10, 100, s, len);

      if(state->numPlayers < 3)
      {
         s = "Grand Total"; len = strlen(s);
         surface.WriteText(10, 160, s, len);
      }

      for(p = blue; p <= green; p++)
      {
         // TOFIX: bug here, why is -1 required?
         int x = 80 + (p-1) * 120;
         surface.foreground = colors[1][p];
         /* // GCC internal compiler error with -O2, MinGW GCC 4.4.0
         s = (state->numPlayers == 3 && p == green) ? "* Green *" : blokus.playerNames[p];
         len = strlen(s);
         surface.WriteText(x, 20, s, len);
         */
         if(state->numPlayers == 3 && p == green)
         {
            s = "* Green *";
            len = strlen(s);
            surface.WriteText(x, 20, s, len);
         }
         else if(blokus.playerNames[p])
         {
            s = blokus.playerNames[p];
            len = strlen(s);
            surface.WriteText(x, 20, s, len);
         }

         s = temp; sprintf(temp, "%d", state->scores[p]);
         len = strlen(s);
         surface.WriteText(x + 30, 40, s, len);

         if(state->bonus[p])
         {
            s = temp; sprintf(temp, "%d", state->bonus[p]);
            len = strlen(s);
            surface.WriteText(x + 30, 60, s, len);
         }

         if(state->numPlayers > 2)
            grandTotals[p] = state->scores[p] + state->bonus[p];
         s = temp; sprintf(temp, "%d", state->scores[p] + state->bonus[p]);
         len = strlen(s);
         surface.WriteText(x + 30, 100, s, len);

         if((state->numPlayers == 2 && p <= yellow) ||
            (state->numPlayers == 1 && p == blue))
         {
            // TOFIX: Annoying +2 conversion issue
            if(state->numPlayers == 2)
               grandTotals[p] = state->scores[p] + state->bonus[p] +
                                state->scores[p+red /*2*/] + state->bonus[p+red /*2*/];
            else
               grandTotals[p] = state->scores[0] + state->bonus[0] +
                                state->scores[1] + state->bonus[1] +
                                state->scores[2] + state->bonus[2] +
                                state->scores[3] + state->bonus[3];

            if(blokus.playerNames[p])
            {
               s = blokus.playerNames[p];
               len = strlen(s);
               surface.WriteText(x, 140, s, len);
            }

            s = temp; sprintf(temp, "%d", grandTotals[p]);
            len = strlen(s);
            surface.WriteText(x + 30, 160, s, len);
         }
      }
      if(state->numPlayers > 1)
      {
         char string[256];
         int c, greatest = -MAXINT;
         int numTies = 0, ties[3], winner;

         string[0] = 0;
         for(c = 0; c < state->numPlayers; c++)
         {
            if(grandTotals[c] > greatest)
            {
               greatest = grandTotals[c];
               numTies = 0;
               winner = c;
            }
            else if(grandTotals[c] == greatest)
            {
               if(!numTies)
               {
                  numTies = 1;
                  ties[0] = winner;
               }
               ties[numTies++] = c;
            }
         }
         if(numTies)
         {
            for(c = 0; c < numTies; c++)
            {
               strcat(string, blokus.playerNames[c]);
               if(c < numTies-2)
                  strcat(string, ", ");
               else if(c < numTies-1)
                  strcat(string, " and ");
            }
            surface.foreground = white;
            strcat(string, " tied!");
         }
         else
         {
            surface.foreground = colors[1][(PlayerColor)winner];
            sprintf(string, "%s won!", blokus.playerNames[winner]);
         }

         len = strlen(string);
         surface.WriteText(100, 180, string, strlen(string));
      }
   }
}

BlokusScores scoresPanel { visible = false };

Blokus blokus { };

class BlokusApp : GuiApplication
{
   bool Init()
   {
      blokus.Create();
      panel.Create();
      return true;
   }

   bool Cycle(bool idle)
   {
      // This is here because it hangs in MovePlayed() (Why?)
      scoresPanel.visible = blokus.gameStarted && blokus.gameState.over;
      return true;
   }
   void Terminate()
   {
      if(hosting)
         blokusService.Stop();
   }
}

import remote "BlokusServer"

define app = ((BlokusApp)__thisModule.application);

define BLOKUS_PORT = 1495;
static bool hosting;
define MaxPlayers = 4;

class CommunicationPanel : Window
{
   text = "Blokus Communication Panel";
   background = lightSlateGray;
   borderStyle = fixed;
   hasClose = true;
   tabCycle = true;
   size = { 400, 300 };
   anchor = { horz = -3, vert = -7 };
   nativeDecorations = true;

   ServerConnection server;

   // Other player info
   char playerNames[MaxPlayers][256];

   DataField fldName { header = "Name", width = 100 };
   DataField fldAddr { header = "Address" };

   void OnDestroy()
   {
      app.Unlock();
      if(hosting)
         blokusService.Stop();
      app.Lock();

      if(panel.server)
         panel.server.Disconnect(0);
      blokus.Destroy(0);
   }

   CommunicationPanel()
   {
      listPlayers.AddField(fldName);
      listPlayers.AddField(fldAddr);
   }

   ~CommunicationPanel()
   {
      delete server;
   }

   void ListPlayers()
   {
      int c;
      listPlayers.Clear();
      fldAddr.header = hosting ? "Address" : "";
      for(c = 0; c<MaxPlayers; c++)
      {
         if(hosting)
         {
            if(serverPlayers[c])
            {
               DataRow row = listPlayers.AddRow();
               DCOMServerObject object = (DCOMServerObject)serverPlayers[c].connection._vTbl[-1];

               row.tag = serverPlayers[c].id;
               row.SetData(fldName, serverPlayers[c].name);
               row.SetData(fldAddr, object.serverSocket.inetAddress);
            }
         }
         else if(playerNames[c][0])
         {
            DataRow row = listPlayers.AddRow();
            row.SetData(fldName, playerNames[c]);
         }
      }
   }

   void UpdateControlsStates()
   {
      int numPlayers = 0;
      if(hosting && !serverGameStarted)
      {
         int c;
         for(c = 0; c<MaxPlayers; c++)
            if(serverPlayers[c])
               numPlayers++;
      }
      lblServerAddress.disabled = serverAddress.disabled = server ? true : false;
      lblPlayerName.disabled = playerName.disabled = server ? true : false;
      lblServerAddress.Update(null);
      lblPlayerName.Update(null);
      btnConnect.visible = server ? false : true;
      btnDisconnect.visible = server ? true : false;
      blokus.chat.visible = server ? true : false;

      btnHost.visible = !hosting && !server;
      btnStopHosting.visible = hosting;
      btnStart.visible = hosting && !serverGameStarted && numPlayers > 0;
      btnStopGame.visible = hosting && serverGameStarted;
      listPlayers.visible = (hosting && (serverGameStarted || numPlayers > 0)) || (!hosting && server && blokus.gameStarted);
      btnKick.visible = hosting && !serverGameStarted && numPlayers > 0;
      btnKick.disabled = listPlayers.currentRow ? false : true;
   }
   EditBox serverAddress
   {
      this, text = "Server Address:", altA, font = { "Tahoma", 10, bold = true }, size = { 220, 24 }, position = { 16, 64 }, contents = "localhost"
   };
   Label lblServerAddress { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 40 }, labeledWindow = serverAddress };
   Button btnConnect
   {
      this, text = "Connect", altC, isDefault = true, font = { "Arial", 16, bold = true }, size = { 126, 32 }, position = { 256, 64 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!server)
         {
            server = ServerConnection
            {
               void OnDisconnect(int code)
               {
                  app.Lock();
                  if(blokus)
                  {
                     delete panel.server;
                     blokus.gameStarted = false;
                     blokus.turnLightTimer.Stop();
                     blokus.lightValue = 1;
                     blokus.lightDir = -.1f;
                     blokus.Update(null);
                     panel.UpdateControlsStates();
                     panel.ListPlayers();
                  }
                  DCOMClientObject::OnDisconnect(code);
                  app.Unlock();
               }

               void GameStarted(GameInfo gameInfo)
               {
                  int x,y;
                  int c, np = 0;

                  blokus.gameState.numPlayers = gameInfo.numPlayers;
                  blokus.firstColor = gameInfo.firstColor;
                  blokus.colorPlayed = blokus.firstColor;

                  for(c = 0; c<MaxPlayers; c++)
                  {
                     if(gameInfo.players[c][0])
                        strcpy(panel.playerNames[np++], gameInfo.players[c]);
                  }

                  blokus.btnPass.visible = false;
                  blokus.gameState.NewGame();
                  blokus.passed[0] = false;
                  blokus.passed[1] = false;
                  blokus.passed[2] = false;
                  blokus.passed[3] = false;
                  blokus.gameStarted = true;
                  blokus.lightValue = 1;
                  blokus.lightDir = -.1f;
                  blokus.turnLightTimer.Start();
                  blokus.UpdatePlayerNames();

                  blokus.Update(null);

                  panel.UpdateControlsStates();
                  panel.ListPlayers();
               }

               void GameEnded()
               {
                  int c;

                  panel.ListPlayers();

                  blokus.gameStarted = false;
                  blokus.Update(null);
               }

               void MovePlayed(PlayerColor color, int pieceType, int direction, bool flip, int boardX, int boardY)
               {
                  blokus.gameState.PlayMove(pieceType, direction, flip, boardX, boardY);
                  if(color == blokus.colorPlayed)
                     blokus.NextColorPlayed();

                  if(blokus.colorPlayed == blokus.gameState.colorTurn &&
                     !blokus.gameState.validMove && !blokus.gameState.over)
                  {
                     if(!blokus.passed[blokus.gameState.colorTurn])
                        blokus.btnPass.visible = true;
                     else
                        panel.server.Pass();
                  }

                  // This hangs here, why?
                  /*if(blokus.gameState.over)
                     scoresPanel.visible = true;*/
                  if(blokus)
                  {
                     blokus.UpdatePlayerNames();
                     blokus.Update(null);
                  }
               }

               void Passed(PlayerColor color)
               {
                  blokus.gameState.Pass();
                  if(color == blokus.colorPlayed)
                     blokus.NextColorPlayed();

                  if(blokus.colorPlayed == blokus.gameState.colorTurn &&
                     !blokus.gameState.validMove && !blokus.gameState.over)
                  {
                     if(!blokus.passed[blokus.gameState.colorTurn])
                        blokus.btnPass.visible = true;
                     else
                        panel.server.Pass();
                  }

                  if(blokus)
                  {
                     blokus.UpdatePlayerNames();
                     blokus.Update(null);
                  }
               }

               void NotifyMessage(String name, String msg)
               {
                  EditBox log = blokus.chat.log;
                  char * format = (log.numLines > 1 || log.line.count) ?
                     "\n%s: %s" : "%s: %s";
                  blokus.chat.Log(format, name, msg);
               }
            };
            incref panel.server;
            if(panel.server.Connect(serverAddress.contents, BLOKUS_PORT))
            {
               int playerID = panel.server.Join();
               if(panel.server && playerID != -1)
                  panel.server.SetName(playerName.contents);
               else
                  panel.server.Disconnect(0);
               UpdateControlsStates();
            }
            else
               delete panel.server;
         }
         return true;
      }
   };
   Button btnDisconnect
   {
      this, text = "Disconnect", altD, font = { "Arial", 16, bold = true }, size = { 126, 32 }, position = { 256, 64 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(panel.server)
            panel.server.Disconnect(0);
         return true;
      }
   };
   Button btnHost
   {
      this, text = "Host", altH, font = { "Arial", 16, bold = true }, size = { 90, 32 }, position = { 16, 112 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!blokus.gameStarted)
         {
            if(blokusService.Start())
            {
               hosting = true;
               Update(null);
               UpdateControlsStates();
            }
         }
         return true;
      }
   };
   Button btnStopHosting
   {
      this, text = "Stop Hosting", altP, font = { "Arial", 16, bold = true }, position = { 16, 112 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         app.Unlock();
         blokusService.Stop();
         app.Lock();
         hosting = false;
         Update(null);
         UpdateControlsStates();
         return true;
      }
   };
   Button btnStart
   {
      this, text = "Start Game", altS, font = { "Arial", 16, bold = true }, size = { 124, 32 }, position = { 256, 112 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(hosting)
         {
            StartGame();
            UpdateControlsStates();
         }
         return true;
      }
   };
   Button btnStopGame
   {
      this, text = "Stop Game", altG, font = { "Arial", 16, bold = true }, position = { 256, 112 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         EndGame();
         UpdateControlsStates();
         return true;
      }
   };
   ListBox listPlayers
   {
      this, text = "Players Connected", altD, size = { 236, 84 }, position = { 16, 176 }, visible = false, hasHeader = true;

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         UpdateControlsStates();
         return true;
      }
   };
   Label lblListPlayers { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 152 }, visible = false, labeledWindow = listPlayers };
   Button btnKick
   {
      this, text = "Kick", altK, font = { "Arial", 16, bold = true }, size = { 80, 32 }, position = { 264, 224 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow row = listPlayers.currentRow;
         if(row)
            KickPlayer(row.tag);
         return true;
      }
   };
   EditBox playerName
   {
      this, text = "Player Name:", altN, font = { "Arial", 12 }, size = { 132, 24 }, position = { 104, 8 }, contents = "BlokusPlayer"
   };
   Label lblPlayerName { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 16 }, labeledWindow = playerName };
}

CommunicationPanel panel { };

DCOMService blokusService { port = BLOKUS_PORT };
