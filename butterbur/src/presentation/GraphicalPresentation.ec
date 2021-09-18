public import IMPORT_STATIC "ecere"

#include "gl123es.h"

import "DrawingManager"
import "shapesTesselation"

private static inline double signedVolume(Vector3D a, Vector3D b, Vector3D c, Vector3D d)
{
   Vector3D e1 { b.x - a.x, b.y - a.y, b.z - a.z };
   Vector3D e2 { c.x - a.x, c.y - a.y, c.z - a.z };
   Vector3D e3 { d.x - a.x, d.y - a.y, d.z - a.z };
   Vector3D cross;
   cross.CrossProduct(e1, e2);
   return cross.DotProduct(e3) / 6;
}

bool pickPrimitives(Mesh mesh, PrimitiveSingle primitive,
   Line rayLocal, Plane * localPickingPlanes, Vector3D rayDiff, Vector3D rayIntersect, uint64 * id)
{
   PrimitiveGroupType primType = primitive != null ? primitive.type : triangles;
   Plane * planes = localPickingPlanes;
   int c = 0;
   int nIndex = 1, nPoints = 1;
   bool result = false;
   int nVertices = primitive != null ? (primType.vertexRange ? primitive.nVertices : primitive.nIndices) : 0;
   int strip = 1;
   Vector3Df tmp;
   bool i32bit = primitive != null ? primType.indices32bit : true;
   uint32 * indices32 = primitive != null ? primitive.indices32 : mesh.indices;
   uint16 * indices16 = primitive != null ? primitive.indices : null;
   bool usePickingPlanes = false; // TODO: Review this... was only set to true in 'orbitWithMouse' sample?
   bool intersecting = true;
   Vector3D points[50];
   Vector3D q1 = rayLocal.p0;
   Vector3D q2
   {
      rayLocal.p0.x + rayLocal.delta.x * 100000,
      rayLocal.p0.y + rayLocal.delta.y * 100000,
      rayLocal.p0.z + rayLocal.delta.z * 100000
   };
   Array<MeshPart> parts = mesh.parts;
   int p;

   if(id) *id = 0;

   if(!mesh.vertices) return false; // Need vertices here...

   for(p = 0; p < (parts ? parts.count : 1); p++)
   {
      MeshPart * part = parts ? &parts[p] : null;
      int offset = 0;
      int start = part ? 3*part->start : 0;
      int end = start + (part ? 3*part->count : nVertices);

      switch(primType.primitiveType)
      {
         case triangles: nIndex = 3; nPoints = 3; break;
         case quads: nIndex = 4; nPoints = 4; break;
         case triStrip:
         case triFan:
            nIndex = 1; nPoints = 3;
            offset = 2;
            start = 2;
            tmp = primType.vertexRange ? mesh.vertices[primitive.first] : mesh.vertices[(i32bit ? indices32[0] : indices16[0])];
            points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
            tmp = primType.vertexRange ? mesh.vertices[primitive.first+1] : mesh.vertices[(i32bit ? indices32[1] : indices16[1])];
            points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
            break;
      }

      for(c = start; c < end; c += nIndex)
      {
         bool outside = false;

         if(!usePickingPlanes)
         {
            int i, n = nPoints;

            if(primType.vertexRange)
            {
               if(primType.primitiveType == triStrip)
               {
                  tmp = mesh.vertices[primitive.first + (c & 1) ? (c - 1) : (c - 2)];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[primitive.first + (c & 1) ? (c - 2) : (c - 1)];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               else if(primType.primitiveType == triFan)
               {
                  tmp = mesh.vertices[primitive.first + 0];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[primitive.first + c - 1];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               for(i = 0; i<nIndex; i++)
               {
                  tmp = mesh.vertices[primitive.first + c+i];
                  points[i + offset] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
            }
            else
            {
               if(primType.primitiveType == triStrip)
               {
                  i = (c & 1) ? (c - 1) : (c - 2);
                  tmp = mesh.vertices[(i32bit ? indices32[i] : indices16[i])];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };

                  i = (c & 1) ? (c - 2) : (c - 1);
                  tmp = mesh.vertices[(i32bit ? indices32[i] : indices16[i])];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               else if(primType.primitiveType == triFan)
               {
                  tmp = mesh.vertices[(i32bit ? indices32[0] : indices16[0])];
                  points[0] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
                  tmp = mesh.vertices[(i32bit ? indices32[c-1] : indices16[c-1])];
                  points[1] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
               for(i = 0; i<nIndex; i++)
               {
                  tmp = mesh.vertices[(i32bit ? indices32[c+i] : indices16[c+i])];
                  points[i + offset] = { (double)tmp.x, (double)tmp.y, (double)tmp.z };
               }
            }

            if(planes)
            {
               int p;
               Vector3D newPoints[50];
               byte goodPoints[50];
               //#define THRESHOLD           -1
               //#define THRESHOLD           -0.25
               #define THRESHOLD           -0.0025

               for(p = 0; p < 6; p++)
               {
                  Plane * plane = &planes[p];
                  int i;
                  int numGoodPoints = 0;

                  memset(goodPoints, 0, n);
                  for(i = 0; i < n; i++)
                  {
                     double dot = plane->normal.DotProduct(points[i]);
                     double distance = dot + plane->d;
                     if(distance > THRESHOLD)
                     {
                        numGoodPoints++;
                        goodPoints[i] = 1;
                     }
                  }
                  if(!numGoodPoints)
                  {
                     outside = true;
                     break;
                  }
                  if(numGoodPoints < n)
                  {
                     // Clip the polygon
                     int newN = 0;
                     int lastGood = -1;
                     int j;

                     for(j = 0; j<n; )
                     {
                        if(goodPoints[j])
                        {
                           newPoints[newN++] = points[j];
                           lastGood = j++;
                        }
                        else
                        {
                           Line edge;
                           int next;

                           if(lastGood == -1)
                              for(lastGood = n-1; !goodPoints[lastGood]; lastGood--);

                           edge.p0 = points[lastGood];
                           edge.delta.Subtract(points[j], edge.p0);
                           plane->IntersectLine(edge, newPoints[newN++]);

                           for(next = j+1; next != j; next++)
                           {
                              if(next == n) next = 0;
                              if(goodPoints[next])
                              {
                                 int prev = next - 1;
                                 if(prev < 0) prev = n-1;

                                 edge.p0 = points[prev];
                                 edge.delta.Subtract(points[next], edge.p0);
                                 plane->IntersectLine(edge, newPoints[newN++]);
                                 break;
                              }
                           }
                           if(next <= j)
                              break;
                           else
                              j = next;
                        }
                     }
                     // Use the new points
                     memcpy(points, newPoints, newN * sizeof(Vector3D));
                     n = newN;
                  }
               }
            }
            else
            {
               // New method for arbitrary ray based on signed volumes of tetrahedrons formed by
               // triangles points and a very long line
               // TODO: Optimize this
               Vector3D * p1 = &points[0], * p2 = &points[1], * p3 = &points[2];
               int s1 = Sgn(signedVolume(q1, p1, p2, p3));
               int s2 = Sgn(signedVolume(q2, p1, p2, p3));
               int s3 = Sgn(signedVolume(q1, q2, p1, p2));
               int s4 = Sgn(signedVolume(q1, q2, p2, p3));
               int s5 = Sgn(signedVolume(q1, q2, p3, p1));
               if(s1 != s2 && s3 == s4 && s4 == s5);
               else
                  outside = true;
            }
         }

         if(!outside)
         {
            result = true;

            // TODO: Implement intersection with TriStrip, TriFan...
            if(intersecting)
            {
               // Intersect primitives
               Plane plane;
               Vector3D intersect, diff;
               int i0 = c, i1 = c+1, i2 = c+2;

               if(primType == triStrip)
               {
                  i0 = (c & 1) ? (c - 1) : (c - 2);
                  i1 = (c & 1) ? (c - 2) : (c - 1);
                  i2 = c;
               }
               else if(primType == triFan)
               {
                  i0 = 0;
                  i1 = c - 1;
                  i2 = c;
               }

               if(primType.vertexRange)
                  plane.FromPointsf(
                     mesh.vertices[primitive.first + i0],
                     mesh.vertices[primitive.first + i1],
                     mesh.vertices[primitive.first + i2]);
               else
                  plane.FromPointsf(
                     mesh.vertices[(i32bit ? indices32[i0] : indices16[i0])],
                     mesh.vertices[(i32bit ? indices32[i1] : indices16[i1])],
                     mesh.vertices[(i32bit ? indices32[i2] : indices16[i2])]);

               plane.IntersectLine(rayLocal, intersect);
               diff.Subtract(intersect, rayLocal.p0);
               diff.x /= rayLocal.delta.x;
               diff.y /= rayLocal.delta.y;
               diff.z /= rayLocal.delta.z;
               if(diff.x < rayDiff.x || diff.y < rayDiff.y || diff.z < rayDiff.z)
               {
                  if(part)
                     *id = part->id;

                  rayDiff = diff;
                  rayIntersect = intersect;
               }
            }
            else
               break;
         }

         switch(primType)
         {
            case triStrip:
               points[strip] = points[2];
               strip ^= 1;
               break;
            case triFan:
               points[1] = points[2];
               break;
         }
      }
   }
   return result;
}

int pickMesh(const Boxf region, int maxResults, PickResult * results, Line rayLocal, Plane * localPickingPlanes, Mesh mesh)
{
   int nPicks = 0;
   Vector3D rayDiff { MAXFLOAT, MAXFLOAT, MAXFLOAT };
   Vector3D rayIntersect { MAXFLOAT, MAXFLOAT, MAXFLOAT };
   uint64 resultID = 0;

   // TODO: Support multiple results ?

   if(mesh.indices)
   {
      uint64 id;
      if(pickPrimitives(mesh, null, rayLocal, localPickingPlanes, rayDiff, rayIntersect, &id))
      {
         // TODO: Compare result depth
         resultID = id;
      }
   }
   else if(mesh.groups.first)
   {
      PrimitiveGroup group;

      for(group = mesh.groups.first; group; group = group.next)
      {
         uint64 id;
         if(pickPrimitives(mesh, (PrimitiveSingle *)&group.type, rayLocal, localPickingPlanes, rayDiff, rayIntersect, &id))
         {
            // TODO: Compare result depth
            resultID = id;
         }
      }
   }
   /*else
   {
      int c;
      for(c = 0; c < mesh.nPrimitives; c++)
      {
         uint64 id;
         if(pickPrimitives(mesh, mesh.primitives[c], pickContext, rayDiff, rayIntersect, &id))
         {
            // TODO: Compare result depth
            resultID = id;
         }
      }
   }*/
   if(resultID)
   {
      results[nPicks] = { id = resultID };
      nPicks++;
   }
   return nPicks;
}

int pickObject(const Boxf region, int maxResults, PickResult * results, Line rayLocal, Plane * localPickingPlanes, Object model)
{
   Object c;
   int nPicks = 0;

   if(model.mesh)
   {
      nPicks += pickMesh(region, maxResults, results, rayLocal, localPickingPlanes, model.mesh);
   }

   for(c = model.firstChild; c; c = c.next)
   {
      nPicks += pickObject(region, maxResults - nPicks, results + nPicks, rayLocal, localPickingPlanes, c);
   }
   return nPicks;
}

public struct StartAndCount { uint start, count; };
public class GraphicalPresentation : Presentation
{
   GraphicalElement ge;
   GEType geType;
   // float cTransform[3]; // The total transform applied to a leaf graphical element.  Calculated from local transform of all containing elements
   Transform transform; // The transform applied at this specific level of the hierarchy
   transform.scaling = { 1, 1, 1 };

   Map<Color, Array<uint64>> modelColorMap;
   bool updateModelColorMap;

   // REVIEW: Should we allocate separate side data for specific implementations?
  // union  // REVIEW: image is non-null with the union?
  // {
      // For Shape
      struct
      {
         uint commandsCount; //Number of draw commands this takes to draw
         uint vertexBase, fillBase, lineBase;
         TesselatedShape tShape;
      };

      // For Text

      // For Image
      void * image;
      int imgW, imgH;

      // For Path3D
      uint vCount;

      // For Multi

      // For Model
      Object model;
//   };

   vertexBase = -1, fillBase = -1, lineBase = -1;

public:

   ~GraphicalPresentation()
   {
      // TODO: Free buffers and stuff from MD

      delete ge;
      switch(geType)
      {
         case shape: tShape.free(); break;
      }
   }

   property Object modelObject
   {
      set { model = value; geType = model; }
      get { return model; }
   }

   property Map<Color, Array<uint64>> modelColorMap
   {
      set
      {
         // if(value != modelColorMap)
         {
            modelColorMap = value;
            updateModelColorMap = true;
         }
      }
   }

   property GraphicalElement graphic
   {
      set
      {
         delete ge;
         switch(geType)
         {
            // TODO: buffers and stuff...
            case shape:
            {
               tShape.free();
               vertexBase = -1;
               break;
            }
         }

         ge = value;
         geType = ge ? ge.type : none;

         needUpdate = true;
         if(ge) incref ge;
      }
      get { return ge; }
   }

   property Transform transform3D
   {
      set { transform = value; }
      get { value = transform; }
   };
   property Pointf position2D
   {
      set { transform.position = { value.x, value.y, 0 }; }
      get { value = { (float)transform.position.x, (float)transform.position.y }; }
   };
   property Vector3D position3D
   {
      set { transform.position = value; }
      get { value = transform.position; }
   };
   property Degrees orientation2D
   {
      // FIXME: This Quaternion storage is quite inefficient for 2D...
      set { transform.orientation.Yaw(value); }
      get { Euler euler; euler.FromQuaternion(transform.orientation, yxz); return euler.yaw; }
   };
   property Quaternion orientation3D
   {
      set { transform.orientation = value; }
      get { value = transform.orientation; }
   };
   property float scaling
   {
      set { transform.scaling = { value, value, value }; }
      get { return transform.scaling.x; }
   }
   property Pointf scaling2D
   {
      set { transform.scaling = { value.x, value.y, 1 }; }
      get { value = { transform.scaling.x, transform.scaling.y }; }
   };
   property Vector3Df scaling3D
   {
      set { transform.scaling = value; }
      get { value = transform.scaling; }
   };

   void calculate(Presentation topPres, PresentationManager mgr)
   {
      if(needUpdate)
      {
         if(!rdrFlags) // || reassigned // TODO: Support re-assigning to different parent hierarchy
         {
            MultiPresentation p = parent;
            switch(geType)
            {
               case shape: rdrFlags = p.anchored ? { bbShapes = true }: { overlay = true }; break;
               case text: case image: rdrFlags = p.anchored ? { bbTextAndImages = true } : { overlayText = true }; break;
               case model: case path3D: rdrFlags = { perspective = true }; break;
            }
         }

         switch(geType)
         {
            case shape:
            {
               // TODO: Graphic change flag and freeing old buffers
               if(vertexBase == -1)
               {
                  Shape shp = (Shape)ge;
                  MDManager dm = rdrFlags.bbShapes ? mgr.shapeBillboardDM : mgr.shapeOverlayDM;

                  // TODO: Optimize when re-tesselation needed?
                  tShape.tesselate(shp);

                  if(tShape.fillCount)
                     fillBase = dm.md.allocateIx(tShape.fillCount, sizeof(tShape.ixFill[0]), tShape.ixFill);
                  else
                     fillBase = -1;

                  vertexBase = dm.md.allocateVbo(tShape.vCount, sizeof(tShape.points[0]), tShape.points);
                  lineBase = dm.md.allocateIx(tShape.ixCount, sizeof(tShape.ix[0]), tShape.ix);

                  //tShape.free();  TOCHECK: Currently not freeing this for easier calculation of if a point is within a shape
                  tShape.vCount = 0;

                  // TODO: Calculate combined transform
               }
               break;
            }
            case image:
            {
               Image img = (Image)ge;
               //TIManager dm = rdrFlags.bbTextAndImages ? mgr.tiBillboardDM : mgr.tiOverlayDM;
               // TODO: prepare 4 points geometry here instead?
               if(!image)
               {
                  Bitmap bmp { };
                  Bitmap glBmp;
                  uint tex;

                  bmp.Load(img.image.path, null, null);
                  glBmp = bmp.ProcessDD(false, 0, 0, 16384, 0);
                  if(glBmp)
                  {
                     glGenTextures(1, &tex);
                     glBindTexture(GL_TEXTURE_2D, tex);
                     glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
                     glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
                     glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
                     glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, bmp.width, bmp.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, glBmp.picture);
                     imgW = bmp.width;
                     imgH = bmp.height;
                     // TODO: Image alignment? (Currently handled in prepareDraw())
                     image = LWDrawManager::defineImage(tex, 0, 0, bmp.width, bmp.height, 1, 0, 0);
                     delete glBmp;
                  }
                  delete bmp;
               }
               break;
            }
            case model:
            {
               Model mdl = (Model)ge;
               Object m = this.model;
               // MDManager dm = mgr.perspective3DDM;
               if(m)
               {
                  if(m.mesh)
                  {
                     PrimitiveGroup g = m.mesh ? m.mesh.groups.first : null;
                     if(g)
                     {
                        Material m = g.material;
                        if(ge && m.opacity != ge.opacity)
                           m.opacity = ge.opacity;
                     }
                  }
               }
               else if(mdl)
               {
                  Object object { };

                  if(object.LoadEx(mdl.model.path, null, displaySystem, null))
                  {
                     Material mat { };
                     // mat.flags.partlyTransparent = true;
                     mat.diffuse = slateGray;
                     mat.specular = slateGray;
                     mat.opacity = ge.opacity; //1.0;// 0.75;
                     mat.shader = butterburShader;
                     object.mesh.ApplyMaterial(mat);
                     model = object;
                  }
                  else
                     delete object;
               }

               if(updateModelColorMap && model && model.mesh && model.mesh.parts && modelColorMap)
               {
                  Mesh mesh = model.mesh;
                  uint32 * indices = mesh.indices;
                  if(indices)
                  {
                     Array<MeshPart> parts = mesh.parts;
                     PrimitiveGroup group;
                     Map<Color, Array<uint64>> colorMap = modelColorMap;
                     int i;
                     Map<uint64, StartAndCount> partsMap { };

                     for(i = 0; i < parts.count; i++)
                        partsMap[parts[i].id] = { parts[i].start, parts[i].count };

                     while((group = mesh.groups.first))
                        mesh.FreePrimitiveGroup(group);

                     for(c : colorMap)
                     {
                        Color color = &c;
                        Material mat { };
                        int nIndices = 0;
                        Array<uint64> p = c;

                        mat.diffuse = color;
                        mat.specular = color;
                        mat.ambient = color;
                        mat.opacity = 1.0;
                        mat.shader = butterburShader;

                        for(i = 0; i < p.count; i++)
                        {
                           MapIterator<uint64, StartAndCount> it { map = partsMap };
                           if(it.Index(p[i], false))
                           {
                              StartAndCount part = it.data;
                              nIndices += 3*part.count;
                           }
                        }

                        group = mesh.AddPrimitiveGroup({ triangles, indices32bit = true }, nIndices);
                        group.material = mat;

                        nIndices = 0;
                        for(i = 0; i < p.count; i++)
                        {
                           MapIterator<uint64, StartAndCount> it { map = partsMap };
                           if(it.Index(p[i], false))
                           {
                              StartAndCount part = it.data;
                              memcpy(group.indices32 + nIndices, indices + 3*part.start, 3*part.count * sizeof(uint32));
                              nIndices += 3*part.count;
                           }
                        }
                        mesh.UnlockPrimitiveGroup(group);
                     }
                     delete partsMap;
                  }
                  updateModelColorMap = false;
               }
               break;
            }
            case text:
            {
               // Text txt = (Text)ge;
               // TIManager dm = rdrFlags.bbTextAndImages ? mgr.tiBillboardDM : mgr.tiOverlayDM;
               // TODO: morphing and glyph conversion here instead?
               break;
            }
            case path3D:
            {
               Path3D p3d = (Path3D)ge;
               MDManager dm = mgr.perspective3DDM;
               Array<Vector3Df> nodes = *(Array<Vector3Df> *)&p3d.nodes;

               if(vertexBase == -1)
               {
                  vertexBase = dm.md.allocateVbo(nodes.count, sizeof(nodes[0]), nodes.array);
                  vCount = nodes.count;
               }
               break;
            }
            case multi:
            {
               /*
               MultiGraphicalElement mge = (MultiGraphicalElement)ge;
               for(e : mge.elements)
               {
               }
               */
               break;
            }
         }
         needUpdate = false;
      }
   }

   void prepareDraw(RenderPassFlags renderFlags, MDManager dm, const float * transform)
   {
      if(rdrFlags & renderFlags)
      {
         GraphicalElement ge = this.ge;
         float cTransform[12];

         if(renderFlags.perspective)
         {
            // Full blown 3D transform
            Transform * t = &this.transform;
            Quaternion * o = &t->orientation;
            Transform lt
            {
               { t->position.x, -t->position.y, t->position.z },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               { o->w, o->x, -o->y, -o->z },
               t->scaling
            };
            Transform * gt = ge ? &ge.transform : null;
            Quaternion * go = gt ? &gt->orientation : null;
            Transform glt
            {
               gt ? { gt->position.x, -gt->position.y, gt->position.z } : { },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               go ? { go->w, go->x, -go->y, -go->z } : { },
               gt ? gt->scaling : { 1,1,1 }
            };
            Matrix gTransform = glt;
            Matrix lTransform = lt;
            Matrix parent
            { {
               transform[ 0], transform[ 1], transform[ 2], 0,
               transform[ 3], transform[ 4], transform[ 5], 0,
               transform[ 6], transform[ 7], transform[ 8], 0,
               transform[ 9], transform[10], transform[11], 1
            } };
            Matrix combined;
            // TODO: Could we reduce the number of matrix multiplications?
            combined.Multiply3x4(lTransform, gTransform);
            lTransform = combined;
            combined.Multiply3x4(lTransform, parent);

            cTransform[0] = (float)combined.m[0][0], cTransform[ 1] = (float)combined.m[0][1], cTransform[ 2] = (float)combined.m[0][2];
            cTransform[3] = (float)combined.m[1][0], cTransform[ 4] = (float)combined.m[1][1], cTransform[ 5] = (float)combined.m[1][2];
            cTransform[6] = (float)combined.m[2][0], cTransform[ 7] = (float)combined.m[2][1], cTransform[ 8] = (float)combined.m[2][2];
            cTransform[9] = (float)combined.m[3][0], cTransform[10] = (float)combined.m[3][1], cTransform[11] = (float)combined.m[3][2];
         }
         else
         {
            // TODO: 2D Rotation and scaling support...
            cTransform[0] = (float)(transform[0] + this.transform.position.x + ge.transform.position.x);
            cTransform[1] = (float)(transform[1] + this.transform.position.y + ge.transform.position.y);
            cTransform[2] = 0;
         }
         switch(geType)
         {
            case shape:
            {
               Shape shp = (Shape)ge;
               ShapesManager sm = (ShapesManager)dm;
               Stroke stroke = shp.stroke;

               if(tShape.fillCount)
               {
                  Fill fill = shp.fill;
                  ColorAlpha color { (byte)(shp.opacity * fill.opacity * 255), fill.color };
                  sm.addCommand(color, tShape.fillCount, fillBase, vertexBase, cTransform);
               }
               if(stroke.width)
               {
                  ColorAlpha color { (byte)(shp.opacity * stroke.opacity * 255), stroke.color };
                  sm.addCommand(color, tShape.ixCount, lineBase, vertexBase, cTransform);
               }
               break;
            }
            case image:
            {
               Image img = (Image)ge;
               TIManager im = (TIManager)dm;

               // TODO: prepare 4 points geometry in advance?
               if(image)
               {
                  cTransform[0] -= ge.transform.scaling.x * img.hotSpot.x * imgW;
                  cTransform[1] -= ge.transform.scaling.y * img.hotSpot.y * imgH;
                  im.addImageCommand(image, imgW * ge.transform.scaling.x, imgH * ge.transform.scaling.y, img.opacity, img.tint, cTransform);
               }
               break;
            }
            case text:
            {
               Text txt = (Text)ge;
               TIManager tm = (TIManager)dm;

               // TODO: morphing and glyph conversion in calculate instead?
               if(txt.text)
                  tm.addTextCommand(txt.text, txt.font, txt.opacity, txt.alignment, cTransform);
               break;
            }
            case path3D:
            {
               Path3D p3d = (Path3D)ge;
               Perspective3DManager pm = (Perspective3DManager)dm;
               Stroke stroke = p3d.stroke;
               ColorAlpha color { (byte)(p3d.opacity * stroke.opacity * 255), stroke.color };

               pm.addCommand(color, vCount, vertexBase, cTransform);
               break;
            }
            case model:
            {
               Model mdl = (Model)ge;
               Perspective3DManager pm = (Perspective3DManager)dm;

               if(!mdl || mdl.opacity)
                  pm.addModelCommand(model, cTransform);
               break;
            }
            case multi:
            {
               /*
               MultiGraphicalElement mge = (MultiGraphicalElement)ge;
               Array<Vector3Df> offsets {};
               for (e : mge.elements)
               {
               }
               */
               break;
            }
         }
      }
   }

   int pick(const Boxf region, int maxResults, PickResult * results, const float * transform,
      const Matrix * vm, const Pointd * projParams)
   {
      if(rdrFlags.perspective)
      {
         if(model)
         {
            //float cTransform[12];
            // Full blown 3D transform
            Transform * t = &this.transform;
            Quaternion * o = &t->orientation;
            Transform lt
            {
               { t->position.x, -t->position.y, t->position.z },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               { o->w, o->x, -o->y, -o->z },
               t->scaling
            };
            Transform * gt = ge ? &ge.transform : null;
            Quaternion * go = gt ? &gt->orientation : null;
            Transform glt
            {
               gt ? { gt->position.x, -gt->position.y, gt->position.z } : { },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               go ? { go->w, go->x, -go->y, -go->z } : { },
               gt ? gt->scaling : { 1,1,1 }
            };
            Matrix gTransform = glt;
            Matrix lTransform = lt;
            Matrix parent
            { {
               transform[ 0], transform[ 1], transform[ 2], 0,
               transform[ 3], transform[ 4], transform[ 5], 0,
               transform[ 6], transform[ 7], transform[ 8], 0,
               transform[ 9], transform[10], transform[11], 1
            } };
            Matrix combined;
            int nPicks;
            Line rayView, rayWorld, rayLocal;

            // TODO: Could we reduce the number of matrix multiplications?
            combined.Multiply3x4(lTransform, gTransform);
            lTransform = combined;
            combined.Multiply3x4(lTransform, parent);
            /*
            cTransform[0] = (float)combined.m[0][0], cTransform[ 1] = (float)combined.m[0][1], cTransform[ 2] = (float)combined.m[0][2];
            cTransform[3] = (float)combined.m[1][0], cTransform[ 4] = (float)combined.m[1][1], cTransform[ 5] = (float)combined.m[1][2];
            cTransform[6] = (float)combined.m[2][0], cTransform[ 7] = (float)combined.m[2][1], cTransform[ 8] = (float)combined.m[2][2];
            cTransform[9] = (float)combined.m[3][0], cTransform[10] = (float)combined.m[3][1], cTransform[11] = (float)combined.m[3][2];
            */
            // Compute picking ray
            {
               Vector3D p;
               Matrix ivm;

               ivm.Transpose(vm);

               rayView.p0 = { 0, 0, 0 };
               p.x = (region.left + region.right) / 2;
               p.y = (region.top + region.bottom) / 2;
               p.z = 0.0f;

               rayView.delta.z = projParams[1].y / (p.z + projParams[1].x);
               rayView.delta.y = ((p.y - projParams[0].y) * rayView.delta.z / projParams[2].y);
               rayView.delta.x = ((p.x - projParams[0].x) * rayView.delta.z / projParams[2].x);

               // Convert ray to world space
               rayWorld.p0.MultMatrix(rayView.p0, ivm);
               p.MultMatrix(rayView.delta, ivm);

               rayWorld.delta.Subtract(p, rayWorld.p0);
            }

            // Transform ray
            {
               Vector3D p2, tp2;

               p2.Add(rayWorld.p0, rayWorld.delta);
               rayLocal.p0.DivideMatrix(rayWorld.p0, combined);
               tp2.DivideMatrix(p2, combined);
               rayLocal.delta.Subtract(tp2, rayLocal.p0);
            }

            nPicks = pickObject(region, maxResults, results, rayLocal, null, model);
            if(nPicks)
            {
               results[0].presentation = this;
            }
            return nPicks;
         }
      }
      else
      {
         Boxf tRegion
         {
            region.left - transform[0], region.top - transform[1],
            region.right - transform[0], region.bottom - transform[1]
         };

         // TODO: Proper full box test, not middle point
         if(containsPoint((tRegion.left + tRegion.right)/2, (tRegion.top + tRegion.bottom)/2))
         {
            results[0] = { this, element = graphic };
            return 1;
         }
      }
      return 0;
   }

   // Checks if the point is within the GraphicalElement
   // Currently only good for overlaid elements
   // Split into methods for different types of GEs to make it easier to see where to add improvements to this rather rough current method
   private static bool containsPoint(float x, float y)
   {
      float tx, ty;

      if(!(rdrFlags & { overlay = true, overlayText = true, bbShapes = true, bbTextAndImages = true }))
         return false;

      tx = x - (float)(transform.position.x + ge.transform.position.x);
      ty = y - (float)(transform.position.y + ge.transform.position.y);

      switch(geType)
      {
         case shape: return shapeContainsPoint(tx, ty);
         case image: return imageContainsPoint(tx, ty);
         case text:  return false; //Can't click text without some glyph size calculations
      }
      return false;
   }

   private bool imageContainsPoint(float x, float y)
   {
      // TODO: Check hotspot, alpha channels (can't click a transparent portion of image), etc
      // Something isn't working quite right here, imgW and imgH both show up in debug watch as 0 when they clearly have a value so this might be related?
      Image img = (Image)ge;
      float w = imgW * ge.scaling2D.x;
      float h = imgH * ge.scaling2D.y;
      x += w * img.hotSpot.x;
      y += h * img.hotSpot.y;
      return (x >= 0 && y >= 0 && x < w && y < h);
   }

   private bool shapeContainsPoint(float x, float y)
   {
      // Shape shp = (Shape)ge;
      Pointf checkedPoint { x, y };

      // Temporary catch-all solution: loop through all triangles of tesselated shape and check the point in each one.
      int i;
      bool result = false;
      Pointf * points = tShape.points;

      uint16 * ix = tShape.ix;
      uint16 * ixFill = tShape.ixFill;

      // TOCHECK: It seems like I need these temp variables or the value is not read correctly for the loop??
      uint fillCount =  tShape.fillCount;
      uint ixCount = tShape.ixCount;

      // Checking ixFill, the indices that make up the fill of the shape
      if(tShape.fillCount)
      {
         for(i = 0; i < (int)fillCount - 2; i++)
         {
            result = pointInsideTriangle(checkedPoint, points[ixFill[i]], points[ixFill[i+1]], points[ixFill[i+2]]);
            if(result)
               return result;
         }
      }

      // Checking ix, the indices that make up the outline of the shape
      for(i = 0; i < (int)ixCount - 2; i++)
      {
         result = pointInsideTriangle(checkedPoint, points[ix[i]], points[ix[i+1]], points[ix[i+2]]);
         if(result)
            return result;
      }

      return false;

      // Specialized checking for certain shape types.  Currently unused, using general check above instead.
/*
      switch (shp.shpType)
      {
         case rectangle:
         {
            return ((RoundedRectangle)shp).box.IsPointInside({x, y});
         }
         case ellipse:
         {
            Ellipse ell = (Ellipse)shp;
            int dx = x - ell.center.x;
            int dy = y - ell.center.y;
            float r = sqrt(dx*dx+dy*dy);
            return (r < ell.radius); //TODO: Account for k in ellipse
            break;
         }
         case arc:
         {
            Arc arc = (Arc)shp;
            if (arc.arcType == open)
               return false; //Has no area so can't click

            int dx = x - arc.center.x;
            int dy = y - arc.center.y;
            float r = sqrt(dx*dx+dy*dy);
            if (r > arc.radius || r < arc.innerRadius)
               return false; // Outside the arc regardless of angle

            //Check angle here
            return true;

         }
         case path:
         {
            Path p = (Path)shp;
            InsideReturn isInside = pointInside(*(Array<Vector3Df> *)&p.nodes, {x, y}, 0);
            return isInside == inside;
         }
      }
*/
   }
}

private:
static enum InsideReturn { outside, inside, onTheEdge };

static inline double ::fromLine(const Pointf p, const Pointf a, const Pointf b)
{
   return ((double)b.x - a.x) * ((double)p.y - a.y) - ((double)p.x - a.x) * ((double)b.y - a.y);
}

// For detecting if a point is in a shape using the tesselated shape.
#define signedArea(p1, p2, p3) fromLine(p3, p1, p2)

static bool pointInsideTriangle(Pointf p, Pointf v1, Pointf v2, Pointf v3)
{
   int s1 = Sgn(signedArea(p, v1, v2));
   int s2 = Sgn(signedArea(p, v2, v3));
   int s3 = Sgn(signedArea(p, v3, v1));
   return s1 && s1 == s2 && s2 == s3;
}

#if 0
static InsideReturn pointInside(Array<Pointf> nodes, Pointf point, double e)
{
   Pointf * p = nodes.array;
   int count = nodes.count, winding = 0, i;
   for(i = 0; i < count; i++, p++)
   {
      Pointf * np = i == count - 1 ? nodes.array : p + 1;
      if(p->y <= point.y)
      {
         if(np->y > point.y)
         {
            double d = fromLine(point, p, np);
            if(d > e)
               winding++;
            else if(d > -e)
               return onTheEdge;
         }
      }
      else if(np->y <= point.y)
      {
         double d = fromLine(point, p, np);
         if(d < -e)
            winding--;
         else if(d < e)
            return onTheEdge;
      }
   }
   return winding != 0 ? inside : outside;
}
#endif
