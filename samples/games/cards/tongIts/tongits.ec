import "ecere"

#define MCARD(k,n) ((n) * 4 + (k))
#define NUMBER(id) ((id) / 4)
#define KIND(id)   ((id) % 4)
#define OFFSETTER1   15
#define OFFSETTER2   120
#define HOUSETYPE_STRAIGHT 0
#define HOUSETYPE_KIND     1

typedef struct
{
   int typeOfHouse;

   union
   {
      struct straight
      {
         int first, last;
         int suit;
      } straight;
      struct kind
      {
         int number;
         bool suits[4];
      } kind;
   };
} House;

typedef struct
{
   int numCards;
   int cardValues[13];
   House houseDown[4];
   int numHouseDown;
   bool cardLifted[13];
   bool callTag;
} Player;

int cards[52];
int discard[28];
int discardCounter = 0;
int deckCounter = 0;
int numOfPlayers = 4;
int currentPlayer = 0;
int cardToReposition = 0;
int xMouseMove=0,yMouseMove=0,xLeftButtonUp=0,yLeftButtonUp=0;
int xCursorPositionAtCard=0,yCursorPositionAtCard=0,width=0,height=0;
int dragCard = -1;
Player player[4];
Point xyPositions[4] =
{
   {30,150},
   {30,500},
   {600,500},
   {600,150}
};

bool flagButtonDown, leftDoubleClick, gameOver;

//player[0].houseDown[0].straight.suit

void NewDeckOfCards()
{
   int i;
   for(i=0;i<52;i++)
   {
      cards[i]=i;
   }
}

void Shuffle()
{
   int i,j,randNum;
   for(i=0;i<52;i++)
   {
      randNum = GetRandom(0,51);
      j=cards[i];
      cards[i]=cards[randNum];
      cards[randNum]=j;
   }
}

void DealCards(int numPlayers)
{
   int c, p;

   player[0].cardValues[player[0].numCards++] = cards[deckCounter++];
   for(c = 0; c<((numPlayers > 3) ? 9 : 12); c++)
      for(p = 0; p<numPlayers; p++)
         player[(p+1)%numPlayers].cardValues[player[(p+1)%numPlayers].numCards++] = cards[deckCounter++];
   //player[0].houseDown[0].straight.suit
}

int CheckHouse(int cardsToCheck,int * checkIfHouse)
{
   int i,straight=0,house=0;
   for(i=cardsToCheck-1;i>=0;i--)
   {
      if(checkIfHouse[i] == checkIfHouse[i-1] + 4)
      {
         straight++;  //possible straight house
      }
      else if(NUMBER(checkIfHouse[i]) == NUMBER(checkIfHouse[i-1]))
      {
         house++;    //possible 3or4 of a kind house
      }
   }
   if(straight == cardsToCheck-1)
      return 0;
   else if(house == cardsToCheck-1)
      return 1;
   else
      return -1;
}

int CompareInteger(int * a, int * b)
{
   if(*a > *b)
      return 1;
   else if(*b > *a)
      return -1;
   else return 0;
}

void SortPlayerCards()
{
   int c;
   for(c=0;c<numOfPlayers;c++)
   {
      qsort(player[c].cardValues,player[c].numCards,sizeof(int),CompareInteger);
      //qsort(tempHouse,tempCtr,sizeof(int),CompareInteger);
   }
}

class TongIts : Window
{
   Bitmap bitmapCards[52];
   Bitmap cardBack {};
   Button drawButton[4], chowButton[4], dumpButton[4], callButton[4], showButton[4], doneButton[4];

   hasClose = true;
   hasMinimize = true;
   hasMaximize = true;
   background = Color { 113,156,169 };
   borderStyle = sizable;
   text = "Tong-Its";
   size = Size { 900,700 };

