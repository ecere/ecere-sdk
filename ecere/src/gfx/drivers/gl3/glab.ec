// GL Array Buffer Manipulation

#if !defined(_GLES)
 #define SHADERS
#endif

#if defined(__ANDROID__) || defined(__ODROID__)
   #include <GLES/gl.h>

   #define GL_INT    0x1404
   #define GL_DOUBLE 0x140A
#elif defined(__EMSCRIPTEN__)
   #include <GLES2/gl2.h>

#if !defined(_GLES2)
   #define _GLES2
#endif

   #define GL_INT    0x1404
   #define GL_DOUBLE 0x140A
#else
#  if defined(SHADERS)
#     include "gl_core_3_3.h"
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

import "immediate"
import "Display"
import "OpenGLDisplayDriver"

// Kept public for now
public void GLABDeleteBuffers(int count, GLAB * buffers)
{
   if(vboAvailable)
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
}

void GLABBindBuffer(int target, uint buffer)
{
   if(vboAvailable)
   {
      glBindBuffer(target, buffer);
      if(target == GL_ARRAY_BUFFER)
         glabCurArrayBuffer = buffer;
      else if(target == GL_ELEMENT_ARRAY_BUFFER)
         glabCurElementBuffer = buffer;
   }
}

public enum GLBufferContents { vertex, normal, texCoord, color };

public define noAB = GLAB { 0 };

uint glabCurArrayBuffer;

public struct GLAB
{
   uint buffer;

   void upload(uint size, void * data)
   {
      if(this != null)
      {
         if(vboAvailable)
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

   void free()
   {
      if(this != null && buffer)
      {
         if(vboAvailable)
            GLABDeleteBuffers(1, this);
         buffer = 0;
      }
   }

   void use(GLBufferContents contents, int n, int type, uint stride, void * pointer)
   {
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && vboAvailable)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#ifdef SHADERS
      glVertexAttribPointer(contents, n, type, GL_FALSE, stride, pointer);
#else
      switch(contents)
      {
         case normal:   glNormalPointer(type, stride, pointer); break;
         case vertex:   glVertexPointer(n, type, stride, pointer); break;
         case texCoord: glTexCoordPointer(n, type, stride, pointer); break;
         case color:    glColorPointer(n, type, stride, pointer); break;
      }
#endif
   }

   void useVertTrans(uint count, int n, int type, uint stride, void * pointer)
   {
#if defined(_GLES) || defined(_GLES2)
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && vboAvailable)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
      if(type == GL_INT)
         glimtkVertexPointeri(n, stride, pointer, count);
      else if(type == GL_DOUBLE)
      {
#ifdef SHADERS
         glVertexAttribPointer(GLBufferContents::vertex, n, GL_DOUBLE, GL_FALSE, stride, pointer);
#else
         glVertexPointer(n, GL_DOUBLE, stride, pointer);
#endif
      }
#else
      use(vertex, n, type, stride, pointer);
#endif
   }
};

uint glabCurElementBuffer;

public define noEAB = GLEAB { 0 };

public struct GLEAB
{
   uint buffer;

   void upload(uint size, void * data)
   {
      if(this != null)
      {
         if(vboAvailable)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);

            if(glabCurElementBuffer != buffer)
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

   void free()
   {
      if(this != null && buffer)
      {
         if(vboAvailable)
            GLABDeleteBuffers(1, (GLAB *)this);
         buffer = 0;
      }
   }

   void draw(int primType, int count, int type, void * indices)
   {
      if(vboAvailable || !buffer)
      {
         if(glabCurElementBuffer != ((this != null) ? buffer : 0))
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if defined(_GLES) || defined(_GLES2)
         type = GL_UNSIGNED_SHORT;
#endif
         glDrawElements(primType, count, type, indices);
      }
   }
};
