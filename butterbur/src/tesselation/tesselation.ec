#define property _property
#define String String_
#include <glutess.h>
#undef String
#undef property

public import IMPORT_STATIC "ecere"

#if defined(__WIN32__)
#define TESS_CALLBACK_FUNCTION_PROTOTYPE void (__stdcall*)(void)
#else
#define TESS_CALLBACK_FUNCTION_PROTOTYPE void *
#define CALLBACK
#endif

void * eC_malloc(unsigned int size) { return new byte[size]; }
void * eC_realloc(void * pointer, unsigned int size) { return renew pointer byte[size]; }
void eC_free(void * pointer) { delete pointer; }

Mutex tessMutex { };

static Array<Vector3D> vertices { };

/*static */ GLUtesselator * butterburTesselator = null;

private static inline double ccw(const Pointf a, const Pointf b, const Pointf c)
{
   return (((double)b.x - (double)a.x) * ((double)c.y - (double)a.y) - ((double)c.x - (double)a.x) * ((double)b.y - (double)a.y));
}

static bool selfIntersects(Array<Pointf> points)
{
   int i, j;
   for(i = 0; i < points.count; i++)
   {
      Pointf * ap = &points[i], * aq = &points[(i < points.count-1) ? i + 1 : 0];
      for(j = 0; j < points.count; j++)
      {
         Pointf * bp = &points[j], * bq = &points[(j < points.count-1) ? j + 1 : 0];
         if(ap != bp && ap != bq && aq != bp && aq != bq)
         {
            double a = ccw(ap, aq, bp);
            double b = ccw(ap, aq, bq);
            double c = ccw(bp, bq, ap);
            double d = ccw(bp, bq, aq);

            #define roundoffDouble  0.00000000001

            if(Abs(a) < roundoffDouble) a = 0;
            if(Abs(b) < roundoffDouble) b = 0;
            if(Abs(c) < roundoffDouble) c = 0;
            if(Abs(d) < roundoffDouble) d = 0;

            if(Sgn(a) * Sgn(b) < 0 && Sgn(c) * Sgn(d) < 0)
               return true;
         }
      }
   }
   return false;
}

struct TessPrim
{
   GLIMTKMode type;
   uint count;
   uint32 * indices;
   void OnFree()
   {
      delete indices;
   }
};

struct TessPrimData
{
   GLIMTKMode which;

   Array<CombineVertex> combineVertices;
   Array<TessPrim> primitives;
   Array<uint> triIndices;
   Array<uint> tmpIndices;
   Array<Pointf> output;
};

class CombineVertex : struct
{
   Pointf position;
   int id;
};

static void CALLBACK tessPrimBegin(GLenum which, TessPrimData tesselatorData)
{
   tesselatorData.which = which == GL_TRIANGLES ? triangles : which == GL_TRIANGLE_STRIP ? triangleStrip : triangleFan;
   if(which != GL_TRIANGLES)
   {
      tesselatorData.tmpIndices.size = 0;
      if(tesselatorData.primitives.size + 1 > tesselatorData.primitives.minAllocSize)
         tesselatorData.primitives.minAllocSize += tesselatorData.primitives.minAllocSize / 2;
   }
}

static void CALLBACK tessPrimVertex(Pointf * point, TessPrimData tesselatorData)
{
   uint index = 0;
   uint * indices;

   if(tesselatorData.which == triangles)
   {
      if(tesselatorData.triIndices.size + 1 > tesselatorData.triIndices.minAllocSize)
         tesselatorData.triIndices.minAllocSize += tesselatorData.triIndices.minAllocSize / 2;
      indices = tesselatorData.triIndices.array;
   }
   else
   {
      if(tesselatorData.tmpIndices.size + 1 > tesselatorData.tmpIndices.minAllocSize)
         tesselatorData.tmpIndices.minAllocSize += tesselatorData.tmpIndices.minAllocSize / 2;
      indices = tesselatorData.tmpIndices.array;
   }

   if(point >= &tesselatorData.output[0] && point < &tesselatorData.output[tesselatorData.output.count])
      index = point - &tesselatorData.output[0];
   else
   {
      CombineVertex vertex = (CombineVertex)point;
      index = tesselatorData.output.count + vertex.id;
   }

   if(tesselatorData.which == triangles)
   {
      uint ix = tesselatorData.triIndices.size;
      tesselatorData.triIndices.size++;
      indices[ix] = index;
   }
   else
   {
      uint ix = tesselatorData.tmpIndices.size;
      tesselatorData.tmpIndices.size++;
      indices[ix] = index;
   }
}

static void CALLBACK tessPrimEnd(TessPrimData tesselatorData)
{
   if(tesselatorData.which != triangles)
   {
      TessPrim * prim;
      uint ix = tesselatorData.primitives.size;
      tesselatorData.primitives.size++;
      prim = &tesselatorData.primitives[ix];
      prim->type = tesselatorData.which;
      prim->count = tesselatorData.tmpIndices.count;
      prim->indices = new uint32[prim->count];
      memcpy(prim->indices, &tesselatorData.tmpIndices[0], sizeof(uint) * prim->count);
   }
}

