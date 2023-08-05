#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)

import "OpenGLDisplayDriver"

#include "gl123es.h"

#ifdef _DEBUG
#define GLSTATS
#endif

#if defined(_GLES3)
#include <GLES3/gl32.h>
#endif

#if defined(_GLES2)
#define GL_R16 GL_LUMINANCE
#define GL_RED GL_LUMINANCE   // Should this be GL_ALPHA ? Swizzle mode needed?
#endif

public define drawIDAttribute = 7;
public define posOffsetAttribute = 8;

public define transform0Attribute = 9;
public define transform1Attribute = 10;
public define transform2Attribute = 11;
public define transform3Attribute = 12;

private:

// Set glCapabilities.gpuCommands = false as a work-around for Intel driver that does not seem to support
// indirect commands buffers, and/or glCapabilities.mdei = false
// #define CLIENT_MEM_COMMANDS
#if defined(__UWP__)
 #define CLIENT_MEM_COMMANDS
#endif

#define GL_CLAMP_TO_EDGE 0x812F

#if defined _GLES1
#define glClampFunction(version) (GL_CLAMP)
#elif defined(_GLES2) || defined(_GLES3)
#define glClampFunction(version) (GL_CLAMP_TO_EDGE)
#else
#define glClampFunction(version) (version >= 2 ? GL_CLAMP_TO_EDGE : GL_CLAMP)
#endif

public struct FreeSpots
{
   uint size;
   int * spots;
   int nextSpot;
   int used;

   void init(uint count)
   {
      if(count)
      {
         int i;
         spots = new int[count];
         for(i = 0; i < (int)count-1; i++)
            spots[i] = i+1;
         spots[i] = -1;
         nextSpot = 0;
         size = count;
      }
   }

   void markFree(int spot)
   {
      if(spot != -1)
      {
         spots[spot] = nextSpot;
         nextSpot = spot;
         used--;
      }
   }

   int next()
   {
      int result = -1;
      if(nextSpot != -1)
      {
         result = nextSpot;
         nextSpot = spots[nextSpot];
         spots[result] = -1;
         used++;
      }
      return result;
   }


   // NOTE: Only supporting resizing bigger...
   void resize(uint count)
   {
      if(!size)
         init(count);
      else if(count > size)
      {
         int i;

         spots = renew spots int[count];
         for(i = size-1; i < count-1; i++)
            spots[i] = i+1;
         spots[i] = -1;
         if(nextSpot == -1)
            nextSpot = size;
         size = count;
      }
   }
};

default:
#if defined(_GLES3) && !defined(__UWP__)  // TOCHECK: Whatversion for UWP, WebGL 2?
int glVersion = 3;
#elif defined(_GLES2)
int glVersion = 2;
#elif defined(_GLES)
int glVersion = 1;
#else
int glVersion = 0;
#endif
private:

#if (defined(__ANDROID__) && !defined(__LUMIN__)) || defined(__UWP__) || defined(__EMSCRIPTEN__)
uint tempTexFBO;  // TODO: Free this on termination... glDeleteFramebuffers(1, &tempTexFBO);
#endif

public enum GLTextureFilter { nearest, linear };

public struct GLArrayTexture
{
   uint texture;
   uint width, height, numLayers;
   uint numLevels;
   bool maxLevel;
   int format;
   /*private */FreeSpots spots;

   void free()
   {
#ifdef GLSTATS
      GLStats::freeTextures(1, &texture);
#endif
      if(texture)
         glDeleteTextures(1, &texture);
      delete spots.spots;
      texture = 0;
   }

   void init(int levels, int w, int h, int count)
   {
#if !defined(_GLES) && !defined(_GLES2)
      int internalFormat = GL_RGBA8;
#else
      int internalFormat = GL_RGBA;
#endif
      _init(levels, w, h, count, internalFormat, false);
   }

   void initMaxLevel(int levels, int w, int h, int count)
   {
#if !defined(_GLES) && !defined(_GLES2)
      int internalFormat = GL_RGBA8;
#else
      int internalFormat = GL_RGBA;
#endif
      _init(levels, w, h, count, internalFormat, true);
   }

