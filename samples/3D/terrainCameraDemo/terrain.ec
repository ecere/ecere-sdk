import "ecere"
import "BinaryTriangle"

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

static float fsqrt(float x, float y, float z)
{
   float ix = Abs(x),iy = Abs(y), iz = Abs(z);
   float tmp;

   if(ix < iy) { tmp = ix; ix = iy; iy = tmp; }
   if(ix < iz) { tmp = ix; ix = iz; iz = tmp; }
   if(iz > iy) { iz = iy; }
   return ix + (iz/2);
}

define SQR2 = 1.4142135623730950488016887242097f;

define MAXTRIS = 9265536;
class Elevation : int;

class Patch : struct
{
   int offsetX, offsetY;
   BinaryTriangle leftTri { };
   BinaryTriangle rightTri { };
   int x,y;
   Elevation *heightMap;
   Elevation *leftVariance, *rightVariance;
   Elevation maxHeight, minHeight;

   Elevation CalcVariance(Elevation * variance, int patchSize, int numBinTris, int numVarTris,
                          int i, /*struct */Point v0, /*struct */Point va, /*struct */Point v1, /*struct */Point vc)
   {
      Elevation real, avg;
      int leftchild = i * 2;
      Elevation temp1,temp2;
      int v;

      int tv0 = (v0.y + offsetY) * patchSize + v0.x + offsetX;
      int tv1 = (v1.y + offsetY) * patchSize + v1.x + offsetX;
      int tvc = (vc.y + offsetY) * patchSize + vc.x + offsetX;


      real = heightMap[tvc];
      avg = ((int)heightMap[tv1]+(int)heightMap[tv0]) /2;

      v = Abs(real - avg);

      if(leftchild + 1 <= numBinTris)
      {
         temp1 = CalcVariance(variance, patchSize, numBinTris, numVarTris, leftchild, va, vc, v0,   { (va.x + v0.x)/2, (va.y + v0.y)/2 });
         temp2 = CalcVariance(variance, patchSize, numBinTris, numVarTris, leftchild+1, v1, vc, va, { (v1.x + va.x)/2, (v1.y + va.y)/2 });
         v = Max(v,temp1);
         v = Max(v,temp2);
      }
      if(i <= numVarTris)
          variance[i-1] = v;

      return v;
   }
};

class TerrainPatch : struct
{
   Patch patch;
   int tx,ty;
   BinaryTriangle * leftTri;
   BinaryTriangle * rightTri;
   Material material;
   Mesh mesh;
   PrimitiveGroup group;
   bool shown:1;

   void Create(Mesh mesh, int wide, int patchSize,
               float resolutionX, float resolutionY,
               int acrossX, int acrossY, int tilingMult, int detailMult, Bitmap * detail,
               bool invertX, bool invertY)
   {
      int x,y,v;

      // Patches per Texture
      int pptX = Max(1,wide / acrossX);
      int pptY = Max(1,wide / acrossY);
      int dx,dy;

      if(invertX)
         tx = (wide - 1 - patch.x) / pptX;
      else
         tx = patch.x / pptX;
      if(invertY)
         ty = (wide - 1 - patch.y) / pptY;
      else
         ty = patch.y / pptY;
      if(invertX)
         dx = ((wide - 1 - patch.x) % pptX) * (patchSize - 1);
      else
         dx = (patch.x % pptX) * (patchSize - 1);
      if(invertY)
         dy = ((wide - 1 - patch.y) % pptY) * (patchSize - 1);
      else
         dy = (patch.y % pptY) * (patchSize - 1);

      // *** Compute the Vertices ***
      for(v = 0, y = 0; y<patchSize; y++)
      {
         for(x = 0; x<patchSize; x++, v++)
         {
            mesh.vertices[v].x = (x - patch.offsetX) * resolutionX;
            mesh.vertices[v].y = -patch.heightMap[v];
            mesh.vertices[v].z = (y - patch.offsetY) * resolutionY;

            if(invertX)
               mesh.texCoords[v].x = (dx + (patchSize - 1 - x)) / ((float) (patchSize -1)* pptX);
            else
               mesh.texCoords[v].x = (dx + x) / ((float) (patchSize -1)* pptX);
            if(invertY)
               mesh.texCoords[v].y = (dy + (patchSize - 1 - y)) / ((float) (patchSize -1)* pptY);
            else
               mesh.texCoords[v].y = (dy + y) / ((float) (patchSize -1)* pptY);

            if(tilingMult)
            {
               mesh.texCoords[v].x *= tilingMult;
               mesh.texCoords[v].y *= tilingMult;
            }
         }
      }
   }
};

