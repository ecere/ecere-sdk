import "base"

class Slide1 : BaseSlide
{
   BMBar { this };
   Element title { this, maxSize = { 1430, 0 }, font = { "Verdana", 50, bold = true }, caption = "eC - A crash course", fgColor = textColor };

   MBar { this };
   Col t { this, maxSize = { 1400, 1100 }, margin = { 15, 15, 15, 15 } };
      Header { t, caption = "eC Language" };
      Bullet { t, caption = "Classes" };
      Bullet { t, caption = "Instances" };
      Bullet { t, caption = "Methods" };
      Bullet { t, caption = "Flow Control" };
      Bullet { t, caption = "Variables" };
      Bullet { t, caption = "Style Guidelines" };
      Bullet { t, caption = "Member Instance" };
      Bullet { t, caption = "Instance method" };
      Bullet { t, caption = "Setting properties" };
      Bullet { t, caption = "Default properties" };
      MBar { t };
      Header { t, caption = "Ecere GUI" };
      Bullet { t, caption = "Creating a Form" };
      Bullet { t, caption = "Positions and Anchors" };
      Bullet { t, caption = "Button: Responding to a click" };
      Bullet { t, caption = "MessageBox and Modal Loops" };
      Bullet { t, caption = "This is very long text that would ideally have automatic line-wrapping onto the next line. Now we have to implement this into autoLayout.ec." };
}
