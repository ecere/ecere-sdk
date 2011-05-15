import "ecere"
#include <GL/gl.h>

GLDemo glDemo { };

class GLDemoApp : GuiApplication
{
   driver = "OpenGL";
}

class GLDemo : Window
{
   text = "GL Demo";
   background = black;
   hasClose = true;
   size = { 640, 480 };

   Camera camera { fixed, position = { 50, -50, -300 }, orientation = Euler { 25, 0, 0 }, fov = 53; };
   Light light { diffuse = white; specular = white; orientation = Euler { pitch = -45, yaw = 0 }; };

   Cube cube { };

   bool moving;
   Point lastMouse;

   Timer timer
   {
      this, 0.05, true;

      bool DelayExpired()
      {
         static Time lastTime = 0, time;
         time = GetTime();
         if(!lastTime) lastTime = time;
         UpdateObjects(time - lastTime);
         lastTime = time;
         Update(null);
         return true;
      }
   };

   void UpdateObjects(Time diffTime) 
   {
      Quaternion orientation = cube.transform.orientation;
      orientation.RotateYawPitch((Degrees)diffTime * 0.5, (Degrees)diffTime * 0.5);
      orientation.RotateRoll((Degrees)diffTime * 0.5);
      cube.transform.orientation = orientation;
      cube.UpdateTransform();
   }

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      cube.transform.scaling = { 100, 100, 100 };
      cube.transform.position = { 0, 0, 0 };
      cube.transform.orientation = Euler { 50, 50 };
      cube.UpdateTransform();
      return true;
   }
   
   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      camera.Update();
      display.SetLight(0, light);
      display.fogDensity = 0;
      display.SetCamera(surface, camera);

      display.DrawObject(cube);

      glPushMatrix();
      glTranslated(
         -camera.cPosition.x,
         -camera.cPosition.y,
         -camera.cPosition.z);

      glDisable(GL_LIGHTING);

      glBegin(GL_LINES);

      glColor3f(1, 0, 0);
      glVertex3f(-300, 0, 0);
      glVertex3f(300, 0, 0);

      glColor3f(0, 1, 0);
      glVertex3f(0, -300, 0);
      glVertex3f(0, 300, 0);

      glColor3f(0, 0, 1);
      glVertex3f(0, 0, -300);
      glVertex3f(0, 0, 300);

      glEnd();

      glEnable(GL_LIGHTING);

      glPopMatrix();

      display.SetCamera(surface, null);
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         int dx = (int)(x - lastMouse.x), dy = (int)(lastMouse.y - y);
         camera.RotateYaw(-dx, 0,0);
         camera.RotatePitch(dy, 0,0);
         Update(null);
         lastMouse.x = x;
         lastMouse.y = y;
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving)
      {
         bool back;
         Capture();
         moving = true;
         lastMouse = { x, y };
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch(key)
      {
         case wheelUp:
            camera.Move({ 0,0,100 });
            Update(null);
            break;
         case wheelDown:
            camera.Move({ 0,0,-100 });
            Update(null);
            break;
      }
      return true;
   }
}
