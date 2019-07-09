public import IMPORT_STATIC "ecere"

enum GEType { none, shape, text, image, path3D, multi, model };

public enum GraphicalUnit { pixels, meters, feet, percent, points, em, screenInches, screenCM, screenMM };

public enum VAlignment { top, middle, bottom };
public enum HAlignment { left, center, right };

public struct Alignment2D
{
   HAlignment horzAlign;
   VAlignment vertAlign;
};

public class GEFont : struct   // NOTE: This will likely be renamed to simply Font in next-gen Ecere Graphics
{
public:
   const String face;
   float size;
   bool bold, italic, underline;
   Color color;
   Outline outline { };
   float opacity;

   size = 12;
   opacity = 1;
   outline.opacity = 1;
   color = black;
}

public struct Outline
{
   Color color;
   float size;
   float opacity;
};

public enum LineJoin { miter, round, bevel };
public enum LineCap { flat, round, square };
public enum StippleType { light, medium, heavy };
public enum HatchType { forward, backward, xCross, cross };

public class Fill : struct
{
public:
   Color color;
   Array<GraphicalElement> pattern;
   StippleType stipple;
   HatchType hatch;
   Array<ColorKey> gradient;
   float opacity;

   color = white;
   opacity = 1.0;
}

public class Stroke : struct
{
public:
   Color color;
   Array<GraphicalElement> pattern;
   float opacity;
   float width;
   StrokeStyling center { };
   StrokeStyling casing { };
   LineJoin join;
   LineCap cap;
   Array<int> dashes;
   GraphicalUnit widthUnit;

   width = 1.0f;
   opacity = 1.0f;
   color = black;
}

public struct StrokeStyling
{
   Color color;
   float opacity;
   float width;
   GraphicalUnit widthUnit;
};

public class GraphicalElement
{
   Transform transform; // The transform applied at this specific level of the hierarchy
   float opacity;
   GEType type;
   GraphicalUnit unit;

   transform.scaling = { 1, 1, 1 };
   opacity = 1.0f;

   MultiGraphicalElement parent;

public:
   public property MultiGraphicalElement parent
   {
      set
      {
         if(parent != value)
         {
            incref this;
            if(parent)
            {
               parent.elements.TakeOut(this);
               _refCount--;
            }
            parent = value;
            if(value)
            {
               value.elements.Add(this);
               incref this;
            }
            delete this;
         }
      }
      get { return parent; }
   }

   property Transform transform3D
   {
      set { transform = value; }
      get { value = transform; }
   };
   property Pointf position2D
   {
      set { transform.position = { value.x, value.y, 0 }; }
      get { value = { (float)transform.position.x, (float)transform.position.y }; }
   };
   property Vector3D position3D
   {
      set { transform.position = value; }
      get { value = transform.position; }
   };
   property Degrees orientation2D
   {
      // FIXME: This Quaternion storage is quite inefficient for 2D...
      set { transform.orientation.Yaw(value); }
      get { Euler euler; euler.FromQuaternion(transform.orientation, yxz); return euler.yaw; }
   };
   property Quaternion orientation3D
   {
      set { transform.orientation = value; }
      get { value = transform.orientation; }
   };
   property float scaling
   {
      set { transform.scaling = { value, value, value }; }
      get { return transform.scaling.x; }
   }
   property Pointf scaling2D
   {
      set { transform.scaling = { value.x, value.y, 1 }; }
      get { value = { transform.scaling.x, transform.scaling.y }; }
   };
   property Vector3Df scaling3D
   {
      set { transform.scaling = value; }
      get { value = transform.scaling; }
   };
   property float opacity
   {
      set { opacity = value; }
      get { return opacity; }
   };
}

enum ShapeType { dot, path, rectangle, ellipse, arc };

public class Shape : GraphicalElement
{
   ShapeType shpType;

   Fill fill { opacity = 0.0 };
   Stroke stroke { };

   type = shape;

public:
   property Stroke stroke
   {
      set { delete stroke; stroke = value; }
      get { return stroke; }
   };

   property Fill fill
   {
      set { delete fill; fill = value; }
      get { return fill; }
   };
}

public class RoundedRectangle : Shape
{
   float rx, ry;
   Box box;
   //float radius, rounded;   // Alternate way to specify? Two sets of properties setting same private values?

   shpType = rectangle;

public:
   property Box box
   {
      set { box = value; }
      get { value = box; }
   }
   property float rx
   {
      set { rx = value; }
      get { return rx; }
   }
   property float ry
   {
      set { ry = value; }
      get { return ry; }
   }
}

public class Ellipse : Shape
{
   Pointf center;
   float radius, k;

   shpType = ellipse;

   radius = 10;
   k = 1;

public:
   property Pointf center
   {
      set { center = value; }
      get { value = center; }
   }

   property float radius
   {
      set { radius = value; }
      get { return radius; }
   }

   property float k
   {
      set { k = value; }
      get { return k; }
   }
}

public class Path : Shape
{
   Array<Pointf> nodes { };
   bool closed, needTesselation;

   shpType = path;

   // FIXME: eC improvements: Clarify and fix usage of private members in base class...
public:
   property Container<Pointf> nodes
   {
      set { nodes.copySrc = value; }
      get { return nodes; }
   }

   property bool closed
   {
      set { closed = value; }
      get { return closed; }
   }

   // TODO: Rather than letting the user set this, determine this automatically when setting the nodes
   // NOTE: Should handle complex self-intersecting cases.
   property bool needTesselation
   {
      set { needTesselation = value; }
      get { return needTesselation; }
   }
}

