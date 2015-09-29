import "mekanoobjectpolygonal"

enum ObjBoxPointType { topPoint = 1, bottomPoint = 2 };

class MekanoPolygonalBox : MekanoObjectPolygonal
{
private:
   float m_fSize;

public:
   property int size
   {
      get { return (int)m_fSize; }
      set
      {
         MekanoPolygon polygon { this };

         MekanoPoint { this, type = center };
         polygon.addPoint(MekanoPoint { this, type = vertex, -value/2+2, -value/2+2 });
         polygon.addPoint(MekanoPoint { this, type = vertex, 0, -value/2 }); // 1
         polygon.addPoint(MekanoPoint { this, type = vertex, value/2-2, -value/2+2 });
         polygon.addPoint(MekanoPoint { this, type = vertex, value/2-2, value/2-2 });
         polygon.addPoint(MekanoPoint { this, type = vertex, 0, value/2 }); // 4
         polygon.addPoint(MekanoPoint { this, type = vertex, -value/2+2, value/2-2 });
         m_fSize = value;

         computeBoundingRadius();
      }
   }

   void applyForce(Vector2D v, MekanoPoint pt)
   {
      m_AppliedForce.add(m_AppliedForce, v);
      m_fAppliedTorque += v.dotProduct(pt.localPosition.normal);
   }

   void step(Time dt)
   {
      MekanoObjectPolygonal::step(dt);

      // Translation
      m_Acceleration.divide(m_AppliedForce, m_fMass);

      m_Speed.x+=m_Acceleration.x*(float)dt;
      m_Speed.y+=m_Acceleration.y*(float)dt;

      m_Position.x+=m_Speed.x*(float)dt;
      m_Position.y+=m_Speed.y*(float)dt;

      // Rotation
      m_fAngularAcceleration=m_fAppliedTorque/m_fInertiaMoment;
      m_fAngularSpeed+=m_fAngularAcceleration*(float)dt;

      // FIXME: Air friction here?
      m_fAngularSpeed-=m_fAngularFriction*m_fAngularSpeed;

      rotation += +m_fAngularSpeed*(float)dt;
      computePoints();
   }

   MekanoPoint getCertainPoint(ObjBoxPointType type)
   {
      List<MekanoPolygon> polygons = this.polygons;
      if(polygons.count)
      {
         MekanoPolygon polygon = polygons[0];
         int index = 0, lookup = type == topPoint ? 1 : 4;
         for(p : polygon.points; index++ == lookup)
            return p;
      }
      return null;
   }

   void draw(MekanoDisplay display)
   {
      MekanoObjectPolygonal::draw(display);
      if(attributes.highlighted)
         display.drawCrossHair(position, 10);
   }
}