class PatchNode : struct
{
   TerrainPatch patch;
   PatchNode child[4];
   Elevation maxHeight, minHeight;
   Vector3D block;
   float radius;
   bool shown:1;

   void QuadFree(int size)
   {
      if(size > 1)
      {
         child[0].QuadFree(size / 2);
         child[1].QuadFree(size / 2);
         child[2].QuadFree(size / 2);
         child[3].QuadFree(size / 2);
      }
      delete child[0];
      delete child[1];
      delete child[2];
      delete child[3];
   }

   bool QuadCreate(TerrainMesh terrainMesh, int size, int x, int y)
   {
      Terrain terrain = terrainMesh.terrain;
      int xx,yy,c;
      float dx,dy,dz;
      Patch patch;
      if(size > 1)
      {
         this.patch = null;
         maxHeight = MININT;
         minHeight = MAXINT;
         for(c=0, yy=0; yy<2; yy++)
            for(xx=0; xx<2; xx++, c++)
            {
               child[c] = PatchNode { };
               child[c].QuadCreate(terrainMesh, size / 2, x + xx * size / 2, y + yy * size / 2);
               if(child[c].maxHeight > maxHeight)
                  maxHeight = child[c].maxHeight;
               if(child[c].minHeight < minHeight)
                  minHeight = child[c].minHeight;
            }
         // *** Center Point ***
         block = {
            (child[0].block.x + child[1].block.x) / 2,
            -(minHeight + maxHeight) / 2,
            (child[0].block.z + child[2].block.z) / 2 };
         // *** Radius ***
         dx = (terrain.size - 1) * terrain.resolutionX * size / terrain.wide;
         dz = (terrain.size - 1) * terrain.resolutionY * size / terrain.wide;
         dx = Max(dx,dz);
         dy = maxHeight - minHeight;
         radius = Max(dx, dy) * SQR2;
      }
      else
      {
         patch = (Patch)&terrain.patches[y*terrain.wide+x];
         this.patch = (TerrainPatch)&terrainMesh.patches[y*terrain.wide+x];
         maxHeight = patch.maxHeight;
         minHeight = patch.minHeight;

         // *** Center Point ***
         block = {
            ((patch.leftTri.v0.x + patch.leftTri.v1.x) * terrain.resolutionX) / 2,
            -(patch.minHeight + patch.maxHeight) / 2,
            ((patch.leftTri.v0.y + patch.leftTri.v1.y) * terrain.resolutionY) / 2 };
         // *** Radius ***
         dx = (terrain.patchSize - 1) * terrain.resolutionX;
         dz = (terrain.patchSize - 1) * terrain.resolutionY;
         dx = Max(dx,dz);
         dy = patch.maxHeight - patch.minHeight;
         radius = Max(dx, dy) * SQR2;

         child[0] = child[1] = child[2] = child[3] = null;
      }
      return true;
   }

   void QuadCheck(int positionX, int positionY, int positionZ, float maxDistance, Camera camera)
   {
      float x1,y1,z1;

      // *** Check if this patch is worth our attention ***
      x1 = (float)(positionX - block.x);
      y1 = (float)(positionY - block.y);
      z1 = (float)(positionZ - block.z);

      if(fsqrt(x1, y1, z1) - radius > maxDistance)
         shown = false;
      else
      {
         shown = camera.SphereVisible(block, radius);
         if(shown)
         {
            if(patch)
               patch.shown = true;
            else if(child[0])
            {
               child[0].QuadCheck(positionX, positionY, positionZ, maxDistance, camera);
               child[1].QuadCheck(positionX, positionY, positionZ, maxDistance, camera);
               child[2].QuadCheck(positionX, positionY, positionZ, maxDistance, camera);
               child[3].QuadCheck(positionX, positionY, positionZ, maxDistance, camera);
            }
         }
      }
   }