   bool OnCreate()
   {
      int c;
      RandomSeed((int)(GetTime() * 1000));
      NewDeckOfCards();
      Shuffle();
      DealCards(numOfPlayers);
      SortPlayerCards();
      for(c = 0; c<numOfPlayers; c++)
      {
         drawButton[c] = Button { this, text = "Draw Card", position = xyPositions[c], size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = DrawClicked };
         chowButton[c] = Button { this, text = "Chow", position = Point { xyPositions[c].x + 80,xyPositions[c].y }, size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = ChowClicked };
         dumpButton[c] = Button { this, text = "Dump", position = Point { xyPositions[c].x + 160, xyPositions[c].y }, size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = DumpClicked };
         callButton[c] = Button { this, text = "Call", position = Point { xyPositions[c].x, xyPositions[c].y + 20 }, size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = CallClicked };
         showButton[c] = Button { this, text = "Show", position = Point { xyPositions[c].x + 80, xyPositions[c].y + 20 }, size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = ShowClicked };
         doneButton[c] = Button { this, text = "Done", position = Point { xyPositions[c].x + 160, xyPositions[c].y + 20 },size = Size { 80,20 }, id = c*6, disabled = true, NotifyClicked = DoneClicked };
      }
      showButton[currentPlayer].disabled = false;
      dumpButton[currentPlayer].disabled = false;
      return true;
   }

   bool OnLoadGraphics()
   {
      int i;
      Bitmap ptrCardLoad {};
      ptrCardLoad.Load(":cards.pcx",null,null);
      cardBack.LoadT(":ecereCard.png", null, displaySystem);

      for(i=0;i<52;i++)
      {
         Bitmap bitmap { transparent = true };
         bitmap.Allocate(null,ptrCardLoad.width, ptrCardLoad.height/52,0,pixelFormat8,true);
         CopyBytesBy4(bitmap.palette, ptrCardLoad.palette, 256);
         bitmap.Grab(ptrCardLoad,0,(ptrCardLoad.height/52)*i);
         bitmap.MakeDD(displaySystem);
         bitmapCards[i] = bitmap;
      }
      delete ptrCardLoad;
      return true;
   }

   void OnUnloadGraphics()
   {
      int i;
      for(i=0;i<52;i++)
         bitmapCards[i].Free();
   }

   void GameOver()
   {
      /*
      Window gameOverBox
      {
         this, hasClose = true, background = LightBlue, text = "Game Over", [position.y] = A_CENTER|20, size = Size { 300, 200 }
      };
      Button { gameOverBox, text = "Close", [position.y] = A_CENTER|80, size = Size { 80,20 } };
      */
      gameOver = true;
   }

