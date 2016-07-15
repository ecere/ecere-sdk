import "Display"
import "matrixStack"
import "glab"

#include "gl123es.h"

#if ENABLE_GL_SHADERS

// Uniforms
static int uPrjMatrix;
static int uMVMatrix;
//static int uMVMatrix_z;
//static int uPrjMVMatrix;
static int uTextureMatrix;
static int uNormalsMatrix;
static int uColor;
static int uTexturingOn;
static int uSwizzleMode;
static int uLightingOn;
static int uFogOn;
static int uFogDensity;
static int uFogColor;
static int uGlobalAmbient;
static int uNearPlane;
static int uLightsOn[NumberOfLights];
static int uLightsPos[NumberOfLights];
static int uLightsDiffuse[NumberOfLights];
static int uLightsAmbient[NumberOfLights];
static int uLightsSpecular[NumberOfLights];
static int uLightsKc[NumberOfLights];
static int uLightsKl[NumberOfLights];
static int uLightsKq[NumberOfLights];
static int uLightsSpotDir[NumberOfLights];
static int uLightsSpot[NumberOfLights];
static int uLightsSpotCutOffCos[NumberOfLights];
static int uLightsSpotExp[NumberOfLights];
static int uPerVertexColor;
static int uMatDiffuse;
static int uMatAmbient;
static int uMatSpecular;
static int uMatEmissive;
static int uMatPower;
static int uMatOpacity;
static int uMatTwoSided;

void shader_LoadMatrixf(MatrixMode mode, float * m)
{
   if(mode == texture)
      glUniformMatrix4fv(uTextureMatrix, 1, GL_FALSE, m);
   else if(mode == projection)
      glUniformMatrix4fv(uPrjMatrix, 1, GL_FALSE, m);
   else if(mode == modelView)
      glUniformMatrix4fv(uMVMatrix, 1, GL_FALSE, m);
}

void shader_setNearPlane(double n)
{
   glUniform1f(uNearPlane, (float)n);
}

Matrix normalsMatrix;
void shader_LoadNormalMatrix(float * m)
{
   glUniformMatrix4fv(uNormalsMatrix, 1, GL_FALSE, m);
}
/*
void shader_LoadPrjMVMatrix(float * m, float * mvz)
{
   glUniformMatrix4fv(uPrjMVMatrix, 1, GL_FALSE, m);
   if(mvz)
      glUniform4fv(uMVMatrix_z, 1, mvz);
}
*/
void shader_setGlobalAmbient(float r, float g, float b, float a)
{
   glUniform3f(uGlobalAmbient, r, g, b);
}

void shader_color(float r, float g, float b, float a)
{
   glUniform4f(uColor, r, g, b, a);
}

void shader_lighting(bool on)
{
   glUniform1i(uLightingOn, on);
}

void shader_fog(bool on)
{
   glUniform1i(uFogOn, on);
}

void shader_fogDensity(float density)
{
   glUniform1f(uFogDensity, density);
}

void shader_fogColor(float r, float g, float b)
{
   glUniform3f(uFogColor, r, g, b);
}

void shader_texturing(bool on)
{
   glUniform1i(uTexturingOn, on);
}

void shader_swizzle(int swizzle)
{
   glUniform1i(uSwizzleMode, swizzle);
}

#if !defined(ECERE_NO3D)
void shader_setMaterial(Material material, bool perVertexColor)
{
   glUniform1i(uPerVertexColor, perVertexColor);
   glUniform1i(uMatTwoSided, material.flags.doubleSided && !material.flags.singleSideLight);
   glUniform3f(uMatDiffuse, material.diffuse.r, material.diffuse.g, material.diffuse.b);
   glUniform3f(uMatAmbient, material.ambient.r, material.ambient.g, material.ambient.b);
   if(!material.power)
   {
      glUniform1f(uMatPower, material.power);
      glUniform3f(uMatSpecular, 0,0,0);
   }
   else
   {
      glUniform1f(uMatPower, material.power);
      glUniform3f(uMatSpecular, material.specular.r, material.specular.g, material.specular.b);
   }
   glUniform3f(uMatEmissive, material.emissive.r, material.emissive.g, material.emissive.b);
   glUniform1f(uMatOpacity, material.opacity);
}
#endif

void shader_setSimpleMaterial(ColorAlpha color, bool twoSided)
{
   float opacity = color.a / 255.0f;
   float r = color.color.r / 255.0f;
   float g = color.color.g / 255.0f;
   float b = color.color.b / 255.0f;
   glUniform1i(uPerVertexColor, 0);
   glUniform1i(uMatTwoSided, twoSided);
   glUniform3f(uMatDiffuse, r, g, b);
   glUniform3f(uMatAmbient, r, g, b);
   glUniform3f(uMatSpecular, 0,0,0); //0.1f*r, 0.1f*g, 0.1f*b);
   glUniform3f(uMatEmissive, 0, 0, 0);
   glUniform1f(uMatPower, 0);
   glUniform1f(uMatOpacity, opacity);
}

void shader_setPerVertexColor(bool perVertexColor)
{
   glUniform1i(uPerVertexColor, perVertexColor);
}

