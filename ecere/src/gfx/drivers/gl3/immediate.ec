// OpenGL Immediate Mode Transition Kit

#if defined(__ANDROID__) || defined(__ODROID__)
   #include <GLES/gl.h>
   #ifndef _GLES
      #define _GLES
   #endif
#elif defined(__EMSCRIPTEN__)
   #include <GLES2/gl2.h>
   #ifndef _GLES2
      #define _GLES2
   #endif
#else
   #include "gl_compat_4_4.h"
#endif

import "glab"
import "shading"

#define ENABLE_GL_SHADERS  (!defined(_GLES))
#define ENABLE_GL_FFP      (!defined(_GLES2))
#define ENABLE_GL_POINTER  (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_FBO      (!defined(__EMSCRIPTEN__))
#define ENABLE_GL_LEGACY   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_INTDBL   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_MAPBUF   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_SELECT   (!defined(_GLES) && !defined(_GLES2))
#define ENABLE_GL_COLORMAT (ENABLE_GL_FFP   && !defined(_GLES))

#if ENABLE_GL_SHADERS && ENABLE_GL_FFP
   #define GLEnableClientState            (shaders ? glEnableVertexAttribArray : glEnableClientState)
   #define GLDisableClientState           (shaders ? glDisableVertexAttribArray : glDisableClientState)
   #define VERTICES                       (shaders ? GLBufferContents::vertex : GL_VERTEX_ARRAY)
   #define NORMALS                        (shaders ? GLBufferContents::normal : GL_NORMAL_ARRAY)
   #define TEXTURECOORDS                  (shaders ? GLBufferContents::texCoord : GL_TEXTURE_COORD_ARRAY)
   #define COLORS                         (shaders ? GLBufferContents::color : GL_COLOR_ARRAY)
   #define GLVertexPointer(n, t, s, p)    (shaders ? glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p) : glVertexPointer(n, t, s, p))
   #define GLTexCoordPointer(n, t, s, p)  (shaders ? glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p) : glTexCoordPointer(n, t, s, p))
#elif ENABLE_GL_SHADERS
   #define GLEnableClientState            glEnableVertexAttribArray
   #define GLDisableClientState           glDisableVertexAttribArray
   #define VERTICES                       GLBufferContents::vertex
   #define NORMALS                        GLBufferContents::normal
   #define TEXTURECOORDS                  GLBufferContents::texCoord
   #define COLORS                         GLBufferContents::color
   #define GLVertexPointer(n, t, s, p)    glVertexAttribPointer(GLBufferContents::vertex,   n, t, GL_FALSE, s, p)
   #define GLTexCoordPointer(n, t, s, p)  glVertexAttribPointer(GLBufferContents::texCoord, n, t, GL_FALSE, s, p)
#else
   #define GLEnableClientState            glEnableClientState
   #define GLDisableClientState           glDisableClientState
   #define VERTICES                       GL_VERTEX_ARRAY
   #define NORMALS                        GL_NORMAL_ARRAY
   #define TEXTURECOORDS                  GL_TEXTURE_COORD_ARRAY
   #define COLORS                         GL_COLOR_ARRAY
   #define GLVertexPointer                glVertexPointer
   #define GLTexCoordPointer              glTexCoordPointer
#endif

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
static int vertexCount;
static int normalCount;
static float *vertexPointer;
static float *normalPointer;
static GLIMTKMode beginMode = unset;
static uint beginBufferSize, normalBufferSize;
static int numVertexCoords = 2;
static bool vertexColorValues = false;
static int vertexStride = 4;
static int vertexOffset = 2;

public void glimtkRecti(GLCapabilities capabilities, int a, int b, int c, int d)
{
   glimtkBegin(quads);
   glimtkVertex2i(a, b);
   glimtkVertex2i(a, d);
   glimtkVertex2i(c, d);
   glimtkVertex2i(c, b);
   glimtkEnd(capabilities);
}

public void glimtkBegin(GLIMTKMode mode)
{
   beginMode = mode;
   beginCount = 0;
   vertexCount = 0;
   vertexColorValues = false;
   vertexOffset = 2;
   vertexStride = 4;
   numVertexCoords = 2;

   if(!vertexPointer)
   {
      normalBufferSize = beginBufferSize = 1024;  // default number of vertices
      vertexPointer = new float[beginBufferSize * vertexStride];
      normalPointer = new float[normalBufferSize * 3];
   }
}

