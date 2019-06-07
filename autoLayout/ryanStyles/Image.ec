import "ecere"

struct CompoundAnchor {
   float ratio;
   int offset;
};

class Image {
public:
   CompoundAnchor left, top, right, bottom;
   left = {0,0};
   top = {0,0};
   right = {1,0};
   bottom = {1,0};
   void Draw(Surface surface, int bx1, int by1, int bx2, int by2)
   {
      int w = bx2 - bx1 + 1;
      int h = by2 - by1 + 1;
      int x1 = (int)(bx1 + left.ratio   * w + 0.5 + left.offset  )    ;
      int y1 = (int)(by1 + top.ratio    * h + 0.5 + top.offset   )    ;
      int x2 = (int)(bx1 + right.ratio  * w + 0.5 + right.offset ) - 1;
      int y2 = (int)(by1 + bottom.ratio * h + 0.5 + bottom.offset) - 1;
      Render(surface, x1, y1, x2, y2);
    }
   virtual void Render(Surface surface, int x1, int y1, int x2, int y2);
}

class BitmapImage : Image {
public:
   Bitmap bitmap;
   void Render(Surface surface, int x1, int y1, int x2, int y2) {
      surface.Blit(bitmap,0,0,x1,y1,x2-x1+1,y2-y1+1);
   }
}

class ColorFillImage : Image {
public:
   ColorAlpha color;
   void Render(Surface surface, int x1, int y1, int x2, int y2) {
      surface.background = color;
      surface.Area(x1,y1,x2,y2);
   }
}

class GradientImage : Image {
public:
   property Container<ColorKey> keys {
      get {return keys;}
      set {
         keys.copySrc = value;
      }
   }
   Array<ColorKey> keys {};
   void Render(Surface surface, int x1, int y1, int x2, int y2) {
      surface.Gradient(keys.array, keys.count, 0, vertical, x1,y1,x2,y2);
   }
}
