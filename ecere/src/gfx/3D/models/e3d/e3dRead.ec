#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

import "e3dDefs"

#if defined(__UWP__)
// FIXME:
#define strcmpi strcmp
#endif

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
      int r;
      if((r = LzmaUncompress(uncompressed, &destLen, data + LZMA_PROPS_SIZE, &encSize, data, LZMA_PROPS_SIZE)) != SZ_OK)
      {
         // delete uncompressed buffer upon failure to avoid memory leaks
         delete uncompressed;
#ifdef _DEBUG
         PrintLn("WARNING: E3D: lzma block could not be decoded!");
#endif
      }
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

static void readMatrix(File f, Matrix matrix)
{
   int i;

   for(i = 0; i < 16; i++)
   {
      float v;
      f.Read(&v, sizeof(float), 1);
      matrix.array[i] = (double)v;
   }
}

static void readTCBEase(File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      f.Read(&track.keys[i].tension, sizeof(float), 1);
      f.Read(&track.keys[i].continuity, sizeof(float), 1);
      f.Read(&track.keys[i].bias, sizeof(float), 1);
      f.Read(&track.keys[i].easeFrom, sizeof(float), 1);
      f.Read(&track.keys[i].easeTo, sizeof(float), 1);
   }
}

static void readFTKVector3Df(File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
      f.Read(&track.keys[i].scaling.x, sizeof(float), 3);
}

static void readFTKQuaternionf(File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      Quaternion qd;
      float q[4];
      f.Read(q, sizeof(float), 4);
      qd = { w = q[0], x = q[1], y = q[2], z = q[3] };
      track.keys[i].orientation = qd;
   }
}

static void readFTKFloat(File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
      f.Read(&track.keys[i].roll, sizeof(float), 1);
}

static void readFTKBool(File f, FrameTrack track)
{
   int i;

   for(i = 0; i < track.numKeys; i++)
   {
      byte hide = bool::false;
      f.Read(&hide, sizeof(byte), 1);
      track.keys[i].hide = (bool)hide;
   }
}

static void readFTKMorph(File f, FrameTrack track)
{
   int i;

   f.Read(&track.morphIndex, sizeof(int), 1);
   for(i = 0; i < track.numKeys; i++)
      f.Read(&track.keys[i].weight, sizeof(float), 1);
}

#if defined(__GNOSIS3__)
TempFile downloadFile(const String url);
#else
File downloadFile(const String url) { return FileOpen(url, read); }
#endif

// TODO: Review how to handle all this properly...
void freeE3DMaterial(Material material)
{
   // TOCHECK: Are we somehow holding on to textures to re-use them?
   if(material.baseMap)
      delete material.baseMap;
   if(material.envMap)
      delete material.envMap;
   if(material.bumpMap)
      delete material.bumpMap;
   if(material.specularMap)
      delete material.specularMap;
   if(material.reflectMap)
      delete material.reflectMap;
}

void freeE3DMeshMaterials(Mesh mesh)
{
   PrimitiveGroup group;

   for(group = mesh.groups.first; group; group = group.next)
   {
      if(group.material)
      {
         freeE3DMaterial(group.material);
         group.material = null;
         // We are freeing materials separately?
         //delete group.material;
      }
   }
}

void freeE3DObjectMaterials(Object object)
{
   Object o;

   if(object.mesh)
      freeE3DMeshMaterials(object.mesh);

   for(o = object.firstChild; o; o = o.next)
      freeE3DObjectMaterials(o);
}

// Right now this is global and requires a lock... Support supplying optional textures ID map ?
static Mutex texMutex { };

