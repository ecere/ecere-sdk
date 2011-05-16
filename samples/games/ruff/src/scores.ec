import "ruff.ec"

define GREEN   = Color { 0,128,0 };
define BLUE    = Color { 0,0,128 };
define PINK    = Color { 128,64,64 };
define VIOLET  = Color { 128,0,128 };
define ORANGE  = Color { 255,128,0 };
define PURPLE  = Color { 255,0,128 };
define CYAN    = Color { 0,255,255 };
define RED     = Color { 192,0,0 };

class Scores : Window
{
   inactive = true;
   isRemote = true;
   background = white;
   borderStyle = fixed, hasVertScroll = true, text = "The Scores", anchor = Anchor { horz = 0.3, vert = 0.1 }, clientSize = Size { 316,441 };
   
   bool OnPostCreate()
   {
      SetScrollLineStep(1, 20);
      SetScrollArea(1, 102 * 20, true);
      return true;
   }

   void OnResize(int w, int h)
   {
      vertScroll.pageStep = 400;
   }

   void ShowScore(Surface surface, int x, int y, int score, int r)
   {
      char temp[256];
   	if(score < 0)
   	{
   		sprintf(temp,"(%d)",-score);
         surface.SetForeground((r % 2) ? RED : ORANGE);
   	}
   	else
   	{
   		sprintf(temp,"%d",score);
         surface.SetForeground((r % 2) ? black : white);
   	}
   	surface.CenterTextf(x,y,temp);
   }

   void OnRedraw(Surface surface)
   {
   	int r;
   	int scores[2]={0,0};
      Ruff ruff = (Ruff)master;
      
   	if(ruff.game.players)
   	{
         int scoreScroll = vertScroll.thumbPosition / 20;

         surface.SetBackground(BLUE);
   		surface.Area(1,1,49,39);

   		surface.SetBackground(BLUE);
   		surface.Area(151,1,199,39);

         // Name Boxes
         surface.SetBackground(CYAN);
   		surface.Area(51,1,149,39);
   		surface.Area(201,1,299,39);

         surface.CenterTextf(100,0,ruff.game.players[0].name);
   		surface.CenterTextf(250,0,ruff.game.players[1].name);
   		surface.CenterTextf(100,20,ruff.game.players[2].name);
   		surface.CenterTextf(250,20,ruff.game.players[3].name);

   		for(r=0; r<20; r++)
   		{
            Round * round = &ruff.game.rounds[r + scoreScroll];
            int shuffle = (ruff.game.rounds[0].shuffle + r + scoreScroll) % 4;

            // Line Background
   			surface.SetBackground(PINK);
   			surface.Area(1,41+r*20,24,59+r*20);
   			surface.SetBackground(VIOLET);
   			surface.Area(26,41+r*20,49,59+r*20);

   			if((r+scoreScroll)%2)
   				surface.SetBackground(white);
   			else
   				surface.SetBackground(GREEN);
   			surface.Area(51,41+r*20,149,59+r*20);
   			surface.Area(201,41+r*20,299,59+r*20);

            surface.SetBackground(((r+scoreScroll)%2) ? PURPLE : ORANGE);
   			surface.Area(151,41+r*20,174,59+r*20);
   			surface.SetBackground(((r+scoreScroll)%2) ? ORANGE : PURPLE);
   			surface.Area(176,41+r*20,199,59+r*20);

            // Round Number
            surface.SetForeground(white);
   			surface.CenterTextf(12,40+r*20,"%d",(r+scoreScroll)+1);

   			// Shuffle
   			surface.CenterTextf(37,40+r*20,"%c",ruff.game.players[shuffle].name[0]);

   			// Bet
            if(r + scoreScroll < ruff.game.round || 
               (r + scoreScroll == ruff.game.round && !ruff.game.betting && ruff.game.gameStarted))
            {
               int x = (round->bet.player%2) ? 188 : 162;
               int y = 40+r*20;
   			   if(round->bet.howMuch == RUFF)
   			   {
   				   surface.SetForeground(Color{ 0,0,192 });
                  surface.CenterTextf(x, y, "R");
   			   }
   			   else
               {
   			      surface.SetForeground(white);
   			      if(round->bet.howMuch==100)
                     surface.CenterTextf(x, y, "C");
                  else
                     surface.CenterTextf(x, y, "%d",round->bet.howMuch);
               }
            }
   		}

         // Scores
   		for(r=0; r<scoreScroll; r++)
   		{
            Round * round = &ruff.game.rounds[r];
   			scores[0] += round->scores[0];
   			scores[1] += round->scores[1];
   		}
   		for(r=scoreScroll; r<ruff.game.round+1; r++)
   		{
            Round * round = &ruff.game.rounds[r];
   			scores[0] += round->scores[0];
   			scores[1] += round->scores[1];

            if(r < ruff.game.round || 
               (r == ruff.game.round && !ruff.game.betting && ruff.game.gameStarted))
            {
   			   // Winning box
               if(r < ruff.game.round)
               {
   			      surface.SetBackground(RED);
   			      if((scores[0] >= 500 || scores[1] >= 500) && scores[0] != scores[1])
                  {
   				      if(scores[0] > scores[1])
   					      surface.Area(51,41+(r-scoreScroll)*20,149,59+(r-scoreScroll)*20);
   				      else
   					      surface.Area(201,41+(r-scoreScroll)*20,299,59+(r-scoreScroll)*20);
                  }
               }
   				   
   			   // Current Score
               ShowScore(surface,  75, 40 + (r-scoreScroll) * 20, round->scores[0], r);
               ShowScore(surface, 225, 40 + (r-scoreScroll) * 20, round->scores[1], r);
            }

            if(r<ruff.game.round)
            {
   			   // Total Score
               ShowScore(surface, 125, 40 + (r-scoreScroll) * 20, scores[0], r);
               ShowScore(surface, 275, 40 + (r-scoreScroll) * 20, scores[1], r);
            }
   		}
   	}
   }

   void OnVScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }
}
