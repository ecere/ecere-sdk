import "ecere"

import "raytracer"

class RTCube : RTObject
{
   Vector3D center;
   Plane planes[6];
   Vector3D normals[6];
   Matrix mat { };
   Matrix inverse { };

   void Compute(RTScene scene)
   {
      int c;
      Vector3D vertices[8] =
      {
         { -size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2,-size.y/2,-size.z/2 },
         {  size.x/2, size.y/2,-size.z/2 },
         { -size.x/2, size.y/2,-size.z/2 },

         { -size.x/2,-size.y/2, size.z/2 },
         {  size.x/2,-size.y/2, size.z/2 },
         {  size.x/2, size.y/2, size.z/2 },
         { -size.x/2, size.y/2, size.z/2 }
      };

      uint16 indices[6][4] =
      {
         { 1,5,4,0 },   // up    (yellow)
         { 0,3,2,1 },   // front (blue)
         { 6,2,3,7 },   // down  (red)
         { 5,6,7,4 },   // back  (green)
         { 1,2,6,5 },   // right (orange)
         { 4,7,3,0 }    // left  (purple)
      };
      Matrix m2;
      Vector3D cameraVector { 0, 0, 1 };
      mat.RotationQuaternion(orientation);
      m2.RotationQuaternion(orientation);
      inverse.Transpose(m2);
      c = 0;
      for(lt : scene.lights)
      {
         Light * light = lt;
         localLightDirection[c].MultMatrix(light->direction, inverse);
         localLightDirection[c].Normalize(localLightDirection[c]);
         c++;
      }
      localCameraDirection.MultMatrix(cameraVector, inverse);
      localCameraDirection.Normalize(localCameraDirection);

      for(c = 0; c < 8; c++)
      {
         Vector3D v;
         v.MultMatrix(vertices[c], mat);
         vertices[c].Add(v, center);
      }
      // Planes are in world space...
      for(c = 0; c < 6; c++)
         planes[c].FromPoints(vertices[indices[c][2]], vertices[indices[c][1]], vertices[indices[c][0]]);

      // PrintLn(planes[1].normal);
   }

   bool IsPointInside(Vector3D p)
   {
      bool inside = true;
      int i;

      for(i = 0; i < 6; i++)
      {
                 // planes[i].normal.DotProduct(p) + planes[i].d
         double r = planes[i].a * p.x + planes[i].b * p.y + planes[i].c * p.z + planes[i].d;
         if(r > 1E-12)
         {
            inside = false;
            break;
         }
      }
      return inside;
   }

   bool Render(Camera camera, RTScene scene, Line ray, ColorARGBd * color, Vector3D i, Vector3D vi)
   {
      int plane;
      Vector3D intersect, lastIntersect;
      bool gotIntersect = false;
      Color colors[6] =
      {
         yellow, blue, red, green, orange, purple
      };
      struct Material mat = *(struct Material *)GetDefaultMaterial();

      for(plane = 0; plane < 6; plane++)
      //plane = 1;
      {
         double divisor = planes[plane].a * ray.delta.x + planes[plane].b * ray.delta.y + planes[plane].c * ray.delta.z;
         if(divisor)
         {
            bool visible = true;

            planes[plane].IntersectLine(ray, intersect);

            // Check if intersection point with this plane is outside the cube
            visible = RTCube::IsPointInside(intersect);

            if(visible && gotIntersect)
            {
               Vector3D v;
               camera.TransformPoint(v, intersect);

               if(v.z > lastIntersect.z)
                  visible = false;
            }
            if(visible)
            {
               if(i != null) i = intersect;

               if(color)
               {
                  Vector3D n;

                  ((Material)&mat).diffuse = colors[plane];
                  ((Material)&mat).specular = colors[plane];
                  ((Material)&mat).ambient = colors[plane];

                  n.MultMatrix(planes[plane].normal, inverse);
                  n.Normalize(n);

                  applyColor(scene, n, intersect, (Material)&mat, color);
               }
               gotIntersect = true;
               camera.TransformPoint(lastIntersect, intersect);
               if(vi != null) vi = lastIntersect;
            }
         }
      }
      return gotIntersect;
   }
}
