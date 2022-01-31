public import IMPORT_STATIC "ecere"

#include "gl123es.h"

private: // FIXME: eC bug here... global access mode should still be private?
         // On other Linux system without this here, Presentation has [Private] import mode
         // and does not find MultiPresentation::calculate()

import "Presentation"

#undef near
#undef far

// We will want to use a single FontManager...
LWFontManager fm; // For labels.  Needs to be outside class so it can be be placed in the draw manager flush.

public class GraphicalSurface : MultiPresentation
{
   LWFontManager fontManager {};
   LWFontRenderer renderer {};
   LWDrawManager drawManager
   {
      void flush()
      {
         fm.flushUpdate();
      }
   };
   bool doneManagersSetup;

   // TODO: How will graphics context termination be handled properly?
   public void unloadGraphics(bool shutDown, PresentationManager mgr)
   {
      MultiPresentation::unloadGraphics(shutDown, presManager);

      drawManager.end();
      presManager.free();
   }

   void setupManagers()
   {
      fm = fontManager;
      if(drawManager.init(0))
      {
         // Create a texture with two channels, alpha and intensity
         renderer.drawManager = drawManager;
         fontManager.create( 1024, 1024, 2, 0, renderer);//&frFontRenderer, (void *)&drawmanager );
      }
      else
         PrintLn("Error initializing draw manager!");
   }

   PresentationManager presManager { };

   uint texturesFramebuffer;
   Camera camera;

   Pointd origin { }; // Relative origin offset from center
   Matrix prjMatrix;
   Matrix viewMatrix;

   int width, height;
   int left, top;
   uint targetFBO;
   bool isVR;
   int vrEye;
   ColorAlpha backgroundColor;

   backgroundColor = white;

   public double nearClip, farClip;

   // TODO: How to handle association of Camera to GraphicalSurface?
   public property Camera camera
   {
      set
      {
         // TODO: Update matrices and stuff
         camera = value;

         *&needUpdate = true;
      }
      get { return camera; }
   }

   public property double nearClip { get { return nearClip; } };
   public property double farClip { get { return farClip; } };

   public property ColorAlpha backgroundColor
   {
      set { backgroundColor = value; }
      get { return backgroundColor; }
   }

   void calculate(Presentation topPres, PresentationManager mgr)
   {
      if(!doneManagersSetup)
         setupManagers(), doneManagersSetup = true;

      if(!texturesFramebuffer)
         glGenFramebuffers(1, &texturesFramebuffer);
#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      presManager.init(this, fontManager, drawManager, width, height);
      MultiPresentation::calculate(this, presManager);
   }

   void renderTextures()
   {
#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      glDisable(GL_SCISSOR_TEST);
      if(glCaps_vao) glBindVertexArray(0);
      glBindFramebuffer(GL_FRAMEBUFFER, texturesFramebuffer);
      butterburShader.activate();
      butterburShader.lighting(false);
      butterburShader.multiDraw(false);

      // Manage some textures here

      // Render to some textures here ...
      MultiPresentation::prepareDraw({ textures = true }, null, null);

      glViewport(left, displaySize.h - (top + height), width, height);
      glEnable(GL_SCISSOR_TEST);

#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif
   }

