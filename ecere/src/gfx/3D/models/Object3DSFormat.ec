namespace gfx3D::models;

import "Object"

#if !defined(_GLES)
#define USE_32_BIT_INDICES true
#define indicesMember indices32
#define uintindex uint32
#else
#define USE_32_BIT_INDICES false
#define indicesMember indices
#define uintindex uint16
#endif

#define MAXNAMELEN   64

// RGB Chunks
#define RGB_FLOAT             0x0010
#define RGB_BYTE              0x0011
#define RGB_BYTE_GAMMA        0x0012
#define RGB_FLOAT_GAMMA       0x0013

// Amount Of Chunks
#define AMOUNT_OF             0x0030

#define MAIN3DS               0x4D4D
#define EDIT3DS               0x3D3D
#define EDIT_AMBIENT          0x2100
#define EDIT_MATERIAL         0xAFFF
#define EDIT_OBJECT           0x4000
#define OBJ_HIDDEN            0x4010
#define OBJ_TRIMESH           0x4100
#define OBJ_LIGHT             0x4600
#define OBJ_CAMERA            0x4700

// Triangular Mesh Chunks
#define TRI_VERTEXL           0x4110
#define TRI_FACEL1            0x4120
#define TRI_MATERIAL          0x4130
#define TRI_MAPPINGCOORS      0x4140
#define TRI_SMOOTHING         0x4150
#define TRI_LOCAL             0x4160

// Light Chunks
#define LIT_SPOT              0x4610
#define LIT_ONOFF             0x4620
#define LIT_ATTENUATION       0x4625
#define LIT_START             0x4659
#define LIT_END               0x465A
#define LIT_MULTIPLIER        0x465B

// Camera Chunks
#define CAM_SEECONE           0x4710
#define CAM_RANGES            0x4720

// Material Chunks
#define MAT_NAME              0xA000
#define MAT_AMBIENT           0xA010
#define MAT_DIFFUSE           0xA020
#define MAT_SPECULAR          0xA030
#define MAT_SHININESS         0xA040
#define MAT_SHINSTRENGTH      0xA041
#define MAT_SHIN3PC           0xA042
#define MAT_TRANSPARENCY      0xA050
#define MAT_XPFALL            0xA052
#define MAT_REFBLUR           0xA053
#define MAT_SELFILLUM         0xA080
#define MAT_DOUBLESIDED       0xA081
#define MAT_ADDITIVE          0xA083
#define MAT_SELFILPCT         0xA084
#define MAT_WIRE              0xA085
#define MAT_SUPERSMP          0xA086
#define MAT_WIRETHICKNESS     0xA087
#define MAT_FACEMAP           0xA088
#define MAT_XPFALLIN          0xA08A
#define MAT_PHONG             0xA08C
#define MAT_WIREABS           0xA08E
#define MAT_SHADING           0xA100
#define MAT_MAPTEXTURE1       0xA200
#define MAT_SPECULARMAP       0xA204
#define MAT_MAPOPACITY        0xA210
#define MAT_REFLECTIONMAP     0xA220
#define MAT_BUMPMAP           0xA230

// Map Chunks
#define MAP_FILENAME          0xA300

#define MAT_SHININESSMAP      0xA33C
#define MAT_EMISSIVEMAP       0xA33D
#define MAP_OPTIONS           0xA351
#define MAP_1_U_SCALE   0xA354
#define MAP_1_V_SCALE   0xA356
#define MAP_U_OFFSET    0xA358
#define MAP_V_OFFSET    0xA35A
#define MAP_ROTATION    0xA35C

#define MAP_OPTIONS_DECAL           0x0001      // (related to MAP_OPTIONS_DONTTILE)
#define MAP_OPTIONS_MIRROR          0x0002
#define MAP_OPTIONS_NEGATIVE        0x0008
#define MAP_OPTIONS_DONTTILE        0x0010
#define MAP_OPTIONS_SUMMEDFILTERING 0x0020
#define MAP_OPTIONS_USEALPHA        0x0040
#define MAP_OPTIONS_LUMORALPHATINT  0x0080
#define MAP_OPTIONS_IGNOREALPHA     0x0100
#define MAP_OPTIONS_RGBTINT         0x0200

#define MAP_FILTERBLUR        0xA353
#define MAP_1_U_SCALE         0xA354
#define MAP_1_V_SCALE         0xA356
#define MAP_U_OFFSET          0xA358
#define MAP_V_OFFSET          0xA35A
#define MAP_ROTATION          0xA35C

#define MAP_LUMTINT1          0xA360
#define MAP_LUMTINT2          0xA362

#define MAP_TINTR             0xA364
#define MAP_TINTG             0xA366
#define MAP_TINTB             0xA368

// Keyframer Chunks
#define KEYFRAME3DS           0xB000
#define FRM_AMBIENT           0xB001
#define FRM_MESHINFO          0xB002
#define FRM_CAMERA            0xB003
#define FRM_CAMERATARGET      0xB004
#define FRM_OMNILIGHT         0xB005
#define FRM_SPOTLIGHTTARGET   0xB006
#define FRM_SPOTLIGHT         0xB007
#define FRM_FRAMES            0xB008
#define FRM_PARAM             0xB010
#define FRM_DUMMYNAME         0xB011
#define FRM_PIVOT             0xB013
#define FRM_TRACKPOS          0xB020
#define FRM_TRACKROT          0xB021
#define FRM_TRACKSCALE        0xB022
#define FRM_TRACKFOV          0xB023
#define FRM_TRACKROLL         0xB024
#define FRM_TRACKCOLOR        0xB025
#define FRM_TRACKMORPH        0xB026   // What does this do?
#define FRM_TRACKHOTSPOT      0xB027
#define FRM_TRACKFALLOFF      0xB028
#define FRM_TRACKHIDE         0xB029
#define FRM_HIERARCHY         0xB030

typedef struct FileInfo FileInfo;

typedef struct
{
   uint indices[3];
   uint origIndices[3];
   uint smoothGroups;
   Material material;
   Vector3Df normal;
   bool done:1;
} Face;

struct FileInfo
{
   File f;
   DisplaySystem displaySystem;
   Object rootObject;
   const String fileName;

   uint16 chunkId;
   uint pos, end;

   FileInfo * parent;
   int nFaces;
   Face * faces;
   char textureDirectory[MAX_DIRECTORY];
   Map<uintptr, Array<int>> matFaces;
};

#define SWAP_WORD(word) (((unsigned short)(word) & 0x00ff) << 8) \
                      | (((unsigned short)(word) & 0xff00) >> 8)

#define SWAP_DWORD(dword) ((((unsigned int)(dword) & 0x000000ff) << 24) \
                         | (((unsigned int)(dword) & 0x0000ff00) <<  8) \
                         | (((unsigned int)(dword) & 0x00ff0000) >>  8) \
                         | (((unsigned int)(dword) & 0xff000000) >> 24))

#ifndef __BIG_ENDIAN__
#define BIGENDSWAP_WORD(word)
#define BIGENDSWAP_DWORD(dword)
#else
#define BIGENDSWAP_WORD(word)      (*(uint16 *)(&(word)))  = SWAP_WORD((*(uint16 *)(&(word))));
#define BIGENDSWAP_DWORD(dword)    (*(uint *)(&(dword))) = SWAP_DWORD((*(uint *)(&(dword))));
#endif

// Zero Terminated String
static int ReadASCIIZ(File f, char ** string)
{
   // *** Read String ***
   int c;
   char temp[1024] = "";
   for(c=0; c<1024;)
   {
      f.Getc(&temp[c]);
      if(!temp[c++]) break;
   }
   *string = new char[c];
   if(*string)
      strcpy(*string, temp);
   return c;
}

static float ReadFloat(File f)
{
   float floatValue;
   f.Read(&floatValue, sizeof(float), 1);
   BIGENDSWAP_DWORD(floatValue);
   return floatValue;
}

static uint16 ReadWORD(File f)
{
   uint16 wordValue;
   f.Read(&wordValue, sizeof(uint16), 1);
   BIGENDSWAP_WORD(wordValue);
   return wordValue;
}

