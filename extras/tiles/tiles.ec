/****************************************************************************
   ECERE Tile Engine

   Copyright (c) 1997-2005 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   tiles.ec - Main Module
****************************************************************************/
import "astar.ec"
import "sequence.ec"
import "sprite.ec"

define MAXLAYERS = 8;

#define TILE(a,b,d) ((b)*d.x+(a))
#define TILENUM(p,d) TILE((p).x,(p).y,d)

enum Direction : byte { North, NorthEast, East, SouthEast, South, SouthWest, West, NorthWest };
enum TileEvent { Standing = 2, Moving = 3 };

struct TileMap
{
   // Bitmaps
   int numTiles;
   int tileW, tileH;
   Bitmap * tileImage;

   // Geography Stuff
   uint16 * regions;
   uint16 * contents;
   uint16 * frames;
   
   // Dimension Stuff
   int numLayers;
   Point maxDim;

   // For each layer
   Point * dim;
   byte ** moves;
   TileUnit *** spaces;
   void * aStar;

   // What's this for??
   Direction direction;
   uint16 displaced; 
   byte retries;
   Point path[256];
   bool chase;
   void *target;
   int pathPos;
   TileEvent event;
   Point objective, door;
   uint16 * mapTiles;

   uint16 terrainType;
};

define MAXPATH         = 256;
define MAX_ITERATIONS  = 1000;

struct TileUnit
{
   byte space, covering[MAXLAYERS];
   int boxW,boxH;
   int w,h;
   Sequence * sequence;
   Sprite sprite;
   bool selected;
   int flash;
   bool pickable;
   byte * filter;
   int tick;
   int seqPos;
   void * data;

   // READ ONLY
   void *target;
   bool entering;
   bool displayed;
   Point pos;
   Point dest;
   int pathPos;

   Direction direction;
   uint16 displaced; 
   byte retries;
   Point path[MAXPATH];
   bool chase;
   TileEvent event;
   Point objective,door;
};

Direction MapDirection(int xd, int yd)
{
   if((xd==0)&&(yd<0))
      return North;
   else if((xd>0)&&(yd<0))
      return NorthEast;
   else if((xd>0)&&(yd==0))
      return East;
   else if((xd>0)&&(yd>0))
      return SouthEast;
   else if((xd==0)&&(yd>0))
      return South;
   else if((xd<0)&&(yd>0))
      return SouthWest;
   else if((xd<0)&&(yd==0))
      return West;
   else if((xd<0)&&(yd<0))
      return NorthWest;
}

static void MapForward(Direction direction, Point result, uint16 distance)
{
   switch(direction)
   {
      case North:                           result.y-=distance; break;
      case NorthEast:   result.x+=distance; result.y-=distance; break;
      case East:        result.x+=distance;                      break;
      case SouthEast:   result.x+=distance; result.y+=distance; break;
      case South:                           result.y+=distance; break;
      case SouthWest:   result.x-=distance; result.y+=distance; break;
      case West:        result.x-=distance;                      break;
      case NorthWest:   result.x-=distance; result.y-=distance; break;
   }
}

static uint16 MapLine(byte *map, Point dim, Point start, Point end, Point * path, bool free)
{
   Point position;
   short xdiff, ydiff;
   short xunit, yunit;
   short errorterm=0, length, i;

   position=start;

   xdiff=(short)(end.x-start.x);
   ydiff=(short)(end.y-start.y);
   if(xdiff<0)
   {
      xdiff=-xdiff;
      xunit=(short)-1;
   }
   else
      xunit=1;

   if(ydiff<0)
   {
      ydiff=-ydiff;
      yunit=(short)-1;
   }
   else
      yunit=1;

   if(xdiff>ydiff)
   {
      length=xdiff+1;
      for(i=0; i<length; i++)
      {
         //Here
         path[i] = position;

         if(map[TILE(position.x,position.y,dim)]!=(byte)free)
            return i;

         position.x+=xunit;
         errorterm+=ydiff;
         if(errorterm>xdiff/2)
         {
            errorterm-=xdiff;
            position.y+=yunit;
         }
      }
   }
   else
   {
      length=ydiff+1;
      for(i=0; i<length; i++)
      {
         //Here
         path[i]=position;

         if(map[TILE(position.x,position.y,dim)]!=(byte)free)
            return i;

         position.y+=yunit;
         errorterm+=xdiff;
         if(errorterm>ydiff/2)
         {
            errorterm-=ydiff;
            position.x+=xunit;
         }
      }
   }
   return i;
}

