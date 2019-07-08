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

bool externalTextures = true; //false;
int JPEG_QUALITY = 75;
bool compressed = true;

#define Bool __Bool
#include <LzmaLib.h>
#undef Bool

Map<uintptr, int> texturesToID { };
Map<uintptr, Array<FacesMaterial>> meshFaceMaterials { };
Array<Material> materials { };
Array<Mesh> allMeshes { };
Map<uintptr, int> meshToID { };
Array<Bitmap> textures { };
Array<bool> texUsePNG { };
int firstTexture;
AVLTree<int> texUsed { };

char e3dModelsPath[MAX_LOCATION];

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

void writeE3D(File f, Object object)
{
   Array<BlockInfo> mainBlocks { };
   calculateMeshes(object);
   writeE3DBlock(f, version,   object, writeVersion);
   if(textures.count)
      mainBlocks.Add({ textures,  object, writeTextures });
   if(materials.count)
      mainBlocks.Add({ materials,  object, writeMaterials });
   if(allMeshes.count)
      mainBlocks.Add({ meshes,  object, writeMeshes });
   mainBlocks.Add({ nodes,  object, writeObjects });

   if(!compressed)
      for(b : mainBlocks)
         writeE3DBlock(f, b.type, b.data, b.fn);
   else
      writeLZMA(f, mainBlocks);

   delete mainBlocks;

   materials.RemoveAll();
   allMeshes.RemoveAll();
   //textures.RemoveAll();

   // texturesToID.Free();
   meshFaceMaterials.Free();
   meshToID.Free();
   //texUsePNG.Free();

   firstTexture = textures.count;
   texUsed.Free();
}

static void writeE3DBlock(File f, E3DBlockType type, void * data, void (* fn)(File f, void * data))
{
   uint64 pos = f.Tell();
   E3DBlockHeader header { type = type };
   f.Write(&header, sizeof(header), 1);
   fn(f, data);
   header.size = (uint)(f.Tell() - pos);
   f.Seek(pos, start);
   f.Write(&header, sizeof(header), 1);
   f.Seek(pos + header.size, start);
}

struct BlockInfo
{
   E3DBlockType type;
   void * data;
   void (* fn)(File f, void * data);
};

static void writeLZMA(File f, Container<BlockInfo> infos)
{
   TempFile tmp { };
   E3DBlockHeader header { type = lzma };
   byte * cData;
   uint size = 0, cSize = 0;
   for(i : infos)
      writeE3DBlock(tmp, i.type, i.data, i.fn);
   size = tmp.size;
   cData = encodeLZMA(tmp.buffer, size, &cSize, null);
   delete tmp;
   header.size = sizeof(E3DBlockHeader) + sizeof(uint) + cSize;
   f.Write(&header, sizeof(header), 1);
   f.Write(&size, sizeof(uint), 1);
   f.Write(cData, cSize, 1);
   delete cData;
}

static void writeAttributes(File f, Mesh mesh)
{
   int nVertices = mesh.nVertices;
   f.Write(&nVertices, sizeof(nVertices), 1);
   writeE3DBlock(f, attrInterleaved, mesh, writeInterleaved);
}

static void writeColor(File f, ColorRGBAf c)
{
   struct { byte r, g, b, a; } color;
   color.r = (byte)Max(0, Min(255, (int)(c.r * 255)));
   color.g = (byte)Max(0, Min(255, (int)(c.g * 255)));
   color.b = (byte)Max(0, Min(255, (int)(c.b * 255)));
   color.a = (byte)Max(0, Min(255, (int)(c.a * 255)));
   f.Write(&color, sizeof(color), 1);
}

static void writeColorRGB(File f, ColorRGB c)
{
   f.Write(c, sizeof(ColorRGB), 1);
}