static uint ReadDWORD(File f)
{
   uint dwordValue;
   f.Read(&dwordValue, sizeof(uint), 1);
   BIGENDSWAP_DWORD(dwordValue);
   return dwordValue;
}

// Sub Chunks
static bool ReadChunks(bool (* chunkParser)(FileInfo * info, void * data), FileInfo * info, void * data)
{
   for(;info->pos < info->end;)
   {
      FileInfo childInfo = *info;
      uint length;

      childInfo.parent = info;

      info->f.Seek(info->pos, start);
      childInfo.chunkId = ReadWORD(info->f);
      length = ReadDWORD(info->f);

      childInfo.pos += sizeof(uint16) + sizeof(uint);
      childInfo.end = info->pos + length;

      if(!chunkParser(&childInfo, data))
         return false;

      info->pos = childInfo.end;
   }
   return true;
}

// General Chunks
static bool ReadRGB(FileInfo * info, ColorRGB * rgb)
{
   if(info->chunkId == RGB_BYTE || info->chunkId == RGB_BYTE_GAMMA)
   {
      byte value;
      info->f.Getc((char *)&value); rgb->r = value / 255.0f;
      info->f.Getc((char *)&value); rgb->g = value / 255.0f;
      info->f.Getc((char *)&value); rgb->b = value / 255.0f;
   }
   else if(info->chunkId == RGB_FLOAT || info->chunkId == RGB_FLOAT_GAMMA)
   {
      rgb->r = ReadFloat(info->f);
      rgb->g = ReadFloat(info->f);
      rgb->b = ReadFloat(info->f);
   }
   return true;
}

static bool Read3DVertex(File f, Vector3Df vertex)
{
   vertex.x = ReadFloat(f);
   vertex.y = ReadFloat(f);
   vertex.z = ReadFloat(f);
   return true;
}

static bool ReadAmountOf(FileInfo * info, uint16 * amountOf)
{
   if(info->chunkId == AMOUNT_OF)
      *amountOf = ReadWORD(info->f);
   return true;
}

#define WELD_TRESHOLD        0.000001
#define SMOOTH_CUTOFF   0  // 45

struct SharedSourceVertexInfo
{
   int index;
   Vector3Df value;
   uint unique;
   Face * face;

   int OnCompare(SharedSourceVertexInfo b)
   {
      if(unique < b.unique) return -1;
      if(unique > b.unique) return 1;

      if(unique)
      {
         if(face < b.face) return -1;
         if(face > b.face) return 1;
      }
      if(index == b.index) return 0;
      if(WELD_TRESHOLD)
      {
         if(value.x < b.value.x - WELD_TRESHOLD) return -1;
         if(value.x > b.value.x + WELD_TRESHOLD) return 1;
         if(value.y < b.value.y - WELD_TRESHOLD) return -1;
         if(value.y > b.value.y + WELD_TRESHOLD) return 1;
         if(value.z < b.value.z - WELD_TRESHOLD) return -1;
         if(value.z > b.value.z + WELD_TRESHOLD) return 1;
      }
      else
      {
         if(index < b.index) return -1;
         if(index > b.index) return 1;
      }
      return 0;
   }
};

class SharedDestVertexInfo
{
   Array<int> faces { };
};

struct SourceVertexInfo
{
   SharedSourceVertexInfo * shared;
   Pointf texCoord;
   uint smoothGroups;

   int OnCompare(SourceVertexInfo b)
   {
      int r = (*shared).OnCompare(*b.shared);
      if(!r) r = texCoord.OnCompare(b.texCoord);
      if(!r) r = smoothGroups.OnCompare(b.smoothGroups);
      return r;
   }
};

class DestVertexInfo
{
   int index, copyFromIndex;
   Vector3Df normal;
};

