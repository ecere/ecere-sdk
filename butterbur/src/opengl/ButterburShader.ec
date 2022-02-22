public import IMPORT_STATIC "ecere"

#if defined(__linux__) && !defined(__ANDROID__)
asm(".symver log,log@GLIBC_2.2.5");
#endif

#include "gl123es.h"

import "VersionedShader"

private: // FIXME:  eC bug

define squishFactorAttribute = 13;

Size resetDisplaySize;
Size displaySize;
DisplaySystem displaySystem;
Display glDisplay;

#ifndef ECERE_STATIC
GLCapabilities glCaps;
bool glCaps_nonPow2Textures, glCaps_vertexBuffer, glCaps_quads, glCaps_intAndDouble, glCaps_legacyFormats, glCaps_compatible, glCaps_vertexPointer;
bool glCaps_shaders, glCaps_fixedFunction, glCaps_immediate, glCaps_legacy, glCaps_pointSize, glCaps_frameBuffer, glCaps_vao, glCaps_select;
bool glCaps_gpuCommands;
bool glCaps_mdei;

int glVersion;
#endif

int glMinorVersion;

uint defaultVAO;

#ifdef _DEBUG
void checkGLErrors( const char *file, int line )
{
#if defined(__WIN32__)
   if(!glGetError) return;
#endif
   int e, nCount = 0;
   while((e = glGetError()) && nCount++ < 10)
      PrintLn("GL error ", e, "! (at ", file, ":", line, ")");
}
#endif

bool loadedGLExts;

uint tempTexFBO; // TODO: Free this on termination... glDeleteFramebuffers(1, &tempTexFBO);

// FIXME: This is currently duplicated here from Ecere's OGL display driver because there is no other mechanism to access defualt VAO
class TempOGLDisplay : struct
{
   GLCapabilities capabilities, originalCapabilities;
   bool compat;
   int version;
   ColorAlpha * flippingBuffer;
   int flipBufH, flipBufW;
   bool depthWrite;
   int x, y;
   uint vao;
   int maxTMU;
}

public void setupGL(Display display)
{
   GLCapabilities caps = display.glCapabilities;
   void * data = display.driverData;

   glDisplay = display;
   displaySystem = display.displaySystem;

   displaySize = { display.width, display.height };
   resetDisplaySize = displaySize;

   SETCAPS(caps);

   defaultVAO = ((TempOGLDisplay)data).vao;
   if(!loadedGLExts)
   {
#if defined(__LUMIN__)
      // TODO: !
      loadedGLExts = true;
      glVersion = 4;
      glMinorVersion = 5;
#elif defined(__ANDROID__)
      loadedGLExts = true;
      glVersion = 3;
      glMinorVersion = 2;
#else
      ogl_LoadFunctions();
      loadedGLExts = true;
      glVersion = ogl_GetMajorVersion();
      glMinorVersion = ogl_GetMinorVersion();
#endif
   }
}

public class ButterburShaderBits : uint64
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
   bool constantColor:1;
   bool normalsInvScale2:1;
   bool externalTexture:1;
   bool blackTint:1;
   bool textureArray:1;
   bool multiDraw:1;
   bool transform3D:1;
   bool squishFactor:1;
};

public class CompiledButterburShader : CompiledShader
{
public:
   // Uniforms
   int uPrjMatrix;
   int uMVMatrix;
   int uTextureMatrix;
   int uNormalsMatrix;
   int uNormalsInvScale2;
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
   int uLayer;
   //int uDrawID;

   bool initialSetup; initialSetup = true;

   void registerUniforms(int program, DefaultShaderBits state)
   {
#if ENABLE_GL_SHADERS
      uPrjMatrix        = glGetUniformLocation(program, "projection_matrix");
      uMatDiffuse       = glGetUniformLocation(program, "matDiffuse");
      uLayer            = glGetUniformLocation(program, "layer");
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
         uNormalsInvScale2 = glGetUniformLocation(program, "normals_inv_scale2");
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
#if defined(__ANDROID__)
      //uDrawID = glGetUniformLocation(program, "drawID1");
#endif

#endif
   }
};

