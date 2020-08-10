#if defined(__WIN32__) || defined(__unix__) || defined(__APPLE__)

import "OpenGLDisplayDriver"

#include "gl123es.h"

#if defined(_GLES3)
#include <GLES3/gl32.h>

#define GL_R16 GL_LUMINANCE
#endif

public define drawIDAttribute = 7;
public define posOffsetAttribute = 8;

public define transform0Attribute = 9;
public define transform1Attribute = 10;
public define transform2Attribute = 11;
public define transform3Attribute = 12;

private:

// #define CLIENT_MEM_COMMANDS  // Defined as a work-around for Intel driver that does not seem to support indirect commands buffers?

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
#if defined(_GLES3)
int glVersion = 3;
#elif defined(_GLES2)
int glVersion = 2;
#elif defined(_GLES)
int glVersion = 1;
#else
int glVersion = 0;
#endif
private:

#if (defined(__ANDROID__) && !defined(__LUMIN__)) || defined(__UWP__)
uint tempTexFBO;  // TODO: Free this on termination... glDeleteFramebuffers(1, &tempTexFBO);
#endif

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
#ifdef _DEBUG
      GLStats::freeTextures(1, &texture);
#endif
      if(texture)
         glDeleteTextures(1, &texture);
      delete spots.spots;
      texture = 0;
   }

   void init(int levels, int w, int h, int count)
   {
#if !defined(_GLES) && !defined(_GLES2) && !defined(_GLES3)
      int internalFormat = GL_RGBA8;
#else
      int internalFormat = GL_RGBA;
#endif
      _init(levels, w, h, count, internalFormat, false);
   }

   void initMaxLevel(int levels, int w, int h, int count)
   {
#if !defined(_GLES) && !defined(_GLES2) && !defined(_GLES3)
      int internalFormat = GL_RGBA8;
#else
      int internalFormat = GL_RGBA;
#endif
      _init(levels, w, h, count, internalFormat, true);
   }

   void initUShort(int levels, int w, int h, int count)
   {
      _init(levels, w, h, count, GL_R16, false);
   }

   void _init(int levels, int w, int h, int count, int format, bool setMaxLevel)
   {
      int target = GL_TEXTURE_2D_ARRAY;
      /*if(texture)
      {
         // TOCHECK: Why is calling glTexStorage3D a second time causing GL_INVALID_VALUE errors?
         glDeleteTextures(1, &texture);
         texture = 0;
      }*/

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
      numLayers = count;

      glBindTexture(target, texture);

      if(setMaxLevel)
         glTexParameteri(target, GL_TEXTURE_MAX_LEVEL, levels-1);

#ifdef _DEBUG
      CheckGLErrors(__FILE__,__LINE__);
#endif
      glTexStorage3D(target, levels, format, w, h, count);

#ifdef _DEBUG
      GLStats::allocTexture(texture, w, h * count, levels > 1);
#endif

#ifdef _DEBUG
      CheckGLErrors(__FILE__,__LINE__);
#endif
   #ifdef GL_TEXTURE_MAX_ANISOTROPY_EXT
      if(glVersion >= 2)
         glTexParameterf(target, GL_TEXTURE_MAX_ANISOTROPY_EXT, 16.0 );
   #endif

      glTexParameteri(target, GL_TEXTURE_MIN_FILTER, levels > 1 ? GL_LINEAR_MIPMAP_LINEAR : GL_LINEAR);
      glTexParameteri(target, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

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
   }

   void resize(uint numLayers, uint targetFBO)
   {
      GLArrayTexture tmp { };
      tmp._init(numLevels, width, height, numLayers, format, maxLevel);
      tmp.copy(this, targetFBO);
      glBindTexture(GL_TEXTURE_2D_ARRAY, 0); // TOCHECK:
#ifdef _DEBUG
      GLStats::freeTextures(1, &texture);
#endif
      glDeleteTextures(1, &texture);

      texture = tmp.texture;
      this.numLayers = numLayers;
      if(spots.spots)
         spots.resize(numLayers);
   }

   void copy(GLArrayTexture src, uint targetFBO)
   {
      int target = GL_TEXTURE_2D_ARRAY;
      // 4.3+
#if (!defined(__ANDROID__) || defined(__LUMIN__)) && !defined(__UWP__)
      int level = 0;
      int w = width, h = height;
      glBindTexture(target, src.texture);
      for(level = 0; level < numLevels; level++)
      {
         glCopyImageSubData(src.texture,
            target, level, 0, 0, 0,
            texture, target, level, 0, 0, 0,
            w, h, src.numLayers);
         w >>= 1;
         h >>= 1;
      }
      glBindTexture(target, 0);
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
         glFramebufferTextureLayer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, src.texture, 0, i);
         glCopyTexSubImage3D(target, 0, 0, 0, i, 0, 0, width, height);
      }
      glBindTexture(target, 0);
      glBindFramebuffer(GL_FRAMEBUFFER, targetFBO);
