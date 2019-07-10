public import IMPORT_STATIC "ecere"

#include "gl123es.h"

import "Presentation"
import "GLMultiDraw"
import "ButterburShader"
import "TIManager"

public class RenderPassFlags : uint32
{
   // TODO: Generalize this?
public:
   bool textures:1;
   bool perspective:1;
   bool overlay:1;
   bool overlayText:1;
   bool bbShapes:1;
   bool bbTextAndImages:1;
}

// A class to enclose a single GLMultiDraw and some useful data used alongside it
public class DrawingManager
{
   RenderPassFlags renderFlags;
   Presentation topPresentation;
   Pointf originOffset;
   uint targetFBO;

   virtual void init();
   virtual void prepareDraw(Presentation presentation);
   virtual void draw();
}

public class MDManager : DrawingManager
{
   Array<float> transforms {};
   GLMultiDraw md;
   GLArrayTexture texture;
   uint transformsAlloced;

   // Default setup for Shapes right now...
   int vertNCoords;
   GLIMTKMode primMode;
   int minAlloc;
   primMode = triangleStrip;
   int texLevels, texW, texH;
   md.transformSize = 3; // 3D Offsets for now...
   //////

   void draw()
   {
      texture.bind();
      md.draw();
   }

   void init()
   {
      if(!md.vertexGLMB)
      {
         md.init(primMode, minAlloc);
         texture.init(texLevels, texW, texH, minAlloc);
      }
   }

   void prepareDraw(Presentation presentation)
   {
      float transform[12] = { 0 };

      if(renderFlags.perspective)
      {
         // Orientation only for 3D for now...
         transform[0] = 1;
         transform[4] = 1;
         transform[8] = 1;
      }
      else
      {
         transform[0] = originOffset.x;
         transform[1] = originOffset.y;
      }
      // Allocate MD, add draw commands
      md.commandsCount = 0;

      presentation.prepareDraw(renderFlags, this, transform);

      md.prepare(vertNCoords, 0);

      if(md.commandsCount)
      {
         if(md.commandsCount > transformsAlloced)
         {
            transformsAlloced = md.commandsCount;
            md.transformsAB.allocate(md.transformSize * sizeof(float) * transformsAlloced, null, streamDraw);
         }

         md.transformsAB.upload(0, md.commandsCount * md.transformSize * sizeof(float), transforms.array);

         GLABBindBuffer(GL_ARRAY_BUFFER, md.transformsAB.buffer);
         if(md.transformSize == 3)
         {
            glVertexAttribPointer(posOffsetAttribute, md.transformSize, GL_FLOAT, GL_FALSE, 0, 0);
            glVertexAttribDivisor(posOffsetAttribute, 1);
            glEnableVertexAttribArray(posOffsetAttribute);
         }
         else
         {
            glVertexAttribPointer(transform0Attribute, 3, GL_FLOAT, GL_FALSE, 12 * sizeof(float), 0);
            glVertexAttribPointer(transform1Attribute, 3, GL_FLOAT, GL_FALSE, 12 * sizeof(float), (void *)(uintptr)(3 * sizeof(float)));
            glVertexAttribPointer(transform2Attribute, 3, GL_FLOAT, GL_FALSE, 12 * sizeof(float), (void *)(uintptr)(6 * sizeof(float)));
            glVertexAttribPointer(transform3Attribute, 3, GL_FLOAT, GL_FALSE, 12 * sizeof(float), (void *)(uintptr)(9 * sizeof(float)));

            glVertexAttribDivisor(transform0Attribute, 1);
            glVertexAttribDivisor(transform1Attribute, 1);
            glVertexAttribDivisor(transform2Attribute, 1);
            glVertexAttribDivisor(transform3Attribute, 1);

            glEnableVertexAttribArray(transform0Attribute);
            glEnableVertexAttribArray(transform1Attribute);
            glEnableVertexAttribArray(transform2Attribute);
            glEnableVertexAttribArray(transform3Attribute);
         }
      }

      if(glCaps_vao) glBindVertexArray(0);
   }
}

class ShapesManager : MDManager
{
   vertNCoords = 2;
   primMode = triangleStrip;
   minAlloc = 16;
   texLevels = 1, texW = 1, texH = 1;

