namespace gfx;

import "ListBox"
import "DropBox"
import "ColorPicker"

public struct ColorRGB { float r, g, b; };
public struct ColorRGBAf
{
   float r, g, b, a;

   property ColorAlpha
   {
      set { this = ColorRGBAf { value.color.r/255.0f, value.color.g/255.0f, value.color.b/255.0f, value.a/255.0f }; }
      get { return ColorAlpha { (byte)(a * 255), Color { (byte)(r * 255), (byte)(g * 255), (byte)(b * 255) } }; }
   }
   property Color
   {
      set { this = ColorRGBAf { value.r/255.0f, value.g/255.0f, value.b/255.0f, 1.0f }; }
      get { return Color { (byte)(r * 255), (byte)(g * 255), (byte)(b * 255) }; }
   }
};

public class Color : uint
{
public:
   byte r:8:16, g:8:8, b:8:0;
   property ColorRGB
   {
      get { value = ColorRGB { r/255.0f, g/255.0f, b/255.0f }; }
      set { return Color { (byte)(value.r*255), (byte)(value.g*255), (byte)(value.b*255) }; }
   }

   bool OnSaveEdit(DropBox dropBox, void * object)
   {
      return dropBox.Save();
   }

   Window OnEdit(Window dataBox, Window master, int x, int y, int w, int h, Window control)
   {
      Size size = { 0 };
      char * string = "";
      ColorDropBox colorDropBox 
      {
         dataBox, master = master, editText = true, //position = Point { x + 24, y }, /*clientSize.h = */size.h = h, size.w = w - 24,
         anchor = { left = 24, top = 0, right = 0, bottom = 0 },
         color = this, control = control
      };
      colorDropBox.Create();

      //if(this)
      {
         char tempString[MAX_F_STRING];
         char * result;
         bool needClass = false;
         tempString[0] = 0;      
         result = OnGetString(tempString, null, &needClass);
         if(result) string = result;
      }
      colorDropBox.contents = string;
      // This is to highlight text on DataBox::Refresh
      colorDropBox.editBox.SelectAll();
      return colorDropBox;
   }

   char * OnGetString(char * stringOutput, void * fieldData, bool * needClass)
   {
      char * string;
      if((string = ((DefinedColor)this).class::OnGetString(stringOutput, null, needClass)) ||
         (string = ((SystemColor)this).class::OnGetString(stringOutput, null, needClass)))
      {
         if(needClass) *needClass = false;
         return string;
      }
      else
      {
         char tempString[256];
         char * colorValue;
         bool subNeedClass;
         int value;

         tempString[0] = '\0';
         value = r;
         colorValue = value.OnGetString(tempString, null, &subNeedClass);
         strcpy(stringOutput, "r = "); strcat(stringOutput, colorValue);

         // Weird bug in VS
         memset(tempString, 0, 256);
         tempString[0] = '\0';

         value = g;
         colorValue = value.OnGetString(tempString, null, &subNeedClass);
         strcat(stringOutput, ", g = "); strcat(stringOutput, colorValue);

         // Weird bug in VS
         memset(tempString, 0, 256);
         tempString[0] = '\0';

         value = b;
         colorValue = value.OnGetString(tempString, null, &subNeedClass);
         strcat(stringOutput, ", b = "); strcat(stringOutput, colorValue);
         return stringOutput;
      }
   }

   bool OnGetDataFromString(char * string)
   { 
      if(!atoi(string) && (((DefinedColor)this).class::OnGetDataFromString(string) ||
         ((SystemColor)this).class::OnGetDataFromString(string)))
         return true;
      else
         return class::OnGetDataFromString(string);
   }

