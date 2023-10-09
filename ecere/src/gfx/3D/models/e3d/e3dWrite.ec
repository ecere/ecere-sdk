#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "e3dDefs"

static struct E3DBlockHeader
{
   E3DBlockType type __attribute__((packed));   // FIXME: __attribute__((packed)) lost by module imports?
   uint32 size       __attribute__((packed));
};

static bool externalTextures = false; //true;
static int JPEG_QUALITY = 75;
static bool compressed = true;

#define Bool __Bool
#include <LzmaLib.h>
#undef Bool

static byte * encodeLZMA(byte * data, uint size, uint * encodedSize, void * options)
{
   size_t destLen = (unsigned long)(size + size / 10 + 16384);
   byte * compressed = new byte[5+destLen];
   if(compressed)
   {
      size_t outPropsSize = LZMA_PROPS_SIZE;
      int r = LzmaCompress(compressed + LZMA_PROPS_SIZE, &destLen, data, size, compressed, &outPropsSize,
            9, 1 << 26, 4, 4, 4, 64, 1);
      *encodedSize = (uint)destLen + LZMA_PROPS_SIZE;
//#ifdef _DEBUG
      if(r != SZ_OK)
      {
         PrintLn("WARNING: E3D: lzma compression failed");
         delete compressed;
      }
//#endif
   }
   return compressed;
}

void writeE3D(File f, Object object, E3DWriteContext ctx)
{
   Array<BlockInfo> mainBlocks { };

   ctx.nodeID = 1;
   calculateMeshes(ctx, object);
   writeE3DBlock(ctx, f, version,   object, writeVersion);

   if(ctx.textures.count)
      mainBlocks.Add({ textures,  object, writeTextures });
   if(ctx.materials.count)
      mainBlocks.Add({ materials,  object, writeMaterials });
   if(ctx.allMeshes.count)
      mainBlocks.Add({ meshes,  object, writeMeshes });
   mainBlocks.Add({ nodes,  object, writeObjects });
   if(ctx.allAnimatedObjects.count)
      mainBlocks.Add({ animations, object, writeAnimations });

   if(!compressed)
      for(b : mainBlocks)
         writeE3DBlock(ctx, f, b.type, b.data, b.fn);
   else
      writeLZMA(ctx, f, mainBlocks);

   delete mainBlocks;

   ctx.materials.RemoveAll();
   ctx.allMeshes.RemoveAll();
   ctx.meshFaceMaterials.Free();
   ctx.meshToID.Free();
   ctx.objectToNodeID.Free();

   ctx.firstTexture = ctx.textures.count;
   ctx.texUsed.Free();
}

static void writeE3DBlock(E3DWriteContext ctx, File f, E3DBlockType type, void * data, void (* fn)(E3DWriteContext ctx, File f, void * data))
{
   uint64 pos = f.Tell();
   E3DBlockHeader header { type = type };
   f.Write(&header, sizeof(header), 1);
   fn(ctx, f, data);
   header.size = (uint)(f.Tell() - pos);
   f.Seek(pos, start);
   f.Write(&header, sizeof(header), 1);
   f.Seek(pos + header.size, start);
}

struct BlockInfo
{
   E3DBlockType type;
   void * data;
   void (* fn)(E3DWriteContext ctx, File f, void * data);
};

static void writeLZMA(E3DWriteContext ctx, File f, Container<BlockInfo> infos)
{
   TempFile tmp { };
   byte * cData;
   uint size = 0, cSize = 0;
   for(i : infos)
      writeE3DBlock(ctx, tmp, i.type, i.data, i.fn);
   size = tmp.size;
   cData = encodeLZMA(tmp.buffer, size, &cSize, null);
   if(cData && cSize < size)
   {
      E3DBlockHeader header { type = lzma, size = sizeof(E3DBlockHeader) + sizeof(uint) + cSize };
      delete tmp;
      f.Write(&header, sizeof(header), 1);
      f.Write(&size, sizeof(uint), 1);
      f.Write(cData, cSize, 1);
   }
   else
      // Write uncompressed if compression failed or we didn't save anything with compression
      f.Write(tmp.buffer, 1, size);
   delete cData;
}

static void writeAttributes(E3DWriteContext ctx, File f, Mesh mesh)
{
   int nVertices = mesh.nVertices;
   f.Write(&nVertices, sizeof(nVertices), 1);
   writeE3DBlock(ctx, f, attrInterleaved, mesh, writeInterleaved);
}

static void writeColor(E3DWriteContext ctx, File f, ColorRGBAf c)
{
   struct { byte r, g, b, a; } color;
   color.r = (byte)Max(0, Min(255, (int)(c.r * 255)));
   color.g = (byte)Max(0, Min(255, (int)(c.g * 255)));
   color.b = (byte)Max(0, Min(255, (int)(c.b * 255)));
   color.a = (byte)Max(0, Min(255, (int)(c.a * 255)));
   f.Write(&color, sizeof(color), 1);
}

static void writeColorRGB(E3DWriteContext ctx, File f, ColorRGB c)
{
   f.Write(c, sizeof(ColorRGB), 1);
}