static void CALLBACK tessPrimCombine(GLdouble coords[3], Pointf *d[4],
                                     GLfloat w[4], Pointf **dataOut,
									          TessPrimData tesselatorData)
{
   CombineVertex vertex
   {
      position = { (float)coords[0], (float)coords[1] };
      id = tesselatorData.combineVertices.count;
   };
   *dataOut = &vertex.position;
   tesselatorData.combineVertices.Add(vertex);
}

void tesselatePolygon(Array<Pointf> area, Array<Pointf> * outputPtr, Array<TessPrim> * primitivesPtr)
{
   tesselatePolygonEx(area, null, outputPtr, primitivesPtr);
}

void tesselatePolygonEx(Array<Pointf> area, Array<Array<Pointf>> inner, Array<Pointf> * outputPtr, Array<TessPrim> * primitivesPtr)
{
	int i, j, d;
   Pointf * destPoints;
   int totalCount = area.count;
   int start = 0;
   Array<Pointf> output { };
   Array<TessPrim> primitives { minAllocSize = 16 };
   Array<CombineVertex> combineVertices { };

   static TessPrimData tesselatorData;

   if(inner)
      for(j = 0; j < inner.count; j++)
         totalCount += inner[j].count;

   tessMutex.Wait();

   output.size = totalCount;
   destPoints = &output[0];

   tesselatorData.primitives = primitives;
   tesselatorData.combineVertices = combineVertices;
   tesselatorData.tmpIndices = { minAllocSize = 16 };
   tesselatorData.triIndices = { minAllocSize = 16 };
   tesselatorData.output = output;

   vertices.size = totalCount;

   {
      int n = area.count;
      d = 0;
      for(i = 0; i < n; i++, d++)
      {
         destPoints[d] = area[i];
         vertices[d] = { area[i].x, area[i].y };
      }

      if(inner)
      {
         for(j = 0; j < inner.count; j++)
         {
            Array<Pointf> contour = inner[j];
            n = contour.count;

            for(i = n-1; i >= 0; i--, d++)
            {
               destPoints[d] = contour[i];
               vertices[d] = { contour[i].x, contour[i].y };
            }
         }
      }
   }

   if(!butterburTesselator)
   {
      butterburTesselator = gluNewTess();

      gluTessCallback(butterburTesselator, GLU_TESS_BEGIN_DATA,  (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimBegin);
      gluTessCallback(butterburTesselator, GLU_TESS_END_DATA,    (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimEnd);
      gluTessCallback(butterburTesselator, GLU_TESS_VERTEX_DATA,  (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimVertex);
      gluTessCallback(butterburTesselator, GLU_TESS_COMBINE_DATA, (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimCombine);

      gluTessProperty(butterburTesselator, GLU_TESS_BOUNDARY_ONLY, GL_FALSE);
      gluTessProperty(butterburTesselator, GLU_TESS_WINDING_RULE, GLU_TESS_WINDING_POSITIVE);
   }

   gluTessBeginPolygon(butterburTesselator, &tesselatorData);

   start = 0;
   {
      int n = area.count;
      if(n && !selfIntersects(area))
      {
         gluTessBeginContour(butterburTesselator);
         d = start;
         start += n;

         for(i = 0; i < n; i++, d++)
            gluTessVertex(butterburTesselator, (double *)&vertices[d], &destPoints[d]);
         gluTessEndContour(butterburTesselator);

         if(inner)
         {
            for(j = 0; j < inner.count; j++)
            {
               Array<Pointf> contour = inner[j];
               n = contour.count;
               start += n;

               gluTessBeginContour(butterburTesselator);
               for(i = 0; i < n; i++, d++)
                  gluTessVertex(butterburTesselator, (double *)&vertices[d], &destPoints[d]);
               gluTessEndContour(butterburTesselator);
            }
         }
      }
      else
         start += n;
   }

   gluTessEndPolygon(butterburTesselator);

   if(combineVertices.count)
   {
      int c;
      int count = output.count;

      output.size = count + combineVertices.count;
      for(c = 0; c < combineVertices.count; c++)
      {
         CombineVertex vertex = combineVertices[c];
         output[count++] = vertex.position;
         delete vertex;
      }
   }
   delete combineVertices;

   if(tesselatorData.triIndices && tesselatorData.triIndices.count)
   {
      uint ix = primitives.size;
      TessPrim * prim;
      primitives.size++;
      prim = &primitives[ix];
      prim->type = triangles;
      prim->count = tesselatorData.triIndices.count;
      prim->indices = new uint[prim->count];
      memcpy(prim->indices, &tesselatorData.triIndices[0], sizeof(uint) * prim->count);
   }

   primitives.minAllocSize = 0;
   delete tesselatorData.triIndices;
   delete tesselatorData.tmpIndices;

   *outputPtr = output;
   *primitivesPtr = primitives;

   tessMutex.Release();
}
