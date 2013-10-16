import "ecere"

#define NUMLEVELS 11
#define DIMX      16
#define DIMY      16
#define MAXTIME   (5*60)
#define TIME2     (4*60)
#define TIME1     (2*60)
#define TIMEBAR   gray
#define TIMEFILL  darkBlue

#define NOTHING   0
#define PLAYER    1
#define BOMB5     2
#define BOMB3     3
#define BOMB1     4
#define BOMBD     5
#define DESACTIV  6
#define BLOCK     7

#define STATE_MENU      0
#define STATE_GAME      1
#define STATE_CREDITS   2
#define STATE_ENDSCREEN 3
#define STATE_PASSWORD  4

static char passwords[NUMLEVELS+1][5] =
{
   "","1111","2222","3333","4444","5555","6666",
   "7777","8888","9999","AAAA","BBBB"
};

BombApp app;

class Bomb : Window
{
   borderStyle = sizable, hasMaximize = true, hasMinimize = true, hasClose = true;
   text = "Bomb Squad", clientSize = Size { 640,400 };

   bool fullScreen;
   char board[DIMY][DIMX];

   Bitmap gfx[8];
   Bitmap mainBitmap {};
   Bitmap credits {};
   Bitmap endScreen {};
   Bitmap password {};

   Size mapSize;
   Point player;
   double startTime, secPassed;
   int level;
   int state;

   bool DelayExpired()
   {
      int x,y, b;
      double currentTime = GetTime();
      secPassed = currentTime - startTime;
           if(secPassed >= TIME2)b=BOMB1;
      else if(secPassed >= TIME1)b=BOMB3;
      else                       b=BOMB5;

      for(y=0; y<DIMY; y++)
         for(x=0; x<DIMX; x++)
            if((board[y][x]==BOMB1)||(board[y][x]==BOMB3)||(board[y][x]==BOMB5))
               board[y][x]=(byte)b;

      if(secPassed >= MAXTIME)
      {
         state = STATE_MENU;
         SetPalette(true);
         timer.Stop();
      }
      Update(null);
      return true;
   }
   Timer timer
   {
      this, Seconds { 1 }, DelayExpired = DelayExpired
   };
   EditBox passEdit
   {
      this, textHorzScroll = true, text = "Password",
      anchor = Anchor { left = 0.03, top = 0.05, right = 0.84, bottom = 0.80 },
      autoCreate = false
   };
   Bitmap buffer {};

   bool IsDone()
   {
      bool lost = false;
      int x,y;
      for(y=0; y<DIMY; y++)
         for(x=0; x<DIMX; x++)
            if((board[y][x]==BOMB1)||(board[y][x]==BOMB3)||(board[y][x]==BOMB5))
               lost = true;
      return !lost;
   }

   void SetPalette(bool flag)
   {
      ColorAlpha * palette = null;
      switch(state)
      {
         case STATE_GAME: palette = LoadPalette(":nothing.pcx", null); break;
         case STATE_MENU: palette = LoadPalette(":max3.pcx", null); break;
         case STATE_CREDITS: palette = LoadPalette(":3.pcx", null); break;
         case STATE_ENDSCREEN: palette = LoadPalette(":max3.pcx", null); break;
      }
      CopyBytesBy4(buffer.palette, palette, 256);
      display.SetPalette(palette, flag);
      delete palette;
   }

   void LoadLevel(int level)
   {
      File f;
      char map[80];

      // Start the game
      this.level = level;
      state = STATE_GAME;
      timer.Start();
      startTime = GetTime();
      sprintf(map,":map%d.dat",level);

      f = FileOpen(map, read);
      if(f)
      {
         int x,y;
         for(y=0; y<DIMY; y++)
            for(x=0; x<DIMX; x++)
            {
               char ch;
               f.Getc(&ch);
               board[y][x] = ch;

               if(board[y][x]==PLAYER)
               {
                  player = Point{x,y};
                  board[y][x]=NOTHING;
               }
            }
         delete f;
      }

      DelayExpired();
      SetPalette(true);
   }

   bool OnStateChange(WindowState state, Modifiers mods)
   {
      if(state == maximized && (Key)mods == hotKey)
      {
         app.fullScreen = true;
         app.resolution = res320x200;
         app.pixelFormat = pixelFormat8;
         borderStyle = none;
         anchor = Anchor { left = 0, top = 0, right = 0, bottom = 0 };
         return false;
      }
      return true;
   }

   bool OnLoadGraphics()
   {
      int c;
      endScreen.Load(":max3.pcx", null, null);
      mainBitmap.Load(":max3.pcx", null, null);
      credits.Load(":3.pcx", null, null);
      password.Load(":password.pcx", null, null);

      for(c = 0; c<8; c++)
         gfx[c] = Bitmap {};
      gfx[NOTHING].Load(":nothing.pcx", null, null);
      gfx[PLAYER].Load(":player.pcx", null, null);
      gfx[BOMB5].Load(":bomb.pcx", null, null);
      gfx[BOMB3].Load(":deadeac.pcx", null, null);
      gfx[BOMB1].Load(":deadeac.pcx", null, null);
      gfx[BOMBD].Load(":deacbomb.pcx", null, null);
      gfx[DESACTIV].Load(":desactiv.pcx", null, null);
      gfx[BLOCK].Load(":block.pcx", null, null);

      mapSize.w = gfx[0].width;
      mapSize.h = gfx[0].height;

      buffer.AllocateDD(displaySystem, 320, 200);

      SetPalette(true);
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;

      for(c=0; c<8; c++)
         delete gfx[c];
      mainBitmap.Free();
      credits.Free();
      endScreen.Free();
      password.Free();
      buffer.Free();
   }