static void ComputeNormals(Mesh mesh, FileInfo * info, Object object)
{
   int c;
   Face * faces = info->faces;
   int nVertices = mesh.nVertices;
   int index;
   int nNewVertices;
   Vector3Df * mVertices;
   double cutOff = cos(Degrees { SMOOTH_CUTOFF });

   Map<SharedSourceVertexInfo, SharedDestVertexInfo> sharedVertices { };
   Map<SourceVertexInfo, DestVertexInfo> vertexMap { };
   Array<MapNode<SourceVertexInfo, DestVertexInfo>> vertices { size = nVertices };

   MapIterator<SharedSourceVertexInfo, SharedDestVertexInfo> itShared { map = sharedVertices };
   MapIterator<SourceVertexInfo, DestVertexInfo> it { map = vertexMap };

   nNewVertices = nVertices;
   mVertices = mesh->vertices;

   for(c = 0; c<info->nFaces; c++)
   {
      Face * face = &faces[c];
      Plane plane;
      plane.FromPointsf(mesh.vertices[face->indices[2]],
                        mesh.vertices[face->indices[1]],
                        mesh.vertices[face->indices[0]]);
      face->normal = { (float)plane.normal.x, (float)plane.normal.y, (float)plane.normal.z };
   }

   for(c = 0; c < info->nFaces; c++)
   {
      Face * face = &faces[c];
      int i;

      // Zero space points
      if(!mVertices[face->indices[0]].OnCompare(mVertices[face->indices[1]]) &&
         !mVertices[face->indices[0]].OnCompare(mVertices[face->indices[2]]))
         continue;

      for(i = 0; i<3; i++)
      {
         SharedSourceVertexInfo * source;
         SharedDestVertexInfo svInfo;
         DestVertexInfo vInfo;

         index = face->indices[i];

         if(face->smoothGroups)
            itShared.Index({ index = index, mVertices[index], face = face }, true);
         else
            itShared.Index({ index = index, { }, unique = index + 1, face = face }, true);
         svInfo = itShared.data;
         if(!svInfo) itShared.data = svInfo = { };
         svInfo.faces.Add(c);

         source = (SharedSourceVertexInfo *)&(((AVLNode)itShared.pointer).key);
         // TODO: Allow obtaining address of MapIterator::key
         // it.Index({ &itShared.key, mesh->texCoords[index] }, true);
         it.Index({ source, mesh->texCoords ? mesh->texCoords[index] : { }, face->smoothGroups }, true);
         vInfo = it.data;
         if(!vInfo)
         {
            vInfo = { };
            it.data = vInfo;
            vInfo.copyFromIndex = index;
            vInfo.index = index;
         }

         if(!vertices[index])
            vertices[index] = (void *)it.pointer;
         else if(vertices[index] != it.pointer)
         {
            // If it's a different smoothing group, we'll need extra vertices
            index = vertices.size;
            vInfo.index = index;
            vertices.Add((void *)it.pointer);
            nNewVertices++;
         }
         face->indices[i] = vInfo.index;
      }
   }

   for(index = 0; index < nNewVertices; index++)
   {
      int numShared = 0;
      it.pointer = vertices[index];
      if(it.pointer)
      {
         DestVertexInfo vInfo = it.data;
         Vector3Df normal { };
         SourceVertexInfo * inf = (SourceVertexInfo *)&(((AVLNode)it.pointer).key);
         uint smoothing = inf->smoothGroups;
         bool added = true;
         SharedSourceVertexInfo * shared = inf->shared;
         SharedDestVertexInfo svInfo = sharedVertices[*shared];
         int origIndex;
         if(!svInfo || vInfo.index != index)
            continue;

         for(i : svInfo.faces)
         {
            Face * face = &info->faces[i];
            face->done = false;
            if(smoothing & face->smoothGroups)
               smoothing |= face->smoothGroups;
         }

         // Optional code to compensate auto-welding with a limit angle cutoff between faces of same smoothing group
         if(SMOOTH_CUTOFF && WELD_TRESHOLD)
         {
            for(i : svInfo.faces)
            {
               Face * face = &info->faces[i];
               if((smoothing & face->smoothGroups) || (!smoothing && !face->smoothGroups))
               {
                  int j;
                  for(j = 0; j < 3; j++)
                  {
                     if(face->indices[j] == vInfo.index)
                     {
                        origIndex = face->origIndices[j];
                        face->done = true;
                        normal.x += face->normal.x;
                        normal.y += face->normal.y;
                        normal.z += face->normal.z;
                        numShared++;
                        break;
                     }
                  }
               }
               if(numShared) break;
            }
         }

         while(added)
         {
            added = false;
            for(i : svInfo.faces)
            {
               Face * face = &info->faces[i];
               if(!face->done && ((smoothing & face->smoothGroups) || (!smoothing && !face->smoothGroups)))
               {
                  bool valid = true;

                  if(SMOOTH_CUTOFF && WELD_TRESHOLD)
                  {
                     int origIndexB = -1;
                     int k;

                     for(k = 0; k < 3; k++)
                     {
                        if(face->indices[k] == vInfo.index)
                        {
                           origIndexB = face->origIndices[k];
                           break;
                        }
                     }
                     valid = origIndex == origIndexB;
                     if(!valid)
                     {
                        for(j : svInfo.faces)
                        {
                           if(info->faces[j].done)
                           {
                              double dot = info->faces[j].normal.DotProduct(face->normal);
                              if(dot > 1) dot = 1; else if(dot < -1) dot = -1;
                              valid = fabs(dot) > cutOff;
                              if(valid) break;
                           }
                        }
                     }
                  }

                  if(valid)
                  {
                     normal.x += face->normal.x;
                     normal.y += face->normal.y;
                     normal.z += face->normal.z;
                     numShared++;
                     added = true;
                     face->done = true;
                  }
               }
            }
            if(!SMOOTH_CUTOFF || !WELD_TRESHOLD) break;
         }
         normal.Scale(normal, 1.0f / numShared);
         if(vInfo.index == index)
            vInfo.normal.Normalize(normal);

         // Auto welding/smoothing requires extra vertices because angle is too steep
         if(SMOOTH_CUTOFF && WELD_TRESHOLD)
         {
            SharedDestVertexInfo newSharedInfo = null;
            int index;
            for(i : svInfo.faces)
            {
               Face * face = &info->faces[i];
               if(!face->done && ((smoothing & face->smoothGroups) || (!smoothing && !face->smoothGroups)))
               {
                  int j;
                  for(j = 0; j < 3; j++)
                  {
                     if(face->indices[j] == vInfo.index)
                     {
                        if(!newSharedInfo)
                        {
                           DestVertexInfo newVert;
                           SharedSourceVertexInfo * source;

                           index = nNewVertices++;
                           itShared.Index({ index = index, { }, unique = index + 1, face = face }, true);
                           source = (SharedSourceVertexInfo *)&(((AVLNode)itShared.pointer).key);
                           itShared.data = newSharedInfo = { };

                           it.Index({ source, mesh->texCoords ? mesh->texCoords[vInfo.copyFromIndex] : { }, face->smoothGroups }, true);
                           newVert = { };
                           it.data = newVert;
                           newVert.copyFromIndex = vInfo.copyFromIndex;
                           newVert.index = index;

                           vertices.Add((void *)it.pointer);
                        }
                        face->indices[j] = index;
                        newSharedInfo.faces.Add(i);
                        break;
                     }
                  }
               }
            }
         }
      }
   }

   // Allocate some extra vertices
   {
      Vector3Df * oldVertices = mesh.vertices;
      Pointf * oldTexCoords = mesh.texCoords;

      // TODO: Support reallocation?
      *((void **)&mesh.vertices) = null;
      *((void **)&mesh.texCoords) = null;
      *((int *)&mesh.nVertices) = 0;

      mesh.Allocate( { vertices = true, normals = true, texCoords1 = oldTexCoords ? true : false }, nNewVertices, info->displaySystem);

      // Fill in the new vertices
      for(index = 0; index < nNewVertices; index++)
      {
         DestVertexInfo vInfo;
         it.pointer = vertices[index];
         vInfo = it.data;

         // Duplicate vertex
         mesh.normals[index] = vInfo ? vInfo.normal : { };
         mesh.vertices[index] = oldVertices[vInfo ? vInfo.copyFromIndex : index];
         if(mesh.texCoords)
            mesh.texCoords[index] = oldTexCoords[vInfo ? vInfo.copyFromIndex : index];
      }

      delete oldVertices;
      delete oldTexCoords;
   }

   {
      int i;
      for(i = 0; i < info->nFaces; i++)
         info->faces[i].done = false;
   }

   mesh.Unlock({ normals = true });

   // Free all the temporary stuff

   delete vertices;
   vertexMap.Free();
   delete vertexMap;
   sharedVertices.Free();
   delete sharedVertices;
}

// Meshes
static bool ReadSmoothing(FileInfo * info, Object object)
{
   switch(info->chunkId)
   {
      case TRI_SMOOTHING:
      {
         int c;
         for(c = 0; c<info->nFaces; c++)
            info->faces[c].smoothGroups = ReadDWORD(info->f);
         break;
      }
   }
   return true;
}

static bool ReadFacesListChunks(FileInfo * info, Object object)
{
   DisplaySystem displaySystem = info->displaySystem;
   switch(info->chunkId)
   {
      case TRI_MATERIAL:
      {
         char * name;
         Material mat;
         int i, c;
         int count;
         Array<int> faces;
         char matName[MAX_LOCATION + 100];

         strcpy(matName, info->fileName);
         ReadASCIIZ(info->f, &name);
         count = ReadWORD(info->f);
         strcat(matName, name);

         mat = displaySystem.GetMaterial(matName);
         faces = info->matFaces[(uintptr)mat];
         if(!faces)
            info->matFaces[(uintptr)mat] = faces = { };
         i = faces.size;
         faces.size += count;

         for(c = 0; c<count; c++)
         {
            uint16 face = ReadWORD(info->f);
            faces[i + c] = face;
            info->faces[face].material = mat;
         }
         delete name;
         break;
      }
   }
   return true;
}

