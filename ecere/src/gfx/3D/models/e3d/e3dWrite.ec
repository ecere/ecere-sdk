#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "e3dDefs"

struct E3DBlockHeader
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

class E3DWriteContext : struct
{
   char path[MAX_LOCATION];
   Map<uintptr, int> texturesToID { };
   Map<uintptr, Array<FacesMaterial>> meshFaceMaterials { };
   Array<Material> materials { };
   Array<Mesh> allMeshes { };
   Map<uintptr, int> meshToID { };
   Array<Bitmap> textures { };
   Array<bool> texUsePNG { };
   int firstTexture;
   AVLTree<int> texUsed { };

   // To keep IDs consistent between models.
   Map<uint, Bitmap> texturesByID;

   ~E3DWriteContext()
   {
      materials.RemoveAll();
      allMeshes.RemoveAll();
      meshFaceMaterials.Free();
      meshToID.Free();

      // NOTE: These may have been kept around to re-use textures...
      textures.RemoveAll();
      texturesToID.Free();
      texUsePNG.Free();
   }
};

static byte * encodeLZMA(byte * data, uint size, uint * encodedSize, void * options)
{
   size_t destLen = (unsigned long)(size + size / 1000 + 12);
   byte * compressed = new byte[5+destLen];
   if(compressed)
   {
      size_t outPropsSize = LZMA_PROPS_SIZE;
      LzmaCompress(compressed + LZMA_PROPS_SIZE, &destLen, data, size, compressed, &outPropsSize,
            9, 1 << 26, 4, 4, 4, 64, 1);
      *encodedSize = (uint)destLen + LZMA_PROPS_SIZE;
   }
   return compressed;
}

