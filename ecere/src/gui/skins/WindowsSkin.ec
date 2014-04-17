#if defined(WIN32)
#define WIN32_LEAN_AND_MEAN
#define String _String
#define Method _Method
#define strlen _strlen
#include <windows.h>
#undef Method
#undef String
#undef strlen
#endif

import "Window"

#if !defined(WIN32)
bool gui::drivers::XGetBorderWidths(Window window, Box box);
#endif

namespace gui::skins;

#define BORDER       4
#define TOP          4
#define BOTTOM       4
#define CORNER       (BORDER * 2)
#if defined(HIGH_DPI)
#define BUTTON_SIZE  45
#define CAPTION      60
#else
#define BUTTON_SIZE  15
#define CAPTION      20
#endif
#define DEAD_BORDER  3
#define MIN_WIDTH    60
#define MIN_HEIGHT   3
#define BUTTON_OFFSET   2
#if defined(HIGH_DPI)
#define NAME_OFFSET   12
#else
#define NAME_OFFSET   2
#endif
#define NAME_OFFSETX  4

#define SB_WIDTH  16
#define SB_HEIGHT 16


#define GRADIENT_SMOOTHNESS 1.0f

#define TEXT_COLOR   black
/*

#define GRADIENT_DIRECTION horizontal

static ColorKey gradient[] =
{
   { Color { 128, 128, 255}, 0.00f },
   { Color { 254, 254, 254}, 0.60f },
   { Color {   0,   0, 255}, 1.00f }
};
*/

#define GRADIENT_DIRECTION vertical
static ColorKey gradient[] =
{
   //{ ColorAlpha { 255, { 180, 200, 220} }, 0.00f },
   { ColorAlpha { 255, menuBarColor }, 0.00f },
   { ColorAlpha { 255, { 255, 255, 255} }, 0.60f },
   { ColorAlpha { 255, { 158, 158, 160} }, 1.00f }
};

static ColorKey gradientInactive[] =
{
   //{ ColorAlpha { 255, { 160, 180, 200} },  0.00f },
   { ColorAlpha { 255, popupMenuColor }, 0.00f },
   { ColorAlpha { 255, { 220, 220, 220} }, 0.60f },
   { ColorAlpha { 255, { 120, 120, 120} }, 1.00f }
};

/*
#define GRADIENT_DIRECTION horizontal
#define TEXT_COLOR         white
*/
//#define TEXT_INACTIVE      Color { 212,208,200 }
#define TEXT_INACTIVE      Color { 40, 50, 60 }
/*
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
*/
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
   class_property(selectionText)  = (Color)white;
   class_property(disabledFrontColor) = Color { 128,128,128 };
   class_property(disabledBackColor) = (Color)white;

   FontResource ::SystemFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f };
