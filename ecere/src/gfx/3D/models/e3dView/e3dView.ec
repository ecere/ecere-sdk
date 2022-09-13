public import "ecere"
import "e3dRead"
import "modelView"

import "e3dWrite"

ModelViewer modelView { displayDriver = "OpenGL"; };

class App : GuiApplication
{
   bool Init()
   {
      *&modelView.modelFile = argc > 1 ? argv[1] : "sponza.e3d";
      return true;
   }
}
