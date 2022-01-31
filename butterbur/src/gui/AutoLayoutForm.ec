import "GraphicalSurface"
import "GraphicalPresentation"

import "autoLayout"

class AutoLayoutForm : Window
{
   displayDriver = "OpenGL";
   caption = "";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 480 };

   GraphicalSurface gs { };
   GraphicalPresentation gp { gs };

   Element contents;

   AutoLayoutForm()
   {
      UseSingleGLContext(true);
   }

   bool OnLoadGraphics()
   {
      setupGL(display);

      // contents.loadGraphics(displaySystem);
      incref contents;
      gp.graphic = contents;

      gs.calculate(gs, gs.presManager);

      return true;
   }

   void OnResize(int width, int height)
   {
      int nw = contents.minSize.w.getPixels(width);
      int nh = contents.minSize.h.getPixels(height);

      setupGL(display);
      contents.clientSize = { Max(nw, width), Max(nh, height) };
      if(contents.elements)
      {
         contents.computeContentSize(gs.fontManager);
         contents.autoLayout();
         unloadGraphicsGE(false, contents, displaySystem, gs.presManager);
         gp.needUpdate = true;
      }
      Update(null);
   }

   void OnRedraw(Surface surface)
   {
      Size size = clientSize;

      //contents.render(surface);
      setupGL(display);
      gs.render(size.w, size.h, 0, 0);
   }
}