static void readBlocks(E3DContext ctx, File f, DisplaySystem displaySystem, E3DBlockType containerType, uint64 pbStart, uint64 end, void * data)
{
   Object object = data; // data is most often the Mesh...
   Mesh mesh = data;
   uint64 pos = pbStart;
#if 0 //def _DEBUG
   static int indent = 0;
   indent++;
#endif
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
               if(tmp.buffer)
               {
                  tmp.size = size;
                  readBlocks(ctx, tmp, displaySystem, containerType, 0, size, subData);
               }
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
            case skeleton:
            {
               String tag;
               // Object skeleton;
               int id;
               // const String name = object.name;

               f.Read(&id, sizeof(int), 1);
               tag = readString(f);

               object.tag = (void *)(uintptr)id;
               if(tag)
                  ctx.skeletonTags[id] = tag;
               break;
            }
            case nodeID:
            {
               uint id = 0;
               f.Read(&id, sizeof(uint), 1);
               if(containerType == animationTrack)
               {
                  FrameTrack track = (FrameTrack)data;
                  Object object = ctx.nodesByID[id];
                  if(object)
                  {
                     FrameTrackType type = track.type.type;
                     object.tracks->Add(track);
                     if(type == rYaw || type == rPitch || type == rRoll)
                     {
                        Euler euler;
                        object.rotationOrder = track.type.rotationOrder;

                        euler.FromQuaternion(object.transform.orientation, object.rotationOrder);
                        object.eulerOrientation = euler;
                     }
                  }
                  else
                  {
                     PrintLn("WARNING: Node not found for animation track");
                     // delete track; // TODO: How to free this?
                  }
               }
               else if(object)
                  ctx.nodesByID[id] = object;
               break;
            }
            case nodeName:
            {
               Object p = object.parent;
               String name = readString(f);
               if(p)
               {
                  p.Remove(object);
                  p.AddName(object, name);
               }
               delete name;
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
               Euler euler;

               f.Read(&v, sizeof(Quaternion), 1);
               object.transform.orientation = v;

               euler.FromQuaternion(v, object.rotationOrder);
               object.eulerOrientation = euler;
               break;
            }
            case material:
            {
               Material mat = null;
               mat.OnCopy(GetDefaultMaterial());
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
               incref bitmap;
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
               if(bitmap && !ctx.skipTexturesProcessing)
               {
                  char ext[MAX_EXTENSION];
                  char path[MAX_LOCATION];
                  File f = null;
                  const String format = null;
                  String nameNoExt = CopyString(name);
                  int attempt;
                  bool isHTTP;
                  bool successfulLoad;
                  const String texturePath = ctx.texturesPath ? ctx.texturesPath : ctx.path;

                  StripExtension(nameNoExt);
                  GetExtension(name, ext);

                  // this becomes the call to getTextureCallback
                  isHTTP = strstr(texturePath, "http://") == texturePath || strstr(texturePath, "https://") == texturePath;
                  strcpy(path, texturePath);
                  PathCat(path, name);
                  StripExtension(path);

                  if(ctx.saveCompressedMutex)
                     ctx.saveCompressedMutex.Wait();

                  for(attempt = /*( !strcmpi(ext,"etc2") || !ctx.compressedTextures ) ? */0/* : 1*/; !f && attempt >= 0; --attempt)
                  {
                     // We compress ourselves etc2 in client now...
                     // This will first try to get compressed textures, then
                     // fallback to the extension found in the model file
                     // (variable exe), however, if exe is already "etc2" or we
                     // do not want texture compression (ctx.compressedTextures == false),
                     // we can skip the first attempt
                     format = attempt ? "etc2" : ext;
                     if(ctx.getTextureCallback != null)
                     {
                        // resolution should be addressed inside each getTextureCallback implementation: GeoPackage could need separated x and y values.
                        f = ctx.getTextureCallback(ctx.getTextureContext, nameNoExt, ctx.resolution, ctx.resolution, format);
                     }
                     else
                     {
                        // this is a fallback in case no callback is given, however this should never actually happen.
                        ChangeExtension(path, format, path);
                        f = isHTTP ? downloadFile(path) : FileOpen(path, read);
                     }
                  }

                  delete nameNoExt;

                  successfulLoad = f && bitmap.LoadFromFile(f, format, null);

                  if(ctx.saveCompressedMutex)
                     ctx.saveCompressedMutex.Release();

                  if(successfulLoad)
                  {
                     if(bitmap.pixelFormat != pixelFormatETC2RGBA8 && !ctx.skipTexturesProcessing)
                     {
                        Bitmap bmp = bitmap.ProcessDD(true, 0, ctx.compressedTextures, ctx.resolution ? ctx.resolution : 16384,
                           true, ctx.enforcedTexWidth, ctx.enforcedTexHeight);
                        bitmap.Copy2(bmp, true);
                        delete bmp;

                        if(ctx.compressedTextures && ctx.saveCompressedCallback)
                        {
                           if(ctx.saveCompressedMutex)
                              ctx.saveCompressedMutex.Wait();                // Is this the name with an extension here?
                           ctx.saveCompressedCallback(ctx.getTextureContext, name, ctx.resolution, ctx.resolution, bitmap);
                           if(ctx.saveCompressedMutex)
                              ctx.saveCompressedMutex.Release();
                        }
                     }
                     bitmap.MakeMipMaps(displaySystem);
                  }

                  delete f;
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
                        Bitmap bitmap = data;
#ifdef _DEBUG
                        if(!bitmap._refCount)
                           PrintLn("WARNING: E3D/textureID bitmap with 0 refs");
#endif
                        //incref bitmap;
                        ctx.curTextureID = id;
                        ctx.texturesByID[id] = bitmap;
                     }
                  }
               }
               else
               {
                  Bitmap * bPtr = data;
                  *bPtr = ctx.texturesByID ? ctx.texturesByID[id] : null;
                  if(*bPtr) incref (*bPtr);
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
                  const String format = header.type == texturePNG ? "png" : "jpg";
                  File file = null;
                  bool successfulLoad;
                  String name = null;

                  if(ctx.saveCompressedMutex)
                     ctx.saveCompressedMutex.Wait();
                  if(ctx.compressedTextures)
                  {
                     name = PrintString(ctx.curTextureID);

                     if(ctx.getTextureCallback)
                        file = ctx.getTextureCallback(ctx.getTextureContext, name, ctx.resolution, ctx.resolution, "etc2");
                     else
                     {
                        // TODO: Default path to cache compressed textures to?
                        // ChangeExtension(path, format, path);
                        // file = FileOpen(path, read);
                     }
                     if(file)
                        format = "etc2";
                  }
                  if(!file)
                  {
                     int count = (int)(bEnd - pos);
                     byte * r = new byte[count];
                     f.Read(r, 1, count);
                     file = TempFile { buffer = r, size = count };
                  }

                  successfulLoad = file && bitmap.LoadFromFile(file, format, null);

                  if(ctx.saveCompressedMutex)
                     ctx.saveCompressedMutex.Release();

                  if(successfulLoad)
                  {
                     if(bitmap.pixelFormat != pixelFormatETC2RGBA8 && !ctx.skipTexturesProcessing)
                     {
                        Bitmap bmp = bitmap.ProcessDD(true, 0, ctx.compressedTextures, ctx.resolution ? ctx.resolution : 16384,
                           false, ctx.enforcedTexWidth, ctx.enforcedTexHeight);
                        bitmap.Copy2(bmp, true);
                        delete bmp;

                        if(ctx.compressedTextures)
                        {
                           if(ctx.saveCompressedMutex)
                              ctx.saveCompressedMutex.Wait();
                           if(ctx.saveCompressedCallback)
                              ctx.saveCompressedCallback(ctx.getTextureContext, name, ctx.resolution, ctx.resolution, bitmap);
                           if(ctx.saveCompressedMutex)
                              ctx.saveCompressedMutex.Release();
                        }
                     }
                     bitmap.MakeMipMaps(displaySystem);
                  }
                  delete name;
                  delete file;
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
               else if(containerType == morph)
               {
                  MeshMorph * morph = &mesh.morphs[mesh.morphs.count];
                  Mesh target = ctx.meshesByID[id];
                  morph->target = target;
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
               // bool qVerts = false;
               uint vSize = 0;
               uint vOffset = 0, nOffset = 0, t1Offset = 0, t2Offset = 0, tnOffset = 0, cOffset = 0, bOffset = 0;
               bool signBitan = false;
               bool lastWasBones = false;
               uint maxBones = 0;
               MeshSkin skin = null;

               while(pos < bEnd && f.Read(&type, sizeof(E3DBlockType), 1))
               {
                  uint16 offset = 0;
                  f.Read(&offset, sizeof(uint16), 1);
                  if(lastWasBones)
                  {
                     maxBones = (offset - bOffset) / 2;
                     lastWasBones = false;
                  }
                  pos += 4;
                  if(!type)
                  {
                     vSize = offset;
                     break;
                  }
                  switch(type)
                  {
                     case attrQVertices: /*qVerts = true; */features.vertices = true; vOffset = offset; break;
                     case attrVertices: features.vertices = true; vOffset = offset; break;
                     case attrTexCoords: features.texCoords1 = true; t1Offset = offset; break;
                     case attrTexCoords2: features.texCoords2 = true; t2Offset = offset; break;
                     case attrNormals: features.normals = true; nOffset = offset; break;
                     case attrColors: features.colors = true; cOffset = offset; break;
                     case attrTangentsSign: features.tangents = true; tnOffset = offset; signBitan = true; break;
                     case attrTangentsBT: features.tangents = true; tnOffset = offset; break;
                     case attrBoneWeights:
                        // features.bones = true;
                        bOffset = offset;
                        lastWasBones = true;
                        skin = { };
                        skin.skinVerts.size = nVertices;
                        break;
                  }
               }
               mesh.skin = skin;
               allocedFeatures = features;
               allocedFeatures.vertices = true;
               if(allocedFeatures == { vertices = true, normals = true, texCoords1 = true })
                  // TODO: Review issues with translucent primitives when this is set...
                  ; //allocedFeatures.interleaved = true; // Loading this common format as interleaved for now...
               if(vSize && mesh.Allocate(allocedFeatures, nVertices, displaySystem))
               {
                  bool loadIL = false;
                  Vector3Df * vertex = null, * normal = null, * tangent = null, * bitangent = null;
                  Pointf * texCoord = null, * texCoord2 = null;
                  ColorRGBAf * color = null;
                  SkinVert * bones = null;
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
                     if(features.colors) color = (ColorRGBAf*)((byte *)mesh.colors /*+ cOffset*/);     // REVIEW: cOffset here?
                     if(skin /*features.bones*/) bones = skin.skinVerts.array;
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
                     if(skin) //features.bones)
                     {
                        f.Seek(vStart + bOffset, start);
                        f.Read(bones->bones,   sizeof(byte), maxBones); // Asuming maxBones is 10 for now
                        f.Read(bones->weights, sizeof(byte), maxBones);
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
                     if(bones)    bones    = bones + 1;
                  }
               }
               break;
            }
            case triFaces16:
            {
               int nFaces = 0;

               f.Read(&nFaces, sizeof(nFaces), 1);

               if(ctx.shareIndices)
               {
                  // Assuming triangles for now
                  {
                     uint16 * indices16 = new uint16[nFaces * 3];
                     int i;

                     // TODO: 16 bit indices here?
                     mesh.indices = new uint32[nFaces * 3];
                     mesh.nIndices = nFaces * 3;
                     f.Read(indices16, sizeof(uint16), nFaces * 3);
                     for(i = 0; i < nFaces * 3; i++)
                        mesh.indices[i] = indices16[i];
                     delete indices16;
                  }
                  if(displaySystem)
                  {
                     uint indexSize = sizeof(uint32);
                     uint size = mesh.nIndices * indexSize;
                     BlockEntry block;

                     if(!mesh.meab)
                     {
                        mesh.meab = { };
                        mesh.flags.ownMEAB = true;
                     }
                     block = mesh.meab.allocate(elements, size);
                     mesh.baseIndex = block ? block.start / indexSize : -1;
                     if(mesh.baseIndex != -1)
                        mesh.meab.ab._upload(elements, block.start, size, mesh.indices);
                  }

                  {
                     PrimitiveGroup g = mesh.AddPrimitiveGroup({ triangles, indices32bit = true, sharedIndices = true }, nFaces * 3);
                     if(displaySystem)
                        g.baseIndexBuffer = mesh.baseIndex;
                  }
               }
               else
               // Assuming triangles for now
               {
                  PrimitiveGroup g = mesh.AddPrimitiveGroup({ triangles }, nFaces * 3);
                  if(mesh.LockPrimitiveGroup(g))
                  {
                     f.Read(g.indices, sizeof(uint16), nFaces * 3);
                     mesh.UnlockPrimitiveGroup(g);
                  }
               }
               // if(mesh.normals) mesh.ComputeNormals();
               mesh.Unlock(0);
               break;
            }
            case triFaces32:
            {
               int nFaces = 0;
               f.Read(&nFaces, sizeof(nFaces), 1);

               if(ctx.shareIndices)
               {
                  // Assuming triangles for now
                  mesh.indices = new uint32[nFaces * 3];
                  mesh.nIndices = nFaces * 3;
                  f.Read(mesh.indices, sizeof(uint32), nFaces * 3);

                  if(displaySystem)
                  {
                     uint indexSize = sizeof(uint32);
                     uint size = mesh.nIndices * indexSize;
                     BlockEntry block;

                     if(!mesh.meab)
                     {
                        mesh.meab = { };
                        mesh.flags.ownMEAB = true;
                     }
                     block = mesh.meab.allocate(elements, size);
                     mesh.baseIndex = block ? block.start / indexSize : -1;

                     if(mesh.baseIndex != -1)
                        mesh.meab.ab._upload(elements, block.start, size, mesh.indices);
                  }
                  mesh.AddPrimitiveGroup({ triangles, indices32bit = true, sharedIndices = true }, nFaces * 3);
               }
               else
               {
                  PrimitiveGroup g = mesh.AddPrimitiveGroup({ triangles, indices32bit = true }, nFaces * 3);
                  if(mesh.LockPrimitiveGroup(g))
                  {
                     // Assuming triangles for now
                     f.Read(g.indices, sizeof(uint32), nFaces * 3);
                     mesh.UnlockPrimitiveGroup(g);
                  }
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
               while(pos < bEnd)
               {
                  f.Read(&start, sizeof(int), 1);
                  f.Read(&count, sizeof(int), 1);
                  f.Read(&id, sizeof(int), 1);
                  pos += 3 * sizeof(int);

                  if(count)
                  {
                     PrimitiveGroup g;
                     g = mesh.AddPrimitiveGroup({ triangles, indices32bit = is32, sharedIndices = ctx.shareIndices }, 3 * count);
                     if(ctx.shareIndices)
                     {
                        g.baseIndexMesh = 3 * start;
                        g.baseIndexBuffer = mesh.baseIndex + g.baseIndexMesh;
                     }
                     else
                     {
                        mesh.LockPrimitiveGroup(g);
                        if(is32)
                           memcpy(g.indices32, group.indices32 + 3*start, 3*count * sizeof(uint32));
                        else
                           memcpy(g.indices, group.indices + 3*start, 3*count * sizeof(uint16));
                        mesh.UnlockPrimitiveGroup(g);
                     }
                     g.material = ctx.materialsByID[id];
                  }
               }
               mesh.FreePrimitiveGroup(group);
               break;
            }
            case meshDuplVerts:
            {
               int n = (header.size - sizeof(E3DBlockHeader)) / sizeof(int);
               mesh.dupVerts = { size = n };
               f.Read(mesh.dupVerts.array, sizeof(int), n);
               if(mesh.skin && mesh.skin.skinVerts)
               {
                  // TODO: Review where to adjust for duplicate vertices
                  mesh.skin.skinVerts.size = Max(0, mesh.skin.skinVerts.count - n);
               }
               // PrintLn("Duplicate Vertices!");
               break;
            }
            case morphs:
            {
               int count = 0;
               f.Read(&count, sizeof(int), 1);
               pos += sizeof(int);
               if(count && !mesh.morphs)
               {
                  mesh.morphs = { minAllocSize = count };
                  memset(mesh.morphs.array, 0, count * sizeof(MeshMorph));
                  readSubBlocks = true;
               }
               break;
            }
            case morph:
            {
               readSubBlocks = true;
               break;
            }
            case morphID:
            {
               // Assuming sequential ID starting from 0 for now
               int id = 0;
               f.Read(&id, sizeof(int), 1);
               break;
            }
            case morphName:
            {
               MeshMorph * morph = &mesh.morphs[mesh.morphs.count];
               morph->name = readString(f);
               break;
            }
            case morphWeight:
            {
               MeshMorph * morph = &mesh.morphs[mesh.morphs.count];
               float w = 0;
               f.Read(&w, sizeof(float), 1);
               morph->weight = w;
               break;
            }
            case skin:
               readSubBlocks = true;
               break;
            case skinBindMatrix:
            {
               MeshSkin skin = mesh.skin;
               if(skin)
               {
                  readMatrix(f, skin.bindShapeMatrix);
                  skin.bsIsIdentity = skin.bindShapeMatrix.isIdentity();
                  if(skin.bsIsIdentity)
                     skin.invShape.Identity();
                  else
                     skin.invShape.Inverse(skin.bindShapeMatrix);
               }
               break;
            }
            case skinBones:
            {
               MeshSkin skin = mesh.skin;
               if(skin)
               {
                  byte count;
                  int i;
                  Array<SkinBone> bones = skin.bones;

                  f.Read(&count, sizeof(byte), 1);
                  bones.size = count;

                  for(i = 0; i < count; i++)
                  {
                     bones[i].name = readString(f);
                     readMatrix(f, bones[i].invBindMatrix);
                     bones[i].bsInvBindMatrix.Multiply(skin.bindShapeMatrix, bones[i].invBindMatrix);
                  }
               }
               break;
            }
            case animations: readSubBlocks = true; break;
            case animation: readSubBlocks = true; break;
            case animationName:
               break;
            case animationFrames:
            {
               int frame;
               f.Read(&frame, sizeof(int), 1);
               object.startFrame = frame;
               f.Read(&frame, sizeof(int), 1);
               object.endFrame = frame;
               f.Read(&frame, sizeof(int), 1);
               object.frame = frame;
               break;
            }
            case animationTrack:
            {
               uint loop;
               FrameTrack track { };
               int i;

               f.Read(&track.numKeys, sizeof(uint), 1);
               pos += 4;
               f.Read(&loop, sizeof(byte), 1);
               pos ++;
               track.type.loop = loop != 0;
               track.keys = new0 FrameKey[track.numKeys];
               for(i = 0; i < track.numKeys; i++)
                  f.Read(&track.keys[i].frame, sizeof(uint), 1);
               pos += sizeof(uint) * track.numKeys;

               readSubBlocks = true;
               subData = track;
               break;
            }
            case frameTCBEase: { FrameTrack track = (FrameTrack) data; readTCBEase(f, track); break; }
            case ftkRotationOrder:
            {
               FrameTrack track = (FrameTrack) data;
               byte rotationOrder;
               f.Read(&rotationOrder, sizeof(byte), 1);
               track.type.rotationOrder = (EulerRotationOrder)rotationOrder;
               break;
            }
            case ftkPosition: { FrameTrack track = (FrameTrack) data; track.type.type = position; readFTKVector3Df(f, track); break; }
            case ftkScaling: { FrameTrack track = (FrameTrack) data; track.type.type = scaling; readFTKVector3Df(f, track); break; }
            case ftkRotation: { FrameTrack track = (FrameTrack) data; track.type.type = rotation; readFTKQuaternionf(f, track); break; }
            case ftkYaw: { FrameTrack track = (FrameTrack) data; track.type.type = rYaw; readFTKFloat(f, track); break; }
            case ftkPitch: { FrameTrack track = (FrameTrack) data; track.type.type = rPitch; readFTKFloat(f, track); break; }
            case ftkRoll: { FrameTrack track = (FrameTrack) data; track.type.type = rRoll; readFTKFloat(f, track); break; }
            case ftkCameraFieldOfView: { FrameTrack track = (FrameTrack) data; track.type.type = fov; readFTKFloat(f, track); break; }
            case ftkCameraRoll: { FrameTrack track = (FrameTrack) data; track.type.type = roll; readFTKFloat(f, track); break; }
            case ftkLightHotSpot: { FrameTrack track = (FrameTrack) data; track.type.type = hotSpot; readFTKFloat(f, track); break; }
            case ftkLightFallOff: { FrameTrack track = (FrameTrack) data; track.type.type = fallOff; readFTKFloat(f, track); break; }
            case ftkLightColor: { FrameTrack track = (FrameTrack) data; track.type.type = colorChange; readFTKVector3Df(f, track); break; }
            case ftkHide: { FrameTrack track = (FrameTrack) data; track.type.type = hide; readFTKBool(f, track); break; }
            case ftkMorph: { FrameTrack track = (FrameTrack) data; track.type.type = morph; readFTKMorph(f, track); break; }
            case parts:
            {
               uint nParts = (uint)((bEnd - pos) / sizeof(MeshPart));
               Array<MeshPart> parts { size = nParts };
               mesh.parts = parts;
               f.Read(parts.array, sizeof(MeshPart), parts.count);
               break;
            }
            default:
               //PrintLn("   ...skipping");
               break;
         }
         if(readSubBlocks)
            readBlocks(ctx, f, displaySystem, header.type, pos, bEnd, subData);
         if(header.type == morph && mesh.morphs && mesh.morphs.minAllocSize >= mesh.morphs.count + 1)
         {
            MeshMorph * morph = &mesh.morphs[mesh.morphs.count];
            morph->firstV = -1;
            morph->lastV = -1;
            mesh.morphs.count++;
         }
         if(header.type == material)
         {
            Material mat = subData;
            // TODO: Default material?
            if(!mat.ambient.r && !mat.ambient.g && !mat.ambient.b)
               mat.ambient = mat.diffuse;

            if(mat.opacity < 1.0 || (mat.diffuse.r != 1.0 || mat.diffuse.g != 1.0 || mat.diffuse.b != 1.0) ||
               (mat.ambient.r != 1.0 || mat.ambient.g != 1.0 || mat.ambient.b != 1.0) ||
               (mat.specular.r != 1.0 || mat.specular.g != 1.0 || mat.specular.b != 1.0) ||
               (mat.emissive.r != 0.0 || mat.emissive.g != 0.0 || mat.emissive.b != 0.0))
               mat.flags.constantColor = true;
            mat.flags.update = true;

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
                  if(mat)
                     freeE3DMaterial(mat);

                  ctx.materialsByID.SetData(it.pointer, m.data);
               }
               else
               {
                  AVLNode<Material> node = (AVLNode<Material>)ctx.materials.Add(mat);
                  Material mm = node.key; // AVLTree will copy the key now, which we don't want in this case
                  node.key = mat;
                  delete mm;
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
#if 0 //def _DEBUG
   indent--;
#endif
}

void listTexturesReadBlocks(E3DContext ctx, File f, E3DBlockType containerType, uint64 pbStart, uint64 end, void * data, Array<String> textureList)
{
   uint64 pos = pbStart;
#if 0 //def _DEBUG
   static int indent = 0;
   indent++;
#endif
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
            case lzma: //recurse?
            {
               uint cSize = (uint)(bEnd - pos - sizeof(uint)), size;
               byte * cData;
               TempFile tmp { };
               f.Read(&size, sizeof(uint), 1);
               cData = new byte[cSize]; //size];
               f.Read(cData, 1, cSize); //bEnd - pos);
               tmp.buffer = decodeLZMA(cData, cSize, size, null);
               tmp.size = size;
               listTexturesReadBlocks(ctx, tmp, containerType, 0, size, subData, textureList);

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
               //readSubBlocks = true;
               break;
            case scaling:
            case position:
            case orientation:
               break;
            case material:
               //readSubBlocks = true;
               break;
            case materialID:
            case materialFlags:
            case opacity:
            case phongShininess:
            case diffuse:
            case specular:
            case ambient:
            case emissive:
            case phongDiffuseMap:
            case normalMap:
            case phongSpecularMap:
               break;
            // case phongAmbientMap: { Material mat = data; subData = &mat.amb; readSubBlocks = true; break; }
            //case pbrSpecDiffuseMap: { Material mat = data; subData = &mat.reflectMap; readSubBlocks = true; break; }
            case texture:
            {
               /*Bitmap bitmap { };
               subData = bitmap;
               incref bitmap;*/
               readSubBlocks = true;
               break;
            }
            case textureName:
            {
               char * name = readString(f);

               if(ctx.curTextureID)
               {
                  if(ctx.texturesPath)
                     textureList.Add(PrintString(ctx.texturesPath, name));
                  else
                     textureList.Add(CopyString(name));
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
                     ctx.curTextureID = id;
                     /*
                     if(ctx.texturesByID[id]) // is this necessary?
                     {
                        //delete (Bitmap)data;
                        readSubBlocks = false;
                     }
                     else
                     {

                        Bitmap bitmap = data;
                        incref bitmap;
                        ctx.curTextureID = id;
                        ctx.texturesByID[id] = bitmap;
                     }*/
                  }
               }
               else
               {
                  //Bitmap * bPtr = data;
                  //*bPtr = ctx.texturesByID ? ctx.texturesByID[id] : null;
               }
               texMutex.Release();
               break;
            }
            case textureJPG:
            case texturePNG:
            case E3DBlockType::mesh:
            case meshID:
            case attributes:
            case attrInterleaved:
            case triFaces16:
            case triFaces32:
            case facesMaterials:
               break;

            default:
               //PrintLn("   ...skipping");
               break;
         }

         if(readSubBlocks)
         {
            // this sometimes has an address when it shouldn't
            listTexturesReadBlocks(ctx, f, header.type, pos, bEnd, subData, textureList);
         }

         f.Seek(bEnd, start);
         pos = bEnd;
      }
   }
