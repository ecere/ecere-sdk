import "ecere"

import "tesselation"

#define glTypeUnsignedShort     0x1403
#define glTypeFloat             0x1406

enum JoinType { miter, round, bevel };
enum CapType { butt, round, square };

define joinType = JoinType::miter;
define capType = CapType::round;

static double pointsArea(Array<Pointf> points)
{
   double area = 0;
   if(points.count >= 3)
   {
      int i;
      for(i = 0; i < points.count - 1; i++)
          area += points[i].x * points[i+1].y - points[i+1].x * points[i].y;
      area += points[i].x * points[0].y - points[0].x * points[i].y;
   }
   return area;
}

class ButterburTest : Window
{
   displayDriver = "OpenGL";
   caption = $"Butterbur's Humble Beginnings";
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };

   BBScene scene { };

   BBRectangle square
   {
      scene,
      box = { 450, 50, 550, 150 },
      lineColor = { 230, green }, fillColor = { 126, magenta }, cap = capType, join = round, lineWidth = 10
   };
   BBRectangle rect
   {
      scene,
      box = { 30, 30, 340, 190 }, rx = 20, ry = 20,
      lineColor = { 230, red }, fillColor = { 126, black }, cap = capType, join = joinType, lineWidth = 4
   };
   BBCircle circle  { scene, lineColor = { 128, green }, fillColor = { 170, tomato }, center = { 390, 280 }, cap = capType, join = joinType, radius = 100, lineWidth = 8 };
   BBEllipse ell  { scene, lineColor = { 128, yellow }, fillColor = { 100, black }, center = { 250, 310 }, k = 1.3, cap = capType, join = joinType, radius = 100, lineWidth = 4 };

   BBPath triangle
   {
      scene, lineColor = { 128, blue }, fillColor = { 100, lime }, lineWidth = 20;
      //closed = true;
      join = bevel; //miter; //joinType;
      cap = capType;
      nodes.copySrc = [
         // Pointf { 150, 80 },
         Pointf { 210, 80 },
         Pointf { 50, 220 },
         Pointf { 240, 220 }
      ];
   };

   BBPath test
   {
      scene, lineColor = red, lineWidth = 1;
      join = miter;
      closed = true;
      cap = butt;
      nodes.copySrc = [
         Pointf { 210, 80 },
         Pointf { 50, 220 },
         Pointf { 240, 220 }
      ];
   };
   BBPath triangle2
   {
      scene, lineColor = { 128, purple }, fillColor = { 100, orange }, lineWidth = 9;
      closed = true;
      cap = capType;
      join = round; //joinType;
      nodes.copySrc = [
         Pointf { 510, 180 }, Pointf { 150, 320 }, Pointf { 340, 320 }
         // Pointf { 340, 320 }, Pointf { 150, 320 }, Pointf { 510, 180 }
      ];
   };

   BBPath dot
   {
      scene, lineColor = black, lineWidth = 20;
      cap = square;
      nodes.copySrc = [ Pointf { 300, 300 } ];
   };

   BBPath concave
   {
      scene, lineColor = { 128, black }, fillColor = { 128, orange }, lineWidth = 18;
      closed = true;
      needTesselation = true;
      cap = round;
      join = round;
      nodes.copySrc = [

         Pointf { 350, 80 },
         Pointf { 210, 180 },
         Pointf { 250, 120 },
         Pointf { 140, 220 },
         Pointf { 100, 80 }

         // Pointf { 350, 80 }, Pointf { 260, 180 }, Pointf { 250, 120 }, Pointf { 140, 220 }, Pointf { 100, 80 }
      ];
   };

   BBPath concaveOutline
   {
      scene, lineColor = blue, lineWidth = 1;
      //closed = true;
      needTesselation = true;
      cap = butt;
      join = miter;
      nodes.copySrc = [
         Pointf { 350, 80 },
         Pointf { 210, 180 },
         Pointf { 250, 120 },
         Pointf { 140, 220 },
         Pointf { 100, 80 }
      ];
   };

   void OnRedraw(Surface surface)
   {
      display.antiAlias = true;
      scene.render();
   }
}

ButterburTest bbTest {};

class BBScene
{
   List<BBObject> objects { };