class ButterburShader : VersionedShader
{
#if defined(__GNOSIS3__)
#if defined(__LUMIN__)
   vertexShaderFile   = "data/gnosis3/shaders/butterbur.vert";
   fragmentShaderFile = "data/gnosis3/shaders/butterbur.frag";
#else
   vertexShaderFile   = "<:gnosis3>shaders/butterbur.vert";
   fragmentShaderFile = "<:gnosis3>shaders/butterbur.frag";
#endif
#else
   vertexShaderFile   = ":shaders/butterbur.vert";
   fragmentShaderFile = ":shaders/butterbur.frag";
#endif

public:
   float modelView[16];
   float projection[16];
   float matTexture[16];
   float cubemap_matrix[9];

   Vector3Df normalsInvScale2;
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

   int textureLayer;

   ButterburShaderBits backLightState; backLightState = ButterburShaderBits { separateSpecular = true };

   ButterburShader()
   {
      color[0] = 1, color[1] = 1, color[2] = 1, color[3] = 1;
      diffuse[0] = 1, diffuse[1] = 1, diffuse[2] = 1, diffuse[3] = 1;
      ambient[0] = 1, ambient[1] = 1, ambient[2] = 1;

      // state = DefaultShaderBits { blinnSpecular = true };
   }

   void bindAttribs(int program)
   {
#if ENABLE_GL_SHADERS
      ButterburShaderBits state = this.state;
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
      if(state.squishFactor)
         glBindAttribLocation(program, squishFactorAttribute,  "squishFactor");
      //#if !defined(__ANDROID__)
      glBindAttribLocation(program, drawIDAttribute, "drawID1");
      //#endif
      if(state.transform3D)
      {
         glBindAttribLocation(program, transform0Attribute, "transform0");
         glBindAttribLocation(program, transform1Attribute, "transform1");
         glBindAttribLocation(program, transform2Attribute, "transform2");
         glBindAttribLocation(program, transform3Attribute, "transform3");
      }
      else
         glBindAttribLocation(program, posOffsetAttribute, "posOffset");
#endif
   }

   CompiledButterburShader registerShader(int program, uint64 state)
   {
      CompiledButterburShader shader { };
      shader.registerUniforms(program, state);
      return shader;
   }

   ZString getDefinitions(uint64 _state)
   {
      ButterburShaderBits state = _state;
      ZString defs = VersionedShader::getDefinitions(state);
      int i;

      defs.minSize = 5000;

#ifdef _DEBUG
       //PrintLn("Compiling shader for state: ", state);
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
      defs.concatf("\n#define CONSTANT_COLOR %d",           state.constantColor      ? 1 : 0);
      defs.concatf("\n#define NORMALS_MAPPING %d",          state.normalsMapping     ? 1 : 0);
      defs.concatf("\n#define CUBEMAP_ON %d",               state.cubeMap            ? 1 : 0);
      defs.concatf("\n#define LIGHTING_SPECULAR_BLINN %d",  state.blinnSpecular      ? 1 : 0);
      defs.concatf("\n#define ALPHATEST_ON %d",             state.alphaTest          ? 1 : 0);
      defs.concatf("\n#define TEXTURE_ON %d",               state.texturing          ? 1 : 0);
      defs.concatf("\n#define MULTI_DRAW %d",               state.multiDraw          ? 1 : 0);
      defs.concatf("\n#define TEXTURE_ARRAY %d",            state.textureArray       ? 1 : 0);
      defs.concatf("\n#define TEXTURE_MATRIX %d",           state.textureMatrix      ? 1 : 0);
      defs.concatf("\n#define SWIZZLE_ALPHA %d",            state.swizzle == alpha   ? 1 : 0);
      defs.concatf("\n#define SWIZZLE_RED %d",              state.swizzle == red     ? 1 : 0);
      defs.concatf("\n#define FOG_ON %d\n",                 state.fog                ? 1 : 0);
      defs.concatf("\n#define DEBUGGING %d\n",              state.debugging          ? 1 : 0);
      defs.concatf("\n#define NORMALS_INV_SCALE %d",        state.normalsInvScale2   ? 1 : 0);
      defs.concatf("\n#define FULL_3D_TRANSFORM %d",        state.transform3D        ? 1 : 0);
      defs.concatf("\n#define SQUISH_FACTOR %d",            state.squishFactor       ? 1 : 0);

      for(i = 0; i < 8; i++)
      {
         LightMode mode = (LightMode)((state.lightBits & (0x7 << (3*i))) >> (3*i));
         defs.concatf("\n#define LIGHT%d_ON %d",         i, mode                                 ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_POSITIONAL %d", i, mode >= pos                          ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_SPOT %d",       i, mode >= posSpot                      ? 1 : 0);
         defs.concatf("\n#define LIGHT%d_ATT %d\n",      i, mode == posAtt || mode == posSpotAtt ? 1 : 0);
      }
      defs.concatf("\n\n#line 1\n");

#ifdef _DEBUG
      //puts((String)defs._string);
#endif
      return defs;
   }

