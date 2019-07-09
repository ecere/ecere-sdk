/******************************************************************************
 Styling of GraphicalElements from eC Cascading Style Sheets
******************************************************************************/
public import IMPORT_STATIC "ecere"
public import IMPORT_STATIC "EDA" // For FieldValue

import "eccss"
import "GraphicalElement"

public class GraphicalStyleMask : StylesMask
{
public:
   bool fillPattern        :1: 0;
   bool fillColor          :1: 1;
   bool fillOpacity        :1: 2;
   bool fillStippleStyle   :1: 3;
   bool fillHatchStyle     :1: 4;
   bool fillGradient       :1: 5;
   bool strokePattern      :1: 6;
   bool strokeOpacity      :1: 7;
   bool strokeWidth        :1: 8;
   bool strokeColor        :1: 9;
   bool strokeCenterWidth  :1:10;
   bool strokeCenterColor  :1:11;
   bool strokeCasingWidth  :1:12;
   bool strokeCasingColor  :1:13;
   bool strokeJoin         :1:14;
   bool strokeCap          :1:15;
   bool strokeDashPattern  :1:16;
   bool text               :1:17;
   bool font               :1:18;
   bool face               :1:19;
   bool size               :1:20;
   bool width              :1:21;
   bool bold               :1:22;
   bool italic             :1:23;
   bool outline            :1:24;
   bool casing             :1:25;
   bool color              :1:26;
   bool image              :1:27;
   bool alignmentHorzAlign :1:28;
   bool alignmentVertAlign :1:29;
   bool zOrder             :1:30;
   bool visibility         :1:31;
   bool transform          :1:32;
   bool opacity            :1:33;
   bool transform3D        :1:34;
};

public enum GraphicalStyleKind : GraphicalStyleMask
{
   fill = GraphicalStyleMask { fillPattern = true, fillColor = true, fillOpacity = true, fillStippleStyle = true, fillHatchStyle = true, fillGradient = true },
   fillPattern = GraphicalStyleMask { fillPattern = true },
   fillColor = GraphicalStyleMask { fillColor = true },
   fillOpacity = GraphicalStyleMask { fillOpacity = true },
   fillStippleStyle = GraphicalStyleMask { fillStippleStyle = true },
   fillHatchStyle = GraphicalStyleMask { fillHatchStyle = true },
   fillGradient = GraphicalStyleMask { fillGradient = true },
   stroke = GraphicalStyleMask { strokePattern = true, strokeOpacity = true, strokeWidth = true, strokeColor = true, strokeCenterWidth = true, strokeCenterColor = true, strokeCasingWidth = true, strokeCasingColor = true  },
   strokePattern = GraphicalStyleMask { strokePattern = true },
   strokeOpacity = GraphicalStyleMask { strokeOpacity = true },
   strokeWidth = GraphicalStyleMask { strokeWidth = true },
   strokeColor = GraphicalStyleMask { strokeColor = true },
   strokeCenter = GraphicalStyleMask { strokeCenterWidth = true, strokeCenterColor = true },
   strokeCenterWidth = GraphicalStyleMask { strokeCenterWidth = true },
   strokeCenterColor = GraphicalStyleMask { strokeCenterColor = true },
   strokeCasing = GraphicalStyleMask { strokeCasingWidth = true, strokeCasingColor = true },
   strokeCasingWidth = GraphicalStyleMask { strokeCasingWidth = true },
   strokeCasingColor = GraphicalStyleMask { strokeCasingColor = true },
   strokeJoin = GraphicalStyleMask { strokeJoin = true },
   strokeCap = GraphicalStyleMask { strokeCap = true },
   strokeDashPattern = GraphicalStyleMask { strokeDashPattern = true },
   text = GraphicalStyleMask { text = true },
   font = GraphicalStyleMask { font = true },
   face = GraphicalStyleMask { face = true },
   size = GraphicalStyleMask { size = true },
   width = GraphicalStyleMask { width = true },
   bold = GraphicalStyleMask { bold = true },
   italic = GraphicalStyleMask { italic = true },
   outline = GraphicalStyleMask { outline = true },
   color = GraphicalStyleMask { color = true },
   casing = GraphicalStyleMask { casing = true },
   image = GraphicalStyleMask { image = true },
   alignment = GraphicalStyleMask { alignmentHorzAlign = true, alignmentVertAlign = true },
   alignmentHorzAlign = GraphicalStyleMask { alignmentHorzAlign = true },
   alignmentVertAlign = GraphicalStyleMask { alignmentVertAlign = true },
   zOrder = GraphicalStyleMask { zOrder = true },
   visibility = GraphicalStyleMask { visibility = true },
   transform = GraphicalStyleMask { transform = true },
   opacity = GraphicalStyleMask { opacity = true },
   transform3D = GraphicalStyleMask { transform3D = true },
};