static void writeInterleaved(E3DWriteContext ctx, File f, Mesh mesh)  // TODO: Add option to write tangent, colors, or remove before calling E3D writer
{
   MeshFeatures features = mesh.flags & ~MeshFeatures { tangents = true, colors = true };   // TWEAKED: Don't write tangents, colors for FLT's
   E3DBlockType type;
   int i;
   int nVertices = mesh.nVertices;
   Vector3Df * vertices = null;
   Vector3Df * normals = null;
   Vector3Df * tangents = null;
   ColorRGBAf * colors = null;
   Pointf * texCoords = null;
   uint16 vSize = 0;
   uint vStride = sizeof(Vector3Df);
   uint nStride = sizeof(Vector3Df);
   uint cStride = sizeof(ColorRGBAf);
   uint tStride = sizeof(Pointf);
   uint gStride = 2*sizeof(Vector3Df);
   Array<SkinVert> skinVerts = null;
   byte maxBones = 0;
   uint dupVertCount = mesh.dupVerts ? mesh.dupVerts.count : 0;
   Vector3Df * tmpVertices = null;

   if(features.vertices)
   {
      int startDups = nVertices - dupVertCount;
      Mesh unmorphedMesh = mesh.unmorphedMesh;
      if(unmorphedMesh && unmorphedMesh.nVertices == nVertices)
         vertices = unmorphedMesh.vertices;
      else if(unmorphedMesh && unmorphedMesh.nVertices == startDups)
      {
         int i;
         Vector3Df * v;

         vertices = tmpVertices = new Vector3Df[nVertices];
         memcpy(vertices, unmorphedMesh.vertices, startDups);
         v = vertices + startDups;
         for(i = 0; i < dupVertCount; i++, v++)
            *v = unmorphedMesh.vertices[mesh.dupVerts[i]];
      }
      else
         vertices = mesh.vertices;
      type = attrVertices;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 12;
      if(mesh.flags.interleaved)
         vStride = sizeof(float) * 8;
   }
   if(features.normals)
   {
      normals = mesh.flags.interleaved ? (Vector3Df *)((byte *)mesh.vertices + 3*sizeof(float)) : mesh.normals;
      type = attrNormals;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 4;
      if(mesh.flags.interleaved)
         nStride = sizeof(float) * 8;
   }
   if(features.texCoords1)
   {
      texCoords = mesh.flags.interleaved ? (Pointf *)((byte *)mesh.vertices + 6*sizeof(float)) : mesh.texCoords;
      type = attrTexCoords;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 8;
      if(mesh.flags.interleaved)
         tStride = sizeof(float) * 8;
   }
   if(features.colors)
   {
      colors = mesh.colors;
      type = attrColors;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 4;
      // if(mesh.flags.interleaved) tStride = sizeof(float) * 8;
   }
   if(features.tangents)
   {
      tangents = mesh.tangents;
      // type = attrTangentsSign;
      type = attrTangentsBT;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      // vSize += 4;
      vSize += 8;
      // if(mesh.flags.interleaved) gStride = sizeof(float) * 8;
   }
   if(/*features.bones && */mesh.skin)
   {
      skinVerts = mesh.skin.skinVerts;
      maxBones = (byte)sizeof(mesh.skin.skinVerts[0].bones);
      type = attrBoneWeights;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += maxBones * 2;
   }
   type = 0;
   f.Write(&type, sizeof(E3DBlockType), 1);
   f.Write(&vSize, sizeof(uint16), 1);

   for(i = 0; i < nVertices; i++)
   {
      if(vertices)
         f.Write((byte *)vertices + vStride * i, sizeof(Vector3Df), 1);
      if(normals)
      {
         uint32 n = vecfPack10i((Vector3Df *)((byte *)normals + nStride * i), null);
         f.Write(&n, sizeof(uint), 1);
      }
      if(texCoords)
         f.Write((byte *)texCoords + tStride * i, sizeof(Pointf), 1);
      if(features.colors)
         writeColor(ctx, f, (ColorRGBAf *)((byte *)colors + i * cStride));
      if(features.tangents)
      {
         /*
         uint32 n = vecfPack10i(tangent0, tangent0 + 1;
         f.Write(&n, sizeof(uint), 1);
         */
         Vector3Df * tangent0 = (Vector3Df *)((byte *)tangents + gStride * i);
         uint32 n = vecfPack10i(tangent0, null);
         uint32 b = vecfPack10i(tangent0 + 1, null);
         f.Write(&n, sizeof(uint), 1);
         f.Write(&b, sizeof(uint), 1);
      }
      if(skinVerts) // && i < nVertices - dupVertCount)  // Do we want a changing vSize?
      {
         int j = i;
         int startDup = nVertices - dupVertCount;

         if(i >= startDup)
            j = mesh.dupVerts[i - startDup];

         f.Write(skinVerts[j].bones,   sizeof(byte), maxBones);
         f.Write(skinVerts[j].weights, sizeof(byte), maxBones);
      }
   }
   delete tmpVertices;
}