#endif
   }

   FontResource ::CaptionFont()
   {
#if defined(HIGH_DPI)
      return FontResource { faceName = $"Tahoma", size = 18.25f, bold = true };
#else
      return FontResource { faceName = $"Tahoma", size = 8.25f, bold = true };
#endif
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
         *h += skinMenuHeight;
      }
      if(statusBar && state != minimized)
      {
         *h += statusBarHeight;
      }

      if(nativeDecorations && rootWindow == this && windowHandle && !is3D)
      {
#if defined(WIN32)
         RECT rcClient = { 0 }, rcWindow = { 0 };
         if(GetClientRect(windowHandle, &rcClient) && GetWindowRect(windowHandle, &rcWindow))
         {
            *w += (rcWindow.right - rcWindow.left) - rcClient.right;
            *h += (rcWindow.bottom - rcWindow.top) - rcClient.bottom;
         }

         // PrintLn(_class.name, " is at l = ", rcWindow.left, ", r = ", rcWindow.right);
#else
         Box widths = { 0 };
#if !defined(__ANDROID__)
         XGetBorderWidths(this, widths);
#endif
         *w += widths.left + widths.right;
         *h += widths.top + widths.bottom;
#endif
         return;
      }
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
      if(((BorderBits)borderStyle).fixed && (state != maximized || !GetParentMenuBar()))
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
      if(nativeDecorations && rootWindow == this && windowHandle && !is3D) return;
      if(((BorderBits)borderStyle).fixed && (state != maximized || !GetParentMenuBar()))
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
         *y += skinMenuHeight;
      }

      GetDecorationsSize(&aw, &ah);

      if(nativeDecorations && rootWindow == this && windowHandle && !is3D)
      {
#if defined(WIN32)
         RECT rcWindow = { 0, 0, 0, 0 };
         POINT client00 = { 0, 0 };
         ClientToScreen(windowHandle, &client00);
         GetWindowRect(windowHandle, &rcWindow);
         *x += client00.x - rcWindow.left;
         *y += client00.y - rcWindow.top;
#else
         Box widths = { 0 };
#if !defined(__ANDROID__)
         XGetBorderWidths(this, widths);
#endif
         *x += widths.left;
         *y += widths.top;
#endif
      }
      else
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

         if(((BorderBits)borderStyle).fixed && (state != maximized || !GetParentMenuBar()))
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
      Window parentMenuBar = GetParentMenuBar();

      if(nativeDecorations && rootWindow == this && windowHandle && !is3D) return;

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
            deepTop = (((BorderBits)borderStyle).fixed && (state != maximized || !parentMenuBar)) ? (top + CAPTION) : top;
            deepBottom = (((BorderBits)borderStyle).sizable && isNormal) ? bottom : border;
         }

         surface.Bevel(((BorderBits)borderStyle).bevel ? false : true, deepBorder, deepTop,
            size.w - deepBorder - deepBorder, size.h - deepBottom - deepTop);
      }

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parentMenuBar))
      {
         if(state != maximized || !((BorderBits)borderStyle).sizable)
         {
            // Frame for ES_CAPTION windows
            surface.Bevel(false, 0, 0, size.w, size.h);
            surface.SetForeground(formColor);
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

         surface.SetForeground(formColor);
         if(state != minimized)
            surface.HLine(border, size.w-border-1, top + CAPTION-1);

         surface.SetForeground((active ? TEXT_COLOR : TEXT_INACTIVE));
         surface.TextOpacity(false);
         surface.TextFont(captionFont);
         if(name)
         {
            int buttonsSize = border +
               ((hasMaximize || hasMinimize) ? (BUTTON_SIZE*3)+7 : (BUTTON_SIZE+3));
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
            surface.SetBackground(formColor);
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
      if(nativeDecorations && rootWindow == this && windowHandle && !is3D) return false;

      if(((BorderBits)borderStyle).fixed && (state != maximized || !GetParentMenuBar()))
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
      if(nativeDecorations && rootWindow == this && windowHandle && !is3D) return false;

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

      if(!nativeDecorations || rootWindow != this || !windowHandle || is3D)
      {
         if(state == minimized)
            top = border = DEAD_BORDER;
         else if(((BorderBits)borderStyle).sizable)
         {
            if(state == maximized && GetParentMenuBar())
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
      else
      {
         border = clientStart.x;
         insideBorder = border;
      }

      if(menuBar)
      {
         if(state == minimized)
            menuBar.visible = false;
         else
            menuBar.visible = true;
         menuBar.Move(clientStart.x, clientStart.y - skinMenuHeight, size.w - insideBorder * 2, skinMenuHeight);
      }
      if(statusBar)
      {
         if(state == minimized)
            statusBar.visible = false;
         else
         {
            statusBar.visible = true;
            if(nativeDecorations && rootWindow == this && windowHandle && !is3D)
            {
               statusBar.anchor = { left = clientStart.x, bottom = (int)(size.h - clientSize.h - clientStart.y - statusBarHeight ) };
               statusBar.size.w = size.w - insideBorder * 2;
            }
            else
            {
               statusBar.anchor = { left = clientStart.x, bottom = border };
               statusBar.size.w = size.w - insideBorder * 2;
            }
         }
      }
      if(!nativeDecorations || rootWindow != this || !windowHandle || is3D)
      {
         if(sysButtons[0])
         {
            sysButtons[0].anchor = { right = 2+(2*BUTTON_SIZE+3) + border, top = top + BUTTON_OFFSET };
            sysButtons[0].size = { BUTTON_SIZE, BUTTON_SIZE };
            sysButtons[0].bevel = true;
            sysButtons[0].bitmap = { skinBitmaps[(state == minimized) ? restore : minimize] };
            sysButtons[0].visible = true;
         }
         if(sysButtons[1])
         {
            sysButtons[1].anchor = { right = 2+(BUTTON_SIZE+3) + border, top = top + BUTTON_OFFSET };
            sysButtons[1].size = { BUTTON_SIZE, BUTTON_SIZE };
            sysButtons[1].bevel = true;
            sysButtons[1].bitmap = { skinBitmaps[(state == maximized) ? restore : maximize] };
            sysButtons[1].visible = true;
         }
         if(sysButtons[2])
         {
            sysButtons[2].anchor = { right = 2 + border, top = top + BUTTON_OFFSET };
            sysButtons[2].size = { BUTTON_SIZE, BUTTON_SIZE };
            sysButtons[2].bevel = true;
            sysButtons[2].bitmap = { skinBitmaps[close] };
            sysButtons[2].visible = true;
         }
      }
      else
      {
         if(sysButtons[0])
            sysButtons[0].visible = false;
         if(sysButtons[1])
            sysButtons[1].visible = false;
         if(sysButtons[2])
            sysButtons[2].visible = false;
      }
   }
}


#define PUREVTBL(c)     (*(void ***)((byte *)class(c).data + sizeof(uintptr)))
#define CAPTION_DISTANCE   18

default:
static void Dummy()
{
   Window a;
   a.OnApplyGraphics();
   a.OnRedraw(null);
}

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw;
private:

public class WindowsSkin_Button : Button
{
   void OnRedraw(Surface surface)
   {
      if(isRadio)
      {
         ((void (*)(Window, Surface))PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw])(this, surface);
         return;
      }
      // if(bevel)
      {
         ButtonState state = this.buttonState;
         Bitmap buttonBitmap = bitmap ? bitmap.bitmap : null;
         char * text = this.text;
         int offset = (state == down && this.offset) ? 1 : 0;
         Color backColor = background;
         int isDefault = this.isDefault;
         Font font;
         int tw = 0, th = 0;
         int bw = 0, bh = 0;

         font = fontObject;
         surface.TextFont(font);
         if(text)
            surface.TextExtent(text, strlen(text),&tw, &th);

         if(bevelOver && checked)
            offset = 1;

         if(!isEnabled)
         {
            if(bitmaps[disabled]) buttonBitmap = bitmaps[disabled].bitmap;
            state = disabled;
         }

         if(buttonBitmap && buttonStyle.bevelOver && !buttonStyle.checkBox && !buttonStyle.radio && text)
            isDefault = 0;

         // Background
         if((bevel /*|| bevelOver*/) && opacity && backColor)
         {
            if(!scaleBitmap || !buttonBitmap)
            {
               ColorKey keys[2] = { { silver, 0.0f }, { white, 1.0f } };
               surface.Gradient(keys, sizeof(keys) / sizeof(ColorKey), 1, vertical, 0, 0, clientSize.w-1, clientSize.h-1);
            }
         }

         // Checkbox
         if(isCheckbox && !buttonBitmap)
         {
            int height = 16;
            int start = (clientSize.h - height) / 2;

            if(!isEnabled)
               // surface.SetBackground(formColor);
               surface.SetBackground(gainsboro);
            else if(active && !text)
               surface.SetBackground((offset ? formColor : Color { 0,0,170 }));
            else
               surface.SetBackground((offset ? formColor : white));
            surface.Area(2, start+2,height-3,start+height-3);

            surface.SetForeground(Color { 85, 85, 85 });
            surface.HLine(0, height - 2, start + 0);
            surface.VLine(start+1, start+height - 2, 0);

            surface.SetForeground(Color { 64,64,64 });
            surface.HLine(1, height - 3, start + 1);
            surface.VLine(start+2, start+height - 3, 1);

            surface.SetForeground(Color { 212,208,200 });
            surface.HLine(1, height - 2, start + height-2);
            surface.VLine(start+1, start+height - 3, height-2);

            surface.SetForeground(white);
            surface.HLine(0, height - 1, start + height-1);
            surface.VLine(start+0, start+height - 2, height-1);

            if(checked)
            {
               if(active && !text)
                  surface.SetForeground(white);
               else if(!isEnabled)
                  surface.SetForeground(Color { 85, 85, 85 });
               else
                  surface.SetForeground(black);
               surface.DrawLine(4, start+8, 7,start+11);
               surface.DrawLine(4, start+9, 7,start+12);
               surface.DrawLine(7, start+11, 11,start+3);
               surface.DrawLine(7, start+12, 11,start+4);
            }
         }

         // Bitmaps
         if(buttonBitmap)
         {
            surface.SetForeground(white);
            if(isRadio || isCheckbox)
            {
               int x = 0, y = (clientSize.h-buttonBitmap.height)/2;
               if(bevelOver && text)
               {
                  x = (CAPTION_DISTANCE-buttonBitmap.width)/2 + offset;
                  y = (clientSize.h-buttonBitmap.height)/2 + offset;


               }

               // Radio Buttons and Checkboxes
               surface.Blit(buttonBitmap,
                  x, y,
                  0,0,buttonBitmap.width,buttonBitmap.height);
            }
            else
            {
               // Push Buttons
               if(scaleBitmap)
               {
                  if(bevel || offset)
                     surface.Stretch(buttonBitmap,
                        1 + offset, 1 + offset,0,0,
                        clientSize.w-3,clientSize.h-3,buttonBitmap.width,buttonBitmap.height);
                  else
                     surface.Stretch(buttonBitmap, 0,0, 0,0,
                        clientSize.w,clientSize.h,buttonBitmap.width,buttonBitmap.height);
               }
               else
               {
                  int x, y;
                  bw = buttonBitmap.width;
                  bh = buttonBitmap.height;

                  if(bitmapAlignment == left || bitmapAlignment == right)
                  {
                     if(bitmapAlignment == left)
                        x = 2;
                     else
                        x = clientSize.w-bw-2;
                     y = (clientSize.h-bh)/2;
                  }
                  else if(bitmapAlignment == top || bitmapAlignment == bottom)
                  {
                     x = (clientSize.w-bw)/2;
                     if(bitmapAlignment == top)
                        y = 2;
                     else
                        y = clientSize.h-bh-2;
                  }
                  else
                  {
                     x = (clientSize.w-bw)/2;
                     y = (clientSize.h-bh - (int)(buttonStyle.bevelOver && text) * th)/2;
                  }
                  if(buttonStyle.bevel || buttonStyle.offset)
                  {
                     x += offset;
                     y += offset;
                  }
                  surface.Blit(buttonBitmap, x,y, 0,0, bw,bh);
               }
            }
         }

         // Shadows
         if(bevel || (bevelOver && (state == down || state == over || checked)))
         {
            if(state == down || checked)
            {
               surface.SetForeground(Color { 85, 85, 85 });
               surface.HLine(isDefault + 0, clientSize.w-2-isDefault, 0);
               surface.VLine(isDefault + 1, clientSize.h-2-isDefault, 0);
               surface.SetForeground(white);
               surface.HLine(isDefault + 0, clientSize.w-1-isDefault, clientSize.h-1-isDefault);
               surface.VLine(isDefault + 0, clientSize.h-2-isDefault, clientSize.w-1-isDefault);
            }
            else
            {
               surface.SetForeground(white);
               surface.HLine(0 + isDefault, clientSize.w-2 - isDefault,  isDefault);
               surface.VLine(1 + isDefault, clientSize.h-2 - isDefault,  isDefault);
               surface.SetForeground(Color { 85, 85, 85 });
               surface.HLine(1 + isDefault, clientSize.w-2 - isDefault, clientSize.h-2 - isDefault);
               surface.VLine(1 + isDefault, clientSize.h-3 - isDefault, clientSize.w-2 - isDefault);

               if(bevel)
               {
                  surface.SetForeground(black);
                  surface.HLine( isDefault, clientSize.w-1 - isDefault, clientSize.h-1 - isDefault);
                  surface.VLine( isDefault, clientSize.h-2 - isDefault, clientSize.w-1 - isDefault);
               }
            }
         }

         // Text
         surface.TextOpacity(false);
         surface.SetForeground(foreground);
         if(text)
         {
            int tw, th;
            surface.TextExtent(text, strlen(text),&tw, &th);

            if((isRadio || isCheckbox) && !bevelOver)
               WriteCaption(surface, CAPTION_DISTANCE + 3, // + clientSize.h,
                  (clientSize.h - th - 4)/2);
            else
            {
               int x, y = (clientSize.h - th - 1)/2 + offset;

               if(buttonStyle.bevelOver && buttonBitmap && !buttonStyle.checkBox && !buttonStyle.radio)
               {
                  if(bitmapAlignment == top)
                     y = (clientSize.h - bh - 4 - th - 5)/2 + offset + bh + 4;
                  else if(bitmapAlignment == bottom)
                     y = (clientSize.h - bh - 4 - th - 5)/2 + offset;
                  else//if(bitmapAlignment == left || bitmapAlignment == right)
                     y = clientSize.h - th - 5 + offset;
               }
               else
                  y = (clientSize.h - th - 1)/2 + offset;

               if(ellipsis)
               {
                  int width = clientSize.w - 2*6;
                  int x = 6 + offset;

                  surface.WriteTextDots(alignment, x, y, width, text, strlen(text));
               }
               else
               {
                  int width = clientSize.w - 2 * 6;
                  x = 6 + offset;
                  if(bitmapAlignment == left || bitmapAlignment == right)
                  {
                     if(bitmapAlignment == left)
                        x += bw + 4;
                     width -= bw + 4;
                  }
                  if(isCheckbox || ((isRadio /*|| bevelOver*/) && buttonBitmap))
                  {
                     x += CAPTION_DISTANCE + 3;
                  }

                  if(tw < width)
                  {
                     if(alignment == right)
                        x += width - tw - 1;
                     else if(alignment == center)
                        x += (width - tw) / 2;
                  }
                  WriteCaption(surface, x, y);
               }
            }
         }

         // Activation Highlight
         if(isDefault)
         {
            surface.SetForeground(black);
            surface.Rectangle(0,0,clientSize.w-1,clientSize.h-1);
         }
         if(!bevelOver && !isRemote)
         {
            if(active) // && (text || !(buttonStyle.radio || buttonStyle.checkBox)))
            {
               int x1,y1,x2,y2;
               surface.SetForeground(black);
               surface.LineStipple(0x5555);

               if((isRadio || isCheckbox) && text)
               {
                  x1 = CAPTION_DISTANCE;  // + clientSize.h;
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
}