   void OnDisplay(Surface surface, int x, int y, int width, char * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      char tempString[1024] = "";
      bool needClass = false;
      // TODO: This isn't an ideal way of obtaining the clipped height, will fail on hidden areas
      // This doesn't seem to help anymore?
      // - Makes SavingDataBox draw at 2 different spots depending if active or not.
      // - Color property in IDE is fine as well
      // - How is it on Linux?
      int yOffset = 0;//(1+surface.box.bottom - surface.box.top - 17)/2;
      char * string = OnGetString(tempString, null, &needClass);
      surface.WriteTextDots(alignment, x + 24, y + 1, width - 24, string, strlen(string));

      // Erase background?
      y += yOffset-1;
      surface.SetBackground(white);
      surface.Area(x - 4, y, x + 20, y + 15);

      surface.SetBackground(this);
      surface.Area(x, y + 2, x+17, y+13); 
      surface.SetForeground(black);
      surface.Rectangle(x-1, y + 1, x + 18, y + 14);
   }
}

public struct ColorHSV
{
   Degrees h;
   float s,v;

   property ColorRGB
   {
      set
      {
         float r = value.r, g = value.g, b = value.b;
         float minV, maxV, diff,dr,dg,db;

         float h, s, v;
         
         minV = Min(r, g);
         minV = Min(minV, b);

         maxV = Max(r, g);
         maxV = Max(maxV, b);

         diff = maxV - minV;
         v = maxV;
         if(diff)
         {
            s = diff/maxV;
            dr = (maxV - r)/diff;
            dg = (maxV - g)/diff;
            db = (maxV - b)/diff;

            /*
                if R=V then -- between yellow and magenta [degrees] 
                  H=60.0*(G-B)/Delta 
                else if G=V then -- between cyan and yellow 
                    H=120.0+60.0*(B-R)/Delta 
                else -- between magenta and cyan 
                    H=240.0+60.0*(R-G)/Delta 
            */
            if(r == maxV) 
               h = db - dg;
            else if(g == maxV)
               h = 2 + dr - db;
            else if(b == maxV)
               h = 4 + dg - dr;
            if(h < 0)
               h += 6;
         }
         else
         {
            h = 0;
            s = 0;
         }
         this.h = h * Degrees { 60 };
         this.s = s * 100;
         this.v = v * 100;
      }

      get
      {
         float deg = (float)(this.h / 60);
         float h = (deg == 6) ? 0 : deg, s = this.s / 100, v = this.v / 100;
         int i = (int) h;
         float f = h - i;
         float p = v*(1-s);
         float q = v*(1-(s*f));
         float t = v*(1-s*(1-f));
         float r,g,b;
         switch(i) 
         {
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            case 5: r = v; g = p; b = q; break;
         }
         // TODO: Figure out where this is needed
         r = Max(Min(r, 1),0);
         g = Max(Min(g, 1),0);
         b = Max(Min(b, 1),0);

         value.r = r;
         value.g = g;
         value.b = b;
      }
   }
};

public struct ColorLab
{
   float l,a,b;

