import "ecere"
import "Style"
import "Image"

class LayoutWindow : Window {
   class_no_expansion;
public:
   property LayoutWindow parent {
      get {
         return parent;
      }
      set {
         Window::parent = value;
         parent = value;
         parent.AddChild(this);
      }
   }
   Style style {sizeType=fit,block=false};
   /*property Style style {
      set {
         Size minFit {Width(),Height()};
         Size newFit;
         style = value;
         newFit = {Width(),Height()};
         if(newFit.w > minFit.w || newFit.h > minFit.h) {
            parent.Position(0,0);
         }
      }
   }*/
   property Style styleDefault {
      get {
         return styleDefault;
      }
      set {
         styleDefault = value;
         CascadeStyles();
      }
   }
   Style styleOver;
   Style styleActive;
private:
   Style styleDefault;
   LayoutWindow parent;
   Array<LayoutWindow> children;
   List<Style> styles;
   void AddChild(LayoutWindow child) {
      if(children) {
         for(testChild : children) {
            if(testChild == child) {
               return;
            }
         }
      } else {
         children = {};
      }
      children.Add(child);
      //if(!children.Find(child)) {
      //   children.Add(child);
      //}
   }
   void Position(int x, int y) {
      WindowSpacers borderSize = style.border.LayoutSize();
      WindowSpacers vacant {style.padding.top    + borderSize.top    ,
                            style.padding.right  + borderSize.right  ,
                            style.padding.bottom + borderSize.bottom ,
                            style.padding.left   + borderSize.left   };
      int x_offset=vacant.left;
      int y_offset=vacant.top;
      Size minFit = {Width(),Height()};
      if(style.sizeType == fit) {
         clientSize = minFit;
      } else if(style.sizeType == shrink) {
         size = {0,0};
         clientSize={Max(Max(minFit.w,style.size.w),size.w),
                     Max(Max(minFit.h,style.size.h),size.h)};
      } else if(style.sizeType == grow) {
         if(parent) {
            clientSize={parent.ContentWidth(),minFit.h};
         }
      } else if(style.sizeType == fixed) {
         clientSize=style.size;
      }
      if(parent != null) {
         position={x,y};
      }
      if(children) {
         for(child : children) {
            if(child.style.block==true) {
               if(x_offset > vacant.left) {
                  y_offset += child.Height();
               }
               x_offset += child.style.margin.left;
               y_offset += child.style.margin.top;
               child.Position(x_offset,y_offset);
               y_offset += child.Height() + child.style.margin.bottom;
               x_offset = vacant.left;
            } else {
               x_offset += child.style.margin.left;
               child.Position(x_offset,y_offset);
               x_offset += child.Width() + child.style.margin.right;
            }
         }
      }
   }
   int Height() {
      int height = ContentHeight();
      WindowSpacers borderSize = style.border.LayoutSize();
      height += style.padding.top + style.padding.bottom;
      height += borderSize.top + borderSize.bottom;
      return height;
   }
   int Width() {
      int width = ContentWidth();
      WindowSpacers borderSize = style.border.LayoutSize();
      width += style.padding.left + style.padding.right;
      width += borderSize.right + borderSize.left;
      return width;
   }
   int DisplayHeight() {
       return Height() + style.margin.top + style.margin.bottom;
   }
   int DisplayWidth() {
       return Width() + style.margin.left + style.margin.right;
   }
   Size MinContentSize() {
      Size oldSize = clientSize;
      Size newSize;
      size = {0,0};
      newSize = size;
      clientSize = oldSize;
      return newSize;
   }
   int ContentHeight() {
      Size minSize = MinContentSize();
      int myHeight = 0;
      int currentHeight = 0;
      if(children) {
         for(child : children) {
            if(child.style.block==false) {
               int childHeight = child.DisplayHeight();
               if(childHeight > currentHeight) {
                  currentHeight = childHeight;
               }
            } else {
               myHeight += currentHeight;
               currentHeight = 0;
               myHeight += child.DisplayHeight();
            }
         }
      }
      myHeight += currentHeight;
      minSize.h = Max(minSize.h, style.size.h);
      if(minSize.h > myHeight && parent != null) {
         myHeight = minSize.h;
      }
      return myHeight;
   }
   int ContentWidth() {
      Size minSize = MinContentSize();
      int myWidth=0;
      int currentWidth=0;
      if(children) {
         for(child : children) {
            if(child.style.block==false) {
               currentWidth += child.DisplayWidth();
            } else {
               if(currentWidth > myWidth) {
                  myWidth = currentWidth;
               }
               if(child.DisplayWidth() > myWidth) {
                  myWidth = child.DisplayWidth();
               }
               currentWidth = 0;
            }
         }
      }
      if(currentWidth > myWidth) {
         myWidth = currentWidth;
      }
      minSize.w = Max(minSize.w, style.size.w);
      if(minSize.w > myWidth && parent != null) {
         myWidth = minSize.w;
      }
      return myWidth;
   }

