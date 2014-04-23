/****************************************************************************
   Tetrominoes Game

   Copyright (c) 2001-2007 Jerome Jacovella-St-Louis
   All Rights Reserved.

   tetrominoes.ec - Tetrominoes
****************************************************************************/
import "ecere"

// --- Definitions ---

define SERVER = 0;
define CLIENT = 1;

define NUM_COLUMNS  = 8;
define NUM_ROWS     = 8;

define CUBE_WIDTH   = 40;
define CUBE_HEIGHT  = 40;

define TETROMINOES_PORT = 7779;

struct Piece
{
   int w, h;
   int x0, x1;
   byte data[9];
};

static Piece pieces[7] =
{
   {
      4, 1, -1, 1,
      {
         1,1,1,1
      }
   },
   {
      3, 2, 0, 0,
      {
        4,4,4,
        4,0,0
      }
   },
   {
      3, 2, 0, 0,
      {
         3,3,3,
         0,0,3
      }
   },
   {
      3, 2, 0, 0,
      {
         5,5,0,
         0,5,5
      }
   },
   {
      3, 2, 0, 0,
      {
         0,6,6,
         6,6,0
      }
   },
   {
      2, 2, 0, 0,
      {
         2,2,
         2,2
      }
   },
   {
      3, 2, 0, 0,
      {
         7,7,7,
         0,7,0
      }
   }
};

define MSG_NEWGAME  = 1;
define MSG_POSITION = 2;

typedef struct
{
   byte type;
   byte player,x,y;
} TPacket;

define WIDTH  = 12;
define HEIGHT = 22;

// --- Main Function ---
class TetrominoesApp : GuiApplication
{
   appName = "Ecere Tetrominoes";
}

Tetrominoes tetrominoes { };

TetrominoesService service { };

class TetrominoesService : Service
{
   port = TETROMINOES_PORT;
   Tetrominoes tetrominoes;
   void OnAccept()
   {
      if(!tetrominoes.sockets[CLIENT] && !tetrominoes.gameRunning)
      {
         TetrominoesSocket socket { this };
         TPacket packet;

         tetrominoes.sockets[CLIENT] = socket;
         packet.type = MSG_NEWGAME;
         tetrominoes.sockets[CLIENT].Send((byte *)&packet, sizeof(TPacket));
         tetrominoes.NewGame();
         tetrominoes.gameRunning = true;
         tetrominoes.EnableButtons();
         tetrominoes.Update(null);
      }
   }
}

class TetrominoesSocket : Socket
{
   // --- Tetrominoes Communication ---
   Tetrominoes tetrominoes;
   static void OnDisconnect(int code)
   {
      if(this == tetrominoes.sockets[CLIENT])
      {
         tetrominoes.sockets[CLIENT] = null;
         tetrominoes.gameRunning = false;
      }
      else if(this == tetrominoes.sockets[SERVER])
      {
         tetrominoes.sockets[SERVER] = null;
         tetrominoes.gameRunning = false;
      }

      tetrominoes.EnableButtons();
      tetrominoes.Update(null);
   }

   uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(TPacket))
      {
         TPacket packet = *(TPacket *)buffer;
         switch(packet.type)
         {
            case MSG_POSITION:
               break;
            case MSG_NEWGAME:
               tetrominoes.gameRunning = true;
               tetrominoes.NewGame();
               break;
         }
         return sizeof(TPacket);
      }
      return 0;
   }

   void OnConnect()
   {
      tetrominoes.sockets[SERVER] = this;
      tetrominoes.gameRunning = true;
      tetrominoes.EnableButtons();
      tetrominoes.NewGame();
   }
}

class Tetrominoes : Window
{
   text = "Ecere Tetrominoes";
   hasClose = true;
   clientSize = { 300, 420 };