   property ColorRGB
   {
      set
      {
         float r = value.r, g = value.g, b = value.b;
         float y2;

         r = (float)pow((r + 0.055)/1.055, 2.4);
         g = (float)pow((g + 0.055)/1.055, 2.4);
         b = (float)pow((b + 0.055)/1.055, 2.4);

         {
            float x = r * 0.412453f + g * 0.357580f + b * 0.180423f;
            float y = r * 0.212671f + g * 0.715160f + b * 0.072169f;
            float z = r * 0.019334f + g * 0.119193f + b * 0.950227f;
            
            x /= 0.950456f;
            y /= 1;
            z /= 1.088754f;

            x  = (x > 0.008856f) ? (float)pow(x, 1.0f/3) : (7.787f * x + 16/116.0f);
            y2 = (y > 0.008856f) ? (float)pow(y, 1.0f/3) : (7.787f * y + 16/116.0f);
            z  = (z > 0.008856f) ? (float)pow(z, 1.0f/3) : (7.787f * z + 16/116.0f);

            if(y > 0.008856)
               l = 116 * y2 - 16;
            else
               l = 903.3f * y;
            this.a = 500 * (x - y2);
            this.b = 200 * (y2 - z);
         }
      }

      get
      {
         float x,y,z,r,g,b, P;

         P = (l + 16)/116;
         
         if(l > 903.3f * 0.008856f)
         {
            y = (l + 16) / 116;
            y = y*y*y;
         }
         else
            y = l / 903.3f;

         if(y > 0.008856f)
            P = (l + 16) / 116;
         else
            P = (903.3f * y + 16) / 116;


         x = a / 500 + P;
         if(x > 0.206893f) 
            x = x*x*x;
         else
            x = (116 * x - 16) / 903.3f;

         z = P - this.b / 200;
         if(z > 0.206893f) 
            z = z*z*z;
         else
            z = (116 * z - 16) / 903.3f;
         

         x *= 0.950456f;
         y *= 1;
         z *= 1.088754f;

         r = x * 3.240479f + y * -1.537150f + z *-0.498535f;
         g = x *-0.969256f + y *  1.875992f + z * 0.041556f;
         b = x * 0.055648f + y * -0.204043f + z * 1.057311f;

         r = (r > 0.00304f) ? (1.055f * (float)pow(r, 1/2.4) - 0.055f) : (12.92f * r);
         g = (g > 0.00304f) ? (1.055f * (float)pow(g, 1/2.4) - 0.055f) : (12.92f * g);
         b = (b > 0.00304f) ? (1.055f * (float)pow(b, 1/2.4) - 0.055f) : (12.92f * b);

         // TODO: Figure out where this is needed
         r = Max(Min(r, 1),0);
         g = Max(Min(g, 1),0);
         b = Max(Min(b, 1),0);

         value.r = r;
         value.g = g;
         value.b = b;
      }
   }
};

public struct ColorCMYK
{
   float c,m,y,k;
   property ColorRGB
   {
      set
      {
         float c = 1 - value.r;
         float m = 1 - value.g;
         float y = 1 - value.b;
         float k = Min(Min(c,m), y);
         if(k == 1)
            this.c = this.m = this.y = 0;
         else
         {
            this.c = (c-k)/(1-k) * 100;
            this.m = (m-k)/(1-k) * 100;
            this.y = (y-k)/(1-k) * 100;
         }
         this.k = k * 100;
      }

      get
      {
         float k = this.k/100;
         value.r = 1 - ((c / 100) * (1-k) + k);
         value.g = 1 - ((m / 100) * (1-k) + k);
         value.b = 1 - ((y / 100) * (1-k) + k);

         // TODO: Figure out where this is needed
         value.r = Max(Min(value.r, 1),0);
         value.g = Max(Min(value.g, 1),0);
         value.b = Max(Min(value.b, 1),0);
      }
   }
};

public class Color565 : uint16
{
public:
   byte r:5:11;
   byte g:6:5;
   byte b:5:0;
   property Color
   {
      set { return Color565 { value.r >> 3, value.g >> 2, value.b >> 3 }; }
      get { return Color    { r << 3, g << 2, b << 3 }; }
   }
}

public class Color555 : uint16
{
public:
   byte r:5:10;
   byte g:5:5;
   byte b:5:0;
   property Color
   {
      set { return Color555 { value.r >> 3, value.g >> 3, value.b >> 3 }; }
      get { return Color    { r << 3, g << 3, b << 3 }; }
   }
}

public class Color444 : uint16
{
public:
   byte r:4:8;
   byte g:4:4;
   byte b:4:0;
   property Color
   {
      set { return Color444 { value.r >> 4, value.g >> 4, value.b >> 4 }; }
      get { return Color    { r << 4, g << 4, b << 4 }; }
   }
}

public class ColorAlpha
{
public:
   byte a:8:24;
   Color color:24:0;

   property Color
   {
      set { return ColorAlpha { 255, value }; }
      get { return color; }
   }
   /*property ColorRGBA
   {
      set { return ColorAlpha { value.a, Color { value.r, value.g, value.b } }; }
      get { return ColorRGBA { color.r, color.g, color.b, a }; }
   }*/
}

