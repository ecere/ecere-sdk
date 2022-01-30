public import IMPORT_STATIC "ecere"

import "GraphicalElement"
import "tesselation"

private: // FIXME

#include <math.h>

#if defined(__GNOSIS3__)
float ni_fastsinf(float x);
float ni_fastcosf(float x);
float fastatan2f(float y, float x);

#define sinf(x) ni_fastsinf(x)
#define cosf(x) ni_fastcosf(x)
#define atan2f(y, x) fastatan2f(y, x)
#endif

private static inline double pointsArea(Pointf * points, int count)
{
   double area = 0;
   if(count >= 3)
   {
      int i;
      for(i = 0; i < count - 1; i++)
          area += (double)points[i].x * points[i+1].y - (double)points[i+1].x * points[i].y;
      area += (double)points[i].x * points[0].y - points[0].x * points[i].y;
   }
   return area;
}

struct TesselatedShape
{
   Pointf * points;
   uint16 * ixFill, * ix;
   uint vCount, fillCount, ixCount;

   void free()
   {
      delete ixFill;
      delete ix;
      delete points;
      vCount = 0, fillCount = 0, ixCount = 0;
   }

   void tesselate(Shape shp)
   {
      return tesselateEx(shp, 1, 1, 0);
   }

   void tesselateEx(Shape shp, float fx, float fy, float sss)
   {
      Array<Pointf> tmpNodes = null;
      Pointf * nodes = null;
      bool closed = false, noJoin = false, needTesselation = false;
      bool partialSector = false, fullSector = false;
      uint count = 0;
      Array<Array<Pointf>> inner = null;
      Stroke stroke = shp.stroke;
      LineCap cap = stroke.cap;

      switch(shp.shpType)
      {
         case ShapeType::dot:
         {
            Dot dot = (Dot)shp;
            tmpNodes = { size = 1 };
            nodes = tmpNodes.array;
            nodes[0] = dot.point;
            count = 1;
            if(cap == flat) cap = square;
            break;
         }
         case ShapeType::path:
         {
            Path path = (Path)shp;
            Array<Pointf> array = *(Array<Pointf> *)&path.nodes;
            nodes = array.array;
            count = array.count;
            closed = path.closed && count >= 3;
            inner = (Array<Array<Pointf>>)path.innerNodes;
            needTesselation = closed && path.needTesselation;
            break;
         }
         case ShapeType::arc:
         {
            Arc arc = (Arc)shp;
            float r = arc.radius, ir = arc.innerRadius;
            Pointf c = arc.center;
            Radians sa = arc.startAngle, da = arc.deltaAngle, a = sa;
            int i;
            uint n;
            int start = 0;

            fullSector = arc.arcType == sector && !ir;

            if(fullSector) start = 1;
            partialSector = arc.arcType == sector && !fullSector;
            closed = arc.arcType != open;

            // Larger arcs need more nodes to have a smooth curve
            // Inner arcs, although they would require less resolution, also need same count for triangle strips...
            count = n = r < 3 ? 6 : r < 20 ? 12 : r < 50 ? 30 : 100;
            if(partialSector)
               count = 2*n; // Double the nodes when there is an inside and outside radius
            else if(fullSector)
               count += 2;

            tmpNodes = { size = count };
            nodes = tmpNodes.array;
            if(fullSector) nodes[0] = c; //Set the first node as the center of the arc

            da /= (n-1);
            for(i = 0; i < n; i++, a += da)
            {
               float cs = cosf((float)a), sn = sinf((float)a);
               nodes[start + i] = { c.x + cs * r, c.y - sn * r };
               if(partialSector)
                  nodes[start + n + n-1-i] = { c.x + cs * ir, c.y - sn * ir };
            }
            if(fullSector) nodes[count-1] = c; //Go back to the center of the arc
            break;
         }
         case ShapeType::rectangle:
         {
            RoundedRectangle rect = (RoundedRectangle)shp;
            float rx = rect.rx, ry = rect.ry;
            Box box = rect.box;

            closed = true;

            if(!rx && !ry)
            {
               count = 4;
               tmpNodes = { size = count };
               nodes = tmpNodes.array;
               nodes[0] = { box.left, box.top };
               nodes[1] = { box.left, box.bottom };
               nodes[2] = { box.right, box.bottom };
               nodes[3] = { box.right, box.top };
            }
            else
            {
               int i;
               int res = 8;

               rx = Max(1.0f, Min(rx, box.right - box.left));
               ry = Max(1.0f, Min(ry, box.bottom - box.top));

               noJoin = true;
               count = 4*res;
               tmpNodes = { size = count };
               nodes = tmpNodes.array;

               for(i = 0; i < 4; i++)
               {
                  Pointf p, o;
                  float angle, a, da = (float)((Radians)Degrees { 90 } / (res-1)), c, s;
                  int t, j = i * res;

                  switch(i)
                  {
                     case 0: p = { box.left,  box.top };    angle = (float)(Radians)Degrees {   0 }; break;
                     case 1: p = { box.left,  box.bottom }; angle = (float)(Radians)Degrees { 270 }; break;
                     case 2: p = { box.right, box.bottom }; angle = (float)(Radians)Degrees { 180 }; break;
                     case 3: p = { box.right, box.top };    angle = (float)(Radians)Degrees {  90 }; break;
                  }
                  c = cosf(angle), s = sinf(angle);

                  o = { p.x + (c - s) * rx, p.y + (s + c) * ry };
                  a = angle + (res-1) * da;
                  for(t = 0; t < res; t++, j++, a -= da)
                     nodes[j] = { o.x - rx * cosf(a), o.y - ry * sinf(a) };
               }
            }
            break;
         }
         case ShapeType::ellipse:
         {
            Ellipse ellipse = (Ellipse)shp;
            Pointf c = ellipse.center;
            float r = ellipse.radius;
            float k = ellipse.k;
            float rx = r * k;
            float a = 0, da = (float)(2*Pi);
            int i;

            noJoin = true;
            closed = true;
            count = r < 3 ? 6 : r < 20 ? 12 : r < 50 ? 30 : 100;
            da /= count;
            tmpNodes = { size = count };
            nodes = tmpNodes.array;
            for(i = 0; i < count; i++, a += da)
               nodes[i] = { c.x + cosf(a) * rx, c.y + sinf(a) * r };
            break;
         }
      }

      {
         LineJoin join = stroke.join;
         uint i, tc = count;

         // NOTE: Allowing to re-use previously allocated buffers... tess must be initialized!
         ixCount = 0;
         fillCount = 0;
         vCount = 0;

         if(stroke.width > 0 && tc && (tc > 1 || cap != flat))
         {
            int rCount = (!noJoin && join == round) ? 7 : (!noJoin && join == bevel) ? 2 : 1;
            int capCount = (cap == round) ? 7 : 1;
            uint16 startIX = 0;
            uint d = 0;
            bool flip = pointsArea(nodes, count) > 0;
            uint estFillCount = tc;
            Pointf * points;
            float lineWidth = stroke.width;
            Pointf * pp, * before, * after;
            float oldx, oldy, oat1;
            int inc = flip ? -1 : 1;
            uint ni = flip ? tc-1 : 0;

            if(tc == 1 && lineWidth < 2) lineWidth = 2;

            vCount = closed ? (tc * (rCount+1)) : (2*(capCount+1) + ((tc > 2) ? (tc-2) * (rCount+1) : 0));
            points = this.points = renew this.points Pointf[vCount];

            ixCount = closed ? (tc * rCount*2 + closed*2) :
               (2*(2*capCount) + ((tc > 2) ? (tc-2) * (2*rCount) : 0));
            ix = new uint16[ixCount];
            if(closed)
               ixFill = new uint16[estFillCount];
            fillCount = 0;

            pp = &nodes[ni];
            if(flip)
               before = nodes + (closed ?    0 : tc > 1 ? tc-2 : tc-1);
            else
               before = nodes + (closed ? tc-1 : tc > 1 ?    1 :    0);
            if(tc == 1) inc = 0;
            after = pp + inc;

            oldx = pp->x - before->x, oldy = pp->y - before->y;
            oat1 = atan2f(oldy, oldx);

            for(i = 0; i < tc + (tc == 1); i++)
            {
               bool end = false;
               Pointf p = *pp;
               float ordx = after->x - p.x, ordy = after->y - p.y;
               float oat2 = atan2f(ordy, ordx);

               if(i == tc + (tc == 1) - 1)
                  end = true;

               {
                  bool thisFlip = false, isCap = false;
                  float ldx = oldx, ldy = oldy;
                  float rdx = ordx, rdy = ordy;
                  float at1 = oat1, at2 = oat2;
                  float c, s;
                  float diffAngle;
                  int n;
                  bool simpleMean = true;

                  if(at2 < at1) at2 += 2*(float)Pi;

                  if(!closed && (i == 0 || end))
                     isCap = true;

                  diffAngle = at2 - at1;

                  if(Abs(diffAngle) >= (float)Pi - 0.00001)
                  {
                     simpleMean = false;

                     if(diffAngle < 0)
                        diffAngle += 2*(float)Pi;
                     else
                        diffAngle -= 2*(float)Pi;
                  }
                  if(!partialSector && Sgn(diffAngle) > 0)
                  {
                     // Inside/outside changed (e.g. zig zag patterns)
                     at1 = oat1 + (float)Pi; if(at1 > (float)Pi) at1 -= 2*(float)Pi;
                     at2 = oat2 + (float)Pi; if(at2 > (float)Pi) at2 -= 2*(float)Pi;

                     diffAngle = at2 - at1;
                     simpleMean = true;
                     thisFlip = true;
                     if(Abs(diffAngle) >= (float)Pi - 0.00001)
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
                     float r = lineWidth/2;
                     float rx = (r - sss) * fx + sss, ry = (r - sss) * fy + sss;

                     // Caps
                     switch(cap)
                     {
                        case round:
                        {
                           int t, add = 0;
                           float angle = (i == 0 && !end) ? at1 : at2, a, da;

                           if(i || end)
                           {
                              a = angle - (float)Pi/2 + (float)Pi;
                              points[startIX] = { p.x + cosf(a) * rx, p.y + sinf(a) * ry };
                              add = 1;
                           }
                           a = angle + (i ? (float)-Pi/2 : (float)Pi/2);

                           da = (float)Pi / (capCount-1);

                           for(t = 0; t < capCount; t++, a -= da)
                              points[startIX + add + t] = { p.x + cosf(a) * rx, p.y + sinf(a) * ry };

                           if(!i && !end)
                           {
                              a = angle + (float)Pi/2 + (float)Pi;
                              points[startIX + 1 + capCount-1] = { p.x + cosf(a) * rx, p.y + sinf(a) * ry };
                           }
                           break;
                        }
                        case flat:
                        {
                           float angle = (i == 0 && !end) ? at1 : at2;
                           float a = angle - (float)Pi/2;

                           c = cosf(a) * rx, s = sinf(a) * ry;
                           points[startIX  ] = { p.x - c, p.y - s };
                           points[startIX+1] = { p.x + c, p.y + s };
                           break;
                        }
                        case square:
                        {
                           float angle = (i == 0 && !end) ? at1 : at2;
                           float a = (i || end) ? (angle - (float)Pi/4) + (float)Pi : (angle + (float)Pi/4);

                           r *= sqrtf(2);
                           c = cosf(a) * rx, s = sinf(a) * ry;
                           points[startIX] = { p.x + c, p.y + s };

                           a = (i || end) ? (angle + (float)Pi/4) + (float)Pi : (angle - (float)Pi/4);
                           c = cosf(a) * rx, s = sinf(a) * ry;
                           points[startIX+1] = { p.x + c, p.y + s };
                           break;
                        }
                     }
                  }
                  else
                  {
                     float r = fabsf(lineWidth / cosf(diffAngle/2) / 2);
                     bool diffSigns = Sgn(at1) != Sgn(at2);
                     float angle;
                     float rx, ry;

                     if(join == round && r > lineWidth)
                        r = lineWidth;
                     rx = (r - sss) * fx + sss, ry = (r - sss) * fy + sss;

                     if(simpleMean)
                        angle = (at1 + at2) / 2;
                     else if(diffSigns && ldy > 0 && rdy < 0 && !ldx && !rdx)
                        angle = (float)Pi;
                     else if(diffSigns && ldy < 0 && rdy > 0 && !ldx && !rdx)
                        angle = 0;
                     else
                        angle = (at1 + at2) / 2 + (float)Pi;

                     angle += (float)Pi/2;

                     c = cosf(angle) * rx, s = sinf(angle) * ry;

                     points[startIX] = { p.x - c, p.y - s };

                     if(rCount > 1)
                     {
                        float da = diffAngle / (rCount-1);
                        float a = at2 + (float)Pi/2 - da * (rCount-1);
                        int t;

                        r = lineWidth / 2;
                        rx = (r - sss) * fx + sss, ry = (r - sss) * fy + sss;

                        for(t = 0; t < rCount; t++, a += da)
                           points[startIX+1+t] = { p.x + cosf(a) * rx, p.y + sinf(a) * ry};
                     }
                     else
                        points[startIX+1] = { p.x + c, p.y + s };

                     if(thisFlip && !fullSector && !partialSector)
                     {
                        int t;

                        r = lineWidth * 1/*.1f*/ / 2;   // TODO: Handle this properly... 1.1 works around not adding an extra vertex
                        rx = (r - sss) * fx + sss, ry = (r - sss) * fy + sss;

                        if(diffAngle < Pi/2)
                           angle += Pi;
                        else
                           angle += Pi/2;
                        c = cosf(angle) * rx, s = sinf(angle) * ry;
                        points[startIX+1] = { p.x - c, p.y - s };
                        if(closed)
                        {
                           estFillCount += rCount-1;
                           ixFill = renew ixFill uint16[estFillCount];

                           ixFill[fillCount] = (uint16)(startIX+1);
                           for(t = 0; t < rCount-1; t++)
                              ixFill[fillCount+t+1] = (uint16)(startIX+1+t);

                           fillCount += rCount;
                        }
                     }
                     else if(closed)
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

               before = pp;
               ni += inc;
               pp += inc;

               if(i < tc - 2)
                  after = pp + inc;
               else if(flip)
                  after = nodes + (closed ? tc-1 : tc > 1 ? tc-1-i : tc-1);
               else
                  after = nodes + (closed ?    0 : tc > 1 ?      i : 0);

               oldx = ordx, oldy = ordy;
               oat1 = oat2;
            }
            if(closed)
            {
               ix[d++] = 0;
               ix[d++] = 1;
            }
         }
         else
         {
            vCount = tc;
            points = renew points Pointf[tc];
            memcpy(points, nodes, tc * sizeof(Pointf));
            ixCount = 0; //tc + closed;
            fillCount = tc + closed;
            ix = null; //renew ix uint16[tc];
            ixFill = renew ixFill uint16[tc + closed];

            for(i = 0; i < tc; i++)
               ixFill[i] = (uint16)i;
            if(closed)
               ixFill[i] = 0;
         }

         if(closed)
         {
            if(needTesselation)   //<--- TODO: Tesselating everything for now to convert it all to trianglestrip.  Change this whole section to match with faster tesselator
            {
               // TODO: Switch from GLU Tesselation to new 'ctess' code
               Array<Pointf> tPoints { };
               Array<TessPrim> prims = null;
               Array<Pointf> output = null;
               uint16 * newFill;
               uint added;
               int j;

               tPoints.size = fillCount;
               for(i = 0; i < fillCount; i++)
                  tPoints[i] = points[ixFill[i]];

               tesselatePolygonEx(tPoints, inner, &output, &prims);

               added = output.count - tPoints.count;
               if(added > 0)
               {
                  points = renew points Pointf[vCount + added];
                  memcpy(points + vCount, output.array + tPoints.count, sizeof(Pointf) * added);
               }

               fillCount = 0;
               // fillMode = triangleStrip;
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

               #define FIND_IX(ii) ((prim->indices[ii] < tPoints.count) ? ixFill[prim->indices[ii]] : (uint16)(vCount + prim->indices[ii] - tPoints.count))

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
                           if(fillCount)
                           {
                              // Degenerate
                              newFill[fillCount] = newFill[fillCount-1];
                              newFill[fillCount+1] = FIND_IX(i+1);
                              fillCount += 2;
                           }
                           newFill[fillCount++] = FIND_IX(i+1);
                           newFill[fillCount++] = FIND_IX(i+0);
                           newFill[fillCount++] = FIND_IX(i+2);
                        }
                        break;
                     case triangleStrip:
                        if(fillCount)
                        {
                           // Degenerate
                           newFill[fillCount] = newFill[fillCount-1];
                           newFill[fillCount+1] = FIND_IX(0);
                           fillCount += 2;
                        }

                        for(i = 0; i < prim->count; i++)
                           newFill[fillCount++] = FIND_IX(i);
                        break;
                     case triangleFan:
                        if(fillCount)
                        {
                           // Degenerate
                           newFill[fillCount] = newFill[fillCount-1];
                           newFill[fillCount+1] = FIND_IX(1);
                           fillCount += 2;
                        }

                        newFill[fillCount++] = FIND_IX(1);
                        for(i = 2; i < prim->count; i++)
                        {
                           newFill[fillCount++] = FIND_IX(0);
                           newFill[fillCount++] = FIND_IX(i);
                        }
                        break;
                  }
               }

               vCount += added;

               delete ixFill;
               ixFill = newFill;

               delete tPoints;
               prims.Free();
               delete prims;
               delete output;
            }
            else
            {
               int fc = fillCount;
               uint16 * nixFill = new uint16[(fc-2)*2 + 1];

               fillCount = 0;

               if(partialSector)
               {
                  // Special partial sector arc fill code
                  int n = fc >> 1, j = fc - 1;

                  for(i = 0; i < n; i++, j--)
                  {
                     nixFill[fillCount++] = ixFill[i];
                     nixFill[fillCount++] = ixFill[j];
                  }
               }
               else
               {
                  nixFill[fillCount++] = ixFill[1];
                  for(i = 2; i < fc; i++)
                  {
                     nixFill[fillCount++] = ixFill[0];
                     nixFill[fillCount++] = ixFill[i];
                  }
               }
               // fillMode = triangleStrip;
               delete ixFill;
               ixFill = nixFill;
            }
         }
      }

      delete tmpNodes;
   }
};
