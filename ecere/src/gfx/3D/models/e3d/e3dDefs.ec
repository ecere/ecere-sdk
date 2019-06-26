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
         attributes          = 0x2000,
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
            attrSkin         = 0x2090,      // skin bones and weights
            attrInterleaved  = 0x2800,      // currently supporting: [vertices, normals, texCoords]
         triFaces16     = 0x1030,
         triFaces32     = 0x1031,
         facesMaterials = 0x1040,
         bones          = 0x1050,
         parts          = 0x1060,

   nodes             = 0x3000,
      meshNode             = 0x3010,
         nodeID            = 0x3020,
         nodeName          = 0x3021,
         scaling             = 0x3030,
         orientation         = 0x3031,
         position            = 0x3032,

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

   animations          = 0xA000
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
