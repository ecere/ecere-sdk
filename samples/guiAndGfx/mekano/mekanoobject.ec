import "mekanopoint"
import "mekanosimulation"

class ObjectAttributes : uint { bool selected:1, steady:1, highlighted:1; };

class MekanoObject
{
   void addPoint(MekanoPoint point)
   {
      m_Points.Add(point);
   }

   float m_fMass;
   float m_fInertiaMoment;

   float m_fCosRotation;
   float m_fSinRotation;

   float m_fAppliedTorque;
   float m_fAngularAcceleration;
   float m_fAngularSpeed;
   float m_fRotation;
   float m_fAngularFriction;

   float m_fBoundingRadius;

   Vector2D m_AppliedForce;
   Vector2D m_Acceleration;
   Vector2D m_Speed;
   Vector2D m_Position;
   Vector2D m_LastPosition;

   ObjectAttributes m_Attributes;
   List<MekanoPoint> m_Points { };

public:

   ~MekanoObject()
   {
      m_Points.Free();
   }

   property MekanoSimulation simulation { set { value.addObject(this); } }

   mass = 1.0f;
   inertiaMoment = 10;
   angularFriction = 0.1f;

   property float cosRotation { get { return m_fCosRotation; } };
   property float sinRotation { get { return m_fSinRotation; } };

   property float mass
   {
      set { m_fMass=value; }
      get { return m_fMass; }
   }

   property float inertiaMoment
   {
      set { m_fInertiaMoment=value; }
      get { return m_fInertiaMoment; }
   }

   property float boundingRadius
   {
      set { m_fBoundingRadius=value; }
      get { return m_fBoundingRadius; }
   }

   property float angularSpeed
   {
      set { m_fAngularSpeed=value; }
      get { return m_fAngularSpeed; }
   }

   property float angularAcceleration
   {
      set { m_fAngularAcceleration=value; }
      get { return m_fAngularAcceleration; }
   }

   property float angularFriction
   {
      set { m_fAngularFriction=value; }
      get { return m_fAngularFriction; }
   }

   property Vector2D lastPosition
   {
      set { m_LastPosition=value; }
      get { value = m_LastPosition; }
   }

   property Vector2D position
   {
      set { m_Position=value; }
      get { value = m_Position; }
   }

   property Vector2D speed
   {
      set { m_Speed=value; }
      get { value = m_Speed; }
   }

   property Vector2D acceleration
   {
      set { m_Acceleration=value; }
      get { value = m_Acceleration; }
   }

   property Vector2D deltaPosition { get { value.subtract(m_Position, m_LastPosition); } };

   property ObjectAttributes attributes { set { m_Attributes=value; } get { return m_Attributes; } }

   property Vector2D AppliedForce
   {
      set { m_AppliedForce=value; }
      get { value = m_AppliedForce; }
   }

   property float appliedTorque
   {
      set { m_fAppliedTorque=value; }
      get { return m_fAppliedTorque; }
   }

   property List<MekanoPoint> points { get { return m_Points; } };

   property MekanoPoint centerPoint
   {
      get
      {
         for(p : m_Points; p.type == center)
            return p;
         return null;
      }
   }

   property float rotation
   {
      get { return m_fRotation; }
      set
      {
         m_fRotation=value;
         m_fCosRotation=(float)cos(value);
         m_fSinRotation=(float)sin(value);
      }
   }

   virtual void resetForces() { m_AppliedForce = { }, m_fAppliedTorque = 0; };
   virtual void exertForces(MekanoSimulation sim);
   virtual void applyForce(Vector2D f, MekanoPoint pt);
   virtual void draw(MekanoDisplay display);
   virtual void step(Time dt) { lastPosition = m_Position; }
   virtual bool isInside(Vector2D v) { return false; }
   virtual bool isColliding(MekanoPoint pt, Vector2D normal) { return false; }

   void computeBoundingRadius()
   {
      for(p : m_Points; p.type == vertex)
         p.computeBoundingRadius();
   }
}