   void addCommand(ColorAlpha color, uint ixCount, uint ixBase, uint vBase, float * transform)
   {
      uint drawID = md.commandsCount;
      if(drawID >= texture.numLayers)
         texture.resize(texture.numLayers + Max(1, texture.numLayers/2), targetFBO);

      texture.set1x1Layer(drawID, color, targetFBO);

      if(3 * sizeof(float) * md.commandsCount >= transforms.minAllocSize)
         transforms.minAllocSize = (md.commandsCount + 8) * 3 *3/2;

      memcpy(transforms.array + 3 * drawID, transform, sizeof(float) * 3);

      md.addDrawCommand(ixCount, 1, ixBase, vBase, drawID);

      // Do we need addDrawCommandCustomID() here?
      // md.addDrawCommandCustomID(ixCount, 1, 0, ixBase, vBase, drawID, texLayer);
   }

   void draw()
   {
      GLMultisampling(true);
      butterburShader.activate();
      butterburShader.texturing(true);
      butterburShader.textureArray(true);

      MDManager::draw();
   }
}

class Perspective3DManager : MDManager
{
   vertNCoords = 3;
   primMode = lineStrip; // For now only Path3D supported...
   minAlloc = 16;
   texLevels = 1, texW = 1, texH = 1;
   md.transformSize = 12;

   void addCommand(ColorAlpha color, uint vCount, uint vBase, const float * transform)
   {
      // NOTE: Currently drawing directly here as we haven't implemented glMultiDrawArraysIndirect() / DrawArraysIndirectCommand yet
      uint drawID = md.commandsCount;

      if(drawID >= texture.numLayers)
         texture.resize(texture.numLayers + Max(1, texture.numLayers/2), targetFBO);

      texture.set1x1Layer(drawID, color, targetFBO);

      if(12 * sizeof(float) * md.commandsCount >= transforms.minAllocSize)
         transforms.minAllocSize = (md.commandsCount + 8) * 12 *3/2;

      memcpy(transforms.array + 12 * drawID, transform, sizeof(float) * 12);

      // NOTE: Currently hi-jacking addDrawCommand() originally intended for elements only...
      //       We are overriding draw() below to handle the commands directly here rather than in GLMultiDraw
      md.addDrawCommand(vCount, 1, 0, vBase, drawID);
   }

   void draw()
   {
      int n;

      if(!md.commandsCount) return;

      GLMultisampling(true);
      butterburShader.multiDraw(true);
      butterburShader.lighting(false);
      butterburShader.texturing(true);
      butterburShader.textureArray(true);
      butterburShader.transform3D = true;
      butterburShader.activate();
      GLFlushMatrices();

      texture.bind();
      if(glCaps_vao) glBindVertexArray(md.vao);
      for(n = 0; n < md.commandsCount; n++)
      {
         const GLDrawCommand *cmd = &md.commands[n];
         // NOTE: glVertexAttribPointer might cause VAOs to be re-validated... Uniforms faster?
         uint baseInstance = cmd->baseInstance;
         GLABBindBuffer(GL_ARRAY_BUFFER, md.transformsAB.buffer);
         glVertexAttribPointer(transform0Attribute, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 12, (void *)(uintptr)((baseInstance * 12    ) * sizeof(float)));
         glVertexAttribPointer(transform1Attribute, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 12, (void *)(uintptr)((baseInstance * 12 + 3) * sizeof(float)));
         glVertexAttribPointer(transform2Attribute, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 12, (void *)(uintptr)((baseInstance * 12 + 6) * sizeof(float)));
         glVertexAttribPointer(transform3Attribute, 3, GL_FLOAT, GL_FALSE, sizeof(float) * 12, (void *)(uintptr)((baseInstance * 12 + 9) * sizeof(float)));

         GLABBindBuffer(GL_ARRAY_BUFFER, md.idsAB.buffer);
         glVertexAttribIPointer(drawIDAttribute, 1, GL_UNSIGNED_INT, 0, (void *)(uintptr)(baseInstance * sizeof(uint)));
         GLABBindBuffer(GL_ARRAY_BUFFER, 0);

         glDrawArrays(md.drawMode, cmd->baseVertex + cmd->firstIndex, cmd->count);
      }
      /*if(renderFlags.perspective)
      {
         glDisableVertexAttribArray(transform1Attribute);
         glDisableVertexAttribArray(transform2Attribute);
         glDisableVertexAttribArray(transform3Attribute);
      }*/
      if(glCaps_vao) glBindVertexArray(0);

      butterburShader.transform3D = false;
   }