   void QuadClear(int patchesWide)
   {
      int x,y;

      TerrainPatch terrainPatch;

      if(!shown) return;

      terrainPatch = patch;

      if(terrainPatch)
      {
         struct TerrainPatch * terrainPatchPtr = (void *)terrainPatch;
         Patch patch = terrainPatch.patch;
         x = patch.x;
         y = patch.y;

         // *** Clear the patch Tris ***
         terrainPatch.leftTri->clear();
         terrainPatch.rightTri->clear();

         // *** Reestablish Connections ***
         terrainPatch.leftTri->bottom = terrainPatch.rightTri;
         terrainPatch.rightTri->bottom = terrainPatch.leftTri;

         if((x + y) % 2)
         {
            if(x > 0 && (terrainPatchPtr - 1)->shown)
               terrainPatch.leftTri->left  = (terrainPatchPtr - 1)->rightTri;
            if(x < patchesWide - 1 && (terrainPatchPtr + 1)->shown)
               terrainPatch.rightTri->left  = (terrainPatchPtr + 1)->leftTri;
            if(y > 0 && (terrainPatchPtr - patchesWide)->shown)
               terrainPatch.leftTri->right  = (terrainPatchPtr - patchesWide)->leftTri;
            if(y < patchesWide - 1 && (terrainPatchPtr + patchesWide)->shown)
               terrainPatch.rightTri->right = (terrainPatchPtr + patchesWide)->rightTri;
         }
         else
         {
            if(x > 0 && (terrainPatchPtr - 1)->shown)
               terrainPatch.leftTri->right = (terrainPatchPtr - 1)->rightTri;
            if(x < patchesWide - 1 && (terrainPatchPtr + 1)->shown)
               terrainPatch.rightTri->right = (terrainPatchPtr + 1)->leftTri;
            if(y > 0 && (terrainPatchPtr - patchesWide)->shown)
               terrainPatch.rightTri->left  = (terrainPatchPtr - patchesWide)->rightTri;
            if(y < patchesWide - 1 && (terrainPatchPtr + patchesWide)->shown)
               terrainPatch.leftTri->left  = (terrainPatchPtr + patchesWide)->leftTri;
         }
      }
      else
      {
         child[0].QuadClear(patchesWide);
         child[1].QuadClear(patchesWide);
         child[2].QuadClear(patchesWide);
         child[3].QuadClear(patchesWide);
      }
   }

   void QuadSplit(TerrainMesh terrainMesh,
                  byte maxVarLevel, byte maxLevel, float resolutionX, float resolutionY,
                  int positionX, int positionY, int positionZ, int detailBias)
   {
      TerrainPatch patch = this.patch;
      if(!shown) return;

      if(patch)
      {
         terrainMesh.SplitTriangle(patch.leftTri, 0, resolutionX, resolutionY, positionX, positionY, positionZ,
            patch.patch.heightMap, maxVarLevel, detailBias, patch.patch.leftVariance, maxLevel);
         terrainMesh.SplitTriangle(patch.rightTri, 0, resolutionX, resolutionY, positionX, positionY, positionZ,
            patch.patch.heightMap, maxVarLevel, detailBias, patch.patch.rightVariance, maxLevel);
      }
      else if(child[0])
      {
         child[0].QuadSplit(terrainMesh, maxVarLevel, maxLevel, resolutionX, resolutionY, positionX, positionY, positionZ, detailBias);
         child[1].QuadSplit(terrainMesh, maxVarLevel, maxLevel, resolutionX, resolutionY, positionX, positionY, positionZ, detailBias);
         child[2].QuadSplit(terrainMesh, maxVarLevel, maxLevel, resolutionX, resolutionY, positionX, positionY, positionZ, detailBias);
         child[3].QuadSplit(terrainMesh, maxVarLevel, maxLevel, resolutionX, resolutionY, positionX, positionY, positionZ, detailBias);
      }
   }

   void QuadTriangles(TerrainMesh terrainMesh)
   {
      TerrainPatch patch = this.patch;
      if(!shown) return;
      if(patch)
      {
         if(patch.mesh.LockPrimitiveGroup(patch.group))
         {
            uint16 * indices = patch.group.indices;
            terrainMesh.nTriangles = 0;
            indices = terrainMesh.CreateTriangles(patch.leftTri, indices);
            indices = terrainMesh.CreateTriangles(patch.rightTri, indices);
            patch.group.nIndices = terrainMesh.nTriangles * 3;
            terrainMesh.tris += terrainMesh.nTriangles;
            terrainMesh.shownPatches++;

            patch.mesh.UnlockPrimitiveGroup(patch.group);
         }
      }
      else
      {
         child[0].QuadTriangles(terrainMesh);
         child[1].QuadTriangles(terrainMesh);
         child[2].QuadTriangles(terrainMesh);
         child[3].QuadTriangles(terrainMesh);
      }
   }
};


class TerrainMesh : struct
{
   Terrain terrain;
   struct TerrainPatch * patches;
   PatchNode nodes { };
   int acrossX, acrossY;

   // *** Runtime Stuff ***
   int nTriangles;
   int maxTris;
   BinaryTriangle * binTriStack;
   int index;

   // *** Stats ***
   uint tris;
   uint shownPatches;

   TerrainMesh()
   {
      binTriStack = new BinaryTriangle[MAXTRIS];
   }