   void initUShort(int levels, int w, int h, int count)
   {
#if defined(_GLES3)
      _init(levels, w, h, count, GL_R16UI, false);
#else
      _init(levels, w, h, count, GL_R16, false);
#endif
   }
   void initRGBUShort(int levels, int w, int h, int count)
   {
#if defined(_GLES3)
      _init(levels, w, h, count, GL_RGB16UI, false);
#else
      _init(levels, w, h, count, GL_RGB16, false);
#endif
   }
   void initRGBAUShort(int levels, int w, int h, int count)
   {
#if defined(_GLES3)
      _init(levels, w, h, count, GL_RGBA16UI, false);
#else
      _init(levels, w, h, count, GL_RGBA16, false);
#endif
   }

   void _init(int levels, int w, int h, int count, int format, bool setMaxLevel)
   {
      // TODO: How to replace texture arrays in OpenGL ES 2? They are supported in ES 3 / WebGL 2.
      // Easy way to alternatively use a list of different textures?
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      int target = GL_TEXTURE_2D_ARRAY;
      if(texture)
      {
         // glTexStorage* immutable-format textures need to be deleted before invoking it again
#ifdef GLSTATS
         GLStats::freeTextures(1, &texture);
#endif
         glDeleteTextures(1, &texture);
         texture = 0;
      }

#if !defined(_GLES) && !defined(_GLES2) && !defined(_GLES3)
      if(!glVersion)
         glVersion = ogl_GetMajorVersion();
#endif

      if(!texture)
         glGenTextures(1, &texture);

      this.format = format;
      maxLevel = setMaxLevel;
      numLevels = levels;
      width = w;
      height = h;
      if(count)
         numLayers = count;

      glBindTexture(target, texture);

#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(setMaxLevel)
         glTexParameteri(target, GL_TEXTURE_MAX_LEVEL, levels-1);
#endif

#ifdef _DEBUG
      CheckGLErrors(__FILE__,__LINE__);
#endif
      if(glVersion) // >= 4) // && glMinorVersion >= 2)
         glTexStorage3D(target, levels, format, w, h, numLayers);
      else
      {
         // TODO: Review for GL 3 support?
         /*if(numLayers > 1 && glVersion)
            glTexImage3D(target, levels, format, w, h, numLayers, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
         else*/
            glTexImage2D(target, levels, format, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
      }

#ifdef GLSTATS
      GLStats::allocTexture(texture, w, h * numLayers, levels > 1);
#endif

#ifdef _DEBUG
      CheckGLErrors(__FILE__,__LINE__);
#endif
   #ifdef GL_TEXTURE_MAX_ANISOTROPY_EXT
      if(glVersion >= 2)
         glTexParameterf(target, GL_TEXTURE_MAX_ANISOTROPY_EXT, 16.0 );
   #endif

#if defined(_GLES) || !defined(_GLES2) || defined(_GLES3)
      if(format == GL_R16UI || format == GL_RGB16UI || format == GL_RGBA16UI)
      {
         // Only Nearest supported for *UI formats
         glTexParameteri(target, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
         glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
      }
      else
#endif
      {
         glTexParameteri(target, GL_TEXTURE_MIN_FILTER, levels > 1 ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
         glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
      }

      if(levels > 3) // TODO: Wrap options as a property?
      {
         glTexParameteri(target, GL_TEXTURE_WRAP_S, GL_REPEAT);
         glTexParameteri(target, GL_TEXTURE_WRAP_T, GL_REPEAT);
      }
      else
      {
         glTexParameteri(target, GL_TEXTURE_WRAP_S, glClampFunction(glVersion)); //GL_CLAMP_TO_EDGE
         glTexParameteri(target, GL_TEXTURE_WRAP_T, glClampFunction(glVersion)); //GL_CLAMP_TO_EDGE
      }
      glBindTexture(target, 0);
#endif
   }

   void setFilter(GLTextureFilter minFilter, GLTextureFilter magFilter)
   {
#if ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
      int target = GL_TEXTURE_2D_ARRAY;
      glBindTexture(target, texture);
      glTexParameteri(target, GL_TEXTURE_MIN_FILTER, minFilter == nearest ? GL_NEAREST : (numLevels > 1 ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR));
      glTexParameteri(target, GL_TEXTURE_MAG_FILTER, magFilter == nearest ? GL_NEAREST : GL_LINEAR);
      glBindTexture(target, 0);
#endif
   }

   void resize(uint numLayers, uint targetFBO)
   {
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      GLArrayTexture tmp { };

      tmp._init(numLevels, width, height, numLayers, format, maxLevel);
      tmp.copy(this, targetFBO);
      glBindTexture(GL_TEXTURE_2D_ARRAY, 0); // TOCHECK:
#ifdef GLSTATS
      GLStats::freeTextures(1, &texture);
#endif
      glDeleteTextures(1, &texture);

      texture = tmp.texture;
      this.numLayers = numLayers;
      if(spots.spots)
         spots.resize(numLayers);
#endif
   }

   void copy(GLArrayTexture src, uint targetFBO)
   {
#if ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
      int target = GL_TEXTURE_2D_ARRAY;
      // 4.3+
#if (!defined(__ANDROID__) || defined(__LUMIN__)) && !defined(__UWP__) && !defined(__EMSCRIPTEN__)
      int level = 0;
      int w = width, h = height;

      // glCopyImageSubData doesn't use bound texture... glBindTexture(target, src.texture);
      for(level = 0; level < numLevels; level++)
      {
         // NOTE: On nVidia 455 linux drivers, copying lower mipmaps for compressed texture is not working
         glCopyImageSubData(
            src.texture, target, level, 0, 0, 0,
            texture,     target, level, 0, 0, 0,
            w, h, src.numLayers);
         if(w > 1) w >>= 1;
         if(w > 1) h >>= 1;
      }
      // glBindTexture(target, 0);
#else
      // FALLBACK for 3.0->4.2:
      int i;

      // TODO: Fix for multiple levels...

      if(!tempTexFBO)
         glGenFramebuffers(1, &tempTexFBO);
      glBindFramebuffer(GL_FRAMEBUFFER, tempTexFBO);
      glBindTexture(target, texture);
      for(i = 0; i < src.numLayers; i++)
      {
         /* FIXME: binding a compressed texture as a color attachment won't work
                   Without ARB_copy_image, probably need to use PBO (glGetCompressedTexImage) */
         glFramebufferTextureLayer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, src.texture, 0, i);
         glCopyTexSubImage3D(target, 0, 0, 0, i, 0, 0, width, height);
      }
      glBindTexture(target, 0);
      glBindFramebuffer(GL_FRAMEBUFFER, targetFBO);
#endif
#endif
   }

   void setLayer(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGBA, GL_UNSIGNED_BYTE);
   }

   void setLayerUShort(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
#if defined(_GLES3)
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RED_INTEGER, GL_UNSIGNED_SHORT);
#else
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RED, GL_UNSIGNED_SHORT);
#endif
   }

   void setLayerRGBUShort(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
#if defined(_GLES3)
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGB_INTEGER, GL_UNSIGNED_SHORT);
#else
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGB, GL_UNSIGNED_SHORT);
#endif
   }

   void setLayerRGBAUShort(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
#if defined(_GLES3)
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGBA_INTEGER, GL_UNSIGNED_SHORT);
#else
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGBA, GL_UNSIGNED_SHORT);
#endif
   }

   void setLayerFormat(int level, int x, int y, int layer, byte * c, uint targetFBO, int format, int type)
   {
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      int target = GL_TEXTURE_2D_ARRAY;

      if(layer >= numLayers)
         resize(layer + Max(2, layer)/2, targetFBO);

      glBindTexture(target, texture);
      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      glTexSubImage3D(target, level, x, y, layer, width >> level, height >> level, 1, format, type, c);
      glBindTexture(target, 0);
#endif
   }

   void setLayerCompressed(int level, int x, int y, int layer, byte * c, uintsize sizeBytes, uint targetFBO)
   {
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      int target = GL_TEXTURE_2D_ARRAY;

      if(layer >= numLayers)
         resize(layer + Max(2, layer)/2, targetFBO);

      glBindTexture(target, texture);
      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      glCompressedTexSubImage3D(target, level, x, y, layer, width >> level, height >> level, 1,
         format, sizeBytes, c);
      glBindTexture(target, 0);
#endif
   }

   void set1x1Layer(int layer, ColorAlpha color, uint targetFBO)
   {
      byte c[4] = { color.color.r, color.color.g, color.color.b, color.a };
      setLayer(0, 0, 0, layer, c, targetFBO);
   }

   void bind()
   {
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
#endif
   }

   int allocateLayer(uint targetFBO)
   {
      int layer;
      if(!spots.spots)
         spots.init(numLayers);
      layer = spots.spots ? spots.next() : -1;
      if(layer == -1 && numLayers < 2048)
      {
         resize(Min(2048, Max(8, numLayers + numLayers/2)), targetFBO);
         layer = spots.next();
      }
      if(spots.used >= 2048)
         PrintLn("WARNING: Already 2048 layers used in array texture!");
      if(layer == -1)
         PrintLn("ERROR: Failure to allocate texture layer!");
      return layer;
   }

   void freeLayer(int layer)
   {
      spots.markFree(layer);
   }
};