void MapFree(TileMap * map)
{
   if(map)
   {
      if(map->aStar) AStarTerminate(map->aStar);
      if(map->dim) delete map->dim;
      if(map->tileImage) delete map->tileImage;
      if(map->moves)
      {
         int e;
         for(e = 0; e<map->numLayers; e++)
            if(map->moves[e])
               delete map->moves[e];
         delete map->moves;
      }
      if(map->spaces)
      {
         int e;
         for(e = 0; e<map->numLayers; e++)
            if(map->spaces[e])
               delete map->spaces[e];
         delete map->spaces;
      }
      if(map->regions) delete map->regions;
      if(map->contents) delete map->contents;
      if(map->frames) delete map->frames;
      delete map;
   }
}

TileMap * MapCreate(int numLayers, int width, int height, int tileW, int tileH, int numTiles)
{
   TileMap * result = null;
   TileMap * map = new0 TileMap[1];
   if(map)
   {
      map->maxDim.x = width;
      map->maxDim.y = height;
      map->numLayers = numLayers;
      map->numTiles = numTiles;
      map->tileW = tileW;
      map->tileH = tileH;
     if( (map->dim = new0 Point[map->numLayers])                                &&
         (!numTiles || (map->tileImage = new0 Bitmap[map->numTiles]))          &&
         (map->moves = new0 byte *[map->numLayers])                            &&
         (map->spaces = new0 TileUnit **[map->numLayers])                      &&
         (map->regions = new0 uint16[map->maxDim.x*map->maxDim.y])               &&
         (map->contents= new0 uint16[map->maxDim.x*map->maxDim.y])               &&
         (map->frames  = new0 uint16[map->maxDim.x*map->maxDim.y])               &&
         (map->aStar = AStarInitialize(map->maxDim.x, map->maxDim.y, MAXPATH))       )
         result = map;
      if(!result)
         MapFree(map);
   }
   return result;
}

TileUnit * MapFindUnit(TileMap * map, int vx, int vy, int vw, int vh, int x, int y)
{
   int s;
   for(s = map->numLayers-1; s >= 0; s--)
   {
      int cx, cy;
      for(cy = vy*map->dim[s].y/map->maxDim.y-2; cy < vy*map->dim[s].y/map->maxDim.y-2 + vh*map->dim[s].y/map->maxDim.y+3; cy++)
         for(cx = vx*map->dim[s].x/map->maxDim.x-2; cx < vx*map->dim[s].x/map->maxDim.x-2 + vw*map->dim[s].x/map->maxDim.x+3; cx++)
         {
            if((cx >= 0) && (cy >= 0) && (cx < map->dim[s].x) && (cy < map->dim[s].y))
            {
               TileUnit * unit;
               if((unit = map->spaces[s][TILE(cx,cy,map->dim[s])]) && unit->pickable)
               {
                  Point exact = UnitExact(map, unit);
                  int x1 = exact.x - (unit->boxW - unit->w * map->tileW) / 2 - vx * map->tileW;
                  int y1 = exact.y - (unit->boxH - unit->h * map->tileH) / 2 - vy * map->tileH;
                  int x2 = x1 + unit->boxW;
                  int y2 = y1 + unit->boxH;
                  if((x2 > x) && (y2 > y) && (x1 < x) && (y1 < y))
                     return unit;
               }
            }
         }
   }
   return null;
}

