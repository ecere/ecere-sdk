import "Display"

#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) && !defined(__ODROID__)
#  if defined(SHADERS)
#     include "gl_core_3_3.h"
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

int shadingProgram;

// Uniforms
int uPrjMatrix;
int uMVMatrix;
int uTextureMatrix;
int uColor;
int uTexturingOn;

void shader_LoadMatrixf(MatrixMode mode, float * m)
{
   if(mode == texture)
      glUniformMatrix4fv(uTextureMatrix, 1, GL_FALSE, m);
   else if(mode == projection)
      glUniformMatrix4fv(uPrjMatrix, 1, GL_FALSE, m);
   else
      glUniformMatrix4fv(uMVMatrix, 1, GL_FALSE, m);
}

void shader_color(float r, float g, float b, float a)
{
   glUniform4f(uColor, r, g, b, a);
}

void shader_texturing(bool on)
{
   glUniform1ui(uTexturingOn, on);
}

void loadShaders(const String vertexShaderFile, const String fragmentShaderFile)
{
   static char compileLog[65536];
   #define BUFFER_SIZE  4096
   int bufferLen = BUFFER_SIZE;
   char * buffer = new byte[BUFFER_SIZE];
   int vsLen = 0, fsLen = 0;
   char * vsSource = null;
   char * psSource = null;
   File vf = FileOpen(vertexShaderFile, read);
   File ff = FileOpen(fragmentShaderFile, read);

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

   printf("We've got OpenGL Version %s\n\n", (char *)glGetString(GL_VERSION));
   printf("We've got Shading Language Version %s\n\n", (char *)glGetString(GL_SHADING_LANGUAGE_VERSION));

   {
      int program = glCreateProgram();
      int vShader = glCreateShader(GL_VERTEX_SHADER);
      int fShader = glCreateShader(GL_FRAGMENT_SHADER);
      const char * vptr[1] = { vsSource };
      const char * fptr[1] = { psSource };

      glShaderSource(vShader, 1, vptr, &vsLen);
      glShaderSource(fShader, 1, fptr, &fsLen);
      delete vsSource;
      delete psSource;

      glCompileShader(vShader);
      glGetShaderInfoLog(vShader, sizeof(compileLog), null, compileLog);
      puts("Vertex Shader Compile Log:");
      puts("--------------------------");
      puts(compileLog[0] ? compileLog : "Success.");

      glCompileShader(fShader);
      glGetShaderInfoLog(fShader, sizeof(compileLog), null, compileLog);
      puts("");
      puts("");
      puts("Fragment Shader Compile Log:");
      puts("--------------------------");
      puts(compileLog[0] ? compileLog : "Success.");

      glAttachShader(program, vShader);
      glAttachShader(program, fShader);

      glBindAttribLocation(program, GLBufferContents::vertex, "vertex");
      glBindAttribLocation(program, GLBufferContents::texCoord, "texCoord");
      glBindAttribLocation(program, GLBufferContents::color, "color");
      glBindAttribLocation(program, GLBufferContents::normal, "normal");
      glBindFragDataLocation(program, 0, "fragColor");

      glLinkProgram(program);
      glValidateProgram(program);

      glGetProgramInfoLog(program, sizeof(compileLog), null, compileLog);
      puts("");
      puts("");
      puts("Shader Program Log:");
      puts("--------------------------");
      puts(compileLog[0] ? compileLog : "Success.");

      uPrjMatrix     = glGetUniformLocation(program, "projection_matrix");
      uMVMatrix      = glGetUniformLocation(program, "modelview_matrix");
      uTextureMatrix = glGetUniformLocation(program, "texture_matrix");
      uColor         = glGetUniformLocation(program, "current_color");
      uTexturingOn   = glGetUniformLocation(program, "texturingOn");

      shadingProgram = program;

      glUseProgram(shadingProgram);

      // Initialize uniforms to defaults
      glmsMatrixMode(texture);
      glmsLoadIdentity();
      glmsMatrixMode(projection);
      glmsLoadIdentity();
      glmsMatrixMode(modelView);
      glmsLoadIdentity();
      shader_color(1.0, 1.0, 1.0, 1.0);
   }
}