static int getFacesCount(PrimitiveGroup g)
{
   int nFaces = 0;
   int nIndices = g.nIndices;
   switch(g.type.primitiveType)
   {
      case triangles: nFaces += nIndices / 3; break;
      case triStrip:  nFaces += nIndices - 2; break;
      case triFan:    nFaces += nIndices - 2; break;
      case quads:     nFaces += 2 * (nIndices / 4); break;
      case quadStrip: nFaces += 2 * (nIndices - 2)/2; break;
   }
   return nFaces;
}

static void writeTriFaces16(E3DWriteContext ctx, File f, Mesh mesh)
{
   int nFaces = 0;
   PrimitiveGroup g;
   for(g = mesh.groups.first; g; g = g.next)
      if(!g.type.hide)
         nFaces += getFacesCount(g);

   f.Write(&nFaces, sizeof(nFaces), 1);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i, gn = g.nIndices;

      if(g.type.hide) continue;

      if(g.type.indices32bit)
      {
         uint32 * indices = g.indices32;
         if(g.type.sharedIndices)
            indices = mesh.indices + g.baseIndexMesh;

         for(i = 0; i < gn; i++)
         {
            uint16 ix = (uint16)indices[i];
            /*if(ix != indices[i])
               PrintLn("Warning 32 bit indices!");*/
            f.Write(&ix, sizeof(uint16), 1);
         }
      }
      else
      {
         uint16 * indices = g.indices;
         if(g.type.sharedIndices)
            indices = ((uint16 *)mesh.indices) + g.baseIndexMesh;

         if(g.type == quads)
         {
            for(i = 0; i < gn; i+=4)
            {
               f.Write(&indices[i], sizeof(uint16), 1);
               f.Write(&indices[i+1], sizeof(uint16), 1);
               f.Write(&indices[i+2], sizeof(uint16), 1);
               f.Write(&indices[i], sizeof(uint16), 1);
               f.Write(&indices[i+2], sizeof(uint16), 1);
               f.Write(&indices[i+3], sizeof(uint16), 1);
            }
         }
         else
         {
            for(i = 0; i < gn; i++)
            {
               f.Write(&indices[i], sizeof(uint16), 1);
               /*
               uint16 ix = indices[i];
               if(i > 0)
                  ix -= indices[i-1];
               f.Write(&ix, sizeof(uint16), 1);
               */
            }
         }
      }
   }
}

static void writeTriFaces32(E3DWriteContext ctx, File f, Mesh mesh)
{
   int nFaces = 0;
   PrimitiveGroup g;
   for(g = mesh.groups.first; g; g = g.next)
      if(!g.type.hide)
         nFaces += getFacesCount(g);

   f.Write(&nFaces, sizeof(nFaces), 1);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i, gn = g.nIndices;
      if(g.type.hide) continue;

      if(g.type.indices32bit)
      {
         uint32 * indices = g.type.sharedIndices && mesh.indices ? mesh.indices + g.baseIndexMesh : g.indices32;
         for(i = 0; i < gn; i++)
            f.Write(&indices[i], sizeof(uint32), 1);
      }
      else
      {
         uint16 * indices = g.indices;
         for(i = 0; i < gn; i++)
         {
            uint32 ix = indices[i];
            f.Write(&ix, sizeof(uint32), 1);
            /*
            uint16 ix = indices[i];
            if(i > 0)
               ix -= indices[i-1];
            f.Write(&ix, sizeof(uint16), 1);
            */
         }
      }
   }
}

static void prepareTexture(E3DWriteContext ctx, Bitmap tex, bool usePNG)
{
   if(tex)
   {
      int texID = ctx.texturesToID[(uintptr)tex];
      if(!texID)
      {
         if(ctx.texturesByID && ctx.texturesByID.count)
         {
            MapIterator<uint, Bitmap> it { map = ctx.texturesByID, pointer = ctx.texturesByID.GetLast() };
            texID = it.key;
         }
         else
            texID = ctx.textures.count + 1;
         if(texID >= ctx.textures.count)
         {
            ctx.textures.size++;
            ctx.texUsePNG.size++;
         }
         ctx.texUsePNG[texID-1] = usePNG;
         ctx.textures[texID-1] = tex;
         ctx.texturesToID[(uintptr)tex] = texID;
      }
      else
         // If the textures and texturesToID containers have
         // been prefilled, texUsePNG was not, so we do this here,
         // even thou, in case they were not prefilled, we end up setting
         // values multiple times. TODO: find a better way.
         ctx.texUsePNG[texID-1] = usePNG;

      ctx.texUsed.Add(texID);
   }
}

static void computeFacesMaterials(E3DWriteContext ctx, Mesh mesh)
{
   int nFaces = 0;
   int start = 0;
   PrimitiveGroup g;
   Array<FacesMaterial> faceMaterials { };
   ctx.meshFaceMaterials[(uintptr)mesh] = faceMaterials;

   mesh.UnapplyTranslucency(null);

   for(g = mesh.groups.first; g; g = g.next)
      if(!g.type.hide)
         nFaces += getFacesCount(g);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i;
      int count = getFacesCount(g);
      int materialID = 0;
      Material mat = g.material;

      if(g.type.hide) continue;

      if(mat)
      {
         for(i = 0; i < ctx.materials.count; i++)
            if(ctx.materials[i] == mat)
               break;
         if(i < ctx.materials.count)
            materialID = i + 1;
         else
         {
            ctx.materials.size++;
            materialID = ctx.materials.count;
            ctx.materials[materialID-1] = mat;

            prepareTexture(ctx, mat.baseMap, mat.flags.translucent | mat.flags.partlyTransparent);
            prepareTexture(ctx, mat.bumpMap, false);
            prepareTexture(ctx, mat.specularMap, false);
            prepareTexture(ctx, mat.reflectMap, false);
         }
      }
      if(faceMaterials.count && materialID == faceMaterials[faceMaterials.count-1].material)
         faceMaterials[faceMaterials.count-1].count += count;
      else
      {
         faceMaterials.size++;
         faceMaterials[faceMaterials.count-1] = { start, count, materialID };
      }
      start += count;
   }
}

