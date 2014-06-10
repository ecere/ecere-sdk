/****************************************************************************
   ECERE Runtime Library

   Copyright (c) 2001 Jerome Jacovella-St-Louis
   All Rights Reserved.

   dna.ec - DNA 3D Model
****************************************************************************/
public import "ecere"

bool CreateCylinder(Mesh mesh, int radius, int height, int steps, DisplaySystem displaySystem)
{
   bool result = false;
   if(mesh)
      if(mesh.Allocate({ vertices = true, normals = true, texCoords1 = true }, steps * 2, displaySystem))
      {
         PrimitiveGroup group = mesh.AddPrimitiveGroup({ triStrip, true }, 0);
         if(group)
         {
            int c;
            Vector3Df *pVertices, *pNormals;
            Pointf *pTexCoords;

            pVertices  = mesh.vertices;
            pNormals   = mesh.normals;
            pTexCoords = mesh.texCoords;

            group.first = 0;
            group.nVertices = steps * 2;

            for(c = 0; c<steps; c++)
            {
               int index;
               Radians theta = (2 * Pi * c) / (steps - 1);

               index = 2 * c + 1;
               pVertices[index].x = (float)sin(theta) * radius;
               pVertices[index].y = -height/2;
               pVertices[index].z = (float)cos(theta) * radius;

               pNormals[index].x = (float)sin(theta);
               pNormals[index].y = 0;
               pNormals[index].z = (float)cos(theta);

/*
               index = 2 * c + 1;
               pVertices[index].x = (float)cos(theta) * radius;
               pVertices[index].y = -height/2;
               pVertices[index].z = (float)sin(theta) * radius;

               pNormals[index].x = (float)cos(theta);
               pNormals[index].y = 0;
               pNormals[index].z = (float)sin(theta);
*/
               pTexCoords[index].x = ((float) c) / (steps - 1);
               pTexCoords[index].y = 1;


               index = 2 * c;
               pVertices[index].x = (float)sin(theta) * radius;
               pVertices[index].y = height/2;
               pVertices[index].z = (float)cos(theta) * radius;

               pNormals[index].x = (float)sin(theta);
               pNormals[index].y = 0;
               pNormals[index].z = (float)cos(theta);
/*
               index = 2 * c;
               pVertices[index].x = (float)cos(theta) * radius;
               pVertices[index].y = height/2;
               pVertices[index].z = (float)sin(theta) * radius;

               pNormals[index].x = (float)cos(theta);
               pNormals[index].y = 0;
               pNormals[index].z = (float)sin(theta);
*/
               pTexCoords[index].x = ((float) c) / (steps - 1);
               pTexCoords[index].y = 0;
            }
            result = true;
         }
         mesh.Unlock(0);
      }
   return result;
}


public class DNABox : Mesh
{
   int width, height, depth;
public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      if(Allocate({ vertices = true, texCoords1 = true }, 24, displaySystem))
      {
         PrimitiveGroup group;
         Vector3Df vertices[24] =
         {
            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 },

            { -(float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2,-(float)height/2,-(float)depth/2 },
            {  (float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2, (float)height/2,-(float)depth/2 },
            { -(float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2,-(float)height/2, (float)depth/2 },
            {  (float)width/2, (float)height/2, (float)depth/2 },
            { -(float)width/2, (float)height/2, (float)depth/2 }
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
            21,20,16, 17,21,16,
            3,2,1, 0,3,1,
            18,19,23, 22,18,23,
            6,7,4, 5,6,4,
            10,14,13, 9,10,13,
            15,11,8, 12,15,8
         };

         memcpy(this.vertices, vertices, sizeof(vertices));
         memcpy(this.texCoords, texCoords, sizeof(texCoords));

         group = AddPrimitiveGroup(triangles, 36);
         if(group)
         {
            memcpy(group.indices, indices, sizeof(indices));

            ComputeNormals();

            result = true;

            UnlockPrimitiveGroup(group);
         }
         Unlock(0);
      }
      return result;
   }
}

public class DNAHelix : Mesh
{
   int start;
   int height;
   float numCurves;
   int curveSegments;
   int radius;
   int width;

public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      PrimitiveGroup group;
      uint16 num = (uint16)(curveSegments*numCurves);
      int vertexCount = (num+1)*4;

