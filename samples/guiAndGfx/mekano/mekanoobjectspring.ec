import "mekanoobject"

define DEFAULTZIGS = 5;

class MekanoObjectSpring : MekanoObject
{
private:
   float m_fLength;
   float m_fRestitution;
   float m_fDamping;
   bool m_bLinked;
   int m_nZigs;

   MekanoPoint m_pLinkPoints[2];

public:

   m_nZigs=DEFAULTZIGS;
   m_fRestitution=1;
   m_fDamping=2;

   property float length
   {
      set { m_fLength=value; }
      get { return m_fLength; }
   }

   property float damping
   {
      set { m_fDamping=value; }
      get { return m_fDamping; }
   }

   property float restitution
   {
      set { m_fRestitution=value; }
      get { return m_fRestitution; }
   }

   property int zigs
   {
      set { m_nZigs=value; }
      get { return m_nZigs; }
   }

   void draw(MekanoDisplay display)
   {
      if(m_bLinked)
      {
         Vector2D pos0=m_pLinkPoints[0].screenPosition;
         Vector2D pos1=m_pLinkPoints[1].screenPosition;
         display.drawSpring(pos0, pos1, m_nZigs);
      }
   }

   void exertForces(MekanoSimulation sim)
   {
      if(m_bLinked)
      {
         Vector2D relativepos;
         Vector2D relativespeed;
         Vector2D damping, force;
         MekanoObject obj0, obj1;
         float stretch;

         obj0=m_pLinkPoints[0].object;
         obj1=m_pLinkPoints[1].object;

         relativepos.subtract(m_pLinkPoints[1].screenPosition, m_pLinkPoints[0].screenPosition);
         relativespeed.subtract(obj1.speed, obj0.speed);
         stretch=relativepos.length-m_fLength;

         //damping=relativespeed*m_fDamping*(relativespeed%relativepos)/(relativepos%relativepos);
         damping.scale(relativespeed, m_fDamping);
         force.scale(relativepos.unit, stretch*m_fRestitution);

         obj0.applyForce(force, m_pLinkPoints[0]);
         obj0.applyForce(damping, m_pLinkPoints[0]);

         force.scale(force, -1);
         damping.scale(force, -1);

         obj1.applyForce(force, m_pLinkPoints[1]);
         obj1.applyForce(damping, m_pLinkPoints[1]);
      }
   }

   void link(MekanoPoint p1, MekanoPoint p2)
   {
      m_pLinkPoints[0]=p1;
      m_pLinkPoints[1]=p2;
      m_bLinked=true;
   }
}
