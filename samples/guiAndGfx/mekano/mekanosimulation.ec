import "mekanodisplay"

class MekanoSimulation
{
private:
   List<MekanoObject> m_Objects { };

   float m_fTimeMultiplier;
   Time m_LastTime;

public:
   timeMultiplier = 1.0f;
   m_LastTime = GetTime();

   property float timeMultiplier
   {
      get { return m_fTimeMultiplier; }
      set { m_fTimeMultiplier=value; }
   }

   property List<MekanoObject> objectList
   {
      get { return m_Objects; }
   }

   property Time elapsedSeconds
   {
      get
      {
         Time time = GetTime(), diff=time - m_LastTime;
         m_LastTime = time;
         return diff;
      }
   }

   void render(MekanoDisplay display)
   {
      for(o : m_Objects)
         o.draw(display);
   }

   void step(Time dt)
   {
      for(o : m_Objects; !o.attributes.steady)
         o.step(dt);
   }

   void stepDelta()
   {
      step(elapsedSeconds * m_fTimeMultiplier);
   }

   void exertForces()
   {
      for(o : m_Objects)
         o.exertForces(this);
   }

   void resetForces()
   {
      for(o : m_Objects)
         o.resetForces();
   }

   void addObject(MekanoObject object)
   {
      incref object;
      m_Objects.Add(object);
   }

   void empty()
   {
      m_Objects.Free();
   }
}