   void SplitTriangle(BinaryTriangle tri, byte level, float resolutionX, float resolutionY, int positionX, int positionY, int positionZ,
                      Elevation * heightMap, byte maxVarLevel, int detailBias, Elevation * variance, byte maxLevel)
   {
      int distance;
      int varIndex;
      int ix, iy, iz, tmp;
      int x1,y1,x2,y2,x3,y3;

      // *** Compute Distance between this Triangle and the Viewer ***
      x1 = (int)(tri.v0.x * resolutionX) - positionX;
      y1 = (int)(tri.v0.y * resolutionY) - positionZ;
      x2 = (int)(tri.va.x * resolutionX) - positionX;
      y2 = (int)(tri.va.y * resolutionY) - positionZ;
      x3 = (int)(tri.v1.x * resolutionX) - positionX;
      y3 = (int)(tri.v1.y * resolutionY) - positionZ;
      if((x1 <= 0) && (x2 <= 0) && (x3 <= 0))
      {
         x1 = -x1;
         x2 = -x2;
         x3 = -x3;
         ix = Min(x1,x2);
         if(x3 < ix) ix = x3;
      }
      else if((x1 >= 0) && (x2 >= 0) && (x3 >= 0))
      {
         ix = Min(x1,x2);
         if(x3 < ix) ix = x3;
      }
      else ix=0;

      if((y1 <= 0) && (y2 <= 0) && (y3 <= 0))
      {
         y1 = -y1;
         y2 = -y2;
         y3 = -y3;
         iz = Min(y1,y2);
         if(y3 < iz) iz = y3;
      }
      else if((y1 >= 0) && (y2 >= 0) && (y3 >= 0))
      {
         iz = Min(y1,y2);
         if(y3 < iz) iz = y3;
      }
      else iz=0;

      iy = -heightMap[tri.tv0];
      tmp = -heightMap[tri.tva];
      if(tmp < iy) iy = tmp;
      tmp = -heightMap[tri.tv1];
      if(tmp < iy) iy = tmp;
      iy -= positionY;
      if(iy < 0) iy = -iy;

      if(ix < iy) { tmp = ix; ix = iy; iy = tmp; }
      if(ix < iz) { tmp = ix; ix = iz; iz = tmp; }
      if(iz > iy) { iz = iy; }
      distance = ix + (iz>>1);

      // *** Find the variance table index ***
      varIndex = tri.index;
      if(level > maxVarLevel)
         varIndex >>= (level - maxVarLevel);
      varIndex--;

      if(distance < detailBias * variance[varIndex])
      {
         // *** Split Further ***
         if(!tri.leftChild)
            tri.split(binTriStack, &index);
         level++;
         if(tri.leftChild && tri.rightChild && level < maxLevel)
         {
            SplitTriangle(tri.leftChild, level, resolutionX, resolutionY, positionX, positionY, positionZ, heightMap, maxVarLevel, detailBias, variance, maxLevel);
            SplitTriangle(tri.rightChild, level, resolutionX, resolutionY, positionX, positionY, positionZ, heightMap, maxVarLevel, detailBias, variance, maxLevel);
         }
      }
   }

#define DO_ALTITUDE(h, a, b) \
   { \
      int index = k + b * patchSize + a; \
      struct Patch * ePatch = (struct Patch *)patch; \
      if(a + x < 0) \
      { \
         ePatch = ePatch - 1; \
         index += patchSize - 1; \
      } \
      if(b + y < 0) \
      { \
         ePatch -= patchesCount; \
         index += (patchSize - 1) * patchSize; \
      } \
      if(a + x > patchSize - 1) \
      { \
         ePatch ++; \
         index -= patchSize - 1; \
      } \
      if(b + y > patchSize - 1) \
      { \
         ePatch += patchesCount; \
         index -= (patchSize - 1) * patchSize; \
      } \
      h = patch.heightMap[k] - ePatch->heightMap[index]; \
   }

#define DO_NORMAL(a3,b3,a2,b2,a1,b1) \
{ \
   dx1 = resX * a1; \
   DO_ALTITUDE(dy1,a1,b1); \
   dz1 = resY * b1; \
   dx2 = resX * a2; \
   DO_ALTITUDE(dy2,a2,b2); \
   dz2 = resY * b2; \
   dx3 = resX * a3; \
   DO_ALTITUDE(dy3,a3,b3); \
   dz3 = resY * b3; \
   nx = dy2*dz1-dz2*dy1; \
   ny = dz2*dx1-dx2*dz1; \
   nz = dx2*dy1-dy2*dx1; \
   m = fsqrt(nx,ny,nz); \
   if(m) \
   { \
      cx += nx / m; \
      cy += ny / m; \
      cz += nz / m; \
   } \
   nx = dy3*dz2-dz3*dy2; \
   ny = dz3*dx2-dx3*dz2; \
   nz = dx3*dy2-dy3*dx2; \
   m = fsqrt(nx,ny,nz); \
   if(m) \
   { \
      cx += nx / m; \
      cy += ny / m; \
      cz += nz / m; \
   } \
   count+= 2; \
}

