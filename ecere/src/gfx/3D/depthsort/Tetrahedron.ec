// Tetrahedron - Triangle intersection (with non-zero area and ignoring intersections at 0,0,0)
import "Plane"

enum UseAxes { zy, xz, xy };

#if 0
void planeFromTriOrQuad(Plane pl, const Vector3Df a, const Vector3Df b, const Vector3Df c, const Vector3Df d, UseAxes useAxes[2])
{
   Vector3Df p { b.x - a.x, b.y - a.y, b.z - a.z };
   Vector3Df m { c.x - a.x, c.y - a.y, c.z - a.z };
   double x = (double)p.y * m.z - (double)p.z * m.y;
   double y = (double)p.z * m.x - (double)p.x * m.z;
   double z = (double)p.x * m.y - (double)p.y * m.x;
   double l = x * x + y * y + z * z;
   double ax = fabs(x), ay = fabs(y), az = fabs(z);
   useAxes[0] = ax > ay && ax > az ? zy : ay > az ? xz : xy;

   if(d != null)
   {
      Vector3Df n = { d.x - a.x, d.y - a.y, d.z - a.z };
      double x2 = (double)m.y * n.z - (double)m.z * n.y;
      double y2 = (double)m.z * n.x - (double)m.x * n.z;
      double z2 = (double)m.x * n.y - (double)m.y * n.x;
      double ax2 = fabs(x2), ay2 = fabs(y2), az2 = fabs(z2);

      if(ax2 > ax) x = x2; // Use largest computed values of either tri for stability
      if(ay2 > ay) y = y2;
      if(az2 > az) z = z2;

      useAxes[1] = ax2 > ay2 && ax2 > az2 ? zy : ay2 > az2 ? xz : xy;
      x = Sgn(x2) != Sgn(x) ? 0 : (x2 + x) / 2;
      y = Sgn(y2) != Sgn(y) ? 0 : (y2 + y) / 2;
      z = Sgn(z2) != Sgn(z) ? 0 : (z2 + z) / 2;
      l = x * x + y * y + z * z;
   }

   l = FastInvSqrtDouble(l);
   x *= l, y *= l, z *= l;
   pl = { { x, y, z }, -x * a.x - y * a.y - z * a.z };
}
#endif

private static inline double fromLine(const Pointf p, const Pointf a, const Pointf b)
{
   return (double)(b.y - a.y) * (p.x - a.x) - (double)(p.y - a.y) * (b.x - a.x);
}

#define TRI_EPSILON  0.00001

// point inside triangle
static enum InsideReturn { outside, inside, onTheEdge };

static inline InsideReturn triPointInside(const Pointf * tri, const Pointf point, double e)
{
   const Pointf * p = tri;
   int winding = 0, i;
   for(i = 0; i < 3; i++, p++)
   {
      const Pointf * np = i == 2 ? tri : p+1;
      if(p->x <= point.x + e)
      {
         if(np->x > point.x + e)
         {
            double d = fromLine(point, p, np);
            if(d > e)
               winding++;
            else if(d > -e)
               return onTheEdge;
         }
      }
      else if(np->x <= point.x + e)
      {
         double d = fromLine(point, p, np);
         if(d < -e)
            winding--;
         else if(d < e)
            return onTheEdge;
      }
   }
   return winding != 0 ? inside : outside;
}

// segment - segment intersections
private static inline bool segIntersect(const Pointf s1, const Pointf d, const Pointf s2)
{
   double denom = (double)s1.x * s2.y - (double)s2.x * s1.y;
   if(fabs(denom) > TRI_EPSILON) // Co-linear otherwise
   {
      int sDenom = Sgn(denom);
      double s = (double)s1.x * d.y - (double)s1.y * d.x, as = fabs(s);
      if(as > TRI_EPSILON && Sgn(s) == sDenom)
      {
         double t = (double)s2.x * d.y - (double)s2.y * d.x, at = fabs(t);
         if(at > TRI_EPSILON && Sgn(t) == sDenom)
         {
            double d1 = s - denom, ad1 = fabs(d1);
            double d2 = t - denom, ad2 = fabs(d2);
            if(ad1 > TRI_EPSILON && Sgn(d1) != sDenom &&
               ad2 > TRI_EPSILON && Sgn(d2) != sDenom)
            {
               if(as < 0.01 || at < 0.01 || d1 < 0.01 || d2 < 0.01)
               {
                  double dt = t / denom;
                  return dt - TRI_EPSILON >= 0 && dt + TRI_EPSILON <= 1;
               }
               return true;
            }
         }
      }
   }
   return false;
}


