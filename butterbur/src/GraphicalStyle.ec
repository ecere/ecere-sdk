/******************************************************************************
 Styling of GraphicalElements from eC Cascading Style Sheets
******************************************************************************/
public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA" // For FieldValue

import "eccss"
import "GraphicalElement"

// NOTE: We should probably split these into separate classes for Shapes, Text, Images as they are use to style different things
public class GraphicalStyleMask : StylesMask
{
public:
   // Generic styles
   bool visibility         :1: 0;
   bool opacity            :1: 1;
   bool scaling          :1: 2;
   //bool transform3D        :1: 3;
   bool zOrder             :1: 3;
};

public class ShapeStyleMask : GraphicalStyleMask
{
public:
   // Shapes Styles
   bool fillPattern        :1: 5;
   bool fillColor          :1: 6;
   bool fillOpacity        :1: 7;
   bool fillStippleStyle   :1: 8;
   bool fillHatchStyle     :1: 9;
   bool fillGradient       :1:10;
   bool strokePattern      :1:11;
   bool strokeOpacity      :1:12;
   bool strokeWidth        :1:13;
   bool strokeColor        :1:14;
   bool strokeCenterWidth  :1:15;
   bool strokeCenterColor  :1:16;
   bool strokeCenterOpacity:1:17;
   bool strokeCasingWidth  :1:18;
   bool strokeCasingColor  :1:19;
   bool strokeCasingOpacity:1:20;
   bool strokeJoin         :1:21;
   bool strokeCap          :1:22;
   bool strokeDashPattern  :1:23;
};


public class TextStyleMask : GraphicalStyleMask
{
public:
   // Text Styles
   bool text               :1:5;
   bool fontFace           :1:6;
   bool fontSize           :1:7;
   bool fontBold           :1:8;
   bool fontItalic         :1:9;
   bool fontColor          :1:10;
   bool fontOpacity        :1:11;
   bool fontOutlineSize    :1:12;
   bool fontOutlineColor   :1:13;
   bool fontOutlineOpacity :1:14;
   bool alignmentHorzAlign :1:15;
   bool alignmentVertAlign :1:16;
};

public class ImageStyleMask : GraphicalStyleMask
{
public:
   // Image Styles
   bool imagePath          :1:5;
   bool tint               :1:6;
   bool hotSpot            :1:7;
};

public enum GraphicalStyleKind : GraphicalStyleMask
{
   zOrder = GraphicalStyleMask { zOrder = true },
   visibility = GraphicalStyleMask { visibility = true },
   scaling = GraphicalStyleMask { scaling = true },
   opacity = GraphicalStyleMask { opacity = true }
   //transform3D = GraphicalStyleMask { transform3D = true }
};

public enum ShapeStyleKind : GraphicalStyleKind
{
   fill = ShapeStyleMask { fillPattern = true, fillColor = true, fillOpacity = true, fillStippleStyle = true, fillHatchStyle = true, fillGradient = true },
   fillPattern = ShapeStyleMask { fillPattern = true },
   fillColor = ShapeStyleMask { fillColor = true },
   fillOpacity = ShapeStyleMask { fillOpacity = true },
   fillStippleStyle = ShapeStyleMask { fillStippleStyle = true },
   fillHatchStyle = ShapeStyleMask { fillHatchStyle = true },
   fillGradient = ShapeStyleMask { fillGradient = true },
   stroke = ShapeStyleMask { strokePattern = true, strokeOpacity = true, strokeWidth = true, strokeColor = true, strokeCenterWidth = true, strokeCenterColor = true, strokeCasingWidth = true, strokeCasingColor = true  },
   strokePattern = ShapeStyleMask { strokePattern = true },
   strokeOpacity = ShapeStyleMask { strokeOpacity = true },
   strokeWidth = ShapeStyleMask { strokeWidth = true },
   strokeColor = ShapeStyleMask { strokeColor = true },
   strokeCenter = ShapeStyleMask { strokeCenterWidth = true, strokeCenterColor = true },
   strokeCenterWidth = ShapeStyleMask { strokeCenterWidth = true },
   strokeCenterColor = ShapeStyleMask { strokeCenterColor = true },
   strokeCenterOpacity = ShapeStyleMask { strokeCenterOpacity = true },
   strokeCasing = ShapeStyleMask { strokeCasingWidth = true, strokeCasingColor = true },
   strokeCasingWidth = ShapeStyleMask { strokeCasingWidth = true },
   strokeCasingColor = ShapeStyleMask { strokeCasingColor = true },
   strokeCasingOpacity = ShapeStyleMask { strokeCasingOpacity = true },
   strokeJoin = ShapeStyleMask { strokeJoin = true },
   strokeCap = ShapeStyleMask { strokeCap = true },
   strokeDashPattern = ShapeStyleMask { strokeDashPattern = true }
};

