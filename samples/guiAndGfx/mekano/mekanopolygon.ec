import "mekanoobjectpolygonal"

class MekanoPolygon
{
   List<MekanoPoint> m_Points { };

public:
   property MekanoObjectPolygonal polygonal { set { value.addPolygon(this); } }

   property List<MekanoPoint> points { get { return m_Points; } }

   void addPoint(MekanoPoint point)
   {
      m_Points.Add(point);
   }

   bool ::crosses(Vector2D c, Vector2D p1, Vector2D p2)
   {
      if(c.y>Min(p1.y, p2.y) && c.y<Max(p1.y, p2.y) && c.x <= Max(p1.x, p2.x))
      {
         float xinters=(c.y-p1.y)*(p2.x-p1.x)/(p2.y-p1.y)+p1.x;
         return (p1.x==p2.x || c.x<xinters);
      }
      return false;
   }

   bool isInside(Vector2D v)
   {
      if(m_Points.count > 1)
      {
         int c = 0;
         MekanoPoint point1, point2 = null, firstpoint = null;
         bool first = true;

         for(p : m_Points)
         {
            if(first)
            {
               firstpoint = point2 = p;
               first = false;
            }
            else
            {
               point1 = point2;
               point2 = p;
               if(crosses(v, point1.localPosition, point2.localPosition))
                  c++;
            }
         }
         if(crosses(v, point2.localPosition, firstpoint.localPosition))
            c++;
         return c & 1;
      }
      return false;
   }
}