   void render()
   {
      for(o : objects)
      {
         if(o.needUpdate) { o.update(); o.needUpdate = false; }
         o.render();
      }
   }
}

class BBObject
{
   BBScene parent;

   bool needUpdate;

   needUpdate = true;

   virtual void update();
   virtual void render();

   public property BBScene parent
   {
      set
      {
         if(parent)
            parent.objects.TakeOut(this);
         parent = value;
         value.objects.Add(this);
      }
      get { return parent; }
   }
}

class BBPath : BBObject
{
   Array<Pointf> nodes { };
   GLAB vbo { };
   GLEAB fillIndices { };
   GLEAB lineIndices { };

   ColorAlpha lineColor;
   ColorAlpha fillColor;
   float lineWidth;
   JoinType join;
   CapType cap;
   bool closed;
   bool noJoin;
   bool needTesselation;
   int lineCount, fillCount;
   GLIMTKMode fillMode;

   lineColor = black;

   ~BBPath()
   {
      fillIndices.free();
      lineIndices.free();
      vbo.free();
   }

   property ColorAlpha lineColor
   {
      set { lineColor = value; }
      get { return lineColor; }
   };

   property ColorAlpha fillColor
   {
      set { fillColor = value; }
      get { return fillColor; }
   };

   property float lineWidth
   {
      set { lineWidth = value; }
      get { return lineWidth; }
   };