   bool OnMouseOver(int x, int y, Modifiers mods) {
      if(styleOver) {
         styleOver.show = true;
         CascadeStyles();
      }
      return true;
   }

   bool OnMouseLeave(Modifiers mods)
   {
      if(styleOver) {
         styleOver.show = false;
         CascadeStyles();
      }
      return true;
   }

   bool OnActivate(bool active, Window previous, bool * goOnWithActivation, bool direct)
   {
      if(styleActive) {
         if(active) {
            styleActive.show = true;
         } else {
            styleActive.show = false;
         }
         CascadeStyles();
      }
      return true;
   }

   virtual Container<Style> AllStyles() {
      return Array<Style>{[styleDefault, styleActive, styleOver]};
   }

   void CascadeStyles() {
      for(overlay : AllStyles()) {
         if(overlay && overlay.show) {
            style.Overlay(overlay);
         }
      }
      Update(null);
   }

   void DrawBackground(Surface surface) {
      if(style.background) {
         if(style.background.color) {
            surface.background = style.background.color;
            surface.Clear(colorBuffer);
         }

         if(style.background.images) {
            for(image : style.background.images) {
               image.Draw(surface,0,0,clientSize.w-1,clientSize.h-1);
            }
         }
      }
   }

   void DrawBorders(Surface surface) {
      ColorFillImage colorImage {};
      Size s = clientSize;
      if(style.border) {
         if(style.border.top) {
            if(style.border.top.color) {
                  colorImage.color = style.border.top.color;
                  colorImage.Draw(surface, 0,0,clientSize.w-1,style.border.top.thickness-1);
               }
            for(image : style.border.top.images) {
               image.Draw(surface, 0,0,clientSize.w-1,style.border.top.thickness-1);
            }
         }
         if(style.border.right) {
         int borderLeftEdge = clientSize.w-style.border.right.thickness;
            if(style.border.right.color) {
                  colorImage.color = style.border.right.color;
                  colorImage.Draw(surface, borderLeftEdge,0,clientSize.w-1,clientSize.h-1);
               }
            for(image : style.border.right.images) {
               image.Draw(surface, borderLeftEdge,0,clientSize.w-1,clientSize.h-1);
            }
         }
         if(style.border.bottom) {
         int borderTopEdge = clientSize.h-style.border.bottom.thickness;
            if(style.border.bottom.color) {
                  colorImage.color = style.border.bottom.color;
                  colorImage.Draw(surface, 0,borderTopEdge,clientSize.w-1,clientSize.h-1);
               }
            for(image : style.border.bottom.images) {
               image.Draw(surface, 0,borderTopEdge,clientSize.w-1,clientSize.h-1);
            }
         }
         if(style.border.left) {
            if(style.border.left.color) {
                  colorImage.color = style.border.left.color;
                  colorImage.Draw(surface, 0,0,style.border.left.thickness-1,clientSize.h-1);
               }
            for(image : style.border.left.images) {
               image.Draw(surface, 0,0,style.border.left.thickness-1,clientSize.h-1);
            }
         }
      }
   }

   void OnRedraw(Surface surface) {
      DrawBackground(surface);
      DrawBorders(surface);
   }
}