      if(Allocate({ vertices = true, texCoords1 = true }, vertexCount, displaySystem))
      {
         uint16 v;
         Radians angle;
         int segment;
         uint16 startv;
         float x,y;
         int polygonCount = ((num*4)+2);

         //Define Vertices
         for(v=0, segment=0; segment<num+1; segment++)
         {
            angle=segment*2*Pi/curveSegments+start;
            x=(float)(cos(angle)*(radius-width/4));
            y=(float)(sin(angle)*(radius-width/4));

            texCoords[v].x = (float)segment / (num + 1) * 16;
            texCoords[v].y = 0;
            vertices[v++] = { -x,-(float)height/2+segment*(float)height/num, y };
            texCoords[v].x = (float)segment / (num + 1) * 16;
            texCoords[v].y = 0.25f;
            vertices[v++] = { -x,-(float)height/2+segment*(float)height/num+width, y };
         }
         startv=v;
         for(segment=0; segment<num+1; segment++)
         {
            angle=segment*2*Pi/curveSegments+start;
            x=(float)(cos(angle)*(radius+width/4));
            y=(float)(sin(angle)*(radius+width/4));

            texCoords[v].x = (float)segment / (num + 1) * 16;
            texCoords[v].y = 0.75f;
            vertices[v++] = { -x,-(float)height/2+segment*(float)height/num, y };
            texCoords[v].x = (float)segment / (num + 1) * 16;
            texCoords[v].y = 0.50f;
            vertices[v++] = { -x,-(float)height/2+segment*(float)height/num+width, y };
         }

         group = AddPrimitiveGroup(triangles, polygonCount * 6);
         if(group)
         {
            int index = 0;
            uint16 p;

            //Define Polygons
            for(p=0; p<num; p++)
            {
               group.indices[index++] = p*2+1;
               group.indices[index++] = p*2+3;
               group.indices[index++] = p*2+2;
               group.indices[index++] = p*2+2;
               group.indices[index++] = p*2;
               group.indices[index++] = p*2+1;

               group.indices[index++] = p*2+startv;
               group.indices[index++] = p*2+2+startv;
               group.indices[index++] = p*2+3+startv;
               group.indices[index++] = p*2+3+startv;
               group.indices[index++] = p*2+1+startv;
               group.indices[index++] = p*2+startv;

               group.indices[index++] = p*2+startv+1;
               group.indices[index++] = p*2+startv+3;
               group.indices[index++] = p*2+3;
               group.indices[index++] = p*2+3;
               group.indices[index++] = p*2+1;
               group.indices[index++] = p*2+startv+1;

               group.indices[index++] = p*2;
               group.indices[index++] = p*2+2;
               group.indices[index++] = p*2+startv+2;
               group.indices[index++] = p*2+startv+2;
               group.indices[index++] = p*2+startv;
               group.indices[index++] = p*2;
            }

            // Ends
            group.indices[index++] = startv;
            group.indices[index++] = startv+1;
            group.indices[index++] = 1;
            group.indices[index++] = 1;
            group.indices[index++] = 0;
            group.indices[index++] = startv;

            group.indices[index++] = 2*num;
            group.indices[index++] = 2*num+1;
            group.indices[index++] = 2*num+startv+1;
            group.indices[index++] = 2*num+startv+1;
            group.indices[index++] = 2*num+startv;
            group.indices[index++] = 2*num;

            ComputeNormals();
            result = true;

            UnlockPrimitiveGroup(group);
         }
         Unlock(0);
      }
      return result;
   }
}

static const char * names[7] = { "Adenine", "Cytosine", "Guanine", "Thymine", "Phosphate", "Desoxyribose", "Hydrogene" };

