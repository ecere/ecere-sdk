import "base"

class GNOSISSlide : BaseSlide
{
   BMBar { this };
   Title title { this, caption = "GNOSIS Sample" };

   MBar { this };
   Col t { this, maxSize = { 1550, 1250 }, margin = { 60, 15, 60, 15 } };
      //Header { t, caption = "Features" };
      MBar { t };
      Bullet { t, caption = "The GNOSIS SDK presents a simple object-oriented API" };
      Bullet { t, caption = "Key Classes: View3D, MapSource, MapLayer" };
      MBar { t };
      CodeBlock { t, minSize = { 1550, 930 }, font = { "Consolas", 20 }, caption =
         "import \"ecere\"\n"
         "import \"gnosis2\"\n"
         "import \"cameraController\"\n"
         "class MainWindow : Window\n"
         "{\n"
         "   displayDriver = \"OpenGL\";\n"
         "   caption = \"GNOSIS SDK Sample App\";\n"
         "   background = black;\n"
         "   borderStyle = sizable;\n"
         "   hasMaximize = true, hasMinimize = true, hasClose = true;\n"
         "   clientSize = { 640, 480 };\n"
         "\n"
         "   MapSource bmNGSrc;\n"
         "   bmNGSrc  = \"maps/BlueMarbleNextGen - August 2004\";\n"
         "\n"
         "   View3D view { void update() { window.Update(null); } };\n"
         "   MapLayer bmNG { view, source = bmNGSrc };\n"
         "\n"
         "   controller = CameraController\n"
         "   {\n"
         "      controlled = view,\n"
         "      position = { 0, 0, Kilometers { 20000 } };\n"
         "      orientation = { yaw = 0, pitch = 90, roll = 0 };\n"
         "   };\n"
         "}\n"
         "MainWindow window { };\n"
      };
}