public struct GLDrawCommand
{
   uint count;
   uint instanceCount;
   uint firstIndex;
   uint baseVertex;
   uint baseInstance;
};

public struct GLMultiDraw
{
   GLMB indexGLMB;
   GLMB vertexGLMB;
   GLAB idsAB;
   GLCAB commandsB;
   uint vao;
   uint commandsCount;
   GLIMTKMode drawMode;
   uint commandsAlloced;
   uint * drawIDs;
   GLDrawCommand * commands;
   uint type;
   uint idsAlloced;
   uint totalInstances;

   // For GL ES lack of baseInstance, we need to know this here...
   uint vertexStride;
   GLAB transformsAB;
   int transformSize;
   float * transforms;

   // To avoid changing the state of the VAO unnecessarily
   uint lastTransformAB;
   uint lastIDAB;
   uint lastVBO;
   uint lastIBO;

   void printStats()
   {
      PrintLn("* Indices Stats: ");
      if(indexGLMB) indexGLMB.printStats();
      PrintLn("* Vertices Stats: ");
      if(vertexGLMB) vertexGLMB.printStats();
      PrintLn("");
   }

   property bool ix32 { set { type = value ? GL_UNSIGNED_INT : GL_UNSIGNED_SHORT; } }

   void init(GLIMTKMode mode, uint minAlloc)
   {
      drawMode = mode;
      type = GL_UNSIGNED_SHORT;
      // if(!minAlloc) minAlloc = 8;
      if(!vertexGLMB)
         vertexGLMB = {};
      if(!indexGLMB)
         indexGLMB = {};
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(minAlloc && !vao && glCaps_vao)
         glGenVertexArrays(1, &vao);
#endif
      if(minAlloc > commandsCount)
         resize(minAlloc);
   }

