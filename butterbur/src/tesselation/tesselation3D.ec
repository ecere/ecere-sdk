#define property _property
#include <glutess.h>
#undef property

public import IMPORT_STATIC "ecere"

#if defined(__WIN32__)
#define TESS_CALLBACK_FUNCTION_PROTOTYPE void (__stdcall*)(void)
#else
#define TESS_CALLBACK_FUNCTION_PROTOTYPE void *
#define CALLBACK
#endif

void * eC_malloc(unsigned int size);
void * eC_realloc(void * pointer, unsigned int size);
void eC_free(void * pointer);

Mutex tessMutex3D { };

static Array<Vector3D> vertices { };

/*static */ GLUtesselator * butterburTesselator3D = null;

static double ccw(Vector3Df a, Vector3Df b, Vector3Df c)
{
   // TODO: 3D Cross product
   return (((double)b.x - (double)a.x) * ((double)c.y - (double)a.y) - ((double)c.x - (double)a.x) * ((double)b.y - (double)a.y));
}

static bool selfIntersects(Array<Vector3Df> points)
{
   int i, j;
   for(i = 0; i < points.count; i++)
   {
      Vector3Df * ap = &points[i], * aq = &points[(i < points.count-1) ? i + 1 : 0];
      for(j = 0; j < points.count; j++)
      {
         Vector3Df * bp = &points[j], * bq = &points[(j < points.count-1) ? j + 1 : 0];
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

struct TessPrim3D
{
   GLIMTKMode type;
   uint count;
   uint32 * indices;
   void OnFree()
   {
      delete indices;
   }
};

struct TessPrimData3D
{
   GLIMTKMode which;

   Array<CombineVertex3D> combineVertices;
   Array<TessPrim3D> primitives;
   Array<uint> triIndices;
   Array<uint> tmpIndices;
   Array<Vector3Df> output;
};

class CombineVertex3D : struct
{
   Vector3Df position;
   int id;
};

static void CALLBACK tessPrimBegin(GLenum which, TessPrimData3D tesselatorData)
{
   tesselatorData.which = which == GL_TRIANGLES ? triangles : which == GL_TRIANGLE_STRIP ? triangleStrip : triangleFan;
   if(which != GL_TRIANGLES)
   {
      tesselatorData.tmpIndices.size = 0;
      if(tesselatorData.primitives.size + 1 > tesselatorData.primitives.minAllocSize)
         tesselatorData.primitives.minAllocSize += tesselatorData.primitives.minAllocSize / 2;
   }
}

static void CALLBACK tessPrimVertex(Vector3Df * point, TessPrimData3D tesselatorData)
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
      CombineVertex3D vertex = (CombineVertex3D)point;
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

static void CALLBACK tessPrimEnd(TessPrimData3D tesselatorData)
{
   if(tesselatorData.which != triangles)
   {
      TessPrim3D * prim;
      uint ix = tesselatorData.primitives.size;
      tesselatorData.primitives.size++;
      prim = &tesselatorData.primitives[ix];
      prim->type = tesselatorData.which;
      prim->count = tesselatorData.tmpIndices.count;
      prim->indices = new uint32[prim->count];
      memcpy(prim->indices, &tesselatorData.tmpIndices[0], sizeof(uint) * prim->count);
   }
}

static void CALLBACK tessPrimCombine(GLdouble coords[3], Vector3Df *d[4],
                                     GLfloat w[4], Vector3Df **dataOut,
									          TessPrimData3D tesselatorData)
{
   CombineVertex3D vertex
   {
      position = { (float)coords[0], (float)coords[1], (float)coords[2] };
      id = tesselatorData.combineVertices.count;
   };
   *dataOut = &vertex.position;
   tesselatorData.combineVertices.Add(vertex);
}

void tesselatePolygon3D(Array<Vector3Df> area, Array<Vector3Df> * outputPtr, Array<TessPrim3D> * primitivesPtr)
{
	int i, d;
   Vector3Df * destPoints;
   int totalCount = area.count;
   int start = 0;
   Array<Vector3Df> output { };
   Array<TessPrim3D> primitives { minAllocSize = 16 };
   Array<CombineVertex3D> combineVertices { };

   static TessPrimData3D tesselatorData;

   tessMutex3D.Wait();

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
         vertices[d] = { area[i].x, area[i].y, area[i].z };
      }
   }

   if(!butterburTesselator3D)
   {
      butterburTesselator3D = gluNewTess();

      gluTessCallback(butterburTesselator3D, GLU_TESS_BEGIN_DATA,   (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimBegin);
      gluTessCallback(butterburTesselator3D, GLU_TESS_END_DATA,     (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimEnd);
      gluTessCallback(butterburTesselator3D, GLU_TESS_VERTEX_DATA,  (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimVertex);
      gluTessCallback(butterburTesselator3D, GLU_TESS_COMBINE_DATA, (TESS_CALLBACK_FUNCTION_PROTOTYPE)(void *)tessPrimCombine);

      gluTessProperty(butterburTesselator3D, GLU_TESS_BOUNDARY_ONLY, GL_FALSE);
      gluTessProperty(butterburTesselator3D, GLU_TESS_WINDING_RULE, GLU_TESS_WINDING_POSITIVE);
   }

   gluTessBeginPolygon(butterburTesselator3D, &tesselatorData);

   start = 0;
   {
      int n = area.count;
      if(n && true /*!selfIntersects(area)*/)
      {
         gluTessBeginContour(butterburTesselator3D);
         d = start;
         for(i = 0; i < n; i++, d++)
            gluTessVertex(butterburTesselator3D, (double *)&vertices[d], &destPoints[d]);
         gluTessEndContour(butterburTesselator3D);
      }
      start += n;
   }

   gluTessEndPolygon(butterburTesselator3D);

   if(combineVertices.count)
   {
      int c;
      int count = output.count;

      output.size = count + combineVertices.count;
      for(c = 0; c < combineVertices.count; c++)
      {
         CombineVertex3D vertex = combineVertices[c];
         output[count++] = vertex.position;
         delete vertex;
      }
   }
   delete combineVertices;

   if(tesselatorData.triIndices && tesselatorData.triIndices.count)
   {
      uint ix = primitives.size;
      TessPrim3D * prim;
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

   tessMutex3D.Release();
}