#if 0 //def _DEBUG
   indent--;
#endif
}

static void resolveBones(E3DContext ctx, Object skeleton, Object object)
{
   Object c;

   if(object.mesh && object.mesh.skin)
   {
      int i;

      if(!skeleton && object.tag)
      {
         uint id = (uint)(uintptr)object.tag;
         skeleton = ctx.nodesByID[id];
         if(skeleton)
         {
            skeleton.flags.bone = true;
            skeleton.flags.skeleton = true;
            skeleton.tag = ctx.skeletonTags[id];
         }
         object.tag = null;
      }

      if(skeleton)
      {
         for(i = 0; i < object.mesh.skin.bones.count; i++)
         {
            SkinBone * bone = &object.mesh.skin.bones[i];
            if(!bone->object)
            {
               String name = bone->name;
               Object o = skeleton.Find(name);
               if(o)
                  o.flags.bone = true;
               bone->object = o;
            }
         }
      }
   }

   for(c = object.firstChild; c; c = c.next)
      resolveBones(ctx, skeleton, c);
}

void readE3D(File f, const String fileName, Object object, DisplaySystem displaySystem, E3DOptions options)
{
   char path[MAX_LOCATION];
   E3DContext ctx { path = path };
   bool freeTexturesByID = false;

   if(options != null)
   {
      ctx.shareIndices = options.shareIndices;
      ctx.texturesByID = options.texturesByID ? options.texturesByID : { };
      ctx.materials = options.materials;
      ctx.texturesPath = options.texturesPath;
      ctx.positiveYUp = options.positiveYUp;
      ctx.resolution = options.resolution;
      ctx.compressedTextures = options.compressedTextures;
      ctx.enforcedTexWidth = options.enforcedTexWidth;
      ctx.enforcedTexHeight = options.enforcedTexHeight;
      ctx.skipTexturesProcessing = options.skipTexturesProcessing;
      ctx.saveCompressedMutex = options.saveCompressedMutex;
      ctx.getTextureContext = options.getTextureContext;
      ctx.getTextureCallback = options.getTextureCallback;
      ctx.saveCompressedCallback = options.saveCompressedCallback;
   }
   else
      ctx.texturesByID = { }, freeTexturesByID = true;

   StripLastDirectory(fileName, path);
   readBlocks(ctx, f, displaySystem, 0, 0, f.GetSize(), object);

   resolveBones(ctx, null, object);

   if(freeTexturesByID)
      delete ctx.texturesByID;

   delete ctx;
}
