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

static GLint bufferUsages[] = { GL_STATIC_DRAW, GL_DYNAMIC_DRAW, 0x88E0 /*GL_STREAM_DRAW*/ };

public define noAB = GLAB { 0 };

uint glabCurArrayBuffer;

static short *shortVPBuffer = null;
static uint shortVPSize = 0;

void glabTerminate()
{
   shortVPSize = 0;
   delete shortVPBuffer;
}

///////////////
// FreeBlocks
public class BlockEntry : uint64
{
public:
   uint start:32:32, end:32:0;
};

public class FreeBlockMap : Array<BlockEntry>
{
   uint totalSize;

   void insert(BlockEntry * after, BlockEntry block)
   {
      if(count + 1 > minAllocSize)
         minAllocSize = Max(count, 16) + count / 2;
      Insert((IteratorPointer)after, block);
   }

   void remove(BlockEntry * ptr)
   {
      Remove((IteratorPointer)ptr);
      if(minAllocSize - count > count / 2)
         minAllocSize = count + count / 2;
   }

   BlockEntry * find(uint start)
   {
      BlockEntry * array = this.array;
      int lo = 0, hi = (int)count - 1;
      BlockEntry cmp { start };
      if(hi >= lo)
      {
         int ix = (lo + hi) / 2;
         do
         {
            BlockEntry * ptr = array + ix;
            BlockEntry block = *ptr;
            if(block <= cmp)
            {
               if(block.end >= start)
                  return ptr;
               else
               {
                  lo = ix;
                  ix = (lo + hi)/2;
               }
            }
            else
            {
               hi = ix;
               ix = (lo + hi)/2;
            }
         } while(ix != lo);
      }
      return null;
   }

   void addFreeBlock(uint start, uint size)
   {
      BlockEntry * prevBlock = start ? find(start-1) : null;
      BlockEntry * nextBlock = prevBlock && (prevBlock-array) < count-1 ? prevBlock + 1 : (count ? array : null);

      // Try to merge with previous block
      if(prevBlock && prevBlock->end + 1 == start)
      {
         prevBlock->end = prevBlock->end + size; // FIXME: #1200

         // Try to merge with next block as well
         if(nextBlock && nextBlock->start == prevBlock->end + 1)
         {
            prevBlock->end = nextBlock->end;
            remove(nextBlock);
         }
      }
      // Try to merge with next block
      else if(nextBlock && nextBlock->start == start + size)
         nextBlock->start = start;
      // This free block is not connected to any other block
      else
         insert(prevBlock, { start, start + size - 1 });
   }

public:
   BlockEntry allocate(uint size)
   {
      uint count = this.count;
      BlockEntry * array = this.array;
      uint ix;
      uint endAvailable = 0;
      uint added;
      for(ix = 0; ix < count; ix++)
      {
         BlockEntry * block = array + ix;
         endAvailable = block->end - block->start + 1;
         if(endAvailable >= size)
         {
            uint start = block->start;
            if(block->end - block->start + 1 == size)
               remove(block);
            else
               block->start = block->start + size;
            return { start, start + size - 1 };
         }
      }
      if((added = onExpand(size - endAvailable)))
      {
         BlockEntry * block = count ? array + count - 1 : null;
         uint start;
         if(endAvailable)
            block->end = block->end + added; // FIXME: #1200
         else
         {
            addFreeBlock(totalSize - added, added);
            block = this.array + this.count - 1;
         }

         start = block->start;
         if(block->end - block->start + 1 == size)
            remove(block);
         else
            block->start = block->start + size;
         return { start, start + size - 1 };
      }
      return 0;
   }

   void freeBlock(BlockEntry block)
   {
      addFreeBlock(block.start, block.end - block.start + 1);
   }

   virtual uint onExpand(uint required) { return 0; }
}

///////////////

public class GLMB : FreeBlockMap
{
public:
   GLB ab;

   uint onExpand(uint extraNeeded)
   {
      uint newSize = totalSize + Max(extraNeeded, totalSize / 2);
      if(ab.resize(totalSize, newSize, staticDraw))
      {
         uint spaceAdded = newSize - totalSize;
         totalSize = newSize;
         return spaceAdded;
      }
      return 0;
   }

   void free()
   {
      Free();
      ab.free();
      totalSize = 0;
   }
};

#ifdef _DEBUG
#define GLSTATS
#endif

public enum GLBType { elements, attributes };

public struct GLB
{
   uint buffer;

