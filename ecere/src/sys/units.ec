namespace sys;

import "instance"

public struct Point { int x, y; };
public struct Pointf { float x, y; };

public class MinMaxValue : int
{
   const char * OnGetString(char * string, void * fieldData, bool * needClass)
   {
      if(this == MAXINT)
         sprintf(string, "Inf");
      else if(this == MININT) //-MAXINT)
         sprintf(string, "-Inf");
      else
         sprintf(string, "%d", this);
      return string;
   }

   bool OnGetDataFromString(const char * string)
   {
      if(!strcmpi(string, "Inf"))
         this = MAXINT;
      else if(!strcmpi(string, "-Inf"))
         this = MININT; //-MAXINT;
      else
         this = strtol(string, null, 0);
      return true;
   }
};

public struct Size { MinMaxValue w, h; };


public struct Box
{
   int left, top, right, bottom;

   // Clip "box" against "Against" after adjusting position by (x,y)
   void ClipOffset(Box against, int x, int y)
   {
      // Clip Top Left
      //if(against)
      {
         if(left   + x < against.left)   left   = against.left   - x;
         if(top    + y < against.top)    top    = against.top    - y;
         if(right  + x > against.right)  right  = against.right  - x;
         if(bottom + y > against.bottom) bottom = against.bottom - y;

         if((left   + x > against.right) || // left  = against.right - x +1;
            (top    + y > against.bottom)|| // top   = against.bottom - y +1;
            (right  + x < against.left)  || // right = against.left - x;
            (bottom + y < against.top))     // bottom = against.top - y;
         {
            top = MAXINT;
            left = MAXINT;
            bottom = MININT;
            right = MININT;
         }
      }
   }

   void Clip(Box against)
   {
      // Clip Top Left
      if(against != null)
      {
         if(left   < against.left)   left   = against.left;
         if(top    < against.top)    top    = against.top;
         if(right  > against.right)  right  = against.right;
         if(bottom > against.bottom) bottom = against.bottom;

         if((left   > against.right)  ||
            (top    > against.bottom) ||
            (right  < against.left)   ||
            (bottom < against.top))
         {
            top = MAXINT;
            left = MAXINT;
            bottom = MININT;
            right = MININT;
         }
      }
   }

   bool Overlap(Box box)
   {
      return left < box.right && right > box.left && top < box.bottom && bottom > box.top;
   }

   bool IsPointInside(Point point)
   {
      return point.x >= left && point.y >= top && point.x <= right && point.y <= bottom;
   }

   property int width
   {
      set { right = left + value - 1; }
      get { return right - left + 1; }
   }

   property int height
   {
      set { bottom = top + value - 1; }
      get { return bottom - top + 1; }
   }
};

public class Radians : Angle
{
   public property Angle { };
}

public class Degrees : Angle
{
   public property Radians
   {
      //get { return (Angle)this * Pi / 180; }
      //set { return (Angle)(value * 180 / Pi); }
      get { return this * (double)Pi / 180; }
      set { return Angle { value * 180 / Pi }; }
   }
}

public define Pi = Radians { 3.1415926535897932384626433832795028841971 };

public class Distance      : double;
public class Meters        : Distance { public property Distance {} };
public class Centimeters   : Distance { public property Meters { set { return value * 100.0f;  } get { return this / 100.0f; } } };
public class Feet          : Distance { public property Meters { set { return value / 0.3048f; } get { return this * 0.3048f; } } };
