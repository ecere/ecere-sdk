import IMPORT_STATIC "ecere"

struct Vector2D : Pointf
{
   float dotProduct(Vector2D v)            { return x*v.x + y*v.y; }
   void scale(Vector2D v, float s)         { this = { v.x*s, v.y*s }; }
   void divide(Vector2D v, float s)        { this = { v.x/s, v.y/s }; }
   void add(Vector2D a, Vector2D v)        { this = { a.x+v.x, a.y+v.y }; }
   void subtract(Vector2D a, Vector2D v)   { this = { a.x-v.x, a.y-v.y }; }
   void normalize()                        { float norm = length; this = norm ? { x / norm, y / norm } : { 0, 0 }; }

   property float length                   { get { return (float)sqrt(x*x+y*y); } }
   property Vector2D normal                { get { value = { -y, x }; value.normalize(); } }
   property Vector2D unit                  { get { value = this; value.normalize(); } }
};
