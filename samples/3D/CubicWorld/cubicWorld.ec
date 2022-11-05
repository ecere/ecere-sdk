import "ecere"

import "mandelbulb"
import "cubeTris"

import "ButterburShader"
import "threadedProcessing"

#include "gl123es.h"

// #define SINGLE_MANDELBULB

uint visibleChunks;
uint renderedInstances;

GLMultiDraw mdWorld { };
GLArrayTexture atTextures { };

define CUBES_X = 64;
define CUBES_Y = 64;
define CUBES_Z = 64;
define CUBES_COUNT = CUBES_X * CUBES_Y * CUBES_Z;

define fogDensity = 0.00009f;

Color fogColor = skyBlue;

define viewDistance = 5;

define numTextures = 9;

define maxLoadedChunks = Min(256, (uint)((1LL<<31) / (12 * CUBES_COUNT)));
CubeChunk loadedChunks[maxLoadedChunks];
FreeSpots freeChunks { };

CubicWorld cubicWorld { };

bool freeze;

class LoadTask : ProcessingTask
{
   CubeChunk * chunk;

   void OnFree()
   {

   }
}

class LoadingThread : ThreadedProcessing
{
   ProcessingAction onPerformTask(ProcessingTask t)
   {
      LoadTask task = (LoadTask)t;
      task.chunk->load();
      return clear;
   }

   void onTaskCleared(ProcessingTask t)
   {
      LoadTask task = (LoadTask)t;
      task.OnFree();
   }
}

LoadingThread loadingThread { };

Mutex randomMutex { };

struct CubeChunk
{
   int64 ox, oy, oz;
   int index;  // index into loading buffers
   bool loaded;
   bool uploaded;
   float * transforms;
   uint * materials;
   uint count;
   bool visible;

   void free()
   {
      delete transforms;
      delete materials;
   }

   bool load()
   {
      Mandelbulb mandelbulb { power = 8, size = { 100, 100, 100 } };
      int x, y, z;
      float * tr;
      uint * mat;
      int i, j;
      int e = 0;
      float ox = this.ox * CUBES_X;
      float oy = this.oy * CUBES_Y;
      float oz = this.oz * CUBES_Z;
      float scale = 1.0f / 12;

#ifndef SINGLE_MANDELBULB
      // Castles in the Sky
      uint seed = (uint)(oz * 1024 * 1024 + oy * 1024 + ox);
      int sx, sy, sz;
      int dx, dy, dz;

      randomMutex.Wait();
      RandomSeed(seed);
      mandelbulb.power = GetRandom(0, 9);
      mandelbulb.size.x = sx = GetRandom(100, 120) * CUBES_X / 100;
      mandelbulb.size.y = sy = GetRandom(100, 120) * CUBES_Y / 100;
      mandelbulb.size.z = sz = GetRandom(100, 120) * CUBES_Z / 100;
      dx = GetRandom(-sx/4, sx/4);
      dy = GetRandom(-sy/4, sy/4);
      dz = GetRandom(-sz/4, sz/4);
      e = GetRandom(0, 8);
      randomMutex.Release();
#endif

      tr = transforms = new float[CUBES_COUNT * 3];
      mat = materials = new uint[CUBES_COUNT];
      j = 0;

      for(z = 0; z < CUBES_Z; z++)
         for(y = 0; y < CUBES_Y; y++)
            for(x = 0; x < CUBES_X; x++)
            {
#ifdef SINGLE_MANDELBULB
               Vector3Df p
               {
                  (0.5f - CUBES_X/2 - (x + ox) * scale) + 30,
                  (0.5f - CUBES_Y/2 - (y + oy) * scale) + 60,
                  (0.5f - CUBES_Z/2 - (z + oz) * scale) + 60
               };
               uint t = mandelbulb.isPointInside({ p.x, p.z, p.y }, 5);
#else
               Vector3Df p
               {
                  0.5f - CUBES_X/2 + x + dx,
                  0.5f - CUBES_Y/2 + y + dy,
                  0.5f - CUBES_Z/2 + z + dz
               };
               uint t = mandelbulb.isPointInside(p, 6);
#endif
               if(t)
               {
                  Vector3Df cp { 0.5f - CUBES_X/2 + x, 0.5f - CUBES_Y/2 + y, 0.5f - CUBES_Z/2 + z };

                  // Transform is relative to center of chunk
                  tr[3 * j + 0] = (float)cp.x;
                  tr[3 * j + 1] = (float)cp.y;
                  tr[3 * j + 2] = (float)cp.z;
                  mat[j] = (t - 1 + e) % 9;

                  j++;
               }
            }

      count = j;
      transforms = renew transforms float[count * 3];
      materials = renew materials uint[count];
      loaded = true;
      return true;
   }