   void update()
   {
      Pointf * points;
      uint16 * ix;
      uint16 * ixFill = null;
      uint16 i;
      uint tc = nodes.count;
      uint ixCount;
      uint vboCount;

      if(lineWidth > 1 && (tc > 1 || cap != butt))
      {
         int rCount = (!noJoin && join == round) ? 7 : (!noJoin && join == bevel) ? 2 : 1;
         int capCount = (cap == round) ? 7 : 1;
         uint16 startIX = 0;
         uint d = 0;
         bool flip = pointsArea(nodes) > 0;
         uint estFillCount = tc;

         vboCount = closed ? (tc * (rCount+1)) : (2*(capCount+1) + ((tc > 2) ? (tc-2) * (rCount+1) : 0));
         points = new Pointf[vboCount];

         ixCount = closed ? (tc * rCount*2 + closed*2) :
            (2*(2*capCount) + ((tc > 2) ? (tc-2) * (2*rCount) : 0));
         ix = new uint16[ixCount];
         ixFill = new uint16[estFillCount];
         fillCount = 0;

         for(i = 0; i < tc + (tc == 1); i++)
         {
            bool end = false;
            uint16 ni;
            if(i == tc) { i = 0; end = true; }

            #define DOFLIP(x) (flip ? (uint16)((tc-1)-(x)) : (x))

            ni = DOFLIP(i);

            {
               bool isCap = false;
               Pointf p = nodes[ni];
               Pointf before = i > 0 ? nodes[DOFLIP(i-1)] : (closed ? nodes[DOFLIP(tc-1)] : (tc > 1 ? nodes[DOFLIP(1)] : nodes[DOFLIP(0)]));
               Pointf after  = i < tc-1 ? nodes[DOFLIP(i+1)] : (closed ? nodes[DOFLIP(0)] : (tc > 1 ? nodes[DOFLIP(i-1)] : nodes[DOFLIP(0)]));
               float ldx = p.x - before.x, ldy = p.y - before.y;
               float rdx = after.x - p.x, rdy = after.y - p.y;
               bool thisFlip = false;
               double at1 = atan2(ldy, ldx);
               double at2 = atan2(rdy, rdx);
               float c, s;
               double diffAngle = at2 - at1;
               bool simpleMean = true;
               int n;

               if(!closed && (i == 0 || i == tc-1)) isCap = true;

               if(Abs(diffAngle) >= Pi)
               {
                  simpleMean = false;

                  if(diffAngle < 0)
                     diffAngle += 2*Pi;
                  else
                     diffAngle -= 2*Pi;
               }
               if(Sgn(diffAngle) > 0)
               {
                  // Inside/outside changed (e.g. zig zag patterns)
                  at1 = atan2(-ldy, -ldx);
                  at2 = atan2(-rdy, -rdx);
                  diffAngle = at2 - at1;
                  simpleMean = true;
                  thisFlip = true;
                  if(Abs(diffAngle) >= Pi)
                  {
                     simpleMean = false;

                     if(diffAngle < 0)
                        diffAngle += 2*Pi;
                     else
                        diffAngle -= 2*Pi;
                  }
               }

               if(isCap)
               {
                  // Caps
                  switch(cap)
                  {
                     case round:
                     {
                        double r = lineWidth;
                        int t;
                        int add = 0;
                        double angle = (i == 0 && !end) ? at1 : at2;
                        if(end) angle += Pi;
                        if(i || end)
                        {
                           double ang = angle - Pi/2 + Pi;
                           c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                           points[startIX] = { p.x + c, p.y + s };
                           add = 1;
                        }
                        for(t = 0; t < capCount; t++)
                        {
                           double ang = angle + (i ? -Pi/2 : Pi/2) - t * Pi/(capCount-1);
                           c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                           points[startIX + add + t] = { p.x + c, p.y + s };
                        }
                        if(!i && !end)
                        {
                           double ang = angle + Pi/2 + Pi;
                           c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                           points[startIX + 1 + capCount-1] = { p.x + c, p.y + s };
                        }
                        break;
                     }
                     case butt:
                     {
                        double r = lineWidth;
                        double angle = (i == 0 && !end) ? at1 : at2;
                        double ang = angle - Pi/2;
                        c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                        points[startIX] = { p.x - c, p.y - s};
                        points[startIX+1] = { p.x + c, p.y + s };
                        break;
                     }
                     case square:
                     {
                        double r = lineWidth * sqrt(2);
                        double angle = (i == 0 && !end) ? at1 : at2;
                        double ang = (i || end) ? (angle - Pi/4) + Pi : (angle + Pi/4);
                        c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                        points[startIX] = { p.x + c, p.y + s};

                        ang = (i || end) ? (angle + Pi/4) + Pi : (angle - Pi/4);
                        c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                        points[startIX+1] = { p.x + c, p.y + s };
                        break;
                     }
                  }
               }
               else
               {
                  double r = lineWidth / cos(diffAngle/2);
                  double angle;
                  bool diffSigns = Sgn(at1) != Sgn(at2);
                  if(simpleMean)
                     angle = (double)(at1 + at2) / 2;
                  else if(diffSigns && ldy > 0 && rdy < 0 && !ldx && !rdx)
                     angle = Pi;
                  else if(diffSigns && ldy < 0 && rdy > 0 && !ldx && !rdx)
                     angle = 0;
                  else
                     angle = (double)(at1 + at2) / 2 + Pi;

                  angle += Pi/2;

                  c = (float)(cos(angle) * r/2), s = (float)(sin(angle) * r/2);

                  points[startIX] = { p.x - c, p.y - s };

                  if(rCount > 1)
                  {
                     int t;

                     p = nodes[ni];
                     r = lineWidth;
                     for(t = 0; t < rCount; t++)
                     {
                        double ang = at2 - ((rCount-1-t) * diffAngle / (rCount-1)) + Pi/2;
                        c = (float)(cos(ang) * r/2), s = (float)(sin(ang) * r/2);
                        points[startIX+1+t] = { p.x + c, p.y + s };
                     }
                  }
                  else
                     points[startIX+1] = { p.x + c, p.y + s };

                  if(thisFlip)
                  {
                     int t;

                     r = lineWidth*1.1;   // TODO: Handle this properly... 1.1 works around not adding an extra vertex
                     p = nodes[ni];
                     angle += Pi/2;
                     c = (float)(cos(angle) * r/2), s = (float)(sin(angle) * r/2);
                     points[startIX+1] = { p.x - c, p.y - s };
                     estFillCount += rCount-1;
                     ixFill = renew ixFill uint16[estFillCount];

                     ixFill[fillCount] = (uint16)(startIX+1);
                     for(t = 0; t < rCount-1; t++)
                        ixFill[fillCount+t+1] = (uint16)(startIX+1+t);

                     fillCount += rCount;
                  }
                  else
                     ixFill[fillCount++] = startIX;
               }
               for(n = 0; n < (isCap ? capCount : rCount); n++)
               {
                  if(thisFlip)
                  {
                     ix[d++] = (uint16)(startIX+n+1);
                     ix[d++] = startIX;
                  }
                  else
                  {
                     ix[d++] = startIX;
                     ix[d++] = (uint16)(startIX+n+1);
                  }
               }
               startIX += (uint16)(isCap ? capCount : rCount) + 1;

               if(end) break;
            }
         }
         if(closed)
         {
            ix[d++] = 0;
            ix[d++] = 1;
         }
      }
      else
      {
         vboCount = tc;
         points = nodes.array;
         ixCount = tc + closed;
         ix = new uint16[ixCount];
         ixFill = ix;

         for(i = 0; i < tc; i++)
            ix[i] = i;
         if(closed)
            ix[i] = 0;
      }

      if(closed)
      {
         if(needTesselation)
         {
            Array<Pointf> tPoints { };
            Array<TessPrim> prims = null;
            Array<Pointf> output = null;
            uint16 * newFill;
            uint added;
            int j;

            tPoints.size = fillCount;
            for(i = 0; i < fillCount; i++)
               tPoints[i] = points[ixFill[i]];

            tesselatePolygon(tPoints, &output, &prims);

            added = output.count - tPoints.count;
            if(added > 0)
            {
               points = renew points Pointf[vboCount + added];
               memcpy(points + vboCount, output.array + tPoints.count, sizeof(Pointf) * added);
            }

            fillCount = 0;
            fillMode = triangleStrip;
            for(j = 0; j < prims.count; j++)
            {
               TessPrim * prim = &prims[j];
               GLIMTKMode type = prim->type;
               uint count = prim->count;
               switch(type)
               {
                  case triangles:     fillCount += (count/3) * 5; break;
                  case triangleStrip: fillCount += count + 2; break;
                  case triangleFan:   fillCount += (count-2)*2 + 3;  break;
               }
            }

            newFill = new uint16[fillCount];

            #define FIND_IX(ii) ((prim->indices[ii] < tPoints.count) ? ixFill[prim->indices[ii]] : (uint16)(vboCount + prim->indices[ii] - tPoints.count))

            fillCount = 0;
            for(j = 0; j < prims.count; j++)
            {
               TessPrim * prim = &prims[j];
               GLIMTKMode type = prim->type;
               switch(type)
               {
                  case triangles:
                     for(i = 0; i < prim->count; i += 3)
                     {
                        newFill[fillCount++] = FIND_IX(i+1);
                        newFill[fillCount++] = FIND_IX(i+0);
                        newFill[fillCount++] = FIND_IX(i+2);

                        // Degenerate
                        newFill[fillCount] = newFill[fillCount-2];
                        newFill[fillCount+1] = newFill[fillCount-2];
                        fillCount+=2;
                     }
                     break;
                  case triangleStrip:
                     for(i = 0; i < prim->count; i++)
                        newFill[fillCount++] = FIND_IX(i);

                     // Degenerate
                     newFill[fillCount] = newFill[fillCount-2];
                     newFill[fillCount+1] = newFill[fillCount-2];
                     fillCount+=2;
                     break;
                  case triangleFan:
                     newFill[fillCount++] = FIND_IX(1);
                     for(i = 2; i < prim->count; i++)
                     {
                        newFill[fillCount++] = FIND_IX(0);
                        newFill[fillCount++] = FIND_IX(i);
                     }

                     // Degenerate
                     newFill[fillCount] = newFill[fillCount-2];
                     newFill[fillCount+1] = newFill[fillCount-2];
                     fillCount+=2;
                     break;
               }
            }

            vboCount += added;

            delete ixFill;
            ixFill = newFill;

            delete tPoints;
            prims.Free();
            delete prims;
            delete output;
         }
         else
            fillMode = triangleFan;

         fillIndices.upload(fillCount * sizeof(uint16), ixFill);
      }

      vbo.upload(vboCount*sizeof(Pointf), points);
      lineIndices.upload(ixCount * sizeof(uint16), ix);
      lineCount = ixCount;

      if(points != nodes.array)
         delete points;

      if(ixFill != ix)
         delete ix;
      delete ixFill;
   }