static bool ReadTriMesh(FileInfo * info, Object object)
{
   Mesh mesh = object.mesh;
   switch(info->chunkId)
   {
      case TRI_VERTEXL:
      {
         int c;
         uint16 nVertices = ReadWORD(info->f);
         //if(eMesh_Allocate(mesh, MESH_VERTICES, nVertices, info->display->displaySystem))
         *((int *) &mesh.nVertices) = nVertices;
         *((Vector3Df **)&mesh.vertices) = new Vector3Df[mesh.nVertices];
         if(mesh.vertices)
         {
            for(c = 0; c<mesh.nVertices; c++)
            {
               Vector3Df vertex;
               Read3DVertex(info->f, vertex);
               mesh.vertices[c].x = vertex.x;
               mesh.vertices[c].y =-vertex.z;
               mesh.vertices[c].z = vertex.y;
            }
         }
         else
            return false;
         break;
      }
      case TRI_MAPPINGCOORS:
      {
         int c;
         uint16 count = ReadWORD(info->f);
         count = (uint16)Min(mesh.nVertices, count);

         //if(eMesh_Allocate(mesh, MESH_TEXCOORDS1, mesh.nVertices, null /*info->display->displaySystem*/))
         *((Pointf **)&mesh.texCoords) = new Pointf[mesh.nVertices];
         mesh.flags.texCoords1 = true;
         if(mesh.texCoords)
         {
            for(c = 0; c<count; c++)
            {
               mesh.texCoords[c].x = ReadFloat(info->f);
               mesh.texCoords[c].y = 1.0f - ReadFloat(info->f);
            }
         }
         else
            return false;
         break;
      }
      case TRI_FACEL1:
      {
         int c;
         uint16 nFaces = 0;
         uint count;
         uint pos;

         info->nFaces = nFaces = ReadWORD(info->f);
         info->pos += sizeof(uint16);

         info->faces = new0 Face[nFaces];
         for(c = 0; c<nFaces; c++)
         {
            int i;
            for(i = 0; i<3; i++)
               info->faces[c].origIndices[i] =
               info->faces[c].indices[i] = ReadWORD(info->f);
            ReadWORD(info->f);
            info->pos += 4*sizeof(uint16);
         }
         pos = info->pos;
         ReadChunks(ReadSmoothing, info, object);
         info->pos = pos;

         if(info->matFaces)
            info->matFaces.Free();
         info->matFaces = { };

         ReadChunks(ReadFacesListChunks, info, object);

         ComputeNormals(mesh, info, object);

         // Create Groups
         for(m : info->matFaces)
         {
            Material mat = (Material)&m;
            Array<int> faces = m;
            if(mat.flags.translucent)
            {
               mesh.primitives = renew mesh.primitives PrimitiveSingle[mesh.nPrimitives + faces.count];
               for(i : faces)
               {
                  Face * face = &info->faces[i];
                  PrimitiveSingle * triangle;

                  triangle = &mesh.primitives[mesh.nPrimitives++];
                  if(mesh.AllocatePrimitive(triangle, { triangles, indices32bit = USE_32_BIT_INDICES }, 3))
                  {
                     triangle->indicesMember[0] = (uintindex)face->indices[0];
                     triangle->indicesMember[1] = (uintindex)face->indices[1];
                     triangle->indicesMember[2] = (uintindex)face->indices[2];
                     triangle->middle.Add(mesh.vertices[triangle->indicesMember[0]], mesh.vertices[triangle->indicesMember[1]]);
                     triangle->middle.Add(triangle->middle, mesh.vertices[triangle->indicesMember[2]]);
                     triangle->plane.FromPointsf(
                        mesh.vertices[triangle->indicesMember[2]],
                        mesh.vertices[triangle->indicesMember[1]],
                        mesh.vertices[triangle->indicesMember[0]]);

                     mesh.UnlockPrimitive(triangle);
                  }
                  triangle->middle.x /= 3;
                  triangle->middle.y /= 3;
                  triangle->middle.z /= 3;

                  triangle->material = mat;

                  face->done = true;
                  object.flags.translucent = true;
               }
            }
            else
            {
               PrimitiveGroup group = mesh.AddPrimitiveGroup({ triangles, indices32bit = USE_32_BIT_INDICES }, faces.count * 3);
               if(group)
               {
                  c = 0;
                  group.material = mat;
                  for(i : faces)
                  {
                     Face * face = &info->faces[i];

                     if(object.flags.flipWindings)
                     {
                        group.indicesMember[c*3]   = (uintindex)face->indices[2];
                        group.indicesMember[c*3+1] = (uintindex)face->indices[1];
                        group.indicesMember[c*3+2] = (uintindex)face->indices[0];
                     }
                     else
                     {
                        group.indicesMember[c*3]   = (uintindex)face->indices[0];
                        group.indicesMember[c*3+1] = (uintindex)face->indices[1];
                        group.indicesMember[c*3+2] = (uintindex)face->indices[2];
                     }
                     face->done = true;
                     c++;
                  }
                  mesh.UnlockPrimitiveGroup(group);
               }
            }
         }

         // Add faces without a material all together
         count = 0;
         for(c = 0; c<nFaces; c++)
            if(!info->faces[c].done)
               count++;
         if(count)
         {
            PrimitiveGroup group = mesh.AddPrimitiveGroup({ triangles, indices32bit = USE_32_BIT_INDICES }, count * 3);
            if(group)
            {
               for(c = 0; c<nFaces; c++)
               {
                  Face * face = &info->faces[c];
                  if(!face->done)
                  {
                     group.indicesMember[c*3]   = (uintindex)face->indices[0];
                     group.indicesMember[c*3+1] = (uintindex)face->indices[1];
                     group.indicesMember[c*3+2] = (uintindex)face->indices[2];
                  }
               }
               mesh.UnlockPrimitiveGroup(group);
            }
         }

         delete info->faces;
         if(info->matFaces)
         {
            info->matFaces.Free();
            delete info->matFaces;
         }
         break;
      }
      case TRI_LOCAL:
      {
         int c;
         Vector3Df xAxis, yAxis, zAxis, center;
         Vector3Df scaling;
         Vector3Df orth;
         Matrix inverse/*, source = { 0 }*/;

         // Local Axes
         Read3DVertex(info->f, xAxis);
         Read3DVertex(info->f, yAxis);
         Read3DVertex(info->f, zAxis);
         Read3DVertex(info->f, center);

         scaling.x = (float)sqrt(xAxis.x * xAxis.x + xAxis.y * xAxis.y + xAxis.z * xAxis.z);
         scaling.y = (float)sqrt(zAxis.x * zAxis.x + zAxis.y * zAxis.y + zAxis.z * zAxis.z);
         scaling.z = (float)sqrt(yAxis.x * yAxis.x + yAxis.y * yAxis.y + yAxis.z * yAxis.z);

         // Inverse of this doesn't give a good enough result with small numbers (bellrang.3ds)
/*
         source.m[3][3] = 1;
         source.m[0][0] = xAxis.x; source.m[0][1]  = -xAxis.z;  source.m[0][2] = xAxis.y;
         source.m[1][0] =-zAxis.x; source.m[1][1]  = zAxis.z;  source.m[1][2] = -zAxis.y;
         source.m[2][0] = yAxis.x; source.m[2][1]  = -yAxis.z;  source.m[2][2] = yAxis.y;
         source.m[3][0] = center.x; source.m[3][1] = -center.z; source.m[3][2] = center.y;

         inverse.Inverse(source);
*/

         object.flags.flipWindings = false;

         xAxis.Normalize(xAxis);
         yAxis.Normalize(yAxis);
         zAxis.Normalize(zAxis);

         orth.CrossProduct(yAxis, zAxis);
         if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(xAxis.x)) ||
            (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(xAxis.y)) ||
            (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(xAxis.z)))
         {
            object.flags.flipWindings ^= true;
            xAxis = orth;
         }

         orth.CrossProduct(zAxis, xAxis);
         if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(yAxis.x)) ||
            (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(yAxis.y)) ||
            (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(yAxis.z)))
         {
            object.flags.flipWindings ^= true;
            yAxis = orth;
         }

         orth.CrossProduct(xAxis, yAxis);
         if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(zAxis.x)) ||
            (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(zAxis.y)) ||
            (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(zAxis.z)))
         {
            object.flags.flipWindings ^= true;
            zAxis = orth;
         }

         {
            Matrix rotation;

            rotation.m[0][0] = xAxis.x;
            rotation.m[0][1] =-xAxis.z;
            rotation.m[0][2] = xAxis.y;
            rotation.m[0][3] = 0;
            rotation.m[1][0] =-zAxis.x;
            rotation.m[1][1] = zAxis.z;
            rotation.m[1][2] =-zAxis.y;
            rotation.m[1][3] = 0;
            rotation.m[2][0] = yAxis.x;
            rotation.m[2][1] =-yAxis.z;
            rotation.m[2][2] = yAxis.y;
            rotation.m[2][3] = 0;
            rotation.m[3][0] = 0;
            rotation.m[3][1] = 0;
            rotation.m[3][2] = 0;
            rotation.m[3][3] = 1;

            {
               Matrix temp, temp2;
               inverse.Transpose(rotation);
               temp.Identity();
               temp.Translate(-center.x, center.z, -center.y);
               temp2.Multiply(temp, inverse);
               temp2.Scale(1.0f/scaling.x, 1.0f/scaling.y, 1.0f/scaling.z);
               inverse = temp2;
            }

            object.transform.scaling = scaling;
            // TODO: Improve language to support deep properties on non constant functions
            // object.transform.orientation.RotationMatrix(rotation);
            {
               Quaternion orientation;
               orientation.RotationMatrix(rotation);
               object.transform.orientation = orientation;
            }
            object.transform.position = { center.x, -center.z, center.y };
         }

         // Localize All Vertices
         for(c = 0; c<mesh.nVertices; c++)
         {
            Vector3Df vertex = mesh.vertices[c];

            mesh.vertices[c].MultMatrix(vertex, inverse);

            mesh.vertices[c].x -= object.pivot.x;
            mesh.vertices[c].y -= object.pivot.y;
            mesh.vertices[c].z -= object.pivot.z;
         }
         break;
      }
   }
   return true;
}

