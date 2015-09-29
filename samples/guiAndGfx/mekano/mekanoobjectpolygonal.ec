import "mekanoobject"
import "mekanopolygon"

class MekanoObjectPolygonal : MekanoObject
{
private:
   List<MekanoPolygon> m_Polygons { };

public:
   property List<MekanoPolygon> polygons { get { return m_Polygons; } }

   void addPolygon(MekanoPolygon polygon)
   {
      m_Polygons.Add(polygon);
   }

   ~MekanoObjectPolygonal()
   {
      m_Polygons.Free();
   }

   void computePoints()
   {
      for(poly : m_Polygons)
      {
         for(p : poly.points)
         {
            p.lastLocalPosition = p.localPosition;
            p.computeLocalPosition();
         }
      }
   }

   void draw(MekanoDisplay display)
   {
      MekanoObject::draw(display);
      for(p : m_Polygons)
         display.drawPolygon(m_Position, p);
   }

   bool isInside(Vector2D v)
   {
      Vector2D localposition;
      float radius = boundingRadius;
      localposition.subtract(v, position);
      if(radius)
         if(localposition.length > radius)
            return false;

      for(p : m_Polygons; p.isInside(localposition))
         return true;
      return false;
   }
}
