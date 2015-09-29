import "mekanosimulation"

class MekanoObjectGravity : MekanoObject
{
   Vector2D gravity;

public:
   property Vector2D gravity
   {
      set { gravity = value; }
      get { value = gravity; }
   }

   void exertForces(MekanoSimulation sim)
   {
      for(o : sim.objectList)
         for(p : o.points; p.type == center)
         {
            Vector2D f;
            f.scale(gravity, o.mass);
            o.applyForce(f, p);
         }
   }
}
