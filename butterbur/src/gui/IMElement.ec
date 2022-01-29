#ifdef ARVIS
import "arvis"
#else
define dpiFactor = 1.5f;
import "GraphicalElement"
#endif

define lineJoin = LineJoin::miter;
define lineCap = LineCap::round;

IMElement capturedElement;

public class UIInterface
{
public:
   virtual void ::capturePointer();
   virtual void ::releasePointer();
   virtual void ::updateElement(GraphicalElement ge, bool unloadGraphics);
   virtual void ::refresh();
}

static subclass(UIInterface) uiInterface;

public void setUIInterface(Class /* subclass(UIInterface) */ui)   // FIXME: Warnings about Class struct as subclass
{
   uiInterface = (subclass(UIInterface))ui;
}

// FIXME: eC construct for obtaining VMethod ID
public define IMEonLeftButtonDown = 10;
public define IMEonLeftButtonUp   = 11;
public define IMEonMouseMove      = 12;

public bool imeMouseEvent(IMElement element, int x, int y, Modifiers mods, uint methodVID)
{
   bool result = true;
   if(capturedElement) element = capturedElement;
   while(element && result)
   {
      if(element && eClass_IsDerived(((Instance)element)._class, class(IMElement)))
      {
         IMElement im = (IMElement)element;
         int tx = x, ty = y;
         GraphicalElement p = element;
         bool (*vMethod)(IMElement, int, int, Modifiers) = ((Instance)im)._vTbl[methodVID];
         if(vMethod)
         {
            while(p)
            {
               tx -= p.position2D.x;
               ty -= p.position2D.y;
               p = p.parent;
            }
            result = vMethod(element, tx, ty, mods);
            uiInterface.refresh();
         }
      }
      element = (IMElement)element.parent;
   }
   return result;
}

public class IMElement : MultiGraphicalElement
{
   virtual bool onLeftButtonDown(int x, int y, Modifiers mods)
   {
      IMElement parent = (IMElement)this.parent;
      if(parent && eClass_IsDerived(((Instance)parent)._class, class(IMElement)))
         return parent.onLeftButtonDown(x, y, mods);
      return true;
   }
   virtual bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      IMElement parent = (IMElement)this.parent;
      if(parent && eClass_IsDerived(((Instance)parent)._class, class(IMElement)))
         return parent.onLeftButtonUp(x, y, mods);
      return true;
   }

   virtual bool onMouseMove(int x, int y, Modifiers mods)
   {
      IMElement parent = (IMElement)this.parent;
      if(parent && eClass_IsDerived(((Instance)parent)._class, class(IMElement)))
         return parent.onMouseMove(x, y, mods);
      return true;
   }

   void update(bool unloadGraphics)
   {
      uiInterface.updateElement(this, unloadGraphics);
   }
}

public class IButton : IMElement
{
   bool clicked;
   bool checked;
public:
   virtual void notifyClicked();

   property bool checked
   {
      set { checked = value; }
      get { return checked; }
   }

   bool onLeftButtonDown(int x, int y, Modifiers mods)
   {
      clicked = true;
      capturedElement = this;
      uiInterface.capturePointer();
      return false;
   }

   bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(clicked)
      {
         capturedElement = null;
         uiInterface.releasePointer();
         checked ^= true;
         notifyClicked();
      }
      clicked = false;
      return true;
   }
}

public class ImageButton : IButton
{
   Image image { this, hotSpot = { 0, 0 } };

   property ImageResource source
   {
      set { image.image = value; }
      get { value = image.image; }
   }
   watch(checked)
   {
      image.tint = checked ? lime : white;
   };

   bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      IButton::onLeftButtonUp(x, y, mods);
      image.tint = checked ? lime : white;
      return true;
   }
}

public class RoundedButton : IButton
{
   RoundedRectangle gShape { this, box = { left = 0, top = 0, width = (int)(150*dpiFactor), height = (int)(25*dpiFactor) }, rx = 10*dpiFactor, ry = 10*dpiFactor,
                                  stroke = { red, opacity = 0.5, width = (int)(2*dpiFactor) }, fill = { black, opacity = 0.2 } };
   Text gCaption { this, font = { face = "DejaVu Sans", color = white, size = 9*dpiFactor, outline = { color = red, opacity = 1.0, size = dpiFactor } },
                  position2D = { gShape.box.width / 2, gShape.box.height / 2 }, alignment = { center, middle } };

   watch(checked)
   {
      gShape.fill.color = checked ? green : black;
   };

   property const String caption
   {
      set { gCaption.text = value; }
   }

   bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      IButton::onLeftButtonUp(x, y, mods);
      gShape.fill.color = checked ? green : black;
      return true;
   }
}

