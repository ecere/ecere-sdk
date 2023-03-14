#ifdef ECERE_STATIC
public import static "ecere"
#else
public import "ecere"
#endif

enum E3DBlockType : uint16
{
   version             = 0x0001,

   lzma                = 0x0010,

   meshes              = 0x1000,
      mesh             = 0x1010,
         meshID        = 0x1020,
         meshBBox      = 0x1021,
         meshDuplVerts = 0x1022,
         attributes          = 0x2000,      // uint count (limit of 65,536 vertices)
            attrVertices     = 0x2010,      // float x,y,z vertices
            attrVerticesDbl  = 0x2011,      // double x,y,z vertices
            attrQVertices    = 0x2018,      // quantized x,y,z 16-bit vertices (first, deltas)
            attrNormals      = 0x2020,      // 10_10_10_2
            attrTexCoords    = 0x2030,      // float u,v
            attrTexCoords2   = 0x2031,      // float u,v (2nd)
            attrTexCoords3   = 0x2032,      // float u,v (3rd)
            attrTexCoords4   = 0x2033,      // float u,v (4th)
            attrTexCoords5   = 0x2034,      // float u,v (5th)
            attrTexCoords6   = 0x2035,      // float u,v (6th)
            attrTexCoords7   = 0x2036,      // float u,v (7th)
            attrTexCoords8   = 0x2037,      // float u,v (8th)
            attrColors       = 0x2070,      // byte r,g,b,a
            attrTangentsSign = 0x2080,      // 10_10_10_2 -- first extra bit: sign for co-tangent
            attrTangentsBT   = 0x2081,      // 2x 10_10_10_2
            attrBoneWeights  = 0x2090,      // skin bones and weights - (excluding dup vertices)
                                            // count * 1..255 byte bone ID (0 indicating no bone);
                                            // count * 0..1 weight mapped to 0..255
                                            // (max number of bones implied from next offset increment)
            attrBoneWeights2 = 0x2091,      // Alternative skin bones and weights (additional skins)
            attrBoneWeights3 = 0x2092,
            attrBoneWeights4 = 0x2093,
            attrBoneWeights5 = 0x2094,
            attrBoneWeights6 = 0x2095,
            attrBoneWeights7 = 0x2096,
            attrBoneWeights8 = 0x2097,

            attrInterleaved  = 0x2800,      // currently supporting: [vertices, normals, texCoords]
         triFaces16     = 0x1030,
         triFaces32     = 0x1031,
         facesMaterials = 0x1040,
         skin           = 0x1050,
            skinName          = 0x1051,   // name string
            skinBindMatrix    = 0x1052,   // 4x4 32-bit float which bone definitions inverse bind matrices are relative to
            skinBones         = 0x1053,   // byte number of bones, for each bone:
                                          //    nodeName referencing a node;
                                          //    4x4 32-bit float inverse bind matrix (relative to skin bind matrix)
            skinBoneWeights   = 0x1054,   // byte 0..7: set of bone weights to use for this skin

         parts          = 0x1060,
         morphs         = 0x1070,         // integer Count
            morph          = 0x1071,
               morphID        = 0x1072,
               morphName      = 0x1073,
               morphWeight    = 0x1074,   // TODO: Use morph weights uniforms for GPU morphs?
               // [meshID (reference)]    // TODO: Load as vertex attribute instead for GPU morphs? Keep as meshID for re-use?
   nodes             = 0x3000,
      meshNode             = 0x3010,
         nodeID            = 0x3020,
         nodeName          = 0x3021,
         scaling             = 0x3030,
         orientation         = 0x3031,
         position            = 0x3032,
         skeleton            = 0x3040,    // Should we change this to have skeletonID, skeletonName blocks?
         // Can have sub-nodes!

      cameraNode             = 0x3011,
      lightNode              = 0x3012,

   materials               = 0x8000,
      material             = 0x8010,
         materialID           = 0x8011,
         materialName         = 0x8012,
         materialGroup        = 0x8013, // Value of 0: not computed...

         materialFlags        = 0x8020, // Flags
         opacity              = 0x8021, // float
         refractionRelIndex   = 0x8022, // refraction index of material / RI of containing medium
         reflectivity         = 0x8023, // float
         phongShininess       = 0x8024, // float

         // Colors
         diffuse              = 0x8030,
         specular             = 0x8031,
         emissive             = 0x8032,
         ambient              = 0x8034, // default to diffuse if not set?

