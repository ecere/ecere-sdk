// OpenGL Immediate Mode Transition Kit
import "glab"
import "defaultShader"

#include "gl123es.h"

namespace gfx::drivers;

public enum GLIMTKMode
{
   unset          =     -1,
   points         = 0x0000,
   lines          = 0x0001,
   lineLoop       = 0x0002,
   lineStrip      = 0x0003,
   triangles      = 0x0004,
   triangleStrip  = 0x0005,
   triangleFan    = 0x0006,
   quads          = 0x0007,
   quadStrip      = 0x0008,
   polygon        = 0x0009
};

static int beginCount;
static GLIMTKMode beginMode = unset;
static bool vertexColorValues = false;
static int numCoords = 2;     // Number of coordinates per vertex
static int vertexOffset = 2;  // Offset of vertex info

static struct FloatGLAB : GLAB
{
   uint count;       // Count of vertices
   uint size;        // Size in vertices
   int stride;      // Number of floats per vertex
   float * pointer;
   uint bufSize;     // Size in bytes of VBO

   static inline float * ensure(uint extraVertices)
   {
      if(count + extraVertices >= size)
      {
         size = size ? (size + size/2) : Max(count + extraVertices, 6);
         pointer = renew pointer float[size * stride];
      }
      return pointer + count * stride;
   }

   static inline void upload()
   {
      uint bufSize = count * stride * sizeof(float);
      if(bufSize > this.bufSize)
      {
         this.bufSize = bufSize;
         GLAB::allocate(bufSize, null, dynamicDraw);
      }
      GLAB::upload(0, bufSize, verticesBuf.pointer);
   }

   static inline void free()
   {
      bufSize = 0;
      count = 0;
      size = 0;
      delete pointer;
      GLAB::free();
   }
};

FloatGLAB verticesBuf { stride = 4 };
FloatGLAB normalsBuf { stride = 3 };

void glimtkTerminate()
{
   verticesBuf.free();
   normalsBuf.free();
}

public void glimtkRecti(int a, int b, int c, int d)
{
   glimtkBegin(quads);
   glimtkVertex2i(a, b);
   glimtkVertex2i(a, d);
   glimtkVertex2i(c, d);
   glimtkVertex2i(c, b);
   glimtkEnd();
}

public void glimtkBegin(GLIMTKMode mode)
{
   beginMode = mode;
   vertexColorValues = false;
   beginCount = 0;
   vertexOffset = 2;

   verticesBuf.count = 0;
   verticesBuf.stride = 4;
   numCoords = 2;
}

public void glimtkTexCoord2f(float x, float y)
{
   int stride = verticesBuf.stride;
   bool quadsAdd = beginMode == quads && !glCaps_quads && ((beginCount % 4) == 3);
   float * buf = verticesBuf.ensure(quadsAdd ? 3 : 1);
   buf[0] = x;
   buf[1] = y;
   buf += stride;
   if(quadsAdd)
   {
      buf[0] = buf[-4*stride];
      buf[1] = buf[-4*stride+1];
      buf += stride;
      buf[0] = buf[-3*stride];
      buf[1] = buf[-3*stride+1];
      buf += stride;
   }
}

public void glimtkTexCoord2i(int x, int y)       { glimtkTexCoord2f((float)x, (float)y); }
public void glimtkTexCoord2d(double x, double y) { glimtkTexCoord2f((float)x, (float)y); }
public void glimtkTexCoord2fv(float * a)         { glimtkTexCoord2f(a[0], a[1]); }

public void glimtkVertex2f(float x, float y)
{
   numCoords = 2;
   verticesBuf.stride = vertexOffset + numCoords;
   {
      int stride = verticesBuf.stride;
      bool quadsAdd = beginMode == quads && !glCaps_quads && ((beginCount % 4) == 3);
      float * buf = verticesBuf.ensure(quadsAdd ? 3 : 1) + vertexOffset;
      buf[0] = x;
      buf[1] = y;
      verticesBuf.count++;
      if(quadsAdd)
      {
         buf += stride;
         buf[0] = buf[-4*stride];
         buf[1] = buf[-4*stride+1];
         buf += stride;
         buf[0] = buf[-3*stride];
         buf[1] = buf[-3*stride+1];
         verticesBuf.count+=2;
      }
   }
   beginCount++;
}
public void glimtkVertex2i(int x, int y)         { glimtkVertex2f((float)x, (float)y); }
public void glimtkVertex2d(double x, double y)   { glimtkVertex2f((float)x, (float)y); }

public void glimtkVertex3f( float x, float y, float z )
{
   numCoords = 3;
   verticesBuf.stride = vertexOffset + numCoords;
   {
      int stride = verticesBuf.stride;
      bool quadsAdd = beginMode == quads && !glCaps_quads && ((beginCount % 4) == 3);
      float * buf = verticesBuf.ensure(quadsAdd ? 3 : 1) + vertexOffset;
      buf[0] = x;
      buf[1] = y;
      buf[2] = z;
      verticesBuf.count++;
      if(quadsAdd)
      {
         buf += stride;
         buf[0] = buf[-4*stride];
         buf[1] = buf[-4*stride+1];
         buf[2] = buf[-4*stride+2];
         buf += stride;
         buf[0] = buf[-3*stride];
         buf[1] = buf[-3*stride+1];
         buf[2] = buf[-3*stride+2];
         verticesBuf.count+=2;
      }
   }
   beginCount++;
}

public void glimtkVertex3d( double x, double y, double z )  { glimtkVertex3f((float)x, (float)y, (float)z); }
public void glimtkVertex3fv( float* coords )                { glimtkVertex3f(coords[0], coords[1], coords[2]); }
public void glimtkVertex3dv( double* coords )               { glimtkVertex3f((float)coords[0], (float)coords[1], (float)coords[2]); }