   void render()
   {
      vbo.use(vertex, 2, glTypeFloat, 0, null);

      // Fill
      if(closed)
      {
         glimtkColor4f(fillColor.color.r/255.0f, fillColor.color.g/255.0f, fillColor.color.b/255.0f, fillColor.a/255.0f);
         fillIndices.draw(fillMode, fillCount, glTypeUnsignedShort, null);
      }

      // Line
      if(lineWidth)
      {
         glimtkColor4f(lineColor.color.r/255.0f, lineColor.color.g/255.0f, lineColor.color.b/255.0f, lineColor.a/255.0f);
         lineIndices.draw(lineWidth > 1 ? GLIMTKMode::triangleStrip : GLIMTKMode::lineStrip, lineCount, glTypeUnsignedShort, null);

#ifdef _DEBUG
         glimtkColor4f(1, 0, 0, 1);
          //fillIndices.draw(GLIMTKMode::lineStrip, fillCount, glTypeUnsignedShort, null);
         // lineIndices.draw(GLIMTKMode::lineStrip, lineCount, glTypeUnsignedShort, null);
#endif
      }
   }
}

class BBRectangle : BBPath
{
   float rx, ry;

   closed = true;

   Box box;
   property Box box
   {
      set { box = value; needUpdate = true; }
      get { value = box; }
   }
   property float rx
   {
      set { rx = value; needUpdate = true; }
      get { return rx; }
   }
   property float ry
   {
      set { ry = value; needUpdate = true; }
      get { return ry; }
   }