// triangle - triangle intersections
static bool tris2DOverlap(const Pointf * t1, const Pointf * t2)
{
   int i;
   // Check if either triangle has a point inside the other
   for(i = 0; i < 3; i++)
      if(triPointInside(t1, t2[i], TRI_EPSILON) == inside || triPointInside(t2, t1[i], TRI_EPSILON) == inside)
         return true;

   // Check if any segment overlap the other triangle's segments
   {
      const Pointf * p0 = &t1[0];
      int i;
      for(i = 0; i < 3; i++, p0++)
      {
         const Pointf * np0 = i == 2 ? &t1[0] : &t1[i+1];
         const Pointf * p1 = &t2[0];
         Pointf s1 { np0->x - p0->x, np0->y - p0->y };
         int j;

         for(j = 0; j < 3; j++, p1++)
         {
            Pointf d { p0->x - p1->x, p0->y - p1->y };
            if(Abs(d.x) > TRI_EPSILON && Abs(d.y) > TRI_EPSILON)
            {
               const Pointf * np1 = j == 2 ? &t2[0] : &t2[j+1];
               Pointf s2 { np1->x - p1->x, np1->y - p1->y };
               if(segIntersect(s1, d, s2))
                  return true;
            }
         }
      }
   }
   return false;
}

bool coplanarTrisOverlap(const Vector3Df a1, const Vector3Df b1, const Vector3Df c1,
                         const Vector3Df a2, const Vector3Df b2, const Vector3Df c2, UseAxes useAxes)
{
   Pointf t1[3], t2[3];

   // Project to 2D
   if(useAxes == zy)
   {
      t1[0] = { c1.z, c1.y }, t1[1] = { b1.z, b1.y }, t1[2] = { a1.z, a1.y };
      t2[0] = { c2.z, c2.y }, t2[1] = { b2.z, b2.y }, t2[2] = { a2.z, a2.y };
   }
   else if(useAxes == xz)
   {
      t1[0] = { c1.x, c1.z }, t1[1] = { b1.x, b1.z }, t1[2] = { a1.x, a1.z };
      t2[0] = { c2.x, c2.z }, t2[1] = { b2.x, b2.z }, t2[2] = { a2.x, a2.z };
   }
   else
   {
      t1[0] = { a1.x, a1.y }, t1[1] = { b1.x, b1.y }, t1[2] = { c1.x, c1.y };
      t2[0] = { a2.x, a2.y }, t2[1] = { b2.x, b2.y }, t2[2] = { c2.x, c2.y };
   }

   return tris2DOverlap(t1, t2);
}

#define DUP_EPS  0.0005

struct Tetrahedron
{
   Vector3Df points[4];

   // Tetrahedron - plane intersection
   /*static */int intersectPlane(const Plane p, Vector3Df * iTri)
   {
      Vector3Df v[6];
      // Intersect all 6 edges with the plane
      uint r[6] =
      {
         p.IntersectSegment(points[0], points[1], v[0]),
         p.IntersectSegment(points[1], points[2], v[1]),
         p.IntersectSegment(points[0], points[2], v[2]),
         p.IntersectSegment(points[2], points[3], v[3]),
         p.IntersectSegment(points[3], points[0], v[4]),
         p.IntersectSegment(points[1], points[3], v[5])
      };
      int i, n = 0;
      // We are not interested in intersections which are a vertex of this tetrahedron being on the plane
      if((r[0] != 0) + (r[1] != 0) + (r[2] != 0) + (r[3] != 0) + (r[4] != 0) + (r[5] != 0) >= 2);
      if((r[0] == 1) + (r[1] == 1) + (r[2] == 1) + (r[3] == 1) + (r[4] == 1) + (r[5] == 1) >= 1);
      else
         return 0;

      if(iTri)
      {
         for(i = 0; i < 6 && n < 4; i++)
         {
                            // NOTE: for now ignoring intersections at 0,0,0 (eye in tetrahedron)
            if(r[i] && (v[i].x || v[i].y || v[i].z))
            {
               bool duplicate = false;
               int j;

               for(j = 0; j < n; j++)
               {
                  if(fabs(iTri[j].x - v[i].x) < DUP_EPS &&
                     fabs(iTri[j].y - v[i].y) < DUP_EPS &&
                     fabs(iTri[j].z - v[i].z) < DUP_EPS)
                  {
                     duplicate = true;
                     break;
                  }
               }
               if(!duplicate)
                  iTri[n++] = v[i];
            }
         }
      }
      return n;
   }