   void renderFrame()
   {
      Vector3D camPos = camera ? camera.cPosition : { };
      Vector3D lightPosition = camPos;
      ColorRGB ambientLight { 0.1, 0.1, 0.1 };
      ColorRGB cameraLight { 0.5, 0.5, 0.5 };
      ColorRGB lightColor { 1.0, 1.0, 1.0 };
      Light light;

#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      presManager.origin = { (float)origin.x * width, 0 }; //(float)origin.y * height };
      presManager.targetFBO = targetFBO;

      // NOTE: Set up a clip box ourselves with new parameters? For now leave current scissor on
//#if defined(__LUMIN__)
      if(isVR)
         glDisable(GL_SCISSOR_TEST);
//#endif

      glDepthMask(GL_TRUE);

      glBindFramebuffer(GL_FRAMEBUFFER, targetFBO);
      butterburShader.textureArray(true);

      butterburShader.multiDraw(true); // Turn multidraw back on since all other drawing uses it

      // Clearing with background color
      glClearColor(
         backgroundColor.color.r / 255.0f,
         backgroundColor.color.g / 255.0f,
         backgroundColor.color.b / 255.0f,
         backgroundColor.a / 255.0f);
      glClear(GL_COLOR_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);

#if !defined(_GLES) && !defined(_GLES2)
      glEnable(GL_MULTISAMPLE);
#endif

      butterburShader.activate();
      glmsSetNearPlane(nearClip);

      // Set up projection and view matrices...
      GLMatrixMode(MatrixMode::projection);
      GLPushMatrix();
      GLLoadMatrix(prjMatrix);

      GLMatrixMode(MatrixMode::modelView);
      GLPushMatrix();
      GLLoadIdentity();
      GLScaled(1.0, 1.0, -1.0);

      // Set up Lighting
      butterburShader.setGlobalAmbient(ambientLight.r, ambientLight.g, ambientLight.b, 1.0);

      // Camera light
      light = { orientation = { w = 1.0 }, diffuse = cameraLight, specular = cameraLight };
      butterburShader.setLight(camPos, 0, light);

      // Set up 3D View orientation
      GLMultMatrixd(viewMatrix.array);

      // Main light
      light = { diffuse = lightColor, specular = lightColor };
      light.orientation.RotationDirection({-lightPosition.x, -lightPosition.y, -lightPosition.z});
      butterburShader.setLight(camPos, 1, light);

      // Render the 3D stuff
      //setSimpleMaterial(white, false);
      butterburShader.texturing(true); // Setting texturing to true to display textures.
                                       // TODO: make a separate state for array textures to turn on as well
      butterburShader.multiDraw(true);

      glEnable(GL_CULL_FACE);
      glEnable(GL_DEPTH_TEST);

#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      butterburShader.texturing(true);
      glEnable(GL_CULL_FACE);
      glEnable(GL_DEPTH_TEST);

      // Perspective 3D
      presManager.perspective3DDM.prepareDraw(this);
      presManager.perspective3DDM.draw();

      // Go back to 2D orthographic matrix
      GLMatrixMode(MatrixMode::projection);
      GLLoadIdentity();
      GLMatrixMode(MatrixMode::modelView);
      GLLoadIdentity();
      GLOrtho(0, width, height, 0, 0.0, 1.0);

      glDisable(GL_CULL_FACE);
      glDisable(GL_DEPTH_TEST);

      butterburShader.setLight(null, 0, null);
      butterburShader.setLight(null, 1, null);

#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      // Billboards (Shapes)
      presManager.shapeBillboardDM.prepareDraw(this);
      presManager.shapeBillboardDM.draw();

      // Billboards (Text/Images)
      presManager.tiBillboardDM.prepareDraw(this);
      presManager.tiBillboardDM.draw();

      // Screen Space Overlays (Shapes)
      presManager.shapeOverlayDM.prepareDraw(this);
      presManager.shapeOverlayDM.draw();

      // Screen Space Overlays (Text/Images)
      presManager.tiOverlayDM.prepareDraw(this);
      presManager.tiOverlayDM.draw();

#ifdef _DEBUG
      checkGLErrors(__FILE__, __LINE__);
#endif

      GLMatrixMode(MatrixMode::modelView);
      GLPopMatrix();
      GLMatrixMode(MatrixMode::projection);
      GLPopMatrix();

      // Reset GL states to libecere's liking...
      butterburShader.textureArray(false);
      glBindTexture(GL_TEXTURE_2D_ARRAY, 0);
      glEnable(GL_SCISSOR_TEST);
      if(glCaps_vao) glBindVertexArray(defaultVAO);
      DefaultShader::shader().texturing(false);
      DefaultShader::shader().texturing(true);
      DefaultShader::shader().activate();
   }