void MapRedraw(TileMap * map, Surface surface, int vx, int vy, int vw, int vh)
{
   TileUnit * unit;
   int s,x,y;

   surface.SetForeground(white);
   for(x=0; x<vw; x++)
      for(y=0; y<vh; y++)
         surface.Blit(
            map->tileImage[map->frames[TILE(x+vx,y+vy,map->maxDim)]],
            x*map->tileW,y*map->tileH,0,0,map->tileW,map->tileH);

   //BUILDINGS
   for(y = vy; y < vy + vh; y++)
      for(x = vx; x < vx + vw; x++)
         if((unit=map->spaces[0][TILE(x,y,map->dim[0])]))
            if((unit->pos.x == x || x == vx) && (unit->pos.y == y || y == vy))
               UnitDisplay(map, surface, unit, vx, vy);

   //UNITS
   for(s=1; s<map->numLayers; s++)
   for(y = vy*map->dim[s].y/map->maxDim.y-2; y < vy*map->dim[s].y/map->maxDim.y-2 + vh*map->dim[s].y/map->maxDim.y+4; y++)
      for(x = vx*map->dim[s].x/map->maxDim.x-2; x < vx*map->dim[s].x/map->maxDim.x-2 + vw*map->dim[s].x/map->maxDim.x+4; x++)
      {
         if(x>=0 && y>=0 && x<map->dim[s].x && y<map->dim[s].y)
            if((unit=map->spaces[s][TILE(x,y,map->dim[s])]))
               if(unit->pos.x == x && unit->pos.y == y)
                  UnitDisplay(map, surface, unit, vx, vy);
      }
}

// ********** UNITS **********
Point UnitExact(TileMap * map, TileUnit * unit)
{
   Point exact;
   
   exact.x = unit->pos.x*map->tileW*map->maxDim.x/map->dim[unit->space].x;
   exact.y = unit->pos.y*map->tileH*map->maxDim.y/map->dim[unit->space].y;
   MapForward(unit->direction,&exact,unit->displaced);
   return exact;
}

TileUnit * UnitCreate(TileMap * map, int space, int x, int y, void * data)
{
   TileUnit * unit = new0 TileUnit[1];
   if(unit)
   {
      unit->space = (byte)space;
      unit->covering[space] = (byte)bool::true;
      if(unit->space)
         unit->direction = (Direction)GetRandom(0,Direction::enumSize-1);
      unit->displayed = true;
      unit->event = Standing;
      unit->pathPos = MAXPATH;
      unit->dest = unit->pos = Point { x*map->dim[unit->space].x/map->dim[2].x, y*map->dim[unit->space].y/map->dim[2].y};
      unit->data = data;
      unit->pickable = true;
   }
   return unit;
}

void UnitFree(TileUnit * unit)
{
   if(unit)
      delete unit;
}

void UnitPlace(TileMap * map, TileUnit *unit)
{
   int x,y;
   unit->displayed=true;
   if(unit->displaced)
   {
      map->spaces[unit->space]
            [TILENUM(unit->path[unit->pathPos],map->dim[unit->space])] = unit;
      map->moves [unit->space]
            [TILENUM(unit->path[unit->pathPos],map->dim[unit->space])] = (byte)bool::false;
   }
   for(x=0; x<unit->w; x++)
      for(y=0; y<unit->h; y++)
      {
         int s;
         map->spaces[unit->space]
               [(unit->pos.y+y)*map->dim[unit->space].x+unit->pos.x+x]=unit;
         for(s = 0; s<map->numLayers; s++)
         {
            if(unit->covering[s])
            {
               int crX = map->dim[unit->space].x / map->dim[s].x;
               int crY = map->dim[unit->space].y / map->dim[s].y;
               crX = Max(crX, 1);
               crY = Max(crY, 1);
               if(!((unit->pos.x+x)%crX)&&!((unit->pos.y+y)%crY))
                  map->moves[s][(unit->pos.y+y)/crY*map->dim[s].x+(unit->pos.x+x)/crX] = (byte)bool::false;
            }
         }
      }
}

