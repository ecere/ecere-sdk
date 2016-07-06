import "Display"
import "matrixStack"
import "glab"

#if defined(__ANDROID__) || defined(__ODROID__)
   #include <GLES/gl.h>

   #define GL_INT    0x1404
   #define GL_DOUBLE 0x140A

   #ifndef _GLES
      #define _GLES
   #endif
#elif defined(__EMSCRIPTEN__)
   #include <GLES2/gl2.h>

   #ifndef _GLES2
      #define _GLES2
   #endif
#else
   #include "gl_compat_4_4.h"
#endif

#define ENABLE_GL_SHADERS  (!defined(_GLES))

#if ENABLE_GL_SHADERS

// Uniforms
int uPrjMatrix;
int uMVMatrix;
int uTextureMatrix;
int uColor;
int uTexturingOn;
int uLightingOn;
int uFogOn;
int uFogDensity;
int uFogColor;
int uGlobalAmbient;
int uLightsOn[8];
int uLightsPos[8];
int uLightsDiffuse[8];
int uLightsAmbient[8];
int uLightsSpecular[8];
int uPerVertexColor;
int uMatDiffuse;
int uMatAmbient;
int uMatSpecular;
int uMatEmissive;
int uMatPower;
int uMatOpacity;
int uMatTwoSided;

void shader_LoadMatrixf(MatrixMode mode, float * m)
{
   if(mode == texture)
      glUniformMatrix4fv(uTextureMatrix, 1, GL_FALSE, m);
   else if(mode == projection)
      glUniformMatrix4fv(uPrjMatrix, 1, GL_FALSE, m);
   else
      glUniformMatrix4fv(uMVMatrix, 1, GL_FALSE, m);
}

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

#if !defined(ECERE_NO3D)
public void shader_setMaterial(Material material, bool perVertexColor)
{
   glUniform1i(uPerVertexColor, perVertexColor);
   glUniform1i(uMatTwoSided, material.flags.doubleSided && !material.flags.singleSideLight);
   glUniform3f(uMatDiffuse, material.diffuse.r, material.diffuse.g, material.diffuse.b);
   glUniform3f(uMatAmbient, material.ambient.r, material.ambient.g, material.ambient.b);
   glUniform3f(uMatSpecular, material.specular.r, material.specular.g, material.specular.b);
   glUniform3f(uMatEmissive, material.emissive.r, material.emissive.g, material.emissive.b);
   glUniform1f(uMatPower, material.power);
   glUniform1f(uMatOpacity, material.opacity);
}
#endif

public void shader_setSimpleMaterial(ColorAlpha color, bool twoSided)
{
   float opacity = color.a / 255.0f;
   float r = color.color.r / 255.0f;
   float g = color.color.g / 255.0f;
   float b = color.color.b / 255.0f;
   glUniform1i(uPerVertexColor, 0);
   glUniform1i(uMatTwoSided, twoSided);
   glUniform3f(uMatDiffuse, r, g, b);
   glUniform3f(uMatAmbient, r, g, b);
   glUniform3f(uMatSpecular, r, g, b);
   glUniform3f(uMatEmissive, 0, 0, 0);
   glUniform1f(uMatPower, 0);
   glUniform1f(uMatOpacity, opacity);
}

public void shader_setPerVertexColor(bool perVertexColor)
{
   glUniform1i(uPerVertexColor, perVertexColor);
}

#if !defined(ECERE_NO3D)
void shader_setLight(Display display, uint id, Light light)
{
   if(light != null)
   {
      Object lightObject = light.lightObject;
      float multiplier = light.multiplier;

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
         /*
         Vector3D positionVector;
         if(light.flags.spot)
         {
            if(lightObject.flags.root || !lightObject.parent)
            {
               positionVector = lightObject.transform.position;
               positionVector.Subtract(positionVector, display.display3D.camera.cPosition);
            }
            else
            {
               positionVector.MultMatrix(lightObject.transform.position, lightObject.parent.matrix);
               if(display.display3D.camera)
                  positionVector.Subtract(positionVector, display.display3D.camera.cPosition);
            }
            position[3] = 1;
         }
         else
         {
            if(!light.direction.x && !light.direction.y && !light.direction.z)
            {
               Vector3Df vector { 0,0,-1 };
               Matrix mat;
               mat.RotationQuaternion(light.orientation);
               positionVector.MultMatrixf(vector, mat);
            }
            else
            {
               positionVector = light.direction;
               position[3] = 1;
            }
         }

         position[0] = (float)positionVector.x;
         position[1] = (float)positionVector.y;
         position[2] = (float)positionVector.z;

         glLightfv(GL_LIGHT0 + id, GL_POSITION, position);

         if(light.flags.attenuation)
         {
            glLightf(GL_LIGHT0 + id, GL_CONSTANT_ATTENUATION, light.Kc);
            glLightf(GL_LIGHT0 + id, GL_LINEAR_ATTENUATION, light.Kl);
            glLightf(GL_LIGHT0 + id, GL_QUADRATIC_ATTENUATION, light.Kq);
         }

         if(light.flags.spot)
         {
            float exponent = 0;
            #define MAXLIGHT  0.9
            float direction[4] = { (float)light.direction.x, (float)light.direction.y, (float)light.direction.z, 1 };
            // Figure out exponent out of the hot spot
            exponent = (float)(log(MAXLIGHT) / log(cos((light.hotSpot / 2))));

            glLightfv(GL_LIGHT0 + id, GL_SPOT_DIRECTION, direction);
            glLightf(GL_LIGHT0 + id, GL_SPOT_CUTOFF, (float)(light.fallOff / 2));
            glLightf(GL_LIGHT0 + id, GL_SPOT_EXPONENT, exponent);
         }
         */
      }
      else
      {
         Vector3Df l;
         Vector3Df vector { 0,0,-1 };
         Vector3Df direction;
         Matrix mat;
         Matrix m = matrixStack[0][matrixIndex[0]];
         m.Scale(nearPlane, nearPlane, nearPlane);

         mat.RotationQuaternion(light.orientation);
         direction.MultMatrix(vector, mat);

         vector.MultMatrix(direction, m);
         l.Normalize(vector);

         glUniform4f(uLightsPos[id], l.x, l.y, l.z, 0);
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
            uTextureMatrix = glGetUniformLocation(program, "texture_matrix");
            uColor         = glGetUniformLocation(program, "current_color");
            uTexturingOn   = glGetUniformLocation(program, "texturingOn");
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

            for(i = 0; i < 8; i++)
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
            }

            oglSystem.shadingProgram = program;
            oglSystem.vertexShader = vShader;
            oglSystem.fragmentShader = fShader;
         }
         result = true;
      }
      delete vf;
      delete ff;
   }
   if(result)
   {
      glUseProgram(oglSystem.shadingProgram);

      // Initialize uniforms to defaults
      glmsMatrixMode(true, texture);
      glmsLoadIdentity(true);
      glmsMatrixMode(true, projection);
      glmsLoadIdentity(true);
      glmsMatrixMode(true, modelView);
      glmsLoadIdentity(true);
      shader_color(1.0, 1.0, 1.0, 1.0);
   }
   return result;
}

#endif