struct FacesMaterial
{
   int start, count, material;
};

static void writeFaceMaterials(E3DWriteContext ctx, File f, Array<FacesMaterial> faceMaterials)
{
   f.Write(faceMaterials.array, sizeof(FacesMaterial), faceMaterials.count);
}

static void writeParts(E3DWriteContext ctx, File f, Array<MeshPart> parts)
{
   f.Write(parts.array, sizeof(MeshPart), parts.count);
}

static void writeDuplVerts(E3DWriteContext ctx, File f, Mesh mesh)
{
   Array<int> dupVerts = mesh.dupVerts;
   f.Write(dupVerts.array, sizeof(int), dupVerts.count);
}

static void writeMatrix(E3DWriteContext ctx, File f, Matrix matrix)
{
   int i;

   for(i = 0; i < 16; i++)
   {
      float v = (float)matrix.array[i];
      f.Write(&v, sizeof(float), 1);
   }
}

static void writeSkinBones(E3DWriteContext ctx, File f, Array<SkinBone> bones)
{
   byte count = (byte)bones.count;
   int i;

   f.Write(&count, sizeof(byte), 1);

   for(i = 0; i < count; i++)
   {
      writeString(ctx, f, bones[i].name); // name would need to identify parent skeleton...
      writeMatrix(ctx, f, bones[i].invBindMatrix);
   }
}

static void writeSkin(E3DWriteContext ctx, File f, MeshSkin skin)
{
   byte boneWeights = 0;

   // writeE3DBlock(ctx, f, skinName, skin.name, writeString);
   writeE3DBlock(ctx, f, skinBindMatrix, &skin.bindShapeMatrix, writeMatrix);
   writeE3DBlock(ctx, f, skinBones, skin.bones, writeSkinBones);
   writeE3DBlock(ctx, f, skinBoneWeights, &boneWeights, writeByte);
}

static void writeMorph(E3DWriteContext ctx, File f, MeshMorph morph)
{
   Mesh target = morph.target;
   int targetID = ctx.meshToID[(uintptr)target];
   int id = ctx.morphID;

   writeE3DBlock(ctx, f, morphID, &id, writeInt);
   writeE3DBlock(ctx, f, morphName, morph.name, writeString);
   writeE3DBlock(ctx, f, morphWeight, &morph.weight, writeFloat);
   writeE3DBlock(ctx, f, meshID, &targetID,  writeInt);
}

static void writeMorphs(E3DWriteContext ctx, File f, Array<MeshMorph> morphs)
{
   int nMorphs = morphs.count, i;

   f.Write(&nMorphs, sizeof(nMorphs), 1);
   for(i = 0; i < morphs.count; i++)
   {
      ctx.morphID = i;
      writeE3DBlock(ctx, f, morph, &morphs[i], writeMorph);
   }
}

static void writeMesh(E3DWriteContext ctx, File f, Mesh mesh)
{
   if(mesh)
   {
      int id = ctx.meshToID[(uintptr)mesh];
      Array<FacesMaterial> faceMaterials = ctx.meshFaceMaterials[(uintptr)mesh];

      writeE3DBlock(ctx, f, meshID,         &id, writeInt);
      writeE3DBlock(ctx, f, attributes,     mesh, writeAttributes);
      if(mesh.dupVerts && mesh.dupVerts.count)
         writeE3DBlock(ctx, f, meshDuplVerts,  mesh, writeDuplVerts);
      if(mesh.nVertices > 65536)
         writeE3DBlock(ctx, f, triFaces32,     mesh, writeTriFaces32);
      else
         writeE3DBlock(ctx, f, triFaces16,     mesh, writeTriFaces16);

      if(faceMaterials)
         writeE3DBlock(ctx, f, facesMaterials, faceMaterials, writeFaceMaterials);
      if(mesh.skin)
         writeE3DBlock(ctx, f, skin, mesh.skin, writeSkin);
      if(mesh.parts)
         writeE3DBlock(ctx, f, parts, mesh.parts, writeParts);
      if(mesh.morphs)
         writeE3DBlock(ctx, f, morphs, mesh.morphs, writeMorphs);
   }
}

