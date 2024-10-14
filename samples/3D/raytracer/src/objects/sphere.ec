import "ecere"

import "raytracer"

class RTSphere : RTObject
{
   Vector3D center;
   double radius;
   Vector3D tCenter;
   Matrix mat, inverse;

   material.ambient = white;
   material.diffuse = white;
   material.specular = white;
   material.power = 30;

   void Compute(RTScene scene)
   {
      Matrix m2;
      Vector3D cameraVector { 0, 0, 1 };
      int l = 0;

      mat.RotationQuaternion(orientation);
      m2.RotationQuaternion(orientation);
      inverse.Transpose(m2);

      size = { 2 * radius, 2 * radius, 2 * radius };

      for(lt : scene.lights)
      {
         Light * light = lt;
         localLightDirection[l].MultMatrix(light->direction, inverse);
         localLightDirection[l].Normalize(localLightDirection[l]);
         l++;
      }
      localCameraDirection.MultMatrix(cameraVector, inverse);
      localCameraDirection.Normalize(localCameraDirection);

      tCenter = center;
   }

   bool IsPointInside(Vector3D p)
   {
      Vector3D d;
      d.Subtract(p, tCenter);
      return d.length < radius;
   }

   bool IntersectRay(Line ray, Vector3D p0, Vector3D p1)
   {
      /*
      // FIXME: Line::IntersectSphere() is missing a center and option to return 2 points
      Line rayLocal;
      double t;
      rayLocal.p0.Subtract(ray.p0, center);
      rayLocal.delta.Normalize(ray.delta);
      if(rayLocal.IntersectSphere(radius, &t))
      {
         p0 = {
            rayLocal.p0.x + t * rayLocal.delta.x,
            rayLocal.p0.y + t * rayLocal.delta.y,
            rayLocal.p0.z + t * rayLocal.delta.z
         };
      }
      */

      Vector3D omc;
      double uomc, omc2, v;
      Vector3D delta;

      delta.Normalize(ray.delta); // ray is not normalized...

      omc.Subtract(ray.p0, tCenter);
      omc2 = omc.x * omc.x + omc.y * omc.y + omc.z * omc.z;
      uomc = delta.DotProduct(omc);

      v = uomc * uomc - omc2 + radius * radius;
      if(v >= 0)
      {
         if(p0 != null && p1 != null)
         {
            double s = sqrt(v);
            double t = -uomc + s;

            p0 = {
               ray.p0.x + delta.x * t,
               ray.p0.y + delta.y * t,
               ray.p0.z + delta.z * t };

            t = -uomc - s;

            p1 = {
               ray.p0.x + delta.x * t,
               ray.p0.y + delta.y * t,
               ray.p0.z + delta.z * t };
         }
         return true;
      }
      return false;
   }

   bool Render(Camera camera, RTScene scene, Line ray, ColorARGBd * color, Vector3D i, Vector3D vi)
   {
      bool gotIntersect = false;
      Vector3D a, b;

      if(IntersectRay(ray, a, b))
      {
         Vector3D lastIntersect;

         for(p : [ a, b ])
         {
            Vector3D n;
            Vector3D intersect = p;
            Vector3D v;
            camera.TransformPoint(v, intersect);

            if(gotIntersect && v.z > lastIntersect.z)
               /*visible = false*/;
            else
            {
               Vector3D t;

               gotIntersect = true;

               if(i != null) i = intersect;

               n.Subtract(intersect, tCenter);

               t.MultMatrix(n, inverse);
               n.Normalize(t);

               if(color)
                  applyColor(scene, n, intersect, null, color);

               lastIntersect = intersect;
               camera.TransformPoint(lastIntersect, intersect);
               if(vi != null) vi = lastIntersect;
            }
         }
      }
      return gotIntersect;
   }
}