void UnitRemove(TileMap * map, TileUnit * unit)
{
   int x,y;
   unit->displayed=false;
   if(unit->displaced&&(unit->pathPos<MAXPATH))
   {
      map->spaces[unit->space]
            [TILENUM(unit->path[unit->pathPos],map->dim[unit->space])] = null;
      map->moves [unit->space]
            [TILENUM(unit->path[unit->pathPos],map->dim[unit->space])] = (byte)bool::true;
   }
   for(x=0; x<unit->w; x++)
      for(y=0; y<unit->h; y++)
      {
         int s;
         map->spaces[unit->space]
               [(unit->pos.y+y)*map->dim[unit->space].x+unit->pos.x+x]=null;
         for(s = 0; s<map->numLayers; s++)
         {
            if(unit->covering[s])
            {
               int crX = map->dim[unit->space].x / map->dim[s].x;
               int crY = map->dim[unit->space].y / map->dim[s].y;
               crX = Max(crX, 1);
               crY = Max(crY, 1);
               if(!((unit->pos.x+x)%crX)&&!((unit->pos.y+y)%crY))
                  map->moves[s][(unit->pos.y+y)/crY*map->dim[s].x+(unit->pos.x+x)/crX] = (byte)bool::true;
            }
         }
      }
}

bool UnitGoTo(TileMap * map, TileUnit * unit, Point dest)
{
   ASNode *path;
   Point Position, altpath[MAXPATH];
   uint16 p,pathlen;
   bool result=true;

   if(unit->displaced)
      Position=unit->path[unit->pathPos];
   else
      Position=unit->pos;

   UnitRemove(map,unit);
    //If destination can't be reached, go straight toward it
   if(!map->moves[unit->space][TILENUM(dest,map->dim[unit->space])])
   {
      pathlen = MapLine(map->moves[unit->space],map->dim[unit->space],Position,
                       dest,altpath,true);

      dest = altpath[pathlen-1];
      result = false;
   }
   //Try to find a linear path
   pathlen=MapLine(map->moves[unit->space],map->dim[unit->space],Position,
                    dest,altpath,true);
   if((altpath[pathlen-1].x == dest.x && altpath[pathlen-1].y == dest.y))
   {
      pathlen--;
      unit->pathPos=MAXPATH-pathlen;
      for(p=0; p<pathlen; p++)
         unit->path[unit->pathPos+p]=altpath[p+1];
   }
   else
   {
      //Find the path with A*
      path = AStarFindPath(map->aStar, map->moves[unit->space],map->dim[unit->space],Position,dest, MAX_ITERATIONS);
      if(!path)
      {
         AStarFreeNodes(map->aStar);
         UnitPlace(map,unit);
         return false;
      }
      unit->pathPos=MAXPATH;
      while (path->parent)
      {
         unit->pathPos--;
         unit->path[unit->pathPos]=path->position;
         path = path->parent;
      }
      AStarFreeNodes(map->aStar);
   }
   if(unit->displaced)
   {
      unit->pathPos--;
      unit->path[unit->pathPos]=Position;
   }
   UnitPlace(map,unit);

   return result;
}

