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
            case shape: tShape.free(); break;
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
               case path3D: rdrFlags = { perspective = true }; break;
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
                  tShape.free();
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
                  im.addImageCommand(image, imgW * ge.transform.scaling.x, imgH * ge.transform.scaling.y, img.opacity, white, cTransform);
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
}