   Button host
   {
      this, text = "Host", position = { 10, 360 }, size = { 60, 20 };
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(service.Start())
         {
            hosting = true;
            EnableButtons();
            Update(null);
         }
         return true;
      }

   };
   Button stop
   {
      this, text = "Stop", position = { 80, 360 }, size = { 60, 20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         hosting = false;
         service.Stop();
         EnableButtons();
         Update(null);
         return true;
      }
   };
   Button join
   {
      this, text = "Join", position = { 10, 380 }, size = { 40, 20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         TetrominoesSocket socket { tetrominoes = this };
         sockets[SERVER] = socket;
         socket.Connect(address.contents, TETROMINOES_PORT);
         EnableButtons();
         Update(null);
         return true;
      }
   };
   Button disconnect
   {
      this, text = "Disconnect", position = { 170, 370 }, size = { 100, 20 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         sockets[SERVER].Disconnect(0);
         Update(null);
         return true;
      }
   };
   EditBox address
   {
      this, disabled = true, position = { 60, 380 }, size = { 100, 20 }, contents = "localhost";
   };

   bool hosting, gameRunning, local;
   byte turn;
   Bitmap squares[7];
   Bitmap backgroundBmp { };
   Socket sockets[2];
   byte board[HEIGHT][WIDTH];
   bool gameOver;
   int angle;
   int playerx, playery;
   int newpiece;
   int nextAngle, nextPiece;

   background = black;
   tabCycle = true;

   // --- Tetrominoes Utilities ---

   void NewGame()
   {
      int x,y;
      gameOver = false ;
      for(y = 0; y<HEIGHT; y++)
         for(x = 0; x<WIDTH; x++)
            board[y][x] = 0;
      turn = CLIENT;
      Update(null);
      RandomSeed((uint)(GetTime() * 1000));
      nextPiece = GetRandom(0, 6);
      nextAngle = GetRandom(0, 3);
      NewPiece();
   }

   void EnableButtons()
   {
      join.disabled = false;
      host.disabled = false;
      disconnect.disabled = false;
      stop.disabled = false;

      if(!hosting)
         stop.disabled = true;
      if(!sockets[SERVER])
         disconnect.disabled = true;

      if(hosting || sockets[SERVER])
         host.disabled = true;

      if(sockets[CLIENT] || hosting)
         join.disabled = true;

      // address.disabled = join.disabled;
   }

   // --- Tetrominoes Window Class ---

   void OnRedraw(Surface surface)
   {
      // Background...
      surface.Blit(backgroundBmp, 0,0, 0,0, backgroundBmp.width, backgroundBmp.height);

      //if(GameRunning)
      {
         Piece * piece = &pieces[newpiece];
         int x,y;
         for(x = 0; x<WIDTH; x++)
         {
            for(y = 0; y<HEIGHT; y++)
            {
               int square = board[y][x];
               if(square)
                  surface.Blit(squares[square-1], x * 16, y * 16, 0, 0, 16, 16);
            }
         }
         if(!gameOver)
         {
            for(x = 0; x<piece->w; x++)
               for(y = 0; y<piece->h; y++)
               {
                  int square;
                  int rx, ry;

                  switch(angle)
                  {
                     case 0: rx = x; ry = y; break;
                     case 1: rx = piece->h-1 - y; ry = x; break;
                     case 2: rx = piece->w-1 - x; ry = piece->h -1- y; break;
                     case 3: rx = y; ry = piece->w-1 - x; break;
                  }

                  switch(angle)
                  {
                     case 0: case 2: rx += piece->x0; break;
                     case 1: case 3: rx += piece->x1; break;
                  }

                  square = piece->data[y * piece->w + x];
                  if(square)
                     surface.Blit(squares[square-1], (rx + playerx) * 16, (ry + playery) * 16, 0, 0, 16, 16);
               }
         }
         piece = &pieces[nextPiece];
         for(x = 0; x<piece->w; x++)
            for(y = 0; y<piece->h; y++)
            {
               int square;
               int rx, ry;

               switch(nextAngle)
               {
                  case 0: rx = x; ry = y; break;
                  case 1: rx = piece->h-1 - y; ry = x; break;
                  case 2: rx = piece->w-1 - x; ry = piece->h -1- y; break;
                  case 3: rx = y; ry = piece->w-1 - x; break;
               }

               switch(nextAngle)
               {
                  case 0: case 2: rx += piece->x0; break;
                  case 1: case 3: rx += piece->x1; break;
               }

               square = piece->data[y * piece->w + x];
               if(square)
                  surface.Blit(squares[square-1], rx * 16 + (WIDTH + 2) * 16, ry * 16 + 10, 0, 0, 16, 16);
            }
      }
   }

   bool OnCreate()
   {
      playerx = 5;
      NewGame();
      EnableButtons();
      return true;
   }

   void OnDestroy()
   {
      if(sockets[0]) sockets[0].OnDisconnect = null;
      if(sockets[1]) sockets[1].OnDisconnect = null;
   }

   bool OnLoadGraphics()
   {
      int c;
      Bitmap tetrominoesBlocks { };
      if(tetrominoesBlocks.Load(":tetrominoes.png", null, null))
      {
         tetrominoesBlocks.Convert(null, pixelFormat888, null);
         for(c=0; c<7; c++)
         {
            if(!squares[c]) squares[c] = Bitmap { };
            squares[c].Allocate(null, 16,16,16, pixelFormat888, false);
            squares[c].Grab(tetrominoesBlocks, c*16, 0);
            squares[c].MakeDD(displaySystem);
         }

         backgroundBmp.Allocate(null, 192,352,192, pixelFormat888, false);
         backgroundBmp.Grab(tetrominoesBlocks, 0, 24);
         backgroundBmp.MakeDD(displaySystem);
      }
      delete tetrominoesBlocks;
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;
      for(c=0; c<7; c++)
      {
         squares[c].Free();
         delete squares[c];
      }
      backgroundBmp.Free();
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape:
            Destroy(0);
            break;
      }
      return true;
   }

   Timer timer
   {
      userData = this, delay = 0.8, started = true;

      bool DelayExpired()
      {
         if(!gameOver)
         {
            playery++;
            if(CheckPiece())
            {
               playery--;
               FreezePiece();
            }
            Update(null);
         }
         return true;
      }
   };

   void NewPiece()
   {
      newpiece = nextPiece;
      angle = nextAngle;
      playerx = 5;
      playery = 0;
      if(CheckPiece())
      {
         gameOver = true;
      }
      else
      {
         nextPiece = GetRandom(0, 6);
         nextAngle = GetRandom(0, 3);
      }
   }

   void FreezePiece()
   {
      Piece * piece = &pieces[newpiece];
      int x,y;
      int numLines = 0;
      for(x = 0; x<piece->w; x++)
      {
         for(y = 0; y<piece->h; y++)
         {
            int square;
            int rx, ry;

            switch(angle)
            {
               case 0: rx = x; ry = y; break;
               case 1: rx = piece->h-1 - y; ry = x; break;
               case 2: rx = piece->w-1 - x; ry = piece->h -1- y; break;
               case 3: rx = y; ry = piece->w-1 - x; break;
            }

            switch(angle)
            {
               case 0: case 2: rx += piece->x0; break;
               case 1: case 3: rx += piece->x1; break;
            }
            square = piece->data[y * piece->w + x];
            if(square)
               board[ry + playery][rx + playerx] = (byte)square;
         }
      }
      for(y = HEIGHT - 1; y >= 0; y--)
      {
         for(x = 0; x < WIDTH; x++)
         {
            if(!board[y][x]) break;
         }
         if(x == WIDTH)
         {
            numLines++;
            if(y > 0)
               memmove(&board[1], &board, y * WIDTH);
            memset(&board, 0, WIDTH);
            y++;
         }
      }

      NewPiece();
   }

   void DropPiece()
   {
      while(!CheckPiece())
      {
         playery++;
      }
      playery--;
      FreezePiece();
   }

   bool CheckPiece()
   {
      Piece * piece = &pieces[newpiece];
      bool result = false;
      if(((angle == 0 || angle == 2) ? piece->h : piece->w) + playery > HEIGHT)
      {
         //playery = HEIGHT - ((angle == 0 || angle == 2) ? piece->h : piece->w);
         result = true;
      }
      if(!result)
      {
         int x,y;
         for(x = 0; x<piece->w && !result; x++)
            for(y = 0; y<piece->h && !result; y++)
            {
               int square;
               int rx, ry;

               switch(angle)
               {
                  case 0: rx = x; ry = y; break;
                  case 1: rx = piece->h-1 - y; ry = x; break;
                  case 2: rx = piece->w-1 - x; ry = piece->h -1- y; break;
                  case 3: rx = y; ry = piece->w-1 - x; break;
               }

               switch(angle)
               {
                  case 0: case 2: rx += piece->x0; break;
                  case 1: case 3: rx += piece->x1; break;
               }
               square = piece->data[y * piece->w + x];
               if(square && board[ry + playery][rx + playerx])
               {
                  //playery--;
                  result = true;
               }
            }
      }
      /*if(result)
         FreezePiece();*/
      return result;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      Piece * piece = &pieces[newpiece];
      if(!gameOver)
      {
         switch(key)
         {
            case left:
            case right:
               if(key == left) playerx--; else playerx++;
               playerx = Max(playerx, -((angle == 0 || angle == 2) ? (piece->x0) : (piece->x1)));
               playerx = Min(playerx, 12 - ((angle == 0 || angle == 2) ? (piece->x0 + piece->w) : (piece->x1 + piece->h)));
               if(CheckPiece())
               {
                  if(key == left) playerx++; else playerx--;
               }
               break;
            case down:
               playery++;
               if(CheckPiece())
               {
                  playery--;
                  FreezePiece();
               }
               break;
            case up:
            {
               int oldx = playerx;
               angle++;
               if(angle>3) angle = 0;
               playerx = Max(playerx, -((angle == 0 || angle == 2) ? (piece->x0) : (piece->x1)));
               playerx = Min(playerx, 12 - ((angle == 0 || angle == 2) ? (piece->x0 + piece->w) : (piece->x1 + piece->h)));

               if(CheckPiece())
               {
                  angle--;
                  if(angle < 0) angle += 4;
                  playerx = oldx;
               }
               break;
            }
            case space:
            {
               if(playery > 0)
                  DropPiece();
               break;
            }
         }
         Update(null);
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      x /= CUBE_WIDTH;
      y /= CUBE_HEIGHT;

      if(sockets[1-turn])
      {
         if(x < NUM_COLUMNS && y < NUM_ROWS)
         {
            TPacket packet;
            packet.type = MSG_POSITION;
            packet.player = turn;
            packet.x = (byte)x;
            packet.y = (byte)y;
            sockets[turn].Send((byte *)&packet, sizeof(TPacket));
         }
      }
      return true;
   }
}