         // Maps
         // use textureID or textureName for the maps:
         // use attrTexCoords2..attrTexCoords8 to use different texCoords
         emissiveMap          = 0x8100,
         normalMap            = 0x8101,
         heightmap            = 0x8102, // float  for parallax mapping
         ambientOcclusionMap  = 0x8103, // float

         //normalMapXY          = 0x8110,    // 1-sqrt() -- 2 color option

         phongDiffuseMap      = 0x8200, // include opacity
         phongSpecularMap     = 0x8201,
         phongAmbientMap      = 0x8202,

         // PBR Roughness Metal
         pbrRMAlbedo          = 0x8300, // include opacity
         pbrRMRoughnessMetalness = 0x8301,   // 8 bit each (16 bits)
         // pbrRMRoughnessMetalnessAO = 0x8310, // 8 bit each (24 bits)
         // pbrRMNormalXYRMMap  = 0x8311, 10_10_10_2

         // PBR Specular
         pbrSpecDiffuseMap    = 0x8400, // include opacity
         pbrSpecSpecularGlossMap = 0x8401, // Color + 8 bit

   textures           = 0x9000,
      texture         = 0x9001,
         textureID              = 0x9002,
         textureName            = 0x9003,
         texturePNG             = 0x9101,
         textureJPG             = 0x9102,
         textureJPG2K           = 0x9103,

   animations         = 0xA000,
      animation       = 0xA010,
         animationName          = 0xA021, // String name
         animationFrames        = 0xA022, // (uint) Start, end and default frame
         animationTrack         = 0xA100, // An animation frame track
                                          //    (uint) number of keys;
                                          //    number of keys * (uint) frameNumber;
                                          //    1-byte bool looping flag
                                          //    [TCBEase and Frame Track Key sub-blocks]
                                          //    [nodeID and/or nodeName sub-blocks (references)]
            frameTCBEase        = 0xA110, // Tension, continuity, bias and easeFrom / easeTo for each key: 32-bit floats
            ftkRotationOrder    = 0xA120, // 0: xyz, 1: xzy, 2: yxz, 3: yzx, 4: zxy, 5: zyx (default: zxy)
            ftkPosition         = 0xA210, // Translation -- 3 (x,y,z) float positions per key
            ftkScaling          = 0xA220, // Scaling -- 3 (x,y,z) float scaling per key
            ftkRotation         = 0xA230, // Rotation -- 4 (w,x,y,z) float quaternion orientation per key
            ftkYaw              = 0xA240, // Yaw orientation -- float yaw orientation (in degrees) per key
            ftkPitch            = 0xA250, // Pitch orientation -- float pitch orientation (in degrees) per key
            ftkRoll             = 0xA260, // Roll orientation -- float roll orientation (in degrees) per key
            ftkCameraFieldOfView= 0xA270, // Camera field of view -- float camera field of view (in degrees) per key
            ftkCameraRoll       = 0xA280, // Camera roll -- float camera roll (in degrees) per key
            ftkLightHotSpot     = 0xA290, // Light hot spot -- float light hot spot (in degrees) per key
            ftkLightFallOff     = 0xA2A0, // Light fall off -- float light fall off (in degrees) per key
            ftkLightColor       = 0xA2B0, // Light color -- 3 (r,g,b) float 0..1 light color per key
            ftkHide             = 0xA2C0, // Hide node -- 1 boolean byte (0: displayed, 1: hidden) per key
            ftkMorph            = 0xA300  // Morph -- int morph index, float weight (per key)
};

struct E3DBlockHeader
{
   E3DBlockType type __attribute__((packed));
   uint32 size       __attribute__((packed));
};

class E3DMaterialFlags : uint32
{
public:
   bool doubleSided:1;
   bool partlyTransparent:1;
   bool translucent:1;
   bool wrapU:1;
   bool wrapV:1;
};

void vecfUnpack10i(uint32 sum, Vector3Df dst, Vector3Df v2)
{
   int part = ( sum >> 0 ) & 1023;
   dst.x = ( part & 512 ) ? (float)( 1024 - part ) * (-1.0f/512.0f) : (float)part * (1.0f/511.0f);

   part = ( sum >> 10 ) & 1023;
   dst.y = ( part & 512 ) ? (float)( 1024 - part ) * (-1.0f/512.0f) : (float)part * (1.0f/511.0f);

   part = ( sum >> 20 ) & 1023;
   dst.z = ( part & 512 ) ? (float)( 1024 - part ) * (-1.0f/512.0f) : (float)part * (1.0f/511.0f);

   if(v2 != null)
   {
      part = ( sum >> 30 ) & 3;  // TODO: Compute this properly
      v2.z = ( part & 2 ) ? (float)( 4 - part ) * (-1.0f/2.0f) : (float)part;
   }
}