#if !defined(ECERE_NO3D)
void shader_setLight(Display display, uint id, Light light)
{
   if(light != null && !light.flags.off)
   {
      Object lightObject = light.lightObject;
      float multiplier = light.multiplier;
      Matrix m = matrixStack[0][matrixIndex[0]];
      Vector3D l;
      m.Scale(nearPlane, nearPlane, nearPlane);

      glUniform1i(uLightsOn[id], 1);

      if(!multiplier) multiplier = 1.0f;

      glUniform3f(uLightsDiffuse[id],
         light.diffuse.r * multiplier,
         light.diffuse.g * multiplier,
         light.diffuse.b * multiplier);

      glUniform3f(uLightsAmbient[id],
         light.ambient.r * multiplier,
         light.ambient.g * multiplier,
         light.ambient.b * multiplier);

      glUniform3f(uLightsSpecular[id],
         light.specular.r * multiplier,
         light.specular.g * multiplier,
         light.specular.b * multiplier);

      if(lightObject)
      {
         // Positional Lights (Including Spot Lights and Omni with flags.spot not set)
         Matrix * mat = &lightObject.matrix;
         Vector3D positionVector { mat->m[3][0], mat->m[3][1], mat->m[3][2] };
         if(display.display3D.camera)
            positionVector.Subtract(positionVector, display.display3D.camera.cPosition);

         l.MultMatrix(positionVector, m);
         glUniform4f(uLightsPos[id], (float)l.x, (float)l.y, (float)l.z, 1);

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
            glUniform1f(uLightsKc[id], light.Kc);
            glUniform1f(uLightsKl[id], light.Kl);
            glUniform1f(uLightsKq[id], light.Kq);
         }
         else
         {
            glUniform1f(uLightsKc[id], 1);
            glUniform1f(uLightsKl[id], 0);
            glUniform1f(uLightsKq[id], 0);
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

            glUniform1i(uLightsSpot[id], 1);
            glUniform3f(uLightsSpotDir[id], (float)n.x, (float)n.y, (float)n.z);
            glUniform1f(uLightsSpotCutOffCos[id], (float)cos(Degrees { cutOff }));
            glUniform1f(uLightsSpotExp[id], exponent);
         }
         else
            glUniform1i(uLightsSpot[id], 0);
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
         glUniform4f(uLightsPos[id], (float)l.x, (float)l.y, (float)l.z, 0);
      }
   }
   else
      glUniform1i(uLightsOn[id], 0);
}
#endif

