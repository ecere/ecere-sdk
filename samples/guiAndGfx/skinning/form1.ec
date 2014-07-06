import "ecere"

class Form1 : Window
{
#if defined(__linux__)
   displayDriver = "OpenGL";
#endif
   alphaBlend = true;
   caption = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };
   nativeDecorations = false;

   Button button1 { this, caption = "button1", position = { 440, 152 } };
   DropBox dropBox1 { this, caption = "dropBox1", position = { 208, 88 } };
   ListBox listBox1 { this, caption = "listBox1", position = { 304, 280 } };
   EditBox editBox1 { this, caption = "editBox1", position = { 96, 184 } };
   Label label1 { this, caption = "label1", position = { 432, 248 } };
   ScrollBar scrollBar1 { this, caption = "scrollBar1", position = { 488, 360 } };
}

Form1 form1 {};

class MyApp : GuiApplication
{
   skin = "My";
   //skin = "Acovel";
   //skin = "Sim";
}
