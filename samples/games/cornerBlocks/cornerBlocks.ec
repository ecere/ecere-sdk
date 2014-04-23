import "ecere"
import "console"
public enum CornerBlocksColor : byte { none, blue, yellow, red, green };

public enum PlayerColor : byte
{
   blue, yellow, red, green;
   property CornerBlocksColor
   {
      // TOFIX: get { return (CornerBlocksColor)((int)this+1); }
      get { return (CornerBlocksColor)*(int *)&this+1; }
   }
};

static Color colors[2][CornerBlocksColor] =
{
   // TOFIX: (omitting Color { })
   { 0, Color { 64, 64, 96 }, Color { 141, 114, 48 }, Color { 96, 32, 32 }, Color { 64, 96, 64 } },
   { 0, blue, goldenrod, red, green }
};
Point corners[PlayerColor] =
{
   { 0, 0 },
   { boardSize-1, 0 },
   { boardSize-1, boardSize-1 },
   { 0, boardSize-1 }
};

define numPieces = 21;
#ifdef _DEBUG
define boardSize = 20; //10;
#else
define boardSize = 20;
#endif

#if defined(HIGH_DPI)
define squareWidth = 60;
define boardStartX = 20;
define boardStartY = 30;
define piecesY = 20;
define blockOffset0 = 4;
define blockOffset1 = 10;
define blockOffset2 = 30;
define blockOffset3 = 36;
#else
define squareWidth = 28;
define blockOffset0 = 2;
define blockOffset1 = 5;
define blockOffset2 = 15;
define blockOffset3 = 18;
define boardStartX = 20;
define boardStartY = 30;
define piecesY = 20;
#endif

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

struct CornerBlocksGameState
{
   byte playerPieces[PlayerColor][numPieces];
   bool firstPiece[PlayerColor];
   CornerBlocksColor board[boardSize * boardSize];
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
      for(i = 0; i < boardSize * boardSize; i++)
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

