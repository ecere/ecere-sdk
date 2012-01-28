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

   void OnDestroy()
   {
      panel.Destroy(0);
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
               if(gameState.ValidMove(selectedPiece, direction, flip, boardPos.x, boardPos.y))
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
      if(gameStarted)
      {
         ColorRGB empty = gray, full = white;
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

      if(gameState.numPlayers > 1 && colorPlayed == gameState.colorTurn)
      {
         surface.font = yourTurnFont.font;
         surface.foreground = tomato;
         surface.CenterTextf(x + bs*squareWidth/2, y + 5, "Your turn");
      }

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

   Console chat
   {
      this, size = { bs*squareWidth }, anchor = { left = boardStartX, top = boardStartY + bs*squareWidth + 20, bottom = 5 };
      font = { "Arial", 11, bold = true };
      editTextColor = white;
      logTextColor = white;
      editHeight = 24;
      log.hasVertScroll = bool::true;
   };

   Button button1
   {
      this, text = "Pass", anchor = { right = 5, bottom = 5 };
      inactive = true;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         panel.server.Pass();
         return true;
      }

   };
}

Blokus blokus {};

class BlokusApp : GuiApplication
{
   bool Init()
   {
      blokus.Create();
      panel.Create();
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

                  blokus.gameState.NewGame();
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

                  blokus.UpdatePlayerNames();
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
         blokusService.Stop();
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
