import "chess.ec"

// #define FLIPBOARD

/*
define OFFSET_X = 23;
define OFFSET_Y = 23;
define SQUARE_W = 49;
define SQUARE_H = 49;
*/

define OFFSET_X = 42;
define OFFSET_Y = 42;
define SQUARE_W = 90;
define SQUARE_H = 90;

define BOARD_WIDTH = SQUARE_W * 8;
define BOARD_HEIGHT = SQUARE_H * 8;

static char * names[12] =
{
   "whitePawn", "whiteKnight", "whiteBishop", "whiteRook", "whiteQueen", "whiteKing",
   "blackPawn", "blackKnight", "blackBishop", "blackRook", "blackQueen", "blackKing"
};

class Chess2D : Window
{
   ChessState * chessState;
   Point drag, moving;
   bool dragging;
   Bitmap piecesBMP[12];
   //BitmapResource boardBMP { ":board.pcx", window = this };
   BitmapResource boardBMP { ":board.jpg", window = this };

   isActiveClient = true, background = black, borderStyle = fixed, hasMinimize = true;

   bool OnLoadGraphics()
   {
      int c;

#if 0
      Bitmap chessPieces {};
      chessPieces.Load(":pieces.pcx", null, null);
      for(c = 0; c<12; c++)
      {
         piecesBMP[c] = Bitmap {};
         piecesBMP[c].Allocate(null, SQUARE_W, SQUARE_H, 0, chessPieces.format, true);
         piecesBMP[c].Grab(chessPieces, (c % 6) * SQUARE_H,(c / 6) * SQUARE_H);
         piecesBMP[c].transparent = true;
         piecesBMP[c].MakeDD(displaySystem);
      }
      delete chessPieces;
#endif

      for(c = 0; c<12; c++)
      {
         char fileName[MAX_FILENAME];
         sprintf(fileName, ":%s.png", names[c]);
         piecesBMP[c] = Bitmap{};
         piecesBMP[c].LoadT(fileName, null, displaySystem);
      }
      return true;
   }

   bool OnResizing(int * w, int * h)
   {
      *w = Max(*w, BOARD_WIDTH  + OFFSET_X * 2);
      *h = Max(*h, BOARD_HEIGHT + OFFSET_Y * 2);
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;
      for(c = 0; c<12; c++)
      {
         piecesBMP[c].Free();
         piecesBMP[c] = null;
      }
   }

   void OnRedraw(Surface surface)
   {
      bool flip;
      int rx, ry;

   #ifdef FLIPBOARD
      flip = chessState->turn == Black;
   #else
      flip = chessState->isLocalPlayer[Black] && !chessState->isLocalPlayer[White];
   #endif

      surface.SetForeground(white);
      surface.Blit(boardBMP.bitmap, 0,0, 0,0, boardBMP.bitmap.width, boardBMP.bitmap.height);

      if(chessState->gameRunning)
      {
         int x,y;
         for (y=0; y<8; y++)
         {
	         for (x=0; x<8; x++)
	         {
               if(!dragging || x != moving.x || y != moving.y)
               {
                  Piece atBoard = chessState->board[y][x];
                  int piece = (int)atBoard.player * 6 + (int)atBoard.type;
                  if(piece)
                  {
                     rx = flip ? (7-x) : x;
                     ry = flip ? y : (7-y);

                     surface.Blit(piecesBMP[piece-1],
                        OFFSET_X + rx * SQUARE_W, OFFSET_Y + ry * SQUARE_H,
                        0,0, piecesBMP[piece-1].width, piecesBMP[piece-1].height);
                  }
               }
	         }
         }

         if(dragging)
         {
            Piece atBoard = chessState->board[moving.y][moving.x];
            int piece = (int)atBoard.player * 6 + (int)atBoard.type;

            rx = flip ? (7-drag.x) : drag.x;
            ry = flip ? drag.y : (7-drag.y);

            surface.Blit(piecesBMP[piece-1],
               OFFSET_X + rx * SQUARE_W, OFFSET_Y + ry * SQUARE_H,
               0,0, piecesBMP[piece-1].width, piecesBMP[piece-1].height);
         }
      }
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      bool flip;
   #ifdef FLIPBOARD
      flip = chessState->turn == Black;
   #else
      flip = chessState->isLocalPlayer[Black] && !chessState->isLocalPlayer[White];
   #endif

      x = (x - OFFSET_X) / SQUARE_W;
      y = (y - OFFSET_Y) / SQUARE_H;

      if(!flip) y = 7-y; else x = 7-x;

      if(chessState->gameRunning &&
         x < 8 && y < 8 && x >= 0 && y >= 0 && chessState->board[y][x] &&
         chessState->isLocalPlayer[chessState->turn] &&
         chessState->board[y][x].player == chessState->turn)
      {
         dragging = true;
         drag.x = moving.x = x;
         drag.y = moving.y = y;
         Capture();
         SetMouseRange( Box { OFFSET_X, OFFSET_Y, OFFSET_X + BOARD_WIDTH - 1, OFFSET_Y + BOARD_HEIGHT - 1 } );
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      bool flip;

   #ifdef FLIPBOARD
      flip = chessState->turn == Black;
   #else
      flip = chessState->isLocalPlayer[Black] && !chessState->isLocalPlayer[White];
   #endif

      if(chessState->gameRunning)
      {
         x = (x - OFFSET_X) / SQUARE_W;
         y = (y - OFFSET_Y) / SQUARE_H;

         if(!flip) y = 7-y; else x = 7-x;

         if(x < 8 && y < 8 && x >= 0 && y >= 0 && dragging)
         {
            ReleaseCapture();
            FreeMouseRange();
            dragging = false;
            ((Chess)master).ProcessUserMove(moving.x, moving.y, x, y);
         }
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      bool flip;

   #ifdef FLIPBOARD
      flip = chessState->turn == Black;
   #else
      flip = chessState->isLocalPlayer[Black] && !chessState->isLocalPlayer[White];
   #endif

      x = (x - OFFSET_X) / SQUARE_W;
      y = (y - OFFSET_Y) / SQUARE_H;

      if(!flip) y = 7-y; else x = 7-x;

      if(x < 8 && y < 8 && x >= 0 && y >= 0 && dragging)
      {
         drag.x = x;
         drag.y = y;
         Update(null);
      }
      return true;
   }

   property ChessState * chessState { set { chessState = value; } }
}
