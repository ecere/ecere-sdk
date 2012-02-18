namespace gui::dialogs;

import "Window"

enum ColorSelectionMode { selectH, selectS, selectV, selectR, selectG, selectB, selectL, selecta, selectb };
static enum ColorPlaneType { xyPlane, zRamp, aRamp };

static ColorAlpha Color_RGBA(float x, float y, float z, float a)
{
   return ColorAlpha { (byte)Max(Min(a*255, 255), 0), ColorRGB { x, y, z } };
}
static ColorAlpha Color_BRGA(float b, float r, float g, float a) { return Color_RGBA(r,g,b,a); }
static ColorAlpha Color_BGRA(float b, float g, float r, float a) { return Color_RGBA(r,g,b,a); }

static ColorAlpha Color_HSVA(float x, float y, float z, float a)
{
   return ColorAlpha { (byte)Max(Min(a*255, 255), 0), ColorHSV { x * 360, y * 100, z * 100 } };
}
static ColorAlpha Color_HVSA(float h, float v, float s, float a) { return Color_HSVA(h,s,v,a); }
static ColorAlpha Color_SVHA(float s, float v, float h, float a) { return Color_HSVA(h,s,v,a); }

#define LAB_AB_RANGE 255

static ColorAlpha Color_aLbA(float A, float L, float B, float a)
{
   return ColorAlpha 
   {
      (byte)Max(Min(a*255, 255), 0),
      ColorLab
      { 
         L * 100, 
         (A * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2, 
         (B * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2
      };
   };
}

static ColorAlpha Color_abLA(float a, float b, float L, float A) { return Color_aLbA(a, L, b, A); }
static ColorAlpha Color_bLaA(float b, float L, float a, float A) { return Color_aLbA(a, L, b, A); }

static ColorAlpha (*ColorFunctions[ColorSelectionMode])(float x, float y, float z, float a) =
{
   Color_SVHA, Color_HVSA, Color_HSVA,
   Color_BGRA, Color_BRGA, Color_RGBA,
   Color_abLA, Color_bLaA, Color_aLbA
};

class ColorPlane : Window
{
   bool moving;

   inactive = true, borderStyle = deep;

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      ColorPicker picker = ((ColorPicker)master);

      if(moving)
      {
         ColorRGB rgb;
         float fx = (float)x / (float)(clientSize.w);
         float fy = (float)(clientSize.h-1-y) / (float)(clientSize.h);
         fx = Min(Max(fx,0),1);
         fy = Min(Max(fy,0),1);
         switch((ColorPlaneType) id)
         {
            case xyPlane: 
               picker.x = fx; picker.y = fy; 
               break;
            case zRamp:
               picker.z = fy; 
               picker.xyPlaneUpdate = true;
               break;
            case aRamp:
               picker.w = fx; 
               picker.xyPlaneUpdate = true;
               break;
         }
         picker.argb = ColorFunctions[picker.colorMode](picker.x, picker.y, picker.z, picker.w);
         rgb = picker.argb;

         switch(picker.colorMode)
         {
            case selectH: picker.hsv.h = picker.z * 360; picker.hsv.s = picker.x * 100; picker.hsv.v = picker.y * 100; break;
            case selectS: picker.hsv.h = picker.x * 360; picker.hsv.s = picker.z * 100; picker.hsv.v = picker.y * 100; break;
            case selectV: picker.hsv.h = picker.x * 360; picker.hsv.s = picker.y * 100; picker.hsv.v = picker.z * 100; break;
            default:
               picker.hsv = rgb;
         }
         switch(picker.colorMode)
         {
            case selectL: picker.Lab.l = picker.z * 100; picker.Lab.a = (picker.x * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; picker.Lab.b = (picker.y * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; break;
            case selecta: picker.Lab.l = picker.y * 100; picker.Lab.a = (picker.z * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; picker.Lab.b = (picker.x * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; break;
            case selectb: picker.Lab.l = picker.y * 100; picker.Lab.a = (picker.x * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; picker.Lab.b = (picker.z * LAB_AB_RANGE) - (LAB_AB_RANGE+1)/2; break;
            default:
               picker.Lab = rgb;
         }

         picker.cmyk = rgb;
         picker.UpdateColor();
      }
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      moving = true;
      Capture();
      OnMouseMove(x,y, mods);
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(moving)
      {
         ReleaseCapture();
         moving = false;
      }
      return true;
   }
}

class ColorXYPlane : ColorPlane
{
   id = ColorPlaneType::xyPlane;
   clientSize = { 256, 256 };

   Bitmap bitmap { };

   bool OnCreate()
   {
      bitmap.Allocate(null, 256,256,256, pixelFormat888, false);
      return true;
   }

   void OnRedraw(Surface surface)
   {
      ColorPicker picker = ((ColorPicker)master);
      int x, y;

      if(picker.xyPlaneUpdate)
      {
         Surface surface = bitmap.GetSurface(0,0, null);
         if(surface)
         {
            for(x = 0; x<256; x++)
               for(y = 0; y<256; y++)
               {
                  ColorAlpha color = ColorFunctions[picker.colorMode](
                     (float)x / (256-1), 
                     (float)(256-1-y) / (256-1), 
                     picker.z, picker.w);

                  surface.SetForeground(color);
                  surface.PutPixel(x, y);
               }
            delete surface;
         }
         picker.xyPlaneUpdate = false;
      }

      surface.Blit(bitmap, 0,0,0,0, clientSize.w, clientSize.h);
      
      x = (int)(picker.x * (clientSize.w-1));
      y = (int)(clientSize.h-1-(picker.y * (clientSize.h-1)));

      if(picker.argb.color.r > 128 || picker.argb.color.g > 128)
         surface.SetForeground(black);
      else
         surface.SetForeground(white);

      #define LARGE  5
      #define SMALL  2

      surface.HLine(x - SMALL, x + SMALL, y - LARGE);
      surface.HLine(x - SMALL, x + SMALL, y + LARGE);

      surface.VLine(y - SMALL, y + SMALL, x - LARGE);
      surface.VLine(y - SMALL, y + SMALL, x + LARGE);

      surface.DrawLine(x + SMALL, y - LARGE, x + LARGE, y - SMALL);
      surface.DrawLine(x + SMALL, y + LARGE, x + LARGE, y + SMALL);
      surface.DrawLine(x - SMALL, y - LARGE, x - LARGE, y - SMALL);
      surface.DrawLine(x - SMALL, y + LARGE, x - LARGE, y + SMALL);
   }
}

class ColorZRamp : ColorPlane
{
   id = ColorPlaneType::zRamp;
   clientSize = { 20, 256 };

   void OnRedraw(Surface surface)
   {
      ColorPicker picker = ((ColorPicker)master);

      int z;
      int cw = clientSize.w;
      int ch = clientSize.h;
      for(z = 0; z<ch; z++)
      {
         ColorAlpha color = ColorFunctions[picker.colorMode](
            picker.x, picker.y, 
            (float)(ch-1-z) / (ch-1), picker.w);

         surface.SetForeground(color);
         surface.HLine(0, cw-1, z);
      }
   }
};

/*static */class ColorARamp : ColorPlane
{
   id = ColorPlaneType::aRamp;
   clientSize = { 256, 20 };

   void OnRedraw(Surface surface)
   {
      ColorPicker picker = ((ColorPicker)master);

      int a;
      for(a = 0; a<clientSize.w; a++)
      {
         ColorAlpha color = ColorFunctions[picker.colorMode](
            picker.x, picker.y, 
            picker.z, (float)a / (clientSize.w-1));

         surface.SetForeground(color);
         surface.VLine(0, clientSize.h-1, a);
      }
   }
}

public class ColorPicker : Window
{
   hasClose = true, tabCycle = true, background = activeBorder;
   autoCreate = false;
   clientSize.h = 275, size.w = 500;
   text = $"Select a color...";
   argb = red;

public:
   property Color color
   {
      set
      {
         ColorRGB rgb = value;
         argb = original = value;
         Lab = rgb;
         cmyk = rgb;
         hsv = rgb;
         
         UpdatePosition();
      }
      get { return argb; }
   };

private:
   ColorPicker()
   {
      UpdatePosition();
      xyPlaneUpdate = true;

      return true;
   }

   void UpdateColor()
   {
      // RGBA
      R.Clear();
      R.Printf("%d", argb.color.r);
      R.SetModified(false);
      G.Clear();
      G.Printf("%d", argb.color.g);
      G.SetModified(false);
      B.Clear();
      B.Printf("%d", argb.color.b);
      B.SetModified(false);
      A.Clear();
      A.Printf("%d", argb.a);
      A.SetModified(false);

      // HSV
      H.Clear();
      H.Printf("%d", (int)hsv.h);
      H.SetModified(false);
      S.Clear();
      S.Printf("%d", (int)hsv.s);
      S.SetModified(false);
      V.Clear();
      V.Printf("%d", (int)hsv.v);
      V.SetModified(false);

      // Lab
      L.Clear();
      L.Printf("%d", (int)Lab.l);
      L.SetModified(false);
      a.Clear();
      a.Printf("%d", (int)Lab.a);
      a.SetModified(false);
      b.Clear();
      b.Printf("%d", (int)Lab.b);
      b.SetModified(false);

      // CMYK
      C.Clear();
      C.Printf("%d", (int)cmyk.c);
      C.SetModified(false);
      M.Clear();
      M.Printf("%d", (int)cmyk.m);
      M.SetModified(false);
      Y.Clear();
      Y.Printf("%d", (int)cmyk.y);
      Y.SetModified(false);
      K.Clear();
      K.Printf("%d", (int)cmyk.k);
      H.SetModified(false);

      // Hexadecimal
      hexa.Clear();
      if(hasAlpha)
         hexa.Printf("%08X", argb);
      else
         hexa.Printf("%06X", argb.color);
      hexa.SetModified(false);

      square.background = argb.color;
      square.opacity = argb.a / 255.0;

      Update(null);
   }

   void UpdatePosition()
   {
      float oldZ = z, oldW = w;
      w = argb.a / 255.0f;

      switch(colorMode)
      {
         case selectH:
         {
            x = (float)hsv.s / 100.0f;
            y = (float)hsv.v / 100.0f;
            z = (float)hsv.h / 360;
            break;
         }
         case selectS:
         {
            x = (float)hsv.h / 360;
            y = (float)hsv.v / 100.0f;
            z = (float)hsv.s / 100.0f;
            break;
         }
         case selectV:
         {
            x = (float)hsv.h / 360;
            y = (float)hsv.s / 100.0f;
            z = (float)hsv.v / 100.0f;
            break;
         }
         case selectR:
         {
            x = argb.color.b / 255.0f;
            y = argb.color.g / 255.0f;
            z = argb.color.r / 255.0f;
            break;
         }
         case selectG:
         {
            x = argb.color.b / 255.0f;
            y = argb.color.r / 255.0f;
            z = argb.color.g / 255.0f;
            break;
         }
         case selectB:
         {
            x = argb.color.r / 255.0f;
            y = argb.color.g / 255.0f;
            z = argb.color.b / 255.0f;
            break;
         }
         case selectL:
         {
            x = (Lab.a + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            y = (Lab.b + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            z = Lab.l / 100;
            break;
         }
         case selecta:
         {
            x = (Lab.b + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            y = Lab.l / 100;
            z = (Lab.a + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            break;
         }
         case selectb:
         {
            x = (Lab.a + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            y = Lab.l / 100;
            z = (Lab.b + (LAB_AB_RANGE+1)/2) / LAB_AB_RANGE;
            break;
         }
      }
      UpdateColor();
      if(z != oldZ || w != oldW)
         xyPlaneUpdate = true;
   }

   bool OnCreate()
   {
      ColorRGB rgb;
      UpdatePosition();
      xyPlaneUpdate = true;
      if(!argb.color.r && !argb.color.g && !argb.color.b && !argb.a)
      {
         // printf("");
      }
      rgb = argb;
      hsv = rgb;
      Lab = rgb;
      cmyk = rgb;
      return true;
   }

   void OnRedraw(Surface surface)
   {
      Window zRamp = this.zRamp, aRamp = this.aRamp;
      int z, a;
      int x,y,w,h;

      surface.SetForeground(black);

      #define HEIGHT 5
      #define WIDTH 7

      // ZRamp
      x = zRamp.position.x;
      y = zRamp.position.y;
      w = zRamp.size.w;
      h = zRamp.size.h;
      z = (int)(h-1-(this.z * (h-1)) + zRamp.clientStart.y);

      surface.DrawLine( x - WIDTH, y + z-HEIGHT, x - 2, y + z);
      surface.DrawLine( x - WIDTH, y + z+HEIGHT, x - 2, y + z);
      surface.VLine(y + z-HEIGHT, y + z+HEIGHT, x - WIDTH);
      surface.DrawLine( x + w + WIDTH - 1, y + z-HEIGHT, x + w + 1, y + z);
      surface.DrawLine( x + w + WIDTH - 1, y + z+HEIGHT, x + w + 1, y + z);
      surface.VLine(y + z-HEIGHT, y + z+HEIGHT, x + w + WIDTH - 1);

      if(hasAlpha)
      {
         // ARamp
         x = aRamp.position.x;
         y = aRamp.position.y;
         w = aRamp.size.w;
         h = aRamp.size.h;
         a = (int)(this.w * (w-1) + aRamp.clientStart.x);

         surface.DrawLine( x + a-HEIGHT, y - WIDTH, x + a, y - 2);
         surface.DrawLine( x + a+HEIGHT, y - WIDTH, x + a, y - 2);
         surface.HLine(x + a-HEIGHT, x + a+HEIGHT, y - WIDTH);
         surface.DrawLine( x + a-HEIGHT, y + h + WIDTH - 1, x + a, y + h + 1);
         surface.DrawLine( x + a+HEIGHT, y + h + WIDTH - 1, x + a, y + h + 1);
         surface.HLine(x + a-HEIGHT, x + a+HEIGHT, y + h + WIDTH - 1);
      }
   }

   bool RadioClicked(Button control, int x, int y, Modifiers mods)
   {
      if(colorMode != (ColorSelectionMode)control.id)
      {
         colorMode = (ColorSelectionMode)control.id;
         xyPlaneUpdate = true;
      }
      
      UpdatePosition();

      return true;
   }

   ColorAlpha original, argb;
   ColorHSV hsv;
   ColorCMYK cmyk;
   ColorLab Lab;

   float w,x,y,z;
   ColorSelectionMode colorMode;

   bool xyPlaneUpdate;
   bool hasAlpha;

   EditBox G
   {
      this, position = { 350, 100 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         argb.color.g = (byte)Min(Max(value,0),255);

         rgb = argb;
         Lab = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   EditBox B
   {
      this, position = { 350, 120 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         argb.color.b = (byte)Min(Max(value,0),255);
         rgb = argb;
         Lab = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   EditBox L
   {
      this, position = { 442, 10 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         Lab.l = (float)value;
         rgb = Lab;
         argb.color = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label label1 { this, position = { 480, 12 }, text = "%" };

   EditBox a
   {
      this, position = { 442, 30 }, size = { 32, 20 };
      
      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,-(LAB_AB_RANGE+1)/2),(LAB_AB_RANGE+1)/2);
         Lab.a = (float)value;
         rgb = Lab;
         argb.color = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   EditBox b
   {
      this, position = { 442, 50 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,-(LAB_AB_RANGE+1)/2),(LAB_AB_RANGE+1)/2);
         Lab.b = (float)value;
         rgb = Lab;
         argb.color = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   EditBox C
   {
      this, position = { 350, 150 }, size = { 32, 20 }, text = "C:", hotKey = altC;
      
      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         cmyk.c = (float)value;
         rgb = cmyk;
         argb.color = rgb;
         hsv = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label labelC { this, position = { 332, 150 }, labeledWindow = C };
   Label label2 { this, position = { 385, 152 }, text = "%" };

   EditBox M
   {
      this, position = { 350, 170 }, size = { 32, 20 }, text = "M:", hotKey = altM;

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         cmyk.m = (float)value;
         rgb = cmyk;
         argb.color = rgb;
         hsv = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label labelM { this, position = { 332, 170 }, labeledWindow = M };
   Label label3 { this, position = { 385, 172 }, text = "%" };

   EditBox Y
   {
      this, position = { 350, 190 }, size = { 32, 20 }, text = "Y:", hotKey = altY;

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         cmyk.y = (float)value;
         rgb = cmyk;
         argb.color = rgb;
         hsv = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label labelY { this, position = { 332, 190 }, labeledWindow = Y };
   Label label4 { this, position = { 385, 192 }, text = "%" };

   EditBox K
   {
      this, position = { 350, 210 }, size = { 32, 20 }, text = "K:", hotKey = altK;

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         cmyk.k = (float)value;
         rgb = cmyk;
         argb.color = rgb;
         hsv = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label labelK { this, position = { 332, 210 }, labeledWindow = K };
   Label label5 { this, position = { 385, 212 }, text = "%" };

   EditBox hexa
   {
      this, text = "0x";
      anchor = { right = 10, top = 80 }, size = { 70, 20 };

      // position = { 330, 270 },
      // anchor = { right = 10, bottom = 32 };
              
      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtoul(control.contents, null, 16);
         if(strlen(control.contents) <= 6)
            value |= 0xFF000000;
         argb = (unsigned int)value;
         rgb = argb;
         cmyk = rgb;
         hsv = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label labelHexa { this, labeledWindow = hexa, /* position = { 305, 272 }, anchor = { 10, 32 }, */ anchor = { right = 85, top = 80 } };

   EditBox A
   {
      this, position = { 350, 254 }, size = { 32, 20 }, text = "A:", hotKey = altA, autoCreate = false;

      bool NotifyModified(EditBox control)
      {
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),255);
         argb.a = (byte)value;
         UpdatePosition();
         return true;
      }
   };

   Label labelA { this, position = { 332, 254 }, labeledWindow = A, autoCreate = false };

   Button ok
   {
      this, text = $"OK", isDefault = true;
      anchor = { right = 10, bottom = 15 };
      size = { 80 };
      // anchor = { right = 10, bottom = 32 };
      id = DialogResult::ok, NotifyClicked = ButtonCloseDialog;
   };

   Button cancel
   {
      this, text = $"Cancel", hotKey = escape, anchor = { right = 95, bottom = 15 }, size = { 80 };
      id = DialogResult::cancel, NotifyClicked = ButtonCloseDialog;
   };

   ColorXYPlane xyPlane { this, position = { 5, 5 } };
   ColorZRamp zRamp { this, position = { 5 + 256 + 16, 5 } };
   ColorARamp aRamp { this, position = { 5, 5 + 256 + 16 + 10 }, autoCreate = false };

   Button rH
   {
      this, isRadio = true, position = { 312, 10 }, id = ColorSelectionMode::selectH, text = "H:", hotKey = altH, checked = true;
      NotifyClicked = RadioClicked;
   };   

   Button rS
   {
      this, isRadio = true, position = { 312, 30 }, id = ColorSelectionMode::selectS, text = "S:", hotKey = altS;
      NotifyClicked = RadioClicked;
   };

   Button rV
   {
      this, isRadio = true, position = { 312, 50 }, id = ColorSelectionMode::selectV, text = "V:", hotKey = altV;
      NotifyClicked = RadioClicked;
   };

   Button rL
   {
      this, isRadio = true, position = { 405, 10 }, id = ColorSelectionMode::selectL, text = "L:", hotKey = altL;
      NotifyClicked = RadioClicked;
   };

   Button ra
   {
      this, isRadio = true, position = { 405, 30 }, id = ColorSelectionMode::selecta, text = "a:";
      NotifyClicked = RadioClicked;
   };

   Button rb
   {
      this, isRadio = true, position = { 405, 50 }, id = ColorSelectionMode::selectb, text = "b:";
      NotifyClicked = RadioClicked;
   };

   Button rR
   {
      this, isRadio = true, position = { 312, 80 }, id = ColorSelectionMode::selectR, text = "R:", hotKey = altR;
      NotifyClicked = RadioClicked;
   };
  
   Button rG
   {
      this, isRadio = true, position = { 312, 100 }, id = ColorSelectionMode::selectG, text = "G:", hotKey = altG;
      NotifyClicked = RadioClicked;
   };

   Button rB
   {
      this, isRadio = true, position = { 312, 120 }, id = ColorSelectionMode::selectB, text = "B:", hotKey = altB;
      NotifyClicked = RadioClicked;
   };

   EditBox H
   {
      this, position = { 350, 10 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),360);
         hsv.h = value;
         rgb = hsv;
         argb.color = rgb;
         cmyk = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label label6 { this, position = { 385, 12 }, text = "\260" };

   EditBox S
   {
      this, position = { 350, 30 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         hsv.s = (float)value;
         rgb = hsv;
         argb.color = rgb;
         cmyk = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   }

   Label label7 { this, position = { 385, 32 }, text = "%" };

   EditBox V
   {
      this, position = { 350, 50 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),100);
         hsv.v = (float)value;
         rgb = hsv;
         argb.color = rgb;
         cmyk = rgb;
         Lab = rgb;
         UpdatePosition();
         return true;
      }
   };

   Label label8 { this, position = { 385, 52 }, text = "%" };

   Window square
   {
      this, position = { 420, 180 }, clientSize = { 50, 50 }, borderStyle = deep;

      void OnRedraw(Surface surface)
      {
         if(((ColorPicker)parent).hasAlpha && opacity < 1)
         {
            int x, y;
            surface.background = activeBorder;
            surface.Clear(colorBuffer);
            surface.background = white;
            for(y = 0; y < 50; y+=10)
               for(x = ((y/10) % 2) * 10; x < 50; x+=20)
                  surface.Area(x, y, x + 9, y + 9);
            surface.background = ColorAlpha { (byte)(opacity * 255), background };
            surface.Area(0,0, 49, 49);
         }
      }
   };   

   EditBox R
   {
      this, position = { 350, 80 }, size = { 32, 20 };

      bool NotifyModified(EditBox control)
      {
         ColorRGB rgb;
         int value = strtol(control.contents, null, 10);
         value = Min(Max(value,0),255);
         argb.color.r = (byte)value;
         rgb = argb;
         Lab = rgb;
         cmyk = rgb;
         hsv = rgb;
         UpdatePosition();
         return true;
      }
   };

   public property bool hasAlpha
   {
      set
      {
         hasAlpha = value;
         aRamp.autoCreate = value;
         A.autoCreate = value;
         labelA.autoCreate = value;
         if(value) clientSize.h = 275 + 50; else clientSize.h = 275; 
      }
      get 
      {
         return hasAlpha;
      }
   }
};
