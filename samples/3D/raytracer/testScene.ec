/********************************************************
   This sample demonstrates a simple raytracer.
********************************************************/
public import "ecere"

import "rtView"

import "cube"
import "sphere"
import "mandelbulb"

Light light
{
   multiplier = 0.75f;
   diffuse = lightSkyBlue;
   specular = blue;
   //orientation = Euler { pitch = 35, yaw = 15 };
   //orientation = Euler { pitch = -55, yaw = -25 };
   //orientation = Euler { pitch = 140, 75 };
   //orientation = Euler { 40, -24 };
   //orientation = Euler { 0,0 };
   orientation = Euler { 15, -24 };
   //orientation = Euler { Degrees { 0 } };
};

Light light2
{
   multiplier = 0.75f;
   diffuse = lightYellow;
   specular = white; //gray;
   //orientation = Euler { pitch = 35, yaw = 15 };
   //orientation = Euler { pitch = -55, yaw = -25 };
   //orientation = Euler { 150, 25 };
   //orientation = Euler { yaw = 35, pitch = 40 };
   //orientation = Euler { 40, -24 };
   //orientation = Euler { 0,0 };
   //orientation = Euler { 15, 24 };
   orientation = Euler { yaw = 35, pitch = 40 };
   //orientation = Euler { Degrees { 180 } };
};

Light light3
{
   multiplier = 1;
   ambient = { 0.1, 0.1, 0.1 };
   //diffuse = gray;
   specular = white;
   orientation = Euler { yaw = 135, pitch = -40 };
};

Camera camera
{
   type = attachedQuaternion,
   position = { 0, 0, -80 };
   fov = 53
   //orientation = Euler { -30, 0, 0 },

   //orientation = Euler { 30, 50, 0 },
   //orientation = Euler { 0, 179, 0 },
   //orientation = Euler { 0, 120, 0 }
};

RTScene scene { globalAmbient = black };
RTView view3D
{
   scene = scene;
   camera = camera;
   // position = { 3300, 500 };
   // numThreads = 1;
};

class RayTracerApp : GuiApplication
{
   bool Init()
   {
      scene.lights.Add(&light);
      scene.lights.Add(&light2);
      //scene.lights.Add(&light3);
      //scene.objects.Add(RTCube { center = { }, size = { 100, 100, 100 } });

      scene.objects.Add(RTMandelbulb {
         material.power = 16;
         material.ambient = (ColorRGB)blanchedAlmond; // FIXME: Needs cast since modularization...
         material.specular = (ColorRGB)blanchedAlmond;
         material.diffuse = (ColorRGB)blanchedAlmond,
         center = { 0,0,0 }, orientation = Euler { yaw = 0, pitch = 220 }, size = { 100, 100, 100 } });

      //scene.objects.Add(RTCube { center = { 0, 0, 0 }, orientation = Euler { 143, -138, 0 }, size = { 45, 45, 45 } });
      //scene.objects.Add(RTCube { center = { 0, 0, 0 }, orientation = Euler { 0 }, size = { 45, 45, 45 } });
      //scene.objects.Add(RTSphere { center = { 0, 0, 0 }, radius = 25, orientation = Euler { 0 } /*143, -138, 0 }*/ });
      return true;
   }
}