bool loadShaders(DisplaySystem displaySystem, const String vertexShaderFile, const String fragmentShaderFile)
{
   bool result = false;
   OGLSystem oglSystem = displaySystem.driverData;
   if(oglSystem.shadingProgram)
      result = true;
   else
   {
      File vf = FileOpen(vertexShaderFile, read);
      File ff = FileOpen(fragmentShaderFile, read);
      // printf("loading shaders %s and %s (%p and %p)\n", vertexShaderFile, fragmentShaderFile, vf, ff);
      if(vf && ff)
      {
         static char compileLog[65536];
         #define BUFFER_SIZE  4096
         int bufferLen = BUFFER_SIZE;
         char * buffer = new byte[BUFFER_SIZE];
         int vsLen = 0, fsLen = 0;
         char * vsSource = null;
         char * psSource = null;
         if(vf)
         {
            while(!vf.eof)
            {
               int count = vf.Read(buffer + vsLen, 1, BUFFER_SIZE);
               vsLen += count;
               if(count == BUFFER_SIZE && bufferLen < vsLen + BUFFER_SIZE)
               {
                  bufferLen = vsLen + BUFFER_SIZE;
                  buffer = renew buffer byte[bufferLen];
               }
            }
            vsSource = new byte[vsLen+1];
            memcpy(vsSource, buffer, vsLen);
            vsSource[vsLen] = 0;
            delete vf;
         }
         if(ff)
         {
            while(!ff.eof)
            {
               int count = ff.Read(buffer + fsLen, 1, BUFFER_SIZE);
               fsLen += count;
               if(count == BUFFER_SIZE && bufferLen < fsLen + BUFFER_SIZE)
               {
                  bufferLen = fsLen + BUFFER_SIZE;
                  buffer = renew buffer byte[bufferLen];
               }
            }
            psSource = new byte[fsLen+1];
            memcpy(psSource, buffer, fsLen);
            psSource[fsLen] = 0;
            delete ff;
         }
         delete buffer;

#ifdef _DEBUG
         printf("We've got OpenGL Version %s\n\n", (char *)glGetString(GL_VERSION));
         printf("We've got Shading Language Version %s\n\n", (char *)glGetString(GL_SHADING_LANGUAGE_VERSION));
#endif

         {
            int program = glCreateProgram();
            int vShader = glCreateShader(GL_VERTEX_SHADER);
            int fShader = glCreateShader(GL_FRAGMENT_SHADER);
            const char * vptr[1] = { vsSource };
            const char * fptr[1] = { psSource };
            int i;

            glShaderSource(vShader, 1, vptr, &vsLen);
            glShaderSource(fShader, 1, fptr, &fsLen);
            delete vsSource;
            delete psSource;

            glCompileShader(vShader);
            glGetShaderInfoLog(vShader, sizeof(compileLog), null, compileLog);

#ifndef _DEBUG
            if(compileLog[0])
#endif
            {
               puts("Vertex Shader Compile Log:");
               puts("--------------------------");
               puts(compileLog[0] ? compileLog : "Success.");
            }

            glCompileShader(fShader);
            glGetShaderInfoLog(fShader, sizeof(compileLog), null, compileLog);
#ifndef _DEBUG
            if(compileLog[0])
#endif
            {
               puts("");
               puts("");
               puts("Fragment Shader Compile Log:");
               puts("--------------------------");
               puts(compileLog[0] ? compileLog : "Success.");
            }

            glAttachShader(program, vShader);
            glAttachShader(program, fShader);

            glBindAttribLocation(program, GLBufferContents::vertex, "vertex");
            glBindAttribLocation(program, GLBufferContents::texCoord, "texCoord");
            glBindAttribLocation(program, GLBufferContents::color, "color");
            glBindAttribLocation(program, GLBufferContents::normal, "normal");
            // glBindFragDataLocation(program, 0, "fragColor");

            glLinkProgram(program);
            glValidateProgram(program);

            glGetProgramInfoLog(program, sizeof(compileLog), null, compileLog);
#ifndef _DEBUG
            if(compileLog[0])
#endif
            {
               puts("");
               puts("");
               puts("Shader Program Log:");
               puts("--------------------------");
               puts(compileLog[0] ? compileLog : "Success.");
            }

            uPrjMatrix     = glGetUniformLocation(program, "projection_matrix");
            uMVMatrix      = glGetUniformLocation(program, "modelview_matrix");
            uNearPlane     = glGetUniformLocation(program, "nearPlane");
            //uMVMatrix_z      = glGetUniformLocation(program, "mvmatrix_z");
            //uPrjMVMatrix   = glGetUniformLocation(program, "proj_modelview_matrix");
            uTextureMatrix = glGetUniformLocation(program, "texture_matrix");
            uNormalsMatrix = glGetUniformLocation(program, "normals_matrix");
            uColor         = glGetUniformLocation(program, "current_color");
            uTexturingOn   = glGetUniformLocation(program, "texturingOn");
            uSwizzleMode   = glGetUniformLocation(program, "swizzleMode");
            uLightingOn    = glGetUniformLocation(program, "lightingOn");
            uFogOn         = glGetUniformLocation(program, "fogOn");
            uFogDensity    = glGetUniformLocation(program, "fogDensity");
            uFogColor      = glGetUniformLocation(program, "fogColor");
            uGlobalAmbient = glGetUniformLocation(program, "globalAmbient");
            uPerVertexColor  = glGetUniformLocation(program, "perVertexColor");
            uMatDiffuse       = glGetUniformLocation(program, "matDiffuse");
            uMatAmbient       = glGetUniformLocation(program, "matAmbient");
            uMatSpecular      = glGetUniformLocation(program, "matSpecular");
            uMatEmissive      = glGetUniformLocation(program, "matEmissive");
            uMatPower         = glGetUniformLocation(program, "matPower");
            uMatOpacity       = glGetUniformLocation(program, "matOpacity");
            uMatTwoSided      = glGetUniformLocation(program, "matTwoSided");

            for(i = 0; i < NumberOfLights; i++)
            {
               char name[100];

               sprintf(name, "lightsOn[%d]", i);
               uLightsOn [i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsPos[%d]", i);
               uLightsPos[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsDiffuse[%d]", i);
               uLightsDiffuse[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsAmbient[%d]", i);
               uLightsAmbient[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsSpecular[%d]", i);
               uLightsSpecular[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsKc[%d]", i);
               uLightsKc[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsKl[%d]", i);
               uLightsKl[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsKq[%d]", i);
               uLightsKq[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsSpotDir[%d]", i);
               uLightsSpotDir[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsSpot[%d]", i);
               uLightsSpot[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsSpotCutOffCos[%d]", i);
               uLightsSpotCutOffCos[i] = glGetUniformLocation(program, name);

               sprintf(name, "lightsSpotExp[%d]", i);
               uLightsSpotExp[i] = glGetUniformLocation(program, name);
            }

            oglSystem.shadingProgram = program;
            oglSystem.vertexShader = vShader;
            oglSystem.fragmentShader = fShader;
         }
         result = true;
      }
      else
         printf("Error accessing built-in shaders files.\n");
      delete vf;
      delete ff;
   }
   if(result)
   {
      glUseProgram(oglSystem.shadingProgram);

      // Initialize uniforms to defaults
      glmsMatrixMode(texture);
      glmsLoadIdentity();
      glmsMatrixMode(projection);
      glmsLoadIdentity();
      glmsMatrixMode(modelView);
      glmsLoadIdentity();
      shader_color(1.0, 1.0, 1.0, 1.0);
   }
   return result;
}

#endif
