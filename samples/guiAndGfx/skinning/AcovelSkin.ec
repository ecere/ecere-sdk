public import "ecere"

#define DARK_SKIN

#ifdef DARK_SKIN
define skinBackground = Color { r = 40, g = 40, b = 40 };
define skinForeground = white;
define skinTextForeground = lightGray;
define evenRowBackground = Color { 80, 70, 60 };
define selectionColor = steelBlue;

ColorKey skinGradient[3] =
{
   { Color { 40,40,40 }, 0.0f },
   { darkGray, 0.5f },
   { Color { 40,40,40 }, 1.0f },
};

#else

define skinForeground = black;
define skinTextForeground = black;
define skinBackground = white;
define evenRowBackground = lavender;
define selectionColor = cornflowerBlue;

ColorKey skinGradient[2] =
{
   { lightGray, 0.0f }
   { white, 1.0f },
};

#endif

#define BORDER       2
#define TOP          2
#define BOTTOM       2
#define CORNER       (BORDER * 2)
#define CAPTION      12
#define DEAD_BORDER  2
#define MIN_WIDTH    60
#define MIN_HEIGHT   3
#define BUTTON_OFFSET   0
#define NAME_OFFSET   0
#define NAME_OFFSETX  4

#define SB_WIDTH  16
#define SB_HEIGHT 16

#define MENU_HEIGHT     25
#define STATUS_HEIGHT   18

#define TEXT_COLOR         skinForeground
#define TEXT_INACTIVE      darkGray

