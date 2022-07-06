#if __VERSION__ >= 300
#define ATTRIBUTE in
#define VARYING   out
#else
#define ATTRIBUTE attribute
#define VARYING   varying
#endif
/*
#if MODERN_GLSL
#define attribute in
#define varying out
#endif
*/

ATTRIBUTE vec3 vertex;
uniform mat4 projection_matrix;

#if MODELVIEW
   uniform mat4 modelview_matrix;
#endif

#if SKIN_BONES
   #extension GL_EXT_gpu_shader4 : enable

   #define MAX_BONES 10
   #define NO_BONE   255u

   #define BONES_MAX_MATRICES 253

   ATTRIBUTE uvec4 boneIndices1;
   ATTRIBUTE uvec4 boneIndices2;
   ATTRIBUTE uvec2 boneIndices3;
   ATTRIBUTE vec4 boneWeights1;
   ATTRIBUTE vec4 boneWeights2;
   ATTRIBUTE vec2 boneWeights3;

   uniform mat3 boneMatrices[BONES_MAX_MATRICES];
   uniform vec3 boneOffsets [BONES_MAX_MATRICES];
#endif

#if PER_VERTEX_COLOR
   ATTRIBUTE vec4 color;
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && ((!NON_LOCAL_VIEWER && MAT_SPECULAR) || (LIGHT0_POSITIONAL || LIGHT1_POSITIONAL || LIGHT2_POSITIONAL || LIGHT3_POSITIONAL || LIGHT4_POSITIONAL || LIGHT5_POSITIONAL || LIGHT6_POSITIONAL || LIGHT7_POSITIONAL)))
   VARYING vec3 nnEyeToSurface;
#endif

#if LIGHTING_ON
   ATTRIBUTE vec3 normal;
   ATTRIBUTE vec3 tangent1;
   ATTRIBUTE vec3 tangent2;

   uniform float nearPlane;
#if NORMALS_INV_SCALE
   uniform vec3 normals_inv_scale2;
#endif

   #if PER_VERTEX_COLOR
      VARYING vec4 diffuseColor; // w: opacity
      VARYING vec3 ambientColor;
   #endif

   VARYING vec3 tNormal;
   #if NORMALS_MAPPING
      VARYING vec3 tTangent1;
      VARYING vec3 tTangent2;
   #endif

#elif PER_VERTEX_COLOR
   uniform vec4 matDiffuse;
   VARYING vec4 fColor;
#endif

#if FOG_ON
   uniform float fogDensity;
   VARYING float fogZ;
#endif

#if CUBEMAP_ON
   VARYING vec3 fTexCoord;
   ATTRIBUTE vec3 texCoord;
#elif TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP
   ATTRIBUTE vec2 texCoord;
   VARYING vec2 fTexCoord;
#endif