public void glimtkTexCoord2f(float x, float y)
{
   int count = vertexCount;

   if(vertexCount + numVertexCoords > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * vertexStride];
   }

   vertexPointer[count*vertexStride  ] = x;
   vertexPointer[count*vertexStride+1] = y;
   count++;

   if(beginMode == quads && ((beginCount % 4) == 3))
   {
      vertexPointer[count*vertexStride  ] = vertexPointer[(count-4)*vertexStride];
      vertexPointer[count*vertexStride+1] = vertexPointer[(count-4)*vertexStride+1];
      count++;
      vertexPointer[count*vertexStride  ] = vertexPointer[(count-3)*vertexStride];
      vertexPointer[count*vertexStride+1] = vertexPointer[(count-3)*vertexStride+1];
      count++;
   }
}
public void glimtkTexCoord2i(int x, int y)       { glimtkTexCoord2f((float)x, (float)y); }
public void glimtkTexCoord2d(double x, double y) { glimtkTexCoord2f((float)x, (float)y); }
public void glimtkTexCoord2fv(float * a)         { glimtkTexCoord2f(a[0], a[1]); }

public void glimtkVertex2f(float x, float y)
{
   numVertexCoords = 2;
   vertexStride = vertexOffset + numVertexCoords;

   if(vertexCount + 4 > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * vertexStride];
   }

   vertexPointer[vertexCount*vertexStride+vertexOffset] = x;
   vertexPointer[vertexCount*vertexStride+vertexOffset + 1] = y;
   vertexCount++;

   if(beginMode == quads && ((beginCount % 4) == 3))
   {
      vertexPointer[vertexCount*vertexStride+vertexOffset] = vertexPointer[(vertexCount-4)*vertexStride+vertexOffset];
      vertexPointer[vertexCount*vertexStride+vertexOffset + 1] = vertexPointer[(vertexCount-4)*vertexStride+vertexOffset + 1];
      vertexCount++;
      vertexPointer[vertexCount*vertexStride+vertexOffset] = vertexPointer[(vertexCount-3)*vertexStride+vertexOffset];
      vertexPointer[vertexCount*vertexStride+vertexOffset + 1] = vertexPointer[(vertexCount-3)*vertexStride+vertexOffset + 1];
      vertexCount++;
   }
   beginCount++;
}
public void glimtkVertex2i(int x, int y)         { glimtkVertex2f((float)x, (float)y); }
public void glimtkVertex2d(double x, double y)   { glimtkVertex2f((float)x, (float)y); }

GLAB streamVecAB, streamNorAB;

public void glimtkEnd(GLCapabilities capabilities)
{
   bool vertexBuffer = capabilities.vertexBuffer;
#if ENABLE_GL_SHADERS
   bool shaders = capabilities.shaders;
#endif
   GLIMTKMode mode = beginMode;
   if(mode == quads)        mode = triangles;
   else if(mode == polygon) mode = triangleFan;

   GLEnableClientState(TEXTURECOORDS);

   if(vertexBuffer)
   {
      streamVecAB.upload(vertexBuffer, vertexStride * sizeof(float) * vertexCount, vertexPointer);
      streamVecAB.use(capabilities, texCoord, 2, GL_FLOAT, vertexStride * sizeof(float), 0);
   }
   else
      noAB.use(capabilities, texCoord, 2, GL_FLOAT, vertexStride * sizeof(float), vertexPointer);

   if(vertexColorValues)
   {
      GLEnableClientState(COLORS);
      if(vertexBuffer)
         streamVecAB.use(capabilities, color, 4, GL_FLOAT, vertexStride * sizeof(float), (void *)(2 * sizeof(float)));
      else
         noAB.use(capabilities, color, 4, GL_FLOAT, vertexStride * sizeof(float), vertexPointer + 2);

#if ENABLE_GL_SHADERS
      if(shaders)
         shader_setPerVertexColor(true);
#endif
   }

   if(vertexBuffer)
      streamVecAB.use(capabilities, vertex, numVertexCoords, GL_FLOAT, vertexStride * sizeof(float), (void *)(vertexOffset * sizeof(float)));
   else
      noAB.use(capabilities, vertex, numVertexCoords, GL_FLOAT, vertexStride * sizeof(float), vertexPointer + vertexOffset);

   if(normalCount && normalCount == vertexCount)
   {
      GLEnableClientState(NORMALS);
      if(vertexBuffer)
      {
         streamNorAB.upload(vertexBuffer, 3*sizeof(float) * vertexCount, normalPointer);
         streamNorAB.use(capabilities, normal, 3, GL_FLOAT, 3*sizeof(float), 0);
      }
      else
         noAB.use(capabilities, normal, 3, GL_FLOAT, 3*sizeof(float),normalPointer);
   }

   glDrawArrays(mode, 0, vertexCount);

   if(normalCount)
      GLDisableClientState(NORMALS);
   if(vertexColorValues)
   {
      GLDisableClientState(COLORS);

#if ENABLE_GL_SHADERS
      if(shaders)
         shader_setPerVertexColor(false);
#endif

   }
   GLDisableClientState(TEXTURECOORDS);

   normalCount = 0;
   vertexColorValues = false;
   numVertexCoords = 2;
   beginMode = unset;
}

