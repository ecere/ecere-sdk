public import IMPORT_STATIC "ecere"
//private:

#include "gl123es.h"

import "DrawingManager"
import "shapesTesselation"

public struct StartAndCount { uint start, count; };

class GEImageData : struct
{
   void * image;
   int imgW, imgH;
   byte * alpha;

   ~GEImageData()
   {
      delete alpha;
   }
}

class GEShapeData : struct
{
   uint commandsCount;
   uint vertexBase; vertexBase = -1;
   uint fillBase; fillBase = -1;
   uint lineBase; lineBase = -1;
   TesselatedShape tShape;
   bool anchored; // To know which DrawManager (overlay or billboards) to free with...

   ~GEShapeData()
   {
      tShape.free();
   }
}

class GEPath3DData : GEShapeData
{
   uint vCount;
}

class GEModelData : struct
{
   Object model;
   bool freeModel;
   bool updateModelColorMap;
   Map<Color, Array<uint64>> modelColorMap;
}

class GETextData : struct
{
   Box box;
}

public void prepareDrawGE(RenderPassFlags flags, DrawingManager dm, GraphicalElement ge, float * cTransform)
{
   switch(ge.type)
   {
      case shape:
      {
         if(!ge.internal) break;
         if(flags.bbShapes || flags.overlay)
         {
            Shape shp = (Shape)ge;
            ShapesManager sm = (ShapesManager)dm;
            Stroke stroke = shp.stroke;
            GEShapeData shapeData = (GEShapeData)ge.internal;
            TesselatedShape tShape = shapeData.tShape;

            if(tShape.fillCount)
            {
               Fill fill = shp.fill;
               ColorAlpha color { (byte)(shp.opacity * fill.opacity * 255), fill.color };
               sm.addCommand(color, tShape.fillCount, shapeData.fillBase, shapeData.vertexBase, cTransform);
            }
            if(stroke.width)
            {
               ColorAlpha color { (byte)(shp.opacity * stroke.opacity * 255), stroke.color };
               sm.addCommand(color, tShape.ixCount, shapeData.lineBase, shapeData.vertexBase, cTransform);
            }
         }
         break;
      }
      case GEType::image:
      {
         Image img = (Image)ge;
         TIManager im = (TIManager)dm;
         GEImageData imageData = (GEImageData)ge.internal;

         if(!ge.internal) break;

         // TODO: prepare 4 points geometry in advance?
         if((flags.bbTextAndImages || flags.overlayText) && imageData && imageData.image)
         {
            cTransform[0] -= ge.transform.scaling.x * img.hotSpot.x * imageData.imgW;
            cTransform[1] -= ge.transform.scaling.y * img.hotSpot.y * imageData.imgH;
            im.addImageCommand(imageData.image, imageData.imgW * ge.transform.scaling.x, imageData.imgH * ge.transform.scaling.y, img.opacity, img.tint, cTransform);
         }
         break;
      }
      case text:
      {
         Text txt = (Text)ge;
         TIManager tm = (TIManager)dm;

         if((flags.bbTextAndImages || flags.overlayText) && txt.text)
            tm.addTextCommand(txt.text, txt.font, txt.opacity, txt.alignment, cTransform);
         break;
      }
      case path3D:
      {
         if(!ge.internal) break;
         if(flags.perspective)
         {
            Path3D p3d = (Path3D)ge;
            Perspective3DManager pm = (Perspective3DManager)dm;
            Stroke stroke = p3d.stroke;
            ColorAlpha color { (byte)(p3d.opacity * stroke.opacity * 255), stroke.color };
            GEPath3DData pathData = (GEPath3DData)ge.internal;
            pm.addCommand(color, pathData.vCount, pathData.vertexBase, cTransform);
         }
         break;
      }
      case GEType::model:
      {
         if(!ge.internal) break;
         if(flags.perspective)
         {
            Model mdl = (Model)ge;
            Perspective3DManager pm = (Perspective3DManager)dm;
            GEModelData modelData = (GEModelData)ge.internal;

            if(!mdl || mdl.opacity)
               pm.addModelCommand(modelData.model, cTransform);
         }
         break;
      }
      case multi:
      {
         MultiGraphicalElement mge = (MultiGraphicalElement)ge;
         float lTransform[12];
                                        // For now assuming 3 floats
         memcpy(lTransform, cTransform, 3 /*12*/ * sizeof(float));

         for(e : mge.elements)
         {
            GraphicalElement ce = e;
            // TODO: Proper 3D transforms
            lTransform[0] = (float)(cTransform[0] + ce.transform.position.x);
            lTransform[1] = (float)(cTransform[1] + ce.transform.position.y);
            prepareDrawGE(flags, dm, ce, lTransform);
         }
         break;
      }
      case instance:
      {
         GraphicInstance gi = (GraphicInstance)ge;
         if(gi.element)
         {
            float lTransform[12];
                                           // For now assuming 3 floats
            memcpy(lTransform, cTransform, 3 /*12*/ * sizeof(float));

            // TODO: Proper 3D transforms
            lTransform[0] = (float)(cTransform[0] + gi.element.transform.position.x);
            lTransform[1] = (float)(cTransform[1] + gi.element.transform.position.y);
            prepareDrawGE(flags, dm, gi.element, lTransform);
         }
         break;
      }
   }
}