   void unload()
   {
      if(loaded)
      {
         loaded = false;
         uploaded = false;
         freeChunks.markFree(index);
         index = -1;
         free();
      }
   }

   CubeChunk * ::ensure(int64 ox, int64 oy, int64 oz, bool visible)
   {
      CubeChunk * result = null;
      int ix = -1;
      int i;

      for(i = 0; i < maxLoadedChunks; i++)
      {
         CubeChunk * chunk = &loadedChunks[i];
         if(chunk->index != -1 && chunk->ox == ox && chunk->oy == oy && chunk->oz == oz)
         {
            result = chunk;
            break;
         }
      }

      if(!result && (ix = freeChunks.next()) != -1)
      {
         CubeChunk * chunk = &loadedChunks[ix];
         chunk->index = ix;
         chunk->ox = ox;
         chunk->oy = oy;
         chunk->oz = oz;
         chunk->loaded = false;
         chunk->uploaded = false;
         loadingThread.addTask(LoadTask { chunk = chunk }, 1, visible ? 0 : MAXINT);
         result = chunk;
      }
      if(result)
         result->visible = visible;
      return result;
   }

   void uploadInstances()
   {
      const uint maxLoadedCubes = maxLoadedChunks * CUBES_COUNT;
      int i, j;
      uint chunkOffset = index * CUBES_COUNT;

      // mdWorld.transforms = transforms.array; // TOCHECK: Do we need this for non-MDEI fallbacks?
      if(!mdWorld.transformsAB.buffer)
         mdWorld.transformsAB.allocate(maxLoadedCubes * 3 * sizeof(float), null, staticDraw);
      mdWorld.transformsAB.upload(chunkOffset * 3 * sizeof(float), count * sizeof(float) * 3, transforms);

      if(!mdWorld.idsAlloced)
         mdWorld.resizeIDs(maxLoadedCubes);
      j = chunkOffset;
      for(i = 0; i < count; i++)
         mdWorld.drawIDs[j++] = materials[i]; // TOCHECK: Do we need this for non-MDEI fallbacks?
      mdWorld.idsAB.upload(chunkOffset * sizeof(uint), count * sizeof(uint), materials);

      if(!mdWorld.commandsAlloced)
         // We can only draw one block at a time since we need to change the view matrix in between
         mdWorld.resizeCommands(1); // maxLoadedChunks);

      delete transforms;
      delete materials;

      uploaded = true;
   }

   void setupVAOInstances()
   {
      // Per-instance transforms and IDs (array texture layers)
      uint chunkOffset = index * CUBES_COUNT;

      if(!uploaded)
         uploadInstances();

      // TOCHECK: No attrib divisor support in ES 2 -- will it be needed?
#if (!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3)
      // Initial transform buffer setup
      if(glCaps_shaders && (!glCaps_vao || mdWorld.lastTransformAB != mdWorld.transformsAB.buffer))
      {
         mdWorld.transformsAB.use(posOffsetAttribute, 3 /*mdWorld.transformSize*/, GL_FLOAT, 0, none, null);
         glEnableVertexAttribArray(posOffsetAttribute);
         glVertexAttribDivisor(posOffsetAttribute, 1);
         mdWorld.lastTransformAB = mdWorld.transformsAB.buffer;
      }

      // Initial textureID buffer setup
      if(glCaps_shaders && (!glCaps_vao || mdWorld.lastIDAB != mdWorld.idsAB.buffer))
      {
         mdWorld.idsAB.use(drawIDAttribute, 1, GL_UNSIGNED_INT, 0, integer, null);
         glVertexAttribDivisor(drawIDAttribute, 1);
         glEnableVertexAttribArray(drawIDAttribute);
         mdWorld.lastIDAB = mdWorld.idsAB.buffer;
      }
#endif
   }