   void OnRedraw(Surface surface)
   {
      int h=0,i=0,j=0,k=0,x=0;

      surface.Rectangle(375, 315, 495, 475);

      if(gameOver)
      {
         surface.SetForeground(blue);
         surface.SetBackground(red);
   //      surface.Area(375,100,495,150);
         surface.Area(375,370,495,420);
         //surface.TextOpacity(true);
   //      surface.WriteTextf(398, 115,"GAME OVER");
         surface.WriteTextf(398, 385,"GAME OVER");
      }

      for(i=deckCounter,x=0;i<52;i+=5,x+=2)
      {
         Bitmap bitmap = cardBack;
         surface.Blit(bitmap,400 + x, 195 + x,0,0, bitmap.width,bitmap.height);
      }

      if(discardCounter > 0)
      {
         Bitmap bitmap = bitmapCards[discard[discardCounter-1]];
         surface.Blit(bitmap, xLeftButtonUp, yLeftButtonUp,0,0, bitmap.width,bitmap.height);
      }

      for(j=0;j<numOfPlayers;j++)
      {
         for(i=0;i<player[j].numCards;i++)
         {
            if(player[j].cardValues[i] != dragCard || (!flagButtonDown))
            {
               Bitmap bitmap = bitmapCards[player[j].cardValues[i]];
               if(player[j].cardLifted[i])
               {
                  surface.Blit(bitmap,xyPositions[j].x + OFFSETTER1 * i,xyPositions[j].y - OFFSETTER2 - 20,0,0, bitmap.width,bitmap.height);
               }
               else
               {
                  surface.Blit(bitmap,xyPositions[j].x + OFFSETTER1 * i,xyPositions[j].y - OFFSETTER2,0,0, bitmap.width,bitmap.height);
               }
            }
         }
         for(i=0,h=0;i<player[j].numHouseDown;i++,h++)
         {
            if(player[j].houseDown[i].typeOfHouse == 0)
            {
               for(k=player[j].houseDown[i].straight.first;k<=player[j].houseDown[i].straight.last;k++)
               {
                  Bitmap bitmap = bitmapCards[MCARD((player[j].houseDown[i].straight.suit),(k))];
                  surface.Blit(bitmap,xyPositions[j].x + OFFSETTER1 * h,xyPositions[j].y + 75,0,0, bitmap.width,bitmap.height);
                  h++;
               }
            }

            if(player[j].houseDown[i].typeOfHouse == 1)
            {
               for(k=0;k<4;k++) //player[j].houseDown[i].kind.suits[k]
               {
                  if(player[j].houseDown[i].kind.suits[k] == true)
                  {
                     Bitmap bitmap = bitmapCards[MCARD((k),(player[j].houseDown[i].kind.number))];
                     surface.Blit(bitmap,xyPositions[j].x + OFFSETTER1 * h,xyPositions[j].y + 75,0,0, bitmap.width,bitmap.height);
                     h++;
                  }  //_2D xyPositions[4] = {{30,150},{30,500},{540,500},{540,150}};
               }
            }
         }
      }
      if(flagButtonDown)
      {
         for(i=0;i<player[currentPlayer].numCards;i++)
         {
            Bitmap bitmap = bitmapCards[player[currentPlayer].cardValues[i]];
            if(player[currentPlayer].cardValues[i] == dragCard)
            {
               surface.Blit(bitmap,xMouseMove + xCursorPositionAtCard,yMouseMove + yCursorPositionAtCard,0,0, bitmap.width,bitmap.height);
            }
         }
      }
      if(gameOver)
      {
         surface.SetForeground(blue);
         surface.SetBackground(red);
   //      surface.Area(375,100,495,150);
         surface.Area(375,370,495,420);
         //surface.TextOpacity(true);
   //      surface.WriteTextf(398, 115,"GAME OVER");
         surface.WriteTextf(398, 385,"GAME OVER");
         for(i=0;i<numOfPlayers;i++)
         {
            drawButton[i].disabled = true;
            chowButton[i].disabled = true;
            dumpButton[i].disabled = true;
            callButton[i].disabled = true;
            showButton[i].disabled = true;
            doneButton[i].disabled = true;
         }
   //      eWindow_Create("MessageBox",MSGBOX_OK,ES_CAPTION,window,null,A_LEFT,A_RIGHT,200,100,0,null,0,null,0);
      }
   /*      if(j == 1)
         {
            for(i=0;i<player[j].numCards;i++)
            {
               Bitmap bitmap = bitmapCards[MCARD(KIND(player[2].cardValues[i]),NUMBER(player[2].cardValues[i]))];
               surface.Blit(bitmap,30+15*i,500,0,0, bitmap.width,bitmap.height);
            }
         }
         else
         {
            for(i=0;i<player[j].numCards;i++)
            {
               //Bitmap bitmap1 = bitmapCards[MCARD(KIND(player[1].cardValues[i]),NUMBER(player[1].cardValues[i]))];
               Bitmap bitmap = cardBack;
               surface.Blit(bitmap,30+15*i,30+nextLane,0,0, bitmap.width,bitmap.height);
            }
         }
      }*/
   }

   bool DrawClicked(Button button, int x, int y, Modifiers mods)
   {
      player[currentPlayer].cardValues[player[currentPlayer].numCards++] = cards[deckCounter++];
      drawButton[currentPlayer].disabled = true;
      chowButton[currentPlayer].disabled = true;
      callButton[currentPlayer].disabled = true;
      showButton[currentPlayer].disabled = false;
      dumpButton[currentPlayer].disabled = false;
      Update(null);
      return true;
   }

