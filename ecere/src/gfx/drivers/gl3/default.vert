attribute vec3 vertex;
uniform mat4 projection_matrix;

#if MODELVIEW
   uniform mat4 modelview_matrix;
#endif

#if PER_VERTEX_COLOR
   attribute vec4 color;
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && ((!NON_LOCAL_VIEWER && MAT_SPECULAR) || (LIGHT0_POSITIONAL || LIGHT1_POSITIONAL || LIGHT2_POSITIONAL || LIGHT3_POSITIONAL || LIGHT4_POSITIONAL || LIGHT5_POSITIONAL || LIGHT6_POSITIONAL || LIGHT7_POSITIONAL)))
   varying vec3 nnEyeToSurface;
#endif

#if LIGHTING_ON
   attribute vec3 normal;
   attribute vec3 tangent1;
   attribute vec3 tangent2;

   uniform float nearPlane;
#if NORMALS_INV_SCALE
   uniform vec3 normals_inv_scale2;
#endif

   #if PER_VERTEX_COLOR
      varying vec4 diffuseColor; // w: opacity
      varying vec3 ambientColor;
   #endif

   varying vec3 tNormal;
   #if NORMALS_MAPPING
      varying vec3 tTangent1;
      varying vec3 tTangent2;
   #endif

#elif PER_VERTEX_COLOR
   uniform vec4 matDiffuse;
   varying vec4 fColor;
#endif

#if FOG_ON
   uniform float fogDensity;
   varying float fogZ;
#endif

#if CUBEMAP_ON
   varying vec3 fTexCoord;
   attribute vec3 texCoord;
#elif TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP
   attribute vec2 texCoord;
   varying vec2 fTexCoord;
#endif

void main(void)
{
#if MODELVIEW
   vec4 pos = modelview_matrix * vec4(vertex, 1.0);
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
}