   bool resize(uint oldSize, uint newSize, GLBufferUsage usage)
   {
      // TODO: Update buffers and defrag instead of doing 2 copy?
      if(!oldSize)
         return allocate(newSize, null, usage);
      else
      {
         GLB tmp { };
         tmp.allocate(newSize, null, usage);
         tmp.copy(this, 0, 0, oldSize);
         allocate(newSize, null, usage);
         copy(tmp, 0, 0, oldSize);
         tmp.free();
      }
      return true;
   }

   void copy(GLB src, uint srcStart, uint dstStart, uint size)
   {
#if !defined(__ANDROID__) && !defined(__EMSCRIPTEN__) // TODO:
      glBindBuffer(GL_COPY_READ_BUFFER, src.buffer);
      glBindBuffer(GL_COPY_WRITE_BUFFER, buffer);
      glCopyBufferSubData(GL_COPY_READ_BUFFER, GL_COPY_WRITE_BUFFER, srcStart, dstStart, size);
#endif
   }

   bool _allocate(GLBType type, uint size, const void * data, GLBufferUsage usage)
   {
      if(this != null)
      {
         if(glCaps_vertexBuffer)
         {
            if(!buffer)
               glGenBuffers(1, &buffer);

            GLABBindBuffer(type == attributes ? GL_ARRAY_BUFFER : GL_ELEMENT_ARRAY_BUFFER, buffer);
#ifdef GLSTATS
            GLStats::allocBuffer(buffer, size);
#endif
            if(size)
               glBufferData(type == attributes ? GL_ARRAY_BUFFER : GL_ELEMENT_ARRAY_BUFFER, size, data, bufferUsages[usage]);
         }
         else
            buffer = 1;
         return true;
      }
      return false;
   }

   void _upload(GLBType type, uint offset, uint size, const void * data)
   {
      if(this != null && glCaps_vertexBuffer)
      {
         GLABBindBuffer(type == attributes ? GL_ARRAY_BUFFER : GL_ELEMENT_ARRAY_BUFFER, buffer);
         glBufferSubData(type == attributes ? GL_ARRAY_BUFFER : GL_ELEMENT_ARRAY_BUFFER, offset, size, data);
      }
   }

   bool allocate(uint size, const void * data, GLBufferUsage usage)
   {
      return _allocate(attributes, size, data, usage);
   }

   void upload(uint offset, uint size, const void * data)
   {
      _upload(attributes, offset, size, data);
   }

   void ::deleteBuffers(int count, GLB * buffers)
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
         {
            glDeleteBuffers(count, (GLuint *)buffers);
#ifdef GLSTATS
            GLStats::freeBuffers(count, (uint *)buffers);
#endif
         }
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
};

public struct GLAB : GLB
{
   void use(GLBufferContents contents, int n, int type, uint stride, const void * pointer)
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

   void useVertTrans(uint count, int n, int type, uint stride, const void * pointer)
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

public struct GLEAB : GLB
{
   bool allocate(uint size, const void * data, GLBufferUsage usage)
   {
      return _allocate(elements, size, data, usage);
   }

   void upload(uint offset, uint size, const void * data)
   {
      _upload(elements, offset, size, data);
   }