   void uploadUniforms(CompiledButterburShader shader)
   {
#if ENABLE_GL_SHADERS
      ButterburShaderBits state = this.state;

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

      if(shader.initialSetup)
      {
         shader.initialSetup = false;

         if(state.texturing || state.cubeMap)                  glUniform1i(shader.uDiffuseTex,  0);
         if(state.normalsMapping)                              glUniform1i(shader.uBumpTex,     1);
         if(state.specularMapping)                             glUniform1i(shader.uSpecularTex, 2);
         if(state.environmentMapping)                          glUniform1i(shader.uEnvTex,      3);
         if(state.environmentMapping && state.reflectionMap)   glUniform1i(shader.uReflectTex,  4);
         if(state.alphaTest)                                   glUniform1f(shader.uAlphaFuncValue, 0.5f);
      }

      if(modifiedUniforms.matPrj)
      {
         if(state.lighting)
            glUniform1f(shader.uNearPlane, nearPlane);
         glUniformMatrix4fv(shader.uPrjMatrix, 1, GL_FALSE, projection);
      }

      if(state.modelView && modifiedUniforms.matMV)
         glUniformMatrix4fv(shader.uMVMatrix, 1, GL_FALSE, modelView);

      if(state.lighting)
      {
         // Lights
         if(modifiedUniforms.light)
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

         if(modifiedUniforms.material)
         {
            // Material
            if(state.constantColor)
            {
               glUniform4fv(shader.uMatDiffuse,  1, diffuse);
               glUniform3fv(shader.uMatAmbient,  1, ambient);
               glUniform3fv(shader.uMatEmissive, 1, emissive);
               if(state.specular)
                  glUniform3fv(shader.uMatSpecular, 1, specular);
            }
            if(state.specular)
               glUniform1f(shader.uMatPower, state.blinnSpecular ? power : power / 4.0f);
         }

         if(modifiedUniforms.matMV && state.normalsInvScale2)
            glUniform3fv(shader.uNormalsInvScale2, 1, (float *)&normalsInvScale2);
      }
      else
      {
         glUniform4fv(shader.uMatDiffuse, 1, color);
      }

      if(state.environmentMapping)
      {
         if(modifiedUniforms.matTex)
            glUniformMatrix3fv(shader.uCubeMapMatrix, 1, GL_FALSE, cubemap_matrix);

         if(modifiedUniforms.material)
         {
            if(state.reflection)
               glUniform1f(shader.uMatReflectivity, reflectivity);
            if(state.refraction)
               glUniform1f(shader.uRefractionETA, refractionETA);
         }
      }

      if(state.textureMatrix && modifiedUniforms.matTex && (state.texturing || state.normalsMapping || state.specularMapping || state.reflectionMap || state.cubeMap))
         glUniformMatrix4fv(shader.uTextureMatrix, 1, GL_FALSE, matTexture);
      if(modifiedUniforms.material && state.fog)
      {
         glUniform1f(shader.uFogDensity, fogDensity);
         glUniform3fv(shader.uFogColor, 1, fogColor);
      }

      if(modifiedUniforms.material && state.textureArray && !state.multiDraw)
         // TODO: For now we don't have a mechanism for per draw layer...
      {
         glUniform1ui(shader.uLayer, textureLayer);
      }
#endif
   }
/*
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
      modifiedUniforms.matTex = true;
   }
*/
   void updateMatrix(MatrixMode mode, float * matrix, bool isIdentity)
   {
      if(mode == projection)
      {
         memcpy(projection, matrix, 16 * sizeof(float));
         nearPlane = (float)glmsGetNearPlane();
         modifiedUniforms.matPrj = true;
      }
      else if(mode == modelView)
      {
         if(!isIdentity)
            memcpy(modelView, matrix, 16 * sizeof(float));

         ((ButterburShaderBits)state).modelView = !isIdentity;

         //mvModified = true;
         //prjViewModified = true;

         if(((ButterburShaderBits)state).lighting)
         {
            if(isIdentity) // Probably not needed? Checking modelView flag?
            {
               ((ButterburShaderBits)state).normalsInvScale2 = false;
            }
            else
            {
               Vector3Df s2;
               /*if(scale != null)
                  s2 = { scale.x * scale.x, scale.y * scale.y, scale.z * scale.z };
               else*/
               {
                  Vector3Df x { matrix[0], matrix[1], matrix[ 2] };
                  Vector3Df y { matrix[4], matrix[5], matrix[ 6] };
                  Vector3Df z { matrix[8], matrix[9], matrix[10] };
                  s2 = { x.x * x.x + x.y * x.y + x.z * x.z,
                         y.x * y.x + y.y * y.y + y.z * y.z,
                         z.x * z.x + z.y * z.y + z.z * z.z };
               }
               normalsInvScale2 = { 1.0f / s2.x, 1.0f / s2.y, 1.0f / s2.z };
               if(fabs(s2.x-s2.y) * normalsInvScale2.x < 0.01 && fabs(s2.x-s2.z) * normalsInvScale2.x < 0.01)
               {
                  ((ButterburShaderBits)state).normalsInvScale2 = false;
               }
               else
               {
                  ((ButterburShaderBits)state).normalsInvScale2 = true;
               }
            }
         }
         modifiedUniforms.matMV = true;
      }
      else if(mode == texture)
      {
         ButterburShaderBits state = this.state;
         if(!isIdentity)
            memcpy(matTexture, matrix, 16 * sizeof(float));
         ((ButterburShaderBits)this.state).textureMatrix = !isIdentity;
         if(state & { texturing = true, normalsMapping = true, specularMapping = true, reflectionMap = true, cubeMap = true })
            modifiedUniforms.matTex = true;
      }
   }