   void resize(uint size)
   {
      drawIDs = renew0 drawIDs uint[size];
      commands = renew0 commands GLDrawCommand[size];
      commandsAlloced = size;
      idsAlloced = size;

      // PrintLn("Resizing idsAB (", idsAB.buffer, ") to be ", size, " uint big");
      idsAB.allocate(size * sizeof(uint), null, streamDraw);
#ifndef CLIENT_MEM_COMMANDS
      if(glCaps_gpuCommands)
         commandsB.allocate(size * sizeof(GLDrawCommand), null, streamDraw);
#endif
   }

   void resizeCommands(uint size)
   {
      commands = renew0 commands GLDrawCommand[size];
      commandsAlloced = size;
      if(glCaps_gpuCommands)
         commandsB.allocate(size * sizeof(GLDrawCommand), null, streamDraw);
   }

   void resizeIDs(uint size)
   {
      drawIDs = renew0 drawIDs uint[size];
      idsAlloced = size;
      idsAB.allocate(size * sizeof(uint), null, streamDraw);
   }

   void free()
   {
      idsAB.free();
      commandsB.free();

      if(indexGLMB) indexGLMB.free(), delete indexGLMB;
      if(vertexGLMB) vertexGLMB.free(), delete vertexGLMB;
      delete drawIDs;
      delete commands;
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(vao && glCaps_vao)
      {
         glDeleteVertexArrays(1, &vao);
         vao = 0;
      }
#endif
      commandsAlloced = 0;
      idsAlloced = 0;

      lastIDAB = 0;
      lastIBO = 0;
      lastVBO = 0;
      lastTransformAB = 0;
   }

   int allocateVbo(uint nVertices, uint vertexSize, const void *data)
   {
      uint size = nVertices * vertexSize;
      BlockEntry block = size ? vertexGLMB.allocate(attributes, size) : 0;
      int baseVertex = block ? block.start / vertexSize : -1;
      if(data && baseVertex != -1)
         vertexGLMB.ab.upload(block.start, size, data);
      return baseVertex;
   }