   void addDrawCommand()
   {
      uint chunkOffset = index * CUBES_COUNT;
      mdWorld.commands[mdWorld.commandsCount] =
      {
         count = 36,                // 36 indices
         instanceCount = count,     // 'count' cubes
         firstIndex = 0,
         baseVertex = 0,
         baseInstance = chunkOffset // start of chunk in transforms & IDs buffers
      };
      mdWorld.commandsCount++;

      renderedInstances += count;

#if !defined(CLIENT_MEM_COMMANDS) && ((!defined(_GLES) && !defined(_GLES2)) || defined(_GLES3))
      mdWorld.commandsB.upload(0, mdWorld.commandsCount * sizeof(GLDrawCommand), mdWorld.commands);
#endif
   }

   void draw(Vector3D cPos)
   {
      Vector3D chunkPos { ox * CUBES_X, oy * CUBES_Y, oz * CUBES_Z };
      setupVAOInstances();
      addDrawCommand();
      GLPushMatrix();
      GLTranslated(chunkPos.x - cPos.x, chunkPos.y - cPos.y, chunkPos.z - cPos.z);
      mdWorld.draw();
      GLPopMatrix();
   }
};

struct FPS
{
   uint frameCount0, frameCount;
   double frameTime0;
   float fps;

   void Start()
   {
      frameCount0 = frameCount = 0;
      fps = 0;
      frameTime0 = GetTime();
   }

   void Step()
   {
      double frameTime;
      double elapsedTime;

      frameCount++;
      frameTime = GetTime();
      elapsedTime = frameTime-frameTime0;
      if (elapsedTime > 1)
      {
         fps = (float)((double)(frameCount - frameCount0) / elapsedTime);
         frameTime0 = frameTime;
         frameCount0 = frameCount;
      }
   }
};

FPS frameRate;

class CubicWorldApp : GuiApplication
{
   driver = "OpenGL";
   //timerResolution = 120;

   CubicWorldApp()
   {
      // FIXME: Without this setupGL() ends up in a separate GL context and defaultVAO is same as our MD VAO
      UseSingleGLContext(true);
   }

   bool Cycle(bool idle)
   {
      cubicWorld.Update(null);
      return true;
   }
}

class CubicWorld : Window
{
   text = "Cubic World: A MultiDraw, ArrayTexture and Instancing Demo";
   background = fogColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   state = maximized;
   // glCapabilities.compatible = true;

   Camera camera
   {
      // attachedQuaternion,
      fixed,
      // fixedQuaternion,
      position = Vector3D { 0, 0, 0 },
      orientation = Euler { 0, 0, 0 },
      zMin = 0.01f;
      fov = 53;
   };
   CubeTris /*Cube*/ model { size = { 1, 1, 1 } };

   bool moving, lightMoving;

   Point startPosition;

   Euler startOrientation;
   Light light
   {
      diffuse = white;
      specular = white;
      orientation = Euler { pitch = 10, yaw = 30 };
   };

   CubicWorld()
   {
      int i;
      for(i = 0; i < maxLoadedChunks; i++)
         loadedChunks[i].index = -1;
      freeChunks.init(maxLoadedChunks);
      return true;
   }

   ~CubicWorld()
   {
      int i;
      for(i = 0; i < maxLoadedChunks; i++)
      {
         CubeChunk * chunk = &loadedChunks[i];
         if(chunk->loaded)
            chunk->unload();
      }
   }