// Vertex Pointer
static float *floatVPBuffer = null;
static short *shortVPBuffer = null;
static unsigned int shortVPSize = 0, floatVPSize = 0;

// Buffer Data
static unsigned short *shortBDBuffer = null;
static unsigned int shortBDSize = 0;

public void glimtkVertexPointeri(bool shaders, int numCoords, int stride, int *pointer, int numVertices)
{
   if(pointer)
   {
      int i;
      if(numVertices*numCoords > shortVPSize)
      {
         shortVPSize = numVertices*numCoords;
         shortVPBuffer = renew shortVPBuffer short[shortVPSize];
      }
      for(i = 0; i < numVertices*numCoords; i++)
         shortVPBuffer[i] = (short)pointer[i];

      GLVertexPointer(numCoords, GL_SHORT, stride, shortVPBuffer);
   }
   else
      GLVertexPointer(numCoords, GL_SHORT, stride, 0);
}

public void glimtkVertexPointerd(bool shaders, int numCoords, int stride, double *pointer, int numVertices)
{
   if(pointer)
   {
      int i;
      if(numVertices*numCoords > floatVPSize)
      {
         floatVPSize = numVertices*numCoords;
         floatVPBuffer = renew floatVPBuffer float[floatVPSize];
      }
      for(i = 0; i < numVertices*numCoords; i++)
         floatVPBuffer[i] = (float)pointer[i];
      GLVertexPointer(numCoords, GL_FLOAT, stride, floatVPBuffer);
   }
   else
      GLVertexPointer(numCoords, GL_FLOAT, stride, 0);
}

public void glimtkTexReuseIntVP(bool shaders, int numCoords)
{
   GLTexCoordPointer(numCoords, GL_SHORT, 0, floatVPBuffer);
}

public void glimtkTexReuseDoubleVP(bool shaders, int numCoords)
{
   GLTexCoordPointer(numCoords, GL_FLOAT, 0, floatVPBuffer);
}