// Material Library
static bool ReadMap(FileInfo * info, Material mat)
{
   DisplaySystem displaySystem = info->displaySystem;
   switch(info->chunkId)
   {
      case MAP_FILENAME:
      {
         char * name;
         char location[MAX_LOCATION];

         ReadASCIIZ(info->f, &name);

         strcpy(location, info->textureDirectory);
         PathCat(location, name);
         if(!FileExists(location))
         {
            // Attempt all lowercase if original case does not exist
            strlwr(name);
            strcpy(location, info->textureDirectory);
            PathCat(location, name);
         }

         if(info->parent->chunkId == MAT_BUMPMAP)
         {
            // To avoid messing up the diffuse texture if same bitmap is specified by mistake...
            char bumpName[MAX_LOCATION+5];
            strcpy(bumpName, "BUMP:");
            strcat(bumpName, location);
            if(!mat.bumpMap)
            {
               mat.bumpMap = displaySystem.GetTexture(bumpName);
               if(!mat.bumpMap)
               {
                  mat.bumpMap = Bitmap { };
                  if(!mat.bumpMap.Load(location, null, null) ||
                     !mat.bumpMap.Convert(null, pixelFormat888, null) ||
                     !displaySystem.AddTexture(bumpName, mat.bumpMap))
                     delete mat.bumpMap;
                  if(mat.bumpMap)
                  {
                     ColorAlpha * picture = (ColorAlpha *)mat.bumpMap.picture;
                     int bw = mat.bumpMap.width, bh = mat.bumpMap.height;
                     int y, x;

                     for(y = 0; y < bh; y++)
                        for(x = 0; x < bw; x++)
                        {
                           uint bc = y * bw + x;
                           Color color = picture[bc].color;
                           picture[bc] = { 255, { color.r, 255 - color.b, color.g } };
                        }
                  }
               }
            }
         }
         else
         {
            Bitmap opacityMap = null;
            bool alphaOnly = true;
            bool translucent = false;
            if(!mat.baseMap)
            {
               mat.baseMap = displaySystem.GetTexture(location);
               if(!mat.baseMap)
               {
                  mat.baseMap = Bitmap { };
                  if(!mat.baseMap.Load(location, null, null) ||
                     !mat.baseMap.Convert(null, pixelFormat888, null) ||
                     !displaySystem.AddTexture(location, mat.baseMap))
                  {
                     delete mat.baseMap;
                  }
                  opacityMap = mat.baseMap;
               }
            }
            else if(info->parent->chunkId == MAT_MAPOPACITY)
            {
               opacityMap = Bitmap { };
               if(opacityMap.Load(location, null, null))
               {
                  if(opacityMap.pixelFormat == pixelFormatRGBA)
                     alphaOnly = false;
                  if(!opacityMap.Convert(null, pixelFormat888, null))
                     delete opacityMap;
               }
            }

            if(mat.baseMap)
            {
               if(!mat.baseMap.displaySystem && info->parent->chunkId == MAT_MAPOPACITY && opacityMap && opacityMap.width && opacityMap.height)
               {
                  ColorAlpha * picture = (ColorAlpha *)mat.baseMap.picture;
                  ColorAlpha * opacityPicture = (ColorAlpha *)opacityMap.picture;
                  uint x, y;
                  int ow = opacityMap.width, oh = opacityMap.height;
                  int bw = mat.baseMap.width, bh = mat.baseMap.height;

                  for(y = 0; y < bh; y++)
                     for(x = 0; x < bw; x++)
                     {
                        int bc = ((y % bh) * bw + (x % bw));
                        int oc = ((y % oh) * bw + (x % ow));
                        byte alpha = alphaOnly ? opacityPicture[oc].color.r : opacityPicture[oc].a;
                        if(alpha && alpha < 255)
                           translucent = true;
                        picture[bc] = ColorAlpha { alpha, picture[bc].color };
                     }
               }
               if(translucent)
                  mat.flags.translucent = true;
               mat.diffuse.r = mat.diffuse.g = mat.diffuse.b =
               mat.ambient.r = mat.ambient.g = mat.ambient.b = 1.0f;
            }
            if(opacityMap != mat.baseMap)
               delete opacityMap;
         }
         delete name;
         break;
      }
      case MAP_OPTIONS:
      {
         uint16 options = ReadWORD(info->f);
         if(!(options & MAP_OPTIONS_DONTTILE)) mat.flags.tile = true;
         break;
      }
      case MAP_1_U_SCALE:
         mat.uScale = ReadFloat(info->f);
         break;
      case MAP_1_V_SCALE:
         mat.vScale = ReadFloat(info->f);
         break;
      /*
      case AMOUNT_OF:
         break;
      default:
         PrintLn("Unhandled Map block");
         break;
      */
   }
   return true;
}

static bool ReadMaterial(FileInfo * info, Material mat)
{
   switch(info->chunkId)
   {
      case MAT_NAME:
      {
         String name;
         char matName[MAX_LOCATION + 100];
         strcpy(matName, info->fileName);
         ReadASCIIZ(info->f, &name);
         strcat(matName, name);
         mat.name = CopyString(matName);
         delete name;
         break;
      }
      case MAT_TRANSPARENCY:
      {
         uint16 transparency;
         ReadChunks(ReadAmountOf, info, &transparency);
         mat.opacity = 1.0f - transparency / 100.0f;
         if(mat.opacity < 1.0)
            mat.flags.translucent = true;
         break;
      }
      case MAT_DIFFUSE:
      {
         ReadChunks(ReadRGB, info, &mat.diffuse);
         ReadChunks(ReadRGB, info, &mat.diffuse);
         break;
      }
      case MAT_AMBIENT:
      {
         ReadChunks(ReadRGB, info, &mat.ambient);
         ReadChunks(ReadRGB, info, &mat.ambient);
         break;
      }
      case MAT_SPECULAR:
      {
         ReadChunks(ReadRGB, info, &mat.specular);
         ReadChunks(ReadRGB, info, &mat.specular);
         break;
      }
      case MAT_SELFILLUM:
      {
         uint16 emissive;
         ReadChunks(ReadAmountOf, info, &emissive);
         mat.emissive.r = mat.diffuse.r * emissive / 100.0f;
         mat.emissive.g = mat.diffuse.g * emissive / 100.0f;
         mat.emissive.b = mat.diffuse.b * emissive / 100.0f;
         break;
      }
      case MAT_SHINSTRENGTH:
      {
         uint16 shininess;
         ReadChunks(ReadAmountOf, info, &shininess);
         mat.specular.r *= shininess / 100.0f;
         mat.specular.g *= shininess / 100.0f;
         mat.specular.b *= shininess / 100.0f;
         break;
      }
      case MAT_SHININESS:
      {
         uint16 power;
         ReadChunks(ReadAmountOf, info, &power);
         mat.power = power;
         break;
      }
      case MAT_MAPTEXTURE1:
         ReadChunks(ReadMap, info, mat);
         break;
      case MAT_MAPOPACITY:
         ReadChunks(ReadMap, info, mat);
         break;
      case MAT_DOUBLESIDED:
         mat.flags.doubleSided = true;
         break;
      case MAT_BUMPMAP:
         ReadChunks(ReadMap, info, mat);
         break;
      /*
      default:
         PrintLn("Unhandled MAT type ID", info->chunkId);
      */
   }
   return true;
}

