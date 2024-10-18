import "Display"
import "matrixStack"
import "glab"
import "String"

#include "gl123es.h"

#ifdef __TIZEN__

#define property _property
#define watch _watch
#define set _set
#define get _get

#include <dlog.h>
#include <app.h>
#include <Elementary.h>
#include <system_settings.h>
#include <efl_extension.h>
#include <Evas_GL_GLES2_Helpers.h> // TODO: Move GLES2_USE to OpenGLDisplayDriver?

#define printf(...) ((void)dlog_print(DLOG_INFO, "ecere-app", __VA_ARGS__))

#undef get
#undef set
#undef watch
#undef property

#endif

namespace gfx::drivers;

// Generic Shader
uint activeProgram;

static char compileLog[65536];

public class CompiledShader : struct
{
public:
   int program, vertex, fragment;

   void free()
   {
#if ENABLE_GL_SHADERS
      if(program)
      {
         if(activeProgram == program)
         {
            glUseProgram(0);
            activeProgram = 0;
         }
         glDeleteProgram(program);
      }
      program = 0;
      if(vertex)
         glDeleteShader(vertex);
      vertex = 0;
      if(fragment)
         glDeleteShader(fragment);
      fragment = 0;
#endif
   }
};

public class Shader
{
   Map<uint64, CompiledShader> programs { };
   CompiledShader shader;
   uint64 activeState;
public:
   property const String vertexShaderFile
   {
      set
      {
         delete vertexShaderSource;
         delete vertexShaderFile;
         vertexShaderFile = CopyString(value);
      }
   }
   property const String fragmentShaderFile
   {
      set
      {
         delete fragmentShaderSource;
         delete fragmentShaderFile;
         fragmentShaderFile = CopyString(value);
      }
   }

   property const String vertexShader
   {
      set
      {
         delete vertexShaderSource;
         delete vertexShaderFile;
         vertexShaderSource = CopyString(value);
         vsLen = value ? strlen(value) : 0;
      }
   }

   property const String fragmentShader
   {
      set
      {
         delete fragmentShaderSource;
         delete fragmentShaderFile;
         fragmentShaderSource = CopyString(value);
         fsLen = value ? strlen(value) : 0;
      }
   }

   uint64 state;
   bool uniformsModified;

private:
   char * vertexShaderFile;
   char * fragmentShaderFile;

   char * vertexShaderSource;
   char * fragmentShaderSource;
   int vsLen, fsLen;

   bool loadShader(const String file, char ** source, int * len)
   {
      File f = FileOpen(file, read);
      // printf("loading shader %s (%p)\n", file, f);
      if(f)
      {
         *len = (int)f.GetSize();
         *source = new byte[*len+1];
         f.Read(*source, 1, *len);
         (*source)[*len] = 0;
         delete f;
         return true;
      }
      else
         printf("Error accessing shader %s.\n", file);
      return false;
   }


   ~Shader()
   {
      delete vertexShaderFile;
      delete fragmentShaderFile;

      delete vertexShaderSource;
      delete fragmentShaderSource;
   }

public:
   void free()
   {
      for(p : programs; p) p.free();
      programs.Free();
      shader = null;
   }

