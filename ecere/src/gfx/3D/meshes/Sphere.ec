namespace gfx3D::meshes;

import "Display"

public class Sphere : Object
{
private:
   int numLat, numLon;
   numLat = 50;
   numLon = 50;
public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      if(this)
      {
         InitializeMesh(displaySystem);

         if(mesh)
         {
            if(mesh.Allocate({ vertices = true, normals = true }, (numLat-3) * numLon*2 + (numLon + 2) * 2, displaySystem))
            {
               Vector3Df *pVertices = mesh.vertices, *pNormals = mesh.normals;
               int index;
               int lat, lon;

               PrimitiveGroup group;

               index = 0;
               for(lat = 1; lat < numLat-2; lat++)
               {
                  for(lon = 0; lon < numLon; lon++)
                  {
                     Angle theta, omega, cosOmega;

                     theta = lon * 2 * Pi / (numLon - 1);

                     omega = (lat + 1) * Pi / (numLat - 1) - Pi / 2;
                     cosOmega = cos(omega);
                     pVertices[index].x = (float) (sin(theta) * cosOmega);
                     pVertices[index].y = (float)  sin(omega);
                     pVertices[index].z = (float) (cos(theta) * cosOmega);
                     pNormals[index] = pVertices[index];
                     index ++;

                     omega = lat * Pi / (numLat - 1) - Pi / 2;
                     cosOmega = cos(omega);
                     pVertices[index].x = (float) (sin(theta) * cosOmega);
                     pVertices[index].y = (float)  sin(omega);
                     pVertices[index].z = (float) (cos(theta) * cosOmega);
                     pNormals[index] = pVertices[index];
                     index ++;
                  }

                  if((group = mesh.AddPrimitiveGroup({triStrip, true}, 0)))
                  {
                     group.first = (lat-1) * (numLon) * 2;
                     group.nVertices = (numLon) * 2;
                  }
               }

               // Create Polar Caps
               pVertices[index].x = 0;
               pVertices[index].y =-1;
               pVertices[index].z = 0;
               pNormals[index] = pVertices[index];

               index += numLon + 2;
               pVertices[index].x = 0;
               pVertices[index].y = 1;
               pVertices[index].z = 0;
               pNormals[index] = pVertices[index];

               for(lon = 0; lon <= numLon; lon++)
               {
                  Angle theta = (numLon - lon) * 2 * Pi / (numLon - 1);
                  Angle omega = 1 * Pi / (numLat - 1) - Pi / 2;
                  Angle cosOmega = cos(omega);

                  index = (numLat - 3) * ((numLon) * 2) + lon + 1;
                  pVertices[index].x = (float) (sin(theta) * cosOmega);
                  pVertices[index].y = (float)  sin(omega);
                  pVertices[index].z = (float) (cos(theta) * cosOmega);
                  pNormals[index] = pVertices[index];

                  omega = (numLat - 2) * Pi / (numLat - 1) - Pi / 2;
                  cosOmega = cos(omega);
                  index += numLon+2;

                  theta = lon * 2 * Pi / (numLon - 1);
                  pVertices[index].x = (float) (sin(theta) * cosOmega);
                  pVertices[index].y = (float)  sin(omega);
                  pVertices[index].z = (float) (cos(theta) * cosOmega);
                  pNormals[index] = pVertices[index];
               }

               if((group = mesh.AddPrimitiveGroup({ triFan, true }, 0)))
               {
                  group.first = (numLat - 3) * (numLon) * 2;
                  group.nVertices = numLon + 2;
               }

               if((group = mesh.AddPrimitiveGroup({ triFan, true }, 0)))
               {
                  group.first = (numLat - 3) * (numLon) * 2 + (numLon + 2);
                  group.nVertices = numLon + 2;
               }
               result = true;
            }
            mesh.Unlock(0);
            SetMinMaxRadius(true);
         }
      }
      return result;
   }
   property int numLat { set { numLat = value; } }
   property int numLon { set { numLon = value; } }
}