// Lights
static bool ReadLight(FileInfo * info, Object object)
{
   Light * light = &object.light;
   switch(info->chunkId)
   {
      case RGB_BYTE:
      case RGB_BYTE_GAMMA:
      case RGB_FLOAT:
      case RGB_FLOAT_GAMMA:
         ReadRGB(info, &light->diffuse);
         light->specular = light->diffuse;
         break;
      case LIT_SPOT:
      {
         Object target;
         char targetName[MAXNAMELEN];

         strcpy(targetName, object.name);
         strcat(targetName, ".target");

         light->flags.omni = false;
         light->flags.spot = true;

         target = Object { };
         target.name = CopyString(targetName);
         info->rootObject.children.AddName(target);
         target.parent = info->rootObject;

         light->target = target;

         target.transform.position.x = ReadFloat(info->f);
         target.transform.position.z = ReadFloat(info->f);
         target.transform.position.y =-ReadFloat(info->f);

         light->hotSpot = ReadFloat(info->f);
         light->fallOff = ReadFloat(info->f);
         break;
      }
      case LIT_ONOFF:
      {
         light->flags.off = true;
         break;
      }
      case LIT_ATTENUATION:
      {
         /* solve (
            {
               d = 300, small = 0.001,
               Kl = 0, Kc = 0,
               d * (Kl + Kq * d) = (1 / small) - Kc
            },
            { Kc, Kl, Kq, small, d });
         */

         light->flags.attenuation = true;

         /*
         #define MINLIGHT     0.08
         light->Kq = 1/(light->end*light->end*MINLIGHT);
         */

         #define MINLIGHT     0.15f
         // #define MINLIGHT     0.1
         light->Kl = (float)(1/(light->end*MINLIGHT));

         break;
      }
      case LIT_START:
      {
         light->start = ReadFloat(info->f);
         break;
      }
      case LIT_END:
      {
         light->end = ReadFloat(info->f);
         break;
      }
      case LIT_MULTIPLIER:
      {
         light->multiplier = ReadFloat(info->f);
         break;
      }
   }
   return true;
}

// Cameras
static bool ReadCamera(FileInfo * info, Object object)
{
   switch(info->chunkId)
   {
      case CAM_SEECONE:
      {
         break;
      }
      case CAM_RANGES:
      {
         //Camera camera = object.camera;
         /*float nearRange = */ReadFloat(info->f);
         /*float farRange = */ReadFloat(info->f);
         /*
         camera.zMin = Max(0.1, nearRange);
         camera.zMax = farRange;
         */
         break;
      }
   }
   return true;
}

// Edit Chunks
static bool ReadEditObject(FileInfo * info, char * name)
{
   DisplaySystem displaySystem = info->displaySystem;
   switch(info->chunkId)
   {
      case OBJ_TRIMESH:
      {
         Object object = info->rootObject.Find(name);
         if(!object)
         {
            object = Object { };
            object.name = CopyString(name);
            info->rootObject.children.AddName(object);
            object.parent = info->rootObject;
         }
         object.InitializeMesh(displaySystem);
         ReadChunks(ReadTriMesh, info, object);
         object.flags.mesh = true;
         object.mesh.Unlock(0);
         break;
      }
      case OBJ_LIGHT:
      {
         Object object = info->rootObject.Find(name);
         Light * light;
         Vector3Df position;

         if(!object)
         {
            object = Object { };
            object.name = CopyString(name);
            info->rootObject.children.AddName(object);
            object.parent = info->rootObject;
         }
         object.flags.light = true;

         light = &object.light;
         light->lightObject = object;
         light->flags.omni = true;
         light->multiplier = 1.0f;

         // This is not used?
         Read3DVertex(info->f, position);
         light->direction = { position.x, position.y, position.z };
         info->pos += sizeof(float) * 3;

         ReadChunks(ReadLight, info, object);
         break;
      }
      case OBJ_CAMERA:
      {
         char targetName[MAXNAMELEN];
         Object object = info->rootObject.Find(name);
         Object target;
         Camera camera;
         float /*bankAngle, */focus;
         double mm;

         strcpy(targetName, name);
         strcat(targetName, ".target");
         target = info->rootObject.Find(targetName);

         if(!object)
         {
            object = Object { };
            object.name = CopyString(name);
            info->rootObject.children.AddName(object);

            object.parent = info->rootObject;
            object.camera = Camera { };
            object.camera.type = lookAtObject;
         }

         if(!target)
         {
            target = Object { };
            target.name = CopyString(targetName);
            info->rootObject.children.AddName(target);
            target.parent = info->rootObject;
         }

         object.flags.camera = true;
         object.cameraTarget = target;

         camera = object.camera;
         camera.cameraObject = object;
         camera.target = target;

         //Read3DVertex(info->f, camera.position);
         object.transform.position.x = ReadFloat(info->f);
         object.transform.position.z = ReadFloat(info->f);
         object.transform.position.y =-ReadFloat(info->f);

         info->pos += sizeof(float) * 3;
         //Read3DVertex(info->f, object.cameraTarget.position);
         target.transform.position.x = ReadFloat(info->f);
         target.transform.position.z = ReadFloat(info->f);
         target.transform.position.y =-ReadFloat(info->f);

         info->pos += sizeof(float) * 3;
         /*bankAngle = */ReadFloat(info->f);
         info->pos += sizeof(float);
         focus = ReadFloat(info->f);
         info->pos += sizeof(float);

         mm = (focus - 5.05659508373109) / 1.13613250717301;
         camera.fov = (float)(1248.58921609766 * pow(mm, -0.895625414990581));

         ReadChunks(ReadCamera, info, object);
         break;
      }
      case OBJ_HIDDEN: break;
   }
   return true;
}

#define COPY_NITEM(d, s) CopyBytes(((byte *)(d)) + sizeof(class NamedItem), ((byte *)(s)) + sizeof(class NamedItem), sizeof((*s)) - sizeof(class NamedItem));

static bool ReadEditChunks(FileInfo * info, void * data)
{
   switch(info->chunkId)
   {
      case EDIT_AMBIENT:
      {
         // Read the ambient color
         ReadChunks(ReadRGB, info, &info->rootObject.ambient);
         break;
      }
      case EDIT_MATERIAL:
      {
         Material material { /*flags = { singleSideLight = true }*/ };
         Material mat;
         ReadChunks(ReadMaterial, info, material);

         mat = info->displaySystem.AddNamedMaterial(material.name);
         if(mat)
         {
            if(material.baseMap)
               material.baseMap.MakeMipMaps(info->displaySystem);
            if(material.bumpMap)
               material.bumpMap.MakeMipMaps(info->displaySystem);
            // COPY_NITEM(mat, material);
            CopyBytes(((byte *)(mat)) + sizeof(class NamedItem), ((byte *)(material)) + sizeof(class NamedItem), sizeof(class Material) - sizeof(class NamedItem));
         }
         else
         {
            delete material.baseMap;
         }
         delete material.name;
         delete material;
         break;
      }
      case EDIT_OBJECT:
      {
         char * name;
         info->pos += ReadASCIIZ(info->f, &name);
         ReadChunks(ReadEditObject, info, name);
         delete name;
         break;
      }
   }
   return true;
}

struct ObjectInfoBlock
{
   OldList tracks;
   short hierarchy;
   short parent;
   char * name;
   char * dummyName;
   Vector3Df pivot;
};

// Key Framer Chunks

#define ACCFLAG_TENSION    0x00000001
#define ACCFLAG_CONTINUITY 0x00000002
#define ACCFLAG_BIAS       0x00000004
#define ACCFLAG_EASETO     0x00000008
#define ACCFLAG_EASEFROM   0x00000010

