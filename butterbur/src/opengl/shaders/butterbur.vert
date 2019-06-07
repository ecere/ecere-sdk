#if __VERSION__ >= 300
#define ATTRIBUTE in
#define VARYING   out
#else
#define ATTRIBUTE attribute
#define VARYING   varying
#endif

ATTRIBUTE vec3 vertex;
uniform mat4 projection_matrix;

#if 0 //__VERSION__ == 300
uniform uint drawID1;
#else
ATTRIBUTE uint drawID1;
#endif

#if FULL_3D_TRANSFORM
ATTRIBUTE vec3 transform0;
ATTRIBUTE vec3 transform1;
ATTRIBUTE vec3 transform2;
ATTRIBUTE vec3 transform3;
#else
ATTRIBUTE vec3 posOffset;
#endif

#if MODELVIEW
   uniform mat4 modelview_matrix;
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

   flat out uint drawID;

void main(void)
{
#if MODELVIEW
   vec4 pos = modelview_matrix *
#if MULTI_DRAW && FULL_3D_TRANSFORM
      mat4(vec4(transform0, 0), vec4(transform1, 0), vec4(transform2, 0), vec4(transform3, 1)) *
#endif
      vec4(vertex
#if MULTI_DRAW && !FULL_3D_TRANSFORM
       + posOffset
#endif
       , 1.0);
#else
   vec4 pos = vec4(vertex, 1.0);
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && ((!NON_LOCAL_VIEWER && MAT_SPECULAR) || (LIGHT0_POSITIONAL || LIGHT1_POSITIONAL || LIGHT2_POSITIONAL || LIGHT3_POSITIONAL || LIGHT4_POSITIONAL || LIGHT5_POSITIONAL || LIGHT6_POSITIONAL || LIGHT7_POSITIONAL)))
   nnEyeToSurface = vec3(pos.x, -pos.y, pos.z) * nearPlane;
#endif

#if LIGHTING_ON
   #if PER_VERTEX_COLOR
      diffuseColor = color;
      ambientColor = color.xyz;
   #endif

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

      tNormal = normals_matrix * normal;
   #if NORMALS_MAPPING
      tTangent1 = normals_matrix * tangent1;
      tTangent2 = normals_matrix * tangent2;
   #endif

#elif PER_VERTEX_COLOR
   fColor = matDiffuse * color;
#endif

   gl_Position = projection_matrix * pos;

#if TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP
   fTexCoord = texCoord;
#endif

#if CUBEMAP_ON
   fTexCoord = vec3(vertex.x, -vertex.y, -vertex.z);
#endif

#if FOG_ON
   fogZ = pos.z * fogDensity;
#endif

   //drawID = gl_DrawID;
   drawID = drawID1;
}