   bool ComputeNormals()
   {
      Terrain terrain = this.terrain;
      int patchesCount = terrain.wide;
      int x,y,v;
      int xx,yy,c;
      int k;
      int count = 0;
      int patchSize = terrain.patchSize;
      float resX = terrain.resolutionX, resY = terrain.resolutionY;

      float dx1,dy1,dz1, dx2,dy2,dz2, dx3,dy3,dz3;
      float nx,ny,nz, m, cx,cy,cz;

      for(c = 0, yy = 0; yy<terrain.wide; yy++)
      {
         for(xx = 0; xx<terrain.wide; xx++, c++)
         {
            Patch patch = (Patch)&terrain.patches[c];
            Mesh mesh = patches[c].mesh;

            if(mesh.Lock({ normals = true }))
            {
               k = 0;
               for(v = 0, y = 0; y<patchSize; y++)
               {
                  for(x = 0; x<patchSize; x++, v++, k++)
                  {
                     count = 0;
                     cx = cy = cz = 0;

                     if((x > 0 || xx > 0) && (y > 0 || yy > 0))
                        DO_NORMAL(-1,0, -1,-1, 0,-1);
                     if((y > 0 || yy > 0) && (x < patchSize-1 || xx < patchesCount-1))
                        DO_NORMAL(0,-1, 1,-1, 1,0);
                     if((x < patchSize-1 || xx < patchesCount - 1) && (y < patchSize-1 || yy < patchesCount - 1))
                        DO_NORMAL(1,0, 1,1, 0,1);
                     if((x > 0 || xx > 0) && (y < patchSize-1 || yy < patchesCount - 1))
                        DO_NORMAL(0,1, -1,1, -1,0);
                     cx /= count;
                     cy /= count;
                     cz /= count;
                     mesh.normals[v].x = cx;
                     mesh.normals[v].y = cy;
                     mesh.normals[v].z = cz;
                  }
               }
               mesh.Unlock({ normals = true });
            }
         }
      }

      return true;
   }

   uint16 * CreateTriangles(BinaryTriangle tri, uint16 * indices)
   {
      if(tri.leftChild)
      {
         if(nTriangles < maxTris)
            indices = CreateTriangles(tri.leftChild, indices);
         if(nTriangles < maxTris)
            indices = CreateTriangles(tri.rightChild, indices);
      }
      else
      {
         // *** Create the triangle right here ***
         * indices++ = (uint16)tri.tv0;
         * indices++ = (uint16)tri.tva;
         * indices++ = (uint16)tri.tv1;
         nTriangles++;
      }
      return indices;
   }

   void OptimizeMesh(Camera camera, float bias, float distance)
   {
      int c;

      if(!terrain.numPatches) return;

      tris = 0;
      shownPatches = 0;
      index = 0;
      for(c = 0; c<terrain.numPatches; c++)
      {
         TerrainPatch patch = (TerrainPatch)&patches[c];
         patch.shown = false;
         patch.group.nIndices = 0;
      }

      nodes.QuadCheck((int)camera.cPosition.x, (int)camera.cPosition.y, (int)camera.cPosition.z, distance, camera);
      nodes.QuadClear(terrain.wide);
      nodes.QuadSplit(this, (byte)terrain.maxVarLevel, (byte)terrain.maxLevel,
         terrain.resolutionX, terrain.resolutionY,
         (int)camera.cPosition.x, (int)camera.cPosition.y, (int)camera.cPosition.z, (int)bias);
      nodes.QuadTriangles(this);
   }

   void RenderMesh(Display display, Material material, Bitmap * textures)
   {
      Object object { };
      int c;

      object.transform.scaling = { 1, 1, 1 };
      object.UpdateTransform();

      object.matrix.Identity();
      display.PushMatrix();

      display.SetTransform(object.matrix, false);
      for(c = 0; c<terrain.numPatches; c++)
      {
         TerrainPatch patch = (TerrainPatch)&patches[c];
         if(patch.shown)
         {
            if(material)
               patch.material = material;
            if(textures)
               patch.material.baseMap = textures[patch.ty * acrossX + patch.tx];
            object.mesh = patch.mesh;
            display.DrawMesh(object);
         }
      }
      display.PopMatrix();
      delete object;
   }

