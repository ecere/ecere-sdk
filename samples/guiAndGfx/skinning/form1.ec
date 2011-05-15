import "ecere"

class Form1 : Window
{
   alphaBlend = true;
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Button button1 { this, text = "button1", position = { 440, 152 } };
   DropBox dropBox1 { this, text = "dropBox1", position = { 208, 88 } };
   ListBox listBox1 { this, text = "listBox1", position = { 304, 280 } };
   EditBox editBox1 { this, text = "editBox1", position = { 96, 184 } };
   Label label1 { this, text = "label1", position = { 432, 248 } };
   ScrollBar scrollBar1 { this, text = "scrollBar1", position = { 488, 360 } };
}

Form1 form1 {};

class MyApp : GuiApplication
{
   //skin = "My";
   //skin = "Acovel";
   skin = "Sim";
}
