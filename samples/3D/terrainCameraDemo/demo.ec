/****************************************************************************
   Ecere 3D Engine Demonstration

   Copyright (c) 2001-2010 Jerome Jacovella-St-Louis
   All Rights Reserved.

   demo.ec - Main Module
****************************************************************************/
import "ecere"
import "dna"
import "terrain"

define BACKGROUND = white;
define speed = 200;

// --- Terrain Data Loading ---
static Elevation heightMap[1025 * 1025];

#define ALTITUDE_FACTOR 1
#define ALTITUDE_OFFSET 0 // -5000

#define EARTH_RADIUS 6367000

#define CELL_LAT_POINTS  1201
#define CELL_LON_POINTS  1201

#define RESOLUTION_LAT  (EARTH_RADIUS * ((Pi / 180) / (CELL_LAT_POINTS - 1)))
#define RESOLUTION_LON(LATITUDE)  (EARTH_RADIUS * ((float)sin(LATITUDE) * ((Pi / 180) / (CELL_LON_POINTS - 1))))

/*
struct ElevationColor
{
   int altitude;
   ColorAlpha color;
};

static Array<ElevationColor> colorMap
{ [
   {  0, Color { 0, 0, 0 } },
   {  1100, Color { 28, 24, 101 } },
   {   1200, Color { 17, 138, 150 } },
   {   1300, Color { 0,75,0 } },
   {  1500, Color { 244,244,144 } },
   {  2000, Color { 79, 45, 8 } },
   {  2300, Color { 129, 65, 58 } },
   {  2600, Color { 185, 185, 185 } },
   {  3000, Color { 255, 255, 255 } }
] };

static void OutputTexture(String fileName)
{
   Bitmap bitmap { };
   if(bitmap.Allocate(null, 1025, 1025, 0, pixelFormat888, false))
   {
      ColorAlpha * picture = (ColorAlpha *)bitmap.picture;
      int y, x;

      Array<ColorAlpha> colorTable { size = 65536 };
      int altitude;
      ElevationColor * curKey = colorMap.array, * nextKey = colorMap.array;
      int keyNum = 0, nextKeyNum = 0;

      for(altitude = -32768; altitude<32768; altitude++)
      {
         int a = 255;
         Color color;
         while(altitude > nextKey->altitude)
         {
            curKey = nextKey; keyNum = nextKeyNum;
            if(keyNum < colorMap.count - 1)
            {
               nextKey = curKey + 1;
               nextKeyNum = keyNum + 1;
            }
            else
               break;
         }

         if(nextKey->altitude != curKey->altitude)
         {
            float scale = (float) (altitude - curKey->altitude) / (nextKey->altitude - curKey->altitude);
            Color cColor = curKey->color, nColor = nextKey->color;
            int cr = cColor.r, cg = cColor.g, cb = cColor.b;
            int nr = nColor.r, ng = nColor.g, nb = nColor.b;
            int r = (int)(cr + (nr - cr) * scale);
            int g = (int)(cg + (ng - cg) * scale);
            int b = (int)(cb + (nb - cb) * scale);
            r = Max(Min(r, 255),0);
            g = Max(Min(g, 255),0);
            b = Max(Min(b, 255),0);
            color = { (byte)r, (byte)g, (byte)b };
         }
         else
            color = curKey->color;
         colorTable[altitude + 32768] = { 255, color };
      }

      for(y = 0; y < bitmap.height; y++)
         for(x = 0; x < bitmap.width; x++)
            picture[y * bitmap.width + x] = colorTable[heightMap[y * 1025 + x] + 32768];

      delete colorTable;
      bitmap.Save(fileName, null, null);
   }
   delete bitmap;
}
*/

static bool LoadTerrain(Terrain terrain, const char * fileName, Angle lat)
{
   bool result = false;
   File f = FileOpen(fileName, read);
   if(f)
   {
      int y;
      float resLon = (float)RESOLUTION_LON(lat);
      for(y = 0; y<1025; y++)
      {
         int x;
         byte buffer[1201 * 2];
         if(f.Read(buffer, sizeof(uint16), 1201) < 1201)
            break;
         for(x = 0; x<1025; x++)
         {
            unsigned char b0 = buffer[2*x], b1 = buffer[2*x+1];
            short value = (short)((((int)b0 << 8) | b1) - ((b0 & 0x80) ? 0x10000 : 0));
            if(value > 20000) value = -32768;
            heightMap[y*1025+x] = value * ALTITUDE_FACTOR + ALTITUDE_OFFSET;
         }
      }

      // OutputTexture("res/texture.png");

      if(terrain.Create(heightMap, 16, 1025, 2, resLon, RESOLUTION_LAT, 512,512))
         result = true;
      delete f;
   }
   return result;
}

class Scene : Window
{
   bool filled;

