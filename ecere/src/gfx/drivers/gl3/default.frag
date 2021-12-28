#if GLSL_FLOAT_PRECISION
precision highp float;
#endif
#if TEXTURE_EXTERNAL
#extension GL_OES_EGL_image_external : enable
#endif

#if __VERSION__ >= 300
#define VARYING   in
#define texture2D texture
#else
#define VARYING   varying
#endif

#if __VERSION__ >= 130
out vec4 fragColor;
#define gl_FragColor fragColor
#endif
/*
#if MODERN_GLSL
#define varying in
#define texture2D texture
#define gl_FragColor fragColor
out vec4 fragColor;
#endif
*/
#if ALPHATEST_ON
   uniform float alphaFuncValue;
#endif

#if LIGHTING_ON
   #if PER_VERTEX_COLOR
      VARYING vec4 diffuseColor;
      VARYING vec3 ambientColor;
   #elif CONSTANT_COLOR
      uniform vec4 matDiffuse;
      uniform vec3 matAmbient;
   #endif
   VARYING vec3 tNormal;
#if NORMALS_MAPPING
   VARYING vec3 tTangent1;
   VARYING vec3 tTangent2;
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && ((!NON_LOCAL_VIEWER && MAT_SPECULAR) || (LIGHT0_POSITIONAL || LIGHT1_POSITIONAL || LIGHT2_POSITIONAL || LIGHT3_POSITIONAL || LIGHT4_POSITIONAL || LIGHT5_POSITIONAL || LIGHT6_POSITIONAL || LIGHT7_POSITIONAL)))
   VARYING vec3 nnEyeToSurface;
#endif

#if MAT_SPECULAR

#if CONSTANT_COLOR
   // Materials
   uniform vec3 matSpecular;
#endif
   uniform float matPower;
#endif

#if CONSTANT_COLOR
   uniform vec3 matEmissive;
#endif

   // Lights
   uniform vec3 lightsPos[NUM_LIGHTS];
   uniform vec3 lightsAtt[NUM_LIGHTS];

   uniform vec3 lightsSpotDir[NUM_LIGHTS];
   uniform float lightsSpotCutOffCos[NUM_LIGHTS];
   uniform float lightsSpotExp[NUM_LIGHTS];

   uniform vec3 lightsDiffuse[NUM_LIGHTS];
   uniform vec3 lightsAmbient[NUM_LIGHTS];
   uniform vec3 lightsSpecular[NUM_LIGHTS];

   uniform vec3 globalAmbient;
#elif PER_VERTEX_COLOR
   VARYING vec4 fColor;
#else
   uniform vec4 matDiffuse;
#endif

#if ENVIRONMENT_MAPPING
   uniform samplerCube envTex;
   uniform mat3 cubemap_matrix;

   #if ENVIRONMENT_REFLECTION
      uniform float matReflectivity;
   #endif

   #if ENVIRONMENT_MAPPING
      uniform float matRefractionETA;
   #endif

#endif

#if TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP || CUBEMAP_ON

   #if BLACKTINT
      uniform vec3 blackTint;
   #endif

   #if SPECULAR_MAPPING
      uniform sampler2D specularTex;
   #endif

   #if CUBEMAP_ON
      uniform samplerCube diffuseTex;
      VARYING vec3 fTexCoord;
   #else
      VARYING vec2 fTexCoord;
   #endif

   #if TEXTURE_ON
   #if TEXTURE_EXTERNAL
      uniform samplerExternalOES diffuseTex;
   #else
      uniform sampler2D diffuseTex;
   #endif
   #endif

   #if NORMALS_MAPPING
      uniform sampler2D bumpTex;
   #endif

   #if REFLECTION_MAP
      uniform sampler2D reflectTex;
   #endif

   #if TEXTURE_MATRIX
      uniform mat4 texture_matrix;
   #endif
#endif

#if FOG_ON
   uniform vec3 fogColor;
   VARYING float fogZ;
#endif