   CompiledShader load(uint64 state)
   {
      CompiledShader shader = null;
      //printf("Shader::load()\n");

#if ENABLE_GL_SHADERS
      MapIterator<uint64, CompiledShader> it { map = programs };
      if(!vertexShaderSource && vertexShaderFile)
         loadShader(vertexShaderFile, &vertexShaderSource, &vsLen);
      if(!fragmentShaderSource && fragmentShaderFile)
         loadShader(fragmentShaderFile, &fragmentShaderSource, &fsLen);

      if(!it.Index(state, true))
      {
#ifdef _DEBUG
         printf("We've got OpenGL Version %s\n\n", (char *)glGetString(GL_VERSION));
         printf("We've got Shading Language Version %s\n\n", (char *)glGetString(GL_SHADING_LANGUAGE_VERSION));
#endif

         {
            int program = glCreateProgram();
            int vShader = glCreateShader(GL_VERTEX_SHADER);
            int fShader = glCreateShader(GL_FRAGMENT_SHADER);
            int vStatus = 0, fStatus = 0;
            ZString definitions = getDefinitions(state);
            if(definitions)
            {
               const char * vSources[2] = { definitions._string, vertexShaderSource };
               const char * fSources[2] = { definitions._string, fragmentShaderSource };
               int vLengths[2] = { definitions.len, vsLen };
               int fLengths[2] = { definitions.len, fsLen };

               glShaderSource(vShader, 2, vSources, vLengths);
               glShaderSource(fShader, 2, fSources, fLengths);
               delete definitions;
            }
            else
            {
               glShaderSource(vShader, 1, (const char **)&vertexShaderSource, &vsLen);
               glShaderSource(fShader, 1, (const char **)&fragmentShaderSource, &fsLen);
            }

            glCompileShader(vShader);

            glGetShaderiv(vShader, GL_COMPILE_STATUS, &vStatus);
            glGetShaderInfoLog(vShader, sizeof(compileLog), null, compileLog);

#ifndef _DEBUG
            if(compileLog[0])
#endif
            {
               printf("Vertex Shader Compile Log:\n");
               printf("--------------------------\n");
               printf("%s\n", compileLog[0] ? compileLog : "Success.");
            }

            glCompileShader(fShader);
            glGetShaderiv(vShader, GL_COMPILE_STATUS, &fStatus);
            glGetShaderInfoLog(fShader, sizeof(compileLog), null, compileLog);
#ifndef _DEBUG
            if(compileLog[0])
#endif
            {
               printf("\n");
               printf("\n");
               printf("Fragment Shader Compile Log:\n");
               printf("--------------------------\n");
               printf("%s\n", compileLog[0] ? compileLog : "Success.");
            }

            if(vStatus && fStatus)
            {
               int pStatus = 0;

               glAttachShader(program, vShader);
               glAttachShader(program, fShader);

               bindAttribs(program);

               glLinkProgram(program);
               glGetProgramInfoLog(program, sizeof(compileLog), null, compileLog);

   #ifndef _DEBUG
               if(compileLog[0])
   #endif
               {
                  printf("\n");
                  printf("\n");
                  printf("Shader Program Linking Log:\n");
                  printf("--------------------------\n");
                  printf("%s\n", compileLog[0] ? compileLog : "Success.");
               }

               glValidateProgram(program);

   #ifndef _DEBUG
               if(compileLog[0])
   #endif
               {
                  printf("\n");
                  printf("\n");
                  printf("Shader Program Validation Log:\n");
                  printf("--------------------------\n");
                  printf("%s\n", compileLog[0] ? compileLog : "Success.");
               }
               glGetProgramiv(program, GL_LINK_STATUS, &pStatus);

               if(pStatus)
               {
                  it.data = shader = registerShader(program, state);
                  shader.program = program;
                  shader.vertex = vShader;
                  shader.fragment = fShader;
               }
            }
         }
   #if defined(_DEBUG) && defined(__WIN32__)
         if(!shader)
            system("pause");
   #endif
      }
      else
         shader = it.data;
#endif
      return shader;
   }

   bool activate()
   {
      bool result = false;
#if ENABLE_GL_SHADERS
      CompiledShader shader = this.shader;
      result = true;
      if(activeState != state || !shader)
      {
         shader = load(state);
         if(!shader) result = false;
      }
      if(shader)
      {
         if(shader != this.shader)
         {
            uniformsModified = true;
            activeState = state;
            this.shader = shader;
         }
         if(activeProgram != shader.program)
         {
            activeProgram = shader.program;
            glUseProgram(shader.program);
         }
         if(uniformsModified)
         {
            uploadUniforms(shader);
            uniformsModified = false;
         }
      }
#endif
      return result;
   }

   void select()
   {
      if(activeShader != this)
      {
         int i;
         activeShader = this;
         for(i = 0; i < 3; i++)
         {
            int ix = matrixIndex[i];
            updateMatrix(MatrixMode::modelView + i, matrixStack[i][ix], isIdentity[i][ix]);
         }
      }
   }

   virtual ZString getDefinitions(uint64 state) { return null; }
   virtual void bindAttribs(int program)
   {
#if ENABLE_GL_SHADERS
      glBindAttribLocation(program, GLBufferContents::vertex,   "vertex");
      glBindAttribLocation(program, GLBufferContents::texCoord, "texCoord");
      glBindAttribLocation(program, GLBufferContents::color,    "color");
      glBindAttribLocation(program, GLBufferContents::normal,   "normal");
#endif
   }
   virtual CompiledShader registerShader(int program, uint64 state) { return CompiledShader { }; }
   virtual void updateMatrix(MatrixMode mode, Matrix matrix, bool isIdentity);
   virtual void uploadUniforms(CompiledShader shader);
   #if !defined(ECERE_NO3D)
   virtual void setMaterial(Material material, MeshFeatures flags);
   #endif
}
