import "vector"
import "mekanoobject"

public enum MekanoPointType { unknown, center, vertex };

class MekanoPoint : struct // TOFIX: Container issues with this : private Vector2D
{
private:
   Vector2D pt;
   MekanoPointType m_Type;
   MekanoObject m_pObject;
   Vector2D m_LastLocalPosition;
   Vector2D m_LocalPosition;
   Vector2D m_ScreenPosition;

public:
   property MekanoObject object          { set { m_pObject = value; value.addPoint(this); } get { return m_pObject; } }
   property MekanoPointType type         { set { m_Type = value; } get { return m_Type; } }
   property float x                      { set { pt.x = value; } get { return pt.x; } }
   property float y                      { set { pt.y = value; } get { return pt.y; } }

   property Vector2D lastLocalPosition   { set { m_LastLocalPosition = value; } }
   property Vector2D localPosition       { get { value = m_LocalPosition; } }
   property Vector2D deltaLocalPosition  { get { value.subtract(m_LocalPosition, m_LastLocalPosition); } }
   property Vector2D screenPosition      { get { value.add(m_LocalPosition, m_pObject.position); } }
   property Vector2D deltaScreenPosition { get { value.add(deltaLocalPosition, m_pObject.deltaPosition); } }

   void computeLocalPosition()
   {
      m_LocalPosition = { x*m_pObject.cosRotation - y * m_pObject.sinRotation, x*m_pObject.sinRotation + y*m_pObject.cosRotation };
   }

   void computeBoundingRadius()
   {
      float l = pt.length;
      if(m_pObject.boundingRadius < l)
         m_pObject.boundingRadius = l;
   }
};