#if LIGHTING_ON
void computeLight(vec3 light, vec3 n, vec3 eye, inout vec3 ambient, inout vec3 diffuse, inout vec3 specular,
   bool isPositional, bool isSpot, bool doAttenuation, vec3 spotDir, float spotCutOffCos, float spotExp, vec3 att,
   vec3 lightAmbient, vec3 lightDiffuse, vec3 lightSpecular)
{
   float nDotL, attenuation = 1.0;
#if MAT_SPECULAR
   float pf = 0.0;
#endif
   vec3 l;
   float d;

   if(isPositional && doAttenuation)
   {
      d = length(light);
      l = light / d;
   }
   else
      l = normalize(light);

   if(isPositional && isSpot)
   {
      float spotDot = dot(l, spotDir);
      attenuation = (spotDot < spotCutOffCos) ? 0.0 : pow(max(0.0, spotDot), spotExp);
   }

   nDotL = max(0.0, dot(n, l));

   if(isPositional && doAttenuation)
      attenuation /= (att.x + att.y * d + att.z * d * d);

#if MAT_SPECULAR
   {
   #if LIGHTING_SPECULAR_BLINN
      float nDotHV = dot(n, normalize(l + eye));
      if(nDotL > 0.0)
   #else
      float nDotHV = dot(reflect(-l, n), eye);
   #endif
      pf = pow(max(0.0, nDotHV), matPower);
   }
#endif

   ambient  += lightAmbient  * attenuation;
   diffuse  += lightDiffuse  * attenuation * nDotL;
#if MAT_SPECULAR
   specular += lightSpecular * attenuation * pf;
#endif
}
#endif