   void update()
   {
      if(!rx && !ry)
      {
         noJoin = false;
         nodes.size = 4;
         nodes[0] = { box.left, box.top };
         nodes[1] = { box.left, box.bottom };
         nodes[2] = { box.right, box.bottom };
         nodes[3] = { box.right, box.top };
      }
      else
      {
         int i;
         float rx = Min(this.rx, box.right - box.left);
         float ry = Min(this.ry, box.bottom - box.top);
         int res = 8;

         noJoin = true;
         nodes.size = 4*res;

         for(i = 0; i < 4; i++)
         {
            int t;
            Degrees angle;
            Pointf p, o;
            switch(i)
            {
               case 0: p = { box.left, box.top };     angle = 0; break;
               case 1: p = { box.left, box.bottom };  angle = 270; break;
               case 2: p = { box.right, box.bottom }; angle = 180; break;
               case 3: p = { box.right, box.top };    angle = 90; break;
            }
            o = { (float)(p.x + cos(angle) * rx - sin(angle) * rx), (float)(p.y + sin(angle) * ry + cos(angle) * ry) };

            for(t = 0; t < res; t++)
            {
               nodes[i*res + t] =
               {
                  (float)(o.x - rx * cos(angle + (res-1-t) * Degrees { 90 } / (res-1))),
                  (float)(o.y - ry * sin(angle + (res-1-t) * Degrees { 90 } / (res-1)))
               };
            }
         }
      }

      BBPath::update();
      nodes.Free();
   }
}

class BBCircle : BBPath
{
   closed = true;
   noJoin = true;

   Pointf center;
   float radius;

   radius = 10;

   property Pointf center
   {
      set { center = value; needUpdate = true; }
      get { value = center; }
   }

   property float radius
   {
      set { radius = value; needUpdate = true; }
      get { return radius; }
   }

   void update()
   {
      uint count = radius < 3 ? 6 : radius < 20 ? 12 : radius < 50 ? 30 : 100;
      int i;

      nodes.size = count;
      for(i = 0; i < count; i++)
      {
         double a = i * 2*Pi / count;
         nodes[i] = { center.x + (float)cos(a) * radius, center.y + (float)sin(a) * radius };
      }

      BBPath::update();
      nodes.Free();
   }
}

class BBEllipse : BBPath
{
   closed = true;
   noJoin = true;

   Pointf center;
   float radius;
   float k;

   radius = 10;
   k = 1;

   property Pointf center
   {
      set { center = value; needUpdate = true; }
      get { value = center; }
   }

   property float radius
   {
      set { radius = value; needUpdate = true; }
      get { return radius; }
   }

   void update()
   {
      uint count = radius < 3 ? 6 : radius < 20 ? 12 : radius < 50 ? 30 : 100;
      int i;

      nodes.size = count;
      for(i = 0; i < count; i++)
      {
         double a = i * 2*Pi / (count+1);
         nodes[i] = { center.x + (float)cos(a) * radius * k, center.y + (float)sin(a) * radius };
      }

      BBPath::update();
      nodes.Free();
   }
}
