/****************************************************************************
   CHESS Game

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   chess.ec - Chess Main Window
****************************************************************************/
#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif
import "chess2D.ec"
import "chess3D.ec"
import "promotion.ec"
import "connect.ec"
import "about.ec"
import "ai.ec"
import "chessutils.ec"

// --- Definitions ---
define APPNAME = "ECERE Chess v0.4";
define CHESS_PORT = 7778;
define SERVER_COLOR = Black;
define CLIENT_COLOR = White;

// Network Messages
enum ChessMessage : byte { NewGame = 1, Position = 2 };

struct ChessPacket
{
   ChessMessage type;
   Player player;
   byte x1,y1,x2,y2;
   PieceType promotion;
};

ChessApp app;

class ChessApp : GuiApplication
{
   appName = APPNAME;
/*#if defined(__WIN32__)
   driver = "Direct3D";
#else*/
   driver = "OpenGL";
//#endif
   Chess{};

   void Main()
   {
      app = this;
      GuiApplication::Main();
   }
}

enum GameAction { newAIGame, newLocalGame, endGame, close, connect, host, stop };


#ifdef HIGH_DPI
define stateWidth = 300;
define turnWidth = 150;
#else
define stateWidth = 200;
define turnWidth = 100;
#endif

class Chess : Window
{
   background = gray, hasMenuBar = true, hasStatusBar = true,
   fullRender = true;
   text = APPNAME,
#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__)
   hasClose = true, hasMaximize = true, hasMinimize = true,
   borderStyle = sizable,
#endif
   anchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };

   bool hosting, local, ai;
#ifndef CHESS_NONET
   Socket sockets[Player];

   ChessService service { port = CHESS_PORT, chess = this };
#endif

   MenuItem * driverItems;

   ChessState chessState;

   StatusField stateField { statusBar, width = stateWidth};
   StatusField turnField { statusBar, width = turnWidth };

   property ChessState * chessState { get { return &chessState; } }

   // AI Player Threading
   AIThread aiThread { chess = this };

   // Windows

   ListBox moveList
   {
      parent = this,
      isActiveClient = true,
      text = "MoveList",
      autoScroll = true,
      hasMinimize = true,
      borderStyle = sizable,
      hasVertScroll = true,
      hasHorzScroll = true,
      position = Point { x = 445 },
      size = Size { 200, 450 }
   };

   Chess2D chess2D
   {
      parent = this,
      text = "2D Chess Board",
      chessState = &chessState
   };

   Chess3D chess3D
   {
      parent = this,
      text = "3D Chess Board",
      anchor = Anchor { left = 0.5, top = 0.5, right = 0, bottom = 0 },
      chessState = &chessState,
      state = maximized
   };

   // Main Menu
   menu = Menu {};

   Menu gameMenu    { menu, "Game", g };
   Menu networkMenu { menu, "Network", n };
   Menu viewMenu    { menu, "View", v };
   Menu windowMenu  { menu, "Window", w };
   MenuDivider      { menu };
   Menu helpMenu    { menu, "Help", h };

   // Game Menu
   MenuItem aiItem
   {
      gameMenu, "New AI Game\tCtrl+N", n, ctrlN;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(EndGame(newAIGame))
         {
            ai = true;
            chessState.gameRunning = true;

            chessState.isLocalPlayer[White] = true;
            chessState.isLocalPlayer[Black] = false;

            EnableMenus();

            RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));

            NewGame();
         }
         return true;
      }
   };

   MenuItem localItem
   {
      gameMenu, "New Local Game\tCtrl+L", l, ctrlL;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(EndGame(newLocalGame))
         {
            local = true;
            chessState.gameRunning = true;
            chessState.isLocalPlayer[White] = true;
            chessState.isLocalPlayer[Black] = true;
            EnableMenus();
            NewGame();
         }
         return true;
      }
   };

   MenuItem endGameItem
   {
      gameMenu, "End Game", e;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         EndGame(endGame);
         return true;
      }
   };

   MenuItem { gameMenu, "Exit\tAlt+F4", x, NotifySelect = MenuFileExit };