void calculateMeshes(E3DWriteContext ctx, Object object)
{
   Object c;
   int oNodeID = ctx.nodeID++;

   ctx.objectToNodeID[(uintptr)object] = oNodeID;

   if(object.flags.mesh && object.mesh)
   {
      Mesh mesh = object.mesh;

      if(mesh.morphs)   // Require morphs to be first so they can be looked up
      {
         int i;
         for(i = 0; i < mesh.morphs.count; i++)
         {
            MeshMorph * morph = &mesh.morphs[i];
            Mesh target = morph->target;
            if(target && !ctx.meshToID[(uintptr)target])
            {
               ctx.meshToID[(uintptr)target] = ctx.allMeshes.count+1;
               ctx.allMeshes.size++;
               ctx.allMeshes[ctx.allMeshes.count-1] = target;
               // computeFacesMaterials(ctx, target);
            }
         }
      }

      if(!ctx.meshToID[(uintptr)mesh])
      {
         ctx.meshToID[(uintptr)mesh] = ctx.allMeshes.count+1;
         ctx.allMeshes.size++;
         ctx.allMeshes[ctx.allMeshes.count-1] = mesh;
         computeFacesMaterials(ctx, mesh);
      }
   }
   if(object.tracks->count)
   {
      ctx.allAnimatedObjects.size++;
      ctx.allAnimatedObjects[ctx.allAnimatedObjects.count-1] = object;
   }

   for(c = object.firstChild; c; c = c.next)
      calculateMeshes(ctx, c);
}

static void writeMeshes(E3DWriteContext ctx, File f, Object object)
{
   for(m : ctx.allMeshes)
      writeE3DBlock(ctx, f, mesh, m, writeMesh);
}

static struct TrackAndObject
{
   Object object;
   FrameTrack track;
};

static void writeTCBEase(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      f.Write(&track.keys[i].tension, sizeof(float), 1);
      f.Write(&track.keys[i].continuity, sizeof(float), 1);
      f.Write(&track.keys[i].bias, sizeof(float), 1);
      f.Write(&track.keys[i].easeFrom, sizeof(float), 1);
      f.Write(&track.keys[i].easeTo, sizeof(float), 1);
   }
}

static void writeFTKVector3Df(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
      f.Write(&track.keys[i].scaling.x, sizeof(float), 3);
}

static void writeFTKQuaternionf(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      Quaternion qd = track.keys[i].orientation;
      float q[4] = { (float)qd.w, (float)qd.x, (float)qd.y, (float)qd.z };
      f.Write(q, sizeof(float), 4);
   }
}

static void writeFTKFloat(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
      f.Write(&track.keys[i].roll, sizeof(float), 1);
}

static void writeFTKBool(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      byte hide = (byte)track.keys[i].hide;
      f.Write(&hide, sizeof(byte), 1);
   }
}

static void writeFTKMorph(E3DWriteContext ctx, File f, FrameTrack track)
{
   int i;

   writeInt(ctx, f, &track.morphIndex);
   for(i = 0; i < track.numKeys; i++)
      f.Write(&track.keys[i].weight, sizeof(float), 1);
}

static void writeAnimationTrack(E3DWriteContext ctx, File f, TrackAndObject to)
{
   FrameTrack track = to.track;
   Object object = to.object;
   uint nodeID = ctx.objectToNodeID[(uintptr)object];
   FrameTrackType type = track.type.type;
   byte loop = track.type.loop;
   int i;

   f.Write(&track.numKeys, sizeof(uint), 1);
   f.Write(&loop, sizeof(byte), 1);
   for(i = 0; i < track.numKeys; i++)
      f.Write(&track.keys[i].frame, sizeof(uint), 1);
   if(type == rYaw || type == rPitch || type == rRoll)
   {
      byte rotationOrder = (byte)object.rotationOrder;
      writeE3DBlock(ctx, f, ftkRotationOrder, &rotationOrder, writeByte);
   }

   writeE3DBlock(ctx, f, frameTCBEase, track, writeTCBEase);
   switch(type)
   {
      case position:    writeE3DBlock(ctx, f, ftkPosition,           track, writeFTKVector3Df); break;
      case scaling:     writeE3DBlock(ctx, f, ftkScaling,            track, writeFTKVector3Df); break;
      case rotation:    writeE3DBlock(ctx, f, ftkRotation,           track, writeFTKQuaternionf); break;
      case fov:         writeE3DBlock(ctx, f, ftkCameraFieldOfView,  track, writeFTKFloat); break;
      case roll:        writeE3DBlock(ctx, f, ftkCameraRoll,         track, writeFTKFloat); break;
      case colorChange: writeE3DBlock(ctx, f, ftkLightColor,         track, writeFTKVector3Df); break;
      case hotSpot:     writeE3DBlock(ctx, f, ftkLightHotSpot,       track, writeFTKFloat); break;
      case fallOff:     writeE3DBlock(ctx, f, ftkLightFallOff,       track, writeFTKFloat); break;
      case hide:        writeE3DBlock(ctx, f, ftkHide,               track, writeFTKBool); break;
      case morph:       writeE3DBlock(ctx, f, ftkMorph,              track, writeFTKMorph); break;
      case rYaw:        writeE3DBlock(ctx, f, ftkYaw,                track, writeFTKFloat); break;
      case rPitch:      writeE3DBlock(ctx, f, ftkPitch,              track, writeFTKFloat); break;
      case rRoll:       writeE3DBlock(ctx, f, ftkRoll,               track, writeFTKFloat); break;
   }
   // Needs to be last for now...
   writeE3DBlock(ctx, f, E3DBlockType::nodeID, &nodeID, writeInt);
}