// TODO: Replace these by class reflection
Map<String, GraphicalStyleMask> styleIdentifierMap
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
   { "stroke.opacity", strokeOpacity },
   { "stroke.color", strokeColor },
   { "stroke.width", strokeWidth },
   { "stroke.casing", strokeCasing },
   { "stroke.casing.width", strokeCasingWidth },
   { "stroke.casing.color", strokeCasingColor },
   { "stroke.join", strokeJoin },
   { "stroke.cap", strokeCap },
   { "stroke.dashPattern", strokeDashPattern },
   { "text", text },
   { "font", font },
   { "bold", bold },
   { "italic", italic },
   { "alignment", alignment },
   { "alignment.horzAlign", alignmentHorzAlign },
   { "alignment.vertAlign", alignmentVertAlign },
   { "opacity", opacity },
   { "transform", transform },
   { "transform3D", transform3D }
] };

Map<GraphicalStyleMask, const String> stringFromMaskMap
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
   { strokeCasingColor, "stroke.ca/sing.color" },
   { strokeJoin, "stroke.join" },
   { strokeCap, "stroke.cap" },
   { strokeDashPattern, "stroke.dashPattern"  },
   { alignment, "alignment" },
   { alignmentHorzAlign, "alignment.horzAlign" },
   { alignmentVertAlign, "alignment.vertAlign" },
   { opacity, "opacity" },
   { transform, "transform" },
   { transform3D, "transform3D" },
   { text, "text" },
   { font, "font" },
   { face, "face" },
   { size, "size" },
   { width, "width" },
   { bold, "bold" },
   { italic, "italic" },
   { outline, "outline" },
   { color, "color" },
   { casing, "casing" },
   { image, "image" }
] };

struct GraphicalStyleEvaluator : ECCSSEvaluator
{
   void applyStyle(GraphicalStyle object, GraphicalStyleMask mSet, const FieldValue value)
   {
      object.applyStyle(mSet, value);
   }
};

public class GraphicalStyle : struct
{
public:
   // Properties...
   Fill fill { };
   Stroke stroke { };
   Alignment2D alignment;
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
      if(mask.fillColor) fill.color = white;
      if(mask.strokeColor) stroke.color = black;
      if(mask.opacity) opacity = 1.0;
      if(mask.visibility) visibility = true;
   }

   private void applyStyle(GraphicalStyleKind mSet, const FieldValue value)
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
         case strokeWidth: stroke.width = (float)value.r; break;
         case strokeCasingWidth:  stroke.casing.width = (float)value.r; break;
         case strokeCasingColor:  stroke.casing.color = (Color)value.i; break;
         case strokeJoin: stroke.join = (LineJoin)value.i; break;
         case strokeCap: stroke.cap = (LineCap)value.i; break;
         case strokeDashPattern: stroke.dashes = value.b; break;
         //case alignmentHorzAlign: alignment.horzAlign = (HAlignment)value.i; break;
         //case alignmentVertAlign: alignment.vertAlign = (VAlignment)value.i; break;
         // error for these:duplicate case value ; error: previously used here
         /*
         { "transform", transform },
         { "transform3D", transform3D },
         */
         case opacity: opacity = (float)value.r; break;
      }
   }
}