public void glimtkColor4f(float r, float g, float b, float a)
{
   if(beginMode != unset)
   {
      // Called within glBegin()/glEnd()
      vertexColorValues = true;
      vertexOffset = 6;
      verticesBuf.stride = vertexOffset + numCoords;
      {
         int stride = verticesBuf.stride;
         bool quadsAdd = beginMode == quads && !glCaps_quads && ((beginCount % 4) == 3);
         float * buf = verticesBuf.ensure(quadsAdd ? 3 : 1) + 2;
         buf[0] = r, buf[1] = g, buf[2] = b, buf[3] = a;

         if(quadsAdd)
         {
            buf += stride;
            buf[0] = buf[-4*stride];
            buf[1] = buf[-4*stride+1];
            buf[2] = buf[-4*stride+2];
            buf[3] = buf[-4*stride+3];
            buf += stride;
            buf[0] = buf[-3*stride];
            buf[1] = buf[-3*stride+1];
            buf[2] = buf[-3*stride+2];
            buf[3] = buf[-3*stride+3];
         }
      }
   }
   else
   {
#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         defaultShader.setColor(r, g, b, a);
#endif

#if ENABLE_GL_FFP
      if(!glCaps_shaders)
      {
         glColor4f(r, g, b, a);
         if(lightingEnabled)
         {
            float color[4] = { r, g, b, a };
            glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, color);
            glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, color);
         }
      }
#endif
   }
}

public void glimtkColor3f( float r, float g, float b )      { glimtkColor4f(r, g, b, 1.0f); }
public void glimtkColor4ub(byte r, byte g, byte b, byte a)  { glimtkColor4f(r/255.0f, g/255.0f, b/255.0f, a/255.0f); }
public void glimtkColor4fv(float * a)                       { glimtkColor4f(a[0], a[1], a[2], a[3]); }


public void glimtkNormal3f(float x, float y, float z)
{
   normalsBuf.count = verticesBuf.count;
   {
      int stride = normalsBuf.stride;
      bool quadsAdd = beginMode == quads && !glCaps_quads && ((beginCount % 4) == 3);
      float * buf = normalsBuf.ensure(quadsAdd ? 3 : 1) + 2;

      buf[0] = x, buf[1] = y, buf[2] = z;
      normalsBuf.count++;

      if(quadsAdd)
      {
         buf[0] = buf[-4*stride];
         buf[1] = buf[-4*stride+1];
         buf[2] = buf[-4*stride+2];
         buf += stride;
         buf[0] = buf[-3*stride];
         buf[1] = buf[-3*stride+1];
         buf[2] = buf[-3*stride+2];
         normalsBuf.count += 2;
      }
   }
}
public void glimtkNormal3d(double x, double y, double z)         { glimtkNormal3f((float)x, (float)y, (float)z); }
public void glimtkNormal3fv(float * coords)                      { glimtkNormal3f(coords[0], coords[1], coords[2]); }
public void glimtkNormal3fd(double * coords)                     { glimtkNormal3f((float)coords[0], (float)coords[1], (float)coords[2]); }


public void glimtkEnd()
{
   GLIMTKMode mode = beginMode;
   if(!glCaps_quads)
   {
      if(mode == quads)        mode = triangles;
      else if(mode == polygon) mode = triangleFan;
   }

   GLEnableClientState(TEXCOORDS);

   if(glCaps_vertexBuffer)
   {
      verticesBuf.upload();
      verticesBuf.use(texCoord, 2, GL_FLOAT, verticesBuf.stride * sizeof(float), 0);
   }
   else
      noAB.use(texCoord, 2, GL_FLOAT, verticesBuf.stride * sizeof(float), verticesBuf.pointer);

   if(vertexColorValues)
   {
      GLEnableClientState(COLORS);
      if(glCaps_vertexBuffer)
         verticesBuf.use(color, 4, GL_FLOAT, verticesBuf.stride * sizeof(float), (void *)(2 * sizeof(float)));
      else
         noAB.use(color, 4, GL_FLOAT, verticesBuf.stride * sizeof(float), verticesBuf.pointer + 2);

#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         defaultShader.setPerVertexColor(true);
#endif
   }

   if(glCaps_vertexBuffer)
      verticesBuf.use(vertex, numCoords, GL_FLOAT, verticesBuf.stride * sizeof(float), (void *)(vertexOffset * sizeof(float)));
   else
      noAB.use(vertex, numCoords, GL_FLOAT, verticesBuf.stride * sizeof(float), verticesBuf.pointer + vertexOffset);

   if(normalsBuf.count && normalsBuf.count == verticesBuf.count)
   {
      GLEnableClientState(NORMALS);
      if(glCaps_vertexBuffer)
      {
         normalsBuf.upload();
         normalsBuf.use(normal, 3, GL_FLOAT, 3*sizeof(float), 0);
      }
      else
         noAB.use(normal, 3, GL_FLOAT, 3*sizeof(float),normalsBuf.pointer);
   }

   GLFlushMatrices();
   glDrawArrays(mode, 0, verticesBuf.count);

   if(normalsBuf.count)
      GLDisableClientState(NORMALS);
   if(vertexColorValues)
   {
      GLDisableClientState(COLORS);

#if ENABLE_GL_SHADERS
      if(glCaps_shaders)
         defaultShader.setPerVertexColor(false);
#endif

   }
   GLDisableClientState(TEXCOORDS);

   normalsBuf.count = 0;
   vertexColorValues = false;
   numCoords = 2;
   beginMode = unset;
}
