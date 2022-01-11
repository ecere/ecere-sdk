namespace gfx3D::meshes;

import "Display"
import "Object" // TOFIX: If this is not here, Cube/Object gets registered as a 'class' rather than class 'struct'

public class Sphere : Object
{
private:
   int numLat, numLon;
   float flattenedBody;
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
            int w = numLon;
            if(mesh.Allocate({ vertices = true, normals = true, texCoords1 = true, tangents = true }, (numLat+1) * w, displaySystem))
            {
               Vector3Df *pVertices = mesh.vertices, *pNormals = mesh.normals, *pTangents = mesh.tangents;
               Pointf *pTexCoords = mesh.texCoords;
               int index;
               int lat, lon;
               PrimitiveGroup group = mesh.AddPrimitiveGroup({triangles, false},  numLat * w * 6);

               index = 0;
               for(lat = 0; lat <= numLat; lat++)
               {
                  Angle omega = 0.0001 + lat * (Pi - 0.0002) / (numLat) - Pi / 2;
                  //Angle omega = lat * Pi / (numLat) - Pi / 2;
                  float rounded = flattenedBody * numLat;
                  double r = flattenedBody ? (lat < rounded ? (rounded-lat) / rounded : lat > numLat - rounded ? (lat - (numLat - rounded)) / rounded : 0) : 1;
                  double cosOmega = cos(omega) * r + 1 * (1-r);
                  double sinOmega = sin(omega);
                  for(lon = 0; lon < w; lon++)
                  {
                     Angle theta = lon == w-1 ? 0 : lon * 2 * Pi / (w-1);
                     double l = lon == w-1? lon - 0.0001 : lon;
                     pVertices[index] =
                     {
                        (float) (sin(theta) * cosOmega);
                        (float) sinOmega;
                        (float) (cos(theta) * cosOmega);
                     };

                     pNormals[index] = pVertices[index];

                     if(pTangents)
                     {
                        pTangents[index*2] =
                        {
                           (float) (sin(theta) * cos(omega - Pi/2));
                           (float) sin(omega - Pi/2);
                           (float) (cos(theta) * cos(omega - Pi/2));
                        };
                        pTangents[index*2+1] =
                        {
                           (float) (sin(theta - Pi/2) * cosOmega);
                           (float) sin(omega);
                           (float) (cos(theta - Pi/2) * cosOmega);
                        };
                     }

                     //pTangents[index*2 + 1].CrossProduct(pNormals[index], pTangents[index*2]);
                     pTexCoords[index] = { (float)l / (w-1), (float)lat / (numLat) };
                     index++;
                  }
               }

               for(index = 0; index < group.nIndices; index++)
                  group.indices[index] = 0;

               // Strips
               index = 0;

               for(lat = 1; lat <= numLat; lat++)
                  for(lon = 0; lon < w; lon++)
                  {
                     int n = (lon + 1) % w;
                     group.indices[index++] = (uint16)((lat-1) * w + lon);
                     group.indices[index++] = (uint16)((lat-1) * w + n);
                     group.indices[index++] = (uint16)((lat) * w + n);

                     group.indices[index++] = (uint16)((lat) * w + n);
                     group.indices[index++] = (uint16)((lat) * w + lon);
                     group.indices[index++] = (uint16)((lat-1) * w + lon);
                  }

               flags.computeLightVectors = true;
               mesh.UnlockPrimitiveGroup(group);
               result = true;

               //mesh.ComputeNormals();
            }

            mesh.Unlock(0);
            SetMinMaxRadius(true);
         }
      }
      return result;
   }

   property int numLat { set { numLat = value; } }
   property int numLon { set { numLon = value; } }
   property float flattenedBody { set { flattenedBody = value; } }
}