public RenderPassFlags calculateGE(GraphicalElement ge, PresentationManager mgr, bool anchored)
{
   RenderPassFlags rdrFlags = 0;
   switch(ge.type)
   {
      case shape:
      {
         // TODO: Graphic change flag and freeing old buffers
         GEShapeData shapeData = (GEShapeData)ge.internal;
         if(!shapeData)
            ge.internal = shapeData = {};

         rdrFlags = anchored ? { bbShapes = true } : { overlay = true };
         shapeData.anchored = anchored;
         if(shapeData.vertexBase == -1)
         {
            Shape shp = (Shape)ge;
            MDManager dm = rdrFlags.bbShapes ? mgr.shapeBillboardDM : mgr.shapeOverlayDM;
            TesselatedShape * tShape = &shapeData.tShape;
            // TODO: Optimize when re-tesselation needed?
            tShape->tesselate(shp);

            if(tShape->fillCount)
               shapeData.fillBase = dm.md.allocateIx(tShape->fillCount, sizeof(tShape->ixFill[0]), tShape->ixFill);
            else
               shapeData.fillBase = -1;

            shapeData.vertexBase = dm.md.allocateVbo(tShape->vCount, sizeof(tShape->points[0]), tShape->points);
            shapeData.lineBase = dm.md.allocateIx(tShape->ixCount, sizeof(tShape->ix[0]), tShape->ix);

            //tShape->free();  TOCHECK: Currently not freeing this for easier calculation of if a point is within a shape
            // tShape->vCount = 0; // We need the count to free...
            // TODO: Calculate combined transform
         }
         break;
      }
      case image:
      {
         Image img = (Image)ge;
         GEImageData imageData = (GEImageData)ge.internal;
         rdrFlags = anchored ? { bbTextAndImages = true } : { overlayText = true };
         //TIManager dm = rdrFlags.bbTextAndImages ? mgr.tiBillboardDM : mgr.tiOverlayDM;
         // TODO: prepare 4 points geometry here instead?
         if(!imageData)
            ge.internal = imageData = { };
         if(!imageData.image)
         {
            Bitmap bmp { };

            // TODO: Share images (loadImage())
            if(bmp.Load(img.image.path, null, null))
            {
               ColorAlpha * color = (ColorAlpha *)bmp.picture;
               int i;
               uint size = bmp.width * bmp.height;
               Bitmap glBmp;

               imageData.alpha = new byte[size];
               for(i = 0; i < size; i++)
                  imageData.alpha[i] = color[i].a;

               glBmp = bmp.ProcessDD(false, 0, 0, 16384, 0, 0, 0);
               if(glBmp)
               {
                  uint tex;

                  glGenTextures(1, &tex);
                  glBindTexture(GL_TEXTURE_2D, tex);
                  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
                  glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
                  glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
                  //if(glBmp.keepData) // breaks things
                  glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, bmp.width, bmp.height, 0, GL_RGBA, GL_UNSIGNED_BYTE, glBmp.picture);
                  imageData.imgW = bmp.width;
                  imageData.imgH = bmp.height;
                  // TODO: Image alignment? (Currently handled in prepareDraw())
                  imageData.image = LWDrawManager::defineImage(tex, 0, 0, bmp.width, bmp.height, 1, 0, 0);
                  delete glBmp;
               }
            }
            delete bmp;
         }
         break;
      }
      case model:
      {
         GEModelData modelData = (GEModelData)ge.internal;
         Model mdl = (Model)ge;
         Object m;
         // MDManager dm = mgr.perspective3DDM;
         if(!modelData)
            ge.internal = modelData = {};
         m = modelData.model;//this.model;
         rdrFlags = { perspective = true };
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
               modelData.model = object;
               modelData.freeModel = true;
            }
            else
               delete object;
         }

         if(modelData.updateModelColorMap && modelData.model && modelData.model.mesh && modelData.model.mesh.parts && modelData.modelColorMap)
         {
            Mesh mesh = modelData.model.mesh;
            uint32 * indices = mesh.indices;
            if(indices)
            {
               Array<MeshPart> parts = mesh.parts;
               PrimitiveGroup group;
               Map<Color, Array<uint64>> colorMap = modelData.modelColorMap;
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
            modelData.updateModelColorMap = false;
         }
         break;
      }
      case text:
      {
         GETextData textData = (GETextData)ge.internal;
         Text txt = (Text)ge;
         if(txt.text && txt.text[0])
         {
            // TODO: morphing and glyph conversion here instead?
            TIManager tm = rdrFlags.bbTextAndImages ? mgr.tiBillboardDM : mgr.tiOverlayDM;
            Box box;
            int len = strlen(txt.text);
            int paddingWidth = Max(2, (int)(1+(txt.font ? txt.font.outline.size : 0)));
            LWFMHorizontalAlignment hAlign = txt.alignment.horzAlign == unset ? left : (LWFMHorizontalAlignment)(txt.alignment.horzAlign-1);
            LWFMVerticalAlignment vAlign = txt.alignment.vertAlign == top ? top : txt.alignment.vertAlign == middle ? middle : bottom ;
            LWFMFont lwfmFont = tm.fontManager.getFont(txt.font);
            if(!textData)
               ge.internal = textData = {};
            tm.fontManager.setState(lwfmFont, (txt.font ? txt.font.size : 12) * 96 / 72, { hAlign, vAlign}, 0, paddingWidth);
            tm.fontManager.getExtent(0, 0, txt.text, len, box);
            textData.box = box;
            rdrFlags = anchored ? { bbTextAndImages = true } : { overlayText = true };
         }
         break;
      }
      case path3D:
      {
         Path3D p3d = (Path3D)ge;
         MDManager dm = mgr.perspective3DDM;
         Array<Vector3Df> nodes = *(Array<Vector3Df> *)&p3d.nodes;
         GEPath3DData pathData = ge.internal;
         if(!pathData)
            ge.internal = pathData = {};

         rdrFlags = { perspective = true };
         if(pathData.vertexBase == -1)
         {
            pathData.vertexBase = dm.md.allocateVbo(nodes.count, sizeof(nodes[0]), nodes.array);
            pathData.vCount = nodes.count;
         }
         break;
      }
      case multi:
      {
         MultiGraphicalElement mge = (MultiGraphicalElement)ge;

         for(e : mge.elements)
            rdrFlags |= calculateGE(e, mgr, anchored);

         break;
      }
      case instance:
      {
         GraphicInstance gi = (GraphicInstance)ge;
         if(gi.element)
            rdrFlags = calculateGE(gi.element, mgr, anchored);
         break;
      }
   }
   return rdrFlags;
}

