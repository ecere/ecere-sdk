import "ecere"
import "Image"

class WindowBackground : struct {
public:
   Color color;
   List<Image> images;
};

struct WindowSpacers {
public:
   property int {
      get {
         return 1;
      }
      set {
         top = value;
         right = value;
         bottom = value;
         left = value;
      }
   }
   int top;
   int right;
   int bottom;
   int left;
};

enum WindowBorderStyle {
   solid, dashed, twin, stripe
};

class WindowBorder : struct {
public:
   int thickness;
   WindowBorderStyle style;
   ColorAlpha color;
   /*property Container<Image> images {
      get {return images;}
      set {
         images.copySrc = value;
      }
   }*/ // this should work but hangs the compiler
   List<Image> images;
};

class WindowBorderCorner : struct {
public:
   float radius;
   List<Image> images;
};

class WindowBorderCorners : struct
{
public:
   property WindowBorderCorner {
      get {}
      /*set {
         top.left = value;
         top.right = value;
         bottom.left = value;
         bottom.right = value;
      }*/
   };
   WindowBorderCornersB top;
   WindowBorderCornersB bottom;
};

class WindowBorderCornersB : struct {
public:
   property WindowBorderCorner {
      get {}
      /*set {
         left = value;
         right = value;
      }*/
   }
   WindowBorderCorner left;
   WindowBorderCorner right;
};

class WindowBorders : struct {
public:
   property WindowBorder {
      get {}
      /*set {
         top = value;
         right = value;
         bottom = value;
         left = value;
      }*/
   }
   WindowBorder top;
   WindowBorder right;
   WindowBorder bottom;
   WindowBorder left;
   WindowBorderCorners corners;
   WindowBorders next;
   WindowSpacers LayoutSize() {
      WindowBorders child;
      WindowSpacers layoutSize={0,0,0,0};
      for(child = this; child; child=child.next) {
         if(child.top) {
            layoutSize.top    += child.top.thickness;
         }
         if(child.right) {
            layoutSize.right  += child.right.thickness;
         }
         if(child.bottom) {
            layoutSize.bottom += child.bottom.thickness;
         }
         if(child.left) {
            layoutSize.left   += child.left.thickness;
         }
      }
      return layoutSize;
   }
};

enum BoxSizeType {
   fit, fixed, grow, shrink
};

class Style : struct {
public:
   Style() {
      show = true;
   }
   BoxSizeType sizeType;
   property BoxSizeType sizeType {
      set {
         sizeType = value;
         setSizeType = true;
      }
   }
   WindowBackground background;
   Size size;
   property Size size {
      set {
         size = value;
         setSize = true;
      }
   }
   bool block;
   property bool block {
      set {
         block = value;
         setBlock = true;
      }
   }
   WindowSpacers padding {};
   WindowBorders border;
   WindowSpacers margin {};
   WindowSpacers chrome {};
   bool show;
   void Overlay(Style overlay) {
      // need to make block and sizeType classes so they can be null?
      if(overlay) {
         if(overlay.setBlock) {
            block = overlay.block;
         }
         if(overlay.setSizeType) {
            sizeType = overlay.sizeType;
         }
         if(overlay.background) {
            if(!background) {
               background = {};
            }
            if(overlay.background.color) {
               background.color = overlay.background.color;
            }
            if(overlay.background.images) {
               background.images = overlay.background.images;
            }
         }
         if(overlay.setSize) {
            size = overlay.size;
         }
         if(overlay.padding) {
            padding = overlay.padding;
         }
         if(overlay.border) {
            if(!border) {
               border = {};
            }
            if(overlay.border.top) {
               border.top = overlay.border.top;
            }
            if(overlay.border.right) {
               border.right = overlay.border.right;
            }
            if(overlay.border.bottom) {
               border.bottom = overlay.border.bottom;
            }
            if(overlay.border.left) {
               border.left = overlay.border.left;
            }
         }
         if(overlay.margin) {
            margin = overlay.margin;
         }
         if(overlay.chrome) {
            chrome = overlay.chrome;
         }
      }
   }
private:
   bool setSize;
   bool setSizeType;
   bool setBlock;
};