public enum TextStyleKind : GraphicalStyleKind
{
   text = TextStyleMask { text = true },
   font = TextStyleMask
   {
      fontFace = true, fontSize = true, fontBold = true, fontItalic = true, fontColor = true, fontOpacity = true,
      fontOutlineSize = true, fontOutlineColor = true, fontOutlineOpacity = true
   },
   fontFace = TextStyleMask { fontFace = true },
   fontSize = TextStyleMask { fontSize = true },
   fontBold = TextStyleMask { fontBold = true },
   fontItalic = TextStyleMask { fontItalic = true },
   fontColor = TextStyleMask { fontColor = true },
   fontOpacity = TextStyleMask { fontOpacity = true },
   fontOutline = TextStyleMask { fontOutlineSize = true, fontOutlineColor = true, fontOutlineOpacity = true },
   fontOutlineSize = TextStyleMask { fontOutlineSize = true },
   fontOutlineColor = TextStyleMask { fontOutlineColor = true },
   fontOutlineOpacity = TextStyleMask { fontOutlineOpacity = true },
   alignment = TextStyleMask { alignmentHorzAlign = true, alignmentVertAlign = true },
   alignmentHorzAlign = TextStyleMask { alignmentHorzAlign = true },
   alignmentVertAlign = TextStyleMask { alignmentVertAlign = true }
};

public enum ImageStyleKind : GraphicalStyleKind
{
   image = ImageStyleMask { imagePath = true },
   imagePath = ImageStyleMask { imagePath = true },
   tint = ImageStyleMask { tint = true },
   hotSpot = ImageStyleMask { hotSpot = true }
};

// TODO: Replace these by class reflection

Map<String, GraphicalStyleKind> styleIdentifierMap
{ [
   { "visibility", visibility },
   { "opacity", opacity },
   { "scaling", scaling },
   { "zOrder", zOrder }
] };

Map<String, ShapeStyleKind> shapeStyleIdentifierMap
{ [
   { "fill", fill },
   { "fill.pattern", fillPattern },
   { "fill.color", fillColor },
   { "fill.opacity", fillOpacity },
   { "fill.stipple", fillStippleStyle },
   { "fill.hatch", fillHatchStyle },
   { "fill.gradient", fillGradient },
   { "stroke", stroke },
   { "stroke.pattern", strokePattern },
   { "stroke.join", strokeJoin },
   { "stroke.cap", strokeCap },
   { "stroke.dashPattern", strokeDashPattern },
   { "stroke.opacity", strokeOpacity },
   { "stroke.color", strokeColor },
   { "stroke.width", strokeWidth },
   { "stroke.casing", strokeCasing },
   { "stroke.casing.width", strokeCasingWidth },
   { "stroke.casing.color", strokeCasingColor },
   { "stroke.casing.opacity", strokeCasingOpacity },
   { "stroke.center", strokeCenter },
   { "stroke.center.width", strokeCenterWidth },
   { "stroke.center.color", strokeCenterColor },
   { "stroke.center.opacity", strokeCenterOpacity }
] };

Map<String, TextStyleKind> textStyleIdentifierMap
{ [
   { "text", text },
   { "font", font },
   { "font.face", fontFace },
   { "font.size", fontSize },
   { "font.bold", fontBold },
   { "font.italic", fontItalic },
   { "font.color", fontColor }, //TODO review: belongs to font or text?
   { "color", fontColor },
   { "font.opacity", fontOpacity },
   { "font.outline", fontOutline },
   { "font.outline.size", fontOutlineSize },
   { "font.outline.color", fontOutlineColor },
   { "font.outline.opacity", fontOutlineOpacity },
   { "font.alignment", alignment }, // TODO review
   { "alignment", alignment },
   { "alignment.horzAlign", alignmentHorzAlign },
   { "alignment.vertAlign", alignmentVertAlign }
] };

Map<String, ImageStyleKind> imageStyleIdentifierMap
{ [
   { "image", image },
   { "hotSpot", hotSpot },
   { "tint", tint }
] };


