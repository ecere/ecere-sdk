// GL Array Buffer Manipulation
import "immediate"
import "Display"
import "OpenGLDisplayDriver"

#include "gl123es.h"

namespace gfx::drivers;

// NOTE: Don't call if without vertexBuffer
public void GLABBindBuffer(int target, uint buffer)
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

public enum GLBufferContents { vertex, normal, texCoord, color, tangent1, tangent2, lightVector };

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

   void ::deleteBuffers(int count, GLAB * buffers)
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

   void free()
   {
      if(this != null && buffer)
      {
         if(glCaps_vertexBuffer)
            deleteBuffers(1, this);
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
            case normal:      glNormalPointer      (type, stride, pointer); break;
            case vertex:      glVertexPointer   (n, type, stride, pointer); break;
            case texCoord:    glTexCoordPointer (n, type, stride, pointer); break;
            case lightVector:
            case color:       glColorPointer    (n, type, stride, pointer); break;
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
         glBufferSubData(GL_ELEMENT_ARRAY_BUFFER, offset, size, data);
      }
   }

   void free()
   {
      if(this != null && buffer)
      {
         if(glCaps_vertexBuffer)
            GLAB::deleteBuffers(1, (GLAB *)this);
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
#if !defined(__EMSCRIPTEN__)
         if(glCaps_vertexBuffer && glabCurElementBuffer != ((this != null) ? buffer : 0))
#endif
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
         if(!glCaps_intAndDouble)
            type = GL_UNSIGNED_SHORT;

         GLFlushMatrices();

         //if(!buffer || buffer)  // TOCHECK: Why are we coming here with a 0 buffer?
            glDrawElements(primType, count, type, indices);
      }
   }
};

public struct GLFB
{
   int w, h;
   uint fbo;
   uint color;
   uint depth;
   uint samples;
   uint colorRBO, depthRBO;
   int depthFormat, colorFormat;

   void free()
   {
      if(fbo)
      {
         glDeleteFramebuffers(1, &fbo);
         fbo = 0;
      }
      if(color) glDeleteTextures(1, &color);
      if(depth) glDeleteTextures(1, &depth);
      color = 0;
      depth = 0;

      if(colorRBO) glDeleteRenderbuffers(1, &colorRBO);
      if(depthRBO) glDeleteRenderbuffers(1, &depthRBO);
      colorRBO = 0;
      depthRBO = 0;
   }

   void copyToTexture()
   {
      if(colorRBO)
      {
         glBindFramebuffer(GL_FRAMEBUFFER, fbo);
         glBindTexture(GL_TEXTURE_2D, color);
         glCopyTexImage2D(GL_TEXTURE_2D, 0, colorFormat, 0, 0, w, h, 0);
         glBindTexture(GL_TEXTURE_2D, depth);
         glCopyTexImage2D(GL_TEXTURE_2D, 0, depthFormat, 0, 0, w, h, 0);
         glBindTexture(GL_TEXTURE_2D, 0);
      }
   }

   bool setup(bool textureFBO, bool allocTextures, int samples, int colorFormat, int depthFormat, int width, int height)
   {
      int s;
      bool allocateColor = colorFormat && (w != width || h != height);
      bool allocateDepth = depthFormat && (w != width || h != height);
      bool result = false;
      int texTarget = samples > 1 ? GL_TEXTURE_2D_MULTISAMPLE : GL_TEXTURE_2D;

      if(fbo && (colorRBO == 0) != textureFBO) free();

      if(!fbo) glGenFramebuffers(1, &fbo);
      glBindFramebuffer(GL_FRAMEBUFFER, fbo);

      if(colorFormat && !color)
      {
         allocateColor = true;
         if(textureFBO || allocTextures)
            glGenTextures(1, &color);
         if(!textureFBO)
            glGenRenderbuffers(1, &colorRBO);
      }

      if(depthFormat && !depth)
      {
         allocateDepth = true;
         if(textureFBO || allocTextures)
            glGenTextures(1, &depth);
         if(!textureFBO)
            glGenRenderbuffers(1, &depthRBO);
      }

      while(glGetError());

      // *** Set up Color attachment first ***
      if(allocateColor)
      {
         this.colorFormat = colorFormat;
         if(textureFBO || allocTextures)
            glBindTexture(texTarget, color);
         if(!textureFBO)
            glBindRenderbuffer(GL_RENDERBUFFER, colorRBO);
         for(s = samples; ; s >>= 1)
         {
            if(s > 1)
            {
               if(textureFBO)
                  glTexImage2DMultisample(texTarget, s, colorFormat, width, height, GL_FALSE);
               else
                  glRenderbufferStorageMultisample(GL_RENDERBUFFER, s, colorFormat, width, height);
               if(!glGetError())
                  break;
            }
            else
            {
               texTarget = GL_TEXTURE_2D;
               if(textureFBO || allocTextures)
                  glTexImage2D(texTarget, 0, colorFormat, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
               if(!textureFBO)
                  glRenderbufferStorage(GL_RENDERBUFFER, colorFormat, width, height);
               break;
            }
         }

         if(textureFBO || allocTextures)
         {
            if(samples <= 1)
            {
               glTexParameteri(texTarget, GL_TEXTURE_MAG_FILTER, GL_NEAREST);//GL_LINEAR);
               glTexParameteri(texTarget, GL_TEXTURE_MIN_FILTER, GL_NEAREST);//GL_LINEAR);
               glTexParameteri(texTarget, GL_TEXTURE_MAX_LEVEL, 0);
               glTexParameteri(texTarget, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
               glTexParameteri(texTarget, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
            }
            glBindTexture(texTarget, 0);
         }
         if(textureFBO)
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, texTarget, color, 0);
         else
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, colorRBO);
         samples = s;
      }

      // *** Set up Depth attachment ***
      if(allocateDepth)
      {
         this.depthFormat = depthFormat;
         // TODO: try other samples for depth only?
         if(textureFBO || allocTextures)
         {
            glBindTexture(texTarget, depth);
            if(samples > 1)
               glTexImage2DMultisample(texTarget, samples, depthFormat, width, height, GL_FALSE);
            else
               glTexImage2D(texTarget, 0, depthFormat, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, null);
         }
         if(!textureFBO)
         {
            glBindRenderbuffer(GL_RENDERBUFFER, depthRBO);
            if(samples > 1)
               glRenderbufferStorageMultisample(GL_RENDERBUFFER, samples, depthFormat, width, height);
            else
               glRenderbufferStorage(GL_RENDERBUFFER, depthFormat, width, height);
         }

         if(textureFBO || allocTextures)
         {
            if(samples <= 1)
            {
               glTexParameteri(texTarget, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
               glTexParameteri(texTarget, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
            }
            glBindTexture(texTarget, 0);
         }
         if(textureFBO)
            glFramebufferTexture2D(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, texTarget, depth, 0);
         else
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthRBO);
      }

      this.samples = samples;
      this.w = width;
      this.h = height;

      result = glCheckFramebufferStatus(GL_FRAMEBUFFER) == GL_FRAMEBUFFER_COMPLETE;

#ifdef _DEBUG
      if(!result)
         PrintLn("Incomplete GL Framebuffer\n");
#endif
      return result;
   }
};
