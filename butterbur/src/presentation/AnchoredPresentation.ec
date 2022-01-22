import "GraphicalSurface"

static bool calculateAnchoredTransform(RenderPassFlags flags, GraphicalSurface surface, Vector3D camPos,
   const Vector3D positionCartesian, float * transform)
{
   bool result = false;

   // For now, change the 2D projection to 3D with z = 0
   if(flags & { bbShapes = true, bbTextAndImages = true })
   {
      // TODO: Figure out how to do this only once per frame for both BB passes...
      Matrix * viewMatrix = &surface.viewMatrix;
      double *m = viewMatrix->array;
      float nearClip = (float)surface.nearClip, farClip = (float)surface.farClip;
      Vector3Df world
      {
         (float)(positionCartesian.x - camPos.x),
         (float)(positionCartesian.y - camPos.y),
         (float)(positionCartesian.z - camPos.z)
      };
      float z = (float)(world.x * m[0*4+2] + world.y * m[1*4+2] + world.z * m[2*4+2] + m[3*4+2]);
      if(z >= nearClip && z <= farClip)
      {
         Pointd fd { surface.camera.focal.w, surface.camera.focal.h };
         Pointd origin = surface.origin;
         int w = surface.width, h = surface.height;
         double xOffset = (1 + origin.x) * w / 2, yOffset = (1 - origin.y) * h / 2;
         float zInv = 1.0f / z;
         float x = (float)(world.x * m[0*4+0] + world.y * m[1*4+0] + world.z * m[2*4+0] + m[3*4+0]);
         float y = (float)(world.x * m[0*4+1] + world.y * m[1*4+1] + world.z * m[2*4+1] + m[3*4+1]);
         transform[0] = (float)(x * fd.x * zInv + xOffset);
         transform[1] = (float)(y * fd.y * zInv + yOffset);
         transform[2] = 0; // (float)(-projC + projD / z);  // TODO: Use for z-sorting presentations?
         if(transform[0] > -w && transform[1] > -h && transform[0] < (w << 1) && transform[1] < (h << 1))
            result = true;
      }
   }
   else if(flags.perspective)
   {
      float wx = (float)(positionCartesian.x - camPos.x), wy = (float)(positionCartesian.y - camPos.y), wz = (float)(positionCartesian.z - camPos.z);
      transform[0] = 1,  transform[ 1] = 0,  transform[ 2] = 0;
      transform[3] = 0,  transform[ 4] = 1,  transform[ 5] = 0;
      transform[6] = 0,  transform[ 7] = 0,  transform[ 8] = 1;
      transform[9] = wx, transform[10] = wy, transform[11] = wz;
      result = true;
   }
   return result;
}

public class AnchoredPresentation : MultiPresentation
{
   Vector3D positionCartesian;

   anchored = true;

   void prepareDraw(RenderPassFlags flags, DrawingManager dm, const void * data)
   {
      GraphicalSurface surface = (GraphicalSurface)dm.topPresentation;
      Vector3D cp = dm.cPosition;
      float transform[12];

      if(calculateAnchoredTransform(flags, surface, cp, positionCartesian, transform))
         MultiPresentation::prepareDraw(flags, dm, transform);
   }
}