static void writeAnimationFrames(E3DWriteContext ctx, File f, Object object)
{
   int frame = object.startFrame;
   f.Write(&frame, sizeof(int), 1);
   frame = object.endFrame;
   f.Write(&frame, sizeof(int), 1);
   frame = object.frame;
   f.Write(&frame, sizeof(int), 1);
}

static void writeAnimation(E3DWriteContext ctx, File f, Object object)
{
   // Only single animation for now...
   writeE3DBlock(ctx, f, animationFrames, object, writeAnimationFrames);

   for(o : ctx.allAnimatedObjects)
   {
      OldList * tracks = o.tracks;
      FrameTrack track;
      TrackAndObject to { o };

      for(track = (FrameTrack)tracks->first; track; track = (FrameTrack)((ListItem)track).next)
      {
         to.track = track;
         writeE3DBlock(ctx, f, animationTrack, &to, writeAnimationTrack);
      }
   }
}

static void writeAnimations(E3DWriteContext ctx, File f, Object object)
{
   writeE3DBlock(ctx, f, animation, object, writeAnimation);
}

static void writeVector3D(E3DWriteContext ctx, File f, Vector3D v)
{
   f.Write(v, sizeof(Vector3D), 1);
}

static void writeVector3Df(E3DWriteContext ctx, File f, Vector3Df v)
{
   f.Write(v, sizeof(Vector3Df), 1);
}

static void writeQuaternion(E3DWriteContext ctx, File f, Quaternion v)
{
   f.Write(v, sizeof(Quaternion), 1);
}

static struct SkeletonInfo
{
   Object skeleton;
   bool writeTag;
};

static void writeSkeleton(E3DWriteContext ctx, File f, SkeletonInfo info)
{
   Object skeleton = info.skeleton;
   int skeletonID = ctx.objectToNodeID[(uintptr)skeleton];
   char * tag = skeleton.tag;
   writeInt(ctx, f, &skeletonID);
   writeString(ctx, f, info.writeTag && tag ? tag : "");
}

static void writeObject(E3DWriteContext ctx, File f, Object object)
{
   int oNodeID = ctx.objectToNodeID[(uintptr)object];

   writeE3DBlock(ctx, f, nodeID, &oNodeID, writeInt);
   if(object.name)
      writeE3DBlock(ctx, f, nodeName, (void *)object.name, writeString);

   if(object.mesh)
   {
      int id = ctx.meshToID[(uintptr)object.mesh];
      MeshSkin skin = object.mesh.skin;

      writeE3DBlock(ctx, f, meshID, &id, writeInt);

      if(skin && skin.bones.count)
      {
         Object skeleton = null;
         int i;
         for(i = 0; i < skin.bones.count; i++)
         {
            skeleton = skin.bones[i].object;
            if(skeleton)
               break;
         }

         // FIXME: Improve on skeleton root identification
         while(skeleton && // Skeleton
               skeleton.parent && // RootNode
               skeleton.parent.parent && // top-level
               skeleton.parent.parent.parent) // need to go up
            skeleton = skeleton.parent;
         if(skeleton)
         {
            SkeletonInfo skeletonInfo { skeleton, i == 0 };
            writeE3DBlock(ctx, f, E3DBlockType::skeleton, &skeletonInfo, writeSkeleton);
         }
      }
   }
   if(object.transform.scaling.x != 1 || object.transform.scaling.y != 1 || object.transform.scaling.z != 1)
      writeE3DBlock(ctx, f, scaling,     object.transform.scaling,     writeVector3Df);
   if(object.transform.orientation.w != 1 || object.transform.orientation.x || object.transform.orientation.y || object.transform.orientation.z)
      writeE3DBlock(ctx, f, orientation, object.transform.orientation, writeQuaternion);
   if(object.transform.position.x || object.transform.position.y || object.transform.position.z)
      writeE3DBlock(ctx, f, position,    object.transform.position,    writeVector3D);
   if(object.firstChild)
   {
      Object o;
      for(o = object.firstChild; o; o = o.next)
      {
         if(o.flags.mesh)
            writeE3DBlock(ctx, f, meshNode, o, writeObject);
         else if(o.flags.camera)
            writeE3DBlock(ctx, f, cameraNode, o, writeObject);
         else if(o.flags.light)
            writeE3DBlock(ctx, f, lightNode, o, writeObject);
         else
            writeE3DBlock(ctx, f, meshNode /*object*/, o, writeObject);  // REVIEW: This is what seems to work right now for E3DRead
      }
   }
}

static void writeObjects(E3DWriteContext ctx, File f, Object object)
{
   writeE3DBlock(ctx, f, meshNode, object, writeObject);
}

struct MaterialInfo
{
   Material material;
   int id;
};

static void writeMaterials(E3DWriteContext ctx, File f, Object object)
{
   // Write Groups (number of layers, map sizes)

   // Write Material Descriptions
   int id = 1;
   for(m : ctx.materials)
   {
      MaterialInfo info { m, id++ };
      writeE3DBlock(ctx, f, material, info, writeMaterial);
   }
}

