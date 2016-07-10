// GL Array Buffer Manipulation
import "immediate"
import "Display"
import "OpenGLDisplayDriver"

#include "glHelpers.h"

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

   void upload(uint size, void * data)
   {
      if(this != null && data)
      {
         if(glcaps_vertexBuffer)
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
         if(glcaps_vertexBuffer)
            GLABDeleteBuffers(1, this);
         buffer = 0;
      }
   }

   void use(GLBufferContents contents, int n, int type, uint stride, void * pointer)
   {
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && glcaps_vertexBuffer)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if ENABLE_GL_SHADERS
      if(glcaps_shaders)
         glVertexAttribPointer(contents, n, type, GL_FALSE, stride, pointer);
#endif

#if ENABLE_GL_FFP
      if(!glcaps_shaders)
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
#if !ENABLE_GL_INTDBL
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && glcaps_vertexBuffer)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
      if(type == GL_INT)
         glimtkVertexPointeri(n, stride, pointer, count);
      else if(type == GL_DOUBLE)
      {
#if ENABLE_GL_SHADERS
         if(glcaps_shaders)
            glVertexAttribPointer(GLBufferContents::vertex, n, GL_DOUBLE, GL_FALSE, stride, pointer);
#endif

#if ENABLE_GL_FFP
         if(!glcaps_shaders)
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
      if(this != null && data)
      {
         if(glcaps_vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);

            if(glcaps_vertexBuffer && glabCurElementBuffer != buffer)
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
         if(glcaps_vertexBuffer)
            GLABDeleteBuffers(1, (GLAB *)this);
         buffer = 0;
      }
   }

   void draw(int primType, int count, int type, void * indices)
   {
      if(glcaps_vertexBuffer
#if ENABLE_GL_POINTER
         || (!buffer && indices)
#endif
         )
      {
         if(glcaps_vertexBuffer && glabCurElementBuffer != ((this != null) ? buffer : 0))
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if !ENABLE_GL_INTDBL
         type = GL_UNSIGNED_SHORT;
#endif
         GLFlushMatrices();
         glDrawElements(primType, count, type, indices);
      }
   }
};
