public import "ecere"

public class CubeTris : Object
{
public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      if(this)
      {
         InitializeMesh(displaySystem);

         if(mesh)
         {
            if(mesh.Allocate({ vertices = true, texCoords1 = true }, 24, displaySystem))
            {
               Vector3Df vertices[24] =
               {
                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 },

                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 },

                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 }
               };
               Pointf texCoords[24] =
               {
                  { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
                  { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
                  { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
                  { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
                  { 0, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 },
                  { 0, 0 }, { 1, 0 }, { 1, 0 }, { 0, 0 }
               };
               uint16 indices[36] =
               {
                  // up, front, down, back, right, left
                  17,21,20, 17,20,16,
                  0,3,2,    0,2,1,
                  22,18,19, 22,19,23,
                  5,6,7,    5,7,4,
                  9,10,14,  9,14,13,
                  12,15,11, 12,11,8
               };

               int c;
               PrimitiveGroup group;

               CopyBytes(mesh.vertices, vertices, sizeof(vertices));
               CopyBytes(mesh.texCoords, texCoords, sizeof(texCoords));

               group = mesh.AddPrimitiveGroup(triangles, 36);
               if(group)
               {
                  memcpy(group.indices, indices, sizeof(indices));
                  mesh.UnlockPrimitiveGroup(group);
               }

               flags.computeLightVectors = true;
               mesh.ComputeNormals();
               result = true;
               mesh.Unlock(0);
            }
            SetMinMaxRadius(true);
         }
      }
      return result;
   }

   property Vector3Df size { set { size = value; } };

private:
   CubeTris()
   {
      size = { 1,1,1 };
   }

   Vector3Df size;
}