uint32 vecfPack10i(Vector3Df src, Vector3Df v2)
{
   uint32 sum = 0;
   int part;
   float v = Min( 1.0f, Max( -1.0f, src.x ) );
   part = v > 0.0f ? (int)( ( v * 511.0f ) + 0.5f ) : (int)( ( v * 512.0f ) - 0.5f );
   sum |= ( (uint32_t)part & 1023 ) << 0;
   v = Min( 1.0f, Max( -1.0f, src.y ) );
   part = v > 0.0f ? (int)( ( v * 511.0f ) + 0.5f ) : (int)( ( v * 512.0f ) - 0.5f );
   sum |= ( (uint32_t)part & 1023 ) << 10;
   v = Min( 1.0f, Max( -1.0f, src.z ) );
   part = v > 0.0f ? (int)( ( v * 511.0f ) + 0.5f ) : (int)( ( v * 512.0f ) - 0.5f );
   sum |= ( (uint32_t)part & 1023 ) << 20;
   if(v2 != null)
   {
      v = Min( 1.0f, Max( -1.0f, v2.x ) );   // TODO: Compute this properly
      part = v > 0.0f ? (int)( ( v * 1.0f ) + 0.5f ) : (int)( ( v * 2.0f ) - 0.5f );
      sum |= ( (uint32_t)part & 3 ) << 30;
   }
   return sum;
}

enum TextureExtensionAction {keep, strip, add};

enum TextureEmbeddingMethod {embed, reference, refAndWrite};

struct E3DOptions
{
   Map<uint, Bitmap> texturesByID;
   const String texturesPath;
   TextureExtensionAction extAction;
   TextureEmbeddingMethod embedAs;
   // Not currently resolving IDs globally for materials...
   AVLTree<Material> materials;

   bool positiveYUp;
   bool shareIndices;   // Set to true to use mesh.indices and group.baseIndex while loading
   int resolution;
   bool compressedTextures;
   bool skipTexturesProcessing;
   int enforcedTexWidth, enforcedTexHeight;

   Mutex saveCompressedMutex; // TODO: It might be better to have callbacks for loading texures?
   void *getTextureContext;
   File (*getTextureCallback)(void *context, const String name, int width, int height, const String format);

   void * lookupTextureContext;
   void (* saveCompressedCallback)(void * context, const String name, int width, int height, Bitmap bitmap);
};

class E3DContext : struct
{
   Map<uint, Bitmap> texturesByID;
   const String texturesPath;
   AVLTree<Material> materials;

   bool positiveYUp;
   bool shareIndices;
   int resolution;
   bool compressedTextures;
   bool skipTexturesProcessing;
   int enforcedTexWidth, enforcedTexHeight;

   const String path;
   Mutex saveCompressedMutex;
   int curTextureID;
   void *getTextureContext;
   File (*getTextureCallback)(void *context, const String name, int width, int height, const String format);

   Map<uint, Material> materialsByID { };   // Right now this is per E3D... Support supplying optional materials map? Resolve later?
   Map<uint, Mesh> meshesByID { };
   Map<uint, bool> meshOwned { };

   void (*saveCompressedCallback)(void * context, const String name, int width, int height, Bitmap bitmap);

   Map<uint, Object> nodesByID { };
   Map<uint, String> skeletonTags { };
}

class E3DWriteContext : struct
{
    // To keep IDs consistent between models.
   Map<uint, Bitmap> texturesByID;
   String texturesPath;  // intended to be copied from E3DOptions::texturesPath
   TextureExtensionAction extAction;
   TextureEmbeddingMethod embedAs;



   Array<Material> materials { };
   char path[MAX_LOCATION];
   Map<uintptr, int> texturesToID { };
   Map<uintptr, Array<FacesMaterial>> meshFaceMaterials { };
   Array<Mesh> allMeshes { };
   Map<uintptr, int> meshToID { };
   Array<Bitmap> textures { };
   Array<bool> texUsePNG { };
   int firstTexture;
   AVLTree<int> texUsed { };
   Array<Object> allAnimatedObjects { };
   Map<uintptr, int> objectToNodeID { };
   uint nodeID;
   uint morphID;

   ~E3DWriteContext()
   {
      materials.RemoveAll();
      allMeshes.RemoveAll();
      meshFaceMaterials.Free();
      meshToID.Free();
      delete texturesPath;

      // NOTE: These may have been kept around to re-use textures...
      textures.RemoveAll();
      texturesToID.Free();
      texUsePNG.Free();
   }
};