   void FreeMesh()
   {
      if(patches)
      {
         int c;
         for(c = 0; c < terrain.numPatches; c++)
         {
            TerrainPatch patch = (TerrainPatch)&patches[c];
            // *** Unlink our detail textures coordinates ***
            /*if(c)
               patch.mesh.texCoords[1] = null; */
            patch.mesh.Free(0);
            delete patch.mesh;
            delete patch.material;
         }
         delete patches;
      }
      nodes.QuadFree(terrain.wide);
   }

   bool CreateMesh(Terrain terrain, int maxTris, int textureSizeX, int textureSizeY, bool invertX, bool invertY, DisplaySystem displaySystem)
   {
      bool result = false;
      if(terrain)
      {
         int c,x,y;

         this.terrain = terrain;
         this.maxTris = maxTris;
         acrossX = textureSizeX / 256;
         acrossY = textureSizeY / 256;

         // *** Set up variable for local functions ***
         if((patches = new0 struct TerrainPatch[terrain.numPatches]))
         {
            result = true;

            // *** Set up Patches ***
            for(c = 0, y = 0; y<terrain.wide; y++)
            {
               for(x = 0; x<terrain.wide; x++, c++)
               {
                  TerrainPatch patch = (TerrainPatch)&patches[c];

                  patch.patch = (Patch)&terrain.patches[c];

                  // *** Set up Root Triangles ***
                  patch.leftTri = &patch.patch.leftTri;
                  patch.rightTri = &patch.patch.rightTri;

                  patch.mesh = Mesh { };
                  patch.material = Material { opacity = 1, flags = { doubleSided = true } };
                  if(patch.mesh.Allocate({ vertices = true, normals = true, texCoords1 = true },
                     terrain.patchSize * terrain.patchSize, displaySystem))
                  {
                     patch.group = patch.mesh.AddPrimitiveGroup(triangles, (terrain.patchSize-1) * (terrain.patchSize-1) * 2*3); //maxTris * 3);
                     if(patch.group)
                     {
                        patch.group.material = patch.material;
                        patch.Create(patch.mesh, terrain.wide, terrain.patchSize,
                           terrain.resolutionX, terrain.resolutionY,
                           acrossX, acrossY, 0, 0, null, invertX, invertY);
                        patch.mesh.UnlockPrimitiveGroup(patch.group);
                     }
                     patch.mesh.Unlock(0);
                  }
                  patch.material.diffuse = white;
                  patch.material.ambient = { 0.1f, 0.1f, 0.1f };
               }
            }
            // *** Compute Normals ***
            ComputeNormals();

            // *** Set Up Quad Tree ***
            nodes.QuadCreate(this, terrain.wide, 0,0);
         }
      }
      return result;
   }
};

class Terrain
{
   struct Patch * patches;

   uint size;
   uint16 wide, numPatches;
   float resolutionX, resolutionY;
   int offsetX, offsetY;

   // *** Per patch ***
   uint patchSize;
   uint16 maxLevel;
   uint16 maxVarLevel;
   uint numSamples;
   uint numVarTris;
   uint numBinTris;

   float sizeUnitX, sizeUnitY;
   float offsetUnitX,offsetUnitY;

   Elevation maxHeight, minHeight;