public class ISlider : IMElement
{
   RoundedRectangle sliderOuterRect { this, box = { left = 0, top = 0, width = (int)(300.0/2*dpiFactor), height = (int)(15.0/2*dpiFactor) }, rx = 3*dpiFactor, ry = 3*dpiFactor,
                               stroke = { red, opacity = 1, cap = lineCap, /*join = joinType,*/ width = 1*dpiFactor } };
   RoundedRectangle sliderInnerRect { this, box = { left = 0, top = 0, width = (int)(300.0/2*dpiFactor), height = (int)(15.0/2*dpiFactor) }, rx = 3*dpiFactor, ry = 3*dpiFactor,
                               fill = { lavender, opacity = 0.7 }};
   Ellipse sliderKnob { this, stroke = { red, width = 2*dpiFactor, join = lineJoin, cap = lineCap, opacity = 0.8 }, fill = { red, opacity =  1 },
                               radius = 5*dpiFactor, center = { 0, sliderOuterRect.box.height / 2 } };

   bool knobSelected;
   float percent;

   property Size size
   {
      set
      {
         sliderInnerRect.box = { 0, 0, value.w-1, value.h-1 };
         sliderKnob.radius = value.h;
      }
      get
      {
         Box box = sliderOuterRect.box;
         value = { box.width, box.height };
      }
   }

   property float percent
   {
      set
      {
         percent = Min(100.0f, Max(0.0f, value));
         update();
      }
      get
      {
         return percent;
      }
   }

   void update()
   {
      int max = sliderOuterRect.box.width;

      sliderKnob.position2D.x = percent / 100.0f * max;
      sliderInnerRect.box.width = (int)(percent / 100.0f * max);

      uiInterface.updateElement(sliderInnerRect, true);
      uiInterface.updateElement(sliderKnob, false);
   }

   bool onLeftButtonDown(int x, int y, Modifiers mods)
   {
      knobSelected = true;
      capturedElement = this;
      uiInterface.capturePointer();

      if(knobSelected)
      {
         int max = sliderOuterRect.box.width;
         percent = Max(0.0f, Min(100.0f, x * 100.0f / max));
         update();
         notifyChanged(percent);
         return false;
      }
      return true;
   }

   bool onMouseMove(int x, int y, Modifiers mods)
   {
      if(knobSelected)
      {
         int max = sliderOuterRect.box.width;
         percent = Max(0.0f, Min(100.0f, x * 100.0f / max));
         update();
         notifyChanged(percent);
      }
      return true;
   }

   bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      knobSelected = false;
      capturedElement = null;
      uiInterface.releasePointer();
      return true;
   }

   virtual bool notifyChanged(float percent);
}

static Point startDrag;

public class IDialog : IMElement
{
   RoundedRectangle windowRect1 { this, box = { left = 0, top = 0, width = (int)(800/2*dpiFactor), height = (int)(40/2*dpiFactor) }, rx = 3 * dpiFactor, ry = 3 * dpiFactor,
                               stroke = { red, opacity = 0.5, cap = lineCap, /*join = joinType,*/ width = 2*dpiFactor }, fill = { black, opacity = 0.2 } };
   RoundedRectangle windowRect2 { this, box = { left = 0, top = windowRect1.box.height, width = (int)(800/2*dpiFactor), height = (int)(250/2*dpiFactor) }, rx = 3*dpiFactor, ry = 3*dpiFactor,
                               stroke = { red, opacity = 0.5, cap = lineCap, /*join = joinType,*/ width = 2*dpiFactor }, fill = { black, opacity = 0.2 } };

   Text windowName { this, font = { face = "DejaVu Sans", color = white, opacity = 1.0, size = 12*dpiFactor,
                     outline = { color = red, opacity = 1.0, size = 1*dpiFactor }}, position2D = { windowRect1.box.width / 2, windowRect1.box.height / 2 }, alignment = { center, middle } };

   bool onLeftButtonDown(int x, int y, Modifiers mods)
   {
      active = true;

      if(y >= 0 && y < 40/2*dpiFactor)
      {
         capturedElement = this;
         uiInterface.capturePointer();
         startDrag = { x, y };
      }
      return true;
   }

   bool onMouseMove(int x, int y, Modifiers mods)
   {
      if(capturedElement == this)
      {
         position2D = { position2D.x + x - startDrag.x, position2D.y + y - startDrag.y };
         update(false);
      }
      return true;
   }

   bool onLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(capturedElement)
      {
         capturedElement = null;
         uiInterface.releasePointer();
      }
      return true;
   }

   property bool active
   {
      set
      {
         if(value)
         {
            Iterator<GraphicalElement> it { parent.elements };
            Iterator<GraphicalElement> lastIt = parent.elements.lastIterator;

            it.Find(this);
            if(it.pointer != lastIt.pointer)
            {
               IDialog lastDlg = (IDialog)lastIt.data;
               if(eClass_IsDerived(((Instance)lastDlg)._class, class(IDialog)))
                  lastDlg.windowRect1.fill.color = black;
               parent.elements.Move(it.pointer, lastIt.pointer);
            }
            windowRect1.fill.color = white;
         }
         else
            windowRect1.fill.color = black;
         update(false);
      }
      get { return parent.elements.lastIterator.data == this; }
   }

   property const String caption
   {
      set { windowName.text = value; }
   }
   property Size size
   {
      set
      {
         windowRect1.box.width = value.w;
         windowRect2.box.width = value.w;
         windowRect2.box.height = value.h;
         windowName.position2D.x = value.w / 2;
      }
      get
      {
         value = { windowRect2.box.width, windowRect2.box.height };
      }
   }
}