void UnitUpdate(TileMap * map, TileUnit *unit)
{
   Sequence *seq = unit->sequence;
   if(seq)
   {
      Point next;
      int xd,yd;
      TileUnit *target;

      if(unit->flash)
         unit->flash--;
      if(unit->pathPos<MAXPATH)
      {
         if(!unit->displaced)
         {
            if(!map->moves[unit->space]
                [TILENUM(unit->path[unit->pathPos],map->dim[unit->space])])
            {
               unit->event = Standing;
               if(unit->tick<seq->frames[unit->event][unit->seqPos].wait)
                  return;
               unit->tick=0;

               unit->seqPos++;
               if(unit->seqPos>=seq->numFrames[unit->event])
                  unit->seqPos=0;

               if(!unit->entering)
               {
                  //target=map->spaces[unit->space][TILENUM(unit->dest,map->dim[unit->space])];
                  if(unit->target)
                  {
                     if(!UnitSurround(map, unit,unit->target))
                        return;
                  }
                  else
                  {
                     if(UnitGoTo(map, unit, unit->dest))
                     {
                     }
                     //else
                     //{
                        //if(target)
                           //if(!UnitSurround(map,unit,unit->target))
                              //return;
                     //}
                  }
               }
               return;
            }
         }

         unit->event = Moving;
         if(unit->tick<seq->frames[unit->event][unit->seqPos].wait) return;
         unit->tick=0;

         unit->displaced+=seq->frames[unit->event][unit->seqPos].walk;
         next=unit->path[unit->pathPos];
         xd=Sgn(next.x-unit->pos.x);
         yd=Sgn(next.y-unit->pos.y);
         if(xd||yd)
            unit->direction=MapDirection(xd,yd);

         UnitRemove(map, unit);
         if(unit->displaced>=(map->tileW*map->maxDim.x/map->dim[unit->space].x))
         {
            unit->displaced=0;
            unit->pathPos++;
            unit->pos=next;
         }
         UnitPlace(map,unit);

         if(unit->pathPos==MAXPATH)
         {
            unit->event = Standing;
         }
      }
      else
      {
         if((unit->pathPos==MAXPATH) && !(unit->pos.x == unit->dest.x && unit->pos.y == unit->dest.y))
         {
            if(UnitGoTo(map, unit, unit->dest))
            {
            }
            else
            {
               target=map->spaces[unit->space][TILENUM(unit->dest,map->dim[unit->space])];
               if(target)
                  UnitSurround(map, unit,target);
            }
         }
         if(unit->tick<seq->frames[unit->event][unit->seqPos].wait) return;
         unit->tick=0;
         unit->retries=0;
      }
      if(unit->space)
      {
         unit->seqPos++;
         if(unit->seqPos>=seq->numFrames[unit->event])
            unit->seqPos=0;
      }
   }
}

typedef struct
{
   int cost;
   Point position;
} SortPosition;

typedef struct
{
   int cost;
   TileUnit * unit;
} SortUnit;

static int Compare(const int * a, const int * b)
{
   if(*a > *b)      return  1;
   else if(*a < *b) return -1;
   else             return  0;
}

bool UnitSurround(TileMap * map,TileUnit *unit,TileUnit * target)
{
   bool surrounding=false;
   if(!unit->entering)
   {
      SortPosition destinations[33];
      uint16 c,numDest=0;
      Point dest,size;
      int x,y;

      dest=target->pos;
      size.x = target->w;
      size.y = target->h;
      if(!target->space)
      {
         if(unit->space==3)
         {
            dest.x+=2;          dest.y+=2;
            size.x-=2; size.y-=2;
         }
         else if(unit->space==1)
         {
            dest.x++;         dest.y++;
            size.x+=dest.x%2; size.y+=dest.y%2;
         }
      }
      dest = Point{dest.x*map->dim[unit->space].x/map->dim[target->space].x, dest.y*map->dim[unit->space].y/map->dim[target->space].y};
      size = Point{size.x*map->dim[unit->space].x/map->dim[target->space].x, size.y*map->dim[unit->space].y/map->dim[target->space].y};

      if(!target||(target==unit))
         return false;
 
      unit->chase=1;
      unit->target=target;
      UnitRemove(map, unit);

      //Find out cases around Target
      for(y=dest.y-1; y<dest.y+size.y+1; y++)
         for(x=dest.x-1; x<dest.x+size.x+1; x++)
            if((x>=0)&&(y>=0)&&(x<map->dim[unit->space].x)&&(y<map->dim[unit->space].y))
               if((x<dest.x)||(y<dest.y)||(x>=dest.x+size.x)||(y>=dest.y+size.y))
               {
                  if(map->moves[unit->space][TILE(x,y,map->dim[unit->space])]
                     ||(map->spaces[unit->space][TILE(x,y,map->dim[unit->space])]==unit))
                  {
                     destinations[numDest].cost=(unit->pos.x-x)*(unit->pos.x-x)+
                                                (unit->pos.y-y)*(unit->pos.y-y);
                     if(!destinations[numDest].cost)
                     {
                        unit->objective=target->pos;
                        unit->dest.x = x;
                        unit->dest.y = y;
                        UnitPlace(map, unit);
                        unit->pathPos = MAXPATH;
                        return true;
                     }
                     destinations[numDest  ].position.x = x;
                     destinations[numDest++].position.y = y;
                  }
               }
      UnitPlace(map, unit);
      qsort(destinations,numDest,sizeof(SortPosition), Compare);
      for(c=0; c<numDest; c++)
      {
         if(UnitGoTo(map,unit,destinations[c].position))
         {
            surrounding=true;
            unit->dest=destinations[c].position;
            unit->objective=target->pos;
            break;
         }
      }
      if(!surrounding)
         unit->target = null;
   }
   return surrounding;
}

