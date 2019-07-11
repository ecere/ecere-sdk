public import IMPORT_STATIC "ecere"

#include "gl123es.h"

import "DrawingManager"
import "shapesTesselation"

public class GraphicalPresentation : Presentation
{
   GraphicalElement ge;
   GEType geType;
   // float cTransform[3]; // The total transform applied to a leaf graphical element.  Calculated from local transform of all containing elements
   Transform transform; // The transform applied at this specific level of the hierarchy
   transform.scaling = { 1, 1, 1 };

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
               MDManager dm = mgr.perspective3DDM;
               if(!model)
               {
                  Object object { };

                  if(object.LoadEx(mdl.model.path, null, displaySystem, null))
                  {
                     Material mat { };
                     // mat.flags.partlyTransparent = true;
                     mat.diffuse = slateGray;
                     mat.specular = slateGray;
                     mat.opacity = 1.0;// 0.75;
                     mat.shader = butterburShader;
                     object.mesh.ApplyMaterial(mat);
                     model = object;
                  }
                  else
                     delete object;
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
            Transform * gt = &ge.transform;
            Quaternion * go = &gt->orientation;
            Transform glt
            {
               { gt->position.x, -gt->position.y, gt->position.z },
               // In 3D, yaw must be negated to be positive counter-clockwise top-down (map style)
               { go->w, go->x, -go->y, -go->z },
               gt->scaling
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
               Model p3d = (Model)ge;
               Perspective3DManager pm = (Perspective3DManager)dm;

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

   int pick(const Boxf region, int maxResults, PickResult * results)
   {
      // TODO: Proper full box test, not middle point
      if(containsPoint((region.left + region.right)/2, (region.top + region.bottom)/2))
      {
         results[0] = { this, element = graphic };
         return 1;
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