static bool ReadFrameInfoBlock(FileInfo * info, ObjectInfoBlock * block)
{
   switch(info->chunkId)
   {
      case FRM_PARAM:
      {
         //uint16 flags1, flags2;
         ReadASCIIZ(info->f, &block->name);
         /*flags1 = */ReadWORD(info->f);
         /*flags2 = */ReadWORD(info->f);
         block->parent = ReadWORD(info->f);
         break;
      }
      case FRM_DUMMYNAME:
         ReadASCIIZ(info->f, &block->dummyName);
         break;
      case FRM_PIVOT:
         Read3DVertex(info->f, block->pivot);
         break;
      case FRM_HIERARCHY:
         block->hierarchy = ReadWORD(info->f);
         break;
      case FRM_TRACKPOS:
      case FRM_TRACKROT:
      case FRM_TRACKSCALE:
      case FRM_TRACKROLL:
      case FRM_TRACKFOV:
      case FRM_TRACKCOLOR:
      case FRM_TRACKHOTSPOT:
      case FRM_TRACKFALLOFF:
      {
         FrameTrack track { };
         if(track)
         {
            uint16 flags;
            byte unknown[8];
            uint c;

            block->tracks.Add(track);

            flags = ReadWORD(info->f);

            info->f.Read(unknown, sizeof(unknown), 1);

            track.numKeys = ReadDWORD(info->f);

            switch(info->chunkId)
            {
               case FRM_TRACKPOS: track.type.type = position; break;
               case FRM_TRACKROT: track.type.type = rotation; break;
               case FRM_TRACKSCALE: track.type.type = scaling; break;
               case FRM_TRACKROLL: track.type.type = roll; break;
               case FRM_TRACKFOV: track.type.type = fov; break;
               case FRM_TRACKCOLOR: track.type.type = colorChange; break;
               case FRM_TRACKHOTSPOT: track.type.type = hotSpot; break;
               case FRM_TRACKFALLOFF: track.type.type = fallOff; break;
            }
            if((flags & 0x0003) == 3)
               track.type.loop = true;

            track.keys = new0 FrameKey[track.numKeys];
            for(c = 0; c<track.numKeys; c++)
            {
               uint16 accelerationFlags;
               FrameKey * key = track.keys + c;

               key->frame = ReadDWORD(info->f);
               accelerationFlags = ReadWORD(info->f);

               if(accelerationFlags & ACCFLAG_TENSION)
                  key->tension = ReadFloat(info->f);
               if(accelerationFlags & ACCFLAG_CONTINUITY)
                  key->continuity = ReadFloat(info->f);
               if(accelerationFlags & ACCFLAG_BIAS)
                  key->bias = ReadFloat(info->f);
               if(accelerationFlags & ACCFLAG_EASETO)
                  key->easeTo = ReadFloat(info->f);
               if(accelerationFlags & ACCFLAG_EASEFROM)
                  key->easeFrom = ReadFloat(info->f);

               switch(info->chunkId)
               {
                  case FRM_TRACKPOS:
                  {
                     Vector3Df position;
                     Read3DVertex(info->f, position);
                     key->position = { position.x, -position.z, position.y };
                     break;
                  }
                  case FRM_TRACKROT:
                  {
                     Vector3Df axis;
                     Angle angle = ReadFloat(info->f);
                     Vector3Df fixedAxis;

                     Read3DVertex(info->f, axis);
                     fixedAxis.x = axis.x;
                     fixedAxis.y = -axis.z;
                     fixedAxis.z = axis.y;

                     if(c > 0)
                     {
                        Quaternion rotation;
                        rotation.RotationAxis(fixedAxis, angle);
                        key->orientation.Multiply((key - 1)->orientation, rotation);
                     }
                     else
                        key->orientation.RotationAxis(fixedAxis, angle);
                     break;
                  }
                  case FRM_TRACKSCALE:
                  {
                     Vector3Df scaling;
                     Read3DVertex(info->f, scaling);
                     key->scaling = { scaling.x, scaling.z, scaling.y };
                     break;
                  }
                  case FRM_TRACKFOV:
                  {
                     key->fov = ReadFloat(info->f);
                     break;
                  }
                  case FRM_TRACKROLL:
                  {
                     key->roll = -ReadFloat(info->f);
                     break;
                  }
                  case FRM_TRACKCOLOR:
                  {
                     FileInfo childInfo = *info;
                     childInfo.chunkId = RGB_FLOAT;
                     ReadRGB(&childInfo, &key->color);
                     break;
                  }
                  case FRM_TRACKHOTSPOT:
                  {
                     key->hotSpot = ReadFloat(info->f);
                     break;
                  }
                  case FRM_TRACKFALLOFF:
                  {
                     key->fallOff = ReadFloat(info->f);
                     break;
                  }
               }
            }
         }
         break;
      }
   }
   return true;
}

static Object FindObjectID(Object object, int id)
{
   Object result = null;
   Object child;
   for(child = object.children.first; child; child = child.next)
   {
      if(child.flags.hierarchy == (uint16) id)
      {
         result = child;
         break;
      }
      else
      {
         result = FindObjectID(child, id);
         if(result) break;
      }
   }
   return result;
}