   void freeVbo(int baseVertex, uint vertexSize, uint count)
   {
#ifdef _DEBUG
      if(!vertexGLMB)
         PrintLn("WARNING: null vertexGLMB calling freeVbo()");
#endif

      if(baseVertex != -1)
         vertexGLMB.freeBlock(BlockEntry { baseVertex * vertexSize, (baseVertex+count) * vertexSize-1 });
   }

   int allocateIx(uint nIndices, uint indexSize, const void *data)
   {
      uint size = nIndices * indexSize;
      BlockEntry block = size ? indexGLMB.allocate(elements, size) : 0;
      int baseIndex = block ? block.start / indexSize : -1;
      if(data && baseIndex != -1)
      {
         GLEAB eab { indexGLMB.ab.buffer };
         eab.upload(block.start, size, data);
      }
      return baseIndex;
   }

   void freeIx(int baseIndex, uint indexSize, uint count)
   {
      if(baseIndex != -1)
         indexGLMB.freeBlock(BlockEntry { baseIndex * indexSize, (baseIndex+count) * indexSize-1 });
   }

   void addDrawCommand(uint indexCount, uint instanceCount, uint firstIndex, uint baseVertex, uint baseInstance)
   {
      addDrawCommandCustomID(indexCount, instanceCount, firstIndex, baseVertex, baseInstance, totalInstances);
   }

   void addDrawCommandCustomID(uint indexCount, uint instanceCount, uint firstIndex, uint baseVertex, uint baseInstance, uint layer)
   {
      if(commandsCount >= commandsAlloced)
         resizeCommands(commandsCount + Max(1, commandsCount / 2));
      if(totalInstances + instanceCount >= idsAlloced)
         resizeIDs(totalInstances + Max(instanceCount, totalInstances / 2));

      commands[commandsCount] =
      {
         count = indexCount,
         instanceCount = instanceCount,
         firstIndex = firstIndex,
         baseVertex = baseVertex,
         baseInstance = baseInstance
      };
      commandsCount++;
      FillBytesBy4(drawIDs + totalInstances, layer, instanceCount);
      totalInstances += instanceCount;
   }

   void prepare(int vertNCoords, int verticesStride)
   {
      // NOTE: prepare() is also used to update state when VAOs are not used, pass flag when upload is needed?
      idsAB.upload(0, totalInstances * sizeof(uint), drawIDs);
      if(glCaps_gpuCommands)
         commandsB.upload(0, commandsCount * sizeof(GLDrawCommand), commands);

      // TOCHECK: No attrib divisor support in ES 2 -- will it be needed?
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(glCaps_vao) GLABBindVertexArray(vao);

#ifndef CLIENT_MEM_COMMANDS
      commandsB.upload(0, commandsCount * sizeof(GLDrawCommand), commands);
#endif

      // Draw IDs
      if(glCaps_shaders && (!glCaps_vao || lastIDAB != idsAB.buffer))
      {
         GLABBindBuffer(GL_ARRAY_BUFFER, idsAB.buffer);
         glVertexAttribIPointer(drawIDAttribute, 1, GL_UNSIGNED_INT, sizeof(uint), 0);
         glVertexAttribDivisor(drawIDAttribute, 1);
         glEnableVertexAttribArray(drawIDAttribute);
         lastIDAB = idsAB.buffer;
      }
#endif
      if(glCaps_shaders && (!glCaps_vao || lastVBO != vertexGLMB.ab.buffer))
      {
         if(vertNCoords)
         {
            GLAB ab { vertexGLMB.ab.buffer };
            glEnableVertexAttribArray(GLBufferContents::vertex);
            ab.use(vertex, vertNCoords, GL_FLOAT, verticesStride, none, null);

            this.vertexStride = verticesStride;
         }
         lastVBO = vertexGLMB.ab.buffer;
      }
      if(glCaps_vertexBuffer && (!glCaps_vao || lastIBO != indexGLMB.ab.buffer))
      {
         GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexGLMB.ab.buffer);
         lastIBO = indexGLMB.ab.buffer;
      }
   }

   void draw()
   {
      if(!commandsCount) return;

      // TOCHECK: Should this re-do all the use() here if there is no VAO support?

#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(glCaps_vao) GLABBindVertexArray(vao);
#endif
      GLFlushMatrices();

#if defined(__UWP__) || defined(__EMSCRIPTEN__) || ((defined(_GLES) || defined(_GLES2)) && !defined(_GLES3))  // TODO: This should be a check for no OpenGLES3.2 support
      // ******* Basic Draw Elements *******
      {
         // NOTE: This fallback requires the shader to implement setupDrawCommand() callback allowing to handle custom attributes.
         //       Shader multiDraw should already be disabled.
         int n;
         uint ixSize = type == GL_UNSIGNED_INT ? 4 : 2;
         uint vertexStride = this.vertexStride;
         GLAB ab { vertexGLMB.ab.buffer };
         Shader shader = activeShader;

         if(!glCaps_vao)   // Don't modify VAO state.
         {
            GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexGLMB.ab.buffer);

            glDisableVertexAttribArray((GLBufferContents)drawIDAttribute);
            glDisableVertexAttribArray((GLBufferContents)posOffsetAttribute);
         }
         else if(vao == defaultVAO)
            PrintLn("WARNING: MultiDraw with default VAO");
         else if(!glabCurVertexArray)
            PrintLn("WARNING (MultiDraw): No VAO selected");

         for(n = 0; n < commandsCount; n++)
         {
            const GLDrawCommand *cmd = &commands[n];
            // TODO: Should we hold on to transforms in MultiDraw instead of DrawManager?
            shader.setupDrawCommand(ab, vertexStride, cmd->baseVertex, drawIDs[cmd->baseInstance],
               transforms ? transforms + n * transformSize : null);
            shader.activate();
            glDrawElements(drawMode, cmd->count, type, (void *)(uintptr)(cmd->firstIndex * ixSize));
         }
      }