   void draw(int primType, int count, int type, const void * indices)
   {
      if(count && (glCaps_vertexBuffer
#if ENABLE_GL_POINTER
         || (glCaps_vertexPointer && !buffer && indices)
#endif
         ))
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

   void draw2(int primType, int count, int type, const void * indices, uint baseVertex)
   {
      if(count && (glCaps_vertexBuffer
#if ENABLE_GL_POINTER
         || (glCaps_vertexPointer && !buffer && indices)
#endif
         ))
      {
#if !defined(__EMSCRIPTEN__)
         if(glCaps_vertexBuffer && glabCurElementBuffer != ((this != null) ? buffer : 0))
#endif
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ((this != null) ? buffer : 0));
         if(!glCaps_intAndDouble)
            type = GL_UNSIGNED_SHORT;

         GLFlushMatrices();

         //if(!buffer || buffer)  // TOCHECK: Why are we coming here with a 0 buffer?
#if !defined(_GLES) && !defined(_GLES2)
         if(baseVertex)
            glDrawElementsBaseVertex(primType, count, type, indices, baseVertex);
         else
#endif
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
#if !defined(_GLES) && !defined(_GLES2)
      int texTarget = samples > 1 ? GL_TEXTURE_2D_MULTISAMPLE : GL_TEXTURE_2D;
#else
      int texTarget = GL_TEXTURE_2D;
#endif

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
#if !defined(_GLES) && !defined(_GLES2)
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
#endif
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
#if !defined(_GLES) && !defined(_GLES2)
               glTexParameteri(texTarget, GL_TEXTURE_MAX_LEVEL, 0);
#endif
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
#if !defined(_GLES) && !defined(_GLES2)
            if(samples > 1)
               glTexImage2DMultisample(texTarget, samples, depthFormat, width, height, GL_FALSE);
            else
#endif
               glTexImage2D(texTarget, 0, depthFormat, width, height, 0, GL_DEPTH_COMPONENT, GL_FLOAT, null);
         }
         if(!textureFBO)
         {
            glBindRenderbuffer(GL_RENDERBUFFER, depthRBO);
#if !defined(_GLES) && !defined(_GLES2)
            if(samples > 1)
               glRenderbufferStorageMultisample(GL_RENDERBUFFER, samples, depthFormat, width, height);
            else
#endif
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

   void copy(const GLFB src, const Box srcExtent, const Box dstExtent, ClearType buffers, bool filter)
   {
#if !defined(_GLES) && !defined(_GLES2)
      int sx = srcExtent != null ? srcExtent.left : 0;
      int sy = srcExtent != null ? srcExtent.top : 0;
      int sx1 = srcExtent != null ? srcExtent.right : src.w;
      int sy1 = srcExtent != null ? srcExtent.bottom : src.h;
      int dx = dstExtent != null ? dstExtent.left : 0;
      int dy = dstExtent != null ? dstExtent.top : 0;
      int dx1 = dstExtent != null ? dstExtent.right : w;
      int dy1 = dstExtent != null ? dstExtent.bottom : h;

      glBindFramebuffer(GL_DRAW_FRAMEBUFFER, fbo);
      glBindFramebuffer(GL_READ_FRAMEBUFFER, src.fbo);
      glBlitFramebuffer(
         sx, sy, sx1, sy1,
         dx, dy, dx1, dy1,
         buffers == colorAndDepth ? GL_COLOR_BUFFER_BIT :
         buffers == depthBuffer ? GL_DEPTH_BUFFER_BIT :
         (GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT),
         filter ? GL_LINEAR : GL_NEAREST);
#endif
   }

   void read(Bitmap bitmap, ClearType buffer, bool sRGB)
   {
#if !defined(_GLES) && !defined(_GLES2)
      glBindFramebuffer(GL_FRAMEBUFFER, fbo);
      glReadBuffer(buffer == depthBuffer ? GL_DEPTH_ATTACHMENT : GL_COLOR_ATTACHMENT0);
      if(sRGB) glEnable( GL_FRAMEBUFFER_SRGB );
      glReadPixels(0, 0, bitmap.width, bitmap.height, GL_BGRA, GL_UNSIGNED_BYTE, bitmap.picture);
      if(sRGB) glDisable( GL_FRAMEBUFFER_SRGB );
      glBindFramebuffer(GL_FRAMEBUFFER, 0);
#endif
   }
};

static Map<uint, uint> textures { };
static Map<uint, uint> buffers { };

static uint64 texMem;
static uint64 bufMem;

public class GLStats
{
public:
   void ::allocTexture(uint tex, uint w, uint h, bool mipMaps)
   {
      uint currentMem = textures[tex];
      uint newMem = w * h;

      if(mipMaps)
         newMem += (uint)(newMem * 1.33);
      texMem += (int)newMem - (int)currentMem;
      textures[tex] = newMem;
   }

   void ::freeTextures(uint count, uint * texs)
   {
      int i;
      for(i = 0; i < count; i++)
      {
         uint tex = texs[i];
         MapIterator<uint, uint> it { map = textures };
         if(it.Index(tex, false))
         {
            texMem -= it.data;
            it.Remove();
         }
      }
   }

   void ::allocBuffer(uint buf, uint size)
   {
      uint currentMem = buffers[buf];
      bufMem += (int)size - (int)currentMem;
      buffers[buf] = size;
   }

   void ::freeBuffers(uint count, uint * bufs)
   {
      int i;
      for(i = 0; i < count; i++)
      {
         uint buf = bufs[i];
         MapIterator<uint, uint> it { map = buffers };
         if(it.Index(buf, false))
         {
            bufMem -= it.data;
            it.Remove();
         }
      }
   }

   void ::print()
   {
      char tmp[256];
      PrintLn("");
      PrintLn("OpenGL Textures & Buffers Memory Stats");
      PrintLn("======================================");
      PrintSize(tmp, texMem, 2);
      PrintLn(textures.count, " textures allocated; ", tmp);
      PrintSize(tmp, bufMem, 2);
      PrintLn(buffers.count, " buffers allocated; ", tmp);
      PrintLn("");
   }
}
