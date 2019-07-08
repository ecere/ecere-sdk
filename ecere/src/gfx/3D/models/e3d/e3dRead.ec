#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "e3dDefs"

static struct E3DBlockHeader
{
   E3DBlockType type __attribute__((packed));
   uint32 size       __attribute__((packed));
};

#define Bool __Bool
#include <LzmaLib.h>
#undef Bool

static byte * decodeLZMA(byte * data, uint encodedSize, uint size, void * options)
{
   byte * uncompressed = new byte[size];
   if(uncompressed)
   {
      size_t encSize = encodedSize;
      size_t destLen = size;
      if(LzmaUncompress(uncompressed, &destLen, data + LZMA_PROPS_SIZE, &encSize, data, LZMA_PROPS_SIZE) != SZ_OK)
         return null;
   }
   return uncompressed;
}

static String readString(File f)
{
   uint16 len = 0;
   char * s = null;
   f.Read(&len, sizeof(uint16), 1);
   if(len)
   {
      s = new char[len+1];
      f.Read(s, 1, len);
      s[len] = 0;
   }
   return s;
}

// Right now this is global and requires a lock... Support supplying optional textures ID map ?
static Mutex texMutex { };

static class E3DContext : struct
{
   Map<uint, Bitmap> texturesByID;
   const String path;
   AVLTree<Material> materials;

   Map<uint, Material> materialsByID { };   // Right now this is per E3D... Support supplying optional materials map? Resolve later?
   Map<uint, Mesh> meshesByID { };
   Map<uint, bool> meshOwned { };
   const String texturesQuery;

   int curTextureID;
   bool positiveYUp;
}

