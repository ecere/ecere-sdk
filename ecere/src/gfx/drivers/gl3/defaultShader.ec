import "shaders"

#include "gl123es.h"

namespace gfx::drivers;

// **********   Default Shader   **********
public enum LightMode { off, dir, pos, posAtt, posSpot, posSpotAtt };
public enum SwizzleMode { off, alpha, red };

public class DefaultShaderBits : uint64
{
public:
   bool lighting:1;
   bool nonLocalViewer:1;
   bool twoSided:1;
   bool specular:1;
   bool separateSpecular:1;
   bool blinnSpecular:1;
   uint lightBits:24;
   bool perVertexColor:1;
   SwizzleMode swizzle:2;
   bool textureMatrix:1;
   bool texturing:1;
   bool alphaTest:1;
   bool cubeMap:1;
   bool modelView:1;
   bool fog:1;
   bool normalsMapping:1;
   bool specularMapping:1;
   bool environmentMapping:1;
   bool reflection:1;
   bool reflectionMap:1;
   bool refraction:1;
   bool debugging:1;
};

public class CompiledDefaultShader : CompiledShader
{
public:
   // Uniforms
   int uPrjMatrix;
   int uMVMatrix;
   int uTextureMatrix;
   int uNormalsMatrix;
   int uFogDensity;
   int uFogColor;
   int uGlobalAmbient;
   int uNearPlane;
   int uLightsPos[8];
   int uLightsDiffuse[8];
   int uLightsAmbient[8];
   int uLightsSpecular[8];
   int uLightsAtt[8];
   int uLightsSpotDir[8];
   int uLightsSpotCutOffCos[8];
   int uLightsSpotExp[8];
   int uMatDiffuse;
   int uMatAmbient;
   int uMatSpecular;
   int uMatEmissive;
   int uMatPower;
   int uMatOpacity;
   int uDiffuseTex;
   int uBumpTex;
   int uSpecularTex;
   int uEnvTex;
   int uReflectTex;
   int uRefractionETA;
   int uMatReflectivity;
   int uCubeMapMatrix;
   int uAlphaFuncValue;