   private void renderMesh(Mesh mesh)
   {
      if(mesh)
      {
         if(mesh.groups.first)
         {
            PrimitiveGroup group;

            if(glCaps_vao) glBindVertexArray(defaultVAO);
            glDisplay.SelectMesh(mesh);

            for(group = mesh.groups.first; group; group = group.next)
            {
               Material material = group.material ? group.material : null;
               if(!material) material = GetDefaultMaterial();

               butterburShader.textureArray(false);
               butterburShader.texturing(false);
               butterburShader.multiDraw(false);

               glDisplay.ApplyMaterial(material, mesh);
               glDisplay.DrawPrimitives((PrimitiveSingle *)&group.type, mesh);
            }

            if(glCaps_vao) glBindVertexArray(0);
         }
      }
   }

   static void addModel(Object model, Matrix v)
   {
      if(model)
      {
         Object o;

         if(model.flags.mesh && model.mesh)
         {
            Matrix matrix, * m = model.matrixPtr;
            matrix.Multiply3x4(v, m);
            glmsLoadMatrixd(matrix.array);
            renderMesh(model.mesh);
         }
         for(o = model.firstChild; o; o = o.next)
            addModel(o, v);
      }
   }

   private void addModelCommand(Object model, float * transform)
   {
      Matrix v
      { {
         transform[0], transform[ 1], transform[ 2], 0,
         transform[3], transform[ 4], transform[ 5], 0,
         transform[6], transform[ 7], transform[ 8], 0,
         transform[9], transform[10], transform[11], 1
      } };
      Matrix m, viewMatrix;

      // TODO: View matrix in base GraphicalSurface?
      glmsGetDoublev(modelViewMatrix, viewMatrix.array);

      m.Multiply3x4(v, viewMatrix);
      addModel(model, m);
      butterburShader.setSimpleMaterial(white, false);
      // Reset Perspective3DManager shader states
      butterburShader.textureArray(true);
      butterburShader.texturing(true);
      butterburShader.multiDraw(true);
   }
}

public class PresentationManager
{
   DrawingManager texturesDM { renderFlags = { textures = true } };
   ShapesManager shapeOverlayDM { renderFlags = { overlay = true } };
   ShapesManager shapeBillboardDM { renderFlags = { bbShapes = true } };
   Perspective3DManager perspective3DDM { renderFlags = { perspective = true } };
   TIManager tiOverlayDM { renderFlags = { overlayText = true } };
   TIManager tiBillboardDM { renderFlags = { bbTextAndImages = true } };

   bool initialized;

   property Pointf origin
   {
      set
      {
         shapeOverlayDM.originOffset = value;
         shapeBillboardDM.originOffset = value;
         tiOverlayDM.originOffset = value;
         tiBillboardDM.originOffset = value;
         texturesDM.originOffset = value;
      }
   }

   property uint targetFBO
   {
      set
      {
         shapeOverlayDM.targetFBO = value;
         shapeBillboardDM.targetFBO = value;
         tiOverlayDM.targetFBO = value;
         tiBillboardDM.targetFBO = value;
         texturesDM.targetFBO = value;
      }
   }

   void init(Presentation topPresentation,
      LWFontManager fontManager, LWDrawManager drawManager, int width, int height)
   {
      if(!initialized)
      {
         shapeOverlayDM.topPresentation = topPresentation;
         shapeBillboardDM.topPresentation = topPresentation;
         perspective3DDM.topPresentation = topPresentation;
         tiOverlayDM.topPresentation = topPresentation;
         tiBillboardDM.topPresentation = topPresentation;
         texturesDM.topPresentation = topPresentation;

         tiOverlayDM.fontManager = fontManager;
         tiOverlayDM.drawManager = drawManager;
         tiBillboardDM.fontManager = fontManager;
         tiBillboardDM.drawManager = drawManager;

         shapeOverlayDM.init();
         shapeBillboardDM.init();
         perspective3DDM.init();
         tiOverlayDM.init();
         tiBillboardDM.init();
         texturesDM.init();

         initialized = true;
      }
      tiOverlayDM.width = width;
      tiOverlayDM.height = height;
      tiBillboardDM.width = width;
      tiBillboardDM.height = height;
   }
};