static bool ReadKeyFrameChunks(FileInfo * info, void * data)
{
   switch(info->chunkId)
   {
      case FRM_MESHINFO:
      {
         ObjectInfoBlock block { };
         Object object = null;

         ReadChunks(ReadFrameInfoBlock, info, &block);

         if(block.dummyName && block.dummyName[0])
         {
            if(!strcmp(block.name, "$$$DUMMY"))
            {
               object = Object { };
               object.name = block.dummyName;
               info->rootObject.children.AddName(object);
               object.transform.scaling = { 1,1,1 };
            }
            else
            {
               Object model = info->rootObject.Find(block.name);
               if(model)
               {
                  object = Object { };
                  object.name  = new char[strlen(block.dummyName) + strlen(model.name) + 2];
                  sprintf(object.name, "%s.%s", model.name, block.dummyName);
                  object.flags = model.flags;
                  object.flags.ownMesh = false;
                  object.mesh = model.mesh;
                  /*
                  object.min = model.min;
                  object.max = model.max;
                  object.radius = model.radius;
                  */
                  object.transform = model.transform;
                  info->rootObject.children.AddName(object);
               }
               delete block.dummyName;
            }
            if(object)
               object.parent = info->rootObject;
         }
         else
            object = info->rootObject.Find(block.name);

         if(object)
         {
            Mesh mesh = object.mesh;
            object.flags.hierarchy = block.hierarchy + 1;
            if(block.parent != -1)
            {
               Object parent = FindObjectID(info->rootObject, block.parent + 1);
               if(parent)
               {
                  object.parent.children.Remove(object);
                  parent.children.AddName(object);
                  object.parent = parent;
               }
            }
            object.pivot.x = block.pivot.x;
            object.pivot.y =-block.pivot.z;
            object.pivot.z = block.pivot.y;

            if(mesh && object.flags.ownMesh)
            {
               if(mesh.Lock({ vertices = true }))
               {
                  int c;
                  // Take pivot into account
                  for(c = 0; c<mesh.nVertices; c++)
                  {
                     mesh.vertices[c].x -= object.pivot.x;
                     mesh.vertices[c].y -= object.pivot.y;
                     mesh.vertices[c].z -= object.pivot.z;
                  }
                  mesh.Unlock({ vertices = true });
               }
            }

            object.tracks = block.tracks;
            *&(object.frame) = object.startFrame = info->rootObject.startFrame;
            object.endFrame = info->rootObject.endFrame;
         }
         /*else
            Logf("Object not found while loading animation frame: %s\n", block.name);*/
         delete block.name;
         break;
      }
      case FRM_CAMERA:
      {
         ObjectInfoBlock block { };
         Object object = null;

         ReadChunks(ReadFrameInfoBlock, info, &block);

         if(block.dummyName && block.dummyName[0])
         {
            if(!strcmp(block.name, "$$$DUMMY"))
            {
               object = Object { };
               object.name = block.dummyName;
               info->rootObject.children.AddName(object);
               object.transform.scaling = { 1, 1, 1 };
               object.flags.camera = true;
            }
            else
            {
               Object model = info->rootObject.Find(block.name);
               if(model)
               {
                  object = Object { };
                  object.name  = new char[strlen(block.dummyName) + strlen(model.name) + 2];
                  sprintf(object.name, "%s.%s", model.name, block.dummyName);
                  object.flags = model.flags;
                  object.flags.ownMesh = false;
                  object.camera = model.camera;
                  object.flags.camera = true;
                  info->rootObject.children.AddName(object);
               }
               delete block.dummyName;
            }
            if(object)
               object.parent = info->rootObject;
         }
         else
            object = info->rootObject.Find(block.name);

         if(object)
         {
            object.flags.hierarchy = block.hierarchy + 1;
            if(block.parent != -1)
            {
               Object parent = FindObjectID(info->rootObject, block.parent + 1);
               if(parent)
               {
                  object.parent.children.Remove(object);
                  parent.children.AddName(object);
                  object.parent = parent;
               }
            }
            object.pivot.x = block.pivot.x;
            object.pivot.y =-block.pivot.z;
            object.pivot.z = block.pivot.y;

            object.tracks = block.tracks;
            *&(object.frame) = object.startFrame = info->rootObject.startFrame;
            object.endFrame = info->rootObject.endFrame;
         }
         /*else
            Logf("Object not found while loading animation frame: %s\n", block.name);*/
         delete block.name;
         break;
      }
      case FRM_CAMERATARGET:
      {
         ObjectInfoBlock block { };
         Object object = null;
         char targetName[MAXNAMELEN];

         ReadChunks(ReadFrameInfoBlock, info, &block);

         strcpy(targetName, block.name);
         strcat(targetName, ".target");

         if(block.dummyName && block.dummyName[0])
         {
            if(!strcmp(block.name, "$$$DUMMY"))
            {
               object = Object { };
               object.name = block.dummyName;
               info->rootObject.children.AddName(object);
               object.transform.scaling = { 1,1,1 };
            }
            else
            {
               Object model = info->rootObject.Find(targetName);
               if(model)
               {
                  object = Object { };
                  object.name  = new char[strlen(block.dummyName) + strlen(model.name) + 2];
                  sprintf(object.name, "%s.%s", model.name, block.dummyName);
                  object.flags = model.flags;
                  object.flags.ownMesh = false;
                  object.camera = model.camera;
                  info->rootObject.children.AddName(object);
               }
               delete block.dummyName;
            }
            if(object)
               object.parent = info->rootObject;
         }
         else
            object = info->rootObject.Find(targetName);

         if(object)
         {
            object.flags.hierarchy = block.hierarchy + 1;
            if(block.parent != -1)
            {
               Object parent = FindObjectID(info->rootObject, block.parent + 1);
               if(parent)
               {
                  object.parent.children.Remove(object);
                  parent.children.AddName(object);
                  object.parent = parent;
               }
            }
            object.pivot.x = block.pivot.x;
            object.pivot.y =-block.pivot.z;
            object.pivot.z = block.pivot.y;

            object.tracks = block.tracks;
            *&(object.frame) = object.startFrame = info->rootObject.startFrame;
            object.endFrame = info->rootObject.endFrame;
         }
         /*else
            Logf("Object not found while loading animation frame: %s\n", block.name);*/
         delete block.name;
         break;
      }
      case FRM_AMBIENT:
      {
         ObjectInfoBlock block { };

         ReadChunks(ReadFrameInfoBlock, info, &block);

         info->rootObject.tracks = block.tracks;
         break;
      }
      case FRM_OMNILIGHT:
      case FRM_SPOTLIGHT:
      {
         ObjectInfoBlock block { };
         Object object = null;

         ReadChunks(ReadFrameInfoBlock, info, &block);

         if(block.dummyName && block.dummyName[0])
         {
            if(!strcmp(block.name, "$$$DUMMY"))
            {
               object = Object { };
               object.name = block.dummyName;
               info->rootObject.children.AddName(object);
               object.transform.scaling = { 1, 1, 1 };
               object.flags.light = true;
            }
            else
            {
               Object model = info->rootObject.Find(block.name);
               if(model)
               {
                  object = Object { };
                  object.name  = new char[strlen(block.dummyName) + strlen(model.name) + 2];
                  sprintf(object.name, "%s.%s", model.name, block.dummyName);
                  object.flags = model.flags;
                  object.flags.ownMesh = false;
                  object.light = model.light;
                  object.flags.light = true;
                  info->rootObject.children.AddName(object);
               }
               delete block.dummyName;
            }
            if(object)
               object.parent = info->rootObject;
         }
         else
            object = info->rootObject.Find(block.name);

         if(object)
         {
            object.flags.hierarchy = block.hierarchy + 1;
            if(block.parent != -1)
            {
               Object parent = FindObjectID(info->rootObject, block.parent + 1);
               if(parent)
               {
                  object.parent.children.Remove(object);
                  parent.children.AddName(object);
                  object.parent = parent;
               }
            }
            object.pivot.x = block.pivot.x;
            object.pivot.y =-block.pivot.z;
            object.pivot.z = block.pivot.y;

            object.tracks = block.tracks;
            *&(object.frame) = object.startFrame = info->rootObject.startFrame;
            object.endFrame = info->rootObject.endFrame;
         }
         /*else
            Logf("Object not found while loading animation frame: %s\n", block.name);*/
         delete block.name;
         break;
      }
      case FRM_SPOTLIGHTTARGET:
      {
         ObjectInfoBlock block { };
         Object object = null;
         char targetName[MAXNAMELEN];

         ReadChunks(ReadFrameInfoBlock, info, &block);

         strcpy(targetName, block.name);
         strcat(targetName, ".target");

         if(block.dummyName && block.dummyName[0])
         {
            if(!strcmp(block.name, "$$$DUMMY"))
            {
               object = Object { };
               object.name = block.dummyName;
               info->rootObject.children.AddName(object);
               object.transform.scaling = { 1,1,1 };
            }
            else
            {
               Object model = info->rootObject.Find(targetName);
               if(model)
               {
                  object = Object { };
                  object.name  = new char[strlen(block.dummyName) + strlen(model.name) + 2];
                  // TODO: When passing a String to a const String, use member if property is const String but member is String
                  sprintf(object.name, "%s.%s", model.name, block.dummyName);
                  object.flags = model.flags;
                  object.flags.ownMesh = false;
                  object.light = model.light;
                  info->rootObject.children.AddName(object);
               }
               delete block.dummyName;
            }
            if(object)
               object.parent = info->rootObject;
         }
         else
            object = info->rootObject.Find(targetName);

         if(object)
         {
            object.flags.hierarchy = block.hierarchy + 1;
            if(block.parent != -1)
            {
               Object parent = FindObjectID(info->rootObject, block.parent + 1);
               if(parent)
               {
                  object.parent.children.Remove(object);
                  parent.children.AddName(object);
                  object.parent = parent;
               }
            }
            object.pivot.x = block.pivot.x;
            object.pivot.y =-block.pivot.z;
            object.pivot.z = block.pivot.y;

            object.tracks = block.tracks;
            *&(object.frame) = object.startFrame = info->rootObject.startFrame;
            object.endFrame = info->rootObject.endFrame;
         }
         /*else
            Logf("Object not found while loading animation frame: %s\n", block.name);*/
         delete block.name;
         break;
      }
      case FRM_FRAMES:
      {
         info->rootObject.startFrame = ReadDWORD(info->f);
         info->rootObject.endFrame = ReadDWORD(info->f);
         *&(info->rootObject.frame) = info->rootObject.startFrame;
         break;
      }
   }
   return true;
}

// Main Chunks
static bool ReadMainChunks(FileInfo * info, void * data)
{
   switch(info->chunkId)
   {
      case EDIT3DS:
         ReadChunks(ReadEditChunks, info, null);
         break;
      case KEYFRAME3DS:
      {
         Object object = data;
         if(!(object.flags.keysLoaded)) // Don't read key frames on reload
         {
            ReadChunks(ReadKeyFrameChunks, info, null);
            object.flags.keysLoaded = true;
         }
         break;
      }
   }
   return true;
}

static bool ReadMain(FileInfo * info, void * data)
{
   switch(info->chunkId)
   {
      case MAIN3DS:
         ReadChunks(ReadMainChunks, info, data);
         break;
   }
   return true;
}

class Object3DSFormat : ObjectFormat
{
   class_property(extension) = "3ds";

   bool Load(Object object, const char * fileName, DisplaySystem displaySystem)
   {
      bool result = false;
      if(fileName)
      {
         FileInfo info = {0};
         info.rootObject = object;
         info.displaySystem = displaySystem;
         info.pos = 0;
         info.end = 1;
         info.fileName = fileName;
         StripLastDirectory(fileName, info.textureDirectory);
         info.f = FileOpen(fileName, read);
         if(info.f)
         {
            if(ReadChunks(ReadMain, &info, object) && info.rootObject.children.first)
            {
               object.flags.root = true;
               object.SetMinMaxRadius(true);
               object._Animate(object.frame);
               object.UpdateTransform();
               result = true;
            }
            delete info.f;
         }
         if(info.matFaces)
            info.matFaces.Free();
         delete info.matFaces;
      }
      if(!result)
         object.Free(displaySystem);
      return result;
   }
}
