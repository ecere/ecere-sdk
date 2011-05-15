import "ecere"

class EngineSettings : Window
{
   text = "ECERE 3D Engine Settings";
   borderStyle = fixed;
   hasClose = true;
   tabCycle = true;
   font = { "Tahoma", 10 };
   size = { 606, 346 };

   bool fullScreen;
   Resolution resolution;
   PixelFormat colorDepth;
   int refreshRate;
   char * driver;
   driver = "OpenGL";

   Picture ecereLogo { this, image = BitmapResource { ":ecere.png", alphaBlend = true }, anchor = { left = 30, top = 10 } };

   // Driver
   DropBox driverBox
   {
      this, text = "3D API", hotKey = d, size = { 112, 24 }, anchor = { horz = 204, top = 40 };

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         driver = (char *)row.tag;
         return true;
      }
   };
   Label { this, labeledWindow = driverBox, anchor = { horz = 204, top = 16 } };

   // Resolution
   DropBox resBox
   {
      this, text = "Resolution", hotKey = r, size = { 112, 24 }, anchor = { horz = 204, top = 96 }, disabled = !fullScreen;

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         resolution = (Resolution)row.tag;
         return true;
      }
   };
   Label { this, labeledWindow = resBox, anchor = { horz = 205, top = 72 } };

   // Color Depth
   DropBox bppBox
   {
      this, text = "Color Depth", hotKey = c, size = { 112, 24 }, anchor = { horz = 204, top = 152 }, disabled = !fullScreen;

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         colorDepth = (PixelFormat)row.tag;
         return true;
      }
   };
   Label { this, labeledWindow = bppBox, anchor = { horz = 208, top = 128 } };

   // Refresh Rate
   DropBox refBox
   {
      this, text = "Refresh Rate", hotKey = t, size = { 112, 24 }, anchor = { horz = 204, top = 208 }, disabled = !fullScreen;

      bool NotifySelect(DropBox dropBox, DataRow row, Modifiers mods)
      {
         refreshRate = row.tag;
         return true;
      }
   };
   Label { labeledWindow = refBox, parent = this, anchor = { horz = 204, top = 184 } };
   Button btnFullScreen
   {
      this, isCheckbox = true, text = "Full Screen", hotKey = f, anchor = { horz = 203, top = 248 }, checked = fullScreen;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         fullScreen = button.checked;
         resBox.disabled = !fullScreen;
         refBox.disabled = !fullScreen;
         bppBox.disabled = !fullScreen;
         Update(null);
         return true;
      }
   };
   Button exitBtn
   {
      this, text = "Exit", size = { 80, 24 }, anchor = { horz = 69, top = 168 }, NotifyClicked = ButtonCloseDialog;
   };
   Button run
   {
      this, text = "Start", isDefault = true, size = { 80, 24 }, anchor = { horz = 69, top = 96 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         Destroy(1);
         ((GuiApplication)__thisModule).SwitchMode(fullScreen, driver, resolution, colorDepth, refreshRate, null, true);
         return false;
      }
   };

   EngineSettings()
   {
      driverBox.AddString("OpenGL").tag = (int)"OpenGL";
      driverBox.AddString("Direct3D 9").tag = (int)"Direct3D";
      driverBox.AddString("Direct3D 8").tag = (int)"Direct3D8";
      driverBox.currentRow = driverBox.firstRow;
      
      resBox.AddString("Current");
      resBox.AddString("640x480").tag = Resolution::res640x480;
      resBox.AddString("800x600").tag = Resolution::res800x600;
      resBox.AddString("1024x768").tag = Resolution::res1024x768;
      resBox.AddString("1280x1024").tag = Resolution::res1280x1024;
      resBox.AddString("1600x1200").tag = Resolution::res1600x1200;
      resBox.currentRow = resBox.FindRow(resolution);

      bppBox.AddString("Current");
      bppBox.AddString("16 bpp").tag = PixelFormat::pixelFormat565;
      bppBox.AddString("24 bpp").tag = PixelFormat::pixelFormat888;
      bppBox.currentRow = bppBox.FindRow(colorDepth);

      refBox.AddString("Current");
      refBox.AddString("60 Hz").tag = 60;
      refBox.AddString("75 Hz").tag = 75;
      refBox.AddString("85 Hz").tag = 85;
      refBox.AddString("100 Hz").tag = 100;
      refBox.AddString("120 Hz").tag = 120;
      refBox.currentRow = refBox.FindRow(refreshRate);
   }
}