class AcovelSkin_Window : Window
{
   void ShowDecorations(Font captionFont, Surface surface, char * name, bool active, bool moving)
   {
      bool isNormal = (state == normal || state == maximized);
      int top = 0, border = 0, bottom = 0;
      if(state == minimized)
         top = border = bottom = DEAD_BORDER;
      else if(((BorderBits)borderStyle).sizable)
      {
         top = isNormal ? TOP : 0;
         border = isNormal ? BORDER : 0;
         bottom = BOTTOM;
      }
      else if(((BorderBits)borderStyle).fixed)
      {
         top = 2; //DEAD_BORDER;
         border = DEAD_BORDER;
         bottom = DEAD_BORDER;
      }
      else if(((BorderBits)borderStyle).contour)
      {
         top = 1;
         border = 1;
         bottom = 1;
      }

      if(((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel)
      {
         int deepTop = 0, deepBottom = 0, deepBorder = 0;
         if(((BorderBits)borderStyle).contour)
         {
            deepBorder = border;
            deepTop = (((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar)) ? (top + CAPTION) : top;
            deepBottom = (((BorderBits)borderStyle).sizable && isNormal) ? bottom : border;
         }

         surface.Bevel(((BorderBits)borderStyle).bevel ? false : true, deepBorder, deepTop, 
            size.w - deepBorder - deepBorder, size.h - deepBottom - deepTop);
      }

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         /*
         if(state != maximized || !((BorderBits)borderStyle).sizable)
         {
            // Frame for ES_CAPTION windows
            surface.Bevel(false, 0, 0, size.w, size.h);
            surface.SetForeground(activeBorder);
            surface.Rectangle(2, 2, size.w-3, size.h-3);

            // Resizeable frame is 1 pixel thicker 
            if(((BorderBits)borderStyle).sizable && isNormal)
               surface.Rectangle(3, 3, size.w - 4, size.h - 4);
         }

         // Caption
         if(active)
            surface.Gradient(gradient, sizeof(gradient) / sizeof(ColorKey), GRADIENT_SMOOTHNESS, GRADIENT_DIRECTION,
               border, top, size.w - border - 1, top + CAPTION - 2);
         else
            surface.Gradient(gradientInactive, sizeof(gradientInactive) / sizeof(ColorKey), 
            GRADIENT_SMOOTHNESS, GRADIENT_DIRECTION,
               border, top, size.w - border - 1, top + CAPTION - 2);

         surface.SetForeground(activeBorder);
         if(state != minimized)
            surface.HLine(border, size.w-border-1, top + CAPTION-1);
         */

         surface.SetForeground(skinBackground);
         surface.Rectangle(0,0, size.w-1, size.h-1);
         surface.SetForeground(active ? TEXT_COLOR : TEXT_INACTIVE /*skinForeground*/);
         surface.Rectangle(1,1, size.w-2, size.h-2);
         surface.SetBackground(skinBackground);
         surface.Area(2, 2, size.w-3, CAPTION + 2);

         // surface.TextFont(captionFont);
         // surface.WriteText(4,2, name, strlen(name));

         surface.SetForeground((active ? TEXT_COLOR : TEXT_INACTIVE));
         surface.TextOpacity(false);
         surface.TextFont(captionFont);
         if(name)
         {
            int buttonsSize = border +
               ((hasMaximize || hasMinimize) ? 52 : 18);
            surface.WriteTextDots(left, border + NAME_OFFSETX, top + NAME_OFFSET, 
               size.w - (buttonsSize + border + 4), name, strlen(name));
         }
      }
      if(((BorderBits)borderStyle).contour && !((BorderBits)borderStyle).fixed)
      {
         surface.SetForeground(skinForeground /*black*/);
         surface.Rectangle(0, 0, size.w - 1, size.h - 1);
      }

      if(state != minimized && hasHorzScroll && hasVertScroll)
      {
         if(sbh && sbh.visible && sbv && sbv.visible)
         {
            surface.SetBackground(activeBorder);
            surface.Area(
               clientStart.x + clientSize.w,
               clientStart.y + clientSize.h,
               clientStart.x + clientSize.w + SB_WIDTH - 1,
               clientStart.y + clientSize.h + SB_HEIGHT - 1);
         }
      }
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;
      if((((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel) && state != minimized)
      {
         *w += 4;
         *h += 4;
      }
      if(((BorderBits)borderStyle).sizable && (state == normal || state == maximized))
      {
         *w += 2 * BORDER;
         *h += TOP + BOTTOM;
      }
      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         *h += CAPTION;
         if(!((BorderBits)borderStyle).sizable || state == minimized)
         {
            *h += 2*DEAD_BORDER;
            *w += 2*DEAD_BORDER;
         }
      }
      if(((BorderBits)borderStyle).contour && !((BorderBits)borderStyle).fixed)
      {
         *w += 2;
         *h += 2;
      }
      if(hasMenuBar && state != minimized)
      {
         *h += MENU_HEIGHT;
      }
      if(statusBar && state != minimized)
      {
         *h += STATUS_HEIGHT;
      }
   }

   bool IsMouseMoving(int x, int y, int w, int h)
   {
      BorderBits style = (BorderBits)borderStyle; // TOFIX: borderStyle.fixed doesn't work
      if(style.fixed)
      {
         bool resizeX, resizeY, resizeEndX, resizeEndY;
         if(!IsMouseResizing(x, y, w, h, &resizeX, &resizeY, &resizeEndX, &resizeEndY))
            return true;
      }
      return false;
   }

   bool IsMouseResizing(int x, int y, int w, int h, bool *resizeX, bool *resizeY, bool *resizeEndX, bool *resizeEndY)
   {
      bool result = false;

      *resizeX = *resizeY = *resizeEndX = *resizeEndY = false;

      if(((BorderBits)borderStyle).sizable && (state == normal))
      {
         // TopLeft Corner
         if(Box { 0, 0,CORNER-1, TOP-1 }.IsPointInside({x, y}))
            result = *resizeX = *resizeY = true;
         // TopRight Corner
         if(Box { w-CORNER-1, 0, w-1, TOP-1 }.IsPointInside({x, y}))
            result = *resizeEndX = *resizeY = true;
         // BottomLeft Corner
         if(Box { 0, h-BOTTOM-1, CORNER-1, h-1 }.IsPointInside({x, y}))
            result = *resizeX = *resizeEndY = true;
         // BottomRight Corner
         if(Box { w-CORNER-1, h-BOTTOM-1, w-1, h-1 }.IsPointInside({x, y}))
            result = *resizeEndX = *resizeEndY = true;
         // Left Border
         if(Box { 0,TOP, BORDER, h-BOTTOM-1 }.IsPointInside({x, y}))
            result = *resizeX = true;
         // Right Border
         if(Box { w-BORDER-1, TOP, w-1, h-BOTTOM-1 }.IsPointInside({x, y}))
            result = *resizeEndX = true;
         // Top Border
         if(Box { CORNER, 0, w-CORNER-1, TOP-1 }.IsPointInside({x, y}))
            result = *resizeY = true;
         // Bottom Border
         if(Box { CORNER, h-BOTTOM-1, w-CORNER-1, h-1 }.IsPointInside({x, y}))
            result = *resizeEndY = true;
      }
      return result;
   }

   void SetWindowMinimum(MinMaxValue * mw, MinMaxValue * mh)
   {
      bool isNormal = (state == normal || state == maximized);
      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         *mw = MIN_WIDTH;
         *mh = MIN_HEIGHT;
      }
      else
         *mw = *mh = 0;
      /*
      if(((BorderBits)borderStyle).sizable && isNormal)
         *mw += 2*CORNER;
      // GetDecorationsSize(window, mw, mh);
      */

      if(hasVertScroll)
         *mw += SB_WIDTH;
      if(hasHorzScroll)
         *mh += SB_HEIGHT;
      if(hasVertScroll && hasHorzScroll)
      {
         *mw += 2 * SB_WIDTH + SB_WIDTH;
         *mh += 2 * SB_HEIGHT + SB_HEIGHT;
         /*
         if(((BorderBits)borderStyle).sizable && isNormal)
            *mw -= 2*CORNER;
         */
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      bool isNormal = (state == normal || state == maximized);
      MinMaxValue aw = 0, ah = 0;

      *x = *y = 0;

      GetDecorationsSize(&aw, &ah);

      // Compute client area start
      if(((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel)
      {
         *x += 2;
         *y += 2;
      }

      if(((BorderBits)borderStyle).sizable && isNormal)
      {
         *x += BORDER;
         *y += TOP;
      }

      if(hasMenuBar)
      {
         *y += MENU_HEIGHT;
      }

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         *y += CAPTION;
         if(!((BorderBits)borderStyle).sizable || state == minimized)
         {
            *y += DEAD_BORDER;
            *x += DEAD_BORDER;
         }
      }

      if(((BorderBits)borderStyle).contour && !((BorderBits)borderStyle).fixed)
      {
         *x += 1;
         *y += 1;
      }

      // Reduce client area
      *cw = *w - aw;
      *ch = *h - ah;

      *cw = Max(*cw, 0);
      *ch = Max(*ch, 0);
   }

   void UpdateNonClient()
   {
      bool isNormal = (state == normal || state == maximized);
      int top = 0, border = 0;
      int insideBorder;
      if(state == minimized)
         top = border = DEAD_BORDER;
      else if(((BorderBits)borderStyle).sizable)
      {
         if(state == maximized && parent.menuBar)
         {
            top = 2;
            border = 2;
         }
         else
         {
            top = isNormal ? TOP : 0;
            border = isNormal ? BORDER : 0;
         }
      }
      else if(((BorderBits)borderStyle).fixed)
      {
         top = 2;
         border = 2;
      }
      else if(((BorderBits)borderStyle).contour)
      {
         top = 1;
         border = 1;
      }
      insideBorder = border;
      if(((BorderBits)borderStyle).deep)
         insideBorder += 2;

      if(menuBar)
      {
         if(state == minimized)
            menuBar.visible = false;
         else
            menuBar.visible = true;
         menuBar.Move(clientStart.x, clientStart.y - MENU_HEIGHT, size.w - insideBorder * 2, MENU_HEIGHT);
      }
      if(statusBar)
      {
         if(state == minimized)
            statusBar.visible = false;
         else
         {
            statusBar.visible = true;
            statusBar.anchor = { left = clientStart.x, bottom = border };
            statusBar.size.w = size.w - insideBorder * 2;
         }
      }

      if(minimizeButton)
      {
         minimizeButton.anchor = { right = ((maximizeButton && !maximizeButton.disabled) ? 49 : 24) + border, top = top + BUTTON_OFFSET };
         minimizeButton.size = { 20, 10 };
         minimizeButton.foreground = skinForeground;
         minimizeButton.background = skinBackground;
         minimizeButton.bevel = false;
         minimizeButton.OnRedraw = Minimize_OnRedraw;
         minimizeButton.visible = true;
      }
      if(maximizeButton && !maximizeButton.disabled)
      {
         maximizeButton.anchor = { right = 24 + border, top = top + BUTTON_OFFSET };
         maximizeButton.size = { 20, 10 };
         maximizeButton.bevel = false;
         maximizeButton.foreground = skinForeground;
         maximizeButton.background = skinBackground;
         maximizeButton.OnRedraw = Maximize_OnRedraw;
         maximizeButton.visible = true;
      }
      if(closeButton)
      {
         closeButton.anchor = { right = -1 + border, top = top + BUTTON_OFFSET };
         closeButton.size = { 20, 10 };
         closeButton.bevel = false;
         closeButton.foreground = skinForeground;
         closeButton.background = skinBackground;
         closeButton.OnRedraw = Close_OnRedraw;
         closeButton.visible = true;
      }
   }

   void OnApplyGraphics()
   {
      background = skinBackground;
      foreground = skinForeground;
   }
}

static void Button::SmallButton_OnRedraw(Surface surface)
{
   surface.SetForeground(parent.active ? TEXT_COLOR : TEXT_INACTIVE);
   surface.VLine(0, clientSize.h-2, 0);
   surface.VLine(0, clientSize.h-2, clientSize.w-1);
   surface.HLine(1,clientSize.w-2, clientSize.h-1);
}

static void Button::Minimize_OnRedraw(Surface surface)
{
   SmallButton_OnRedraw(this, surface);
   surface.DrawLine( 5, 3, 14, 3);
   surface.DrawLine( 5, 4, 14, 4);
}

static void Button::Maximize_OnRedraw(Surface surface)
{
   SmallButton_OnRedraw(this, surface);
   surface.Rectangle( 5, 2, 14, 7);
   surface.DrawLine( 5, 3, 14, 3);
}

static void Button::Close_OnRedraw(Surface surface)
{
   SmallButton_OnRedraw(this, surface);
   surface.DrawLine( 7, 2, 12, 7);
   surface.DrawLine( 8, 2, 13, 7);
   surface.DrawLine( 12, 2, 7, 7);
   surface.DrawLine( 13, 2, 8, 7);
}

class AcovelSkin_StatusBar : StatusBar
{
   void OnApplyGraphics()
   {
      background = skinBackground;
      foreground = skinForeground;
   }
}

class AcovelSkin_FileDialog : FileDialog
{
   void OnApplyGraphics()
   {
      Window child;
      background = skinBackground;
      foreground = skinForeground;
      for(child = firstChild; child; child = child.next)
      {
         if(!child.opacity)
            child.foreground = skinForeground;
      }
   }
}

#define PUREVTBL(c)     ((int (**)())*(void **)((byte *)class(c).data + sizeof(void *)))

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw;

static void Dummy()
{
   Window a;
   a.OnApplyGraphics();
   a.OnRedraw(null);
}

class AcovelSkin_Button : Button
{
   void OnApplyGraphics()
   {
      //background = skinBackground;
      background = Color { (int)70 * 6/10, (int)130* 6/10, (int)180* 6/10 };
      foreground = skinForeground;
   }

   void OnRedraw(Surface surface)
   {
      int isDefault = (int)this.isDefault;
      ((void (*)(Window, Surface))(void *)PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw])(this, surface);
      if(bevel || (bevelOver && (buttonState == down || buttonState == over || checked)))
      {
         Color c = steelBlue;
         if(buttonState == down || checked)
         {
            surface.SetForeground(selectionColor);
            surface.HLine(isDefault + 0, clientSize.w-2-isDefault, 0);
            surface.VLine(isDefault + 1, clientSize.h-2-isDefault, 0);
            surface.SetForeground(Color { Min((int)c.r * 16/10, 255), Min((int)c.g * 16/10, 255), Min((int)c.b * 16/10,255) });
            surface.HLine(isDefault + 0, clientSize.w-1-isDefault, clientSize.h-1-isDefault);
            surface.VLine(isDefault + 0, clientSize.h-2-isDefault, clientSize.w-1-isDefault);
         }
         else
         {
            surface.SetForeground(Color { Min((int)c.r * 16/10, 255), Min((int)c.g * 16/10, 255), Min((int)c.b * 16/10,255) });
            surface.HLine(0 + isDefault, clientSize.w-2 - isDefault,  isDefault);
            surface.VLine(1 + isDefault, clientSize.h-2 - isDefault,  isDefault);
            
            
            surface.SetForeground(selectionColor);
            surface.HLine(1 + isDefault, clientSize.w-2 - isDefault, clientSize.h-2 - isDefault);
            surface.VLine(1 + isDefault, clientSize.h-3 - isDefault, clientSize.w-2 - isDefault);
            
            if(bevel)
            {
               //surface.SetForeground(skinForeground);
               surface.SetForeground(Color { c.r * 4/10, c.g * 4/10, c.b * 4/10 });
               surface.HLine( isDefault, clientSize.w-1 - isDefault, clientSize.h-1 - isDefault);
               surface.VLine( isDefault, clientSize.h-2 - isDefault, clientSize.w-1 - isDefault);
            }
         }
      }
      if(isDefault)
      {
         surface.SetForeground(skinForeground);
         surface.Rectangle(0,0,clientSize.w-1,clientSize.h-1);
      }
      if(!(bevelOver) && !isRemote)
      {
         if(active)
         {
            int x1,y1,x2,y2;
            int offset = (buttonState == down && this.offset) ? 1 : 0;
            surface.SetForeground(skinForeground);
            surface.LineStipple(0x5555);

            #define CAPTION_DISTANCE   18
            if((isRadio || isCheckbox) && text)
            {
               x1 = /*clientSize.h + */CAPTION_DISTANCE;
               y1 = 0;
               x2 = clientSize.w-4;
               y2 = clientSize.h-4;
            }
            else
            {
               x1 = 3+offset;
               y1 = 3+offset;
               x2 = clientSize.w - 5+offset;
               y2 = clientSize.h - 5+offset;

               if(isRadio || isCheckbox)
               {
                  x1-=3;
                  y1-=3;
                  x2+=1;
                  y2+=1;
               }
            }
            if((x2 - x1) & 1) x2++;
            if((y2 - y1) & 1) y2++;

            surface.Rectangle(x1, y1, x2, y2);
            surface.LineStipple(0);
         }
      }
   }
}

class AcovelSkin_ScrollBar : ScrollBar
{
   void OnApplyGraphics()
   {
      ((void (*)(Window))(void *)PUREVTBL(ScrollBar)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics])(this);

      background = { skinBackground.r * 9 / 6, skinBackground.g * 9 / 6, skinBackground.b * 9 / 6 };

      upBtn.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;
      upBtn.bitmap = { "<:ecere>elements/arrowUp.png", monochrome = true };
      downBtn.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;
      downBtn.bitmap = { "<:ecere>elements/arrowDown.png", monochrome = true };
      thumb.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;
   }   
}

class AcovelSkin_DropBox : DropBox
{
   void OnApplyGraphics()
   {
      ((void (*)(Window))(void *)PUREVTBL(DropBox)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics])(this);
      button.bitmap = { "<:ecere>elements/arrowDown.png", monochrome = true };
      background = skinBackground;
      foreground = skinForeground;
      this.selectionColor = ::selectionColor;
   }   
}

class AcovelSkin_ListBox : ListBox
{
   void OnApplyGraphics()
   {
      ((void (*)(Window))(void *)PUREVTBL(ListBox)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics])(this);
      background = skinBackground;
      foreground = skinForeground;
      this.selectionColor = ::selectionColor;
   }   
}

public class AcovelSkin : Skin
{
   class_property(name) = "Acovel";
   class_property(selectionColor) = (Color)selectionColor;
   class_property(disabledBackColor) = (Color)Color{ 0,0,0 };
   class_property(disabledFrontColor) = (Color)Color{ 128,128,128 };

   FontResource ::SystemFont()
   {
      return { faceName = "Tahoma", size = 8.25f };
   }

   FontResource ::CaptionFont()
   {
      return { faceName = "Verdana", size = 6.5f };
   }

   char * ::CursorsBitmaps(uint id, int *hotSpotX, int *hotSpotY, byte ** paletteShades)
   {
      return null;
   }

   BitmapResource ::GetBitmap(int id)
   {
      return null;
   }

   int ::VerticalSBW()
   {
      return 16;
   }

   int ::HorizontalSBH()
   {
      return 16;
   }
}