   bool ChowClicked(Button button, int x, int y, Modifiers mods)
   {
      int i, j, suit, number;
      int tempCtr = 0;
      int tempHouse[13];
      for(i=0;i<13;i++)
      {
         tempHouse[i]=0;
      }
      suit = KIND(discard[discardCounter-1]);
      number = NUMBER(discard[discardCounter-1]);
      tempHouse[tempCtr++] = discard[discardCounter-1];
      for(i=0;i<player[currentPlayer].numCards;i++)
      {
         if(player[currentPlayer].cardLifted[i])
         {
            tempHouse[tempCtr++] = player[currentPlayer].cardValues[i];
         }
      }
      if(tempCtr >= 3)
      {
         int checkResult;

         qsort(tempHouse,tempCtr,sizeof(int),CompareInteger);
         checkResult = CheckHouse(tempCtr,tempHouse);
         switch(checkResult)
         {
            // 3/4 of a kind
            case 1:
            {
               House * house = &player[currentPlayer].houseDown[player[currentPlayer].numHouseDown];
               house->typeOfHouse = checkResult;
               for(i=0;i<tempCtr;i++)
               {
                  house->kind.number = NUMBER(tempHouse[i]);
                  house->kind.suits[KIND(tempHouse[i])] = true;
               }
               player[currentPlayer].numHouseDown++;
               break;
            }
            case 0:
            {
               House * house = &player[currentPlayer].houseDown[player[currentPlayer].numHouseDown];
               house->typeOfHouse = checkResult;
               house->straight.first = NUMBER(tempHouse[0]);
               house->straight.last = NUMBER(tempHouse[tempCtr-1]);
               house->straight.suit = KIND(tempHouse[0]);
               player[currentPlayer].numHouseDown++;
               break;
            }
            case -1:
            {
               return true;
               break;
            }
         }
         for(i=0,j=0;i<player[currentPlayer].numCards;i++)
         {
            if(!player[currentPlayer].cardLifted[i])
            {
               player[currentPlayer].cardValues[j] = player[currentPlayer].cardValues[i];
               player[currentPlayer].cardLifted[j] = false;
               j++;
            }
         }
         player[currentPlayer].numCards = j;
         discard[discardCounter--];
         drawButton[currentPlayer].disabled = true;
         chowButton[currentPlayer].disabled = true;
         callButton[currentPlayer].disabled = true;
         showButton[currentPlayer].disabled = false;
         dumpButton[currentPlayer].disabled = false;
         Update(null);
      }
     if(player[currentPlayer].numCards == 0)
     {
         GameOver();
     }
     return true;
  }

   bool DumpClicked(Button button, int x, int y, Modifiers mods)
   {
      MessageBox { text = button.text }.Create();
      return true;
   }

   bool CallClicked(Button button, int x, int y, Modifiers mods)
   {
      MessageBox { text = button.text }.Create();
      return true;
   }