static void writeByte(E3DWriteContext ctx, File f, byte * data)
{
   f.Write(data, sizeof(byte), 1);
}

static void writeInt(E3DWriteContext ctx, File f, int * data)
{
   f.Write(data, sizeof(int), 1);
}

static void writeFloat(E3DWriteContext ctx, File f, float * data)
{
   f.Write(data, sizeof(float), 1);
}

static void writeTextureID(E3DWriteContext ctx, File f, int * data)
{
   writeE3DBlock(ctx, f, textureID, data, writeInt);
}

static void writeMaterial(E3DWriteContext ctx, File f, MaterialInfo info)
{
   Material material = info.material;
   int group = 0;
   MaterialFlags flags = material.flags;
   E3DMaterialFlags mFlags { flags.doubleSided, flags.partlyTransparent, flags.translucent, flags.tile, flags.tile };
   writeE3DBlock(ctx, f, materialID,  &info.id, writeInt);
   if(group)
      writeE3DBlock(ctx, f, materialGroup, &group, writeInt);
   writeE3DBlock(ctx, f, materialFlags, &mFlags, writeInt);
   if(material.opacity < 1)
      writeE3DBlock(ctx, f, opacity, &material.opacity, writeInt);
   if(material.emissive.r != 0 || material.emissive.g != 0 || material.emissive.b != 0)
      writeE3DBlock(ctx, f, emissive, &material.emissive, writeColorRGB);
   if(material.bumpMap)
   {
      int bumpMapID = ctx.texturesToID[(uintptr)material.bumpMap];
      writeE3DBlock(ctx, f, normalMap, &bumpMapID, writeTextureID);
   }

   if(material.power) writeE3DBlock(ctx, f, phongShininess, &material.power, writeInt);
   if(material.diffuse.r != 1 || material.diffuse.g != 1 || material.diffuse.b != 1)
      writeE3DBlock(ctx, f, diffuse, &material.diffuse, writeColorRGB);
   if(material.specular.r != 0 || material.specular.g != 0 || material.specular.b != 0)
      writeE3DBlock(ctx, f, specular, &material.specular, writeColorRGB);
   if(material.ambient.r != material.diffuse.r ||
      material.ambient.g != material.diffuse.g ||
      material.ambient.b != material.diffuse.b)
      writeE3DBlock(ctx, f, ambient, &material.ambient, writeColorRGB);
   if(material.baseMap)
   {
      int diffuseID = ctx.texturesToID[(uintptr)material.baseMap];
      writeE3DBlock(ctx, f, phongDiffuseMap, &diffuseID, writeTextureID);
   }
   if(material.specularMap)
   {
      int specularID = ctx.texturesToID[(uintptr)material.specularMap];
      writeE3DBlock(ctx, f, phongSpecularMap, &specularID, writeTextureID);
   }
}

static struct TextureInfo
{
   Bitmap texture;
   int id;
   bool usePNG;
};

static void writeJPG(E3DWriteContext ctx, File f, Bitmap srcTexture)
{
   TempFile tmp { };
   char fn[100];
   int quality = JPEG_QUALITY;
   Bitmap texture = srcTexture;

   sprintf(fn, "File://%p", tmp);
   if(srcTexture.bitmaps)
   {
      texture = { };
      texture.Copy(srcTexture.bitmaps[0]);
      texture.pixelFormat = pixelFormatRGBA;

      texture.driver = class(LFBDisplayDriver);
      texture.driverData = null;
   }
   if(texture.pixelFormat != pixelFormat888)
   {
      if(texture == srcTexture)
      {
         texture = { }, texture.Copy(srcTexture);
         texture.driverData = null;
      }
      texture.driver = class(LFBDisplayDriver);
      texture.Convert(null, pixelFormat888, null);
   }
   texture.Save(fn, "jpg", &quality);
   tmp.Seek(0, start);
   f.Write(tmp.buffer, 1, tmp.size);
   delete tmp;
   if(texture != srcTexture)
      delete texture;
}

static void writePNG(E3DWriteContext ctx, File f, Bitmap srcTexture)
{
   TempFile tmp { };
   char fn[100];
   Bitmap texture = srcTexture;
   sprintf(fn, "File://%p", tmp);
   if(srcTexture.bitmaps)
   {
      texture = { };
      texture.Copy(srcTexture.bitmaps[0]);
      texture.pixelFormat = pixelFormatRGBA;

      texture.driver = class(LFBDisplayDriver);
      texture.driverData = null;
   }
   if(texture.pixelFormat != pixelFormatRGBA)
   {
      if(texture == srcTexture)
      {
         texture = { }, texture.Copy(srcTexture);
         texture.driverData = null;
      }
      texture.driver = class(LFBDisplayDriver);
      texture.Convert(null, pixelFormatRGBA, null);
   }
   texture.Save(fn, "png", null);
   tmp.Seek(0, start);
   f.Write(tmp.buffer, 1, tmp.size);
   delete tmp;
   if(texture != srcTexture)
      delete texture;
}

