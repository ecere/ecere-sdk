// GL Array Buffer Manipulation

#if defined(__ANDROID__) || defined(__ODROID__)
   #include <GLES/gl.h>

   #define GL_INT    0x1404
   #define GL_DOUBLE 0x140A

   #if !defined(_GLES)
      #define _GLES
   #endif
#elif defined(__EMSCRIPTEN__)
   #include <GLES2/gl2.h>

   #if !defined(_GLES2)
      #define _GLES2
   #endif

   #define GL_INT    0x1404
   #define GL_DOUBLE 0x140A
#else
   #include "gl_compat_4_4.h"
#endif

#define ENABLE_GL_SHADERS  (!defined(_GLES))
#define ENABLE_GL_FFP      (!defined(_GLES2))
#define ENABLE_GL_POINTER  (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_LEGACY   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_INTDBL   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_MAPBUF   (!defined(_GLES) && !defined(_GLES2))

import "immediate"
import "Display"
import "OpenGLDisplayDriver"

// Kept public for now

// NOTE: Don't call if without vertexBuffer
public void GLABDeleteBuffers(int count, GLAB * buffers)
{
   int i;
   for(i = 0; i < count; i++)
   {
      uint buffer = buffers[i].buffer;
      if(buffer)
      {
         if(buffer == glabCurArrayBuffer)
            GLABBindBuffer(GL_ARRAY_BUFFER, 0);
         else if(buffer == glabCurElementBuffer)
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
      }
   }
   if(count && buffers[0].buffer)
      glDeleteBuffers(count, (GLuint *)buffers);
}

// NOTE: Don't call if without vertexBuffer
void GLABBindBuffer(int target, uint buffer)
{
   glBindBuffer(target, buffer);
   if(target == GL_ARRAY_BUFFER)
      glabCurArrayBuffer = buffer;
   else if(target == GL_ELEMENT_ARRAY_BUFFER)
      glabCurElementBuffer = buffer;
}

public enum GLBufferContents { vertex, normal, texCoord, color };

public define noAB = GLAB { 0 };

uint glabCurArrayBuffer;

public struct GLAB
{
   uint buffer;

   void upload(bool vertexBuffer, uint size, void * data)
   {
      if(this != null && data)
      {
         if(vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);
            if(glabCurArrayBuffer != buffer)
               GLABBindBuffer(GL_ARRAY_BUFFER, buffer);
            glBufferData(GL_ARRAY_BUFFER, size, data, GL_STATIC_DRAW);  //GL_DYNAMIC_DRAW);
         }
         else
            buffer = 1;
      }
   }

   void free(bool vertexBuffer)
   {
      if(this != null && buffer)
      {
         if(vertexBuffer)
            GLABDeleteBuffers(1, this);
         buffer = 0;
      }
   }

   void use(GLCapabilities capabilities, GLBufferContents contents, int n, int type, uint stride, void * pointer)
   {
      bool vertexBuffer = capabilities.vertexBuffer;
      bool shaders = capabilities.shaders;
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && vertexBuffer)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if ENABLE_GL_SHADERS
      if(shaders)
         glVertexAttribPointer(contents, n, type, GL_FALSE, stride, pointer);
#endif

#if ENABLE_GL_FFP
      if(!shaders)
         switch(contents)
         {
            case normal:   glNormalPointer(type, stride, pointer); break;
            case vertex:   glVertexPointer(n, type, stride, pointer); break;
            case texCoord: glTexCoordPointer(n, type, stride, pointer); break;
            case color:    glColorPointer(n, type, stride, pointer); break;
         }
#endif
   }

   void useVertTrans(GLCapabilities capabilities, uint count, int n, int type, uint stride, void * pointer)
   {
#if !ENABLE_GL_INTDBL
      bool vertexBuffer = capabilities.vertexBuffer;
      bool shaders = capabilities.shaders;
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && vertexBuffer)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
      if(type == GL_INT)
         glimtkVertexPointeri(shaders, n, stride, pointer, count);
      else if(type == GL_DOUBLE)
      {
#if ENABLE_GL_SHADERS
         if(shaders)
            glVertexAttribPointer(GLBufferContents::vertex, n, GL_DOUBLE, GL_FALSE, stride, pointer);
#endif

#if ENABLE_GL_FFP
         if(!shaders)
            glVertexPointer(n, GL_DOUBLE, stride, pointer);
#endif
      }
#else
      use(capabilities, vertex, n, type, stride, pointer);
#endif
   }
};

uint glabCurElementBuffer;

public define noEAB = GLEAB { 0 };

public struct GLEAB
{
   uint buffer;

   void upload(bool vertexBuffer, uint size, void * data)
   {
      if(this != null && data)
      {
         if(vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);

            if(vertexBuffer && glabCurElementBuffer != buffer)
               GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffer);
            if(size)
               glBufferData(GL_ELEMENT_ARRAY_BUFFER, size, data, GL_STATIC_DRAW);  //GL_DYNAMIC_DRAW);
            else
               ;
         }
         else
            buffer = 1;
      }
   }

   void free(bool vertexBuffer)
   {
      if(this != null && buffer)
      {
         if(vertexBuffer)
            GLABDeleteBuffers(1, (GLAB *)this);
         buffer = 0;
      }
   }

   void draw(bool vertexBuffer, int primType, int count, int type, void * indices)
   {
      if(vertexBuffer
#if ENABLE_GL_POINTER
         || (!buffer && indices)
#endif
         )
      {
         if(vertexBuffer && glabCurElementBuffer != ((this != null) ? buffer : 0))
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if !ENABLE_GL_INTDBL
         type = GL_UNSIGNED_SHORT;
#endif
         glDrawElements(primType, count, type, indices);
      }
   }
};