   // *** Size is the Actual Size of the HeightMap, and is (n^2 + 1) ***
   bool Create(Elevation * heightMap, int patchesCount, int size, int skipVarLevel,
               float resolutionX, float resolutionY, int offsetX, int offsetY)
   {
      bool result = false;

      if((1 << log2i(size - 1)) + 1 != size)
         Log("Invalid terrain size.\n");
      else if(1 << log2i(patchesCount) != patchesCount || ((size-1) / patchesCount) > 128)
         Log("Invalid patch size.\n");
      else
      {
         Patch patch;
         int c,x,y;
         int h,i,j,k;

         numPatches = 0;
         patches = null;
         this.size = size;
         sizeUnitX = (size - 1) * resolutionX;
         sizeUnitY = (size - 1) * resolutionY;
         patchSize = size = (size - 1) / patchesCount + 1;

         // patchesCount = 1;
         wide = (uint16)patchesCount;
         numPatches = (uint16)(patchesCount * patchesCount);

         if((patches = new0 struct Patch[numPatches]))
         {
            maxHeight = MININT;
            minHeight = MAXINT;

            this.offsetX = offsetX;
            this.offsetY = offsetY;
            offsetUnitX = offsetX * resolutionX;
            offsetUnitY = offsetY * resolutionY;
            this.resolutionX = resolutionX;
            this.resolutionY = resolutionY;
            numSamples = size * size;
            maxLevel = (uint16)(2 * log2i(size - 1));
            numBinTris = (1 << (maxLevel + 1)) - 1;
            if(skipVarLevel && skipVarLevel < maxLevel)
               maxVarLevel = (uint16)(maxLevel - skipVarLevel);
            else
               maxVarLevel = maxLevel;
            numVarTris = (1 << (maxVarLevel + 1)) - 1;

            result = true;

            // *** Set up Patches ***
            for(c = 0, y = 0; y < patchesCount; y++)
            {
               for(x = 0; x < patchesCount; x++, c++)
               {
                  patch = (Patch)&patches[c]; // = Patch { };

                  patch.leftTri = { };
                  patch.rightTri = { };

                  // *** Set up the patch ***
                  patch.x = x;
                  patch.y = y;

                  // *** Set up Height Map ***
                  patch.heightMap = new Elevation[numSamples];
                  if(!patch.heightMap) { result = false; break; };

                  k = (y*(size-1)) * this.size + (x * (size-1));
                  for(h = 0, j = 0; j<size; j++)
                  {
                     for(i = 0; i<size; i++, h++, k++)
                        patch.heightMap[h] = heightMap[k];
                     k += this.size - size;
                  }

                  // *** Set up Root Triangles ***
                  patch.offsetX = offsetX - x * (size - 1);
                  patch.offsetY = offsetY - y * (size - 1);

                  if((x + y) % 2)
                  {
                     patch.leftTri.v0 = { -patch.offsetX,-patch.offsetY + (size-1) };
                     patch.leftTri.va = { -patch.offsetX,-patch.offsetY };
                     patch.leftTri.v1 = { -patch.offsetX + (size-1), -patch.offsetY };
                     patch.leftTri.tv0 = numSamples-size;
                     patch.leftTri.tva = 0;
                     patch.leftTri.tv1 = size-1;
                     patch.rightTri.va = { -patch.offsetX + (size-1), -patch.offsetY + (size-1) };
                     patch.rightTri.tva = numSamples-1;
                  }
                  else
                  {
                     patch.leftTri.v0 = { -patch.offsetX + (size-1), -patch.offsetY + (size-1) };
                     patch.leftTri.va = { -patch.offsetX,-patch.offsetY + (size-1) };
                     patch.leftTri.v1 = { -patch.offsetX,-patch.offsetY };
                     patch.leftTri.tv0 = numSamples-1;
                     patch.leftTri.tva = numSamples-size;
                     patch.leftTri.tv1 = 0;
                     patch.rightTri.va = { -patch.offsetX + (size-1), -patch.offsetY };
                     patch.rightTri.tva = size-1;
                  }

                  patch.leftTri.vc =
                  {
                     (patch.leftTri.v0.x + patch.leftTri.v1.x) / 2,
                     (patch.leftTri.v0.y + patch.leftTri.v1.y) / 2
                  };
                  patch.leftTri.tvc = (patch.leftTri.tv0 + patch.leftTri.tv1)/2;

                  patch.rightTri.v0 = patch.leftTri.v1;
                  patch.rightTri.v1 = patch.leftTri.v0;
                  patch.rightTri.tv0 = patch.leftTri.tv1;
                  patch.rightTri.tv1 = patch.leftTri.tv0;
                  patch.rightTri.vc = patch.leftTri.vc;
                  patch.rightTri.tvc = patch.leftTri.tvc;

                  patch.leftTri.index = 1;
                  patch.rightTri.index = 1;

                  // *** Set up Variance Tables ***
                  patch.leftVariance = new Elevation[numVarTris];
                  if(!patch.leftVariance) { result = false; break; };
                  patch.rightVariance = new Elevation[numVarTris];
                  if(!patch.rightVariance) { result = false; break; };

                  // *** Compute Variance ***
                  patch.CalcVariance(patch.leftVariance,
                     patchSize, numBinTris, numVarTris,
                     1, patch.leftTri.v0,patch.leftTri.va,
                     patch.leftTri.v1, patch.leftTri.vc);
                  patch.CalcVariance(patch.rightVariance,
                     patchSize, numBinTris, numVarTris,
                     1, patch.rightTri.v0, patch.rightTri.va,
                     patch.rightTri.v1, patch.rightTri.vc);
               }
            }
            // *** Set Up Min/Max ***
            FindMax();
         }
      }
      return result;
   }