// TODO: Proper full box test, not middle point
GraphicalElement pickGE(float x, float y, GraphicalElement ge, float * transform)
{
   // Checks if the point is within the GraphicalElement
   // Currently only good for overlaid elements
   // Split into methods for different types of GEs to make it easier to see where to add improvements to this rather rough current method

   GraphicalElement picked = null;
   float tx = x - (float)(ge.transform.position.x) - (transform ? transform[0] : 0);
   float ty = y - (float)(ge.transform.position.y) - (transform ? transform[1] : 0);

   switch(ge.type)
   {
      case shape: return shapeContainsPoint(tx, ty, ge) ? ge : null;
      case image:
      {
         Image img = (Image)ge;
         GEImageData imageData = (GEImageData)ge.internal;

         float w = imageData.imgW;
         float h = imageData.imgH;
         tx += w * img.hotSpot.x * ge.scaling2D.x;
         ty += h * img.hotSpot.y * ge.scaling2D.y;
         tx /= ge.scaling2D.x;
         ty /= ge.scaling2D.y;

         if(tx >= 0 && ty >= 0 && tx < w && ty < h)
         {
            int ix = (int)tx, iy = (int)ty;
            byte a = imageData.alpha ? ((byte *)imageData.alpha)[iy * imageData.imgW + ix] : 255;
            return a >= img.alphaThreshold ? ge : null;
         }
         break;
      }
      case text:
      {
         GETextData textData = (GETextData)ge.internal;
         Box box = textData.box;
         if(tx >= box.left && tx < box.right && ty >= box.top && ty < box.bottom)
            return ge;
         return null;
      }
      case multi:
      {
         //if(ge._class == class(MultiGraphicalElement))
         {
            Iterator<GraphicalElement> it { ((MultiGraphicalElement)ge).elements };
            while(it.Prev())
            {
               GraphicalElement e = it.data;
               GraphicalElement re = pickGE(tx, ty, e, null);
               if(re)
               {
                  picked = re;
                  break;
               }
            }
         }
         break;
      }
      case instance:
         if(pickGE(tx, ty, ((GraphicInstance)ge).element, null))
            return ge;
         break;
   }
   return picked;
}

