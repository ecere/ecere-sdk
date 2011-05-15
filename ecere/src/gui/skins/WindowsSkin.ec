namespace gui::skins;

import "Window"

#define BORDER       4
#define TOP          4
#define BOTTOM       4
#define CORNER       (BORDER * 2)
#define CAPTION      20
#define DEAD_BORDER  3
#define MIN_WIDTH    60
#define MIN_HEIGHT   3
#define BUTTON_OFFSET   2
#define NAME_OFFSET   2
#define NAME_OFFSETX  4

#define SB_WIDTH  16
#define SB_HEIGHT 16

#define MENU_HEIGHT     25
#define STATUS_HEIGHT   18

/*
#define TEXT_COLOR   black

#define GRADIENT_DIRECTION horizontal

static ColorKey gradient[] =
{
   { Color { 128, 128, 255}, 0.00f },
   { Color { 254, 254, 254}, 0.60f },
   { Color {   0,   0, 255}, 1.00f }
};
*/
/*
#define GRADIENT_DIRECTION Vertical
static ColorKey gradient[] =
{
   { Color {   0,   0, 255}, 0.00f },
   { Color { 254, 254, 254}, 0.60f },
   { Color { 128, 128, 255}, 1.00f }
};

static ColorKey gradientInactive[] =
{
   { Color {   0,   0,  0},  0.00f },
   { Color { 254, 254, 254}, 0.60f },
   { Color { 128, 128, 128}, 1.00f }
};
*/

#define GRADIENT_SMOOTHNESS 1.0f
#define GRADIENT_DIRECTION horizontal
#define TEXT_COLOR         white
#define TEXT_INACTIVE      Color { 212,208,200 }

static ColorKey gradient[] =
{
   { ColorAlpha { 255, Color {  10,   36, 106 } }, 0.00f },
   { ColorAlpha { 255, Color { 166,  202, 240 } }, 1.00f }
};
static ColorKey gradientInactive[] =
{
   { ColorAlpha { 255, Color { 128, 128, 128 } }, 0.00f },
   { ColorAlpha { 255, Color { 192, 192, 192 } }, 1.00f }
};

char * cursorsBitmaps[] = 
{
   "<:ecere>cursors/arrow.png",
   "<:ecere>cursors/iBeam.png",
   "<:ecere>cursors/cross.png",
   "<:ecere>cursors/move.png",
   "<:ecere>cursors/sizeNorthEastSouthWest.png",
   "<:ecere>cursors/sizeNorthSouth.png",
   "<:ecere>cursors/sizeNorthWestSouthEast.png",
   "<:ecere>cursors/sizeWestEast.png",
   "<:ecere>cursors/move.png"
};

static Point cursorsHotSpots[] =
{
   { 0, 0 },
   { 0, 0 },
   { 8, 8 },
   { 10, 10 },
   { 8, 8 },
   { 4, 10 },
   { 7, 7 },
   { 5, 0 }
};

static char * skinBitmaps[SkinBitmap] =
{
   "<:ecere>elements/areaMinimize.png",
   "<:ecere>elements/areaMaximize.png",
   "<:ecere>elements/areaRestore.png",
   "<:ecere>elements/areaClose.png"
};

class WindowsSkin : Skin
{
   class_property(name) = "Windows";
   class_property(selectionColor) = Color { 10, 36, 106 };
   class_property(disabledFrontColor) = Color { 128,128,128 };
   class_property(disabledBackColor) = (Color)white;

   FontResource ::SystemFont()
   {
      return FontResource { faceName = "Tahoma", size = 8.25f };
   }

   FontResource ::CaptionFont()
   {
      return FontResource { faceName = "Tahoma", size = 8.25f, bold = true };
   }

   char * ::CursorsBitmaps(uint id, int * hotSpotX, int *hotSpotY, byte ** paletteShades)
   {
      *hotSpotX = cursorsHotSpots[id].x;
      *hotSpotY = cursorsHotSpots[id].y;
      *paletteShades = null;
      return cursorsBitmaps[id];
   }

   BitmapResource ::GetBitmap(SkinBitmap id)
   {
      return BitmapResource { fileName = skinBitmaps[id] };
   }

   int ::VerticalSBW() { return SB_WIDTH; }
   int ::HorizontalSBH() { return SB_HEIGHT; }
};


public class WindowsSkin_Window : Window
{
   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;

      if(hasMenuBar && state != minimized)
      {
         *h += MENU_HEIGHT;
      }
      if(statusBar && state != minimized)
      {
         *h += STATUS_HEIGHT;
      }

