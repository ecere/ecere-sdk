/****************************************************************************
   OTHELLO Game

   Copyright (c) 2001-2004 Jerome Jacovella-St-Louis
   All Rights Reserved.
****************************************************************************/
import "ecere"

// --- Definitions ---
enum ChipColor : byte { blue, green, empty };

define SERVER = blue;
define CLIENT = green;

define NUM_COLUMNS = 8;
define NUM_ROWS = 8;

define WIDTH = 40;
define HEIGHT = 40;

define OTHELLO_PORT = 7777;

enum OthelloMessage : byte { newGame = 1, position };

struct OPacket
{
   OthelloMessage type;
   ChipColor player;
   byte x,y;
};

Othello othello {};

// --- Othello Window Class ---
class Othello : Window
{
   // Data Structure
   bool hosting, gameRunning, local;
   ChipColor turn;
   int numChips[ChipColor];
   OthelloSocket sockets[ChipColor];
   ChipColor board[NUM_ROWS][NUM_COLUMNS];
   bool gameOver;
   OthelloService service { port = OTHELLO_PORT, othello = this };

   // Default properties
   background = black, tabCycle = true, text = "ECERE Othello", borderStyle = sizable, hasClose = true, 
   size.h = 480, clientSize.w = NUM_COLUMNS*WIDTH;

   // --- Othello Utilities ---
   int TurnChipsDirection(int sx, int sy, int dx, int dy, ChipColor color, int turn)
   {
      int x,y;
      int numChips = 0;
   
      sx += dx;
      sy += dy;
   
      // Out of the board...
      if(sx < 0 || sx >= NUM_COLUMNS || sy < 0 || sy >= NUM_ROWS)
         return 0;
   
      // Chip of the same color...
      if(board[sy][sx] == color || board[sy][sx] == empty)
         return 0;
   
      for(x = sx, y = sy; 
          x >= 0 && x < NUM_COLUMNS && y >= 0 && y < NUM_ROWS; 
          x += dx, y += dy)
      {
         // Chip of the same color at the end of the line...
         if(board[y][x] == color)
         {
            if(turn)
            {
               for(x = sx, y = sy; 
                   x >= 0 && x < NUM_COLUMNS && y >= 0 && y < NUM_ROWS;
                   x += dx, y += dy)
               {
                  if(board[y][x] == color) 
                     break;
                  else
                     board[y][x] = color;
               }
            }
            return numChips;
         }
         // Empty case...
         else if(board[y][x] == empty)
            return 0;
         // Chip of the opponent's color...
         else
            numChips ++;
      }
   
      // No chip of the same color at the end...
      return 0;
   }
   
   bool PossibleMove()
   {
      bool validMove = false;
      int x,y;
      for(y = 0; y<NUM_ROWS && !validMove; y++)
         for(x = 0; x<NUM_COLUMNS && !validMove; x++)
            if(board[y][x] == empty && TurnChips(x, y, turn, 0))
               validMove = true;
      return validMove;
   }
   
   int TurnChips(int sx, int sy, ChipColor color, int turn)
   {
      int x,y;
      int numChips = 0;
   
      for(y = -1; y <= 1; y++)
         for(x = -1; x <= 1; x++)
            if(x || y)
               numChips += TurnChipsDirection(sx, sy, x,y, color, turn);
      if(numChips && turn)
      {
         board[sy][sx] = color;
         this.numChips[color] += numChips + 1;
         this.numChips[1-color] -= numChips;
         this.turn = 1-color;
   
         if(!PossibleMove())
         {
            this.turn = color;
            if(!PossibleMove())
               gameOver = true;
         }
         
         Update(null);
      }
      return numChips;
   }
   
   void NewGame()
   {
      int x,y;
   
      for(y = 0; y<NUM_ROWS; y++)
         for(x = 0; x<NUM_COLUMNS; x++)
            board[y][x] = empty;
      board[3][3] = board[4][4] = blue;
      board[3][4] = board[4][3] = green;
      numChips[blue] = numChips[green] = 2;
      turn = CLIENT;
      gameOver = false;
      Update(null);
   }
   
   void EnableButtons()
   {
      join.disabled = false;
      host.disabled = false;
      disconnect.disabled = false;
      stop.disabled = false;
      localGame.disabled = false;
      
      if(gameRunning || hosting || sockets[SERVER])
         localGame.disabled = true;
      if(!hosting) 
         stop.disabled = true;
      if(!gameRunning && !sockets[SERVER])
         disconnect.disabled = true;
   
      if(hosting || sockets[SERVER] || local)
         host.disabled = true;
         
      if(sockets[SERVER] || local || hosting)
         join.disabled = true;
   
      address.disabled = join.disabled;
   }