#else
      // ******* Instanced Draws with Base Vertex *******
      // This path is the fallback for when MDEI is not available, but there is support for
      // instanced draw elements with base vertex (OpenGL (ES) 3.2+)
      if(!glCaps_mdei)
      {
         int n;
         uint ixSize = type == GL_UNSIGNED_INT ? 4 : 2;
#if defined(__ANDROID__) || defined(__UWP__)
         uint transformSize = this.transformSize;
#endif
         if(glCaps_shaders)
         for(n = 0; n < commandsCount; n++)
         {
            const GLDrawCommand *cmd = &commands[n];
#if !defined(_GLES3)
            if(glVersion < 4)
#endif
            {
               // NOTE: glVertexAttribPointer might cause VAOs to be re-validated... Uniforms faster?
               uint baseInstance = cmd->baseInstance;
               GLABBindBuffer(GL_ARRAY_BUFFER, transformsAB.buffer);
               glVertexAttribPointer(posOffsetAttribute, transformSize, GL_FLOAT, GL_FALSE, 0, (void *)(uintptr)(baseInstance * 3 * sizeof(float)));
               GLABBindBuffer(GL_ARRAY_BUFFER, idsAB.buffer);
               glVertexAttribIPointer(drawIDAttribute, 1, GL_UNSIGNED_INT, 0, (void *)(uintptr)(baseInstance * sizeof(uint)));
               GLABBindBuffer(GL_ARRAY_BUFFER, 0);

               // OpenGL ES 3.2 has this
               glDrawElementsInstancedBaseVertex(
                  drawMode, cmd->count, type,
                  (void *)(uintptr)(cmd->firstIndex * ixSize),
                  cmd->instanceCount, cmd->baseVertex);
            }
#if !defined(_GLES3)
            else
            {
               // This is available on OpenGL 4.2+
               glDrawElementsInstancedBaseVertexBaseInstance(
                  drawMode, cmd->count, type,
                  (void *)(uintptr)(cmd->firstIndex * ixSize),
                  cmd->instanceCount, cmd->baseVertex, cmd->baseInstance);
            }
#endif
         }
   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif
      }
#if !defined(_GLES3)
      else
      {
         // ******* Indirect Multi Draw *******
         GLABBindBuffer(GL_DRAW_INDIRECT_BUFFER, glCaps_gpuCommands ? commandsB.buffer : 0);

   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif
         // This is available on OpenGL 4.3+
         glMultiDrawElementsIndirect(
            drawMode,
            type,
            glCaps_gpuCommands ? 0 : commands,
            commandsCount, 0);

   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif

         GLABBindBuffer(GL_DRAW_INDIRECT_BUFFER, 0);
      }
#endif
#endif
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      if(glCaps_vao) GLABBindVertexArray(0);
#endif
   }
};

public void GLMultisampling(bool value)
{
#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__) && !defined(__EMSCRIPTEN__)
   (value ? glEnable : glDisable)(GL_MULTISAMPLE);
#endif
}

#endif
