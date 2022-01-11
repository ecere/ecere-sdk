namespace gfx3D::meshes;

/****************************************************************************
   ECERE Runtime Library

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   cube.ec - Translucent Cube 3D Model
****************************************************************************/
import "Display"
import "Object"   // TOFIX: If this is not here, Cube/Object gets registered as a 'class' rather than class 'struct'

public class Cube : Object
{
public:
   bool Create(const DisplaySystem displaySystem)
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
               uint16 indices[6][4] =
               {
                  // up, front, down, back, right, left
                  { 17,21,20,16 },
                  { 0,3,2,1 },
                  { 22,18,19,23 },
                  { 5,6,7,4 },
                  { 9,10,14,13 },
                  { 12,15,11,8 }
               };

               int c;

               CopyBytes(mesh.vertices, vertices, sizeof(vertices));
               CopyBytes(mesh.texCoords, texCoords, sizeof(texCoords));

               for(c = 0; c<6; c++)
               {
                  PrimitiveGroup group;
                  Material material;
                  char name[20];
                  /*
                  sprintf(name, "tex%d.bmp", c+1);
                  if(c == 3) strcpy(name, "glass.bmp");
                  */
                  sprintf(name, "Cube Face %d", c+1);
                  material = displaySystem ? displaySystem.AddNamedMaterial(name) : null;
                  if(material)
                  {
                     material.flags = { noFog = true, doubleSided = true, translucent = true };
                     material.opacity = 0.5f;
                     material.opacity = 1;
                     material.diffuse.r = material.diffuse.g = material.diffuse.b = 1;
                     material.ambient = material.diffuse;

                     /*
                     material.baseMap = display.GetTexture(, name);
                     if(!material.baseMap)
                     {
                        material.baseMap = Bitmap { };
                        material.baseMap.LoadMipMaps(name, null, displaySystem);
                        displaySystem.AddTexture(name, material.baseMap);
                     }*/
                  }
                  group = mesh.AddPrimitiveGroup(quads, 4);
                  // group = mesh.AddPrimitiveGroup(triFan, 4);
                  if(group)
                  {
                     CopyBytes(group.indices, indices[c], sizeof(indices[c]));
                     mesh.UnlockPrimitiveGroup(group);
                     group.material = material;
                  }
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
   Cube()
   {
      size = { 1,1,1 };
   }

   Vector3Df size;
}