void UnitMove(TileMap * map,TileUnit *unit, Point dest)
{
   if(!unit->entering)
   {
      //Just to make sure the console input will look right
      if((map->dim[unit->space].x<map->maxDim.x))
      {
         if((Abs(dest.x/2-unit->pos.x)<=1)&&(dest.x%2))
            dest.x-=Sgn(dest.x/2-unit->pos.x);
         if((Abs(dest.y/2-unit->pos.y)<=1)&&(dest.y%2))
            dest.y-=Sgn(dest.y/2-unit->pos.y);
      }

      UnitGoTo(map,unit,Point{dest.x*map->dim[unit->space].x/map->dim[2].x, dest.y*map->dim[unit->space].y/map->dim[2].y});
      unit->dest = Point{dest.x*map->dim[unit->space].x/map->dim[2].x, dest.y*map->dim[unit->space].y/map->dim[2].y};
      unit->chase = 0;
      unit->target = null;
   }
}

void UnitDisplay(TileMap * map, Surface surface, TileUnit * unit, int viewX, int viewY)
{
   if(/*unit->sprite && */unit->displayed)
   {
      int x1,y1;
      Point exact = UnitExact(map, unit);
      bool square = unit->selected;

      if(unit->flash)
      {
         if(unit->flash%8<4)
            square=true;
         else
            square=false;
      }
      if(square)
      {
         x1=exact.x-viewX*map->tileW;
         y1=exact.y-viewY*map->tileH;
         x1-=(unit->boxW-unit->w*map->tileW)/2;
         y1-=(unit->boxH-unit->h*map->tileH)/2;
         surface.SetForeground(Color { 40,255,40 });
         surface.Rectangle(x1,y1,x1+unit->boxW, y1+unit->boxH);
      }
      surface.SetForeground(white);

      exact = Point{exact.x-viewX*map->tileW, exact.y-viewY*map->tileH};
   
      if(!unit->space)
      {
         unit->sprite.DisplayFrame(surface,unit->seqPos,exact.x,exact.y,true,unit->filter);
      }
      else
      {
         int frame;
         if(unit->sequence->numFrames[unit->event])
            frame=unit->sequence->frames[unit->event][unit->seqPos].frame;
         else
            frame=0;
         exact.x+=(map->tileW/2)-(unit->sprite.maxWidth /2);
         exact.y+=(map->tileH/2)-(unit->sprite.maxHeight/2);
         if(unit->direction>South)
         {
            frame += (Direction)8-unit->direction;
            unit->sprite.DisplayFrame(surface,frame,exact.x,exact.y,true,unit->filter);
         }
         else
         {
            frame += unit->direction;
            unit->sprite.DisplayFrame(surface,frame,exact.x,exact.y,false,unit->filter);
         }         
      }
   }
}