public class ColorRGBA
{
public:
   byte r:8;
   byte g:8;
   byte b:8;
   byte a:8;
   property ColorAlpha
   {
      set { return ColorRGBA { value.color.r, value.color.g, value.color.b, value.a }; }
      get { return ColorAlpha { a, Color { r, g, b } }; }
   }
   property Color
   {
      set { return ColorRGBA { value.r, value.g, value.b, 255 }; }
      get { return Color { r, g, b }; }
   }
}

public enum DefinedColor : Color
{
   black               = Color {   0,   0,   0 },
   dimGray             = Color { 105, 105, 105 },
   gray                = Color { 128, 128, 128 },
   darkGray            = Color { 169, 169, 165 },
   silver              = Color { 192, 192, 192 },
   lightGray           = Color { 211, 211, 211 },
   gainsboro           = Color { 220, 220, 220 },
   whiteSmoke          = Color { 245, 245, 245 },
   white               = Color { 255, 255, 255 },
   rosyBrown           = Color { 188, 143, 143 },
   indianRed           = Color { 205,  92,  92 },
   brown               = Color { 165,  42,  42 },
   fireBrick           = Color { 178,  34,  34 },
   lightCoral          = Color { 240, 128, 128 },
   maroon              = Color { 128,   0,   0 },
   darkRed             = Color { 139,   0,   0 },
   red                 = Color { 255,   0,   0 },
   snow                = Color { 255, 250, 250 },
   mistyRose           = Color { 255, 228, 225 },
   salmon              = Color { 250, 128, 114 },
   tomato              = Color { 255,  99,  71 },
   darkSalmon          = Color { 233, 150, 122 },
   coral               = Color { 255, 127,  80 },
   orangeRed           = Color { 255,  69,   0 },
   lightSalmon         = Color { 255, 160, 122 },
   sienna              = Color { 160,  82,  45 },
   seaShell            = Color { 255, 245, 238 },
   chocolate           = Color { 210, 105,  30 },
   saddleBrown         = Color { 139,  69,  19 },
   sandyBrown          = Color { 244, 164,  96 },
   peachPuff           = Color { 255, 218, 185 },
   peru                = Color { 205, 133,  63 },
   linen               = Color { 250, 240, 230 },
   bisque              = Color { 255, 228, 196 },
   darkOrange          = Color { 255, 140,   0 },
   burlyWood           = Color { 222, 184, 135 },
   tan                 = Color { 210, 180, 140 },
   antiqueWhite        = Color { 250, 235, 215 },
   navajoWhite         = Color { 255, 222, 173 },
   blanchedAlmond      = Color { 255, 235, 205 },
   papayaWhip          = Color { 255, 239, 213 },
   mocassin            = Color { 255, 228, 181 },
   orange              = Color { 255, 165,   0 },
   wheat               = Color { 245, 222, 179 },
   oldLace             = Color { 253, 245, 230 },
   floralWhite         = Color { 255, 250, 240 },
   darkGoldenrod       = Color { 184, 134,  11 },
   goldenrod           = Color { 218, 165,  32 },
   cornsilk            = Color { 255, 248, 220 },
   gold                = Color { 255, 215,   0 },
   khaki               = Color { 240, 230, 140 },
   lemonChiffon        = Color { 255, 250, 205 },
   paleGoldenrod       = Color { 238, 232, 170 },
   darkKhaki           = Color { 189, 183, 107 },
   beige               = Color { 245, 245, 220 },
   lightGoldenRodYellow= Color { 250, 250, 210 },
   olive               = Color { 128, 128,   0 },
   yellow              = Color { 255, 255,   0 },
   lightYellow         = Color { 255, 255, 224 },
   ivory               = Color { 255, 255, 240 },
   oliveDrab           = Color { 107, 142,  35 },
   yellowGreen         = Color { 154, 205,  50 },
   darkOliveGreen      = Color {  85, 107,  47 },
   greenYellow         = Color { 173, 255,  47 },
   chartreuse          = Color { 127, 255,   0 },
   lawnGreen           = Color { 124, 252,   0 },
   darkSeaGreen        = Color { 143, 188, 139 },
   forestGreen         = Color {  34, 139,  34 },
   limeGreen           = Color {  50, 205,  50 },
   lightGreen          = Color { 144, 238, 144 },
   paleGreen           = Color { 152, 251, 152 },
   darkGreen           = Color {   0, 100,   0 },
   green               = Color {   0, 128,   0 },
   lime                = Color {   0, 255,   0 },
   honeyDew            = Color { 240, 255, 240 },
   seaGreen            = Color {  46, 139,  87 },
   mediumSeaGreen      = Color {  60, 179, 113 },
   springGreen         = Color {   0, 255, 127 },
   mintCream           = Color { 245, 255, 250 },
   mediumSpringGreen   = Color {   0, 250, 154 },
   mediumAquaMarine    = Color { 102, 205, 170 },
   aquamarine          = Color { 127, 255, 212 },
   turquoise           = Color {  64, 224, 208 },
   lightSeaGreen       = Color {  32, 178, 170 },
   mediumTurquoise     = Color {  72, 209, 204 },
   darkSlateGray       = Color {  47,  79,  79 },
   paleTurquoise       = Color { 175, 238, 238 },
   teal                = Color {   0, 128, 128 },
   darkCyan            = Color {   0, 139, 139 },
   aqua                = Color {   0, 255, 255 },
   cyan                = Color {   0, 255, 255 },
   lightCyan           = Color { 224, 255, 255 },
   azure               = Color { 240, 255, 255 },
   darkTurquoise       = Color {   0, 206, 209 },
   cadetBlue           = Color {  95, 158, 160 },
   powderBlue          = Color { 176, 224, 230 },
   lightBlue           = Color { 173, 216, 230 },
   deepSkyBlue         = Color {   0, 191, 255 },
   skyBlue             = Color { 135, 206, 235 },
   lightSkyBlue        = Color { 135, 206, 250 },
   steelBlue           = Color {  70, 130, 180 },
   aliceBlue           = Color { 240, 248, 255 },
   dodgerBlue          = Color {  30, 144, 255 },
   slateGray           = Color { 112, 128, 144 },
   lightSlateGray      = Color { 119, 136, 153 },
   lightSteelBlue      = Color { 176, 196, 222 },
   cornflowerBlue      = Color { 100, 149, 237 },
   royalBlue           = Color {  65, 105, 225 },
   midnightBlue        = Color {  25,  25, 112 },
   lavender            = Color { 230, 230, 250 },
   navy                = Color {   0,   0, 128 },
   darkBlue            = Color {   0,   0, 139 },
   mediumBlue          = Color {   0,   0, 205 },
   blue                = Color {   0,   0, 255 },
   ghostWhite          = Color { 248, 248, 255 },
   slateBlue           = Color { 106,  90, 205 },
   darkSlateBlue       = Color {  72,  61, 139 },
   mediumSlateBlue     = Color { 123, 104, 238 },
   mediumPurple        = Color { 147, 112, 219 },
   blueViolet          = Color { 138,  43, 226 },
   indigo              = Color {  75,   0, 130 },
   darkOrchid          = Color { 153,  50, 204 },
   darkViolet          = Color { 148,   0, 211 },
   mediumOrchid        = Color { 186,  85, 211 },
   thistle             = Color { 216, 191, 216 },
   plum                = Color { 221, 160, 221 },
   violet              = Color { 238, 130, 238 },
   purple              = Color { 128,   0, 128 },
   darkMagenta         = Color { 139,   0, 139 },
   magenta             = Color { 255,   0, 255 },
   fuschia             = Color { 255,   0, 255 },
   orchid              = Color { 218, 112, 214 },
   mediumVioletRed     = Color { 199,  21, 133 },
   deepPink            = Color { 255,  20, 147 },
   hotPink             = Color { 255, 155, 180 },
   lavenderBlush       = Color { 255, 240, 245 },
   paleVioletRed       = Color { 219, 112, 147 },
   crimson             = Color { 220,  20,  60 },
   pink                = Color { 255, 192, 203 },
   lightPink           = Color { 255, 182, 193 }
};