#endif
   }

   void setLayer(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RGBA, GL_UNSIGNED_BYTE);
   }

   void setLayerUShort(int level, int x, int y, int layer, byte * c, uint targetFBO)
   {
      setLayerFormat(level, x, y, layer, c, targetFBO, GL_RED, GL_UNSIGNED_SHORT);
   }

   void setLayerFormat(int level, int x, int y, int layer, byte * c, uint targetFBO, int format, int type)
   {
      int target = GL_TEXTURE_2D_ARRAY;

      if(layer >= numLayers)
         resize(layer + Max(2, layer)/2, targetFBO);

      glBindTexture(target, texture);
      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      glTexSubImage3D(target, level, x, y, layer, width >> level, height >> level, 1, format, type, c);
      glBindTexture(target, 0);
   }

   void setLayerCompressed(int level, int x, int y, int layer, byte * c, uintsize sizeBytes, uint targetFBO)
   {
      int target = GL_TEXTURE_2D_ARRAY;

      if(layer >= numLayers)
         resize(layer + Max(2, layer)/2, targetFBO);

      glBindTexture(target, texture);
      glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
      glCompressedTexSubImage3D(target, level, x, y, layer, width >> level, height >> level, 1,
         format, sizeBytes, c);
      glBindTexture(target, 0);
   }

   void set1x1Layer(int layer, ColorAlpha color, uint targetFBO)
   {
      byte c[4] = { color.color.r, color.color.g, color.color.b, color.a };
      setLayer(0, 0, 0, layer, c, targetFBO);
   }

   void bind()
   {
      glBindTexture(GL_TEXTURE_2D_ARRAY, texture);
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
   GLAB transformsAB;
   int transformSize;

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
      if(minAlloc && !vao && glCaps_vao)
         glGenVertexArrays(1, &vao);
      if(minAlloc > commandsCount)
         resize(minAlloc);
   }

   void resize(uint size)
   {
      drawIDs = renew0 drawIDs uint[size];
      commands = renew0 commands GLDrawCommand[size];
      commandsAlloced = size;
      idsAlloced = size;
      idsAB.allocate(size * sizeof(uint), null, streamDraw);
#ifndef CLIENT_MEM_COMMANDS
      commandsB.allocate(size * sizeof(GLDrawCommand), null, streamDraw);
#endif
   }

   void resizeCommands(uint size)
   {
      commands = renew0 commands GLDrawCommand[size];
      commandsAlloced = size;
#ifndef CLIENT_MEM_COMMANDS
      commandsB.allocate(size * sizeof(GLDrawCommand), null, streamDraw);
#endif
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
      if(vao && glCaps_vao)
      {
         glDeleteVertexArrays(1, &vao);
         vao = 0;
      }
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
      BlockEntry block = vertexGLMB.allocate(attributes, size);
      int baseVertex = block ? block.start / vertexSize : -1;
      if(data && baseVertex != -1)
         vertexGLMB.ab.upload(block.start, size, data);
      return baseVertex;
   }

   void freeVbo(int baseVertex, uint vertexSize, uint count)
   {
      if(baseVertex != -1)
         vertexGLMB.freeBlock(BlockEntry { baseVertex * vertexSize, (baseVertex+count) * vertexSize-1 });
   }

   int allocateIx(uint nIndices, uint indexSize, const void *data)
   {
      uint size = nIndices * indexSize;
      BlockEntry block = indexGLMB.allocate(elements, size);
      int baseIndex = block ? block.start / indexSize : -1;
      if(data && baseIndex != -1)
         indexGLMB.ab.upload(block.start, size, data);
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
      idsAB.upload(0, totalInstances * sizeof(uint), drawIDs);
#ifndef CLIENT_MEM_COMMANDS
      commandsB.upload(0, commandsCount * sizeof(GLDrawCommand), commands);
#endif

      if(glCaps_vao) glBindVertexArray(vao);

      // Draw IDs
      if(!glCaps_vao || lastIDAB != idsAB.buffer)
      {
         GLABBindBuffer(GL_ARRAY_BUFFER, idsAB.buffer);
         glVertexAttribIPointer(drawIDAttribute, 1, GL_UNSIGNED_INT, sizeof(uint), 0);
         glVertexAttribDivisor(drawIDAttribute, 1);
         glEnableVertexAttribArray(drawIDAttribute);
         lastIDAB = idsAB.buffer;
      }
      if(!glCaps_vao || lastVBO != vertexGLMB.ab.buffer)
      {
         if(vertNCoords)
         {
            GLAB ab { vertexGLMB.ab.buffer };
            glEnableVertexAttribArray(GLBufferContents::vertex);
            ab.use(vertex, vertNCoords, GL_FLOAT, verticesStride, null);
         }
         lastVBO = vertexGLMB.ab.buffer;
      }
      if(!glCaps_vao || lastIBO != indexGLMB.ab.buffer)
      {
         GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, indexGLMB.ab.buffer);
         lastIBO = indexGLMB.ab.buffer;
      }
   }

   void draw()
   {
      if(!commandsCount) return;

      if(glCaps_vao) glBindVertexArray(vao);
      GLFlushMatrices();

      // Then render:
#if defined(__UWP__)     // ******* Basic Draw Elements *******
      {
         int n;
         uint ixSize = type == GL_UNSIGNED_INT ? 4 : 2;
         for(n = 0; n < commandsCount; n++)
         {
            const GLDrawCommand *cmd = &commands[n];

            //cmd->baseVertex
            //cmd->baseInstance

            glDrawElements(drawMode, cmd->count, type, (void *)(uintptr)(cmd->firstIndex * ixSize));
         }
      }
#elif (defined(__ANDROID__) && !defined(__LUMIN__)) || defined(__UWP__)     // ******* Instanced Draws with Base Vertex *******
      //This path that isn't taken here is the fallback for when MDEI is not available.  TODO: proper condition
      {
         int n;
         uint ixSize = type == GL_UNSIGNED_INT ? 4 : 2;
         uint transformSize = this.transformSize;
         for(n = 0; n < commandsCount; n++)
         {
            const GLDrawCommand *cmd = &commands[n];
#if defined(__ANDROID__) || defined(__UWP__)
            // NOTE: glVertexAttribPointer might cause VAOs to be re-validated... Uniforms faster?
            uint baseInstance = cmd->baseInstance;
            GLABBindBuffer(GL_ARRAY_BUFFER, transformsAB.buffer);
            glVertexAttribPointer(posOffsetAttribute, transformSize, GL_FLOAT, GL_FALSE, 0, (void *)(uintptr)(baseInstance * 3 * sizeof(float)));
            GLABBindBuffer(GL_ARRAY_BUFFER, idsAB.buffer);
            glVertexAttribIPointer(drawIDAttribute, 1, GL_UNSIGNED_INT, 0, (void *)(uintptr)(baseInstance * sizeof(uint)));
            GLABBindBuffer(GL_ARRAY_BUFFER, 0);

            glDrawElementsInstancedBaseVertex(
               drawMode, cmd->count, type,
               (void *)(uintptr)(cmd->firstIndex * ixSize),
               cmd->instanceCount, cmd->baseVertex);
#else
            glDrawElementsInstancedBaseVertexBaseInstance(
               drawMode, cmd->count, type,
               (void *)(uintptr)(cmd->firstIndex * ixSize),
               cmd->instanceCount, cmd->baseVertex, cmd->baseInstance);
#endif
         }
   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif
      }
#else // ******* Indirect Multi Draw *******
      {
#ifdef CLIENT_MEM_COMMANDS
         GLABBindBuffer(GL_DRAW_INDIRECT_BUFFER, 0);
#else
         GLABBindBuffer(GL_DRAW_INDIRECT_BUFFER, commandsB.buffer);
#endif

   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif

         glMultiDrawElementsIndirect(
            drawMode,
            type,
#ifdef CLIENT_MEM_COMMANDS
            commands,
#else
            0,
#endif
            commandsCount, 0);

   #ifdef _DEBUG
         CheckGLErrors(__FILE__,__LINE__);
   #endif

         GLABBindBuffer(GL_DRAW_INDIRECT_BUFFER, 0);
      }
#endif
      if(glCaps_vao) glBindVertexArray(0);
   }
};

public void GLMultisampling(bool value)
{
#if !defined(_GLES) && !defined(_GLES2) && !defined(__UWP__)
   (value ? glEnable : glDisable)(GL_MULTISAMPLE);
#endif
}

#endif