void UnitExit(TileMap * map, TileUnit *unit)
{
   int x,y;
   uint16 numExits=0;
   SortPosition exits[32];
   TileUnit * targetUnit=map->spaces[0][TILENUM(unit->objective,map->dim[0])];
   Point dest, size;

   dest=targetUnit->pos;
   size.x=targetUnit->w;
   size.y=targetUnit->h;

   if(!targetUnit->space)
   {
      if(unit->space==3)
      {
         dest.x+=2;          dest.y+=2;
         size.x-=2; size.y-=2;
      }
      else if(unit->space==1)
      {
         dest.x++;         dest.y++;
         size.x+=dest.x%2; size.y+=dest.y%2;
      }
   }

//   if(!targetUnit->space && unit->space!=2)
   //{
     // dest.x++;         dest.y++;
      //size.x+=dest.x%2; size.y+=dest.y%2;
   //}

   dest = Point{dest.x*map->dim[unit->space].x/map->dim[2].x, dest.y*map->dim[unit->space].y/map->dim[targetUnit->space].y};
   size = Point{size.x*map->dim[unit->space].x/map->dim[2].x, size.y*map->dim[unit->space].y/map->dim[targetUnit->space].y};

   if(unit->displayed) return;
      for(y=dest.y-1; y<dest.y+size.y+1; y++)
         for(x=dest.x-1; x<dest.x+size.x+1; x++)
            if((x>=0)&&(y>=0)&&(x<map->dim[unit->space].x)&&(y<map->dim[unit->space].y))
               if((x<dest.x)||(y<dest.y)||(x>=dest.x+size.x)||(y>=dest.y+size.y))
                  if(//!SPACES[unit->space][TILE(x,y,dim[unit->space])]&&
                     map->moves[unit->space][TILE(x,y,map->dim[unit->space])])
                  {
                     exits[numExits].position.x = x;
                     exits[numExits].position.y = y;
                     exits[numExits++].cost=(unit->door.x-x)*(unit->door.x-x)+
                                            (unit->door.y-y)*(unit->door.y-y);
                  }
   qsort(exits,numExits,sizeof(SortPosition), Compare);
   if(numExits)
   {
      unit->pos=exits[0].position;
      unit->displaced=0;
      UnitPlace(map,unit);
   }
   else
   {
      //exits closed
   }
   unit->event = Standing;
}

bool UnitSurroundNearest(TileMap * map,TileUnit *unit, TileUnit **list, uint16 count)
{
   SortUnit goals[32];
   uint16 c;

   for(c=0; c<count; c++)
   {
      goals[c].unit=(void *)list[c];
      goals[c].cost=(unit->pos.x-list[c]->pos.x)*(unit->pos.x-list[c]->pos.x)+
                    (unit->pos.y-list[c]->pos.y)*(unit->pos.y-list[c]->pos.y);
   }
   qsort(goals,count,sizeof(SortUnit),Compare);
   for(c=0; c<count; c++)
      if(UnitSurround(map,unit, goals[c].unit))
         return true;
   return false;
}

void UnitEnter(TileMap * map, TileUnit *unit)
{
   TileUnit * targetUnit=map->spaces[0][TILENUM(unit->objective,map->dim[0])];
   Sequence *seq = unit->sequence;

   if(targetUnit)
   {
      unit->entering = true;
      unit->door=unit->pos;
      unit->direction=MapDirection(
         Sgn(unit->objective.x+targetUnit->w/2.0-0.5-unit->pos.x),
         Sgn(unit->objective.y+targetUnit->h/2.0-0.5-unit->pos.y));

      unit->event = Moving;

      if(unit->tick<seq->frames[unit->event][unit->seqPos].wait) 
         return;

      unit->displaced+=seq->frames[unit->event][unit->seqPos].walk;
      if(unit->displaced>=map->tileW)
      {
         UnitRemove(map,unit);
         unit->displaced=0;
         unit->entering = false;
      }
   }
}

void UnitStop(TileMap * map, TileUnit *unit)
{
   if(unit->pathPos<MAXPATH)
      UnitGoTo(map,unit,unit->path[unit->pathPos]);
   else
      UnitGoTo(map,unit,unit->pos);
}