   void OnUnloadGraphics()
   {
      loadingThread.terminate();

      model.Free(displaySystem);
      displaySystem.ClearMaterials();
      displaySystem.ClearTextures();
      displaySystem.ClearMeshes();
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
      Update(null);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = camera.orientation;
         Capture();
         moving = true;
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(!moving && !lightMoving)
      {
         startPosition.x = x;
         startPosition.y = y;
         startOrientation = light.orientation;
         Capture();
         lightMoving = true;
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(lightMoving)
      {
         ReleaseCapture();
         lightMoving = false;
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         Euler euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            startOrientation.roll
         };

         camera.orientation = euler;

         Update(null);
      }
      else if(lightMoving)
      {
         light.orientation = Euler
         {
            startOrientation.yaw   - (x - startPosition.x),
            startOrientation.pitch + (y - startPosition.y),
            startOrientation.roll
         };

         Update(null);
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case f: freeze ^= true; return false;
         case escape: Destroy(0); return false;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      switch((SmartKey) key)
      {
         case right: camera.Move({ 1.0, 0, 0 });  Update(null); break;
         case left:  camera.Move({ -1.0, 0, 0 }); Update(null); break;
         case down: case wheelDown: case minus: camera.Move({ 0, 0, -3.0 });  Update(null); break;
         case up: case wheelUp:   case plus:  camera.Move({ 0, 0, 3.0 }); Update(null); break;
         case pageDown:   camera.Move({ 0, 1.0, 0 });  Update(null); break;
         case pageUp:  camera.Move({ 0, -1.0, 0 }); Update(null); break;
      }
      return true;
   }

   void setupVAOVertices()
   {
      // Per-vertex attributes (VBO)
      const int verticesStride = 32;   // x,y,z + normal + u,v texture coordinates: 8 x 32-bit (4 bytes) floats

      if(glCaps_shaders && (!glCaps_vao || mdWorld.lastVBO != mdWorld.vertexGLMB.ab.buffer))
      {
         GLAB ab { mdWorld.vertexGLMB.ab.buffer };
         glEnableVertexAttribArray(GLBufferContents::vertex);
         ab.use(vertex, 3, GL_FLOAT, verticesStride, none, null);
         glEnableVertexAttribArray(GLBufferContents::normal);
         ab.use(normal, 3, GL_FLOAT, verticesStride, none, (void *)(uintptr)12);
         glEnableVertexAttribArray(GLBufferContents::texCoord);
         ab.use(texCoord, 2, GL_FLOAT, verticesStride, none, (void *)(uintptr)24);

         mdWorld.vertexStride = verticesStride;
         mdWorld.lastVBO = mdWorld.vertexGLMB.ab.buffer;
      }

      // Triangle primitives indices into VBO
      if(glCaps_vertexBuffer && (!glCaps_vao || mdWorld.lastIBO != mdWorld.indexGLMB.ab.buffer))
      {
         GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, mdWorld.indexGLMB.ab.buffer);
         mdWorld.lastIBO = mdWorld.indexGLMB.ab.buffer;
      }
   }

   bool OnLoadGraphics()
   {
      setupGL(display);

      PrintLn("We've got OpenGL Version: ", (char*)glGetString(GL_VERSION), "\n");
      PrintLn("We've got OpenGL Renderer: ", (char*)glGetString(GL_RENDERER), "\n");

      if(model.Create(null))
      {
         int t;

         #if 0
         ColorAlpha * palette = GetDefaultPalette();
         ColorAlpha color = palette[t];
         atTextures.init(1, 1, 1, numTextures);
         atTextures.set1x1Layer(t, color, 0);
         #else
         const String tFiles[] = { "glass.bmp", "tex1.bmp", "tex2.bmp", "tex3.bmp", "tex4.bmp", "tex5.bmp", "tex6.bmp", "tex7.bmp", "tex8.bmp" };
         atTextures.init(9, 256, 256, numTextures);
         for(t = 0; t < numTextures; t++)
         {
            char path[MAX_LOCATION];
            Bitmap bmp { };

            sprintf(path, "../TransCube/%s", tFiles[t]);
            bmp.Load(path, null, null);
            model.mesh.UploadTexture(bmp, displaySystem, atTextures);
            bmp.driverData = null;
            bmp.Free();
            delete bmp;
         }
         #endif

         mdWorld.commandsCount = 1; // Avoids call to resize()
         mdWorld.init(triangles, 1);
         mdWorld.transformSize = 3;
         model.Upload(displaySystem, mdWorld.vertexGLMB, mdWorld.indexGLMB, 1, &atTextures);

         camera.target = model;

         frameRate.Start();

         loadingThread.setup(1, 6); // 6 chunk loading threads
         return true;
      }
      return false;
   }