   bool triInside(const Vector3Df a, const Vector3Df b, const Vector3Df c)
   {
      Vector3Df p { b.x - a.x, b.y - a.y, b.z - a.z };
      Vector3Df m { c.x - a.x, c.y - a.y, c.z - a.z };
      double x = (double)p.y * m.z - (double)p.z * m.y;
      double y = (double)p.z * m.x - (double)p.x * m.z;
      double z = (double)p.x * m.y - (double)p.y * m.x;
      double l = x * x + y * y + z * z;
      double ax = fabs(x), ay = fabs(y), az = fabs(z);
      UseAxes useAxes = ax > ay && ax > az ? zy : ay > az ? xz : xy;
      Plane pl;
      Vector3Df iTri[4];
      int n;

      l = FastInvSqrtDouble(l);
      x *= l, y *= l, z *= l;
      pl = { { x, y, z }, -x * a.x - y * a.y - z * a.z };
      if(pl.d > 0)
      {
         pl.a *= -1, pl.b *= -1, pl.c *= -1;
         pl.d = -(pl.a * a.x + pl.b * a.y + pl.c * a.z);
      }
      n = intersectPlane(pl, iTri);
      if(n > 2)
      {
         if(coplanarTrisOverlap(a, b, c, iTri[0], iTri[1], iTri[2], useAxes))
            return true;
         if(n > 3)
            if(coplanarTrisOverlap(a, b, c, iTri[1], iTri[2], iTri[3], useAxes))
               return true;
      }
      return false;
   }

   bool triOrQuadInside(int n, const Vector3Df * p)
   {
      bool result = false;

      if(triInside(p[0], p[1], p[2]))
         result = true;
      else if(n == 4 && triInside(p[0], p[2], p[3]))
         result = true;
      return result;

#if 0
      // Currently disabled because a single plane intersection on a quad leads to false positive corner cases
      // comparing against the other triangle...
      Plane pl;
      Vector3Df iTri[4];
      int ni;
      UseAxes useAxes[2];

      planeFromTriOrQuad(pl, p[0], p[1], p[2], n > 3 ? &p[3] : null, useAxes);
      if(pl.d > 0)
      {
         pl.a *= -1, pl.b *= -1, pl.c *= -1;
         pl.d = -(pl.a * p[0].x + pl.b * p[0].y + pl.c * p[0].z);
      }
      ni = intersectPlane(pl, iTri);
      if(ni > 2)
      {
         if(coplanarTrisOverlap(p[0], p[1], p[2], iTri[0], iTri[1], iTri[2], useAxes[0]) || (n == 4 &&
            coplanarTrisOverlap(p[0], p[2], p[3], iTri[0], iTri[1], iTri[2], useAxes[1])))
         {
#ifdef _DEBUG
            /*
            if(!result)
            {
               bool a = coplanarTrisOverlap(p[0], p[1], p[2], iTri[0], iTri[1], iTri[2], useAxes[0]);
               bool b = (n == 4 && coplanarTrisOverlap(p[0], p[2], p[3], iTri[0], iTri[1], iTri[2], useAxes[1]));

               planeFromTriOrQuad(pl, p[0], p[1], p[2], n > 3 ? &p[3] : null, useAxes);

               if(triInside(p[0], p[1], p[2]))
                  result = true;
               else if(n == 4 && triInside(p[0], p[2], p[3]))
                  result = true;
            }
            */
#endif
            result = true;
         }
         else if(ni > 3)
            if(coplanarTrisOverlap(p[0], p[1], p[2], iTri[1], iTri[2], iTri[3], useAxes[0]) || (n == 4 &&
               coplanarTrisOverlap(p[0], p[2], p[3], iTri[1], iTri[2], iTri[3], useAxes[1])))
               result = true;
      }
#endif
      return result;
   }
};