void main(void)
{
   vec3 sVertex;
#if LIGHTING_ON
   vec3 sNormal, sTangent1 = tangent1, sTangent2 = tangent2;
#endif

#if SKIN_BONES

   uint boneIndices[MAX_BONES];
   boneIndices[0] = boneIndices1.x; boneIndices[1] = boneIndices1.y;
   boneIndices[2] = boneIndices1.z; boneIndices[3] = boneIndices1.w;
   boneIndices[4] = boneIndices2.x; boneIndices[5] = boneIndices2.y;
   boneIndices[6] = boneIndices2.z; boneIndices[7] = boneIndices2.w;
   boneIndices[8] = boneIndices3.x; boneIndices[9] = boneIndices3.y;

   float boneWeights[MAX_BONES];
   boneWeights[0] = boneWeights1.x; boneWeights[1] = boneWeights1.y;
   boneWeights[2] = boneWeights1.z; boneWeights[3] = boneWeights1.w;
   boneWeights[4] = boneWeights2.x; boneWeights[5] = boneWeights2.y;
   boneWeights[6] = boneWeights2.z; boneWeights[7] = boneWeights2.w;
   boneWeights[8] = boneWeights3.x; boneWeights[9] = boneWeights3.y;

   float tw = 0.0;
   vec3 vt = vec3(0.0, 0.0, 0.0);
#if LIGHTING_ON
   vec3 nt = vec3(0.0, 0.0, 0.0);
#if NORMALS_MAPPING
   vec3 t1t = vec3(0.0, 0.0, 0.0);
   vec3 t2t = vec3(0.0, 0.0, 0.0);
#endif
#endif
   int j;

   for(j = 0; j < MAX_BONES; j++)
   {
      uint b = boneIndices[j];
      if(b != NO_BONE)
      {
         float w = boneWeights[j];
         vec3 v = boneMatrices[b] * vertex + boneOffsets[b];
         tw += w;
         vt += w * v;

#if LIGHTING_ON
         vec3 n = boneMatrices[b] * normal;
         nt += w * n;

#if NORMALS_MAPPING
         vec3 t1 = boneMatrices[b] * tangent1;
         t1t += w * t1;

         vec3 t2 = boneMatrices[b] * tangent2;
         t2t += w * t2;
#endif

#endif
      }
      else
         break;
   }

   if(tw != 0.0)
   {
      tw = 1.0 / tw;
      sVertex = vt * tw;
#if LIGHTING_ON
      sNormal = nt * tw;
#if NORMALS_MAPPING
      sTangent1 = t1t * tw;
      sTangent2 = t2t * tw;
#endif
#endif
   }
   else
   {
      sVertex = vertex;
#if LIGHTING_ON
      sNormal = normal;
#if NORMALS_MAPPING
      sTangent1 = tangent1;
      sTangent2 = tangent2;
#endif
#endif
   }
#else
   sVertex = vertex;
#if LIGHTING_ON
   sNormal = normal;
#endif
#endif

#if MODELVIEW
   vec4 pos = modelview_matrix * vec4(sVertex, 1.0);
#else
   vec4 pos = vec4(sVertex, 1.0);
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && ((!NON_LOCAL_VIEWER && MAT_SPECULAR) || (LIGHT0_POSITIONAL || LIGHT1_POSITIONAL || LIGHT2_POSITIONAL || LIGHT3_POSITIONAL || LIGHT4_POSITIONAL || LIGHT5_POSITIONAL || LIGHT6_POSITIONAL || LIGHT7_POSITIONAL)))
   nnEyeToSurface = vec3(pos.x, -pos.y, pos.z) * nearPlane;
#endif

#if LIGHTING_ON
   #if PER_VERTEX_COLOR
      diffuseColor = color;
      ambientColor = color.xyz;
   #endif

#if MODELVIEW
#if NORMALS_INV_SCALE
   mat3 normals_matrix = mat3(
      normals_inv_scale2.x * modelview_matrix[0][0], normals_inv_scale2.x * modelview_matrix[0][1], normals_inv_scale2.x * modelview_matrix[0][2],
      normals_inv_scale2.y * modelview_matrix[1][0], normals_inv_scale2.y * modelview_matrix[1][1], normals_inv_scale2.y * modelview_matrix[1][2],
      normals_inv_scale2.z * modelview_matrix[2][0], normals_inv_scale2.z * modelview_matrix[2][1], normals_inv_scale2.z * modelview_matrix[2][2]);
#else
   mat3 normals_matrix = mat3(
      modelview_matrix[0][0], modelview_matrix[0][1], modelview_matrix[0][2],
      modelview_matrix[1][0], modelview_matrix[1][1], modelview_matrix[1][2],
      modelview_matrix[2][0], modelview_matrix[2][1], modelview_matrix[2][2]);
#endif

      tNormal = normals_matrix * sNormal;
   #if NORMALS_MAPPING
      tTangent1 = normals_matrix * sTangent1;
      tTangent2 = normals_matrix * sTangent2;
   #endif
#else
      tNormal = sNormal;
   #if NORMALS_MAPPING
      tTangent1 = sTangent1;
      tTangent2 = sTangent2;
   #endif

#endif

#elif PER_VERTEX_COLOR
   fColor = matDiffuse * color;
#endif

   gl_Position = projection_matrix * pos;

#if TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP
   fTexCoord = texCoord;
#endif

#if CUBEMAP_ON
   fTexCoord = vec3(sVertex.x, -sVertex.y, -sVertex.z);
#endif

#if FOG_ON
   fogZ = pos.z * fogDensity;
#endif
}