   // Children
   Button localGame 
   {
      parent = this, text = "Local Game", position = Point{ 160, 330 }, size = Size { 100, 20 }, hotKey = altL;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         local = true;
         gameRunning = true;
         EnableButtons();
         NewGame();
         Update(null);
         return true;
      }
   };

   Button host
   {
      parent = this, text = "Host", position = Point { 10, 330 }, size = Size { 60, 20 }, hotKey = altH;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(service.Start())
         {
            hosting = true;
            EnableButtons();
         }
         Update(null);
         return true;
      }
   };

   Button join
   {
      parent = this, text = "Join", position = Point{ 10, 370 }, size = Size { 40, 20 }, hotKey = altJ;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         OthelloSocket socket { othello = this };
         if(socket.Connect(address.line.text, OTHELLO_PORT))
         {
            sockets[SERVER] = socket;
            EnableButtons();
         }
         Update(null);
         return true;
      }
   };
   Button disconnect
   {
      parent = this, text = "Disconnect", position = Point { 170, 370 }, size = Size { 100, 20 }, hotKey = altD;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         if(sockets[SERVER])
            sockets[SERVER].Disconnect(0);
         else if(sockets[CLIENT])
            sockets[CLIENT].Disconnect(0);
         else if(local)
         {
            local = false;
            gameRunning = false;
            EnableButtons();
         }
         Update(null);
         return true;
      }
   };

   Button stop
   {
      parent = this, text = "Stop", position = Point { 80, 330 }, size = Size { 60, 20 }, hotKey = altS;
      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         hosting = false;
         service.Stop();
         EnableButtons();
         Update(null);
         return true;
      }
   };
   EditBox address { textHorzScroll = true, line.text = "localhost", parent = this, position = Point{ 60, 370 }, size = Size { 100, 20 } };

   // Window class implementation
   bool OnCreate()
   {
      NewGame();
      EnableButtons();
      return true;
   }

   void OnDestroy()
   {
      delete sockets[blue];
      delete sockets[green];
   }

   BitmapResource jetonGreen { ":green.bmp", window = this };
   BitmapResource jetonBlue { ":blue.bmp", window = this };
   BitmapResource back { ":othello.bmp", window = this };

   void OnRedraw(Surface surface)
   {
      // Background...
      surface.Blit(back.bitmap, 0,0, 0,0, back.bitmap.width, back.bitmap.height);
      if(gameRunning)
      {
         int x,y;

         // Chips...
         for (y=0; y<NUM_ROWS; y++)
         {
            for (x=0; x<NUM_COLUMNS; x++)
	         {
               switch(board[y][x])
               {
                  case blue:
                     surface.Blit(jetonBlue.bitmap, x * WIDTH, y * HEIGHT, 0,0, WIDTH-1, HEIGHT-1);
                     break;
                  case green:
                     surface.Blit(jetonGreen.bitmap, x * WIDTH, y * HEIGHT, 0,0, WIDTH-1, HEIGHT-1);
                     break;
               }
            }
         }

         // Score...
         if(turn == blue)
         {
            surface.SetForeground(white);
            surface.SetBackground(blue);
            surface.TextOpacity(true);
         }
         else
         {
            surface.SetForeground(blue);
            surface.TextOpacity(false);
         }
         surface.WriteTextf(10,  400, "blue: %d", numChips[blue]);

         if(turn == green)
         {
            surface.SetForeground(black);
            surface.SetBackground(green);
            surface.TextOpacity(true);
         }
         else
         {
            surface.SetForeground(green);
            surface.TextOpacity(false);
         }
         surface.WriteTextf(210, 400, "green: %d", numChips[green]);

         surface.TextOpacity(false);
         surface.SetForeground(tomato);
         if(gameOver)
            surface.WriteTextf(100, 420, "GAME OVER");
         else if(!local && sockets[1-turn])
            surface.WriteTextf(50, 420, "It is your turn to move.");
      }
   }
 
   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape) Destroy(0);
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      x /= WIDTH;
      y /= HEIGHT;

      if(sockets[1-turn] || local)
      {
         if(x < NUM_COLUMNS && y < NUM_ROWS && board[y][x] == empty)
         {
            OPacket packet { position, turn, (byte)x, (byte)y };
            if(TurnChips(x, y, turn, 1))
            {
               if(!local)
                  sockets[1-packet.player].Send((byte *)&packet, sizeof(OPacket));
            }
         }
      }
      return true;
   }                    
}

// --- Othello Communication ---
class OthelloSocket : Socket
{
   Othello othello;
   void OnDisconnect(int code)
   {
      if(this == othello.sockets[CLIENT])
      {
         othello.sockets[CLIENT] = null;
         othello.gameRunning = false;
      }
      else if(this == othello.sockets[SERVER])
      {
         othello.sockets[SERVER] = null;
         othello.gameRunning = false;
      }
   
      othello.EnableButtons();
      othello.Update(null);
   }

   uint OnReceive(const byte * buffer, uint count)
   {
      if(count >= sizeof(OPacket))
      {
         OPacket packet = *(OPacket *)buffer;
         switch(packet.type)
         {
            case position:
               othello.TurnChips(packet.x, packet.y, packet.player, 1);
               break;
            case newGame:
               othello.gameRunning = true;
               othello.NewGame();
               break;
         }
         return sizeof(OPacket);
      }
      return 0;
   }
   
   void OnConnect()
   {
      othello.sockets[SERVER] = this;
      othello.gameRunning = true;
      othello.EnableButtons();
      othello.NewGame();
   }
   
   property Othello othello { set { othello = value; } }
}

class OthelloService : Service
{
   Othello othello;
   void OnAccept()
   {
      if(!othello.sockets[CLIENT] && !othello.gameRunning)
      {
         OPacket packet { newGame };
   
         othello.sockets[CLIENT] = OthelloSocket { this, othello = othello };
         othello.sockets[CLIENT].Send((byte *)&packet, sizeof(OPacket));
   
         othello.NewGame();
         othello.gameRunning = true;
         othello.EnableButtons();
         othello.Update(null);
      }
   }
   property Othello othello { set { othello = value; } }
}
