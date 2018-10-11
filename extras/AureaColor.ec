import "ecere"

#define AUREA_COLOR_RGB(N, R, G, B) Color aureaColor ## N(int x) \
{ \
   return AureaColor ## N { x }; \
} \
struct AureaColor ## N \
{ \
public: \
   int x; \
 \
   property Color \
   { \
      get \
      { \
         const float aurea = 1.61803398875; \
         byte x = (byte)this.x; \
         byte a = (byte)(x / aurea); \
         byte b = (byte)(x - a); \
         return Color { R, G, B }; \
      } \
   } \
}

AUREA_COLOR_RGB(RGB, x, a, b);
AUREA_COLOR_RGB(GBR, b, x, a);
AUREA_COLOR_RGB(BRG, a, b, x);
AUREA_COLOR_RGB(RBG, x, b, a);
AUREA_COLOR_RGB(GRB, a, x, b);
AUREA_COLOR_RGB(BGR, b, a, x);