static void writeInterleaved(File f, Mesh mesh)
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
   if(features.vertices)
   {
      vertices = mesh.vertices;
      type = attrVertices;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 12;
   }
   if(features.normals)
   {
      normals = mesh.normals;
      type = attrNormals;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 4;
   }
   if(features.texCoords1)
   {
      texCoords = mesh.texCoords;
      type = attrTexCoords;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 8;
   }
   if(features.colors)
   {
      colors = mesh.colors;
      type = attrColors;
      f.Write(&type, sizeof(E3DBlockType), 1);
      f.Write(&vSize, sizeof(uint16), 1);
      vSize += 4;
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
   }
   type = 0;
   f.Write(&type, sizeof(E3DBlockType), 1);
   f.Write(&vSize, sizeof(uint16), 1);

   for(i = 0; i < nVertices; i++)
   {
      if(vertices)
         f.Write(&vertices[i], sizeof(Vector3Df), 1);
      if(normals)
      {
         uint32 n = vecfPack10i(normals[i], null);
         f.Write(&n, sizeof(uint), 1);
      }
      if(texCoords)
         f.Write(&texCoords[i], sizeof(Pointf), 1);
      if(features.colors)
         writeColor(f, colors[i]);
      if(features.tangents)
      {
         /*
         uint32 n = vecfPack10i(tangents[2*i], tangents[2*i+1]);
         f.Write(&n, sizeof(uint), 1);
         */
         uint32 n = vecfPack10i(tangents[2*i+0], null);
         uint32 b = vecfPack10i(tangents[2*i+1], null);
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

static void writeTriFaces16(File f, Mesh mesh)
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

static void writeTriFaces32(File f, Mesh mesh)
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

static void prepareTexture(Bitmap tex, bool usePNG)
{
   if(tex)
   {
      int texID = texturesToID[(uintptr)tex];
      if(!texID)
      {
         texID = textures.count+1;
         textures.size++;
         texUsePNG.size++;
         texUsePNG[textures.count-1] = usePNG;
         textures[textures.count-1] = tex;
         texturesToID[(uintptr)tex] = texID;
      }
      texUsed.Add(texID);
   }
}

static void computeFacesMaterials(Mesh mesh)
{
   int nFaces = 0;
   int start = 0;
   PrimitiveGroup g;
   Array<FacesMaterial> faceMaterials { };
   meshFaceMaterials[(uintptr)mesh] = faceMaterials;

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
         for(i = 0; i < materials.count; i++)
            if(materials[i] == mat)
               break;
         if(i < materials.count)
            materialID = i + 1;
         else
         {
            materials.size++;
            materialID = materials.count;
            materials[materialID-1] = mat;

            if(g.material)
            {
               prepareTexture(mat.baseMap, mat.flags.translucent | mat.flags.partlyTransparent);
               prepareTexture(mat.bumpMap, false);
               prepareTexture(mat.specularMap, false);
               prepareTexture(mat.reflectMap, false);
            }
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

static void writeFaceMaterials(File f, Mesh mesh)
{
   Array<FacesMaterial> faceMaterials = meshFaceMaterials[(uintptr)mesh];
   //PrimitiveGroup g;
   //for(g = mesh.groups.first; g; g = g.next)
   f.Write(faceMaterials.array, sizeof(FacesMaterial), faceMaterials.count);
}

static void writeParts(File f, Mesh mesh)
{
   Array<MeshPart> parts = mesh.parts;
   f.Write(parts.array, sizeof(MeshPart), parts.count);
}

static void writeMesh(File f, Mesh mesh)
{
   if(mesh)
   {
      int id = meshToID[(uintptr)mesh];
      writeE3DBlock(f, meshID,         &id,  writeInt);
      writeE3DBlock(f, attributes,     mesh, writeAttributes);
      if(mesh.nVertices > 65536)
         writeE3DBlock(f, triFaces32,     mesh, writeTriFaces32);
      else
         writeE3DBlock(f, triFaces16,     mesh, writeTriFaces16);
      writeE3DBlock(f, facesMaterials, mesh, writeFaceMaterials);
      if(mesh.parts)
         writeE3DBlock(f, parts,          mesh, writeParts);
   }
}

void calculateMeshes(Object object)
{
   Object c;
   if(object.flags.mesh && object.mesh)
   {
      Mesh mesh = object.mesh;
      if(!meshToID[(uintptr)mesh])
      {
         meshToID[(uintptr)mesh] = allMeshes.count+1;
         allMeshes.size++;
         allMeshes[allMeshes.count-1] = mesh;
         computeFacesMaterials(mesh);
      }
   }
   for(c = object.firstChild; c; c = c.next)
      calculateMeshes(c);
}

static void writeMeshes(File f, Object object)
{
   for(m : allMeshes)
      writeE3DBlock(f, mesh, m, writeMesh);
}

static void writeVector3D(File f, Vector3D v)
{
   f.Write(v, sizeof(Vector3D), 1);
}

static void writeVector3Df(File f, Vector3Df v)
{
   f.Write(v, sizeof(Vector3Df), 1);
}

static void writeQuaternion(File f, Quaternion v)
{
   f.Write(v, sizeof(Quaternion), 1);
}

static void writeObject(File f, Object object)
{
   if(object.mesh)
   {
      int id = meshToID[(uintptr)object.mesh];
      writeE3DBlock(f, meshID, &id, writeInt);
   }
   if(object.transform.scaling.x != 1 || object.transform.scaling.y != 1 || object.transform.scaling.z != 1)
      writeE3DBlock(f, scaling,     object.transform.scaling,     writeVector3Df);
   if(object.transform.orientation.w != 1 || object.transform.orientation.x || object.transform.orientation.y || object.transform.orientation.z)
      writeE3DBlock(f, orientation, object.transform.orientation, writeQuaternion);
   if(object.transform.position.x || object.transform.position.y || object.transform.position.z)
      writeE3DBlock(f, position,    object.transform.position,    writeVector3D);
   if(object.firstChild)
   {
      Object o;
      for(o = object.firstChild; o; o = o.next)
         writeE3DBlock(f, meshNode, o, writeObject);
   }
}

static void writeObjects(File f, Object object)
{
   writeE3DBlock(f, meshNode, object, writeObject);
}

struct MaterialInfo
{
   Material material;
   int id;
};

static void writeMaterials(File f, Object object)
{
   // Write Groups (number of layers, map sizes)

   // Write Material Descriptions
   int id = 1;
   for(m : materials)
   {
      MaterialInfo info { m, id++ };
      writeE3DBlock(f, material, info, writeMaterial);
   }
}

static void writeInt(File f, int * data)
{
   f.Write(data, sizeof(int), 1);
}

static void writeTextureID(File f, int * data)
{
   writeE3DBlock(f, textureID, data, writeInt);
}

static void writeMaterial(File f, MaterialInfo info)
{
   Material material = info.material;
   int group = 0;
   MaterialFlags flags = material.flags;
   E3DMaterialFlags mFlags { flags.doubleSided, flags.partlyTransparent, flags.translucent, flags.tile, flags.tile };
   writeE3DBlock(f, materialID,  &info.id, writeInt);
   if(group)
      writeE3DBlock(f, materialGroup, &group, writeInt);
   writeE3DBlock(f, materialFlags, &mFlags, writeInt);
   if(material.opacity < 1)
      writeE3DBlock(f, opacity, &material.opacity, writeInt);
   if(material.emissive.r != 1 || material.emissive.g != 1 || material.emissive.b != 1)
      writeE3DBlock(f, emissive, &material.emissive, writeColorRGB);
   if(material.bumpMap)
   {
      int bumpMapID = texturesToID[(uintptr)material.bumpMap];
      writeE3DBlock(f, normalMap, &bumpMapID, writeTextureID);
   }

   if(material.power) writeE3DBlock(f, phongShininess, &material.power, writeInt);
   if(material.diffuse.r != 1 || material.diffuse.g != 1 || material.diffuse.b != 1)
      writeE3DBlock(f, diffuse, &material.diffuse, writeColorRGB);
   if(material.specular.r != 0 || material.specular.g != 0 || material.specular.b != 0)
      writeE3DBlock(f, specular, &material.specular, writeColorRGB);
   if(material.ambient.r != material.diffuse.r ||
      material.ambient.g != material.diffuse.g ||
      material.ambient.b != material.diffuse.b)
      writeE3DBlock(f, ambient, &material.ambient, writeColorRGB);
   if(material.baseMap)
   {
      int diffuseID = texturesToID[(uintptr)material.baseMap];
      writeE3DBlock(f, phongDiffuseMap, &diffuseID, writeTextureID);
   }
   if(material.specularMap)
   {
      int specularID = texturesToID[(uintptr)material.specularMap];
      writeE3DBlock(f, phongSpecularMap, &specularID, writeTextureID);
   }
}

static struct TextureInfo
{
   Bitmap texture;
   int id;
   bool usePNG;
};

static void writeJPG(File f, Bitmap texture)
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

static void writePNG(File f, Bitmap texture)
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

static void writeString(File f, const String s)
{
   uint16 len = s ? (uint16)strlen(s) : 0;
   f.Write(&len, sizeof(uint16), 1);
   f.Write(s, 1, len);
}

// char e3dModelsPath[MAX_LOCATION];

int maxTexSize;

static void writeTexture(File f, TextureInfo info)
{
   writeE3DBlock(f, textureID, &info.id, writeInt);
   if(externalTextures)
   {
      char name[256];
      const char * ext = info.usePNG ? "png" : "jpg";

      if(maxTexSize && info.texture.width > maxTexSize && info.texture.height > maxTexSize)
         sprintf(name, "textures/%d-%d.%s", info.id, maxTexSize, ext);
      else
         sprintf(name, "textures/%d.%s", info.id, ext);
      writeE3DBlock(f, textureName, name, writeString);

      if(info.id - 1 >= firstTexture)
      {
         for(maxTexSize : [0, 512, 256])
         {
            int quality = JPEG_QUALITY;
            PixelFormat wantedFormat = info.usePNG ? pixelFormatRGBA : pixelFormat888;
            char path[MAX_LOCATION];

            strcpy(path, e3dModelsPath);
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
      writeE3DBlock(f, info.usePNG ? texturePNG : textureJPG, info.texture, info.usePNG ? writePNG : writeJPG);
}

static void writeTextures(File f, Object object)
{
   int id = 1;
   int i;
   for(i = 0; i < textures.count; i++)
   {
      if(texUsed.Find(id))
      {
         bool usePNG = texUsePNG[id-1];
         TextureInfo info { textures[i], id, usePNG };
         writeE3DBlock(f, texture, info, writeTexture);
      }
      id++;
   }
}

static void writeVersion(File f, Object object)
{
   uint16 version = 0x0100;
   f.Write("E3DF", 1, 4);
   f.Write(&version, sizeof(uint16), 1);
}

Bitmap resizeTexture(Bitmap bitmap, int size)
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
