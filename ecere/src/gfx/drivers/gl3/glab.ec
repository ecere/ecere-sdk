// GL Array Buffer Manipulation
import "immediate"
import "Display"
import "OpenGLDisplayDriver"

#include "glHelpers.h"

// Kept public for now

public void GLABDeleteBuffers(int count, GLAB * buffers)
{
   if(glCaps_vertexBuffer)
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

// NOTE: Don't call if without vertexBuffer
void GLABBindBuffer(int target, uint buffer)
{
   if(glCaps_vertexBuffer)
   {
      glBindBuffer(target, buffer);
      if(target == GL_ARRAY_BUFFER)
         glabCurArrayBuffer = buffer;
      else if(target == GL_ELEMENT_ARRAY_BUFFER)
         glabCurElementBuffer = buffer;
   }
}

public enum GLBufferContents { vertex, normal, texCoord, color };

public enum GLBufferUsage { staticDraw, dynamicDraw, streamDraw };

static GLint bufferUsages[] = { GL_DYNAMIC_DRAW, GL_STATIC_DRAW, 0x88E0 /*GL_STREAM_DRAW*/ };

public define noAB = GLAB { 0 };

uint glabCurArrayBuffer;

static short *shortVPBuffer = null;
static uint shortVPSize = 0;

void glabTerminate()
{
   shortVPSize = 0;
   delete shortVPBuffer;
}

public struct GLAB
{
   uint buffer;

   void allocate(uint size, void * data, GLBufferUsage usage)
   {
      if(this != null)
      {
         if(glCaps_vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);
            if(glabCurArrayBuffer != buffer)
               GLABBindBuffer(GL_ARRAY_BUFFER, buffer);
            glBufferData(GL_ARRAY_BUFFER, size, data, bufferUsages[usage]);
         }
         else
            buffer = 1;
      }
   }

   void upload(uint offset, uint size, void * data)
   {
      if(this != null && glCaps_vertexBuffer)
      {
         if(glabCurArrayBuffer != buffer)
            GLABBindBuffer(GL_ARRAY_BUFFER, buffer);
         glBufferSubData(GL_ARRAY_BUFFER, offset, size, data);
      }
   }

   void free()
   {
      if(this != null && buffer)
      {
         if(glCaps_vertexBuffer)
            GLABDeleteBuffers(1, this);
         buffer = 0;
      }
   }

   void use(GLBufferContents contents, int n, int type, uint stride, void * pointer)
   {
      if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && glCaps_vertexBuffer)
         GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         glVertexAttribPointer(contents, n, type, GL_FALSE, stride, pointer);
#endif

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
         switch(contents)
         {
            case normal:   glNormalPointer      (type, stride, pointer); break;
            case vertex:   glVertexPointer   (n, type, stride, pointer); break;
            case texCoord: glTexCoordPointer (n, type, stride, pointer); break;
            case color:    glColorPointer    (n, type, stride, pointer); break;
         }
#endif
   }

   void useVertTrans(uint count, int n, int type, uint stride, void * pointer)
   {
      if(!glCaps_intAndDouble)
      {
         if(glabCurArrayBuffer != ((this != null) ? buffer : 0) && glCaps_vertexBuffer)
            GLABBindBuffer(GL_ARRAY_BUFFER, ((this != null) ? buffer : 0));
         if(type == GL_INT)
         {
            if(pointer)
            {
               int i;
               if(count*n > shortVPSize)
               {
                  shortVPSize = count*n;
                  shortVPBuffer = renew shortVPBuffer short[shortVPSize];
               }
               for(i = 0; i < count*n; i++)
                  shortVPBuffer[i] = (short)((int *)pointer)[i];

               GLVertexPointer(n, GL_SHORT, stride, shortVPBuffer);
            }
            else
               GLVertexPointer(n, GL_SHORT, stride, 0);
         }
         else if(type == GL_DOUBLE)
         {
   #if ENABLE_GL_SHADERS
            if(glCaps_shaders)
               glVertexAttribPointer(GLBufferContents::vertex, n, GL_DOUBLE, GL_FALSE, stride, pointer);
   #endif

   #if ENABLE_GL_FFP
            if(!glCaps_shaders)
               glVertexPointer(n, GL_DOUBLE, stride, pointer);
   #endif
         }
      }
      else
         use(vertex, n, type, stride, pointer);
   }
};

uint glabCurElementBuffer;

public define noEAB = GLEAB { 0 };

public struct GLEAB
{
   uint buffer;

   void allocate(uint size, void * data, GLBufferUsage usage)
   {
      if(this != null)
      {
         if(glCaps_vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);

            if(glCaps_vertexBuffer && glabCurElementBuffer != buffer)
               GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffer);
            if(size)
               glBufferData(GL_ELEMENT_ARRAY_BUFFER, size, data, bufferUsages[usage]);
            else
               ;
         }
         else
            buffer = 1;
      }
   }

   void upload(uint offset, uint size, void * data)
   {
      if(this != null && glCaps_vertexBuffer)
      {
         if(glabCurArrayBuffer != buffer)
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, buffer);
         glBufferSubData(buffer, offset, size, data);
      }
   }

   void free()
   {
      if(this != null && buffer)
      {
         if(glCaps_vertexBuffer)
            GLABDeleteBuffers(1, (GLAB *)this);
         buffer = 0;
      }
   }

   void draw(int primType, int count, int type, void * indices)
   {
      if(glCaps_vertexBuffer
#if ENABLE_GL_POINTER
         || (glCaps_vertexPointer && !buffer && indices)
#endif
         )
      {
         if(glCaps_vertexBuffer && glabCurElementBuffer != ((this != null) ? buffer : 0))
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
         if(!glCaps_intAndDouble)
            type = GL_UNSIGNED_SHORT;
         GLFlushMatrices();
         glDrawElements(primType, count, type, indices);
      }
   }
};
