import "ecere"
import "Layout"
import "Style"

class LayoutButton : LayoutWindow {
public:
   Style styleDown;
   bool pressedDown;
   Container<Style> AllStyles() {
      Container<Style> result = LayoutWindow::AllStyles();
      result.Add(styleDown);
      return result;
   }
   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Capture();
      if(styleDown) {
         pressedDown = true;
         styleDown.show = true;
         CascadeStyles();
      }
      return true;
   }
   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      ReleaseCapture();
      if(styleDown) {
         pressedDown = false;
         styleDown.show = false;
         CascadeStyles();
      }
      return true;
   }
   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      LayoutWindow::OnMouseOver(x,y,mods);
      if(styleDown) {
         styleDown.show = pressedDown;
         CascadeStyles();
      }
      return true;
   }
   bool OnMouseLeave(Modifiers mods)
   {
      LayoutWindow::OnMouseLeave(mods);
      if(styleDown) {
         styleDown.show = false;
         CascadeStyles();
      }
      return true;
   }
   void OnRedraw(Surface surface)
   {
      LayoutWindow::OnRedraw(surface);
      if(text) {
         surface.WriteText(style.padding.left,style.padding.top,text,strlen(text));
      }
   }
};