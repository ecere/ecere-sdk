import "mekanoobjectfixed"
import "mekanoobjectspring"
import "mekanopolygonalbox"
import "mekanoobjectgravity"

class MekanoWnd : Window
{
private:
   Point mouse;
   MekanoDisplay display { };
   MekanoSimulation simulation { timeMultiplier = 4.0f };

   MekanoObjectFixed fix;
   fix = { simulation, position = { 300, 50 } };
   MekanoPolygonalBox pbox;
   pbox = { simulation, size = 20, mass = 10, inertiaMoment = 200 };
   MekanoObjectSpring spring;
   spring = { simulation, length = 60, restitution = 30 };

   MekanoObjectGravity gravity { gravity = { 0, 10 } };

   MekanoPolygonalBox lastbox;
   bool selected, dragging, buttondown;

public:

   caption = "Mekano";
#if defined(__EMSCRIPTEN__) || defined(__ANDROID__)
   anchor = { 0, 0, 0, 0 };
#else
   clientSize = { 640, 480 };
   hasMaximize = true, hasMinimize = true, hasClose = true;
   borderStyle = sizable;
#endif
   background = slateGray;

   // BitmapResource bg { ":ecere.bmp", window = this };

   MekanoWnd()
   {
      RandomSeed((uint)(((uint64)(GetTime() * 1000)) & MAXDWORD));
      pbox.position = { GetRandom(0,500), 110 };
      spring.link(MekanoPoint { fix, type = center }, pbox.getCertainPoint(topPoint));
      lastbox = pbox;
   }

   ~MekanoWnd()
   {
      simulation.empty();
   }

   Timer timer
   {
      this, started = true;

      bool DelayExpired()
      {
         simulation.resetForces();

         simulation.exertForces();
         simulation.stepDelta();

         if(!buttondown) dragging = false;

         for(object : simulation.objectList)
         {
            ObjectAttributes attributes=object.attributes;
            if(attributes.selected)
               if(dragging)
                  object.position = { mouse.x, mouse.y };

            attributes.selected = false;
            attributes.steady = false;

            if(object.isInside({ mouse.x, mouse.y }))
            {
               attributes.highlighted = true;
               if(buttondown)
               {
                  dragging=true;
                  attributes.selected = true;
                  attributes.steady = true;
               }
            }
            else
            {
               attributes.selected = false;
               attributes.highlighted = false;
            }
            object.attributes = attributes;
         }
         Update(null);

         return true;
      }
   };

   void OnRedraw(Surface surface)
   {
      //surface.Tile(bg.bitmap, 0, 0, clientSize.w, clientSize.h);
      display.surface = surface;
      simulation.render(display);
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      /*
      fix = MekanoObjectFixed { simulation, position = { x, y } };
      spring = { simulation, length = 30; restitution = 2; };

      spring.link(MekanoPoint { fix, type = center }, pbox.centerPoint);
      */

      //int c; for(c = 0; c<400; c++) {
      pbox =
      {
         simulation,
         size = 20,
         position = { x, y },
         mass = 10
      };

      spring =
      {
         simulation,
         length = 40,
         restitution = 10
      };

      spring.link(lastbox.getCertainPoint(bottomPoint), pbox.getCertainPoint(topPoint));
      lastbox=pbox;
      //}
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      buttondown=false;
      ReleaseCapture();
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      buttondown=true;
      Capture();
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      mouse = { x, y };
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape: Destroy(0); return false;
         case f:      ((GuiApplication)__thisModule.application).fullScreen ^= true; return false;
      }
      return true;
   }
}
