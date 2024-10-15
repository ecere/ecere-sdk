/********************************************************
   This sample demonstrates a simple raytracer.
********************************************************/
public import "ecere"

import "rtView"

import "cube"
import "sphere"
import "mandelbulb"
import "icosahedron"

#define RENDER_MANDELBULB
// #define RENDER_CUBE
// #define RENDER_SPHERE

// #define RENDER_ICOSAHEDRON
#ifdef RENDER_ICOSAHEDRON
   #define RENDER_ICOSAHEDRON_VERTICES
   #define RENDER_ICOSAHEDRON_CENTROIDS
   #define RENDER_ICOSAHEDRON_INSPHERE
   // #define RENDER_ICOSAHEDRON_CIRCUMSPHERE
#endif

#ifdef RENDER_MANDELBULB
define globalAmbient = black;
#else
define globalAmbient = ColorRGB { 0.1, 0.1, 0.1 };
#endif

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

RTScene scene { globalAmbient = globalAmbient };
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

      #ifdef RENDER_MANDELBULB
      scene.objects.Add(RTMandelbulb {
         material.power = 16;
         material.ambient = (ColorRGB)blanchedAlmond; // FIXME: Needs cast since modularization...
         material.specular = (ColorRGB)blanchedAlmond;
         material.diffuse = (ColorRGB)blanchedAlmond,
         center = { 0,0,0 }, orientation = Euler { yaw = 0, pitch = 220 }, size = { 100, 100, 100 } });
      #endif

      #ifdef RENDER_CUBE
      scene.objects.Add(RTCube { center = { 0, 0, 0 }, orientation = Euler { 143, -138, 0 }, size = { 45, 45, 45 } });
      //scene.objects.Add(RTCube { center = { }, size = { 100, 100, 100 } });
      //scene.objects.Add(RTCube { center = { 0, 0, 0 }, orientation = Euler { 0 }, size = { 45, 45, 45 } });
      #endif

      #ifdef RENDER_SPHERE
      scene.objects.Add(RTSphere { center = { 0, 0, 0 }, radius = 25, orientation = Euler { 0 } });
      #endif

      #ifdef RENDER_ICOSAHEDRON
      {
         // Icosahedron
         Vector3D vertices[12];
         Vector3D centroids[20];
         Vector3D offsets[20];
         RTIcosahedron ico
         {
            center = { 0, 0, 0 }, edgeSize = 35, orientation = Euler { 0 },
            material.diffuse = (ColorRGB)green,
            material.specular = (ColorRGB)green,
            material.ambient = (ColorRGB)green
         };
         int i;

         scene.objects.Add(ico);

         ico.getVertices(vertices);
         ico.getCentroids(centroids);
         ico.Compute(scene);
         ico.getNormalOffsets(offsets);

         // Circumsphere
         #ifdef RENDER_ICOSAHEDRON_CIRCUMSPHERE
         scene.objects.Add(RTSphere { center = { 0,0,0 }, radius = ico.edgeSize * 0.95105651629515346, orientation = Euler { 0 } });
         #endif
         // Insphere
         #ifdef RENDER_ICOSAHEDRON_INSPHERE
         scene.objects.Add(RTSphere { center = { 0,0,0 }, radius = ico.edgeSize * 0.75576131407617, orientation = Euler { 0 } });
         #endif

         #ifdef RENDER_ICOSAHEDRON_VERTICES
         for(i = 0; i < 12; i++)
         {
            RTSphere s { center = vertices[i], radius = 1, orientation = Euler { 0 } };
            Color c = white;
            //if(i == 0) c = lime; else if(i == 1) c = magenta else if(i == 2) c = cyan;
            s.material.diffuse = (ColorRGB)c;
            scene.objects.Add(s);
         }
         #endif

         #ifdef RENDER_ICOSAHEDRON_CENTROIDS
         for(i = 0; i < 20; i++)
         {
            scene.objects.Add(RTSphere { center = centroids[i], radius = 0.5, orientation = Euler { 0 }, material.diffuse = (ColorRGB)cyan });
            // scene.objects.Add(RTSphere { center = offsets[i], radius = 0.25, orientation = Euler { 0 }, material.diffuse = (ColorRGB)green });
         }
         #endif
      }
      #endif
      return true;
   }
}