   void OnRedraw(Surface surface2)
   {
      Surface surface = buffer.GetSurface(0,0, null);

      surface.SetBackground(black);
      surface.Clear(colorBuffer);
      switch(state)
      {
         case STATE_GAME:
         {
            int x,y;
            int width;
            int offX = (320 - mapSize.w * DIMX) / 2;
            int offY = (200 - mapSize.h * DIMY - 20) / 2;

            for(y=0; y<DIMY; y++)
               for(x=0; x<DIMX; x++)
                  surface.Blit(gfx[board[y][x]],
                     offX + x*mapSize.w, offY + y*mapSize.h, 0,0,
                     mapSize.w,mapSize.h);
            surface.Blit(gfx[PLAYER],
               offX + player.x*mapSize.w, offY + player.y*mapSize.h,
               0,0,mapSize.w,mapSize.h);

            surface.SetForeground(TIMEBAR);
            surface.Rectangle(0,buffer.height - 20,buffer.width-1,buffer.height-1);
            width = (int)((buffer.width - 2)*(MAXTIME-secPassed)/MAXTIME);
            surface.SetBackground(TIMEFILL);
            surface.Area(1,buffer.height - 19,width,buffer.height - 2);
            break;
         }
         case STATE_MENU:
            surface.Blit(mainBitmap, 0,0, 0,0, mainBitmap.width,mainBitmap.height);
            break;
         case STATE_CREDITS:
            surface.Blit(credits, 0,0, 0,0, credits.width,credits.height);
            break;
         case STATE_ENDSCREEN:
            surface.Blit(endScreen, 0,0, 0,0, endScreen.width,endScreen.height);
            break;
         case STATE_PASSWORD:
            surface.Blit(password, 0,0,0,0,password.width, password.height);
            break;
      }

      delete surface;
      surface2.Stretch(buffer, 0,0, 0,0, clientSize.w, clientSize.h,
         buffer.width, buffer.height);
   }

   bool OnKeyDown(Key key, unichar character)
   {
      if(state == STATE_PASSWORD)
      {
         if(key == enter)
         {
            int l;
            char * pwd = passEdit.contents;
            for(l=1; l<=NUMLEVELS; l++)
               if(!strcmpi(pwd,passwords[l]))
               {
                  char string[80];
                  sprintf(string, "Wrapping to level %d...",l);
                  MessageBox { text = "Password Accepted", contents = string }.Modal();
                  LoadLevel(l);
                  break;
               }
         }
         else if(key != escape)
            return true;

         passEdit.Destroy(0);
         if(state == STATE_PASSWORD) state = STATE_MENU;
         Update(null);
      }
      else if(state == STATE_MENU)
      {
         switch(key)
         {
            case s: LoadLevel(1); break;
            case p:
               state = STATE_PASSWORD;
               passEdit.Create();
               break;
            case x: Destroy(0); return false;
            case c: state = STATE_CREDITS; SetPalette(true); break;
         }
         Update(null);
      }
      switch(key)
      {
         case escape:
            if(state == STATE_GAME)
               timer.Stop();
            state = STATE_MENU;
            SetPalette(true);
            Update(null);
            break;
         case altEnter:
            fullScreen = false;
            borderStyle = sizable, hasClose = true, hasMinimize = true, hasMaximize = true;
            clientSize = { 640, 400 };
            return false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if(state == STATE_GAME)
      {
         int dx=0,dy=0;

         switch(key)
         {
            case up: dy=-1; break;
            case down: dy=1; break;
            case left: dx=-1; break;
            case right: dx=1; break;
            default: return true;
         }

         if((player.x+dx<0)||(player.y+dy<0)||(player.x+dx>=DIMX)||(player.y+dy>=DIMY))
            return true;

         if(board[player.y+dy][player.x+dx]==BLOCK) return true;
         if((board[player.y+dy][player.x+dx]==BOMB5)
          ||(board[player.y+dy][player.x+dx]==BOMB3)
          ||(board[player.y+dy][player.x+dx]==BOMB1)
          ||(board[player.y+dy][player.x+dx]==BOMBD))
         {
            if((player.x+dx*2<0)||(player.y+dy*2<0)||(player.x+dx*2>=DIMX)||(player.y+dy*2>=DIMY))
               return true;
            if((board[player.y+2*dy][player.x+2*dx]!=DESACTIV)&&
               (board[player.y+2*dy][player.x+2*dx]!=NOTHING))
               return true;
            if(board[player.y+dy][player.x+dx]==BOMBD)
               board[player.y+dy][player.x+dx]=DESACTIV;
            else
               board[player.y+dy][player.x+dx]=NOTHING;
            if(board[player.y+2*dy][player.x+2*dx]==DESACTIV)
               board[player.y+2*dy][player.x+2*dx]=BOMBD;
            else
            {
               int b;
                    if(secPassed >= TIME2)b=BOMB1;
               else if(secPassed >= TIME1)b=BOMB3;
               else                             b=BOMB5;
               board[player.y+2*dy][player.x+2*dx]=(byte)b;
            }
         }

         player.x+=dx;
         player.y+=dy;

         if(IsDone())
         {
            if(level == NUMLEVELS)
            {
               state = STATE_ENDSCREEN;
               SetPalette(true);
            }
            else
            {
               char string[80];
               sprintf(string, "Password to level %d is: %s",level+1,passwords[level+1]);
               timer.Stop();
               MessageBox { text = "Congratulations! You win!", contents = string }.Modal();
               LoadLevel(level + 1);
            }
         }
         Update(null);
      }
      return true;
   }
}

class BombApp : GuiApplication
{
   Bomb bomb {};
   void Main()
   {
      app = this;
      GuiApplication::Main();
   }
}
