namespace gui::skins;

/****************************************************************************
   ECERE Runtime Library

   Copyright (c) 2001-2007 Jerome Jacovella-St-Louis
   All Rights Reserved.
   
   tvision.ec - TurboVision'ish skin implementation
****************************************************************************/
import "Skin"

#define BORDER       8
#define TOP          16
#define BOTTOM       16
#define CORNER       8
#define CAPTION      0
#define DEAD_BORDER  0
#define MIN_WIDTH    24
#define MIN_HEIGHT   16

#define SB_WIDTH  8
#define SB_HEIGHT 16

#define MENU_HEIGHT 16
#define STATUS_HEIGHT 16

class TVisionSkin : Skin
{
   class_property(name) = "TVision";
   class_property(textMode) = bool::true;
   class_property(selectionColor) = Color { 10, 36, 106 };

   FontResource ::SystemFont()
   {
      //return null;
      return { faceName = $"Tahoma", size = 8.25f, bold = true };
   }

   FontResource ::CaptionFont()
   {
      //return null;
      return { faceName = $"Tahoma", size = 8.25f, bold = true };
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
      return SB_WIDTH;
   }

   int ::HorizontalSBH()
   {
      return SB_HEIGHT;
   }
}

public class TVisionSkin_Window : Window
{
   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;
      if(style.sizable && state == normal)
      {
         *w += 2*BORDER;
         *h += TOP+BOTTOM;
      }
      if(style.fixed && (state != maximized || !parent.hasMenuBar))
      {
         *h += CAPTION;
         if((!style.sizable && state == normal) && !CAPTION)
            *h += TOP;
      }
      if(style.contour)
      {
         *w += 2*DEAD_BORDER;
         *h += 2*DEAD_BORDER;
      }
      if(style.hasMenuBar && state != minimized)
      {
         *h += MENU_HEIGHT;
      }
      if(statusBar && state != minimized)
      {
         if(!style.sizable || state == maximized)
            *h += STATUS_HEIGHT;
      }
   }

   void SetWindowMinimum(MinMaxValue * mw, MinMaxValue * mh)
   {
      if(style.fixed && (state != maximized || !parent.hasMenuBar))
      {
         *mw = MIN_WIDTH;
         *mh = MIN_HEIGHT;
      }
      else
         *mw = *mh = 0;
      if(style.sizable && state == normal)
         *mw += 2*CORNER;
      // GetDecorationsSize(window, mw, mh);

      if(style.hasVertScroll)
         *mw += SB_WIDTH;
      if(style.hasHorzScroll)
         *mh += SB_HEIGHT;
      if(style.hasVertScroll && style.hasHorzScroll)
      {
         *mw += 2*SB_WIDTH+SB_WIDTH;
         *mh += 2*SB_HEIGHT+SB_HEIGHT;
         if(style.sizable && state == normal)
            *mw -= 2*CORNER;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      MinMaxValue aw = 0, ah = 0;

      *x = *y = 0;

      GetDecorationsSize(&aw, &ah);

      // Compute client area start
      if(style.sizable && state == normal)
      {
         *x += BORDER;
         *y += TOP;
      }

      if(style.fixed && (state != maximized || !parent.hasMenuBar))
      {
         *y += CAPTION;
         if(!style.sizable && state == normal)
            if(!CAPTION)
               *y += TOP;
      }

      if(style.contour)
      {
         *x += DEAD_BORDER;
         *y += DEAD_BORDER;
      }

      if(style.hasMenuBar)
      {
         *y += MENU_HEIGHT;
      }

      // Reduce client area
      *cw = *w - aw;
      *ch = *h - ah;

      *cw = Max(*cw, 0);
      *ch = Max(*ch, 0);
   }

   void ShowDecorations(void * displayData, Surface surface, char * name, bool active, bool moving)
   {
      Size size = this.size;
      int w = size.w, h = size.h;
      Size clientSize = this.clientSize;
      int cw = clientSize.w, ch = clientSize.h;
      Point clientStart = this.clientStart;
      int sx = clientStart.x, sy = clientStart.y;

      surface.TextOpacity(true);
      if(style.sizable && state == normal)
      {
         surface.SetBackground(blue);
         if(active && !moving)
         {
            surface.SetForeground(white);
            surface.DrawingChar(205);
            surface.HLine(8,w-2*8,h-16);
            surface.DrawingChar(186);
            surface.VLine(16,h-2*16,0);
            surface.VLine(16,h-2*16,w-8);
            surface.DrawingChar(201);
            surface.PutPixel(0,0);
            surface.DrawingChar(187);
            surface.PutPixel(w-8,0);
            surface.DrawingChar(188);
            surface.PutPixel(w-8,h-16);
            surface.DrawingChar(200);
            surface.PutPixel(0,h-16);
         }
         else
         {
            surface.SetForeground(moving ? lightGreen : gray);
            surface.DrawingChar(196);
            surface.HLine(8,w-2*8,h-16);
            surface.DrawingChar(179);
            surface.VLine(16,h-2*16,0);
            surface.VLine(16,h-2*16,w-8);
            surface.DrawingChar(218);
            surface.PutPixel(0,0);
            surface.DrawingChar(191);
            surface.PutPixel(w-8,0);
            surface.DrawingChar(217);
            surface.PutPixel(w-8,h-16);
            surface.DrawingChar(192);
            surface.PutPixel(0,h-16);
         }
      }

      if(style.fixed && (state != maximized || !parent.hasMenuBar))
      {
         Box clip {0,0, w - textCellW*6 - 1, textCellH };
         bool tooLong = false;

         surface.SetForeground(white);
         if(style.sizable && state == normal)
         {
            surface.SetBackground(blue);
            if(active && !moving)
               surface.DrawingChar(205);
            else
            {
               surface.SetForeground(moving ? lightGreen : gray);
               surface.DrawingChar(196);
            }
            surface.HLine(8,w-2*8,0);
         }
         else
         {
            surface.SetBackground(active ? magenta : blue);
            surface.DrawingChar(' ');
            surface.HLine(0,w-8,0);
         }
         surface.TextOpacity(false);
         surface.SetForeground(moving ? lightGreen : white);

         if(strlen(name) * textCellW >= w - 8 * textCellW)
         {
            surface.Clip(&clip);
            tooLong = true;
         }
         surface.WriteTextf(8, 0, " %s ", name);
         if(tooLong)
         {
            surface.Clip(null);
            surface.WriteTextf(Max(w - textCellW * 10, 2*textCellW),0, "... ");
         }
      }

      if(state != minimized && style.hasHorzScroll && style.hasVertScroll)
      {
         if(sbh && !sbh.style.hidden && sbv && !sbv.style.hidden)
         {
            if(!style.fixed)
            {
               surface.SetBackground(blue);
               surface.Area(
                  sx + cw,
                  sy + ch,
                  sx + cw + SB_WIDTH - 1,
                  sy + ch + SB_HEIGHT - 1);
            }
            else
            {
               if(style.sizable && state != maximized)
               {
                  surface.SetBackground(blue);
                  surface.SetForeground(lightGreen);
                  surface.DrawingChar(217);
               }
               else
               {
                  surface.SetBackground(cyan);
                  surface.DrawingChar(' ');
               }
               surface.PutPixel(sx + cw, sy + ch);
            }
         }
      }
   }

   bool IsMouseMoving(int x, int y, int w, int h)
   {
      bool result = false;

      if(style.fixed && (state != maximized || !parent.hasMenuBar))
      {
         int corner = (style.sizable && state == normal) ? CORNER : 0;
         int border = (style.sizable && state == normal) ? BORDER : 0;
         int top    = (style.sizable && state == normal) ? TOP    : 0;
         
         // Special case for having caption on resize bar
         if(!CAPTION)
            result = Box { corner, 0, w-corner-1, TOP-1 }.IsPointInside({x, y});
         else
            result = Box { border, top, w-border-1, top+CAPTION-1 }.IsPointInside({x,y});
      }
      return result;
   }

   bool IsMouseResizing(int x, int y, int w, int h, bool *resizeX, bool *resizeY, bool *resizeEndX, bool *resizeEndY)
   {
      bool result = false;

      *resizeX = *resizeY = *resizeEndX = *resizeEndY = false;

      if(style.sizable && state == normal)
      {
         // TopLeft Corner
         if(Box { 0, 0,CORNER-1, TOP-1 }.IsPointInside({x,y}))
            result = *resizeX = *resizeY = true;
         // TopRight Corner
         if(Box { w-CORNER, 0, w-1, TOP-1 }.IsPointInside({x,y}));
            result = *resizeEndX = *resizeY = true;
         // BottomLeft Corner
         if(Box { 0, h-BOTTOM, CORNER-1, h-1 }.IsPointInside({x,y}))
            result = *resizeX = *resizeEndY = true;
         // BottomRight Corner
         if(Box { w-CORNER-1, h-BOTTOM, w-1, h-1 }.IsPointInside({x,y}))
            result = *resizeEndX = *resizeEndY = true;
         // Left Border
         if(Box { 0,TOP, BORDER-1, h-BOTTOM-1 }.IsPointInside({x,y}))
            result = *resizeX = true;
         // Right Border
         if(Box { w-BORDER, TOP, w-1, h-BOTTOM-1 }.IsPointInside({x,y}))
            result = *resizeEndX = true;
         // Top Border
         if(Box { CORNER, 0, w-CORNER-1, TOP-1 }.IsPointInside({x,y}))
            result = *resizeY = true;
         // Bottom Border
         if(Box { CORNER, h-BOTTOM, w-CORNER-1, h-1 }.IsPointInside({x,y}))
            result = *resizeEndY = true;
      }
      return result;
   }

   void UpdateNonClient()
   {
      Size size = this.size;
      int w = size.w, h = size.h;
      Point clientStart = this.clientStart;
      int sx = clientStart.x, sy = clientStart.y;
      if(menuBar)
      {
         if(state == normal && style.sizable)
            menuBar.Move(sx,sy - 16,w-16,16);
         else
            menuBar.Move(sx,sy - 16,w,16);
      }
      if(statusBar)
      {
         if(state == minimized)
            statusBar.visible = false;
         else
         {
            statusBar.visible = true;
            anchor.bottom.type = offset;
            anchor.right.type = offset;
            if(style.sizable && state == normal)
            {
               statusBar.anchor = { left = 8, right = 8, bottom = 0 };
               anchor.left.distance = 8;
               anchor.right.distance = 8;
               statusBar.background = 0;
            }
            else
            {
               statusBar.anchor = { left = 0, right = 0, bottom = 0 };
               statusBar.background = menu;
            }
         }
      }
      if(sysButtons[0])
      {
         sysButtons[0].anchor = { top = 0, right = 32 };
         sysButtons[0].size = { 8, 16 };
         sysButtons[0].SetColor(up, white);
         sysButtons[0].SetColor(over, lightGreen);
         sysButtons[0].background = 0;
         sysButtons[0].visible = true;
      }
      if(sysButtons[1])
      {
         sysButtons[1].anchor = { top = 0, right = 24 };
         sysButtons[1].size = { 8, 16 };
         sysButtons[1].SetColor(up, white);
         sysButtons[1].SetColor(over, lightGreen);
         sysButtons[1].background = 0;
         sysButtons[1].visible = true;
      }
      if(sysButtons[2])
      {
         sysButtons[2].anchor = { top = 0, right = 8 };
         sysButtons[2].size = { 8, 16 };
         sysButtons[2].SetColor(up, white);
         sysButtons[2].SetColor(over, lightGreen);
         sysButtons[2].background = 0;
         sysButtons[2].visible = true;
      }
   }
};
