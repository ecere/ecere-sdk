import "ecere"

import remote "BlokusServer"

define BLOKUS_PORT = 1495;
static bool hosting;

define MaxPlayers = 4;

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
define squareWidth = 30;

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
      }
      for(i = 0; i < bs * bs; i++)
         board[i] = none;

      colorTurn = blue;
      rotatingColor = blue;
   }

   bool ValidMove(int selectedPiece, int direction, bool flip, int boardX, int boardY)
   {
      Piece * piece = &pieces[selectedPiece];
      int x, y;
      bool valid = true;
      bool touchCorner = false;

      // TODO: Add check whether player color has this particular piece

      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
            if(PieceBlock(selectedPiece, x, y, direction, flip))
            {
               int bx = x + boardX, by = y + boardY;
               if(board[by * bs + bx] ||
                  (by > 0    && board[(by-1) * bs + bx] == colorTurn) ||
                  (by < bs-1 && board[(by+1) * bs + bx] == colorTurn) ||
                  (bx > 0    && board[by * bs + bx - 1] == colorTurn) ||
                  (bx < bs-1 && board[by * bs + bx + 1] == colorTurn))
               {
                  valid = false;
                  break;
               }
               if((by > 0     && bx > 0    && board[(by-1) * bs + (bx-1)] == colorTurn) ||
                  (by > 0     && bx < bs-1 && board[(by-1) * bs + (bx+1)] == colorTurn) ||
                  (by < bs-1  && bx > 0    && board[(by+1) * bs + (bx-1)] == colorTurn) ||
                  (by < bs-1  && bx < bs-1 && board[(by+1) * bs + (bx+1)] == colorTurn))
                  touchCorner = true;
            }
      if(valid && firstPiece[colorTurn])
      {
         for(y = 0; y < 5; y++)
            for(x = 0; x < 5; x++)
               if(PieceBlock(selectedPiece, x, y, direction, flip))
               {
                  int bx = x + boardX, by = y + boardY;
                  if(bx == corners[colorTurn].x && by == corners[colorTurn].y)
                  {
                     touchCorner = true;
                     break;
                  }
               }
      }

      return valid && touchCorner;
   }

   void PlayMove(int pieceType, int direction, bool flip, int boardX, int boardY)
   {
      int y, x;
      for(y = 0; y < 5; y++)
         for(x = 0; x < 5; x++)
            if(PieceBlock(pieceType, x, y, direction, flip))
               board[(y + boardY) * bs + x + boardX] = colorTurn;
      playerPieces[colorTurn][pieceType] = 0;

      firstPiece[colorTurn] = false;
      if(numPlayers == 3 && colorTurn == green)
      {
         if(++rotatingColor == green) rotatingColor = 0;
      }
      if(++colorTurn > green) colorTurn = 0;
   }

   void Pass()
   {
      if(numPlayers == 3 && colorTurn == green)
      {
         if(++rotatingColor == green) rotatingColor = 0;
      }
      if(++colorTurn > green) colorTurn = 0;
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

   ServerConnection server;

   // Other player info
   char playerNames[MaxPlayers][256];
   bool gameStarted;
   PlayerColor firstColor;

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

   void DrawSquare(Surface surface, int x, int y, BlokusColor color)
   {
      surface.background = colors[blokus.gameStarted][color];
      surface.Area(x+1, y+1, x + squareWidth-1, y + squareWidth-1);      
      surface.foreground = lightGray;
      surface.VLine(y+5, y + 15, x + 5);
      surface.HLine(x+5, x + 18, y + 5);
      surface.foreground = white;
      surface.Rectangle(x + 2,y+2, x + squareWidth-2, y + squareWidth - 2);
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
            if(gameStarted && colorPlayed == gameState.colorTurn)
            {
               Piece * piece = &pieces[selectedPiece];
               if(gameState.ValidMove(selectedPiece, direction, flip, boardPos.x, boardPos.y))
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

   void OnRedraw(Surface surface)
   {
      int c;
      int bx = 20;
      int by = 20;
      int x, y;
      
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

      surface.background = colors[blokus.gameStarted][yellow];
      x = bx + bs*squareWidth;
      y = by;
      surface.Area(x + 10, y - 10, x - 10, y-1);
      surface.Area(x + 10, y - 10, x + 1,  y+10);

      surface.background = colors[blokus.gameStarted][red];
      x = bx + bs*squareWidth;
      y = by + bs*squareWidth;
      surface.Area(x + 10, y + 1, x - 10, y+10);
      surface.Area(x + 10, y - 10, x + 1,  y+10);

      surface.background = colors[blokus.gameStarted][green];
      x = bx;
      y = by + bs*squareWidth;
      surface.Area(x - 10, y + 1, x + 10, y+10);
      surface.Area(x - 10, y - 10, x - 1,  y+10);

      for(y = 0; y < bs; y++)
      {
         for(x = 0; x < bs; x++)
         {
            BlokusColor color = gameState.board[y * bs + x];
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
                           DrawSquare(surface, bx + x * squareWidth, by + y * squareWidth, colorPlayed);
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
                     DrawSquare(surface, drag.x + x * squareWidth, drag.y + y * squareWidth, colorPlayed);
                     
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
         server.Pass();
         return true;
      }

   };

   Button hostBtn
   {
      this, text = "Host", bevel = false, anchor = { right = 20, top = 122 };
      foreground = white;
      font = { "Arial", 16, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!blokus.gameStarted)
         {
            blokusService.Stop();

            scores.Clear();
            scores.ClearFields();
            blokusService.Start();
            Update(null);

            hosting = true;
         }
         return true;
      }
   };
   Button connectBtn
   {
      this, text = "Connect", bevel = false, anchor = { right = 20, top = 222 };
      font = { "Arial", 20, true };
      foreground = white;
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(!server)
         {
            server = ServerConnection
            {
               void OnDisconnect(int code)
               {
                  if(blokus)
                  {
                     delete blokus.server;
                     blokus.gameStarted = false;
                     blokus.Update(null);
                  }
                  DCOMClientObject::OnDisconnect(code);
               }

               void GameStarted(GameInfo gameInfo)
               {
                  int x,y;
                  int c;
                  blokus.scores.Clear();
                  blokus.scores.ClearFields();

                  blokus.gameState.numPlayers = gameInfo.numPlayers;
                  blokus.firstColor = gameInfo.firstColor;
                  blokus.colorPlayed = blokus.firstColor;

                  for(c = 0; c<MaxPlayers; c++)
                  {
                     strcpy(blokus.playerNames[c], gameInfo.players[c]);
                     blokus.scoreFields[c] = null;

                     if(blokus.playerNames[c][0])
                        blokus.scores.AddField(blokus.scoreFields[c] = DataField { dataType = class(int), header = blokus.playerNames[c], width = 40 });
                  }

                  blokus.gameState.NewGame();
                  blokus.gameStarted = true;

                  blokus.Update(null);
               }

               void GameEnded()
               {
                  int c;
                  blokus.scores.Clear();
                  blokus.scores.ClearFields();
                  for(c = 0; c<MaxPlayers; c++)
                     blokus.scoreFields[c] = null;

                  blokus.gameStarted = false;
                  blokus.Update(null);

                  // Reset to connected players for host to know
                  if(hosting)
                  {
                     for(c = 0; c<MaxPlayers; c++)
                     {
                        if(serverPlayers[c])
                           blokus.scores.AddField(blokus.scoreFields[c] = DataField { dataType = class(int), header = serverPlayers[c].name, width = 40 });
                     }
                  }
               }

               void MovePlayed(PlayerColor color, int pieceType, int direction, bool flip, int boardX, int boardY)
               {
                  blokus.gameState.PlayMove(pieceType, direction, flip, boardX, boardY);
                  if(color == blokus.colorPlayed)
                     blokus.NextColorPlayed();
                  blokus.Update(null);
               }

               void Passed(PlayerColor color)
               {
                  blokus.gameState.Pass();
                  if(color == blokus.colorPlayed)
                     blokus.NextColorPlayed();
                  blokus.Update(null);
               }
            };
            incref server;
            if(server.Connect(serverAddress.contents, BLOKUS_PORT))
            {
               int playerID = server.Join();
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
      this, text = "Start", bevel = false, anchor = { right = 20, top = 322 };
      foreground = white;
      font = { "Arial", 20, true };
      opacity = 0; drawBehind = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(hosting)
            StartGame();
         return true;
      }
   };

   EditBox playerName
   {
      this, text = "Name", contents = "[Your Name]", anchor = { right = 20, top = 10 }, size = { 100, 24 };
   };
   EditBox serverAddress
   {
      this, text = "Server", contents = "localhost", anchor = { right = 20, top = 40 }, size = { 100, 24 };
   };
   ListBox scores
   {
      master = this, hasMinimize = true, hasHeader = true, anchor = { right = 0 }, text = "Scores", size = { 300, 300 };
   };
   DataField scoreFields[MaxPlayers];
}

class BlokusApp : GuiApplication
{
   void Terminate()
   {
      if(hosting)
         blokusService.Stop();
   }
}

Blokus blokus {};

DCOMService blokusService { port = BLOKUS_PORT };