   Camera camera
   {
      //type = attached;
      type = attachedQuaternion;
      position = { 0, 0, -10 };
      orientation = Euler { 180, 30, 0 };
      zMax = 340000;
   };
   Light light;
   Terrain terrain { };
   Bitmap textures[16];
   //Bitmap detail { };
   Object player { };
   SkyBox sky { size = { 100, 100, 100 }, folder = ":skycube", extension = "jpg" };
   DNAModel dna
   {
      numBases = 24;
      space = 60;
      rotation = 22.5; //Pi/8;
      helixCurveSegments = 48;
      helixWidth = 50;
      hydrogenWidth = 40;
      baseWidth = 180;
      baseHeight = 40;
      baseDepth = 40;
      desoxyriboseWidth = 40;
      textureFile = ":texture1.pcx";
   };
   /*
   Cube dna
   {
      size = { 100, 100, 100 };
   };*/

   Object water { };
   Material groundMaterial;
   TerrainMesh terrainMesh { terrain = terrain };
   float fogDensity;
   float detailBias;
   float zMax;
   double lastTime;
   FPS frameRate;
   int frame;
   Point lastMousePosition, newMousePosition;
   bool leftDown, rightDown;
   bool acquiredInput;

   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;

   text = "3D Camera & Terrain Demo";
   size = { 640, 480 };

   Scene()
   {
      // Load terrain from SRTM data ( 3 arc seconds data from http://www.viewfinderpanoramas.org/ , L12 Cell)
      LoadTerrain(terrain, ":N45W110.hgt", Degrees { 45 });

      frame = 0;
      fogDensity = 0.0001f;
      detailBias = 400;//1000;
      //detailBias = 0;
      //zMax = 100000; //340000;
      zMax = 340000;
      filled = true;
      newMousePosition = lastMousePosition = { MAXINT, MAXINT };
   }

   Timer timer
   {
      this, delay = 0.01;

      bool DelayExpired()
      {
         Elevation height;
         int x, y;
         MouseButtons b;
         static bool firstTime = true;
         double currentTime = GetTime();
         double diffTime = currentTime - lastTime;
         lastTime = currentTime;

         if(dna)
         {
            Quaternion orientation = dna.transform.orientation;
            orientation.RotateYawPitch(Degrees { (float)30*diffTime }, 0);
            dna.transform.orientation = orientation;
            dna.UpdateTransform();
         }

         //light.orientation.RotatePitch(Radians { 0.02f });

         if(acquiredInput)
            ((GuiApplication)__thisModule).GetMouseState(&b, &x, &y);
         else
         {
            if(lastMousePosition.x != MAXINT)
            {
               x = newMousePosition.x - lastMousePosition.x;
               y = newMousePosition.y - lastMousePosition.y;
               lastMousePosition = newMousePosition;
            }
            else
            {
               x = y = 0;
            }
            b = 0;
            if(leftDown)  b.left = true;
            if(rightDown) b.right = true;
         }

         if(player)
         {
            player.Animate(frame);
            frame ++;
            if(frame == 100) frame = 0;

            //player.RotateEuler({ Radians { -x / 60.0f }, Radians { -y / 60.0f } }, { pitch = -90 }, { pitch = 90 });
            //player.RotateEuler({ roll = Radians { x / 60.0f }, pitch = Radians { y / 60.0f } }, null, null);
            //player.Rotate({ roll = Radians { x / 60.0f }, pitch = Radians { y / 60.0f } });
            {
               Quaternion a = player.transform.orientation;
               a.RotateRoll(Radians { x / 60.0f });
               a.RotatePitch(Radians { y / 60.0f });
               player.transform.orientation = a;
               player.UpdateTransform();
            }

            if(b.right)
               player.Move({ 0, 0,-(float)diffTime * (camera.type == attachedQuaternion ? 10 : 1) * speed });
            else if(b.left)
               player.Move({ 0, 0, (float)diffTime * (camera.type == attachedQuaternion ? 10 : 1) * speed });

            height = (int)-terrain.GetElevation(
               (float)player.transform.position.x,
               (float)player.transform.position.z);

            if((float)player.transform.position.y > height - 100)
            {
               player.transform.position.y = height - 100.0f;
               player.UpdateTransform();
            }
         }

         if(firstTime || x || y || b)
         {
            firstTime = false;
            camera.Slerp(0.2f);
         }

         if(camera.Update())
         {
            display.Lock(false);
            terrainMesh.OptimizeMesh(camera, detailBias, zMax);
            display.Unlock();
         }

         Update(null);
         return true;
      }
   };

   void OnPosition(int x, int y, int w, int h)
   {
      camera.Setup(w, h, null);
      camera.Update(); // This wasn't necessary before!
      display.Lock(false);
      terrainMesh.OptimizeMesh(camera, detailBias, zMax);
      display.Unlock();
   }

