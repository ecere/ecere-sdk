/****************************************************************************
   CHESS Game

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   chessutils.ec - Utilities to validate moves
****************************************************************************/
import "chess.ec"

enum PieceType : byte { Empty, Pawn, Knight, Bishop, Rook, Queen, King };
enum Player : byte { White, Black };

int materialValues[PieceType] = { 0, 10, 30, 35, 50, 90, 10000 };

class Piece : byte
{
public:
   Player player : 1 : 3;
   PieceType type : 3 : 0;
};

struct ChessMove
{
   int x1, y1;
   int x2, y2;
   Player player;
   PieceType type;
   int rating;
   PieceType promotion;
   int count;
};

enum State { Normal, Check, CheckMate, StaleMate };

struct ChessState
{
   bool gameRunning;
   bool isLocalPlayer[Player];

   Point enPassant;
   bool kingMoved[Player], qRookMoved[Player], kRookMoved[Player];
   Piece board[8][8];
   Player turn;
   int numMoves;
   Point kings[Player];
   int pieceCount[Player][PieceType];
   int materialValue[Player];
   bool castled[Player];

   State state;
};

static bool FreeWay(Piece board[8][8], int x1, int y1, int x2, int y2)
{
   int x,y;
   int dx = Sgn(x2-x1), dy = Sgn(y2-y1);

   for(x = x1+dx, y = y1+dy; x != x2 || y != y2; x+=dx, y+=dy)
      if(board[y][x])
         return false;
   return true;
}

static bool BasicMove(Piece board[8][8], int x1, int y1, int x2, int y2)
{
   bool valid = false;
   Piece source = board[y1][x1];
   Player player = source.player;
   Piece dest = board[y2][x2];

   if(!dest || player != dest.player)
   {
      PieceType piece = source.type;
      int dx = x2 - x1;
      int dy = y2 - y1;

      switch(piece)
      {
         case Pawn:
         {
            int direction = (player == White) ? 1 : -1;
            if(dy == direction && Abs(dx) == 1 && dest)
               valid = true;
            break;
         }
         case Knight:
            if( (Abs(dx) == 1 && Abs(dy) == 2) ||
                (Abs(dy) == 1 && Abs(dx) == 2))
                valid = true;
            break;
         case Bishop:
            if(Abs(dx) == Abs(dy) && FreeWay(board, x1,y1,x2,y2))
               valid = true;
            break;
         case Rook:
            if((!Abs(dx) || !Abs(dy)) && FreeWay(board, x1,y1,x2,y2))
               valid = true;
            break;
         case Queen:
            if((!Abs(dx) || !Abs(dy) || Abs(dx) == Abs(dy)) && 
               FreeWay(board, x1,y1,x2,y2))
               valid = true;
            break;      
         case King:
            if(Abs(dx) <= 1 && Abs(dy) <= 1)
               valid = true;
            break;
      }
   }
   return valid;
}

bool Check(ChessState state, Player player, int kx, int ky)
{
   int x,y;
   Piece old1 = 0xFF, old2;
   bool checked = false;

   if(kx == -1)
   {
      kx = state.kings[player].x;
      ky = state.kings[player].y;
   }
   else
   {
      old1 = state.board[state.kings[player].y][state.kings[player].x];
      state.board[state.kings[player].y][state.kings[player].x] = Piece { };

      old2 = state.board[ky][kx];
      state.board[ky][kx] = Piece { player, King };
   }

   for(y = 0; y<8; y++)
   {
      for(x = 0; x<8; x++)
      {
         Piece atBoard = state.board[y][x];
         if(atBoard && atBoard.player != player)
         {
            if(BasicMove(state.board, x, y, kx, ky))
            {
               checked = true;
               break;
            }
         }
      }
      if(checked)
         break;
   }

   if(old1 != 0xFF)
   {
      state.board[ky][kx] = old2;
      state.board[state.kings[player].y][state.kings[player].x] = old1;
   }
   return checked;
}