Map<GraphicalStyleKind, const String> stringFromMaskMap
{ [
   { opacity, "opacity" },
   { scaling, "scaling" }
   //{ transform3D, "transform3D" }
] };


Map<ShapeStyleKind, const String> shapeStringFromMaskMap
{ [
   { fill, "fill" },
   { fillPattern, "fill.pattern" },
   { fillColor, "fill.color" },
   { fillOpacity, "fill.opacity" },
   { fillStippleStyle, "fill.stippleStyle" },
   { fillHatchStyle, "fill.hatchStyle" },
   { fillGradient, "fill.gradient" },
   { stroke, "stroke" },
   { strokePattern, "stroke.pattern" },
   { strokeOpacity, "stroke.opacity" },
   { strokeColor, "stroke.color" },
   { strokeWidth, "stroke.width" },
   { strokeCasing, "stroke.casing" },
   { strokeCasingWidth, "stroke.casing.width" },
   { strokeCasingColor, "stroke.casing.color" },
   { strokeJoin, "stroke.join" },
   { strokeCap, "stroke.cap" },
   { strokeDashPattern, "stroke.dashPattern"  }
] };

Map<TextStyleKind, const String> textStringFromMaskMap
{ [
   { alignment, "alignment" },
   { alignmentHorzAlign, "alignment.horzAlign" },
   { alignmentVertAlign, "alignment.vertAlign" },
   { text, "text" },
   { font, "font" },
   { fontFace, "font.face" },
   { fontSize, "font.size" },
   { fontBold, "font.bold" },
   { fontItalic, "font.italic" },
   { fontColor, "font.color" },
   { fontOpacity, "font.opacity" },
   { fontOutline, "font.outline" },
   { fontOutlineSize, "font.outline.size" },
   { fontOutlineColor, "font.outline.color" },
   { fontOutlineOpacity, "font.outline.opacity" }
] };

Map<ImageStyleKind, const String> imageStringFromMaskMap
{ [
   { image, "image" },
   { hotSpot, "hotSpot"},
   { tint, "tint" }
] };


public struct GraphicalStyleEvaluator : ECCSSEvaluator
{
   void applyStyle(GraphicalStyle object, GraphicalStyleMask mSet, const FieldValue value, int unit)
   {
      object.applyStyle(mSet, value, unit);
   }
};
public class GraphicalStyle : struct
{
public:
   int zOrder;
   bool visibility;
   float opacity;
   Transform transform;

   visibility = true;
   opacity = 1.0;

   // Internal...
   ExpFlags flags;

   //return sym for visualization classes
   public GraphicalStyle ::build(CMSSStyleSheet styleSheet, ECCSSEvaluator evaluator, Class stylesClass)
   {
      GraphicalStyle symbolizer = eInstance_New(stylesClass ? stylesClass : class(GraphicalStyle));
      GraphicalStyleMask m = 0xffffffffffffffff;
      ExpFlags flg = 0;
      if(styleSheet)
      {
         m = (GraphicalStyleMask)styleSheet.list.apply(symbolizer, m, evaluator, &flg);
      }
      if(m) symbolizer.applyDefaults(m);
      symbolizer.flags = flg;
      return symbolizer;
   }

   private void applyDefaults(GraphicalStyleMask mask)
   {
      if(mask.opacity) opacity = 1.0;
      if(mask.visibility) visibility = true;
   }

   private void applyStyle(GraphicalStyleKind mSet, const FieldValue value, int unit)
   {
      switch(mSet)
      {
         case opacity: opacity = (float)value.r; break;
         case visibility:
         {
            switch(value.type.type)
            {
               case integer: visibility = (bool)value.i; break;
               case text: visibility = !strcmpi(value.s, "true") ? true : false; break;
            }
            break;
         }
         case zOrder: zOrder = (int)value.i; break;
         case scaling: transform.scaling = { value.i, value.i, 1 }; break;
      }
   }
}

public class ShapeStyle : GraphicalStyle
{
public:
   // Properties...
   Fill fill { };
   Stroke stroke { };

   //return sym for visualization classes
   public ShapeStyle ::build(CMSSStyleSheet styleSheet, ECCSSEvaluator evaluator)
   {
       return (ShapeStyle)GraphicalStyle::build(styleSheet, evaluator, class(ShapeStyle));
   }

   private void applyDefaults(ShapeStyleMask mask)
   {
      if(mask.fillColor) fill.color = white;
      if(mask.strokeColor) stroke.color = black;
      GraphicalStyle::applyDefaults(mask);
   }