   void setGlobalAmbient(float r, float g, float b, float a)
   {
      globalAmbient[0] = r, globalAmbient[1] = g, globalAmbient[2] = b;
      if(((ButterburShaderBits)state).lighting)
         modifiedUniforms.light = true;
   }

   void setColor(float r, float g, float b, float a)
   {
      color[0] = r, color[1] = g, color[2] = b, color[3] = a;
      modifiedUniforms.material = true;
   }

   void lighting(bool on)
   {
      if(((ButterburShaderBits)state).lighting != on)
      {
         ((ButterburShaderBits)state).lighting = on;
         modifiedUniforms.light = true;
         if(!on)
         {
            backLightState = state &
               ButterburShaderBits
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
         ((ButterburShaderBits)state).fog = fogOn && fogDensity;
         modifiedUniforms.material = true;
      }
   }

   void multiDraw(bool on)
   {
      if(((ButterburShaderBits)state).multiDraw != on)
      {
         ((ButterburShaderBits)state).multiDraw = on;
         modifiedUniforms.material = true;
      }
   }

   void setFogDensity(float density)
   {
      if(fogDensity != density)
      {
         fogDensity = density;
         ((ButterburShaderBits)state).fog = fogOn && fogDensity;
         if(fogOn)
            modifiedUniforms.material = true;
      }
   }

   void setFogColor(float r, float g, float b)
   {
      fogColor[0] = r, fogColor[1] = g, fogColor[2] = b;
      if(fogOn)
         modifiedUniforms.material = true;
   }

   void texturing(bool on)
   {
      ButterburShaderBits state = this.state;
      if(state.texturing != on)
      {
         ButterburShaderBits rmBits = 0;
         if(on)
         {
            rmBits |= { cubeMap = true };
            state.texturing = true;
         }
         else
         {
            rmBits |= { swizzle = (SwizzleMode)0x3, alphaTest = true, texturing = true };
            if(!state.normalsMapping && !state.specularMapping && !state.reflectionMap && !state.cubeMap)
               rmBits |= { textureMatrix = true };
         }
         modifiedUniforms.material = true;
         this.state = state & ~rmBits;
      }
   }

   property bool squishFactor
   {
      set { ((ButterburShaderBits)state).squishFactor = value; }
   }

   void textureArray(bool on)
   {
      if(((ButterburShaderBits)state).textureArray != on)
      {
         ((ButterburShaderBits)state).textureArray = on;
         modifiedUniforms.material = true;
      }
   }

   property bool transform3D
   {
      set { ((ButterburShaderBits)state).transform3D = value; }
   }

   property int textureLayer
   {
      set
      {
         textureLayer = value;
         modifiedUniforms.material = true;
      }
   }

   void debugging(bool on)
   {
      if(((ButterburShaderBits)state).debugging != on)
      {
         ((ButterburShaderBits)state).debugging = on;
         modifiedUniforms = { true, true, true, true, true };
      }
   }

   void swizzle(SwizzleMode swizzle)
   {
      ButterburShaderBits state = this.state;
#ifdef _DEBUG
      if(swizzle && !state.texturing && !state.cubeMap)
         printf("swizzle() with texturing off\n");
#endif
      if(state.swizzle != swizzle)
      {
         ((ButterburShaderBits)this.state).swizzle = swizzle;
         if(state.texturing || state.cubeMap)
            modifiedUniforms.material = true;
      }
   }

   void setSimpleMaterial(ColorAlpha color, bool twoSided)
   {
      ButterburShaderBits rmBits
      {
         perVertexColor = true;
         normalsMapping = true;
         environmentMapping = true;
         reflectionMap = true;
         specularMapping = true;
         reflection = true;
         alphaTest = true;
         refraction = true;
         texturing = true;
         cubeMap = true;
         specular = true;
         twoSided = true;
      };
      float r = color.color.r / 255.0f;
      float g = color.color.g / 255.0f;
      float b = color.color.b / 255.0f;
#ifdef _DEBUG
      if(!((ButterburShaderBits)state).lighting)
         printf("setSimpleMaterial() with lighting off\n");
#endif
      diffuse[0] = r, diffuse[1] = g, diffuse[2] = b, diffuse[3] = color.a / 255.0f;
      ambient[0] = r, ambient[1] = g, ambient[2] = b;
      emissive[0] = 0, emissive[1] = 0, emissive[2] = 0;
      this.state = (this.state & ~rmBits) | ButterburShaderBits { twoSided = twoSided };
      modifiedUniforms.material = true;
   }

   void setPerVertexColor(bool perVertexColor)
   {
      if(((ButterburShaderBits)state).perVertexColor != perVertexColor)
      {
         ((ButterburShaderBits)state).perVertexColor = perVertexColor;
         modifiedUniforms.material = true;
      }
   }

   #if !defined(ECERE_NO3D)
   void setMaterial(Material material, MeshFeatures flags)
   {
#if ENABLE_GL_SHADERS
      ButterburShaderBits state = (ButterburShaderBits)this.state;
      state &= ~
      {
         cubeMap = true, perVertexColor = true, separateSpecular = true, twoSided = true, textureMatrix = true, alphaTest = true,
         environmentMapping = true, refraction = true, reflection = true, reflectionMap = true, normalsMapping = true, specularMapping = true
      };

      if(material)
      {
         MaterialFlags matFlags = material.flags;
         bool tile = matFlags.tile;
         float * c = (float *)&material.diffuse;

         state.perVertexColor = flags.colors;
         state.cubeMap = matFlags.cubeMap && material.baseMap;
         if(matFlags.cubeMap) state.texturing = false;
         state.twoSided = matFlags.doubleSided && !matFlags.singleSideLight;
         state.lightBits = matFlags.noLighting ? 0 : lightBits;
         state.lighting = (!matFlags.noLighting && lightBits) ? true : false;
         color[0] = 1, color[1] = 1, color[2] = 1, color[3] = material.opacity;

         if(matFlags.update)
         {
            matFlags.constantColor = material.opacity ||
               (diffuse[0] != 1 || diffuse[1] != 1 || diffuse[2] != 1 || diffuse[3] != 1) ||
               (ambient[0] != 1 || ambient[1] != 1 || ambient[2] != 1) ||
               (state.specular && (specular[0] != 1 || specular[1] != 1 || specular[2] != 1)) ||
               (emissive[0] != 0 || emissive[1] != 0 || emissive[2] != 0);
            matFlags.update = 0;
         }
         state.constantColor = matFlags.constantColor;
         if(state.constantColor)
         {
            diffuse[0]  = c[0],  diffuse[1]  = c[1],  diffuse[2] = c[2], diffuse[3] = material.opacity;
            ambient[0]  = c[3],  ambient[1]  = c[4],  ambient[2] = c[5];
            specular[0] = c[6], specular[1] = c[7],  specular[2] = c[8];
            emissive[0] = c[9], emissive[1] = c[10], emissive[2] = c[11];
         }

         state.specular = material.power && state.constantColor && (material.specular.r || material.specular.g || material.specular.b);
         state.separateSpecular = state.specular && matFlags.separateSpecular;
         power = material.power;
         state.alphaTest = matFlags.partlyTransparent;

         // Bump mapping
         if(material.bumpMap && flags.tangents)
         {
            glActiveTexture(GL_TEXTURE1);
            glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.bumpMap.driverData);
            if(matFlags.setupTextures)
            {
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.bumpMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            }
            glActiveTexture(GL_TEXTURE0);
            state.normalsMapping = true;
         }

         // Environment mapping
         if(material.envMap && (material.refractiveIndex || material.refractiveIndexContainer || material.reflectivity || material.reflectMap))
         {
            CubeMap cube = material.envMap;
            glActiveTexture(GL_TEXTURE3);
            glBindTexture(GL_TEXTURE_CUBE_MAP, (GLuint)(uintptr)cube.driverData);
            glActiveTexture(GL_TEXTURE0);
            state.environmentMapping = true;

            if(material.refractiveIndex || material.refractiveIndexContainer)
            {
               refractionETA =
                  (material.refractiveIndexContainer ? material.refractiveIndexContainer : 1.0) /
                  (material.refractiveIndex ? material.refractiveIndex : 1.0);

               state.refraction = true;
            }

            if(material.reflectivity || material.reflectMap)
            {
               reflectivity = material.reflectivity;
               if(!reflectivity && material.reflectMap) reflectivity = 1.0;

               if(material.reflectMap)
               {
                  glActiveTexture(GL_TEXTURE4);
                  glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.reflectMap.driverData);
                  if(matFlags.setupTextures)
                  {
                     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);
                     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);

                     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.reflectMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
                     glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
                  }
                  glActiveTexture(GL_TEXTURE0);

                  state.reflectionMap = true;
               }
               state.reflection = true;
            }
         }

         // Specular mapping
         if(material.specularMap)
         {
            glActiveTexture(GL_TEXTURE2);
            glBindTexture(GL_TEXTURE_2D, (GLuint)(uintptr)material.specularMap.driverData);
            if(matFlags.setupTextures)
            {
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, tile ? GL_REPEAT : GL_CLAMP_TO_EDGE);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, material.specularMap.mipMaps ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
               glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
            }
            glActiveTexture(GL_TEXTURE0);
            state.specularMapping = true;
         }
      }
      modifiedUniforms.material = true;
      this.state = state;