void writeE3D(File f, Object object, E3DWriteContext ctx)
{
   Array<BlockInfo> mainBlocks { };

   calculateMeshes(ctx, object);
   writeE3DBlock(ctx, f, version,   object, writeVersion);
   if(ctx.textures.count)
      mainBlocks.Add({ textures,  object, writeTextures });
   if(ctx.materials.count)
      mainBlocks.Add({ materials,  object, writeMaterials });
   if(ctx.allMeshes.count)
      mainBlocks.Add({ meshes,  object, writeMeshes });
   mainBlocks.Add({ nodes,  object, writeObjects });

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
   E3DBlockHeader header { type = lzma };
   byte * cData;
   uint size = 0, cSize = 0;
   for(i : infos)
      writeE3DBlock(ctx, tmp, i.type, i.data, i.fn);
   size = tmp.size;
   cData = encodeLZMA(tmp.buffer, size, &cSize, null);
   delete tmp;
   header.size = sizeof(E3DBlockHeader) + sizeof(uint) + cSize;
   f.Write(&header, sizeof(header), 1);
   f.Write(&size, sizeof(uint), 1);
   f.Write(cData, cSize, 1);
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
   MeshFeatures features = mesh.flags & ~MeshFeatures { /*tangents = true, */colors = true };   // TWEAKED: Don't write tangents, colors for FLT's
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

   if(features.vertices)
   {
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
   }
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
      nFaces += getFacesCount(g);

   f.Write(&nFaces, sizeof(nFaces), 1);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i, gn = g.nIndices;
      if(g.type.indices32bit)
      {
         uint32 * indices = g.indices32;
         if(g.type.sharedIndices)
            indices = mesh.indices + g.baseIndex;

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
            indices = ((uint16 *)mesh.indices) + g.baseIndex;

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
      nFaces += getFacesCount(g);

   f.Write(&nFaces, sizeof(nFaces), 1);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i, gn = g.nIndices;
      if(g.type.indices32bit)
      {
         uint32 * indices = g.type.sharedIndices && mesh.indices ? mesh.indices + g.baseIndex : g.indices32;
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
         texID = ctx.textures.count+1;
         ctx.textures.size++;
         ctx.texUsePNG.size++;
         ctx.texUsePNG[ctx.textures.count-1] = usePNG;
         ctx.textures[ctx.textures.count-1] = tex;
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
      nFaces += getFacesCount(g);
   for(g = mesh.groups.first; g; g = g.next)
   {
      // Assuming triangles for now
      int i;
      int count = getFacesCount(g);
      int materialID = 0;
      Material mat = g.material;
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

static void writeFaceMaterials(E3DWriteContext ctx, File f, Mesh mesh)
{
   Array<FacesMaterial> faceMaterials = ctx.meshFaceMaterials[(uintptr)mesh];
   //PrimitiveGroup g;
   //for(g = mesh.groups.first; g; g = g.next)
   f.Write(faceMaterials.array, sizeof(FacesMaterial), faceMaterials.count);
}

static void writeParts(E3DWriteContext ctx, File f, Mesh mesh)
{
   Array<MeshPart> parts = mesh.parts;
   f.Write(parts.array, sizeof(MeshPart), parts.count);
}

static void writeMesh(E3DWriteContext ctx, File f, Mesh mesh)
{
   if(mesh)
   {
      int id = ctx.meshToID[(uintptr)mesh];
      writeE3DBlock(ctx, f, meshID,         &id,  writeInt);
      writeE3DBlock(ctx, f, attributes,     mesh, writeAttributes);
      if(mesh.nVertices > 65536)
         writeE3DBlock(ctx, f, triFaces32,     mesh, writeTriFaces32);
      else
         writeE3DBlock(ctx, f, triFaces16,     mesh, writeTriFaces16);
      writeE3DBlock(ctx, f, facesMaterials, mesh, writeFaceMaterials);
      if(mesh.parts)
         writeE3DBlock(ctx, f, parts,          mesh, writeParts);
   }
}

void calculateMeshes(E3DWriteContext ctx, Object object)
{
   Object c;
   if(object.flags.mesh && object.mesh)
   {
      Mesh mesh = object.mesh;
      if(!ctx.meshToID[(uintptr)mesh])
      {
         ctx.meshToID[(uintptr)mesh] = ctx.allMeshes.count+1;
         ctx.allMeshes.size++;
         ctx.allMeshes[ctx.allMeshes.count-1] = mesh;
         computeFacesMaterials(ctx, mesh);
      }
   }
   for(c = object.firstChild; c; c = c.next)
      calculateMeshes(ctx, c);
}

static void writeMeshes(E3DWriteContext ctx, File f, Object object)
{
   for(m : ctx.allMeshes)
      writeE3DBlock(ctx, f, mesh, m, writeMesh);
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

static void writeObject(E3DWriteContext ctx, File f, Object object)
{
   if(object.mesh)
   {
      int id = ctx.meshToID[(uintptr)object.mesh];
      writeE3DBlock(ctx, f, meshID, &id, writeInt);
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
         writeE3DBlock(ctx, f, meshNode, o, writeObject);
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

static void writeInt(E3DWriteContext ctx, File f, int * data)
{
   f.Write(data, sizeof(int), 1);
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
   if(material.emissive.r != 1 || material.emissive.g != 1 || material.emissive.b != 1)
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

static void writeJPG(E3DWriteContext ctx, File f, Bitmap texture)
{
   TempFile tmp { };
   char fn[100];
   int quality = JPEG_QUALITY;
   sprintf(fn, "File://%p", tmp);
   if(texture.pixelFormat != pixelFormat888)
   {
      void * back = texture.driver;
      texture.driver = class(LFBDisplayDriver);
      texture.Convert(null, pixelFormat888, null);
      texture.driver = back;
   }
   texture.Save(fn, "jpg", &quality);
   tmp.Seek(0, start);
   f.Write(tmp.buffer, 1, tmp.size);
   delete tmp;
}

static void writePNG(E3DWriteContext ctx, File f, Bitmap texture)
{
   TempFile tmp { };
   char fn[100];
   sprintf(fn, "File://%p", tmp);
   if(texture.pixelFormat != pixelFormatRGBA)
   {
      void * back = texture.driver;
      texture.driver = class(LFBDisplayDriver);
      texture.Convert(null, pixelFormatRGBA, null);
      texture.driver = back;
   }
   texture.Save(fn, "png", null);
   tmp.Seek(0, start);
   f.Write(tmp.buffer, 1, tmp.size);
   delete tmp;
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
   if(externalTextures)
   {
      char name[256];
      const char * ext = info.usePNG ? "png" : "jpg";

      if(maxTexSize && info.texture.width > maxTexSize && info.texture.height > maxTexSize)
         sprintf(name, "textures/%d-%d.%s", info.id, maxTexSize, ext);
      else
         sprintf(name, "textures/%d.%s", info.id, ext);
      writeE3DBlock(ctx,f, textureName, name, writeString);

      if(info.id - 1 >= ctx.firstTexture)
      {
         for(maxTexSize : [0, 512, 256])
         {
            int quality = JPEG_QUALITY;
            PixelFormat wantedFormat = info.usePNG ? pixelFormatRGBA : pixelFormat888;
            char path[MAX_LOCATION];

            strcpy(path, ctx.path);
            PathCat(path, "textures");
            if(maxTexSize && info.texture.width > maxTexSize && info.texture.height > maxTexSize)
               sprintf(name, "%d-%d.%s", info.id, maxTexSize, ext);
            else
               sprintf(name, "%d.%s", info.id, ext);
            MakeDir(path);
            PathCat(path, name);

            if(maxTexSize && info.texture.width > maxTexSize && info.texture.height > maxTexSize)
            {
               info.texture = resizeTexture(info.texture, maxTexSize);
            }

            if(info.texture.pixelFormat != wantedFormat)
            {
               void * back = info.texture.driver;
               info.texture.driver = class(LFBDisplayDriver);
               info.texture.Convert(null, wantedFormat, null);
               info.texture.driver = back;
            }
            info.texture.Save(path, ext, info.usePNG ? null : &quality);
         }
      }
   }
   else
      writeE3DBlock(ctx, f, info.usePNG ? texturePNG : textureJPG, info.texture, info.usePNG ? writePNG : writeJPG);
}

static void writeTextures(E3DWriteContext ctx, File f, Object object)
{
   int id = 1;
   int i;
   for(i = 0; i < ctx.textures.count; i++)
   {
      if(ctx.texUsed.Find(id))
      {
         bool usePNG = ctx.texUsePNG[id-1];
         TextureInfo info { ctx.textures[i], id, usePNG };
         writeE3DBlock(ctx, f, texture, info, writeTexture);
      }
      id++;
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
