import "ecere"

#define glTypeUnsignedShort     0x1403
#define glTypeFloat             0x1406

enum JoinType { miter, round, bevel };
enum CapType { butt, round, square };

define joinType = JoinType::bevel;
define capType = CapType::round;

class ButterburTest : Window
{
   displayDriver = "OpenGL";
   caption = $"Butterbur's Humble Beginnings";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };

   BBScene scene { };

   BBRectangle rect { scene, lineColor = { 128, tomato }, fillColor = { 128, skyBlue }, box = { 30, 30, 340, 190 }, cap = capType, join = joinType, lineWidth = 10 };
   BBCircle circle  { scene, lineColor = { 128, green }, fillColor = { 170, tomato }, center = { 390, 280 }, cap = capType, join = joinType, radius = 100, lineWidth = 8 };
   BBEllipse ell  { scene, lineColor = { 128, yellow }, fillColor = { 100, black }, center = { 250, 310 }, k = 1.3, cap = capType, join = joinType, radius = 100, lineWidth = 4 };

   BBPath triangle
   {
      scene, lineColor = { 128, blue }, fillColor = { 100, lime }, lineWidth = 20;
      //closed = true;
      join = miter; //joinType;
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
      scene, lineColor = purple, fillColor = { 100, orange }, lineWidth = 9;
      closed = true;
      cap = capType;
      join = joinType;
      nodes.copySrc = [
         // Pointf { 150, 80 },
         Pointf { 510, 180 },
         Pointf { 150, 320 },
         Pointf { 340, 320 }
      ];
   };

   BBPath dot
   {
      scene, lineColor = black, lineWidth = 20;
      cap = square;
      nodes.copySrc = [ Pointf { 300, 300 } ];
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

   GLAB fillVBO { };
   GLAB lineVBO { };
   GLEAB fillIndices { };
   GLEAB lineIndices { };

   ColorAlpha lineColor;
   ColorAlpha fillColor;
   float lineWidth;
   JoinType join;
   CapType cap;
   bool closed;
   bool noJoin;
   int lineCount;
   lineColor = black;

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

         vboCount = closed ? (tc * (rCount+1)) : (2*(capCount+1) + ((tc > 2) ? (tc-2) * (rCount+1) : 0));
         points = new Pointf[vboCount];

         ixCount = closed ? (tc * rCount*2 + closed*2) :
            (2*(2*capCount) + ((tc > 2) ? (tc-2) * (2*rCount) : 0));
         ix = new uint16[ixCount];

         for(i = 0; i < tc + (tc == 1); i++)
         {
            bool end = false;
            if(i == tc) { i = 0; end = true; }
            {
               bool isCap = false;
               Pointf p = nodes[i];
               Pointf before = i > 0 ? nodes[i-1] : (closed ? nodes[tc-1] : (tc > 1 ? nodes[1] : nodes[0]));
               Pointf after  = i < tc-1 ? nodes[i+1] : (closed ? nodes[0] : (tc > 1 ? nodes[i-1] : nodes[0]));
               float ldx = p.x - before.x, ldy = p.y - before.y;
               float rdx = after.x - p.x, rdy = after.y - p.y;
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
                     diffAngle = diffAngle - 2*Pi;
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

                     p = nodes[i];
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
               }
               for(n = 0; n < (isCap ? capCount : rCount); n++)
               {
                  ix[d++] = startIX;
                  ix[d++] = (uint16)(startIX+n+1);
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

         for(i = 0; i < tc; i++)
            ix[i] = i;
         if(closed)
            ix[i] = 0;
      }
      lineVBO.upload(vboCount*sizeof(Pointf), points);
      lineIndices.upload(ixCount * sizeof(uint16), ix);
      lineCount = ixCount;

      if(points != nodes.array)
         delete points;

      if(closed)
      {
         uint16 i;
         delete ix;
         ix = new uint16[tc + closed];

         for(i = 0; i < tc; i++)
            ix[i] = i;
         ix[i] = 0;

         fillVBO.upload(tc*sizeof(Pointf), nodes.array);
         fillIndices.upload(tc * sizeof(uint16), ix);
      }

      delete ix;
   }

   void render()
   {
      // Fill
      if(closed)
      {
         glimtkColor4f(fillColor.color.r/255.0f, fillColor.color.g/255.0f, fillColor.color.b/255.0f, fillColor.a/255.0f);
         fillVBO.use(vertex, 2, glTypeFloat, 0, null);
         fillIndices.draw(GLIMTKMode::triangleFan, nodes.count, glTypeUnsignedShort, null);
      }

      // Line
      glimtkColor4f(lineColor.color.r/255.0f, lineColor.color.g/255.0f, lineColor.color.b/255.0f, lineColor.a/255.0f);
      lineVBO.use(vertex, 2, glTypeFloat, 0, null);

      lineIndices.draw(lineWidth > 1 ? GLIMTKMode::triangleStrip : GLIMTKMode::lineStrip, lineCount, glTypeUnsignedShort, null);

      glimtkColor4f(1, 0, 0, 1);
      // lineIndices.draw(GLIMTKMode::lineStrip, lineCount, glTypeUnsignedShort, null);
   }
}

class BBRectangle : BBPath
{
   closed = true;

   Box box;
   property Box box
   {
      set { box = value; needUpdate = true; }
      get { value = box; }
   }

   void update()
   {
      nodes.size = 4;
      nodes[0] = { box.left, box.top };
      nodes[1] = { box.left, box.bottom };
      nodes[2] = { box.right, box.bottom };
      nodes[3] = { box.right, box.top };

      BBPath::update();
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
   }
}
