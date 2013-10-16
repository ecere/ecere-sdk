/****************************************************************************
   ECERE Tile Engine

   Copyright (c) 1997-2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   astar.ec - A* Path Finding Algorithm
****************************************************************************/
import "ecere"

#define TILE(a,b,d) ((b)*d.x+(a))
#define TILENUM(p,d) TILE((p).x,(p).y,d)

struct ASNode
{
   ASNode *parent;
   ASNode *child[8];       // a node may have up to 8+(NULL) children
   ASNode *nextNode;       // for filing purposes
   int f,h;
   int g,tmpg;
   int nodeNum;
   Point position;
};

struct AStar
{
   void ** stack;
   int stackSize;
   int stackIndex;
   ASNode **openMap;
   ASNode **closedMap;
   ASNode *open;
   ASNode *closed;
};

void AStarTerminate(AStar * aStar)
{
   if(aStar)
   {
      if(aStar->stack) delete aStar->stack;
      if(aStar->openMap) delete aStar->openMap;
      if(aStar->closedMap) delete aStar->closedMap;
      delete aStar;
   }
}

AStar * AStarInitialize(int width, int height, int stackSize)
{
   AStar * result = null;
   AStar * aStar = new0 AStar[1];
   if(aStar)
   {
      aStar->stackSize = stackSize;
      aStar->stack = new0 void *[stackSize];
      aStar->stackIndex = 0;
      aStar->openMap = new0 ASNode *[width*height];
      aStar->closedMap=new0 ASNode *[width*height];
   }
   return aStar;
}

static ASNode * AStarRBestNode(AStar * aStar)
{
   ASNode *tmp;

   if(!aStar->open->nextNode)
      return null;

   tmp=aStar->open->nextNode;
   aStar->open->nextNode=tmp->nextNode;

   tmp->nextNode=aStar->closed->nextNode;
   aStar->closed->nextNode=tmp;
   aStar->openMap[tmp->nodeNum]=null;
   aStar->closedMap[tmp->nodeNum]=tmp;
   return tmp;
}

static void AStarPropagateDown(AStar * aStar, ASNode *old)
{
   int c,g;
   ASNode *child, *father;

   g=old->g;
   for(c=0;c<8;c++)
   {
      child=old->child[c];
      if(!child)break;
      if(g+1<child->g)
      {
	      child->g=g+1;
	      child->f=child->g+child->h;
	      child->parent=old;
         if(aStar->stackIndex>=aStar->stackSize)
            break;
         aStar->stack[aStar->stackIndex++] = child;
      }
   }

   while(aStar->stackIndex > 0)
   {
      father=aStar->stack[--aStar->stackIndex];
      for(c=0; c<8; c++)
      {
         child=father->child[c];
         if(!child) break;
         if(father->g+1<child->g)
         {
            child->g=father->g+1;
	         child->f=child->g+child->h;
            child->parent=father;
            if(aStar->stackIndex>=aStar->stackSize)
               break;
            aStar->stack[aStar->stackIndex++] = child;
         }
      }
   }
}

static void AStarInsert(AStar * aStar, ASNode *successor)
{
   ASNode *tmp1,*tmp2;
   long f;

   aStar->openMap[successor->nodeNum]=successor;
   if(!aStar->open->nextNode)
   {
      aStar->open->nextNode=successor;
      return;
   }

   f=successor->f;
   tmp1=aStar->open;
   tmp2=aStar->open->nextNode;

   while(tmp2&&(tmp2->f<f))
   {
      tmp1=tmp2;
      tmp2=tmp2->nextNode;
   }
   successor->nextNode=tmp2;
   tmp1->nextNode=successor;
}

static void AStarGenerateSucc(AStar * aStar, ASNode *bestNode, int positionX, int positionY, int tileNumS,Point destination)
{
   int g,c=0;
   ASNode *old,*successor;

   g=bestNode->g+1;

   if((old=aStar->openMap[tileNumS]))
   {
      for(c=0;c<8;c++)
         if(!bestNode->child[c]) break;
      bestNode->child[c]=old;

      if(g<old->g)
      {
         old->parent=bestNode;
         old->g=g;
         old->f=g+old->h;
      }
   }
   else if((old=aStar->closedMap[tileNumS]))
   {
      for(c=0;c<8;c++)
         if(!bestNode->child[c]) break;
      bestNode->child[c]=old;

      if(g<old->g)
      {
         old->parent=bestNode;
         old->g=g;
         old->f=g+old->h;
         AStarPropagateDown(aStar, old);
      }
   }
   else
   {
      successor = new0 ASNode[1];
      successor->parent=bestNode;
      successor->g=g;
      successor->h=(positionX-destination.x)*(positionX-destination.x)+
                   (positionY-destination.y)*(positionY-destination.y);
      successor->f=g+successor->h;
      successor->position.x=positionX;
      successor->position.y=positionY;
      successor->nodeNum=tileNumS;
      AStarInsert(aStar, successor);
      for(c=0;c<8;c++)
         if(!bestNode->child[c]) break;
      bestNode->child[c]=successor;
   }
}

static void AStarGenerateSuccessors(AStar * aStar, ASNode *bestNode, byte *map, Point dim, Point destination)
{
   int x,y;

   for(y = bestNode->position.y - 1; y < bestNode->position.y + 2; y++)
      for(x = bestNode->position.x - 1; x < bestNode->position.x + 2; x++)
         if((x >= 0) && (y >= 0) && (x < dim.x) && (y < dim.y))
            if(x < bestNode->position.x || y < bestNode->position.y || x >= bestNode->position.x + 1 || y >= bestNode->position.y + 1)
            {
               if(map[TILE(x,y,dim)])
                  AStarGenerateSucc(aStar, bestNode,x,y,TILE(x,y,dim),destination);
            }
}

ASNode * AStarFindPath(AStar * aStar, byte * map,Point dim,Point start,Point destination, int iterations)
{
   ASNode *node, *bestNode;
   int tileNumDest;
   uint16 c;

   tileNumDest = TILENUM(destination,dim);

   aStar->open = new0 ASNode[1];
   aStar->closed = new0 ASNode[1];

   node = new0 ASNode[1];
   node->g=0;
   node->h=(start.x-destination.x)*(start.x-destination.x)+
           (start.y-destination.y)*(start.y-destination.y);
   node->f=node->g+node->h;
   node->nodeNum = TILENUM(start,dim);
   node->position = start;

   aStar->open->nextNode=node;
   aStar->openMap[node->nodeNum]=node;

   if(!map[TILENUM(destination,dim)])
      return null;
   for(c=0;c<iterations;c++)
   {
      bestNode=AStarRBestNode(aStar);
      if(!bestNode) return null;
      if(bestNode->nodeNum==tileNumDest)
         return bestNode;
      AStarGenerateSuccessors(aStar, bestNode,map,dim,destination);
   }
   return null;
}

void AStarFreeNodes(AStar * aStar)
{
   ASNode *node,*tmp;
   node=aStar->open;
   while(node)
   {
      aStar->openMap[node->nodeNum]=null;
      tmp=node;
      node=tmp->nextNode;
      delete tmp;
   }
   node=aStar->closed;
   while(node)
   {
      aStar->closedMap[node->nodeNum]=null;
      tmp=node;
      node=tmp->nextNode;
      delete tmp;
   }
}