#ifndef CHESS_NONET
   // Network Menu
   MenuItem connectItem
   {
      networkMenu, "Connect...", c;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(EndGame(connect))
         {
            hosting = false;
            service.Stop();
            ConnectDialog { master = this, isModal = true }.Create();
         }
         return true;
      }
   };

   MenuItem disconnectItem
   {
      networkMenu, "Disconnect", d, NotifySelect = endGameItem.NotifySelect
   };

   MenuItem hostItem
   {
      networkMenu, "Host", h;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(EndGame(host))
         {
            if(service.Start())
            {
               hosting = true;
               EnableMenus();
            }
         }
         return true;
      }
   };

   MenuItem stopItem
   {
      networkMenu, "Stop Hosting", s;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(EndGame(stop))
         {
            hosting = false;
            service.Stop();
            EnableMenus();
         }
         return true;
      }
   };
#endif

   // View Menu
   MenuItem fullScreenItem
   {
      //viewMenu, "Full Screen", f, checkable = true;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         app.fullScreen ^= true;
         SetDriver();
         anchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };
         return true;
      }
   };

   bool SetDisplayDriver(MenuItem selection, Modifiers mods)
   {
      //app.driver = app.drivers[selection.id];
      SetDriver();
      return true;
   }

   // Window Menu
   MenuItem { windowMenu, "Next\tF6", n, NotifySelect = MenuWindowNext };
   MenuItem { windowMenu, "Previous\tShift-F6", p, NotifySelect = MenuWindowPrevious };
   MenuDivider { windowMenu };
   MenuItem { windowMenu, "Windows...", w, NotifySelect = MenuWindowWindows };

   //  Help Menu
   MenuItem aboutItem
   {
      helpMenu, "About...\tF1", a, f1;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         AboutChess { master = this, isModal = true }.Create();
         return true;
      }
   };

   int cx1, cy1, cx2, cy2;

   bool DoMove(int x1, int y1, int x2, int y2, PieceType promotion)
   {
      bool valid = false;
      PieceType type = chessState.board[y1][x1].type;
      Player player = chessState.board[y1][x1].player;

      if(StateMakeMove(chessState, x1,y1,x2,y2, promotion, true, null))
      {
         valid = true;

         if(chessState.isLocalPlayer[player] && !local && !ai)
         {
            ChessPacket packet
            {
               type = Position,
               player = player,
               x1 = (byte)x1,
               y1 = (byte)y1,
               x2 = (byte)x2,
               y2 = (byte)y2,
               promotion = promotion
            };
#ifndef CHESS_NONET
            sockets[player^(Player)1].Send((byte *)&packet, sizeof(ChessPacket));
#endif
         }

         if(player == Black)
         {
            moveList.AddStringf("               %c%c-%c%c",
               x1+'a',y1+'1', x2+'a',y2+'1');
         }
         else
         {
            moveList.AddStringf("%3d. %c%c-%c%c",
               chessState.numMoves/2+1, x1+'a',y1+'1', x2+'a',y2+'1');
         }


         // Update Status Bar
         {
            MoveStack stack { };
            GenerateMoveList(chessState, stack);

            delete stack.moves;

            if(Check(chessState, chessState.turn, -1, -1))
            {
               if(stack.count)
               {
                  chessState.state = Check; // TODO: Fix this
                  stateField.text = "Check!";
               }
               else
               {
                  chessState.state = CheckMate;
                  if(chessState.turn == White)
                     stateField.text = "White are Checkmate.";
                  else
                     stateField.text = "Black are Checkmate.";
               }
            }
            else if(!stack.count)
            {
               chessState.state = StaleMate;
               stateField.text = "Stalemate.";
            }
            else
               stateField.text = "";

            // TOFIX: Gets confused with function!
            if((chessState.state == Check || chessState.state == Normal) &&
               chessState.isLocalPlayer[chessState.turn] && !local)
               turnField.text = "Your turn";
            else
               turnField.text = "";
         }
      }

      chess2D.Update(null);
      chess3D.Update(null);
      return valid;
   }

   // --- Chess Utilities ---
   bool MakeMove(int x1, int y1, int x2, int y2, PieceType promotion)
   {
      bool valid = false;

      PieceType type = chessState.board[y1][x1].type;
      Player player = chessState.board[y1][x1].player;

      // Pawn Promotion
      if(type == Pawn && y2 == ((player == White) ? 7 : 0))
      {
         valid = true;
         if(chessState.isLocalPlayer[chessState.turn] &&
            (valid = IsMoveValid(x1,y1,x2,y2, chessState, null, true)))
         {
            valid = false;
            cx1 = x1, cy1 = y1, cx2 = x2, cy2 = y2;
            chess2D.Update(null);
            chess3D.Update(null);
            promotion = (PieceType)Promotion
            {
               master = this;
               isModal = true;

               void Chess::NotifyDestroyed(Window promotionDlg, DialogResult r)
               {
                  DoMove(cx1, cy1, cx2, cy2, (PieceType)r);
                  if(ai)
                     aiThread.Play();
               }
            }.Create();
         }
      }
      else
         valid = DoMove(x1, y1, x2, y2, promotion);
      return valid;
   }

   void ProcessUserMove(int x1, int y1, int x2, int y2)
   {
      if(MakeMove(x1, y1, x2, y2, 0))
      {
         if(ai)
            aiThread.Play();
      }

      chess2D.Update(null);

      chess3D.Update(null);
   }

   // #define QUEENMATE

   void NewGame()
   {
      int x,y;

      moveList.Clear();

      chessState.state = Normal;
      chessState.numMoves = 0;

      for(y = 0; y <8; y++)
         for(x = 0; x<8; x++)
            chessState.board[y][x] = Piece {};

      // WHITE PIECES

   #ifndef QUEENMATE
      for(x = 0; x<8; x++)
         chessState.board[1][x] = Piece { White, Pawn };
      chessState.board[0][0] = chessState.board[0][7] = Piece { White, Rook };
      chessState.board[0][1] = chessState.board[0][6] = Piece { White, Knight };
      chessState.board[0][2] = chessState.board[0][5] = Piece { White, Bishop };
      chessState.board[0][3] = Piece { White, Queen };
   #endif
      chessState.board[0][4] = Piece { White, King };

      // BLACK PIECES
   #ifndef QUEENMATE
      for(x = 0; x<8; x++)
         chessState.board[6][x] = Piece { Black, Pawn };
      chessState.board[7][0] = chessState.board[7][7] = Piece { Black, Rook };
      chessState.board[7][1] = chessState.board[7][6] = Piece { Black, Knight };
      chessState.board[7][2] = chessState.board[7][5] = Piece { Black, Bishop };
   #endif
      chessState.board[7][3] = Piece { Black, Queen };
      chessState.board[7][4] = Piece { Black, King };

      // CASTLE STATUS
   #ifndef QUEENMATE
      chessState.kingMoved[Black] = chessState.kingMoved[White] = false;
      chessState.kRookMoved[Black] = chessState.kRookMoved[White] = false;
      chessState.qRookMoved[Black] = chessState.qRookMoved[White] = false;
   #else
      chessState.kRookMoved[Black] = chessState.kRookMoved[White] = true;
      chessState.qRookMoved[Black] = chessState.qRookMoved[White] = true;
   #endif

      // KING POSITION
      chessState.kings[Black].x = chessState.kings[White].x = 4;
      chessState.kings[Black].y = 7;
      chessState.kings[White].y = 0;

   #if 0
      chessState.kings[Black].x = 4;
      chessState.kings[Black].y = 6;
      chessState.kings[White].x = 4;
      chessState.kings[White].y = 0;

      chessState.kingMoved[0] = false;
      chessState.kingMoved[1] = true;
      chessState.kRookMoved[0] = false;
      chessState.qRookMoved[0] = false;
      chessState.kRookMoved[1] = true;
      chessState.qRookMoved[1] = true;

      chessState.board[0][0] = Piece { White, Rook };
      chessState.board[0][4] = Piece { White, King };
      chessState.board[0][7] = Piece { White, Rook };
      chessState.board[1][0] = Piece { White, Pawn };
      chessState.board[1][2] = Piece { White, Pawn };
      chessState.board[1][5] = Piece { White, Pawn };
      chessState.board[1][6] = Piece { White, Pawn };
      chessState.board[1][7] = Piece { White, Pawn };
      chessState.board[2][1] = Piece { White, Pawn };
      chessState.board[2][2] = Piece { White, Knight };
      chessState.board[4][3] = Piece { White, Pawn };
      chessState.board[5][6] = Piece { White, Bishop };

      chessState.board[5][0] = Piece { Black, Pawn };
      chessState.board[5][1] = Piece { Black, Pawn };
      chessState.board[5][3] = Piece { Black, Knight };
      chessState.board[5][5] = Piece { Black, Pawn };
      chessState.board[5][7] = Piece { Black, Bishop };
      chessState.board[6][0] = Piece { White, Rook };
      chessState.board[6][2] = Piece { Black, Pawn };
      chessState.board[6][3] = Piece { Black, Pawn };
      chessState.board[6][4] = Piece { Black, King };
      chessState.board[7][1] = Piece { Black, Knight };
      chessState.board[7][2] = Piece { Black, Bishop };
   #endif
      chessState.turn = White;

      chessState.castled[White] =
      chessState.castled[Black] = false;

      // EN PASSANT STATUS
      chessState.enPassant.x = -1;
      chessState.enPassant.y = -1;

      chessState.pieceCount[White][Pawn]   = chessState.pieceCount[Black][Pawn] = 8;
      chessState.pieceCount[White][Knight] = chessState.pieceCount[Black][Knight] = 2;
      chessState.pieceCount[White][Bishop] = chessState.pieceCount[Black][Bishop] = 2;
      chessState.pieceCount[White][Rook]   = chessState.pieceCount[Black][Rook] = 2;
      chessState.pieceCount[White][Queen]  = chessState.pieceCount[Black][Queen] = 1;
      chessState.pieceCount[White][King]   = chessState.pieceCount[Black][King] = 1;

      chessState.materialValue[White] =
         chessState.pieceCount[White][Pawn]   * materialValues[Pawn] +
         chessState.pieceCount[White][Knight] * materialValues[Knight] +
         chessState.pieceCount[White][Bishop] * materialValues[Bishop] +
         chessState.pieceCount[White][Rook]   * materialValues[Rook] +
         chessState.pieceCount[White][Queen]  * materialValues[Queen];
      chessState.materialValue[Black] =
         chessState.pieceCount[Black][Pawn]   * materialValues[Pawn] +
         chessState.pieceCount[Black][Knight] * materialValues[Knight] +
         chessState.pieceCount[Black][Bishop] * materialValues[Bishop] +
         chessState.pieceCount[Black][Rook]   * materialValues[Rook] +
         chessState.pieceCount[Black][Queen]  * materialValues[Queen];

      chess2D.Update(null);
      chess3D.Update(null);

      if(chessState.isLocalPlayer[chessState.turn] && !local)
         turnField.text = "Your turn";
      stateField.text = "";

   /*
      // 1
      MakeMoveChar('e',2, 'e',4);
      MakeMoveChar('a',7, 'a',6);
      // 2
      MakeMoveChar('d',2, 'd',4);
      MakeMoveChar('f',7, 'f',5);
      // 3
      MakeMoveChar('e',4, 'f',5);
      MakeMoveChar('b',8, 'c',6);
      // 4
      MakeMoveChar('d',4, 'd',5);
      MakeMoveChar('c',6, 'e',5);
      // 5
      MakeMoveChar('f',2, 'f',4);
      MakeMoveChar('e',5, 'f',7);
      // 6
      MakeMoveChar('g',1, 'f',3);
      MakeMoveChar('c',7, 'c',5);
      // 7
      MakeMoveChar('c',2, 'c',4);
      MakeMoveChar('g',7, 'g',6);
      // 8
      MakeMoveChar('f',5, 'g',6);
      MakeMoveChar('f',7, 'd',6);
      // 9
      MakeMoveChar('g',6, 'h',7);
      MakeMoveChar('g',8, 'h',6);
      // 10
      MakeMoveChar('f',1, 'd',3);
      MakeMoveChar('d',6, 'f',7);
      // 11
      MakeMoveChar('c',1, 'd',2);
      MakeMoveChar('d',8, 'b',6);
      // 12
      MakeMoveChar('d',2, 'c',3);
      MakeMoveChar('b',6, 'd',6);
      // 13
      MakeMoveChar('c',3, 'h',8);
      MakeMoveChar('f',7, 'h',8);
      // 14
      MakeMoveChar('d',1, 'd',2);
      MakeMoveChar('e',7, 'e',6);
   */
   }

   void MakeMoveChar(char x1, int y1, char x2, int y2)
   {
      MakeMove(x1 - 'a', y1 - 1, x2 - 'a', y2 - 1, Queen);
   }

   void EnableMenus()
   {
#ifndef CHESS_NONET
      stopItem.disabled = !hosting;
      disconnectItem.disabled = !sockets[SERVER_COLOR] && !sockets[CLIENT_COLOR];
      hostItem.disabled = hosting;
#endif
      endGameItem.disabled = !chessState.gameRunning;
   }

   void SetDriver()
   {
      int c;
      for(c = 0; c<app.numDrivers; c++)
         if(!strcmp(app.drivers[c], app.driver))
         {
            driverItems[c].checked = true;
            break;
         }
   }

   // --- Chess Window Class ---
   bool OnCreate()
   {
      int c;

      driverItems = new MenuItem[app.numDrivers];
      for(c = 0; c<app.numDrivers; c++)
      {
         driverItems[c] = MenuItem { viewMenu, app.drivers[c], NotifySelect = SetDisplayDriver };
         driverItems[c].id = c;
         driverItems[c].isRadio = true;
      }
      // this.SetPalette(palette, true);

      SetDriver();
      NewGame();
      EnableMenus();

      return true;
   }

   void DoEndGame(GameAction action)
   {
#ifndef CHESS_NONET
      if(sockets[SERVER_COLOR])
         sockets[SERVER_COLOR].Disconnect(0);
      else if(sockets[CLIENT_COLOR])
         sockets[CLIENT_COLOR].Disconnect(0);
      else
#endif
      if(local || ai)
      {
         if(ai) aiThread.Abort();
         local = ai = false;
         chessState.gameRunning = false;
      }
      EnableMenus();

      turnField.text = "";
      stateField.text = "";

      switch(action)
      {
         case newAIGame:    aiItem.NotifySelect(this, aiItem, 0); break;
         case newLocalGame: localItem.NotifySelect(this, localItem, 0); break;
      }
   }

   GameAction nextAction;

   bool EndGame(GameAction action)
   {
      if(chessState.gameRunning &&
         (chessState.state == Normal || chessState.state == Check))
      {
         nextAction = action;
         MessageBox
         {
            type = okCancel, contents = "Quit current game?",
            master = this, text = "ECERE Chess";
            isModal = true;

            void Chess::NotifyDestroyed(Window msgBox, DialogResult result)
            {
               if(result != cancel)
                  DoEndGame(nextAction);
            }
         }.Create();
         return false;
      }
      return true;
   }

   bool OnClose(bool parentClosing)
   {
      return EndGame(close);
   }

   void OnDestroy()
   {
#ifndef CHESS_NONET
      delete sockets[Black];
      delete sockets[White];
#endif
      delete driverItems;
   }