public class DNAModel : Object
{
   int numBases;
   int space;
   Degrees rotation;
   int helixCurveSegments;
   int helixWidth;
   int hydrogenWidth;
   int baseWidth;
   int baseHeight;
   int baseDepth;
   int desoxyriboseWidth;
   const char * textureFile;

public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      if(this)
      {
         InitializeMesh(displaySystem);

         if(mesh)
         {
            int c;
            Bitmap map { };
            Object phosphate, hydrogen;
            Material material;
            DNABox box { width = baseWidth, height = baseHeight, depth = baseDepth };
            // TOFX: Warning this didn't do what I expected: (Neither did a watch on 'rotation'!)
            //DNAHelix helix { start = 0, height = (numBases-1)*space, numCurves = (float)(numBases * rotation / 360), curveSegments = helixCurveSegments,
            DNAHelix helix { start = 0, height = (numBases-1)*space, numCurves = (float)(numBases * (double)rotation / 360), curveSegments = helixCurveSegments,
               radius = hydrogenWidth + baseWidth + desoxyriboseWidth, width = helixWidth };

            map.Load(textureFile ? textureFile : ":texture1.pcx", null, null);

            for(c = 0; c < 7; c++)
            {
               material = { name = CopyString(names[c]) };
               displaySystem.AddMaterial(material);
               if(material)
               {
                  material.diffuse = material.ambient = white;
                  material.opacity = 1;
                  if(map)
                  {
                     material.baseMap = displaySystem.GetTexture(names[c]);
                     if(!material.baseMap)
                     {
                        material.baseMap = Bitmap { };
                        material.baseMap.Allocate(null, 64, 64, 0, map.pixelFormat, true);
                        if(map.pixelFormat == pixelFormat8)
                           CopyBytesBy4(material.baseMap.palette, map.palette, 256);
                        material.baseMap.Grab(map, 0, c*material.baseMap.height);
                        material.baseMap.MakeMipMaps(displaySystem);
                        displaySystem.AddTexture(names[c], material.baseMap);
                     }
                  }
                  if(!strcmp(names[c], "Phosphate"))
                     material.flags.tile = true;
               }
            }
            if(map)
               delete map;

            //*******************  Base Meshes *******************
            box.Create(null);
            helix.Create(null);
            helix.ApplyMaterial(displaySystem.GetMaterial("Phosphate"));

            //*******************  PHOSPHATE     *******************
            phosphate = { mesh = helix }; AddName(phosphate, "Phosphate01");
            phosphate = { mesh = helix }; AddName(phosphate, "Phosphate02");
            phosphate.transform.orientation = Euler { yaw = 180 };

            //*******************  HYDROGENE     *******************
            hydrogen = { }; AddName(hydrogen, "Hydrogene");
            hydrogen.InitializeMesh(null);
            CreateCylinder(hydrogen.mesh, hydrogenWidth/2, numBases*space, 50, null);
            material = displaySystem.GetMaterial("Hydrogene");
            material.flags.doubleSided = true;
            hydrogen.mesh.ApplyMaterial(material);
            //******************************************************

            RandomSeed(0x1234);

            for(c=0; c<numBases; c++)
            {
               Object base, desoxyribose;
               char name[20];
               Vector3D pos;

               // Pick texture
               int b1 = GetRandom(0,3);
               int b2 = 3-b1;
               Quaternion angle { 1,0,0,0 };
               Vector3D position;
               Matrix matrix;

               // Change Rotation
               angle.Yaw(-rotation*c);
               matrix.RotationQuaternion(angle);

               position = { (baseWidth+hydrogenWidth)/2.0f,-numBases*space/2.0f+space/2.0f+c*space,0 };

               //*******************  BASES         *******************
               sprintf(name, "Base%02d", c*2);
               base = { }; AddName(base, name);
               base.flags = { mesh = true };
               base.mesh = box;
               base.transform.orientation = angle;
               base.transform.scaling = { 1,1,1 };
               base.matrix.Identity();
               pos.MultMatrix(position, matrix); base.transform.position = pos;
               base.UpdateTransform();
               base.material = displaySystem.GetMaterial(names[b1]);

               sprintf(name, "Base%02d", c*2+1);
               base = { }; AddName(base, name);
               base.flags = { mesh = true };
               base.mesh = box;
               base.transform.orientation = angle;
               base.transform.scaling = { 1,1,1 };
               base.matrix.Identity();
               position.x = -(baseWidth+hydrogenWidth)/2.0f;
               base.UpdateTransform();
               pos.MultMatrix(position, matrix); base.transform.position = pos;
               base.material = displaySystem.GetMaterial(names[b2]);

               //*******************  DESOXYRIBOSE  *******************
               sprintf(name, "Desoxyribose%02d", c*2);
               desoxyribose = { }; AddName(desoxyribose, name);
               desoxyribose.mesh = box;
               desoxyribose.transform.orientation = angle;
               desoxyribose.transform.scaling = { (float)desoxyriboseWidth / baseWidth, 1,1 };
               position.x = baseWidth+(desoxyriboseWidth+hydrogenWidth)/2.0f;
               pos.MultMatrix(position, matrix); desoxyribose.transform.position = pos;
               desoxyribose.material = displaySystem.GetMaterial("Desoxyribose");

               sprintf(name, "Desoxyribose%02d", c*2+1);
               desoxyribose = { }; AddName(desoxyribose, name);
               desoxyribose.mesh = box;
               desoxyribose.transform.orientation = angle;
               desoxyribose.transform.scaling = { (float)desoxyriboseWidth / baseWidth, 1,1 };
               position.x = -baseWidth-(desoxyriboseWidth+hydrogenWidth)/2.0f;
               pos.MultMatrix(position, matrix); desoxyribose.transform.position = pos;
               desoxyribose.material = displaySystem.GetMaterial("Desoxyribose");
            }
            transform.scaling = { 1,1,1 };
            transform.orientation = { 1, 0,0,0 };
            UpdateTransform();

            if(Merge(displaySystem))
               result = true;
            UpdateTransform();
            SetMinMaxRadius(true);

            delete box;
            delete helix;
         }
      }
      return result;
   }
}
