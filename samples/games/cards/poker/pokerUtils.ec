/****************************************************************************
   POKER Game Interface

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   pokerutils.c - Poker Backend Utilities
****************************************************************************/
import "poker.ec"

// --- Data ---

static int handsRests[10] = { 5, 3, 1, 2, 0, 0, 0, 1, 0, 0 };

// { 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A }
// { 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A }
// { 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A }
// { 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A }

// --- Static Utilities ---

static int Compare(const int * a, const int * b)
{
   if(*a > *b) return 1; else if(*a < *b) return -1; else return 0;
}

static bool POKER_Straight(int cards[5])
{
   int c;
   for(c = 1; c<5; c++)
      if((cards[c] / 4 != cards[c-1] / 4 + 1) && !(cards[c - 1] / 4 == 12 && cards[c] / 4 == 0))
         return false;
   return true;
}

static bool POKER_Flush(int cards[5])
{
   int c;
   for(c = 1; c<5; c++)
      if(cards[c] % 4 != cards[0] % 4)
         return false;
   return true;
}

static bool POKER_Same(int cards[5], int howMany, int what[2], int rest[3])
{
   int c;
   int card;
   int numPairs = 0;

   for(card = 0; card<13; card++)
   {
      int num = 0;
      for(c = 0; c < 5; c++)
      {
         if(cards[c] / 4 == card)
            num++;
      }
      if(num == howMany)
      {
         what[numPairs++] = card;
      }
   }
   if(numPairs)
   {
      int d;
      qsort(what, numPairs, sizeof(int), Compare);
      for(d = 0, c = 0; c<5; c++)
      {
         int w;
         for(w = 0; w < numPairs; w++)
            if(cards[c] / 4 == what[w])
               break;
         if(w == numPairs)
            rest[d++] = cards[c];
      }
   }
   return numPairs != 0;
}

// --- External Functions ---

void POKER_SortCards(int * cards, int numCards)
{
   qsort(cards, numCards, sizeof(int), Compare);
}

int POKER_Card(int card)
{
   if(card / 4 == 12)
      card -= 13 * 4;
   card += 4;
   return card;
}

void POKER_ShuffleDeck(int deck[52])
{
   int t;
   int count;

   count = GetRandom(1000, 2000);
   for(t = 0; t<count; t++)
   {
      // cut the deck in 2
      int cuts[2][52];
      int numCut[2];
      int indexCut[2] = {0,0};
      int cut = GetRandom(13, 39);
      int c;

      for(c = 0; c<cut; c++)
         cuts[0][c] = deck[c];
      for(c = cut; c<52; c++)
         cuts[1][c - cut] = deck[c];

      numCut[0] = cut;
      numCut[1] = 52 - cut;

      // Mix the cards
      for(c = 0; c<52; c++)
      {
         int whichCut;

         if(indexCut[0] < numCut[0] && indexCut[1] < numCut[1])
            whichCut = GetRandom(0,1);
         else if(indexCut[0] < numCut[0])
            whichCut = 0;
         else if(indexCut[1] < numCut[1])
            whichCut = 1;

         deck[c] = cuts[whichCut][indexCut[whichCut]++];
      }
   }
}

PokerHand POKER_HandType(int cards[5])
{
   bool flush, straight;
   int numPairs, numTris, numQuads;
   int rest[5];
   int pairs[2], tris, quads;

   /*** DETERMINE HAND TYPE ***/
   flush    = POKER_Flush(cards);
   straight = POKER_Straight(cards);
   numPairs = POKER_Same(cards, 2, pairs, rest);
   numTris  = POKER_Same(cards, 3, &tris, rest);
   numQuads = POKER_Same(cards, 4, &quads, rest);

   if(straight && flush)
   {
      if(cards[4] / 4 == 12)
         return royalFlush;
      else
         return straightFlush;
   }
   else if(numQuads)
      return fourOfAKind;
   else if(numPairs && numTris)
      return fullHouse;
   else if(flush)
      return PokerHand::flush;
   else if(straight)
      return PokerHand::straight;
   else if(numTris)
      return threeOfAKind;
   else if(numPairs == 2)
      return twoPair;
   else if(numPairs)
      return onePair;
   else
      return nothing;
}