static void readBlocks(E3DContext ctx, File f, DisplaySystem displaySystem, E3DBlockType containerType, uint64 pbStart, uint64 end, void * data)
{
   Object object = data; // data is most often the Mesh...
   Mesh mesh = data;
   uint64 pos = pbStart;
   static int indent = 0;
   indent++;
   while(end - pos >= sizeof(E3DBlockHeader))
   {
      E3DBlockHeader header;
      if(f.Read(&header, sizeof(E3DBlockHeader), 1) == 1)
      {
         uint64 bEnd = pos + header.size;
         bool readSubBlocks = false;
         void * subData = data;
#if 0 //def _DEBUG
         int i;
         for(i = 0; i < indent; i++) Print("   ");
         PrintLn(header.type, "(", header.size, " bytes)");
#endif

         pos += sizeof(E3DBlockHeader);

         switch(header.type)
         {
            case lzma:
            {
               uint cSize = (uint)(bEnd - pos - sizeof(uint)), size;
               byte * cData;
               TempFile tmp { };
               f.Read(&size, sizeof(uint), 1);
               cData = new byte[cSize]; //size];
               f.Read(cData, 1, cSize); //bEnd - pos);
               tmp.buffer = decodeLZMA(cData, cSize, size, null);
               tmp.size = size;
               readBlocks(ctx, tmp, displaySystem, containerType, 0, size, subData);
               delete cData;
               delete tmp;
               break;
            }
            case nodes:
            case meshes:
            case materials:
            case textures:
               readSubBlocks = true;
               break;
            case meshNode:
            {
               if(containerType == nodes)
               {
                  object.flags.root = true;
                  object.transform.orientation = { 1,0,0,0 };
                  object.transform.scaling = { 1,1,1 };
               }
               else
               {
                  Object o { };
                  object.Add(o);
                  subData = o;
                  o.transform.orientation = { 1,0,0,0 };
                  o.transform.scaling = { 1,1,1 };
               }
               readSubBlocks = true;
               break;
            }
            case scaling:
            {
               Vector3Df v;
               f.Read(&v, sizeof(Vector3Df), 1);
               object.transform.scaling = v;
               break;
            }
            case position:
            {
               Vector3D v;
               f.Read(&v, sizeof(Vector3D), 1);
               object.transform.position = v;
               if(ctx.positiveYUp)
                  v.y *= -1;
               break;
            }
            case orientation:
            {
               Quaternion v;
               f.Read(&v, sizeof(Quaternion), 1);
               object.transform.orientation = v;
               break;
            }
            case material:
            {
               Material mat { };
               *mat = *GetDefaultMaterial();
               mat.flags.separateSpecular = true;
               subData = mat;
               readSubBlocks = true;
               break;
            }
            case materialID:
            {
               int id = 0;
               f.Read(&id, sizeof(int), 1);
               ctx.materialsByID[id] = data;
               break;
            }
            case materialFlags:
            {
               Material mat = data;
               E3DMaterialFlags flags;
               f.Read(&flags, sizeof(uint), 1);
               mat.flags = { doubleSided = flags.doubleSided, translucent = flags.translucent,
                  tile = flags.wrapU || flags.wrapV, partlyTransparent = flags.partlyTransparent, setupTextures = true };
               // if(flags.wrapU != flags.wrapV) PrintLn("warning!");
               break;
            }
            case opacity: { Material mat = data; f.Read(&mat.opacity, sizeof(float), 1); break; }
            case phongShininess: { Material mat = data; f.Read(&mat.power, sizeof(float), 1); break; }
            case diffuse: { Material mat = data; f.Read(&mat.diffuse, sizeof(ColorRGB), 1); break; }
            case specular: { Material mat = data; f.Read(&mat.specular, sizeof(ColorRGB), 1); break; }
            case ambient: { Material mat = data; f.Read(&mat.ambient, sizeof(ColorRGB), 1); break; }
            case emissive: { Material mat = data; f.Read(&mat.emissive, sizeof(ColorRGB), 1); break; }
            case phongDiffuseMap: { Material mat = data; subData = &mat.baseMap; readSubBlocks = true; break; }
            case normalMap: { Material mat = data; subData = &mat.bumpMap; readSubBlocks = true; break; }
            case phongSpecularMap: { Material mat = data; subData = &mat.specularMap; readSubBlocks = true; break; }
            // case phongAmbientMap: { Material mat = data; subData = &mat.amb; readSubBlocks = true; break; }
            //case pbrSpecDiffuseMap: { Material mat = data; subData = &mat.reflectMap; readSubBlocks = true; break; }
            case texture:
            {
               Bitmap bitmap { };
               subData = bitmap;
               readSubBlocks = true;
               break;
            }
            case textureName:
            {
               char * name = readString(f);
               Bitmap bitmap;

               if(containerType == texture)
                  bitmap = data;
               else
               {
                  *(Bitmap *)data = bitmap = { };
               }
               if(bitmap)
               {
                  char ext[MAX_EXTENSION];
                  char path[MAX_LOCATION];

                  GetExtension(name, ext);

                  if(ctx.texturesQuery && ctx.curTextureID)
                  {
                     int id = ctx.curTextureID;
                     const String authKey = strstr(ctx.texturesQuery, "?authKey=");
                     int l = authKey ? (int)(authKey - ctx.texturesQuery) : strlen(ctx.texturesQuery);
                     bool rest = strstr(ctx.texturesQuery, "/textures") ? true : false;
                     bool found = false;

                     strcpy(ext, "etc2");

                     if(rest)
                     {
                        memcpy(path, ctx.texturesQuery, l);
                        path[l] = 0;
                        sprintf(path + l, "%d.%s?resolution=256", id, ext);
                        if(authKey)
                           strcatf(path, "&%s", authKey + 1);
                     }
                     else
                        sprintf(path, "%s%d&outputFormat=%s&resolution=256", ctx.texturesQuery, id, ext); // TODO: jpg option...
                     if(!bitmap.Load(path, ext /*null*/, null))
                     {
                        if(rest)
                        {
                           memcpy(path, ctx.texturesQuery, l);
                           path[l] = 0;
                           sprintf(path + l, "%d.%s", id, ext);
                           if(authKey)
                              strcat(path, authKey);
                        }
                        else
                           sprintf(path, "%s%d&outputFormat=%s", ctx.texturesQuery, id, ext);
                        found = bitmap.Load(path, ext /*null*/, null);
                     }
                     else
                        found = true;

                     // Fall back to non-compressed
                     if(!found)
                     {
                        GetExtension(name, ext);

                        if(rest)
                        {
                           memcpy(path, ctx.texturesQuery, l);
                           path[l] = 0;
                           sprintf(path + l, "%d.%s?resolution=256", id, ext);
                           if(authKey)
                              strcatf(path, "&%s", authKey + 1);
                        }
                        else
                           sprintf(path, "%s%d&outputFormat=%s&resolution=256", ctx.texturesQuery, id, ext); // TODO: jpg option...
                        if(!bitmap.Load(path, ext /*null*/, null))
                        {
                           if(rest)
                           {
                              memcpy(path, ctx.texturesQuery, l);
                              path[l] = 0;
                              sprintf(path + l, "%d.%s", id, ext);
                              if(authKey)
                                 strcat(path, authKey);
                           }
                           else
                              sprintf(path, "%s%d&outputFormat=%s", ctx.texturesQuery, id, ext);
                           found = bitmap.Load(path, ext /*null*/, null);
                        }
                     }
                  }
                  else
                  {
                     strcpy(path, ctx.path);
                     PathCat(path, name);
                     StripExtension(path);
                     strcat(path, "-256");
                     ChangeExtension(path, "etc2", path);
                     if(!bitmap.Load(path, "etc2", null))
                     {
                        ChangeExtension(path, ext, path);
                        if(!bitmap.Load(path, ext, null))
                        {
                           strcpy(path, ctx.path);
                           PathCat(path, name);
                           ChangeExtension(path, "etc2", path);
                           if(!bitmap.Load(path, "etc2", null))
                           {
                              ChangeExtension(path, ext, path);
                              bitmap.Load(path, ext, null);
                           }
                        }
                     }
                  }
                  if(bitmap.pixelFormat != pixelFormatETC2RGBA8)
                  {
                     Bitmap bmp = bitmap.ProcessDD(true, 0, false /*true*/, 16384, true);
                     bitmap.Copy2(bmp, true);
                     delete bmp;
                     #if 0
                     ChangeExtension(path, "etc2", path);
                     bitmap.Save(path, null, null);
                     #endif
                  }
                  bitmap.MakeMipMaps(displaySystem);
               }
               delete name;
               break;
            }
            case textureID:
            {
               int id = 0;
               f.Read(&id, sizeof(int), 1);
               texMutex.Wait();
               if(containerType == texture)
               {
                  if(ctx.texturesByID)
                  {
                     if(ctx.texturesByID[id])
                     {
                        delete (Bitmap)data;
                        readSubBlocks = false;
                     }
                     else
                     {
                        ctx.curTextureID = id;
                        ctx.texturesByID[id] = data;
                     }
                  }
               }
               else
               {
                  Bitmap * bPtr = data;
                  *bPtr = ctx.texturesByID ? ctx.texturesByID[id] : null;
               }
               texMutex.Release();
               break;
            }
            case textureJPG:
            case texturePNG:
            {
               Bitmap bitmap = data;
               if(bitmap)
               {
                  TempFile file { };
                  int count = (int)(bEnd - pos);
                  byte * r = new byte[count];
                  f.Read(r, 1, count);
                  file.buffer = r;
                  file.size = count;
                  bitmap.LoadFromFile(file, header.type == texturePNG ? "png" : "jpg", null); //displaySystem);
                  bitmap.MakeMipMaps(displaySystem);
                  file.StealBuffer();
                  delete file;
                  delete r;
               }
               break;
            }
            case E3DBlockType::mesh:
            {
               subData = Mesh { };
               readSubBlocks = true;
               break;
            }
            case meshID:
            {
               int id = 0;
               f.Read(&id, sizeof(int), 1);
               if(containerType == meshNode)
               {
                  object.mesh = ctx.meshesByID[id];
                  object.flags.mesh = true;
                  if(!ctx.meshOwned[id])
                  {
                     object.flags.ownMesh = true;
                     object.SetMinMaxRadius(true);
                     ctx.meshOwned[id] = true;
                  }
                  else
                  {
                     object.flags.ownMesh = false;
                     object.SetMinMaxRadius(false);
                  }
               }
               else
                  ctx.meshesByID[id] = data;
               break;
            }
            case attributes:
            {
               int nVertices = 0;
               if(mesh && f.Read(&nVertices, sizeof(nVertices), 1))
               {
                  // TOFIX: forcing interleaved here...
                  mesh.Allocate({ /*interleaved = true, */vertices = true }, nVertices, displaySystem);
                  readSubBlocks = true;
               }
               pos += sizeof(uint);
               break;
            }
            case attrInterleaved:
            {
               E3DBlockType type;
               MeshFeatures features = 0;
               MeshFeatures allocedFeatures;
               int nVertices = mesh.nVertices;
               bool qVerts = false;
               uint vSize = 0;
               uint vOffset = 0, nOffset = 0, t1Offset = 0, t2Offset = 0, tnOffset = 0, cOffset = 0;
               bool signBitan = false;
               while(pos < bEnd && f.Read(&type, sizeof(E3DBlockType), 1))
               {
                  uint16 offset = 0;
                  f.Read(&offset, sizeof(uint16), 1);
                  pos += 4;
                  if(!type)
                  {
                     vSize = offset;
                     break;
                  }
                  switch(type)
                  {
                     case attrQVertices: qVerts = true; features.vertices = true; vOffset = offset; break;
                     case attrVertices: features.vertices = true; vOffset = offset; break;
                     case attrTexCoords: features.texCoords1 = true; t1Offset = offset; break;
                     case attrTexCoords2: features.texCoords2 = true; t2Offset = offset; break;
                     case attrNormals: features.normals = true; nOffset = offset; break;
                     case attrColors: features.colors = true; cOffset = offset; break;
                     case attrTangentsSign: features.tangents = true; tnOffset = offset; signBitan = true; break;
                     case attrTangentsBT: features.tangents = true; tnOffset = offset; break;
                  }
               }
               allocedFeatures = features;
               allocedFeatures.vertices = true;
               if(allocedFeatures == { vertices = true, normals = true, texCoords1 = true })
                  allocedFeatures.interleaved = true; // Loading this common format as interleaved for now...
               if(vSize && mesh.Allocate(allocedFeatures, nVertices, displaySystem))
               {
                  bool loadIL = false;
                  Vector3Df * vertex = null, * normal = null, * tangent = null, * bitangent = null;
                  Pointf * texCoord = null, * texCoord2 = null;
                  ColorRGBAf * color = null;
                  int i;

                  if(allocedFeatures.interleaved)
                  {
                     loadIL = true;
                     vertex = features.vertices ? (Vector3Df*)((byte *)mesh.vertices) : null;
                     normal = features.normals ? (Vector3Df*)((byte *)mesh.vertices + 12) : null;
                     texCoord = features.texCoords1 ? (Pointf*)((byte *)mesh.vertices + 24) : null;
                     //tangent = features.tangents ? (Vector3Df*)((byte *)mesh.vertices + tnOffset) : null;
                     //color = features.colors ? (Vector3Df*)((byte *)mesh.vertices + cOffset) : null;
                  }
                  else
                  {
                     if(features.vertices) vertex = (Vector3Df*)((byte *)mesh.vertices);
                     if(features.normals)  normal = (Vector3Df*)((byte *)mesh.normals);
                     if(features.tangents) tangent = (Vector3Df*)((byte *)mesh.tangents);
                     if(!signBitan && features.tangents) bitangent = mesh.tangents+1;
                     if(features.texCoords1) texCoord = (Pointf*)((byte *)mesh.texCoords);
                     // if(features.texCoords2) texCoord2 = (Pointf*)((byte *)mesh.texCoords2);
                     if(features.colors) color = (ColorRGBAf*)((byte *)mesh.colors + cOffset);
                  }

                  for(i = 0; i < nVertices; i++)
                  {
                     uint64 vStart = pos;
                     if(vertex)
                     {
                        f.Seek(vStart + vOffset, start), f.Read(vertex, sizeof(Vector3Df), 1);
                        if(ctx.positiveYUp)
                           vertex->y *= -1;
                     }
                     if(normal)
                     {
                        uint32 n;
                        f.Seek(vStart + nOffset, start), f.Read(&n, sizeof(uint32), 1);
                        vecfUnpack10i(n, normal, null);
                     }
                     if(texCoord)
                        f.Seek(vStart + t1Offset, start), f.Read(texCoord, sizeof(Pointf), 1);
                     if(texCoord2)
                        f.Seek(vStart + t2Offset, start), f.Read(texCoord2, sizeof(Pointf), 1);
                     if(features.colors)
                     {
                        ColorRGBA c;
                        f.Seek(vStart + cOffset, start), f.Read(&c, sizeof(uint32), 1);
                        *color = { c.r/255.0f, c.g/255.0f, c.b/255.0f, c.a/255.0f };
                     }
                     if(tangent)
                     {
                        uint32 t, bt;
                        f.Seek(vStart + tnOffset, start), f.Read(&t, sizeof(uint32), 1);
                        if(!signBitan) f.Read(&bt, sizeof(uint32), 1);
                        vecfUnpack10i(t, tangent, null);
                        vecfUnpack10i(bt, bitangent, null);
                     }
                     pos += vSize;

                     if(vertex)   vertex   = (void *)((byte *)vertex   + (loadIL ? 32 : 12));
                     if(normal)   normal   = (void *)((byte *)normal   + (loadIL ? 32 : 12));
                     if(color)    color    = (void *)((byte *)color    + (loadIL ? 32 : 16));
                     if(texCoord) texCoord = (void *)((byte *)texCoord + (loadIL ? 32 : 8));
                     if(texCoord2)texCoord2= (void *)((byte *)texCoord2+ (loadIL ? 32 : 8));
                     if(tangent)  tangent  = (void *)((byte *)tangent  + (loadIL ? 32 : signBitan ? 12 : 24));
                     if(bitangent)bitangent= (void *)((byte *)bitangent+ (loadIL ? 32 : 24));
                  }
               }
               break;
            }
            case triFaces16:
            {
               int nFaces = 0;
               PrimitiveGroup g;
               f.Read(&nFaces, sizeof(nFaces), 1);
               // Assuming triangles for now
               g = mesh.AddPrimitiveGroup({ triangles }, nFaces * 3);
               if(mesh.LockPrimitiveGroup(g))
               {
                  f.Read(g.indices, sizeof(uint16), nFaces * 3);
                  mesh.UnlockPrimitiveGroup(g);
               }
               // if(mesh.normals) mesh.ComputeNormals();
               mesh.Unlock(0);
               break;
            }
            case triFaces32:
            {
               int nFaces = 0;
               PrimitiveGroup g;
               f.Read(&nFaces, sizeof(nFaces), 1);
               // Assuming triangles for now
               g = mesh.AddPrimitiveGroup({ triangles, indices32bit = true }, nFaces * 3);
               if(mesh.LockPrimitiveGroup(g))
               {
                  f.Read(g.indices, sizeof(uint32), nFaces * 3);
                  mesh.UnlockPrimitiveGroup(g);
               }
               //mesh.ComputeNormals();
               mesh.Unlock(0);
               break;
            }
            case facesMaterials:
            {
               int start, count, id;
               PrimitiveGroup group = mesh.groups.first;
               bool is32 = group ? group.type.indices32bit : false;
               //int first = 0;
               while(pos < bEnd)
               {
                  f.Read(&start, sizeof(int), 1);
                  f.Read(&count, sizeof(int), 1);
                  f.Read(&id, sizeof(int), 1);
                  pos += 3 * sizeof(int);

                  if(count)
                  {
                     PrimitiveGroup g = mesh.AddPrimitiveGroup({ triangles, indices32bit = is32 }, 3 * count);
                     if(is32)
                        memcpy(g.indices32, group.indices32 + 3*start, 3*count * sizeof(uint32));
                     else
                        memcpy(g.indices, group.indices + 3*start, 3*count * sizeof(uint16));
                     mesh.LockPrimitiveGroup(g);
                     //first += 3 * count;
                     group.nIndices -= 3 * count;
                     g.material = ctx.materialsByID[id];
                     /*if(fabs(g.material.diffuse.r - 0.976) < 0.001);
                     else
                        g.nIndices = 0;*/
                     mesh.UnlockPrimitiveGroup(g);
                  }
               }
               mesh.FreePrimitiveGroup(group);
               break;
            }
            default:
               //PrintLn("   ...skipping");
               break;
         }
         if(readSubBlocks)
            readBlocks(ctx, f, displaySystem, header.type, pos, bEnd, subData);
         if(header.type == material)
         {
            Material mat = subData;
            // TODO: Default material?
            if(!mat.ambient.r && !mat.ambient.g && !mat.ambient.b)
               mat.ambient = mat.diffuse;

            if(ctx.materials)
            {
               MapIterator<uint, Material> it { map = ctx.materialsByID };
               Iterator<Material> m { (void *)ctx.materials };
               //uint key;
               //Material theM = null;

               while(it.Next() && it.data != mat);
               //key = it.key;

               texMutex.Wait();
               if(m.Find(mat))
               {
                  //theM = m.data;
                  ctx.materialsByID.SetData(it.pointer, m.data);
               }
               else
               {
                  ctx.materials.Add(mat);
                  mat = null;
               }
               texMutex.Release();
               delete mat;

               /*for(i : ctx.materialsByID)
               {
                  Material mm = i;
                  uint key = &i;
                  if(i.shader == 0xabababababababab)
                     printf("Bug");
               }*/
            }
         }
         if(header.type == meshNode)
         {
            Object o = subData;
            if(o.mesh)
            {
               o.mesh.ApplyTranslucency(o);
               // o.mesh.ComputeNormals();
            }
            if(o.flags.root)
               o.UpdateTransform();
         }

         f.Seek(bEnd, start);
         pos = bEnd;
      }
   }
   indent--;
}

struct E3DOptions
{
   Map<uint, Bitmap> texturesByID;
   AVLTree<Material> materials;    // Not currently resolving IDs globally for materials...
   const String texturesQuery;
   bool positiveYUp;
};

void readE3D(File f, const String fileName, Object object, DisplaySystem displaySystem, E3DOptions options)
{
   char path[MAX_LOCATION];
   E3DContext ctx { path = path };
   bool freeTexturesByID = false;

   if(options != null)
   {
      ctx.texturesByID = options.texturesByID;
      ctx.materials = options.materials;
      ctx.texturesQuery = options.texturesQuery;
      ctx.positiveYUp = options.positiveYUp;
   }
   else
      ctx.texturesByID = { }, freeTexturesByID = true;

   StripLastDirectory(fileName, path);
   readBlocks(ctx, f, displaySystem, 0, 0, f.GetSize(), object);

   if(freeTexturesByID)
      delete ctx.texturesByID;

   delete ctx;
}