   bool ShowClicked(Button button, int x, int y, Modifiers mods)
   {
      int i, j;
      int tempHouse[13];
      int tempCtr = 0;
      for(i=0;i<13;i++)
      {
         tempHouse[i]=0;
      }
      for(i=0;i<player[currentPlayer].numCards;i++)
      {
         if(player[currentPlayer].cardLifted[i])
         {
            tempHouse[tempCtr++] = player[currentPlayer].cardValues[i];
         }
      }
      if(tempCtr >= 3)
      {
         int checkResult;
         qsort(tempHouse,tempCtr,sizeof(int),CompareInteger);
         checkResult = CheckHouse(tempCtr,tempHouse);
         switch(checkResult)
         {
            // 3/4 of a kind
            case 1:
            {
               House * house = &player[currentPlayer].houseDown[player[currentPlayer].numHouseDown];
               house->typeOfHouse = checkResult;
               for(i=0;i<tempCtr;i++)
               {
                  house->kind.number = NUMBER(tempHouse[i]);
                  house->kind.suits[KIND(tempHouse[i])] = true;
               }
               player[currentPlayer].numHouseDown++;
               break;
            }
            case 0:
            {
               House * house = &player[currentPlayer].houseDown[player[currentPlayer].numHouseDown];
               house->typeOfHouse = checkResult;
               house->straight.first = NUMBER(tempHouse[0]);
               house->straight.last = NUMBER(tempHouse[tempCtr-1]);
               house->straight.suit = KIND(tempHouse[0]);
               player[currentPlayer].numHouseDown++;
               break;
            }
            case -1:
            {
               return true; //false;
               break;
            }
         }
         for(i=0,j=0;i<player[currentPlayer].numCards;i++)
         {
            if(!player[currentPlayer].cardLifted[i])
            {
               player[currentPlayer].cardValues[j] = player[currentPlayer].cardValues[i];
               player[currentPlayer].cardLifted[j] = false;
               j++;
            }
         }
         player[currentPlayer].numCards = j;
         if(player[currentPlayer].numCards == 0)
         {
            GameOver();
         }
         Update(null);
      }
      return true;
   }