// TODO: We really should improve on this, only formColor has been used so far
public enum SystemColor : Color
{
   // activeBorder         = Color { 212, 208, 200 },
   activeBorder         = Color { 229, 234, 245 },
   formColor            = Color { 229, 234, 245 },
   control              = Color { 212, 208, 200 },
   controlLight         = Color { 212, 208, 200 },
   inactiveBorder       = Color { 212, 208, 200 },
   inactiveCaptionText  = Color { 212, 208, 200 },
   menu                 = Color { 212, 208, 200 },
   scrollBar            = Color { 212, 208, 200 }
};

private class ColorValue : Color
{
   void OnDisplay(Surface surface, int x, int y, int width, char * fieldData, Alignment alignment, DataDisplayFlags displayFlags)
   {
      // surface.WriteTextDots(alignment, x + 24, y + 1, width - 24, string, strlen(string));
      surface.SetBackground(this);
      surface.Area(x, y + 4, x+19, y+11); 

      surface.SetForeground(black);
      surface.Rectangle(x-1, y + 3, x + 20, y + 12);
   }
}

// TODO: ColorSelected was declared as non static
/*static */class ColorDropBox : DropBox
{
   ListBox listBox;
   Color color;
   Window control;
   borderStyle = 0;

   DataField sysColorField { dataType = "ColorValue", width = 20 };
   DataField sysColorName { };
   DataField definedColorField { dataType = "ColorValue", width = 20 };
   DataField definedColorName { };

   ColorDropBox()
   {
      system.AddField(sysColorField);
      system.AddField(sysColorName);
      defined.AddField(definedColorField);
      defined.AddField(definedColorName);
   }

   Window pullDown
   {
      master = this, interim = true, autoCreate = false, minSize = { 204, 222 }, 
      background = formColor, borderStyle = contour|bevel;

      bool OnKeyDown(Key key, unichar ch)
      {
         ColorDropBox colorDropBox = (ColorDropBox)master;
         if((SmartKey)key == enter)
         {
            if(!colorDropBox.ColorSelected(colorDropBox.listBox, colorDropBox.listBox.currentRow, 0))
               return false;
         }
         if(key == escape)
         {
            return colorDropBox.OnKeyDown(key, ch);
         }
         return true;
      }
   };

   bool ColorSelected(ListBox listBox, DataRow row, Modifiers mods)
   {
      Color color = row ? row.GetData(null) : black;

      incref this;
      ((DataBox)parent).SetData(&color, false);

      this.color = color;

      {
         char tempString[1024] = "";
         bool needClass = false;
         char * string = color.OnGetString(tempString, null, &needClass);
         contents = string;
      }
      OnKeyDown(escape, 0);
      Deactivate();
      delete this;

      //OnKeyDown(escape, 0);
      //master.OnKeyDown(escape, 0);

      return true;
   }

   ListBox defined
   {
      master = this, parent = pullDown,
      freeSelect = true,
      hasVertScroll = true,
      anchor = Anchor { left = 0, top = 16, right = 0, bottom = 0 },
      NotifySelect = ColorSelected
   };
   ListBox system
   {
      master = this, parent = pullDown,
      freeSelect = true,
      hasVertScroll = true,
      anchor = Anchor { left = 0, top = 16, right = 0, bottom = 0 },
      NotifySelect = ColorSelected
   };

   ColorPicker dialog
   {
      text = $"Select Color",
      master = this,
      autoCreate = false
   };

   Button button
   {
      master = this, parent = pullDown,
      text = $"Custom",
      size.w = 68,
      position = Point { 0, 0 },
      bevelOver = true,
      inactive = true,
      hotKey = altC;
      // isRadio = true, bitmap = null;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         dialog.color = color;

         OnKeyDown(escape, 0);
         Deactivate();

         //OnKeyDown(Escape, 0);
         //master.OnKeyDown(Escape, 0);

         incref this;
         if(dialog.Modal() == ok)
         {
            color = dialog.color;
            ((DataBox)master).SetData(&color, false);
            {
               char tempString[1024] = "";
               bool needClass = false;
               char * string = color.OnGetString(tempString, null, &needClass);
               contents = string;
            }
         }
         delete this;
         return true;
      }
   };
   Button definedButton
   {
      master = this, parent = pullDown,
      text = $"Defined",
      hotKey = altD,
      size.w = 68,
      position = Point { 68, 0 },
      isRadio = true,
      bevelOver = true,
      inactive = true,
      bitmap = null;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         system.visible = false;
         defined.visible = true;
         listBox = defined;
         return true;
      }
   };
   Button systemButton
   {
      master = this, parent = pullDown,
      text = $"System",
      hotKey = altS,
      size.w = 68,
      position = Point { 136, 0 },
      isRadio = true,
      bevelOver = true,
      inactive = true,         
      bitmap = null;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         defined.visible = false;
         system.visible = true;
         listBox = system;
         return true;
      }
   };

   Window OnDropDown()
   {
      char tempString[256];
      pullDown.size.w = size.w + 24;

      pullDown.Create();

      {
         NamedLink item;
         bool found = false;
         DataRow currentRow = null;

         defined.Clear();
         for(item = ((EnumClassData)class(DefinedColor).data).values.first; item; item = item.next)
         {
            DataRow row = defined.AddRow();
            row.SetData(definedColorField, (Color)item.data);
            strcpy(tempString, item.name);
            tempString[0] = (char)toupper(tempString[0]);
            row.SetData(definedColorName, tempString);
            // TOCHECK: A uint cast is necessary here, the void * was causing ColorRGB conversion to be called
            if(!found && (Color)(uint)item.data == color)
            {
               currentRow = row;
               found = true;
            }
         }
         if(currentRow)
            defined.currentRow = currentRow;
      }
      {
         bool found = false;
         NamedLink item;
         DataRow currentRow = null;

         system.Clear();
         for(item = ((EnumClassData)class(SystemColor).data).values.first; item; item = item.next)
         {
            DataRow row = system.AddRow();
            row.SetData(sysColorField, (Color)item.data);
            strcpy(tempString, item.name);
            tempString[0] = (char)toupper(tempString[0]);
            row.SetData(sysColorName, tempString);

            // TOCHECK: A uint cast is necessary here, the void * was causing ColorRGB conversion to be called
            if(!found && (Color)(uint)item.data == color)
            {
               currentRow = row;
               found = true;
            }
         }
         if(currentRow)
            system.currentRow = currentRow;

         if(found)
         {
            defined.visible = false;
            system.visible = true;
            systemButton.checked = true;
            listBox = system;
         }
         else
         {
            system.visible = false;
            defined.visible = true;
            definedButton.checked = true;
            listBox = defined;
         }
      }
      return pullDown;
   }

   void OnCloseDropDown(Window pullDown)
   {
      // TOFIX: Patch for update bug
      master.Update(null);
      pullDown.Destroy(0);
   }

   bool DataBox::NotifyTextEntry(ColorDropBox colorDropBox, char * string, bool save)
   {
      if(save)
      {
         Color color = 0;
         if(color.OnGetDataFromString(string))
            SetData(&color, false);
      }
      else
      {
         char tempString[1024] = "";
         bool needClass = false;
         char * string = colorDropBox.color.OnGetString(tempString,null, &needClass);
         colorDropBox.contents = string;
      }
      return true;
   }
}