   bool OnPostCreate()
   {
      timer.Start();
      acquiredInput = AcquireInput(true);
      return true;
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      lastMousePosition = { x, y };
      newMousePosition = { x, y };
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      lastMousePosition = { MAXINT, MAXINT };
      newMousePosition = { MAXINT, MAXINT };
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      newMousePosition = { x, y };
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      leftDown = true;
      Capture();
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(leftDown && !rightDown)
         ReleaseCapture();
      leftDown = false;
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      rightDown = true;
      Capture();
      return true;
   }
   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(rightDown && !leftDown)
         ReleaseCapture();
      rightDown = false;
      return true;
   }

   bool OnLoadGraphics()
   {
      Bitmap map { };

      light.ambient = { 0.2f, 0.2f, 0.2f };
      light.diffuse = light.specular = white;
      light.orientation = { 1,0,0,0 };
      light.orientation.RotatePitch(30);

      if(map.Load(":texture.png", null, null))
      {
         int c;
         int across = 4;
         map.Convert(null, pixelFormat888, null);
         map.SmoothEdges(256);
         for(c = 0; c < across * across; c++)
         {
            textures[c] = { };
            textures[c].Allocate(null, 256, 256, 0, map.pixelFormat, true);
            if(map.pixelFormat == pixelFormat8)
               memcpy(textures[c].palette, map.palette, 256*4);
            textures[c].Grab(map,
                     (c % across) * textures[c].width,
                     (c / across) * textures[c].height);
            textures[c].MakeMipMaps(displaySystem);
         }
      }
      delete map;

      player.Load(":aircraft/aircraft.3DS", null, displaySystem);

      camera.target = player;

      dna.Create(displaySystem);

      if(dna)
         dna.transform.position.y = -2200;
      dna.UpdateTransform();

      if(player)
      {
         player.transform.position.y = -2200;
         player.transform.position.x = 1000;
         player.transform.orientation = Euler { yaw = 230 };
      }

      /*detail.Load(":detail.pcx", null, displaySystem);
      displaySystem.AddTexture("DetailTexture", detail);*/

      sky.InitializeMesh(displaySystem);
      sky.Create(displaySystem);

      terrainMesh.CreateMesh(terrain, 8192*16, 1024, 1024, false, false, displaySystem);
      lastTime = GetTime();

      frameRate.Start();
      return true;
   }

   void OnUnloadGraphics()
   {
      int c;
      for(c = 0; c<16; c++)
         delete textures[c];
      terrainMesh.FreeMesh();
   }

   void OnRedraw(Surface surface)
   {
      surface.SetBackground(BACKGROUND);

      surface.Clear(depthBuffer);

      display.SetCamera(surface, camera);

      display.SetLight(0, light);
      display.fogColor = BACKGROUND;
      display.fogDensity = fogDensity;
      //display.fogDensity = 0.0000000001f;

      sky.Render(camera, display);

      if(!filled) display.fillMode = wireframe;
      terrainMesh.RenderMesh(display, null, textures);
      if(!filled) display.fillMode = solid;

      display.DrawObject(dna);
      display.DrawObject(player);

      display.SetCamera(surface, null);

      surface.SetForeground(black);
      //surface.WriteTextf(10,10, "Detail: %.0f, ZMax: %.02f, FPS: %.02f", detailBias, zMax, frameRate.fps);

      frameRate.Step();
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      switch(key)
      {
         case escape:
            Destroy(0);
            return false;
         case w: filled = false; break;
         case f: filled = true; break;
         case u:
            AcquireInput(false);
            acquiredInput = false;
            GetMousePosition(&lastMousePosition.x, &lastMousePosition.y);
            break;
         case a:
            acquiredInput = AcquireInput(true);
            break;
         case k0:
            camera.type = fixed;
            camera.position = camera.cPosition;
            camera.orientation = camera.cOrientation;
            break;
         case k1:
            /*camera.type = attached;
            camera.position = { 0, 0, -30 };
            camera.Slerp(0.1f);
            */
            camera.type = attachedQuaternion;
            camera.position = { 0, 0, -10 };
            camera.orientation = Euler { 180, 30, 0 };
            camera.Slerp(0.2f);
            break;
         case k2:
            camera.type = lookAt;
            camera.position = camera.cPosition; //{ 1000, -3000, 0 };
            camera.position.z -= 5;
            camera.orientation = { 1,0,0,0 };
            camera.Slerp(0.1f);
            break;
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      float detailBias = this.detailBias;
      float zMax = this.zMax;
      switch(key)
      {
         case pageUp: detailBias++; break;
         case pageDown: detailBias--; break;
         case home: zMax *= 0.9f; break;
         case end: zMax /= 0.9f; break;
         case keyPadPlus: camera.position.z /= 0.9f; break;
         case keyPadMinus: camera.position.z *= 0.9f; break;
         case f7: camera.RotateYaw(-0.02f, 0, 0); break;
         case f8: camera.RotateYaw(0.02f, 0, 0);  break;
         case f9: camera.RotatePitch(-0.02f, 0, 0); break;
         case f10:camera.RotatePitch( 0.02f, 0, 0); break;
      }
      if(this.detailBias != detailBias || this.zMax != zMax)
      {
         this.detailBias = Max(0, detailBias);
         this.zMax = Min(zMax, 340000);
         display.Lock(false);
         terrainMesh.OptimizeMesh(camera, this.detailBias, this.zMax);
         display.Unlock();
      }
      return true;
   }
}

class CameraDemoApp : GuiApplication
{
   driver = "OpenGL";
   timerResolution = 60;
}

Scene scene { };