   private void applyStyle(ShapeStyleKind mSet, const FieldValue value, int unit)
   {
      switch(mSet)
      {
         //pattern needs special code
         //case fillPattern: if(!fill.pattern) fill.pattern = { }; break;
         case fillColor: fill.color = (Color)value.i; break;
         case fillOpacity: fill.opacity = (float)value.r; break;
         case fillStippleStyle: fill.stipple = (StippleType)value.i; break;
         case fillHatchStyle: fill.hatch = (HatchType)value.i; break;
         case fillGradient: fill.gradient = value.b; break;
         case strokePattern: stroke.pattern = { }; break;
         case strokeOpacity: stroke.opacity = (float)value.r; break;
         case strokeColor: stroke.color = (Color)value.i; break;
         case strokeWidth: stroke.width = (float)value.r; stroke.widthUnit = (GraphicalUnit)unit; break;
         case strokeCasingWidth:  stroke.casing.width = (float)value.r; stroke.casing.widthUnit = (GraphicalUnit)unit; break;
         case strokeCasingColor:  stroke.casing.color = (Color)value.i; break;
         case strokeCasingOpacity:stroke.casing.opacity = (float)value.r; break;
         case strokeCenterWidth:  stroke.center.width = (float)value.r; stroke.center.widthUnit = (GraphicalUnit)unit; break;
         case strokeCenterColor:  stroke.center.color = (Color)value.i; break;
         case strokeCenterOpacity:stroke.center.opacity = (float)value.r; break;
         case strokeJoin: stroke.join = (LineJoin)value.i; break;
         case strokeCap: stroke.cap = (LineCap)value.i; break;
         case strokeDashPattern: stroke.dashes = value.b; break;
         default: GraphicalStyle::applyStyle(mSet, value, unit);
      }
   }
}

public class TextStyle : GraphicalStyle
{
public:
   // Properties..
   String text;
   GEFont font { outline = { } }; //eventually, Font
   Alignment2D alignment { };

   //return sym for visualization classes
   public TextStyle ::build(CMSSStyleSheet styleSheet, ECCSSEvaluator evaluator, Class stylesClass)
   {
       return (TextStyle)TextStyle::build(styleSheet, evaluator, class(TextStyle));
   }

   private void applyDefaults(TextStyleMask mask)
   {
      if(mask.fontFace) font.face = CopyString("Arial");
      if(mask.fontSize) font.size = 10;
      GraphicalStyle::applyDefaults(mask);
   }

   private void applyStyle(TextStyleKind mSet, const FieldValue value, int unit)
   {
      switch(mSet)
      {
         case text: text = CopyString(value.s); break;
         case fontFace: font.face = CopyString(value.s); break;
         case fontSize: font.size = (float)value.r; break;
         case fontBold: font.bold = (bool)value.i; break; //check if string?
         case fontItalic: font.italic = (bool)value.i; break; //check if string?
         case fontColor: font.color = (Color)value.i; break;
         case fontOpacity: font.opacity = (float)value.r; break;
         case fontOutlineSize: font.outline.size = (float)value.r; break;
         case fontOutlineColor: font.outline.color = (Color)value.i; break;
         case fontOutlineOpacity: font.outline.opacity = (float)value.r; break;
         case alignmentHorzAlign: alignment.horzAlign = (HAlignment)value.i; break;
         case alignmentVertAlign: alignment.vertAlign = (VAlignment)value.i; break;
         default: GraphicalStyle::applyStyle(mSet, value, unit);
      }
   }
}

public class ImageStyle : GraphicalStyle
{
public:
   // Properties..
   ImageResource image { };
   Color tint;
   Pointf hotSpot { };

   //return sym for visualization classes
   public ImageStyle ::build(CMSSStyleSheet styleSheet, ECCSSEvaluator evaluator, Class stylesClass)
   {
       return (ImageStyle)ImageStyle::build(styleSheet, evaluator, class(ImageStyle));
   }

   private void applyDefaults(ImageStyleMask mask)
   {
      GraphicalStyle::applyDefaults(mask);
   }
   private void applyStyle(ImageStyleKind mSet, const FieldValue value, int unit)
   {
      switch(mSet)
      {
         case imagePath: image.path = CopyString(value.s); break;
         case tint: tint = (Color)value.i; break;
         //case hotSpot: hotSpot = value.b; break; //maybe hotSpotX, hotSpotY???
         default: GraphicalStyle::applyStyle(mSet, value, unit);
      }
   }
}