bool IsMoveValid(int x1, int y1, int x2, int y2, ChessState state, Piece endBoard[8][8], bool validate)
{
   bool valid = false;
   Piece source = state.board[y1][x1];
   PieceType piece = source.type;
   Player player = source.player;

   int dx = x2 - x1;
   int dy = y2 - y1;

   if(!validate || (x2 >= 0 && y2 >= 0 && x2<8 && y2<8))
   {
      if(!(valid = (validate ? BasicMove(state.board, x1,y1,x2,y2) : true)))
      {
         // Handle special moves (pawn & castle)
         switch(piece)
         {
            case Pawn:
            {
               int direction = (player == White) ? 1 : -1;
               int start = (player == White) ? 1 : 6;
               if(dy == direction)
               {
                  // Normal Move
                  if(x1 == x2 && !state.board[y2][x2])
                     valid = true;
                  // En Passant
                  else if(Abs(dx) == 1 && 
                          x2 == state.enPassant.x && y2 == state.enPassant.y + direction)
                     valid = true;
               }
               // First 2 Squares Move
               else if(y2 - y1 == direction * 2 && y1 == start && x1 == x2 
                  && !state.board[y1+direction][x1] && !state.board[y2][x1])
                  valid = true;
               break;
            }
            case King:
               // Castle
               if(!dy && Abs(dx) == 2)
               {
                  if(!state.kingMoved[player] && !Check(state, player, x1, y1))
                  {
                     // King Side
                     if(dx == 2 && !state.kRookMoved[player] && 
                        !state.board[y1][5] && !state.board[y1][6] &&
                        !Check(state, player, 5, y1))
                        valid = true;
                     // Queen Side
                     else if(dx == -2 && !state.qRookMoved[player] &&
                        !state.board[y1][3] && !state.board[y1][2] && !state.board[y1][1] &&
                        !Check(state, player, 3, y1))
                        valid = true;
                  }
               }
               break;
         }
      }
   }

   if(valid)
   {
      if(validate || endBoard)
      {
         ChessState tmpState = state;
         tmpState = state;
         tmpState.board[y1][x1] = Piece {};

         // Handle special moves (pawn & castle)
         switch(piece)
         {
            case Pawn:
            {
               int direction = (player == White) ? 1 : -1;
               int start = (player == White) ? 1 : 6;
               if(dy == direction)
               {
                  // Normal Move
                  if(Abs(dx) == 1 && x2 == state.enPassant.x && y2 == state.enPassant.y + direction)
                     tmpState.board[state.enPassant.y][state.enPassant.x] = Piece {};
               }
               break;
            }
            case King:
               // *** Castle ***

               // King Side
               if(dx == 2)
               {
                  tmpState.board[y1][7] = Piece { };
                  tmpState.board[y1][5] = Piece { player, Rook };
               }
               // Queen Side
               else if(dx == -2)
               {
                  tmpState.board[y1][0] = Piece { };
                  tmpState.board[y1][3] = Piece { player, Rook };
               }

               // Keep Track of King
               tmpState.kings[player].x = x2;
               tmpState.kings[player].y = y2;
               break;
         }

         tmpState.board[y2][x2] = state.board[y1][x1];

         valid = validate ? !Check(tmpState, player, -1, -1) : true;
         if(valid && endBoard)
            CopyBytes(endBoard, tmpState.board, 64);
      }
   }
   return valid;
}

bool StateMakeMove(ChessState state, int x1, int y1, int x2, int y2, PieceType promotion, bool validate, int * delta)
{
   bool valid = false;
   PieceType type = state.board[y1][x1].type;
   Player player = state.board[y1][x1].player;

   PieceType captured = state.board[y2][x2].type;
   if(captured)
   {
      if(x2 == 7 && y2 == ((player == White) ? 7 : 0) && !state.kRookMoved[(Player)!player])
         state.kRookMoved[(Player)!player] = true;
      else if(x2 == 0 && y2 == ((player == White) ? 7 : 0) && !state.qRookMoved[(Player)!player])
         state.qRookMoved[(Player)!player] = true;

      state.pieceCount[(Player)!player][captured]--;
      state.materialValue[(Player)!player] -= materialValues[captured];
      if(delta)
         *delta = materialValues[captured];
   }
   // En Passant
   else if(type == Pawn && Abs(x2-x1) == 1)
   {
      state.pieceCount[(Player)!player][Pawn]--;
      state.materialValue[(Player)!player] -= materialValues[Pawn];
      if(delta)
         *delta = materialValues[Pawn];
   }
   
   if(IsMoveValid(x1,y1,x2,y2, state, state.board, validate))
   {
      valid = true;

      // En Passant
      if(type == Pawn && Abs(y2-y1) == 2)
      {
         state.enPassant.x = x2;
         state.enPassant.y = y2;
      }
      else
      {
         state.enPassant.x = -1;
         state.enPassant.y = -1;
      }

      // Castle
      if(type == King)
      {
         switch(x2-x1)
         {
            // King Side Castle
            case 2:
               state.kRookMoved[player] = true;
               state.castled[player] = true;
               break;
            // Queen Side Castle
            case -2:
               state.qRookMoved[player] = true;
               state.castled[player] = true;
               break;
         }
      }

      // Rook moved (can't castle with it)
      if(type == Rook && y1 == ((player == White) ? 0 : 7))
      {
         if(!state.qRookMoved[player] && x1 == 0)
            state.qRookMoved[player] = true;
         else if(!state.kRookMoved[player] && x1 == 7)
            state.kRookMoved[player] = true;
      }

      // Pawn Promotion
      if(type == Pawn && y2 == ((player == White) ? 7 : 0))
      {
         state.board[y2][x2] = Piece { player, promotion };

         state.pieceCount[player][Pawn]--;
         state.pieceCount[player][promotion]++;
         state.materialValue[player] += materialValues[promotion] - materialValues[Pawn];
         if(delta)
            *delta += materialValues[promotion] - materialValues[Pawn];
      }

      // Keep track of the kings
      if(type == King)
      {
         state.kings[player].x = x2;
         state.kings[player].y = y2;

         state.kingMoved[player] = true;
      }

      state.turn ^= 1;
      state.numMoves ++;
   }
   return valid;   
}