int POKER_Compare(int cards1[5], int cards2[5])
{
   bool flush[2], straight[2];
   int numPairs[2], numTris[2], numQuads[2];
   int * cards;

   int rest[2][5];
   int pairs[2][2], tris[2], quads[2];
   PokerHand handType[2];
   int h;
   int c;
   int numRest[2];

   int winner = 0;

   for(h = 0; h<2; h++)
   {
      cards = (h == 0) ? cards1 : cards2;

      /*** DETERMINE HAND TYPE ***/
      flush[h]    = POKER_Flush(cards);
      straight[h] = POKER_Straight(cards);
      numPairs[h] = POKER_Same(cards, 2, pairs[h], rest[h]);
      numTris[h]  = POKER_Same(cards, 3, &tris[h], rest[h]);
      numQuads[h] = POKER_Same(cards, 4, &quads[h], rest[h]);

      if(straight[h] && flush[h])
      {
         if(cards[4] / 4 == 12)
            handType[h] = royalFlush;
         else
            handType[h] = straightFlush;
      }
      else if(numQuads[h])
         handType[h] = fourOfAKind;
      else if(numPairs[h] && numTris[h])
         handType[h] = fullHouse;
      else if(flush[h])
         handType[h] = PokerHand::flush;
      else if(straight[h])
         handType[h] = PokerHand::straight;
      else if(numTris[h])
         handType[h] = threeOfAKind;
      else if(numPairs[h] == 2)
         handType[h] = twoPair;
      else if(numPairs[h])
         handType[h] = onePair;
      else
      {
         handType[h] = nothing;
         CopyBytesBy4(rest[h], cards, 5);
      }
      numRest[h] = handsRests[handType[h]];
   }

   /*** DETERMINE WINNING HAND ***/
   if(handType[1] > handType[0])
      winner = 1;
   else if(handType[0] > handType[1])
      winner = -1;
   else
   {
      switch(handType[0])
      {
         case straightFlush:
            if(cards2[4] / 4 > cards1[4] / 4)
               winner = 1;
            else if(cards1[4] / 4> cards2[4] / 4)
               winner = -1;
            break;
         case fourOfAKind:
            if(quads[1] > quads[0] )
               winner = 1;
            else if(quads[0] > quads[1])
               winner = -1;
            break;
         case fullHouse:
            if(tris[1] > tris[0] )
               winner = 1;
            else if(tris[0] > tris[1])
               winner = -1;
            else if(pairs[1][0] > pairs[0][0])
               winner = 1;
            else if(pairs[0][0] > pairs[1][0])
               winner = -1;
            break;
         case PokerHand::flush:
            for(c = 4; c>=0; c--)
            {
               if(cards2[c] / 4 > cards1[c] / 4)
               {
                  winner = 1;
                  break;
               }
               else if(cards1[c] / 4 > cards2[c] / 4)
               {
                  winner = -1;
                  break;
               }
            }
            break;
         case PokerHand::straight:
            if(cards2[4] / 4> cards1[4] / 4)
               winner = 1;
            else if(cards1[4] / 4> cards2[4] / 4)
               winner = -1;
            break;
         case threeOfAKind:
            if(tris[1] > tris[0] )
               winner = 1;
            else if(tris[0] > tris[1])
               winner = -1;
            break;
         case twoPair:
            if(pairs[1][1] > pairs[0][1])
               winner = 1;
            else if(pairs[0][1] > pairs[1][1])
               winner = -1;
            else if(pairs[1][0] > pairs[0][0])
               winner = 1;
            else if(pairs[0][0] > pairs[1][0])
               winner = -1;
            break;
         case onePair:
            if(pairs[1][0] > pairs[0][0])
               winner = 1;
            else if(pairs[0][0] > pairs[1][0])
               winner = -1;
            break;
      }

      /*** NO WINNER FROM TYPES, TRY TO SPLIT WITH THE rest ***/
      if(!winner)
      {
         for(c = numRest[0] - 1; c>=0; c--)
         {
            if(rest[1][c] / 4> rest[0][c] / 4)
            {
               winner = 1;
               break;
            }
            else if(rest[0][c] / 4 > rest[1][c] / 4)
            {
               winner = -1;
               break;
            }
         }
      }
   }
   return winner;
}

void POKER_BestHand(int * cards1, int * cards2, int n1, int n2, int r1, int r2, int output[5])
{
   static int pos = 0;
   static int start1 = 0;
   static int start2 = 0;
   static int currentHand[5];

   if(pos == 5)
   {
      int temp[5];
      CopyBytesBy4(temp, currentHand, 5);
      qsort(temp, 5, sizeof(int), Compare);
      if(POKER_Compare(output, temp) == 1)
         CopyBytesBy4(output, temp, 5);
   }
   else
   {
      int oldStart, c;

      if(pos >= r1)
      {
         oldStart = start2;
         for(c = start2; c < n2 - (5 - pos - 1); c++)
         {
            start2 = c + 1;
            currentHand[pos++] = cards2[c];
            POKER_BestHand(cards1, cards2, n1, n2, r1, r2, output);
            pos--;
         }
         start2 = oldStart;
      }
      else
      {
         oldStart = start1;
         for(c = start1; c < n1 - (r1 - pos - 1); c++)
         {
            start1 = c + 1;
            currentHand[pos++] = cards1[c];
            POKER_BestHand(cards1, cards2, n1, n2, r1, r2, output);
            pos--;
         }
         start1 = oldStart;
      }

      // Added this recently : was only using 5-r1 from cards2
      if(pos >= r2)
      {
         oldStart = start1;
         for(c = start1; c < n1 - (5 - pos - 1); c++)
         {
            start1 = c + 1;
            currentHand[pos++] = cards1[c];
            POKER_BestHand(cards1, cards2, n1, n2, r1, r2, output);
            pos--;
         }
         start1 = oldStart;
      }
      else
      {
         oldStart = start2;
         for(c = start2; c < n2 - (r2 - pos - 1); c++)
         {
            start2 = c + 1;
            currentHand[pos++] = cards2[c];
            POKER_BestHand(cards1, cards2, n1, n2, r1, r2, output);
            pos--;
         }
         start2 = oldStart;
      }
   }
}

/*
void POKER_BestHand(int * cards, int n, int output[5])
{
   static int pos = 0;
   static int start = 0;
   static int currentHand[5];
   int c;

   for(c = start; c < n - (5 - pos - 1); c++)
   {
      currentHand[pos] = cards[c];
      if(pos == 5 - 1)
      {
         int temp[5];
         CopyBytesBy4(temp, currentHand, 5);
         qsort(temp, 5, sizeof(int), Compare);
         if(POKER_Compare(output, temp) == 1)
            CopyBytesBy4(output, temp, 5);
      }
      else
      {
         int oldStart = start;
         start = c + 1;
         pos++;
         POKER_BestHand(cards, n, output);
         pos--;
         start = oldStart;
      }
   }
}
*/