   bool DoneClicked(Button button, int x, int y, Modifiers mods)
   {
      MessageBox { text = button.text }.Create();
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(flagButtonDown)
      {
         xMouseMove = x;
         yMouseMove = y;
         Capture();
         Update(null);
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      int i;
      if(!gameOver)
      {
         for(i=player[currentPlayer].numCards-1;i>=0;i--)
         {
            Bitmap bitmap = bitmapCards[player[currentPlayer].cardValues[i]];
            if(Box {
               xyPositions[currentPlayer].x + (OFFSETTER1 * i),
               (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) :( xyPositions[currentPlayer].y - OFFSETTER2)),
               bitmap.width + (xyPositions[currentPlayer].x + OFFSETTER1 * i),
               bitmap.height + (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) : (xyPositions[currentPlayer].y - OFFSETTER2))
               }.IsPointInside(Point { x, y }) && drawButton[currentPlayer].disabled)
            {
               dragCard = player[currentPlayer].cardValues[i];
               cardToReposition = i;
               width = bitmap.width;
               height = bitmap.height;
               xCursorPositionAtCard = (xyPositions[currentPlayer].x + (OFFSETTER1 * i)) - x;
               yCursorPositionAtCard = (player[currentPlayer].cardLifted[i] ?
                  (xyPositions[currentPlayer].y - OFFSETTER2 - y - 20) :
                  (xyPositions[currentPlayer].y - OFFSETTER2 - y));
               flagButtonDown = true;
               OnMouseMove(x,y,mods);
               break;
            }
         }
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      int h,i,j;
      Box boxDiscard={375, 315, 495, 475};
      Box boxCard = {x + xCursorPositionAtCard,y + yCursorPositionAtCard, x + xCursorPositionAtCard + width - 1, y + yCursorPositionAtCard + height - 1};
      if(flagButtonDown)
      {
         if(boxCard.Overlap(boxDiscard))
         {
            xLeftButtonUp = 400;
            yLeftButtonUp = 350;
            CopyBytesBy4(&player[currentPlayer].cardValues[cardToReposition],
               &player[currentPlayer].cardValues[cardToReposition+1],
               player[currentPlayer].numCards-1-cardToReposition);
            player[currentPlayer].numCards--;
            discard[discardCounter++] = dragCard;
            if(player[currentPlayer].numCards == 0 || deckCounter == 52)
            {
               GameOver();
            }
            else
            {
               for(i=0;i<player[currentPlayer].numCards;i++)
               {
                  player[currentPlayer].cardLifted[i] = false;
               }
               drawButton[currentPlayer].disabled = true;
               chowButton[currentPlayer].disabled = true;
               dumpButton[currentPlayer].disabled = true;
               callButton[currentPlayer].disabled = true;
               showButton[currentPlayer].disabled = true;
               doneButton[currentPlayer].disabled = true;
               player[currentPlayer].callTag = false;
               currentPlayer++;
               currentPlayer %= numOfPlayers;
               drawButton[currentPlayer].disabled = false;
               chowButton[currentPlayer].disabled = false;
               if(player[currentPlayer].numHouseDown >= 2 && player[currentPlayer].callTag == false)
                  callButton[currentPlayer].disabled = false;
            }
         }
         else
         {
            for(j=0;j<numOfPlayers;j++)
            {
               Bitmap bitmap = cardBack;
               Box boxHouseDown =
               {
                  xyPositions[j].x,xyPositions[j].y + 75,
                  0, xyPositions[j].y + 75 + bitmap.height
               };
               for(i=0;i<player[j].numHouseDown;i++)
               {
                  if(player[j].houseDown[i].typeOfHouse == 0)
                  {
                     boxHouseDown.right = boxHouseDown.left + bitmap.width +
                        (player[j].houseDown[i].straight.last - player[j].houseDown[i].straight.first) * OFFSETTER1 - 1;
                     if(boxCard.Overlap(boxHouseDown))
                     {
                        if(dragCard == MCARD((player[j].houseDown[i].straight.suit),(player[j].houseDown[i].straight.first)) - 4)
                        {
                           player[j].houseDown[i].straight.first --;
                           CopyBytesBy4(&player[currentPlayer].cardValues[cardToReposition],
                              &player[currentPlayer].cardValues[cardToReposition+1],
                              player[currentPlayer].numCards-1-cardToReposition);
                           player[currentPlayer].numCards--;
                           player[j].callTag = true;
                           j = numOfPlayers;
                           break;

                        }
                        else if(dragCard == MCARD((player[j].houseDown[i].straight.suit),(player[j].houseDown[i].straight.last )) + 4)
                        {
                           player[j].houseDown[i].straight.last ++;
                           CopyBytesBy4(&player[currentPlayer].cardValues[cardToReposition],
                              &player[currentPlayer].cardValues[cardToReposition+1],
                              player[currentPlayer].numCards-1-cardToReposition);
                           player[currentPlayer].numCards--;
                           player[j].callTag = true;
                           j = numOfPlayers;
                           break;
                        }
                     }
                     boxHouseDown.left +=
                        (player[j].houseDown[i].straight.last - player[j].houseDown[i].straight.first + 2) * OFFSETTER1;
                  }
                  else if(player[j].houseDown[i].typeOfHouse == 1)
                  {
                     if(player[j].houseDown[i].kind.suits[0] == false || player[j].houseDown[i].kind.suits[1] == false ||
                        player[j].houseDown[i].kind.suits[2] == false || player[j].houseDown[i].kind.suits[3] == false)
                     {
                        h=4;
                        boxHouseDown.right = boxHouseDown.left + (2 * OFFSETTER1) + bitmap.width - 1;
                     }
                     else
                     {
                        h=5;
                     }
                     if(boxCard.Overlap(boxHouseDown))
                     {
                        if(NUMBER(dragCard) == player[j].houseDown[i].kind.number)
                        {
                           player[j].houseDown[i].kind.suits[KIND(dragCard)] = true;
                           CopyBytesBy4(&player[currentPlayer].cardValues[cardToReposition],
                                 &player[currentPlayer].cardValues[cardToReposition+1],
                                 player[currentPlayer].numCards-1-cardToReposition);
                           player[currentPlayer].numCards--;
                           player[j].callTag = true;
                           j = numOfPlayers;
                           break;
                        }
                     }
                     boxHouseDown.left += (h * OFFSETTER1);
                  }
               }
            }
         }
         flagButtonDown = false;
         ReleaseCapture();
         Update(null);
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      int i;
      for(i=player[currentPlayer].numCards-1;i>=0;i--)
      {
         Bitmap bitmap = bitmapCards[player[currentPlayer].cardValues[i]];

         if(Box {
            xyPositions[currentPlayer].x + (OFFSETTER1 * i),
            (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) :(xyPositions[currentPlayer].y - OFFSETTER2)),
            bitmap.width + (xyPositions[currentPlayer].x + OFFSETTER1 * i),
            bitmap.height + (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) : (xyPositions[currentPlayer].y - OFFSETTER2))
            }.IsPointInside(Point{x,y}))
         {
            player[currentPlayer].cardLifted[i] ^= true;
            Update(null);
            return false;
         }

      }
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      int i;