#endif
   }

   void setLight(Vector3D cPosition, uint id, Light light)
   {
      int lShift = 3*id;
      bool lightOn = light && !light.flags.off;
      LightMode mode = (LightMode)((((ButterburShaderBits)state).lightBits & (0x7 << lShift)) >> lShift);

      if(lightOn && !((ButterburShaderBits)state).lighting)
         ((ButterburShaderBits)state).lighting = true;

      if(lightOn || (lightOn != (mode != off)))
         modifiedUniforms.light = true;

      if(lightOn)
      {
         Object lightObject = light.lightObject;
         float multiplier = light.multiplier;
         Matrix m;
         Vector3D l;
         double nearPlane = glmsGetNearPlane();

         glmsGetDoublev(modelViewMatrix, m.array);
         m.Scale(nearPlane, nearPlane, nearPlane);
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
            Matrix * mat = lightObject.matrixPtr;
            Vector3D positionVector { mat->m[3][0], mat->m[3][1], mat->m[3][2] };
            if(cPosition != null)
               positionVector.Subtract(positionVector, cPosition);

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
      ((ButterburShaderBits)state).lightBits = lightBits;
      if(!lightBits)
         ((ButterburShaderBits)state).lighting = false;
   }

   #endif

   ButterburShader ::shader() { return butterburShader; }
}

ButterburShader butterburShader { };
