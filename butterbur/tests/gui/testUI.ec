import "IMElement"
import "GraphicalSurface"
import "GraphicalPresentation"

class TestUI : Window
{
   displayDriver = "OpenGL";
   caption = "Butterbur UI Test";
   opacity = 0;
   drawBehind = false;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 640, 480 };

   TestUI()
   {
      setUIInterface((void *)class(EcereUIInterface));
      UseSingleGLContext(true);
   }

   bool OnLoadGraphics()
   {
      setupGL(display);
      return true;
   }

   void OnUnloadGraphics()
   {
      graphicalSurface.unloadGraphics(true, graphicalSurface.presManager);
      butterburShader.free();
   }

   void OnRedraw(Surface surface)
   {
      Size size = clientSize;

      setupGL(display);

      graphicalSurface.backgroundColor = Color { 20, 10, 60 }; //formColor;
      graphicalSurface.render(size.w, size.h, 0, 0);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      PickResult result;
      Pointf mousePos { x, y };
      if(capturedElement || graphicalSurface.pickAt(mousePos, 0, result))
         return imeMouseEvent((IMElement)result.element, x, y, mods, IMEonLeftButtonDown);
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      PickResult result;
      Pointf mousePos { x, y };
      if(capturedElement || graphicalSurface.pickAt(mousePos, 0, result))
         return imeMouseEvent((IMElement)result.element, x, y, mods, IMEonLeftButtonUp);
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      PickResult result { };
      Pointf mousePos { x, y };
      if(capturedElement || graphicalSurface.pickAt(mousePos, 0, result))
         return imeMouseEvent((IMElement)result.element, x, y, mods, IMEonMouseMove);
      return true;
   }
}

TestUI testUI { };
GraphicalSurface graphicalSurface { };
MultiGraphicalElement desktopMGE { };
GraphicalPresentation desktopPresentation { graphicalSurface, graphic = desktopMGE, pickable = true };

class EcereUIInterface : UIInterface
{
   void capturePointer()
   {
      testUI.Capture();
   }

   void releasePointer()
   {
      testUI.ReleaseCapture();
   }

   void updateElement(GraphicalElement ge, bool unloadGraphics)
   {
      if(unloadGraphics)
         unloadGraphicsGE(false, ge, testUI.displaySystem, graphicalSurface.presManager);
      desktopPresentation.needUpdate = true;
   }

   void refresh()
   {
      testUI.Update(null);
   }
}