   void registerUniforms(int program, DefaultShaderBits state)
   {
#if ENABLE_GL_SHADERS
      uPrjMatrix        = glGetUniformLocation(program, "projection_matrix");
      uMatDiffuse       = glGetUniformLocation(program, "matDiffuse");

      if(state.modelView)
         uMVMatrix         = glGetUniformLocation(program, "modelview_matrix");

      if(state.lighting)
      {
         int i;

         for(i = 0; i < 8; i++)
         {
            char name[100];

            sprintf(name, "lightsPos[%d]", i);
            uLightsPos[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsDiffuse[%d]", i);
            uLightsDiffuse[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsAmbient[%d]", i);
            uLightsAmbient[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsSpecular[%d]", i);
            uLightsSpecular[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsAtt[%d]", i);
            uLightsAtt[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsSpotDir[%d]", i);
            uLightsSpotDir[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsSpotCutOffCos[%d]", i);
            uLightsSpotCutOffCos[i] = glGetUniformLocation(program, name);

            sprintf(name, "lightsSpotExp[%d]", i);
            uLightsSpotExp[i] = glGetUniformLocation(program, name);
         }

         uNearPlane        = glGetUniformLocation(program, "nearPlane");
         uNormalsMatrix    = glGetUniformLocation(program, "normals_matrix");
         uGlobalAmbient    = glGetUniformLocation(program, "globalAmbient");
         uMatAmbient       = glGetUniformLocation(program, "matAmbient");
         uMatEmissive      = glGetUniformLocation(program, "matEmissive");
         if(state.specular)
         {
            uMatSpecular      = glGetUniformLocation(program, "matSpecular");
            uMatPower         = glGetUniformLocation(program, "matPower");
         }
      }
      if(state.alphaTest)
         uAlphaFuncValue = glGetUniformLocation(program, "alphaFuncValue");

      if((state.specularMapping || state.normalsMapping || state.texturing || state.reflectionMap || state.cubeMap) && state.textureMatrix)
         uTextureMatrix    = glGetUniformLocation(program, "texture_matrix");
      if(state.texturing || state.cubeMap)
         uDiffuseTex    = glGetUniformLocation(program, "diffuseTex");
      if(state.normalsMapping)
         uBumpTex       = glGetUniformLocation(program, "bumpTex");
      if(state.specularMapping)
         uSpecularTex   = glGetUniformLocation(program, "specularTex");
      if(state.environmentMapping)
      {
         uEnvTex = glGetUniformLocation(program, "envTex");
         uCubeMapMatrix = glGetUniformLocation(program, "cubemap_matrix");

         if(state.refraction)
            uRefractionETA = glGetUniformLocation(program, "matRefractionETA");
         if(state.reflection)
            uMatReflectivity = glGetUniformLocation(program, "matReflectivity");
         if(state.reflectionMap)
            uReflectTex  = glGetUniformLocation(program, "reflectTex");
      }

      if(state.fog)
      {
         uFogDensity       = glGetUniformLocation(program, "fogDensity");
         uFogColor         = glGetUniformLocation(program, "fogColor");
      }
#endif
   }
};

public class DefaultShader : Shader
{
   vertexShaderFile   = "<:ecere>shaders/default.vert";
   fragmentShaderFile = "<:ecere>shaders/default.frag";

public:
   float modelView[16];
   float projection[16];
   float matTexture[16];
   float cubemap_matrix[9];

   float normalsMatrix[9];
   float nearPlane;
   float globalAmbient[3];

   // Lights
   float lDiffuse [8][4];
   float lAmbient [8][3];
   float lSpecular[8][3];
   float lPosition[8][3];
   float lAtt[8][3];
   float lCutOffCos[8];
   float lSpotDir[8][3];
   float lSpotExp[8];

   // Material
   float diffuse[4];
   float ambient[3];
   float specular[3];
   float emissive[3];
   float power;
   float refractionETA, reflectivity;

   bool fogOn;
   uint lightBits;
   float fogDensity;
   float fogColor[3];

   float color[4];

   DefaultShaderBits backLightState; backLightState = DefaultShaderBits { separateSpecular = true };

   DefaultShader()
   {
      color[0] = 1, color[1] = 1, color[2] = 1, color[3] = 1;
      diffuse[0] = 1, diffuse[1] = 1, diffuse[2] = 1, diffuse[3] = 1;
      ambient[0] = 1, ambient[1] = 1, ambient[2] = 1;

      // state = DefaultShaderBits { blinnSpecular = true };
   }

   void bindAttribs(int program)
   {
#if ENABLE_GL_SHADERS
      DefaultShaderBits state = this.state;
      glBindAttribLocation(program, GLBufferContents::vertex,    "vertex");
      if(state.perVertexColor)
         glBindAttribLocation(program, GLBufferContents::color,     "color");
      if(state.texturing || state.normalsMapping || state.specularMapping || state.reflectionMap)
         glBindAttribLocation(program, GLBufferContents::texCoord,  "texCoord");
      if(state.lighting)
         glBindAttribLocation(program, GLBufferContents::normal,    "normal");
      if(state.normalsMapping)
      {
         glBindAttribLocation(program, GLBufferContents::tangent1,  "tangent1");
         glBindAttribLocation(program, GLBufferContents::tangent2,  "tangent2");
      }
#endif
   }

   CompiledDefaultShader registerShader(int program, uint64 state)
   {
      CompiledDefaultShader shader { };
      shader.registerUniforms(program, state);
      return shader;
   }

   ZString getDefinitions(uint64 _state)
   {
      DefaultShaderBits state = _state;
      ZString defs { allocType = heap, minSize = 5000 };
      int i;

#ifdef _DEBUG
       //PrintLn("Compiling shader for state: ", state);
#endif

#if defined(__EMSCRIPTEN__)
      defs.concatf("#version 100\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   1\n");
#else
      defs.concatf("#version 110\n");
      defs.concatf("#define GLSL_FLOAT_PRECISION   0\n");
#endif
      defs.concatf("\n#define NUM_LIGHTS %d",               8);
      defs.concatf("\n#define MODELVIEW %d",                state.modelView          ? 1 : 0);
      defs.concatf("\n#define PER_VERTEX_COLOR %d",         state.perVertexColor     ? 1 : 0);
      defs.concatf("\n#define LIGHTING_ON %d",              state.lighting           ? 1 : 0);
      defs.concatf("\n#define NON_LOCAL_VIEWER %d",         state.nonLocalViewer     ? 1 : 0);
      defs.concatf("\n#define MAT_TWOSIDED %d",             state.twoSided           ? 1 : 0);
      defs.concatf("\n#define MAT_SPECULAR %d",             state.specular           ? 1 : 0);
      defs.concatf("\n#define MAT_SEPARATE_SPECULAR %d",    state.separateSpecular   ? 1 : 0);
      defs.concatf("\n#define SPECULAR_MAPPING %d",         state.specularMapping    ? 1 : 0);
      defs.concatf("\n#define ENVIRONMENT_MAPPING %d",      state.environmentMapping ? 1 : 0);
      defs.concatf("\n#define ENVIRONMENT_REFLECTION %d",   state.reflection         ? 1 : 0);
      defs.concatf("\n#define ENVIRONMENT_REFRACTION %d",   state.refraction         ? 1 : 0);
      defs.concatf("\n#define REFLECTION_MAP %d",           state.reflectionMap      ? 1 : 0);
      defs.concatf("\n#define NORMALS_MAPPING %d",          state.normalsMapping     ? 1 : 0);
      defs.concatf("\n#define CUBEMAP_ON %d",               state.cubeMap            ? 1 : 0);
      defs.concatf("\n#define LIGHTING_SPECULAR_BLINN %d",  state.blinnSpecular      ? 1 : 0);
      defs.concatf("\n#define ALPHATEST_ON %d",             state.alphaTest          ? 1 : 0);
      defs.concatf("\n#define TEXTURE_ON %d",               state.texturing          ? 1 : 0);
      defs.concatf("\n#define TEXTURE_MATRIX %d",           state.textureMatrix      ? 1 : 0);
      defs.concatf("\n#define SWIZZLE_ALPHA %d",            state.swizzle == alpha   ? 1 : 0);
      defs.concatf("\n#define SWIZZLE_RED %d",              state.swizzle == red     ? 1 : 0);
      defs.concatf("\n#define FOG_ON %d\n",                 state.fog                ? 1 : 0);
      defs.concatf("\n#define DEBUGGING %d\n",              state.debugging          ? 1 : 0);
      for(i = 0; i < 8; i++)
      {
         LightMode mode = (LightMode)((state.lightBits & (0x7 << (3*i))) >> (3*i));
         defs.concatf("\n#define LIGHT%d_ON %d",         i, mode                                 ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_POSITIONAL %d", i, mode >= pos                          ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_SPOT %d",       i, mode >= posSpot                      ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_ATT %d\n",      i, mode == posAtt || mode == posSpotAtt ? 1 : 0);
      }
      defs.concatf("\n\n#line 0\n");

#ifdef _DEBUG
      //puts((String)defs._string);
#endif
      return defs;
   }

   void uploadUniforms(CompiledDefaultShader shader)
   {
#if ENABLE_GL_SHADERS
      DefaultShaderBits state = this.state;

      // Upload Uniforms

/*
      if(prjViewModified)
      {
         Matrix * mv = &mvMatrix;
         Matrix * prj = &prjMatrix;
         Matrix mat;
         mat.Multiply(mv, prj);
         {
            float m[16] =
            {
               (float)mat.m[0][0], (float)mat.m[0][1], (float)mat.m[0][2], (float)mat.m[0][3],
               (float)mat.m[1][0], (float)mat.m[1][1], (float)mat.m[1][2], (float)mat.m[1][3],
               (float)mat.m[2][0], (float)mat.m[2][1], (float)mat.m[2][2], (float)mat.m[2][3],
               (float)mat.m[3][0], (float)mat.m[3][1], (float)mat.m[3][2], (float)mat.m[3][3]
            };
            float mvz[4] = { (float)mv->m[0][2], (float)mv->m[1][2], (float)mv->m[2][2], (float)mv->m[3][2] };
            glUniformMatrix4fv(shader.uPrjMatrix, 1, GL_FALSE, m);
            if(mvModified)
               glUniform3fv(uMVZ, 1, mvz);
         }
      }
*/

      if(matrixModified)
      {
         glUniformMatrix4fv(shader.uPrjMatrix, 1, GL_FALSE, projection);

         if(state.modelView)
            glUniformMatrix4fv(shader.uMVMatrix, 1, GL_FALSE, modelView);
      }

      if(state.lighting)
      {
         // Lights
         if(lightModified)
         {
            int i;
            for(i = 0; i < 8; i++)
            {
               LightMode mode = (LightMode)((state.lightBits & (0x7 << (3*i))) >> (3*i));
               if(mode)
               {
                  if(mode == posSpot || mode == posSpotAtt)
                  {
                     glUniform3fv(shader.uLightsSpotDir[i], 1, lSpotDir[i]);
                     glUniform1f(shader.uLightsSpotCutOffCos[i], lCutOffCos[i]);
                     glUniform1f(shader.uLightsSpotExp[i], lSpotExp[i]);
                  }
                  if(mode == posAtt || mode == posSpotAtt)
                     glUniform3fv(shader.uLightsAtt[i], 1, lAtt[i]);
                  if(state.specular)
                     glUniform3fv(shader.uLightsSpecular[i], 1, lSpecular[i]);
                  glUniform3fv(shader.uLightsPos[i], 1, lPosition[i]);
                  glUniform3fv(shader.uLightsDiffuse[i], 1, lDiffuse[i]);
                  glUniform3fv(shader.uLightsAmbient[i], 1, lAmbient[i]);
               }
            }

            glUniform3fv(shader.uGlobalAmbient, 1, globalAmbient);
         }

         if(materialModified)
         {
            // Material
            glUniform4fv(shader.uMatDiffuse,  1, diffuse);
            glUniform3fv(shader.uMatAmbient,  1, ambient);
            glUniform3fv(shader.uMatEmissive, 1, emissive);
            if(state.specular)
            {
               glUniform3fv(shader.uMatSpecular, 1, specular);
               glUniform1f(shader.uMatPower, state.blinnSpecular ? power : power / 4.0f);
            }

            if(state.specularMapping)
               glUniform1i(shader.uSpecularTex, 2);

            if(state.normalsMapping)
               glUniform1i(shader.uBumpTex, 1);
            if(state.alphaTest)
               glUniform1f(shader.uAlphaFuncValue, 0.5f);
         }

         if(1 || matrixModified)
         {
            glUniform1f(shader.uNearPlane, nearPlane);
            glUniformMatrix3fv(shader.uNormalsMatrix, 1, GL_FALSE, normalsMatrix);
         }
      }
      else
      {
         glUniform4fv(shader.uMatDiffuse, 1, color);
      }

      if(state.environmentMapping)
      {
         if(matrixModified)
            glUniformMatrix3fv(shader.uCubeMapMatrix, 1, GL_FALSE, cubemap_matrix);
         glUniform1i(shader.uEnvTex, 3);

         if(materialModified)
         {
            if(state.reflection)
               glUniform1f(shader.uMatReflectivity, reflectivity);
            if(state.refraction)
               glUniform1f(shader.uRefractionETA, refractionETA);
            if(state.reflectionMap)
               glUniform1i(shader.uReflectTex, 4);
         }
      }

      if(materialModified)
      {
         if(state.texturing || state.cubeMap)
            glUniform1i(shader.uDiffuseTex, 0);
      }
      if(matrixModified)
      {
         if((state.texturing || state.normalsMapping || state.specularMapping || state.reflectionMap || state.cubeMap) && state.textureMatrix)
            glUniformMatrix4fv(shader.uTextureMatrix, 1, GL_FALSE, matTexture);
      }
      if(materialModified)
      {
         if(state.fog)
         {
            glUniform1f(shader.uFogDensity, fogDensity);
            glUniform3fv(shader.uFogColor, 1, fogColor);
         }
      }
#endif
   }

   void setCamera(Camera camera)
   {
      double * c = camera.inverseTranspose.array;
      float m[9] =
      {
         (float) c[0], (float) c[1], (float)-c[2],
         (float)-c[4], (float) c[5], (float) c[6],
         (float)-c[8], (float) c[9], (float) c[10]
      };
      memcpy(cubemap_matrix, m, 9 * sizeof(float));
      matrixModified = true;
   }

   void updateMatrix(MatrixMode mode, Matrix matrix, bool isIdentity)
   {
      if(mode == projection)
      {
         float m[16] =
         {
            (float)matrix.m[0][0], (float)matrix.m[0][1], (float)matrix.m[0][2], (float)matrix.m[0][3],
            (float)matrix.m[1][0], (float)matrix.m[1][1], (float)matrix.m[1][2], (float)matrix.m[1][3],
            (float)matrix.m[2][0], (float)matrix.m[2][1], (float)matrix.m[2][2], (float)matrix.m[2][3],
            (float)matrix.m[3][0], (float)matrix.m[3][1], (float)matrix.m[3][2], (float)matrix.m[3][3]
         };
         memcpy(projection, m, 16 * sizeof(float));
         nearPlane = (float)::nearPlane;
         matrixModified = true;
      }
      else if(mode == modelView)
      {
         if(!isIdentity)
         {
            float m[16] =
            {
               (float)matrix.m[0][0], (float)matrix.m[0][1], (float)matrix.m[0][2], (float)matrix.m[0][3],
               (float)matrix.m[1][0], (float)matrix.m[1][1], (float)matrix.m[1][2], (float)matrix.m[1][3],
               (float)matrix.m[2][0], (float)matrix.m[2][1], (float)matrix.m[2][2], (float)matrix.m[2][3],
               (float)matrix.m[3][0], (float)matrix.m[3][1], (float)matrix.m[3][2], (float)matrix.m[3][3]
            };
            memcpy(modelView, m, 16 * sizeof(float));
         }
         ((DefaultShaderBits)state).modelView = !isIdentity;

         //mvModified = true;
         //prjViewModified = true;

         if(((DefaultShaderBits)state).lighting)
         {
            Matrix t, inv = matrix;
            double * i = inv.array;
            inv = matrix;
            inv.Scale(1, -1, 1);
            t.Transpose(inv);
            if(isIdentity)
               inv = t;
            else
               inv.Inverse(t);
            {
               float m[9] =
               {
                  (float)i[0],(float)i[1],(float)i[2],
                  (float)i[4],(float)i[5],(float)i[6],
                  (float)i[8],(float)i[9],(float)i[10]
               };
               memcpy(normalsMatrix, m, 9 * sizeof(float));
            }
         }
         matrixModified = true;
      }
      else if(mode == texture)
      {
         if(!isIdentity)
         {
            float m[16] =
            {
               (float)matrix.m[0][0], (float)matrix.m[0][1], (float)matrix.m[0][2], (float)matrix.m[0][3],
               (float)matrix.m[1][0], (float)matrix.m[1][1], (float)matrix.m[1][2], (float)matrix.m[1][3],
               (float)matrix.m[2][0], (float)matrix.m[2][1], (float)matrix.m[2][2], (float)matrix.m[2][3],
               (float)matrix.m[3][0], (float)matrix.m[3][1], (float)matrix.m[3][2], (float)matrix.m[3][3]
            };
            memcpy(matTexture, m, 16 * sizeof(float));
         }
         ((DefaultShaderBits)state).textureMatrix = !isIdentity;
         if(((DefaultShaderBits)state).texturing || ((DefaultShaderBits)state).normalsMapping || ((DefaultShaderBits)state).specularMapping ||
            ((DefaultShaderBits)state).reflectionMap || ((DefaultShaderBits)state).cubeMap)
            matrixModified = true;
      }
   }

   void setGlobalAmbient(float r, float g, float b, float a)
   {
      globalAmbient[0] = r, globalAmbient[1] = g, globalAmbient[2] = b;
      if(((DefaultShaderBits)state).lighting)
         lightModified = true;
   }

   void setColor(float r, float g, float b, float a)
   {
      color[0] = r, color[1] = g, color[2] = b, color[3] = a;
      materialModified = true;
   }

   void lighting(bool on)
   {
      if(((DefaultShaderBits)state).lighting != on)
      {
         ((DefaultShaderBits)state).lighting = on;
         lightModified = true;
         if(!on)
         {
            backLightState = state &
               DefaultShaderBits
               {
                  nonLocalViewer = true;
                  twoSided = true;
                  specular = true;
                  separateSpecular = true;
                  blinnSpecular = true;
                  lightBits = 0xFFFFFF;
               };
            state &= ~backLightState;
         }
         else
            state |= backLightState;
      }
   }

   void fog(bool on)
   {
      if(fogOn != on)
      {
         fogOn = on;
         ((DefaultShaderBits)state).fog = fogOn && fogDensity;
         materialModified = true;
      }
   }

   void setFogDensity(float density)
   {
      if(fogDensity != density)
      {
         fogDensity = density;
         ((DefaultShaderBits)state).fog = fogOn && fogDensity;
         if(fogOn)
            lightModified = true;
      }
   }

   void setFogColor(float r, float g, float b)
   {
      fogColor[0] = r, fogColor[1] = g, fogColor[2] = b;
      if(fogOn)
         lightModified = true;
   }

   void texturing(bool on)
   {
      if(((DefaultShaderBits)state).texturing != on)
      {
         ((DefaultShaderBits)state).texturing = on;
         if(!on)
            state &= ~DefaultShaderBits { swizzle = (SwizzleMode)0x3 };
         if(!on && !((DefaultShaderBits)state).normalsMapping && !((DefaultShaderBits)state).specularMapping && !((DefaultShaderBits)state).reflectionMap && !((DefaultShaderBits)state).cubeMap)
            state &= ~DefaultShaderBits { textureMatrix = true };
         materialModified = true;
      }
   }

   void debugging(bool on)
   {
      if(((DefaultShaderBits)state).debugging != on)
      {
         ((DefaultShaderBits)state).debugging = on;
         uniformsModified = true;
      }
   }

   void swizzle(SwizzleMode swizzle)
   {
#ifdef _DEBUG
      if(swizzle && !((DefaultShaderBits)state).texturing && !((DefaultShaderBits)state).cubeMap)
         printf("swizzle() with texturing off\n");
#endif
      if(((DefaultShaderBits)state).swizzle != swizzle)
      {
         ((DefaultShaderBits)state).swizzle = swizzle;
         if(((DefaultShaderBits)state).texturing || ((DefaultShaderBits)state).cubeMap)
            materialModified = true;
      }
   }

   void setSimpleMaterial(ColorAlpha color, bool twoSided)
   {
      float r = color.color.r / 255.0f;
      float g = color.color.g / 255.0f;
      float b = color.color.b / 255.0f;
#ifdef _DEBUG
      if(!((DefaultShaderBits)state).lighting)
         printf("setSimpleMaterial() with lighting off\n");
#endif
      diffuse[0] = r, diffuse[1] = g, diffuse[2] = b, diffuse[3] = color.a / 255.0f;
      ambient[0] = r, ambient[1] = g, ambient[2] = b;
      emissive[0] = 0, emissive[1] = 0, emissive[2] = 0;
      ((DefaultShaderBits)state).perVertexColor = false;
      ((DefaultShaderBits)state).normalsMapping = false;
      ((DefaultShaderBits)state).environmentMapping = false;
      ((DefaultShaderBits)state).reflectionMap = false;
      ((DefaultShaderBits)state).specularMapping = false;
      ((DefaultShaderBits)state).reflection = false;
      ((DefaultShaderBits)state).alphaTest = false;
      ((DefaultShaderBits)state).refraction = false;
      ((DefaultShaderBits)state).texturing = false;
      ((DefaultShaderBits)state).cubeMap = false;
      ((DefaultShaderBits)state).specular = false;
      ((DefaultShaderBits)state).twoSided = twoSided;
      materialModified = true;
   }

   void setPerVertexColor(bool perVertexColor)
   {
      if(((DefaultShaderBits)state).perVertexColor != perVertexColor)
      {
         ((DefaultShaderBits)state).perVertexColor = perVertexColor;
         materialModified = true;
      }
   }

   #if !defined(ECERE_NO3D)
   void setMaterial(Material material, MeshFeatures flags)
   {
#if ENABLE_GL_SHADERS
      if(material)
      {
         ((DefaultShaderBits)state).specular = material.power && (material.specular.r || material.specular.g || material.specular.b);
         ((DefaultShaderBits)state).perVertexColor = flags.colors;
         ((DefaultShaderBits)state).separateSpecular = ((DefaultShaderBits)state).specular && material.flags.separateSpecular;
         ((DefaultShaderBits)state).cubeMap = material.flags.cubeMap && material.baseMap;
         ((DefaultShaderBits)state).twoSided = material.flags.doubleSided && !material.flags.singleSideLight;
         ((DefaultShaderBits)state).lightBits = material.flags.noLighting ? 0 : lightBits;
         ((DefaultShaderBits)state).lighting = (!material.flags.noLighting && lightBits) ? true : false;
         color[0] = 1, color[1] = 1, color[2] = 1, color[3] = material.opacity;
         diffuse[0]  = material.diffuse.r,  diffuse[1]  = material.diffuse.g,  diffuse[2]  = material.diffuse.b, diffuse[3] = material.opacity;
         ambient[0]  = material.ambient.r,  ambient[1]  = material.ambient.g,  ambient[2]  = material.ambient.b;
         specular[0] = material.specular.r, specular[1] = material.specular.g, specular[2] = material.specular.b;
         emissive[0] = material.emissive.r, emissive[1] = material.emissive.g, emissive[2] = material.emissive.b;
         power = material.power;
         ((DefaultShaderBits)state).alphaTest = material.flags.partlyTransparent;
      }
      else
      {
         ((DefaultShaderBits)state).cubeMap = false;
         ((DefaultShaderBits)state).perVertexColor = false;
         ((DefaultShaderBits)state).separateSpecular = false;
         ((DefaultShaderBits)state).twoSided = false;
         ((DefaultShaderBits)state).textureMatrix = false;
         ((DefaultShaderBits)state).alphaTest = false;
      }

      if(material && material.bumpMap && flags.tangents)
      {
         glActiveTexture(GL_TEXTURE1);
         glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.bumpMap.driverData);
         if(material.flags.tile)
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
         }
         else
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
         }

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.bumpMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
         glActiveTexture(GL_TEXTURE0);
         ((DefaultShaderBits)state).normalsMapping = true;
      }
      else
         ((DefaultShaderBits)state).normalsMapping = false;

      if(material && material.envMap && (material.refractiveIndex || material.refractiveIndexContainer || material.reflectivity || material.reflectMap))
      {
         CubeMap cube = material.envMap;
         glActiveTexture(GL_TEXTURE3);
         glBindTexture(GL_TEXTURE_CUBE_MAP, (GLuint)(uintptr)cube.driverData);
         glActiveTexture(GL_TEXTURE0);
         ((DefaultShaderBits)state).environmentMapping = true;

         if(material.refractiveIndex || material.refractiveIndexContainer)
         {
            refractionETA =
               (material.refractiveIndexContainer ? material.refractiveIndexContainer : 1.0) /
               (material.refractiveIndex ? material.refractiveIndex : 1.0);

            ((DefaultShaderBits)state).refraction = true;
         }

         if(material.reflectivity || material.reflectMap)
         {
            reflectivity = material.reflectivity;
            if(!reflectivity && material.reflectMap) reflectivity = 1.0;

            if(material.reflectMap)
            {
               glActiveTexture(GL_TEXTURE4);
               glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.reflectMap.driverData);
               if(material.flags.tile)
               {
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
               }
               else
               {
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
                  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
               }

               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.reflectMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
               glActiveTexture(GL_TEXTURE0);

               ((DefaultShaderBits)state).reflectionMap = true;
            }
            else
               ((DefaultShaderBits)state).reflectionMap = false;
            ((DefaultShaderBits)state).reflection = true;
         }
      }
      else
      {
         ((DefaultShaderBits)state).environmentMapping = false;
         ((DefaultShaderBits)state).refraction = false;
         ((DefaultShaderBits)state).reflection = false;
         ((DefaultShaderBits)state).reflectionMap = false;
      }

      if(material && material.specularMap)
      {
         glActiveTexture(GL_TEXTURE2);
         glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.specularMap.driverData);
         if(material.flags.tile)
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
         }
         else
         {
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
            glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
         }

         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.specularMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
         glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
         glActiveTexture(GL_TEXTURE0);
         ((DefaultShaderBits)state).specularMapping = true;
      }
      else
         ((DefaultShaderBits)state).specularMapping = false;

      materialModified = true;
#endif
   }

   void setLight(Display display, uint id, Light light)
   {
      int lShift = 3*id;
      bool lightOn = light && !light.flags.off;
      LightMode mode = (LightMode)((((DefaultShaderBits)state).lightBits & (0x7 << lShift)) >> lShift);

      if(lightOn && !((DefaultShaderBits)state).lighting)
         ((DefaultShaderBits)state).lighting = true;

      if(lightOn || (lightOn != (mode != off)))
         lightModified = true;

      if(lightOn)
      {
         Object lightObject = light.lightObject;
         float multiplier = light.multiplier;
         Matrix m = matrixStack[0][matrixIndex[0]];
         Vector3D l;
         m.Scale(::nearPlane, ::nearPlane, ::nearPlane);

         if(!multiplier) multiplier = 1.0f;

         lDiffuse[id][0] = light.diffuse.r * multiplier;
         lDiffuse[id][1] = light.diffuse.g * multiplier;
         lDiffuse[id][2] = light.diffuse.b * multiplier;

         lAmbient[id][0] = light.ambient.r * multiplier;
         lAmbient[id][1] = light.ambient.g * multiplier;
         lAmbient[id][2] = light.ambient.b * multiplier;

         lSpecular[id][0] = light.specular.r * multiplier;
         lSpecular[id][1] = light.specular.g * multiplier;
         lSpecular[id][2] = light.specular.b * multiplier;

         if(lightObject)
         {
            // Positional Lights (Including Spot Lights and Omni with flags.spot not set)
            Matrix * mat = &lightObject.matrix;
            Vector3D positionVector { mat->m[3][0], mat->m[3][1], mat->m[3][2] };
            if(display.display3D.camera)
               positionVector.Subtract(positionVector, display.display3D.camera.cPosition);

            l.MultMatrix(positionVector, m);
            lPosition[id][0] = (float)l.x, lPosition[id][1] = (float)-l.y, lPosition[id][2] = (float)l.z;

            // Display Light Position
            /*
            GLSetupLighting(false);
            glDisable(GL_DEPTH_TEST);
            GLColor3f(
               light.diffuse.r * multiplier,
               light.diffuse.g * multiplier,
               light.diffuse.b * multiplier);
            glPointSize(10);
            GLBegin(GL_POINTS);
            GLVertex3dv((double *)&positionVector);
            GLEnd();
            glEnable(GL_DEPTH_TEST);
            GLSetupLighting(true);
            */

            // Display Target
            /*
            if(light.target)
            {
               Vector3D positionVector;
               if(lightObject.flags.root || !lightObject.parent)
               {
                  positionVector = light.target.transform.position;
                  positionVector.Subtract(positionVector, display.camera.cPosition);
               }
               else
               {
                  positionVector.MultMatrix(light.target.transform.position,
                     lightObject.light.target.parent.matrix);
                  positionVector.Subtract(positionVector, display.camera.cPosition);
               }
               GLSetupLighting(false);
               glDisable(GL_DEPTH_TEST);
               GLColor3f(1,1,0);
               glPointSize(10);
               GLBegin(GL_POINTS);
               GLVertex3dv((double *)&positionVector);
               GLEnd();
               glEnable(GL_DEPTH_TEST);
               GLSetupLighting(false);
            }
            */

            if(light.flags.attenuation)
            {
               lAtt[id][0] = light.Kc;
               lAtt[id][1] = light.Kl;
               lAtt[id][2] = light.Kq;
            }

            if((light.flags.spot && light.fallOff < 360) || (lightObject && (light.direction.x || light.direction.y || light.direction.z)))
            {
               #define MAXLIGHT  0.9
               // Figure out exponent out of the hot spot
               float exponent = light.flags.spot ? (float)(log(MAXLIGHT) / log(cos(light.hotSpot / 2))) : 1;
               Degrees cutOff = light.flags.spot ? light.fallOff/2 : 90;
               Vector3D l, n;
               l.MultMatrix(light.direction, m);
               n.Normalize(l);
               n.Scale(n, -1);

               lSpotDir[id][0] = (float)n.x, lSpotDir[id][1] = (float)-n.y, lSpotDir[id][2] = (float)n.z;
               lCutOffCos[id] = (float)cos(Degrees { cutOff });
               lSpotExp[id] = exponent;

               mode = light.flags.attenuation ? posSpotAtt : posSpot;
            }
            else
               mode = light.flags.attenuation ? posAtt : pos;
         }
         else
         {
            // Directional Light
            Vector3D vector { 0,0,-1 };
            Vector3D direction, v;
            Matrix mat;
            mat.RotationQuaternion(light.orientation);
            direction.MultMatrix(vector, mat);
            v.Normalize(direction);
            l.MultMatrix(v, m);

            lPosition[id][0] = (float)l.x, lPosition[id][1] = (float)-l.y, lPosition[id][2] = (float)l.z;
            mode = dir;
         }
      }
      else
         mode = off;
      lightBits = (lightBits & ~(0x7 << lShift)) | (mode << lShift);
      ((DefaultShaderBits)state).lightBits = lightBits;
   }
   #endif

   DefaultShader ::shader() { return defaultShader; }
}

DefaultShader defaultShader { };