      if(!gameOver)
      {
         for(i=player[currentPlayer].numCards-1;i>=0;i--)
         {
            Bitmap bitmap = bitmapCards[player[currentPlayer].cardValues[i]];
            if(Box {
               xyPositions[currentPlayer].x + (OFFSETTER1 * i),
               (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) :(xyPositions[currentPlayer].y - OFFSETTER2)),
               bitmap.width + (xyPositions[currentPlayer].x + OFFSETTER1 * i),
               bitmap.height + (player[currentPlayer].cardLifted[i] ? (xyPositions[currentPlayer].y - OFFSETTER2 - 20) : (xyPositions[currentPlayer].y - OFFSETTER2))
               }.IsPointInside(Point{x,y}) && drawButton[currentPlayer].disabled)

            {
               dragCard = player[currentPlayer].cardValues[i];
               cardToReposition = i;
               width = bitmap.width;
               height = bitmap.height;
               xCursorPositionAtCard = (xyPositions[currentPlayer].x + (OFFSETTER1 * i)) - x;
               yCursorPositionAtCard = (player[currentPlayer].cardLifted[i] ?
                  (xyPositions[currentPlayer].y - OFFSETTER2 - y - 20) :
                  (xyPositions[currentPlayer].y - OFFSETTER2 - y));
               flagButtonDown = true;
               OnMouseMove(x,y,mods);
               break;
            }
         }
      }

      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      Bitmap bitmap = cardBack;
      int swapCard,dest,source,i;
      Box boxPlayerCards={xyPositions[currentPlayer].x,xyPositions[currentPlayer].y - OFFSETTER2,
         xyPositions[currentPlayer].x + player[currentPlayer].numCards * OFFSETTER1 + bitmap.width,
         xyPositions[currentPlayer].y - OFFSETTER2 + bitmap.height};
      Box boxCard = {x + xCursorPositionAtCard,y + yCursorPositionAtCard, x + xCursorPositionAtCard,y + yCursorPositionAtCard + height - 1};

      if(flagButtonDown)
      {
         if(boxCard.Overlap(boxPlayerCards))
         {
            swapCard = (x  + xCursorPositionAtCard >= player[currentPlayer].numCards * 15 + xyPositions[currentPlayer].x) ?
               (player[currentPlayer].numCards-1) : ((x  + xCursorPositionAtCard - xyPositions[currentPlayer].x) / 15);
            if(cardToReposition > swapCard)
            {
               dest = swapCard + 1;
               MoveBytes(&player[currentPlayer].cardValues[dest],
                  &player[currentPlayer].cardValues[swapCard],(cardToReposition - swapCard) * sizeof(int));
               player[currentPlayer].cardValues[swapCard] = dragCard;
               //player[currentPlayer].cardLifted[swapCard] = false;
            }
            else
            {
               dest = cardToReposition;
               source = cardToReposition + 1;
               MoveBytes(&player[currentPlayer].cardValues[dest],
                  &player[currentPlayer].cardValues[source],(swapCard - cardToReposition) * sizeof(int));
                  player[currentPlayer].cardValues[swapCard] = dragCard;
               //player[currentPlayer].cardLifted[swapCard] = false;
            }

         }

         for(i=0;i<player[currentPlayer].numCards;i++)
         {
            player[currentPlayer].cardLifted[i] = false;
         }

         flagButtonDown = false;
         ReleaseCapture();
         Update(null);
      }
      return true;
   }
}

TongIts tongIts {};