void main(void)
{
   vec4 c;

#if CUBEMAP_ON
   vec3 texCoord;
   #if TEXTURE_MATRIX
       texCoord = (vec4(fTexCoord, 1) * texture_matrix).xyz;
   #else
       texCoord = fTexCoord;
   #endif
#elif NORMALS_MAPPING || TEXTURE_ON || SPECULAR_MAPPING || REFLECTION_MAP
   vec2 texCoord;
   #if TEXTURE_MATRIX
       texCoord = (vec4(fTexCoord, 0.0, 1.0) * texture_matrix).xy;
   #else
       texCoord = fTexCoord;
   #endif
#endif

#if LIGHTING_ON || ENVIRONMENT_MAPPING
   vec3 n;
#endif

#if LIGHTING_ON && !PER_VERTEX_COLOR && CONSTANT_COLOR
   vec4 diffuseColor = matDiffuse;
   vec3 ambientColor = matAmbient;
#elif !PER_VERTEX_COLOR
   vec4 diffuseColor = vec4(1.0, 1.0, 1.0, 1.0);
   vec3 ambientColor = vec3(1.0, 1.0, 1.0);
#endif

#if ENVIRONMENT_MAPPING || (LIGHTING_ON && !NON_LOCAL_VIEWER && MAT_SPECULAR)
   vec3 eyeToSurface = normalize(nnEyeToSurface);
#endif

#if LIGHTING_ON
   vec3 lights[NUM_LIGHTS];
   vec3 diffuse = vec3(0), ambient = vec3(0), specular = vec3(0);
   {
   #if !NON_LOCAL_VIEWER && MAT_SPECULAR
      vec3 lEye = -eyeToSurface;
   #else
      vec3 lEye = vec3(0.0, 0.0, 1.0);
   #endif

   #if NORMALS_MAPPING
      mat3 tbn = mat3(normalize(tTangent1), normalize(tTangent2), normalize(tNormal));
      n = tbn * (2.0 * vec3(texture2D(bumpTex, texCoord)) - 1.0);
      // n = tbn * (2.0 * vec3(0.5, 0.5, 1.0) - 1.0);
   #else
      n = normalize(tNormal);
   #endif
      n.y = -n.y;

      #if NUM_LIGHTS > 0 && LIGHT0_ON && LIGHT0_POSITIONAL
         lights[0] = lightsPos[0] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 1 && LIGHT1_ON && LIGHT1_POSITIONAL
         lights[1] = lightsPos[1] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 2 && LIGHT2_ON && LIGHT2_POSITIONAL
         lights[2] = lightsPos[2] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 3 && LIGHT3_ON && LIGHT3_POSITIONAL
         lights[3] = lightsPos[3] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 4 && LIGHT4_ON && LIGHT4_POSITIONAL
         lights[4] = lightsPos[4] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 5 && LIGHT5_ON && LIGHT5_POSITIONAL
         lights[5] = lightsPos[5] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 6 && LIGHT6_ON && LIGHT6_POSITIONAL
         lights[6] = lightsPos[6] - nnEyeToSurface;
      #endif
      #if NUM_LIGHTS > 7 && LIGHT7_ON && LIGHT7_POSITIONAL
         lights[7] = lightsPos[7] - nnEyeToSurface;
      #endif

   #if MAT_TWOSIDED
      if(!gl_FrontFacing) n = -n;
   #endif

   #if NUM_LIGHTS > 0 && LIGHT0_ON
      computeLight(bool(LIGHT0_POSITIONAL) ? lights[0] : lightsPos[0], n, lEye, ambient, diffuse, specular,
         bool(LIGHT0_POSITIONAL), bool(LIGHT0_SPOT), bool(LIGHT0_ATT),
         bool(LIGHT0_SPOT) ? lightsSpotDir[0] : vec3(0), bool(LIGHT0_SPOT) ? lightsSpotCutOffCos[0] : 0.0, bool(LIGHT0_SPOT) ? lightsSpotExp[0] : 0.0,
         bool(LIGHT0_ATT) ? lightsAtt[0] : vec3(1,0,0),
         lightsAmbient[0], lightsDiffuse[0], lightsSpecular[0]);
   #endif
   #if NUM_LIGHTS > 1 && LIGHT1_ON
      computeLight(bool(LIGHT1_POSITIONAL) ? lights[1] : lightsPos[1], n, lEye, ambient, diffuse, specular,
         bool(LIGHT1_POSITIONAL), bool(LIGHT1_SPOT), bool(LIGHT1_ATT),
         bool(LIGHT1_SPOT) ? lightsSpotDir[1] : vec3(0), bool(LIGHT1_SPOT) ? lightsSpotCutOffCos[1] : 0.0, bool(LIGHT1_SPOT) ? lightsSpotExp[1] : 0.0,
         bool(LIGHT1_ATT) ? lightsAtt[1] : vec3(1,0,0),
         lightsAmbient[1], lightsDiffuse[1], lightsSpecular[1]);
   #endif
   #if NUM_LIGHTS > 2 && LIGHT2_ON
      computeLight(bool(LIGHT2_POSITIONAL) ? lights[2] : lightsPos[2], n, lEye, ambient, diffuse, specular,
         bool(LIGHT2_POSITIONAL), bool(LIGHT2_SPOT), bool(LIGHT2_ATT),
         bool(LIGHT2_SPOT) ? lightsSpotDir[2] : vec3(0), bool(LIGHT2_SPOT) ? lightsSpotCutOffCos[2] : 0.0, bool(LIGHT2_SPOT) ? lightsSpotExp[2] : 0.0,
         bool(LIGHT2_ATT) ? lightsAtt[2] : vec3(1,0,0),
         lightsAmbient[2], lightsDiffuse[2], lightsSpecular[2]);
   #endif
   #if NUM_LIGHTS > 3 && LIGHT3_ON
      computeLight(bool(LIGHT3_POSITIONAL) ? lights[3] : lightsPos[3], n, lEye, ambient, diffuse, specular,
         bool(LIGHT3_POSITIONAL), bool(LIGHT3_SPOT), bool(LIGHT3_ATT),
         bool(LIGHT3_SPOT) ? lightsSpotDir[3] : vec3(0), bool(LIGHT3_SPOT) ? lightsSpotCutOffCos[3] : 0.0, bool(LIGHT3_SPOT) ? lightsSpotExp[3] : 0.0,
         bool(LIGHT3_ATT) ? lightsAtt[3] : vec3(1,0,0),
         lightsAmbient[3], lightsDiffuse[3], lightsSpecular[3]);
   #endif
   #if NUM_LIGHTS > 4 && LIGHT4_ON
      computeLight(bool(LIGHT4_POSITIONAL) ? lights[4] : lightsPos[4], n, lEye, ambient, diffuse, specular,
         bool(LIGHT4_POSITIONAL), bool(LIGHT4_SPOT), bool(LIGHT4_ATT),
         bool(LIGHT4_SPOT) ? lightsSpotDir[4] : vec3(0), bool(LIGHT4_SPOT) ? lightsSpotCutOffCos[4] : 0.0, bool(LIGHT4_SPOT) ? lightsSpotExp[4] : 0.0,
         bool(LIGHT4_ATT) ? lightsAtt[4] : vec3(1,0,0),
         lightsAmbient[4], lightsDiffuse[4], lightsSpecular[4]);
   #endif
   #if NUM_LIGHTS > 5 && LIGHT5_ON
      computeLight(bool(LIGHT5_POSITIONAL) ? lights[5] : lightsPos[5], n, lEye, ambient, diffuse, specular,
         bool(LIGHT5_POSITIONAL), bool(LIGHT5_SPOT), bool(LIGHT5_ATT),
         bool(LIGHT5_SPOT) ? lightsSpotDir[5] : vec3(0), bool(LIGHT5_SPOT) ? lightsSpotCutOffCos[5] : 0.0, bool(LIGHT5_SPOT) ? lightsSpotExp[5] : 0.0,
         bool(LIGHT5_ATT) ? lightsAtt[5] : vec3(1,0,0),
         lightsAmbient[5], lightsDiffuse[5], lightsSpecular[5]);
   #endif
   #if NUM_LIGHTS > 6 && LIGHT6_ON
      computeLight(bool(LIGHT6_POSITIONAL) ? lights[6] : lightsPos[6], n, lEye, ambient, diffuse, specular,
         bool(LIGHT6_POSITIONAL), bool(LIGHT6_SPOT), bool(LIGHT6_ATT),
         bool(LIGHT6_SPOT) ? lightsSpotDir[6] : vec3(0), bool(LIGHT6_SPOT) ? lightsSpotCutOffCos[6] : 0.0, bool(LIGHT6_SPOT) ? lightsSpotExp[6] : 0.0,
         bool(LIGHT6_ATT) ? lightsAtt[6] : vec3(1,0,0),
         lightsAmbient[6], lightsDiffuse[6], lightsSpecular[6]);
   #endif
   #if NUM_LIGHTS > 7 && LIGHT7_ON
      computeLight(bool(LIGHT7_POSITIONAL) ? lights[7] : lightsPos[7], n, lEye, ambient, diffuse, specular,
         bool(LIGHT7_POSITIONAL), bool(LIGHT7_SPOT), bool(LIGHT7_ATT),
         bool(LIGHT7_SPOT) ? lightsSpotDir[7] : vec3(0), bool(LIGHT7_SPOT) ? lightsSpotCutOffCos[7] : 0.0, bool(LIGHT7_SPOT) ? lightsSpotExp[7] : 0.0,
         bool(LIGHT7_ATT) ? lightsAtt[7] : vec3(1,0,0),
         lightsAmbient[7], lightsDiffuse[7], lightsSpecular[7]);
   #endif

   #if MAT_SPECULAR && SPECULAR_MAPPING
      vec3 specTexel = vec3(texture2D(specularTex, texCoord));
      specular *= vec3(specTexel.r, specTexel.r, specTexel.r);
   #endif

      c = vec4(min(vec3(1.0),
            ambientColor * (ambient + globalAmbient) + diffuseColor.xyz * diffuse
   #if CONSTANT_COLOR
            + matEmissive
   #endif
   #if MAT_SPECULAR && !MAT_SEPARATE_SPECULAR
            + specular
      #if CONSTANT_COLOR
               * matSpecular
      #endif
   #endif
         ), diffuseColor.w);
   }
#elif PER_VERTEX_COLOR
   c = fColor;
#else
   c = matDiffuse;
#endif

#if TEXTURE_ON
   vec4 texel;
   texel = texture2D(diffuseTex, texCoord);
   #if SWIZZLE_ALPHA
      texel = vec4(1,1,1,texel.a);
   #elif SWIZZLE_RED
      texel = vec4(1,1,1,texel.r);
   #endif
#if ALPHATEST_ON
   if(texel.a < alphaFuncValue)
      discard;
#endif

#if BLACKTINT
   c = vec4(c.rgb * texel.rgb + blackTint.rgb * (vec3(1.0,1.0,1.0)-texel.rgb), c.a * texel.a);
#else
   c *= texel;
#endif

#elif CUBEMAP_ON
   vec4 texel;
   texel = textureCube(diffuseTex, texCoord);
   #if SWIZZLE_ALPHA
      texel = vec4(1,1,1,texel.a);
   #elif SWIZZLE_RED
      texel = vec4(1,1,1,texel.r);
   #endif
   c *= texel;
#endif

#if ENVIRONMENT_MAPPING
   vec3 v;
   #if ENVIRONMENT_REFRACTION
   {
      float opacity = c.w;
      v = refract(eyeToSurface, n, matRefractionETA);
      c = vec4(opacity * c + (1.0 - opacity) * textureCube(envTex, vec3(cubemap_matrix * v)));
   }
   #endif

   #if ENVIRONMENT_REFLECTION
   {
      float reflectivity = matReflectivity;
   #if REFLECTION_MAP
      reflectivity *= texture2D(reflectTex, texCoord).r;
   #endif
      v = reflect(eyeToSurface, n);
      c = (1.0 - reflectivity) * c + reflectivity * textureCube(envTex, vec3(cubemap_matrix * v));
   }
   #endif
#endif

#if LIGHTING_ON && MAT_SPECULAR && MAT_SEPARATE_SPECULAR
   c = min(vec4(1.0), vec4(vec3(c) + specular
   #if CONSTANT_COLOR
      * matSpecular
   #endif
      , c.w));
#endif

#if FOG_ON
   {
      float fog = clamp(exp(fogZ), 0.0, 1.0);
      c = vec4(fog * c.xyz + (1.0 - fog) * fogColor, c.w);
   }
#endif

#ifdef LIMITED_COLORS
   #define LIMITED_MULTIPLIER    10.0
   #define LIMITED_MODULO        2.0

   c.x -= mod(c.x * LIMITED_MULTIPLIER, LIMITED_MODULO) / LIMITED_MULTIPLIER;
   c.y -= mod(c.y * LIMITED_MULTIPLIER, LIMITED_MODULO) / LIMITED_MULTIPLIER;
   c.z -= mod(c.z * LIMITED_MULTIPLIER, LIMITED_MODULO) / LIMITED_MULTIPLIER;
#endif

#if DEBUGGING
   //c = vec4(0.5 * (n + 1.0), 1.0);

   #if NORMALS_MAPPING
      //c = vec4(0.5 * (normalize(-tNormal) + 1.0), 1.0);
      //c = vec4(0.5 * (normalize(tTangent1) + 1.0), 1.0);
      //c = vec4(0.5 * (normalize(tTangent2) + 1.0), 1.0);
   #endif
   //c = c * 0.5;
   //c = vec4(vec3(c), 0.5);

   #if NORMALS_MAPPING
      //c = vec4((vec3(n.x + 1.0, n.y + 1.0, n.z + 1.0) / 2.0), 1.0);
      //c = texture2D(bumpTex, fTexCoord);
   #endif
   #if TEXTURE_ON || NORMALS_MAPPING || SPECULAR_MAPPING || REFLECTION_MAP
      //c = vec4(texCoord.x, texCoord.y, 0.0, 1.0);
   #endif


   #if MAT_SPECULAR
      #if !NON_LOCAL_VIEWER
         //c = vec4((vec3(0.0, eyeToSurface.y + 1.0, 0.0) / 2.0), 1.0);

         //c = vec4((n / 2.0) + vec3(0.5), 1.0);

         #if ENVIRONMENT_MAPPING
            // c = vec4((v / 2.0) + vec3(0.5), 1.0);
         #endif
      #endif
   #endif
#endif

   gl_FragColor = c;
}
