import "ecere"

import "raytracer"

static define phi = (1 + sqrt(5)) / 2;

static uint16 indices[20][3] =
{
   // Top triangles
   { 0, 1, 2 },
   { 0, 2, 3 },
   { 0, 3, 4 },
   { 0, 4, 5 },
   { 0, 5, 1 },

   // Mirror of Top triangles
   { 1, 6, 2 },
   { 2, 7, 3 },
   { 3, 8, 4 },
   { 4, 9, 5 },
   { 5,10, 1 },

   // Mirror of Bottom triangles
   { 6, 7, 2 },
   { 7, 8, 3 },
   { 8, 9, 4 },
   { 9,10, 5 },
   {10, 6, 1 },

   // Bottom triangles
   { 6,11, 7 },
   { 7,11, 8 },
   { 8,11, 9 },
   { 9,11,10 },
   {10,11, 6 }
};


class RTIcosahedron : RTObject
{
   Vector3D center;
   double edgeSize;

   Plane planes[20];
   Vector3D normals[20];
   Matrix mat { };
   Matrix inverse { };

   void getVertices(Vector3D * vertices /* [12] */)
   {
      double a = edgeSize;
      Radians t = atan(0.5);
      double ty =-sin(t), by =-sin(-t);
      double tc = cos(t), bc = cos(-t);
      double r = a * sqrt(phi * phi + 1) / 2;
      Radians s = 2*Pi/5;
      int i;

      vertices[ 0] = { 0, -r, 0 }; // North pole
      vertices[11] = { 0,  r, 0 }; // South pole

      for(i = 0; i < 5; i++)
      {
         Radians ta = -Pi + s * i;
         Radians ba = -Pi + s * i + s/2;

         // North hemisphere vertices
         vertices[1 + i] = { cos(ta) * r * tc, ty * r, sin(ta) * r * tc };
         // South hemisphere vertices
         vertices[6 + i] = { cos(ba) * r * bc, by * r, sin(ba) * r * bc };
      }
   }

   void getCentroids(Vector3D * centroids /* [20] */)
   {
      Vector3D vertices[20];
      int i;

      getVertices(vertices);

      for(i = 0; i < 20; i++)
      {
         int j;

         centroids[i] = { };
         for(j = 0; j < 3; j++)
            centroids[i].Add(centroids[i], vertices[indices[i][j]]);
         centroids[i].Scale(centroids[i], 1/3.0);
      }
   }

   void getNormalOffsets(Vector3D * offsets /* [20] */)
   {
      Vector3D centroids[20];
      int i;

      getCentroids(centroids);

      for(i = 0; i < 20; i++)
      {
         Vector3D n;
         n.Scale(planes[i].normal, 2);
         offsets[i].Add(centroids[i], n);
      }
   }

   void Compute(RTScene scene)
   {
      int i;
      Matrix m2;
      Vector3D cameraVector { 0, 0, 1 };
      Vector3D vertices[12];

      getVertices(vertices);

      mat.RotationQuaternion(orientation);
      m2.RotationQuaternion(orientation);
      inverse.Transpose(m2);

      i = 0;
      for(lt : scene.lights)
      {
         Light * light = lt;
         localLightDirection[i].MultMatrix(light->direction, inverse);
         localLightDirection[i].Normalize(localLightDirection[i]);
         i++;
      }
      localCameraDirection.MultMatrix(cameraVector, inverse);
      localCameraDirection.Normalize(localCameraDirection);

      for(i = 0; i < 12; i++)
      {
         Vector3D v;
         v.MultMatrix(vertices[i], mat);
         vertices[i].Add(v, center);
      }
      // Planes are in world space...
      for(i = 0; i < 20; i++)
         planes[i].FromPoints(vertices[indices[i][2]], vertices[indices[i][1]], vertices[indices[i][0]]);
   }

   bool IsPointInside(const Vector3D p)
   {
      bool inside = true;
      int i;

      for(i = 0; i < 20; i++)
      {
                 // planes[i].normal.DotProduct(p) + planes[i].d
         double r = (planes[i].a * p.x + planes[i].b * p.y + planes[i].c * p.z + planes[i].d);
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
      Color colors[20] =
      {
         yellow, blue, red, green, purple, orange,
         yellow, blue, red, green, purple, orange,
         yellow, blue, red, green, purple, orange,
         yellow, blue
      };
      //struct Material mat = *(struct Material *)GetDefaultMaterial();

      for(plane = 0; plane < 20; plane++)
      //plane = 1;
      {
         double divisor = planes[plane].a * ray.delta.x + planes[plane].b * ray.delta.y + planes[plane].c * ray.delta.z;
         if(divisor)
         {
            bool visible = true;
            Vector3D v;

            planes[plane].IntersectLine(ray, intersect);

            // Check if intersection point with this plane is outside the icosahedron
            visible = RTIcosahedron::IsPointInside(intersect);

            if(visible)
            {
               camera.TransformPoint(v, intersect);

               if(gotIntersect)
               {
                  if(v.z > lastIntersect.z)
                     visible = false;
               }
            }
            if(visible)
            {
               if(i != null) i = intersect;

               if(color)
               {
                  Vector3D n;

                  /*((Material)&mat).diffuse  = colors[plane];
                  ((Material)&mat).specular = colors[plane];
                  ((Material)&mat).ambient  = colors[plane];*/

                  n.MultMatrix(planes[plane].normal, inverse);
                  n.Normalize(n);

                  applyColor(scene, n, intersect, null /*(Material)&mat*/, color);
               }
               gotIntersect = true;
               lastIntersect = v;
               if(vi != null) vi = lastIntersect;
            }
         }
      }
      return gotIntersect;
   }
}