   void countFrames()
   {
      Time t = GetTime();
      if(!lastFPSTime) lastFPSTime = t;
      framesCounter++;
      if(t - lastFPSTime > 2.0)
      {
         fps = framesCounter / (t - lastFPSTime);
         framesCounter = 0;
         lastFPSTime = t;
      }
   }

   public void render(int width, int height, int left, int top)  // TODO: Add parameters here ? Affected extent to update, target framebuffer, etc?
   {
      // REVIEW: Currently forcing update for a number of reasons...
      property::camera = camera;
      if(this.width != width || this.height != height)
         *&needUpdate = true;
      this.width = width, this.height = height;
      this.left = left, this.top = top;

      isVR = false;
      targetFBO = 0;

      if(needUpdate)
      {
         // TODO: Update matrices based on Camera
         calculate(this, presManager);
      }

      renderTextures();
      if(needUpdate)
         *&needUpdate = false;
      renderFrame();

      // terrainLayer.cache.vectorMD.printStats();
      // GLStats::print();

      countFrames();

      glViewport(0,0, resetDisplaySize.w, resetDisplaySize.h);
      glBindFramebuffer(GL_FRAMEBUFFER, 0);
      DefaultShader::shader().activate();
      // TOCHECK: Why do we need to force matrices to be modified for info text e.g. fps to show up?
      GLMatrixMode(MatrixMode::modelView);
      glmsPushMatrix();
      glmsPopMatrix();
      GLMatrixMode(MatrixMode::projection);
      glmsPushMatrix();
      glmsPopMatrix();
      GLSetupTexturing(false);
   }

   public void renderVR(int w, int h, GLFB outputLeft, GLFB outputRight,
                        Vector3D position, Vector3D offLeft, Vector3D offRight, Matrix prjMatrixLeft, Matrix prjMatrixRight)
   {
      Matrix pMatrixLeft = prjMatrixLeft;
      Matrix pMatrixRight = prjMatrixRight;
      Vector3D cartLeft  { position.x - offLeft.x,  position.y - offLeft.y,  position.z - offLeft.z  };
      Vector3D cartRight { position.x - offRight.x, position.y - offRight.y, position.z - offRight.z };
      Pointd lOrigin { };  // TODO: Calculate these from projection matrices
      Pointd rOrigin { };

      pMatrixLeft.m[1][1] *= -1;
      pMatrixRight.m[1][1] *= -1;

      // REVIEW: Currently forcing update for a number of reasons... (accurateMinMax, update woes?)
      property::camera = camera;
      if(width != w || height != h)
         *&needUpdate = true;

      width = w, height = h;

      isVR = true;

      if(needUpdate)
      {
         // TODO: Update matrices based on Camera
         calculate(this, presManager);
         *&needUpdate = false;
      }

      displaySize = { outputLeft.w, outputLeft.h };

      renderTextures();

      vrEye = 0;
      targetFBO = outputLeft.fbo;

      origin = lOrigin;
      prjMatrix = pMatrixLeft;
      camera.setCPosition(cartLeft);

      renderFrame();

      vrEye = 1;
      targetFBO = outputRight.fbo;

      origin = rOrigin;
      prjMatrix = pMatrixRight;
      camera.setCPosition(cartRight);

      renderFrame();

      countFrames();

      glViewport(0,0, resetDisplaySize.w, resetDisplaySize.h);
      glBindFramebuffer(GL_FRAMEBUFFER, 0);
      DefaultShader::shader().activate();
      // TOCHECK: Why do we need to force matrices to be modified for info text e.g. fps to show up?
      GLMatrixMode(MatrixMode::modelView);
      glmsPushMatrix();
      glmsPopMatrix();
      GLMatrixMode(MatrixMode::projection);
      glmsPushMatrix();
      glmsPopMatrix();
      GLSetupTexturing(false);
   }

   // Frames per second stats for this GraphicalSurface
   uint framesCounter;
   Time lastFPSTime;
   double fps;
   public property double framesPerSecond { get { return fps; } }
}