      if(nativeDecorations) return;
      if((((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel) && state != minimized)
      {
         *w += 4;
         *h += 4;
      }
      if(((BorderBits)borderStyle).sizable && (state == normal))
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
   }

   void SetWindowMinimum(MinMaxValue * mw, MinMaxValue * mh)
   {
      bool isNormal = (state == normal);
      if(nativeDecorations) return;
      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         *mw = MIN_WIDTH;
         *mh = MIN_HEIGHT;
      }
      else
         *mw = *mh = 0;
      if(((BorderBits)borderStyle).sizable && isNormal)
         *mw += 2*CORNER;
      // GetDecorationsSize(window, mw, mh);

      if(hasVertScroll)
         *mw += SB_WIDTH;
      if(hasHorzScroll)
         *mh += SB_HEIGHT;
      if(hasVertScroll && hasHorzScroll)
      {
         *mw += 2 * SB_WIDTH + SB_WIDTH;
         *mh += 2 * SB_HEIGHT + SB_HEIGHT;
         if(((BorderBits)borderStyle).sizable && isNormal)
            *mw -= 2*CORNER;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      bool isNormal = (state == normal);
      MinMaxValue aw = 0, ah = 0;

      *x = *y = 0;

      if(hasMenuBar)
      {
         *y += MENU_HEIGHT;
      }

      GetDecorationsSize(&aw, &ah);

      if(!nativeDecorations)
      {
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
      }

      // Reduce client area
      *cw = *w - aw;
      *ch = *h - ah;

      *cw = Max(*cw, 0);
      *ch = Max(*ch, 0);
   }

   void ShowDecorations(Font captionFont, Surface surface, char * name, bool active, bool moving)
   {
      bool isNormal = (state == normal);
      int top = 0, border = 0, bottom = 0;

      if(nativeDecorations) return;

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
         top = DEAD_BORDER;
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
         surface.SetForeground(black);
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

   bool IsMouseMoving(int x, int y, int w, int h)
   {
      bool isNormal = (state == normal);
      bool result = false;
      if(nativeDecorations) return false;

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         int corner = 0, border = 0, top = 0;
         if(((BorderBits)borderStyle).sizable && isNormal)
         {
            corner = CORNER;
            border = BORDER;
            top    = TOP;
         }
         // Special case for having caption on resize bar
         if(!CAPTION)
            result = Box { corner, 0, w-corner-1, TOP-1 }.IsPointInside({x,y});
         else
            result = Box { border, top, w-border-1, top+CAPTION-1 }.IsPointInside({x, y});
      }
      return result;
   }

   bool IsMouseResizing(int x, int y, int w, int h, bool *resizeX, bool *resizeY, bool *resizeEndX, bool *resizeEndY)
   {
      bool result = false;

      *resizeX = *resizeY = *resizeEndX = *resizeEndY = false;
      if(nativeDecorations) return false;

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

   void UpdateNonClient()
   {
      bool isNormal = (state == normal);
      int top = 0, border = 0;
      int insideBorder = 0;

      if(!nativeDecorations) 
      {
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
            top = DEAD_BORDER;
            border = DEAD_BORDER;
         }
         else if(((BorderBits)borderStyle).contour)
         {
            top = 1;
            border = 1;
         }
         insideBorder = border;
         if(((BorderBits)borderStyle).deep)
            insideBorder += 2;
      }

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
      if(!nativeDecorations)
      {
         if(sysButtons[0])
         {
            sysButtons[0].anchor = { right = 35 + border, top = top + BUTTON_OFFSET };
            sysButtons[0].size = { 15, 15 };
            sysButtons[0].bevel = true;
            sysButtons[0].bitmap = { skinBitmaps[(state == minimized) ? restore : minimize] };
            sysButtons[0].visible = true;
         }
         if(sysButtons[1])
         {
            sysButtons[1].anchor = { right = 20 + border, top = top + BUTTON_OFFSET };
            sysButtons[1].size = { 15, 15 };
            sysButtons[1].bevel = true;
            sysButtons[1].bitmap = { skinBitmaps[(state == maximized) ? restore : maximize] };
            sysButtons[1].visible = true;
         }
         if(sysButtons[2])
         {
            sysButtons[2].anchor = { right = 2 + border, top = top + BUTTON_OFFSET };
            sysButtons[2].size = { 15, 15 };
            sysButtons[2].bevel = true;
            sysButtons[2].bitmap = { skinBitmaps[close] };
            sysButtons[2].visible = true;
         }
      }
   }
}