public void glimtkColor4f(bool shaders, float r, float g, float b, float a)
{
   if(beginMode != unset)
   {
      int count = vertexCount;

      vertexColorValues = true;
      vertexOffset = 6;
      vertexStride = vertexOffset + numVertexCoords;

      if(vertexCount + vertexStride > beginBufferSize)
      {
         beginBufferSize = beginBufferSize + beginBufferSize/2;
         vertexPointer = renew vertexPointer float[beginBufferSize * vertexStride];
      }

      vertexPointer[count*vertexStride + 2] = r;
      vertexPointer[count*vertexStride + 3] = g;
      vertexPointer[count*vertexStride + 4] = b;
      vertexPointer[count*vertexStride + 5] = a;
      count++;

      if(beginMode == quads && ((beginCount % 4) == 3))
      {
         vertexPointer[count*vertexStride + 2] = vertexPointer[(count-4) * vertexStride + 2];
         vertexPointer[count*vertexStride + 3] = vertexPointer[(count-4) * vertexStride + 3];
         vertexPointer[count*vertexStride + 4] = vertexPointer[(count-4) * vertexStride + 4];
         vertexPointer[count*vertexStride + 5] = vertexPointer[(count-4) * vertexStride + 5];
         count++;
         vertexPointer[count*vertexStride + 2] = vertexPointer[(count-3) * vertexStride + 2];
         vertexPointer[count*vertexStride + 3] = vertexPointer[(count-3) * vertexStride + 3];
         vertexPointer[count*vertexStride + 4] = vertexPointer[(count-3) * vertexStride + 4];
         vertexPointer[count*vertexStride + 5] = vertexPointer[(count-3) * vertexStride + 5];
         count++;
      }
   }
   else
   {
#if ENABLE_GL_SHADERS
      if(shaders)
         shader_color(r, g, b, a);
#endif

#if ENABLE_GL_FFP
      if(!shaders)
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

public void glimtkColor3f( bool usingShaders, float r, float g, float b )
{
   glimtkColor4f(usingShaders, r, g, b, 1.0f);
}

public void glimtkColor4ub(bool usingShaders, unsigned char r, unsigned char g, unsigned char b, unsigned char a)
{
   glimtkColor4f(usingShaders, r/255.0f, g/255.0f, b/255.0f, a/255.0f);
}

public void glimtkColor4fv(bool shaders, float * a)
{
   glimtkColor4f(shaders, a[0], a[1], a[2], a[3]);
}

public void glimtkBufferDatad(int target, int size, void * data, int usage)
{
   int numElems = size/sizeof(double);
   double * dblPtr = (double *)data;
   int i;
   if (numElems > floatVPSize)
   {
      floatVPSize = numElems;
      floatVPBuffer = renew floatVPBuffer float[floatVPSize];
   }
   for (i=0; i< numElems; i++)
      floatVPBuffer[i] = (float)dblPtr[i];

   glBufferData(target, numElems*sizeof(float), floatVPBuffer, usage);
}

public void glimtkBufferDatai(int target, int size, void * data, int usage)
{
   int numElems = size/sizeof(unsigned int);
   unsigned int * pointer = (unsigned int *)data;
   int i;
   if (numElems > shortBDSize)
   {
      shortBDSize = numElems;
      shortBDBuffer = renew shortBDBuffer uint16[shortBDSize];
   }
   for (i=0; i< numElems; i++)
      shortBDBuffer[i] = (unsigned short)pointer[i];

   glBufferData(target, numElems*sizeof(unsigned short), shortBDBuffer, usage);
}

public void glimtkVertex3f( float x, float y, float z )
{
   numVertexCoords = 3;
   vertexStride = vertexOffset + numVertexCoords;

   if(vertexCount + vertexStride > beginBufferSize)
   {
      beginBufferSize = beginBufferSize + beginBufferSize/2;
      vertexPointer = renew vertexPointer float[beginBufferSize * vertexStride];
   }

   vertexPointer[vertexCount*vertexStride+vertexOffset] = x;
   vertexPointer[vertexCount*vertexStride+vertexOffset+1] = y;
   vertexPointer[vertexCount*vertexStride+vertexOffset+2] = z;
   vertexCount++;

   if(beginMode == quads && ((beginCount % 4) == 3))
   {
      vertexPointer[vertexCount*vertexStride+vertexOffset] = vertexPointer[(vertexCount-4)*vertexStride+vertexOffset];
      vertexPointer[vertexCount*vertexStride+vertexOffset+1] = vertexPointer[(vertexCount-4)*vertexStride+vertexOffset+1];
      vertexPointer[vertexCount*vertexStride+vertexOffset+2] = vertexPointer[(vertexCount-4)*vertexStride+vertexOffset+2];
      vertexCount++;
      vertexPointer[vertexCount*vertexStride+vertexOffset] = vertexPointer[(vertexCount-3)*vertexStride+vertexOffset];
      vertexPointer[vertexCount*vertexStride+vertexOffset+1] = vertexPointer[(vertexCount-3)*vertexStride+vertexOffset+1];
      vertexPointer[vertexCount*vertexStride+vertexOffset+2] = vertexPointer[(vertexCount-3)*vertexStride+vertexOffset+2];
      vertexCount++;
   }
   beginCount++;
}

public void glimtkVertex3d( double x, double y, double z )  { glimtkVertex3f((float)x, (float)y, (float)z); }
public void glimtkVertex3fv( float* coords )                { glimtkVertex3f(coords[0], coords[1], coords[2]); }
public void glimtkVertex3dv( double* coords )               { glimtkVertex3f((float)coords[0], (float)coords[1], (float)coords[2]); }

public void glimtkNormal3f(float x, float y, float z)
{
   normalCount = vertexCount;
   if(vertexCount + 4 > normalBufferSize)
   {
      normalBufferSize = normalBufferSize + normalBufferSize/2;
      normalPointer = renew normalPointer float[normalBufferSize * 2];
   }

   normalPointer[normalCount*3+0] = x;
   normalPointer[normalCount*3+1] = y;
   normalPointer[normalCount*3+2] = z;
   normalCount++;

   if(beginMode == quads && ((beginCount % 4) == 3))
   {
      normalPointer[normalCount*3+0] = normalPointer[(normalCount-4)*3+0];
      normalPointer[normalCount*3+1] = normalPointer[(normalCount-4)*3+1];
      normalPointer[normalCount*3+2] = normalPointer[(normalCount-4)*3+2];
      normalCount++;
      normalPointer[normalCount*3+0] = normalPointer[(normalCount-3)*3+0];
      normalPointer[normalCount*3+1] = normalPointer[(normalCount-3)*3+1];
      normalPointer[normalCount*3+2] = normalPointer[(normalCount-3)*3+2];
      normalCount++;
   }
}
public void glimtkNormal3fd(double x, double y, double z)         { glimtkNormal3f((float)x, (float)y, (float)z); }
public void glimtkNormal3fv(float * coords)                       { glimtkNormal3f(coords[0], coords[1], coords[2]); }

public void glimtkTerminate()
{
   delete vertexPointer;
   delete normalPointer;
   beginBufferSize = 0;

   delete floatVPBuffer;
   shortVPSize = 0;

   delete shortVPBuffer;
   floatVPSize = 0;

   delete shortBDBuffer;
   shortBDSize = 0;
}