static void writeString(E3DWriteContext ctx, File f, const String s)
{
   uint16 len = s ? (uint16)strlen(s) : 0;
   f.Write(&len, sizeof(uint16), 1);
   f.Write(s, 1, len);
}

static int maxTexSize;

static void writeTexture(E3DWriteContext ctx, File f, TextureInfo info)
{
   writeE3DBlock(ctx, f, textureID, &info.id, writeInt);
   if(externalTextures || ctx.texturesPath)
   {
      char name[256];
      const char * ext = info.usePNG ? "png" : "jpg";
      // This must change to a callback or rely on a value in the context to
      // decide wether to actually write the external textures or not however,
      // other formats (e.g.: in assimp.ec) would need to be updated in the same
      // way. For now, althoug it is a magic value, we will consider
      // ctx.texturesPrefix == "." as a sign that we do not want to really output
      // the textures and only the file name without extension and resolution
      // should be stored in the model.
      bool writeExternalTextures = !(ctx.texturesPath && !strcmp(ctx.texturesPath, "."));  // Should we also check for ""?
      if(!writeExternalTextures)
         sprintf(name, "%d", info.id);
      else if(maxTexSize && info.texture.width > maxTexSize && info.texture.height > maxTexSize)
         // Currently any value of ctx.texturesPrefix other than "." is used as the path to the modelID (even "")
         sprintf(name, "%s/%d-%d.%s", ctx.texturesPath ? ctx.texturesPath: "textures", info.id, maxTexSize, ext);
      else
         sprintf(name, "%s/%d.%s", ctx.texturesPath ? ctx.texturesPath: "textures", info.id, ext);

      writeE3DBlock(ctx,f, textureName, name, writeString);

      // TODO: review this condition if externalTextures is switched to true;
      if(writeExternalTextures && info.id - 1 >= ctx.firstTexture)
      {
         for(maxTexSize : [0, 512, 256])
         {
            int quality = JPEG_QUALITY;
            PixelFormat wantedFormat = info.usePNG ? pixelFormatRGBA : pixelFormat888;
            char path[MAX_LOCATION];
            Bitmap texture { };

            texture.Copy(info.texture.bitmaps ? info.texture.bitmaps[0] : info.texture);
            if(info.texture.bitmaps)
               texture.pixelFormat = pixelFormatRGBA;

            strcpy(path, ctx.path);
            PathCat(path, ctx.texturesPath ? ctx.texturesPath: "textures");
            if(maxTexSize && texture.width > maxTexSize && texture.height > maxTexSize)
               sprintf(name, "%d-%d.%s", info.id, maxTexSize, ext);
            else
               sprintf(name, "%d.%s", info.id, ext);
            MakeDir(path);
            PathCat(path, name);

            if(maxTexSize && texture.width > maxTexSize && texture.height > maxTexSize)
            {
               texture = resizeTexture(texture, maxTexSize);
            }

            if(texture.pixelFormat != wantedFormat)
            {
               void * back = texture.driver;
               texture.driver = class(LFBDisplayDriver);
               texture.Convert(null, wantedFormat, null);
               texture.driver = back;
            }
            texture.Save(path, ext, info.usePNG ? null : &quality);

            delete texture;
         }
      }
   }
   else
      writeE3DBlock(ctx, f, info.usePNG ? texturePNG : textureJPG, info.texture, info.usePNG ? writePNG : writeJPG);
}

static void writeTextures(E3DWriteContext ctx, File f, Object object)
{
   for(i : ctx.texUsed)
   {
      uint id = i;
      bool usePNG = ctx.texUsePNG[id-1];
      TextureInfo info { ctx.textures[id - 1], id, usePNG };
      writeE3DBlock(ctx, f, texture, info, writeTexture);
   }
}

static void writeVersion(E3DWriteContext ctx, File f, Object object)
{
   uint16 version = 0x0100;
   f.Write("E3DF", 1, 4);
   f.Write(&version, sizeof(uint16), 1);
}

static Bitmap resizeTexture(Bitmap bitmap, int size)
{
   // Pre process the bitmap... First make it 32 bit
   if((bitmap.width > size && bitmap.height > size) && bitmap.Convert(null, pixelFormat888, null))
   {
      uint w = bitmap.width, h = bitmap.height;
      w = Min(w, size);
      h = Min(h, size);

      if(bitmap.width != w || bitmap.height != h)
      {
         Bitmap mipMap { };
         if(mipMap.Allocate(null, w, h, w, bitmap.pixelFormat, false))
         {
            Surface mipSurface = mipMap.GetSurface(0,0,null);
            mipSurface.blend = false;
            mipSurface.Filter(bitmap, 0,0,0,0, w, h, bitmap.width, bitmap.height);
            delete mipSurface;
            delete bitmap.picture;
            bitmap.picture = mipMap.picture;
            bitmap.size = mipMap.size;
            bitmap.stride = mipMap.stride;
            bitmap.width = mipMap.width;
            bitmap.height = mipMap.height;
            bitmap.sizeBytes = mipMap.sizeBytes;
            mipMap.picture = null;
            //delete mipMap;
            //delete bitmap;
            //bitmap = mipMap;
         }
         //else
         delete mipMap;
      }
   }
   return bitmap;
}