/*  open:   an arc as a single line, with no fill
    sector: an arc that has lines to its center point from each end, like a pie slice,
            with an optional inner radius removing a center portion
    chord:  an arc where the two ends are connected by a straight line, with a fill
 */
public enum ArcType { open, sector, chord };

public class Arc : Shape
{
   Degrees startAngle, deltaAngle;
   Pointf center;
   float radius;
   float innerRadius; // Used with sector ArcType
   ArcType arcType;

   shpType = arc;
   innerRadius = 0;

public:
   property Pointf center
   {
      set { center = value; }
      get { value = center; }
   }

   property float radius
   {
      set { radius = value; }
      get { return radius; }
   }

   property float innerRadius
   {
      set { innerRadius = value; }
      get { return innerRadius; }
   }

   property Degrees startAngle
   {
      set { startAngle = value; }
      get { return startAngle; }
   }

   property Degrees deltaAngle
   {
      set { deltaAngle = value; }
      get { return deltaAngle; }
   }

   property ArcType arcType
   {
      set { arcType = value; }
      get { return arcType; }
   }
}

public class Dot : Shape
{
   Pointf point;
   float size;

   shpType = dot;

public:
   property Pointf point
   {
      set { point = value; }
      get { value = point; }
   }
}

public class Path3D : GraphicalElement
{
   Array<Vector3Df> nodes { };

   Stroke stroke { };

   // FIXME: eC improvements: Clarify and fix usage of private members in base class...

   type = path3D;
public:
   property Array<Vector3Df> nodes
   {
      set { nodes.copySrc = value; }
      get { return nodes; }
   }

   property Stroke stroke
   {
      set { delete stroke; stroke = value; }
      get { return stroke; }
   };
}

// TODO: !!
public class MultiGraphicalElement : private GraphicalElement
{
   Array<GraphicalElement> elements { };

   type = multi;

public:
   property Container<GraphicalElement> elements
   {
      set
      {
         elements.copySrc = value;
      }
      get { return elements; }
   }

   // NOTE: Duplicating the GraphicalElement properties here in an ugly way so that 'elements' is the default member...
   //       A lot of ugly casts needed due to current eC limitations and lack of clear specifications on inheritance, data member vs. properties private/public members
   //       The whole default member aspect also to be reviewed.
   public property MultiGraphicalElement parent
   {
      set
      {
         if(*&((GraphicalElement)this).parent != value)
         {
            incref this;
            if(*&((GraphicalElement)this).parent)
            {
               *&((GraphicalElement)this).parent.elements.TakeOut(this);
               _refCount--;
            }
            *&((GraphicalElement)this).parent = value;
            if(value)
            {
               value.elements.Add(this);
               incref this;
            }
            delete this;
         }
      }
      get { return *&((GraphicalElement)this).parent; }
   }

   property Transform transform3D
   {
      set { *&transform = value; }
      get { value = (*&transform); }
   };
   property Pointf position2D
   {
      set { (*&transform).position = { value.x, value.y, 0 }; }
      get { value = { (float)(*&transform).position.x, (float)(*&transform).position.y }; }
   };
   property Vector3D position3D
   {
      set { (*&transform).position = value; }
      get { value = (*&transform).position; }
   };
   property Degrees orientation2D
   {
      // FIXME: This Quaternion storage is quite inefficient for 2D...
      set { (*&transform).orientation.Yaw(value); }
      get { Euler euler; euler.FromQuaternion((*&transform).orientation, yxz); return euler.yaw; }
   };
   property Quaternion orientation3D
   {
      set { (*&transform).orientation = value; }
      get { value = (*&transform).orientation; }
   };
   property float scaling
   {
      set { (*&transform).scaling = { value, value, value }; }
      get { return (*&transform).scaling.x; }
   }
   property Pointf scaling2D
   {
      set { (*&transform).scaling = { value.x, value.y, 1 }; }
      get { value = { (*&transform).scaling.x, (*&transform).scaling.y }; }
   };
   property Vector3Df scaling3D
   {
      set { (*&transform).scaling = value; }
      get { value = (*&transform).scaling; }
   };
   property float opacity
   {
      set { *&((GraphicalElement)this).opacity = value; }
      get { return *&((GraphicalElement)this).opacity; }
   };


   ~MultiGraphicalElement()
   {
      Iterator<GraphicalElement> it { elements };
      it.Next();
      while(it.pointer)
      {
         IteratorPointer ptr = elements.GetNext(it.pointer);
         GraphicalElement p = it.data;
         p.parent = null;
         it.pointer = ptr;
      }
   }
}

public class Text : GraphicalElement
{
   type = text;

public:
   String text;   // FIXME: Both member and property are currently public, ECCSS otherwise currently does not set text properly
   GEFont font;
   Alignment2D alignment;

   property const String text
   {
      set { delete text; text = CopyString(value); }
      get { return text; }
   }
}

public struct ImageResource
{
   const String path;
/*
   property const String path
   {
      set { delete path; path = CopyString(value); }
      get { return path; }
   }
*/
};

public class Image : GraphicalElement
{
   type = image;
public:
   ImageResource image;

   // (hotSpot.x * width, hotSpot.y * height) is the pixel which will be shown at the graphic's (0, 0) position
   Pointf hotSpot;
   Color tint;

   tint = white;

   property Pointf hotSpot
   {
      set { hotSpot = value; }
      get { value = hotSpot; }
   }
}

public class Model : GraphicalElement
{
   type = model;
public:
   ImageResource model;
}