#ifndef CHESS_NONET
   void Connect(const char * address)
   {
      ChessSocket socket { chess = this };
      if(socket.Connect(address, CHESS_PORT))
      {
         sockets[SERVER_COLOR] = socket;
         EnableMenus();

         chessState.isLocalPlayer[CLIENT_COLOR] = true;
         chessState.isLocalPlayer[SERVER_COLOR] = false;
      }
   }
#endif
}

// --- Chess Communications ---
#ifndef CHESS_NONET
class ChessSocket : Socket
{
   Chess chess;
   property Chess chess { set { chess = value; } }

   void OnDisconnect(int code)
   {
      if(this == chess.sockets[CLIENT_COLOR])
      {
         chess.sockets[CLIENT_COLOR] = null;
         chess.chessState->gameRunning = false;
         chess.turnField.text = "";
         chess.stateField.text = "";
      }
      else if(this == chess.sockets[SERVER_COLOR])
      {
         chess.sockets[SERVER_COLOR] = null;
         chess.chessState->gameRunning = false;
         chess.turnField.text = "";
         chess.stateField.text = "";
      }

      chess.EnableMenus();
      chess.chess2D.Update(null);
      chess.chess3D.Update(null);
   }

   uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(ChessPacket))
      {
         ChessPacket packet = *(ChessPacket *)buffer;
         switch(packet.type)
         {
            case Position:
               chess.MakeMove(packet.x1, packet.y1, packet.x2, packet.y2, packet.promotion);
               chess.Activate();
               break;
            case NewGame:
               chess.chessState->gameRunning = true;
               chess.NewGame();
               break;
         }
         return sizeof(ChessPacket);
      }
      return 0;
   }

   void OnConnect()
   {
      chess.sockets[SERVER_COLOR] = this;
      chess.chessState->gameRunning = true;
      chess.EnableMenus();
      chess.NewGame();
   }
}

class ChessService : Service
{
   Chess chess;
   property Chess chess { set { chess = value; } }

   void OnAccept()
   {
      if(!chess.chessState->gameRunning)
      {
         ChessPacket packet { type = NewGame };

         chess.sockets[CLIENT_COLOR] = ChessSocket { this, chess = chess };
         chess.sockets[CLIENT_COLOR].Send((byte *)&packet, sizeof(ChessPacket));

         chess.chessState->isLocalPlayer[SERVER_COLOR] = true;
         chess.chessState->isLocalPlayer[CLIENT_COLOR] = false;

         chess.NewGame();
         chess.chessState->gameRunning = true;
         chess.EnableMenus();
         chess.chess2D.Update(null);
         chess.chess3D.Update(null);
      }
   }
}
#endif