   void updatePosition(Vector3D cPos)
   {
      int64 cx = (int64)(cPos.x / CUBES_X + 0.5);
      int64 cy = (int64)(cPos.y / CUBES_Y + 0.5);
      int64 cz = (int64)(cPos.z / CUBES_Z + 0.5);
      int64 v = viewDistance, v2 = v*v;
      int64 hv = viewDistance/2, hv2 = hv*hv;
      int64 d;
      int64 ox, oy, oz;
      int i;
      Vector3D c;

      for(i = 0; i < maxLoadedChunks; i++)
      {
         CubeChunk * chunk = &loadedChunks[i];
         chunk->visible = false;
         if(chunk->loaded)
         {
            ox = chunk->ox - cx, oy = chunk->oy - cy, oz = chunk->oz - cz;
            d = ox * ox + oy * oy + oz * oz;
            if(d > v2)
               chunk->unload();
         }
      }

      c.x = (cx - v) * CUBES_X;
      for(ox = -v; ox <= v; ox++, c.x += CUBES_X)
      {
         Vector3D c { (cx + ox) * CUBES_X, (cy + oy) * CUBES_Y, (cz + oz) * CUBES_Z };
         c.y = (cy - v) * CUBES_Z;
         for(oy = -v; oy <= v; oy++, c.y += CUBES_Y)
         {
            c.z = (cz - v) * CUBES_Z;
            for(oz = -v; oz <= v; oz++, c.z += CUBES_Z)
            {
               int64 d = ox * ox + oy * oy + oz * oz;
               if(d <= v2)
               {
                  bool visible = camera.PointsVisible(c, 1, CUBES_X * 0.70711);
                  if(visible || d < hv2)
                     CubeChunk::ensure(cx + ox, cy + oy, cz + oz, visible);
               }
            }
         }
      }
   }

   void OnRedraw(Surface surface)
   {
      Vector3D cPos;
      int i;

      PrintLn("========\nRendering:");

      setupGL(display);

      surface.Clear(depthBuffer);

      camera.Update();
      cPos = camera.cPosition;

      display.antiAlias = true;
      GLMultisampling(true);

      display.SetCamera(surface, camera);
      if(!freeze)
         updatePosition(cPos);

      butterburShader.select();
      butterburShader.setLight(cPos, 0, light);
      butterburShader.setFogColor(fogColor.r / 255.0f, fogColor.g / 255.0f, fogColor.b / 255.0f); //0.2, 0.2, 0.8);
      butterburShader.setFogDensity(fogDensity);
      butterburShader.fog(true);
      butterburShader.multiDraw(true);
      butterburShader.setSimpleMaterial(white, false);
      butterburShader.lighting(true);
      butterburShader.texturing(true);
      butterburShader.textureArray(true);
      butterburShader.transform3D = false;   // This should be renamed 'fullTransform3D' -- false because we only have x,y,z offset
      butterburShader.setGlobalAmbient(0.2f, 0.2f, 0.2f, 1.0f);
      atTextures.bind();

      glEnable(GL_CULL_FACE);

      GLABBindVertexArray(mdWorld.vao);

      setupVAOVertices();

      visibleChunks = 0;
      renderedInstances = 0;
      for(i = 0; i < maxLoadedChunks; i++)
      {
         CubeChunk * chunk = &loadedChunks[i];
         if(chunk->visible && chunk->loaded)
         {
            mdWorld.commandsCount = 0;
            chunk->draw(cPos);
            visibleChunks++;
         }
      }
      PrintLn("   ", visibleChunks, " chunks; ", renderedInstances, " cube instances");

      GLABBindVertexArray(defaultVAO);
      GLABBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

      DefaultShader::shader().select();

      display.SetCamera(surface, null);

      surface.foreground = white;
      surface.WriteTextf(10,10, "FPS: %.02f", frameRate.fps);

      frameRate.Step();
   }
}