   void FindMax()
   {
      int c;

      // *** Find min/max height ***
      maxHeight = MININT;
      minHeight = MAXINT;
      for(c=0; c<numPatches; c++)
      {
         uint index;
         Patch patch = (Patch)&patches[c];
         patch.maxHeight = MININT;
         patch.minHeight = MAXINT;
         for(index=0; index<numSamples; index++)
         {
            if(patch.heightMap[index] > patch.maxHeight)
               patch.maxHeight = patch.heightMap[index];
            else if(patch.heightMap[index] < patch.minHeight)
               patch.minHeight = patch.heightMap[index];
         }

         // *** Terrain Limits ***
         if(patch.maxHeight > maxHeight)
            maxHeight = patch.maxHeight;
         else if(patch.minHeight < minHeight)
            minHeight = patch.minHeight;
      }
   }

#define CALC(a,b) \
   px = (a) / (patchSize-1); \
   py = (b) / (patchSize-1); \
   if(px == wide) \
   { \
      px = wide-1; \
      x = patchSize-1; \
   } \
   else \
      x = (a) % (patchSize-1); \
   if(py == wide) \
   { \
      py = wide-1; \
      y = patchSize-1; \
   } \
   else \
      y = (b) % (patchSize-1);

   float GetElevation(float fx, float fy)
   {
      float alt = -MAXFLOAT;
      if(this)
      {
         int sx,sy;
         float ix,iy;
         // float h1,h2;
         float a1,a2;
         float b1,b2;
         int px,py;
         int x, y;
         Vector3D v1,v2,v3;
         Plane plane;

         if(fx < - offsetUnitX) return -MAXFLOAT;
         if(fy < - offsetUnitY) return -MAXFLOAT;
         if(fx >= - offsetUnitX + sizeUnitX) return -MAXFLOAT;
         if(fy >= - offsetUnitY + sizeUnitY) return -MAXFLOAT;

         sx = (int) ((fx + offsetUnitX)/resolutionX);
         sy = (int) ((fy + offsetUnitY)/resolutionY);
         ix = (int) ((fx + offsetUnitX) - sx * resolutionX);
         iy = (int) ((fy + offsetUnitY) - sy * resolutionY);

         CALC(sx,sy);
         a1 = patches[py * wide + px].heightMap[y*patchSize+x];
         CALC(sx+1,sy);
         a2 = patches[py * wide + px].heightMap[y*patchSize+x];
         CALC(sx,sy+1);
         b1 = patches[py * wide + px].heightMap[y*patchSize+x];
         CALC(sx+1,sy+1);
         b2 = patches[py * wide + px].heightMap[y*patchSize+x];

         // Choose points depending on which triangle we're on
         if(iy < ix * resolutionY / resolutionX)
         {
            // Top Right
            v1 = { 0, a1, 0 };
            v2 = { resolutionX, b2, resolutionY };
            v3 = { resolutionX, a2, 0 };
         }
         else
         {
            // Bottom Left
            v1 = { 0, a1, 0 };
            v2 = { 0, b1, resolutionY };
            v3 = { resolutionX, b2, resolutionY };
         }
         plane.FromPoints(v1, v2, v3);
   /*
         h1 = a1 + (a2 - a1) * ix/resolutionX;
         h2 = b1 + (b2 - b1) * ix/resolutionX;
         alt = h1 +(h2 - h1) * iy/resolutionY;
   */
         alt = (float)((-plane.d - plane.a * ix - plane.c * iy) / plane.b);
      }
      return alt;
   }

   bool MapTexture(Bitmap bitmap, uint * colors, int steps, bool invertX, bool invertY)
   {
      bool result = false;
      Surface surface = bitmap.GetSurface(0,0,null);
      if(surface)
      {
         uint x,y;
         int step;
         int range;

         range = maxHeight - minHeight;
         for(y=0; y<bitmap.height; y++)
            for(x=0; x<bitmap.width; x++)
            {
               step = (GetElevation(x*sizeUnitX/bitmap.width  - offsetUnitX, y*sizeUnitY/bitmap.height - offsetUnitY) - minHeight) * steps / range;
               step = Min(Max(step,0),steps-1);
               surface.foreground = colors[step];
               // TODO: Call surface properties...
               surface.PutPixel(invertX ? (/*surface.width*/ - 1 - x) : x, invertY ? (/*surface.height*/ - 1 - y) : y);
            }
         delete surface;
         result = true;
      }
      return result;
   }

   ~Terrain()
   {
      if(patches)
      {
         int c;
         for(c = 0; c < numPatches; c++)
         {
            Patch patch = (Patch)&patches[c];
            delete patch.heightMap;
            delete patch.leftVariance;
            delete patch.rightVariance;
         }
         delete patches;
      }
   }
};