public bool shapeContainsPoint(float x, float y, GraphicalElement ge)
{
   // Shape shp = (Shape)ge;
   GEShapeData shapeData = (GEShapeData)ge.internal;
   Pointf checkedPoint { x, y };

   // Temporary catch-all solution: loop through all triangles of tesselated shape and check the point in each one.
   int i;
   bool result = false;
   TesselatedShape tShape = shapeData.tShape;
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

private:
static enum InsideReturn { outside, inside, onTheEdge };

static inline double ::fromLine(const Pointf p, const Pointf a, const Pointf b)
{
   return ((double)b.x - a.x) * ((double)p.y - a.y) - ((double)p.x - a.x) * ((double)b.y - a.y);
}

// For detecting if a point is in a shape using the tesselated shape.
#define signedArea(p1, p2, p3) fromLine(p3, p1, p2)   // NOTE: this is actually TWICE the signed area, isn't it? Though here we only care about the sign.

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

public void unloadGraphicsGE(bool shutDown, GraphicalElement ge, DisplaySystem displaySystem, PresentationManager mgr)
{
   if(ge)
   {
      switch(ge.type)
      {
         case model:
         {
            GEModelData modelData = (GEModelData)ge.internal;
            if(modelData && modelData.freeModel && modelData.model)
            {
               modelData.model.Free(displaySystem);
               delete modelData.model;
               modelData.freeModel = false;
            }
            break;
         }
         case image:
         {
            GEImageData imageData = (GEImageData)ge.internal;
            if(imageData)
            {
               LWDrawManager::destroyImage(imageData.image);
               imageData.image = null;
            }
            break;
         }
         case shape:
         {
            GEShapeData shapeData = (GEShapeData)ge.internal;
            if(shapeData)
            {
               ShapesManager dm = shapeData.anchored ? mgr.shapeBillboardDM : mgr.shapeOverlayDM;
               TesselatedShape * tShape = &shapeData.tShape;
               if(shapeData.fillBase != -1)
               {
                  dm.md.freeIx(shapeData.fillBase, sizeof(tShape->ixFill[0]), tShape->fillCount);
                  shapeData.fillBase = -1;
               }
               if(shapeData.lineBase != -1)
               {
                  dm.md.freeIx(shapeData.lineBase, sizeof(tShape->ix[0]), tShape->ixCount);
                  shapeData.lineBase = -1;
               }
               if(shapeData.vertexBase != -1)
               {
                  dm.md.freeVbo(shapeData.vertexBase, sizeof(tShape->points[0]), tShape->vCount);
                  shapeData.vertexBase = -1;
               }
               tShape->free();
            }
            break;
         }
         case multi:
         {
            MultiGraphicalElement mge = (MultiGraphicalElement)ge;
            for(e : mge.elements)
               unloadGraphicsGE(shutDown, e, displaySystem, mgr);
            break;
         }
         case instance:
         {
            GraphicInstance gi = (GraphicInstance)ge;
            if(gi.element)
               unloadGraphicsGE(shutDown, gi.element, displaySystem, mgr);
            break;
         }
      }
   }
}

public void freeGE(GraphicalElement ge)
{
   if(ge)
   {
      switch(ge.type)
      {
         case shape:
         {
            GEShapeData shapeData = ge.internal;
            delete shapeData;
            break;
         }
         case model:
         {
            GEModelData modelData = ge.internal;
            delete modelData;
            break;
         }
         case image:
         {
            GEImageData imageData = ge.internal;
            delete imageData;
            break;
         }
         case text:
         {
            GETextData textData = ge.internal;
            delete textData;
            break;
         }
         case path3D:
         {
            GEPath3DData path3DData = ge.internal;
            delete path3DData;
            break;
         }
         case multi:
         {
            MultiGraphicalElement mge = (MultiGraphicalElement)ge;
            for(e : mge.elements)
               freeGE(e);
            break;
         }
         case instance:
         {
            GraphicInstance gi = (GraphicInstance)ge;
            if(gi.element)
               freeGE(gi.element);
            break;
         }
      }
      ge.internal = null;
   }
}