      if(boardX < 0 || boardY < 0 || boardX + w > boardSize || boardY + h > boardSize) return false;

      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
            if(PieceBlock(selectedPiece, x, y, direction, flip))
            {
               int bx = x + boardX, by = y + boardY;
               if(board[by * boardSize + bx] ||
                  (by > 0    && board[(by-1) * boardSize + bx] == playerColor) ||
                  (by < boardSize-1 && board[(by+1) * boardSize + bx] == playerColor) ||
                  (bx > 0    && board[by * boardSize + bx - 1] == playerColor) ||
                  (bx < boardSize-1 && board[by * boardSize + bx + 1] == playerColor))
               {
                  valid = false;
                  break;
               }
               if((by > 0     && bx > 0    && board[(by-1) * boardSize + (bx-1)] == playerColor) ||
                  (by > 0     && bx < boardSize-1 && board[(by-1) * boardSize + (bx+1)] == playerColor) ||
                  (by < boardSize-1  && bx > 0    && board[(by+1) * boardSize + (bx-1)] == playerColor) ||
                  (by < boardSize-1  && bx < boardSize-1 && board[(by+1) * boardSize + (bx+1)] == playerColor))
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
            for(y = 0; y < boardSize && !validMove; y++)
            {
               for(x = 0; x < boardSize && !validMove; x++)
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
               board[(y + boardY) * boardSize + x + boardX] = colorTurn;
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

class CornerBlocks : Window
{
   caption = "Ecere Corner Blocks";
   background = black;
   minClientSize = { 1068 /*800*/, 700 };
#ifdef __ANDROID__
   anchor = { 0, 0, 0, 0 };
#else
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 1276, 708 };
#endif
   font = { "Arial", 12, bold = true };
   FontResource yourTurnFont { "Arial", 12, bold = true, italic = true, window = this };
   icon = { ":ollie.png" };

   ServerConnection server;

   bool gameStarted;
   PlayerColor firstColor;
   char *playerNames[MaxPlayers];

   // Current game state
   CornerBlocksGameState gameState;

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

#ifdef _DEBUG
   Timer timer
   {
      this, delay = 0.1;
      // started = true;
      bool DelayExpired()
      {
         if(server)
            server.SendMessage("Hello :)");
         return true;
      }
   };

   Timer timerPlay
   {
      this, delay = 0.05;
      // started = true;
      bool DelayExpired()
      {
         if(server)
         {
            if(gotMove && gameStarted && colorPlayed == gameState.colorTurn)
            {
               if(btnPass.visible)
                  btnPass.NotifyClicked(this, btnPass, 0, 0, 0);
               else if(gameState.validMove)
               {
                  while(true)
                  {
                     int p = GetRandom(0, numPieces);
                     if(gameState.validPieces[p])
                     {
                        bool validMove = false;
                        int x, y;
                        for(y = 0; y < boardSize && !validMove; y++)
                        {
                           for(x = 0; x < boardSize && !validMove; x++)
                           {
                              int flip;
                              int direction;
                              for(direction = 0; direction < 4 && !validMove; direction++)
                              {
                                 for(flip = 0; flip <=1 && !validMove; flip++)
                                 {
                                    if(gameState.ValidMove(colorPlayed, p, direction, flip, x, y))
                                    {
                                       bool result;
                                       gotMove = false;
                                       result = server.PlayPiece(p, direction, flip, x, y);
                                       validMove = true;
                                    }
                                 }
                              }
                           }
                        }
                        break;
                     }
                  }
               }
            }
         }
         return true;
      }
   };
   bool gotMove;
   gotMove = true;
#endif

#ifdef __WIN32__
   // To work around Flash() lockups on Windows...
   bool flash;
   Timer flashTimer
   {
      this, delay = 0.2, true;

      bool DelayExpired()
      {
         if(flash)
            Window::Flash();
         flash = false;
         return true;
      }
   };

   void Flash()
   {
      flash = true;
   }
#endif

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

   void DrawSquare(Surface surface, int x, int y, CornerBlocksColor color, int shade)
   {
      surface.background = colors[shade][color];
      surface.Area(x+1, y+1, x + squareWidth-1, y + squareWidth-1);
      surface.foreground = lightGray;
      surface.VLine(y+blockOffset1, y + blockOffset2, x + blockOffset1);
      surface.HLine(x+blockOffset1, x + blockOffset3, y + blockOffset1);
      surface.foreground = white;
      surface.Rectangle(x + blockOffset0,y+blockOffset0, x + squareWidth-blockOffset0, y + squareWidth - blockOffset0);
   }

   bool OnClose(bool parentClosing)
   {
      if((gameStarted && !gameState.over) || hosting)
      {
         if(MessageBox { type = okCancel,
            caption = "Ecere CornerBlocks", contents = "Quit Ecere CornerBlocks?" }.Modal() == cancel)
            return false;
      }
      return true;
   }

   void OnDestroy()
   {
      if(server)
         server.Disconnect(0);

      panel.Destroy(0);
      scoresPanel.Destroy(0);
   }

   ~CornerBlocks()
   {
      delete server;
   }

   bool OnMouseMove(int mx, int my, Modifiers mods)
   {
      if(dragging)
      {
         Piece * piece = &pieces[selectedPiece];
         int w = (direction & 1) ? piece->h : piece->w;
         int h = (direction & 1) ? piece->w : piece->h;
         drag = { offset.x + mx, offset.y + my };

         if(mx - squareDragged.x * squareWidth >= boardStartX - 10 && mx - squareDragged.x * squareWidth < boardStartX + ((boardSize-w)+1) * squareWidth + 10 &&
            my - squareDragged.y * squareWidth >= boardStartY - 10 && my - squareDragged.y * squareWidth < boardStartY + ((boardSize-h)+1) * squareWidth + 10)
         {
            int x, y;
            x = Max(0,mx - squareDragged.x * squareWidth - boardStartX) / squareWidth;
            y = Max(0,my - squareDragged.y * squareWidth - boardStartY) / squareWidth;
            x = Min(x, boardSize-w);
            y = Min(y, boardSize-h);
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
                  server.PlayPiece(selectedPiece, direction, flip, boardPos.x, boardPos.y);
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

   bool OnSysKeyDown(Key key, unichar ch)
   {
      // Temporarily disable chat when dragging to get Android arrow keys
      if(dragging)
         chat.disabled = true;
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      chat.disabled = false;
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(key == space)
      {
         OnRightButtonDown(drag.x - offset.x, drag.y - offset.y, 0);
      }
      if(key == wheelDown || key == down || key == left || key == wheelUp || key == up || key == right)
      {
         Piece * piece = &pieces[selectedPiece];
         int mx = drag.x - offset.x, my = drag.y - offset.y;
         int rx, ry;
         int x = squareDragged.x, y = squareDragged.y;
         int w,h;
         bool isDown = key == wheelDown || key == right || key == down;

         if(isDown)
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
         if(isDown)
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
      if( mx > squareWidth * boardSize + 40)
      {
         int bx, by;
         bool selected = false;
         int pieceNum = 0;
         Point offset;
         int rh = 0;
         int c;
         // Draw Player Pieces
         bx = squareWidth * boardSize + 40;
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
                  bx = squareWidth * boardSize + 40;
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
      for(c = 0; c <= boardSize; c++)
      {
         surface.HLine(bx,bx+squareWidth*boardSize, by + c * squareWidth);
         surface.VLine(by,by+squareWidth*boardSize, bx + c * squareWidth);
      }

      surface.background = colors[cornerBlocks.gameStarted][blue];
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

      surface.background = colors[cornerBlocks.gameStarted][yellow];
      x = bx + boardSize*squareWidth;
      y = by;
      surface.Area(x - 10, y - 10, x + 10, y-1);
      surface.Area(x + 1, y - 10, x + 10,  y+10);

      s = playerNames[PlayerColor::yellow];
      if(s)
      {
         len = strlen(s);
         surface.TextExtent(s, len, &tw, null);
         surface.foreground = (gameState.colorTurn == yellow) ? turnLight : white;
         surface.WriteText(x - 15 - tw, y - 20, s, len);
      }

      surface.background = colors[cornerBlocks.gameStarted][red];
      x = bx + boardSize*squareWidth;
      y = by + boardSize*squareWidth;
      surface.Area(x - 10, y + 1, x + 10, y+10);
      surface.Area(x + 1, y - 10, x + 10,  y+10);
      s = playerNames[PlayerColor::red];
      if(s)
      {
         len = strlen(s);
         surface.TextExtent(s, len, &tw, null);
         surface.foreground = (gameState.colorTurn == red) ? turnLight : white;
         surface.WriteText(x - 15 - tw, y, s, len);
      }

      surface.background = colors[cornerBlocks.gameStarted][green];
      x = bx;
      y = by + boardSize*squareWidth;
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
         surface.CenterTextf(x + boardSize*squareWidth/2, y + 3, "Game Over");
      }
      else if(gameState.numPlayers > 1 && gameStarted && colorPlayed == gameState.colorTurn)
      {
         surface.font = yourTurnFont.font;
         surface.foreground = tomato;
         surface.CenterTextf(x + boardSize*squareWidth/2, y + 3, "Your turn");
      }

      for(y = 0; y < boardSize; y++)
      {
         for(x = 0; x < boardSize; x++)
         {
            CornerBlocksColor color = gameState.board[y * boardSize + x];
            if(color)
            {
               DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, color, cornerBlocks.gameStarted);
            }
         }
      }

      {
         int rh = 0;
         // Draw Player Pieces
         bx = squareWidth * boardSize + 40;
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
                           DrawSquare(surface,
                              bx + x * squareWidth,
                              by + y * squareWidth,
                              colorPlayed,
                              gameStarted && (gameState.colorTurn == colorPlayed && gameState.validPieces[c]));
                     }
                  }
               }
               if(h > rh) rh = h;
               bx += w * squareWidth + squareWidth;
               if(bx + 5 * squareWidth > clientSize.w)
               {
                  bx = squareWidth * boardSize + 40;
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
                     DrawSquare(surface,
                        drag.x + x * squareWidth,
                        drag.y + y * squareWidth,
                        colorPlayed,
                        gameStarted && gameState.colorTurn == colorPlayed && gameState.validPieces[selectedPiece]);

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
      this, size = { boardSize*squareWidth }, anchor = { left = boardStartX, top = boardStartY + boardSize*squareWidth + 20, bottom = 5 };
      font = { "Arial", 11, bold = true };
      editTextColor = white;
      logTextColor = white;
      editHeight = 24;
      log.hasVertScroll = bool::true;
      log.inactive = bool::true;
      visible = false;

      bool ProcessCommand(char * command)
      {
         cornerBlocks.server.SendMessage(command);
         return false;
      }
   };

   Button btnPass
   {
      this, caption = "No Move Available! Pass...",
      //anchor = { right = 5, bottom = 5 };
      anchor = { left = squareWidth * boardSize + 40, bottom = 5 };
      inactive = true;
      visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         btnPass.visible = false;
         cornerBlocks.passed[cornerBlocks.gameState.colorTurn] = true;
         server.Pass();
         return true;
      }

   };
}

class CornerBlocksScores : Window
{
   master = cornerBlocks;
   moveable = true;
   borderStyle = fixed;
   background = black;
   caption = "CornerBlocks Final Scores";
   clientSize = { 580, 210 };
   font = { "Arial", 12, bold = true };
   icon = { ":ollie.png" };
   void OnRedraw(Surface surface)
   {
      PlayerColor p;
      char * s;
      int len;
      char temp[256];
      int grandTotals[4];
      CornerBlocksGameState * state = &cornerBlocks.gameState;
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
         s = (state->numPlayers == 3 && p == green) ? "* Green *" : cornerBlocks.playerNames[p];
         len = strlen(s);
         surface.WriteText(x, 20, s, len);
         */
         if(state->numPlayers == 3 && p == green)
         {
            s = "* Green *";
            len = strlen(s);
            surface.WriteText(x, 20, s, len);
         }
         else if(cornerBlocks.playerNames[p])
         {
            s = cornerBlocks.playerNames[p];
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

            if(cornerBlocks.playerNames[p])
            {
               s = cornerBlocks.playerNames[p];
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
               strcat(string, cornerBlocks.playerNames[c]);
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
            sprintf(string, "%s won!", cornerBlocks.playerNames[winner]);
         }

         len = strlen(string);
         surface.WriteText(100, 180, string, strlen(string));
      }
   }
}

CornerBlocksScores scoresPanel { visible = false };

CornerBlocks cornerBlocks { };

class CornerBlocksApp : GuiApplication
{
   //fullScreen = true;
   bool Init()
   {
      cornerBlocks.Create();
      panel.Create();
      return true;
   }

   bool Cycle(bool idle)
   {
      // This is here because it hangs in MovePlayed() (Why?)
      scoresPanel.visible = cornerBlocks.gameStarted && cornerBlocks.gameState.over;
#ifdef _DEBUG
      /*if(cornerBlocks.gameState.over)
         panel.btnStart.NotifyClicked(panel, panel.btnStart, 0, 0, 0);*/
#endif
      return true;
   }
   void Terminate()
   {
      if(hosting)
         cornerBlocksService.Stop();
   }
}

import remote "CornerBlocksServer"

define app = ((CornerBlocksApp)__thisModule.application);

define CORNERBLOCKS_PORT = 1495;
static bool hosting;
define MaxPlayers = 4;

class CommunicationPanel : Window
{
   caption = "CornerBlocks Communication Panel";
   background = lightSlateGray;
   borderStyle = fixed;
   hasClose = true;
   tabCycle = true;
   clientSize = { 430, 300 };
#ifdef __ANDROID__
   anchor = { right = 0, bottom = 0 };
#endif
   icon = { ":ollie.png" };

   // Other player info
   char playerNames[MaxPlayers][256];

   DataField fldName { header = "Name", width = 100 };
   DataField fldAddr { header = "Address" };

   bool OnClose(bool parentClosing)
   {
      if(!cornerBlocks || cornerBlocks.destroyed || cornerBlocks.Destroy(0))
         return true;
      return false;
   }

   void OnDestroy()
   {
      app.Unlock();
      if(hosting)
         cornerBlocksService.Stop();
      app.Lock();
   }

   CommunicationPanel()
   {
      listPlayers.AddField(fldName);
      listPlayers.AddField(fldAddr);
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
      if(hosting)
      {
         int c;
         for(c = 0; c<MaxPlayers; c++)
            if(serverPlayers[c])
               numPlayers++;
      }
      lblServerAddress.disabled = serverAddress.disabled = cornerBlocks.server ? true : false;
      lblPlayerName.disabled = playerName.disabled = cornerBlocks.server ? true : false;
      lblServerAddress.Update(null);
      lblPlayerName.Update(null);
      btnConnect.visible = cornerBlocks.server ? false : true;
      btnDisconnect.visible = cornerBlocks.server ? true : false;
      cornerBlocks.chat.visible = cornerBlocks.server ? true : false;

      btnHost.visible = !hosting && !cornerBlocks.server;
      btnStopHosting.visible = hosting;
      btnStart.visible = hosting && (!serverGameStarted || serverGameState.over) && numPlayers > 0;
      btnStopGame.visible = hosting && (serverGameStarted && !serverGameState.over);
      listPlayers.visible = (hosting && (serverGameStarted || numPlayers > 0)) || (!hosting && cornerBlocks.server && cornerBlocks.gameStarted);
      btnKick.visible = hosting && !serverGameStarted && numPlayers > 0;
      btnKick.disabled = listPlayers.currentRow ? false : true;
   }
   EditBox serverAddress
   {
      this, caption = "Server Address:", altA, font = { "Tahoma", 10, bold = true }, size = { 220, 24 }, position = { 16, 64 }, contents = "localhost"
   };
   Label lblServerAddress { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 40 }, labeledWindow = serverAddress };
   Button btnConnect
   {
      this, caption = "Connect", altC, isDefault = true, font = { "Arial", 16, bold = true }, size = { 126, 32 }, position = { 256, 64 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!cornerBlocks.server)
         {
            cornerBlocks.server = ServerConnection
            {
               void OnDisconnect(int code)
               {
                  app.Lock();
                  if(cornerBlocks)
                  {
                     delete cornerBlocks.server;
                     cornerBlocks.gameStarted = false;
                     cornerBlocks.turnLightTimer.Stop();
                     cornerBlocks.lightValue = 1;
                     cornerBlocks.lightDir = -.1f;
                     cornerBlocks.Update(null);
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

                  cornerBlocks.gameState.numPlayers = gameInfo.numPlayers;
                  cornerBlocks.firstColor = gameInfo.firstColor;
                  cornerBlocks.colorPlayed = cornerBlocks.firstColor;

                  for(c = 0; c<MaxPlayers; c++)
                  {
                     if(gameInfo.players[c][0])
                        strcpy(panel.playerNames[np++], gameInfo.players[c]);
                  }

                  cornerBlocks.btnPass.visible = false;
                  cornerBlocks.gameState.NewGame();
                  cornerBlocks.passed[0] = false;
                  cornerBlocks.passed[1] = false;
                  cornerBlocks.passed[2] = false;
                  cornerBlocks.passed[3] = false;
                  cornerBlocks.gameStarted = true;
                  cornerBlocks.lightValue = 1;
                  cornerBlocks.lightDir = -.1f;
                  cornerBlocks.turnLightTimer.Start();
                  cornerBlocks.UpdatePlayerNames();

                  cornerBlocks.Update(null);

                  panel.UpdateControlsStates();
                  panel.ListPlayers();
               }

               void GameEnded()
               {
                  int c;

                  panel.ListPlayers();
                  cornerBlocks.gameStarted = false;
                  cornerBlocks.btnPass.visible = false;
                  cornerBlocks.Update(null);
               }

               void MovePlayed(PlayerColor color, int pieceType, int direction, bool flip, int boardX, int boardY)
               {
                  cornerBlocks.gameState.PlayMove(pieceType, direction, flip, boardX, boardY);
                  if(color == cornerBlocks.colorPlayed)
                     cornerBlocks.NextColorPlayed();
#ifdef _DEBUG
                  cornerBlocks.gotMove = true;
#endif
                  if(cornerBlocks.colorPlayed == cornerBlocks.gameState.colorTurn && !cornerBlocks.gameState.over)
                  {
                     if(!cornerBlocks.gameState.validMove)
                     {
                        if(!cornerBlocks.passed[cornerBlocks.gameState.colorTurn])
                        {
                           cornerBlocks.btnPass.visible = true;
                           if(!cornerBlocks.active)
                              cornerBlocks.Flash();
                        }
                        else
                           cornerBlocks.server.Pass();
                     }
                     else if(!cornerBlocks.active)
                        cornerBlocks.Flash();
                  }

                  // This hangs here, why?
                  /*if(cornerBlocks.gameState.over)
                     scoresPanel.visible = true;*/
                  if(cornerBlocks)
                  {
                     cornerBlocks.UpdatePlayerNames();
                     cornerBlocks.Update(null);
                  }
               }

               void Passed(PlayerColor color)
               {
                  cornerBlocks.gameState.Pass();
                  if(color == cornerBlocks.colorPlayed)
                     cornerBlocks.NextColorPlayed();
                  else if(!cornerBlocks.active)
                     cornerBlocks.Flash();

                  if(cornerBlocks.colorPlayed == cornerBlocks.gameState.colorTurn && !cornerBlocks.gameState.over)
                  {
                     if(!cornerBlocks.gameState.validMove)
                     {
                        if(!cornerBlocks.passed[cornerBlocks.gameState.colorTurn])
                        {
                           cornerBlocks.btnPass.visible = true;
                           if(!cornerBlocks.active)
                              cornerBlocks.Flash();
                        }
                        else
                           cornerBlocks.server.Pass();
                     }
                     else if(!cornerBlocks.active)
                        cornerBlocks.Flash();
                  }

                  if(cornerBlocks)
                  {
                     cornerBlocks.UpdatePlayerNames();
                     cornerBlocks.Update(null);
                  }
               }

               void NotifyMessage(String name, String msg)
               {
                  EditBox log = cornerBlocks.chat.log;
                  char * format = (log.numLines > 1 || log.line.count) ?
                     "\n%s: %s" : "%s: %s";
                  int len = strlen(msg);
                  // Avoid buffer overflow...
                  if(len >= MAX_F_STRING-100)
                     msg[MAX_F_STRING-100] = 0;
                  cornerBlocks.chat.Log(format, name, msg);
               }
            };
            incref cornerBlocks.server;
            if(cornerBlocks.server.Connect(serverAddress.contents, CORNERBLOCKS_PORT))
            {
               int playerID = cornerBlocks.server.Join();
               if(cornerBlocks.server && playerID != -1)
                  cornerBlocks.server.SetName(playerName.contents);
               else
                  cornerBlocks.server.Disconnect(0);
               UpdateControlsStates();
            }
            else
               delete cornerBlocks.server;
         }
         return true;
      }
   };
   Button btnDisconnect
   {
      this, caption = "Disconnect", altD, font = { "Arial", 16, bold = true }, size = { 126, 32 }, position = { 256, 64 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!cornerBlocks.gameStarted || cornerBlocks.gameState.over ||
            MessageBox { type = okCancel, caption = "Ecere Corner Blocks",
               contents = "Game in progress! Disconnect?"
            }.Modal() == ok)
         {
            if(cornerBlocks.server)
               cornerBlocks.server.Disconnect(0);
         }
         return true;
      }
   };
   Button btnHost
   {
      this, caption = "Host", altH, font = { "Arial", 16, bold = true }, size = { 90, 32 }, position = { 16, 112 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!cornerBlocks.gameStarted)
         {
            if(cornerBlocksService.Start())
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
      this, caption = "Stop Hosting", altP, font = { "Arial", 16, bold = true }, position = { 16, 112 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         int numPlayers = 0;
         int c;
         for(c = 0; c<MaxPlayers; c++)
            if(serverPlayers[c])
               numPlayers++;
         if(!numPlayers ||
            MessageBox { type = okCancel, caption = "Ecere Corner Blocks",
               contents = "Players connected! Stop hosting?"
            }.Modal() == ok)
         {
            app.Unlock();
            cornerBlocksService.Stop();
            app.Lock();
            hosting = false;
            Update(null);
            UpdateControlsStates();
         }
         return true;
      }
   };
   Button btnStart
   {
      this, caption = "Start Game", altS, font = { "Arial", 16, bold = true }, size = { 124, 32 }, position = { 256, 112 }, visible = false;

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
      this, caption = "Stop Game", altG, font = { "Arial", 16, bold = true }, position = { 256, 112 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!serverGameStarted || serverGameState.over ||
            MessageBox { type = okCancel, caption = "Ecere Corner Blocks",
               contents = "Stop game in progress?"
            }.Modal() == ok)
         {
            EndGame();
            UpdateControlsStates();
         }
         return true;
      }
   };
   ListBox listPlayers
   {
      this, caption = "Players Connected", altD, size = { 236, 84 }, position = { 16, 176 }, visible = false, hasHeader = true;

      bool NotifySelect(ListBox listBox, DataRow row, Modifiers mods)
      {
         UpdateControlsStates();
         return true;
      }
   };
   Label lblListPlayers { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 152 }, visible = false, labeledWindow = listPlayers };
   Button btnKick
   {
      this, caption = "Kick", altK, font = { "Arial", 16, bold = true }, size = { 80, 32 }, position = { 264, 224 }, visible = false;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         DataRow row = listPlayers.currentRow;
         if(row)
         {
            int id = (int)row.tag;
            char msg[1024];
            sprintf(msg, "Kick %s?", serverPlayers[id].name);
            if(MessageBox { type = okCancel, caption = "Ecere Corner Blocks",
                  contents = msg
               }.Modal() == ok)
               KickPlayer(id);
         }
         return true;
      }
   };
   EditBox playerName
   {
      this, caption = "Player Name:", altN, font = { "Arial", 12 }, size = { 132, 24 }, position = { 104, 8 }, contents = "Player"
   };
   Label lblPlayerName { this, font = { "Tahoma", 8.25f, bold = true }, position = { 16, 16 }, labeledWindow = playerName };
}

CommunicationPanel panel { };

DCOMService cornerBlocksService { port = CORNERBLOCKS_PORT };
