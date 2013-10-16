public import "ecere"

#define BORDER       5 //4
#define TOP          3
#define BOTTOM       (4 + 2)
#define CORNER       (BORDER * 2 + 6)
#define CAPTION      22 // 20
#define DEAD_BORDER  0 //3
#define MIN_WIDTH    68
#define MIN_HEIGHT   8
#define BUTTON_OFFSET   4
#define NAME_OFFSET   2
#define NAME_OFFSETX  10

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
#define TEXT_INACTIVE      darkGray // Color { 212,208,200 }

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



BitmapResource bmpUpMiddle { ":upMiddle.png", alphaBlend = true };
BitmapResource bmpUpLeft { ":upLeft.png", alphaBlend = true };
BitmapResource bmpUpRight { ":upRight.png", alphaBlend = true };

BitmapResource bmpDownMiddle { ":downMiddle.png", alphaBlend = true };
BitmapResource bmpDownLeft { ":downLeft.png", alphaBlend = true };
BitmapResource bmpDownRight { ":downRight.png", alphaBlend = true };

BitmapResource bmpScrollUp { ":scrollUp.png", alphaBlend = true };
BitmapResource bmpScrollDown { ":scrollDown.png", alphaBlend = true };
BitmapResource bmpScrollVert { ":scrollVert.png", alphaBlend = true };

BitmapResource bmpThumbUp { ":thumbUp.png", alphaBlend = true };
BitmapResource bmpThumbDown { ":thumbDown.png", alphaBlend = true };
BitmapResource bmpThumbVert { ":thumbVert.png", alphaBlend = true };

BitmapResource bmpLeftBorder { ":leftBorder.png", alphaBlend = true };
BitmapResource bmpRightBorder { ":rightBorder.png", alphaBlend = true };
BitmapResource bmpTopBorder { ":topBorder.png", alphaBlend = true };
BitmapResource bmpBottomBorder { ":bottomBorder.png", alphaBlend = true };

BitmapResource bmpTopLeftBorder { ":topLeftBorder.png", alphaBlend = true };
BitmapResource bmpTopRightBorder { ":topRightBorder.png", alphaBlend = true };
BitmapResource bmpBottomLeftBorder { ":bottomLeftBorder.png", alphaBlend = true };
BitmapResource bmpBottomRightBorder { ":bottomRightBorder.png", alphaBlend = true };

#define PUREVTBL(c)     ((int (**)())*(void **)((byte *)class(c).data + sizeof(void *)))

default:

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnResizing;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnPostCreate;
private:

static void Dummy()
{
   Window w;
   w.OnPostCreate();
   w.OnRedraw(null);
   w.OnResizing(null, null);
}

static void Button::ThumbOnRedraw(Surface surface)
{
   int offset = (buttonState == down) ? this.offset : 0;
   BitmapResource left = bmpThumbUp;
   BitmapResource right = bmpThumbDown;
   BitmapResource middle = bmpThumbVert;
   int sizeW = size.w;
   int x = 1; //-40 * sizeH / 96;
   int y = -6; //-7 * sizeH / 96;
   int w = 14;// * sizeW / 14;
   int sideH = 10; // * sizeW / 14;
   int middleH = size.h - 2 * (sideH + y);

   surface.Stretch(left.bitmap, x, y, 0,0, w, sideH, left.bitmap.width, left.bitmap.height);
   surface.HTile(middle.bitmap, x, y + sideH, w, middleH);
   surface.Stretch(right.bitmap, x, y + sideH + middleH, 0,0, w, sideH, right.bitmap.width, right.bitmap.height);

   /*
   surface.Filter(left.bitmap, x, y, 0,0, w, sideH, left.bitmap.width, left.bitmap.height);
   surface.FilterVTile(middle.bitmap, x, y + sideH, w, middleH);
   surface.Filter(right.bitmap, x, y + sideH + middleH, 0,0, w, sideH, right.bitmap.width, right.bitmap.height);
   */
}

static bool Button::ThumbIsInside(int x, int y)
{
   return (x >= 0 && y >= 0 && x < size.w && y < size.h);
}

static void Button::ThumbSetBox(Box box)
{
   box.top -= 6;
   box.left += 1;
   box.right -= 1;
   box.bottom += 6;
}

public class MySkin_ScrollBar : ScrollBar
{
   void OnApplyGraphics()
   {
      if(direction == vertical)
      {
         downBtn.size.h = 24;
         downBtn.offset = false;
         downBtn.anchor = Anchor { left = 0, bottom = 0, right = 0 };

         upBtn.size.h = 24;
         upBtn.offset = false;
         upBtn.anchor = Anchor { left = 0, right = 0, top = 0 };

         thumb.Move(0,0, Max(clientSize.w, 16), thumbSize);
      }
      else
      {
      }
   }

   bool OnPostCreate()
   {
      bool result = ((bool (*)(Window))(void *)PUREVTBL(ScrollBar)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnPostCreate])(this);

      AddResource(bmpScrollUp);
      AddResource(bmpScrollDown);
      AddResource(bmpScrollVert);
      AddResource(bmpThumbUp);
      AddResource(bmpThumbDown);
      AddResource(bmpThumbVert);

      if(direction == vertical)
      {
         downBtn.bevel = false;
         downBtn.size.h = 18;
         downBtn.anchor = Anchor { left = 0, right = 0, bottom = 0 };
         downBtn.bitmap = { fileName = "scrollDown.png", alphaBlend = true };

         upBtn.bevel = false;
         upBtn.size.h = 18;
         upBtn.anchor = Anchor { left = 0, right = 0, bottom = 0 };
         upBtn.bitmap = { fileName = "scrollUp.png", alphaBlend = true };

         thumb.OnRedraw = ThumbOnRedraw;
         thumb.IsInside = ThumbIsInside;
         thumb.SetBox = ThumbSetBox;
      }
      else
      {

      }
      return true;
   }

   void OnRedraw(Surface surface)
   {
      surface.VTile(bmpScrollVert.bitmap, 0, 0, clientSize.w, clientSize.h);

   }
}

public class MySkin_Button : Button
{
   bool OnResizing(int *width, int *height)
   {
      bool result = ((bool (*)(Window, int*, int*))(void *)PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnResizing])(this, width, height);
      if(!bitmap)
      {
         int w;
         display.FontExtent(fontObject, " ", 1, &w, null);
         *width += 2*w;
      }
      return result;
   }

   void SetBox(Box box)
   {
      if(!bitmap)
      {
         int sizeH = size.h;
         box.top -= 7 * sizeH / 96;
         box.left -= 40 * sizeH / 96;
         box.right += 40 * sizeH / 96;
         box.bottom += 75 * sizeH / 96;
      }
   }

   bool IsInside(int x, int y)
   {
      if(!bitmap)
      {
         int sizeW = size.w;
         int sizeH = size.h;
         if(x >= 0 && y >= 0 && x < sizeW && y < sizeH)
         {
            ColorAlpha * picture;
            int sideW = (107 - 40) * sizeH / 96;
            y = y * 96 / sizeH + 7;
            if(x < sideW)
            {
               x = 40 + x * 96 / sizeH;
               picture = ((ColorAlpha *)bmpUpLeft.bitmap.picture) + y * bmpUpLeft.bitmap.stride + x;
               return picture->a > 75;
            }
            else if(x > sizeW - sideW)
            {
               x = (x - (sizeW - sideW)) * 96 / sizeH;
               picture = ((ColorAlpha *)bmpUpRight.bitmap.picture) + y * bmpUpRight.bitmap.stride + x;
               return picture->a > 75;
            }
            else
               return true;
         }
      }
      else
         return (x >= 0 && y >= 0 && x < size.w && y < size.h);

      return false;
   }

   void OnApplyGraphics()
   {
      if(!bitmap)
      {
         // font = { "Arial", size = 9, bold = true };
         opacity = 0;
         drawBehind = true;
         AddResource(bmpUpLeft);
         AddResource(bmpUpMiddle);
         AddResource(bmpUpRight);
         AddResource(bmpDownLeft);
         AddResource(bmpDownMiddle);
         AddResource(bmpDownRight);
      }
   }

   void OnRedraw(Surface surface)
   {
      if(bitmap)
      {
         ((void (*)(Window, Surface))(void *)PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw])(this, surface);
      }
      else
      {
         int offset = (buttonState == down) ? this.offset : 0;
         BitmapResource left = (buttonState == down) ? bmpDownLeft : bmpUpLeft;
         BitmapResource right = (buttonState == down) ? bmpDownRight : bmpUpRight;
         BitmapResource middle = (buttonState == down) ? bmpDownMiddle : bmpUpMiddle;
         int sizeH = size.h;
         int x = -40 * sizeH / 96;
         int y = -7 * sizeH / 96;
         int textH;
         int h = 178 * sizeH / 96;
         int sideW = 107 * sizeH / 96;
         int middleW = size.w - 2 * (sideW + x);
         surface.TextExtent(" ", 1, null, &textH);
         /*
         surface.Stretch(left.bitmap, x, y, 0,0, sideW, h, left.bitmap.width, left.bitmap.height);
         surface.HTile(middle.bitmap, x + sideW, y, middleW, h);
         surface.Stretch(right.bitmap, x + sideW + middleW, y, 0,0, sideW, h, left.bitmap.width, left.bitmap.height);
         */
         surface.Filter(left.bitmap, x, y, 0,0, sideW, h, left.bitmap.width, left.bitmap.height);
         surface.FilterHTile(middle.bitmap, x + sideW, y, middleW, h);
         surface.Filter(right.bitmap, x + sideW + middleW, y, 0,0, sideW, h, left.bitmap.width, left.bitmap.height);


         surface.CenterTextf(clientSize.w/2 + offset, (clientSize.h - textH * 1.1) / 2 + offset, text);
      }
   }
}


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

public class MySkin : Skin
{
   class_property(name) = "My";
   class_property(selectionColor) = Color { 10, 36, 106 };

   FontResource ::SystemFont()
   {
      return FontResource { faceName = "Tahoma", size = 8.25f };
   }

   FontResource ::CaptionFont()
   {
      return FontResource { faceName = "Tahoma", size = 10.0f, bold = true };
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


public class MySkin_Window : Window
{
   bool OnPostCreate()
   {
      AddResource(bmpLeftBorder);
      AddResource(bmpRightBorder);
      AddResource(bmpTopBorder);
      AddResource(bmpBottomBorder);

      AddResource(bmpTopLeftBorder);
      AddResource(bmpTopRightBorder);
      AddResource(bmpBottomLeftBorder);
      AddResource(bmpBottomRightBorder);
      return true;
   }

   void GetDecorationsSize(MinMaxValue * w, MinMaxValue * h)
   {
      *w = *h = 0;
      if((((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel) && state != minimized)
      {
         *w += 4;
         *h += 4;
      }
      if(((BorderBits)borderStyle).fixed /*sizable*/ && (state == normal))
      {
         *w += 2 * BORDER + 2;
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

   void SetWindowMinimum(MinMaxValue * mw, MinMaxValue * mh)
   {
      bool isNormal = (state == normal);
      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         *mw = MIN_WIDTH;
         *mh = MIN_HEIGHT;
      }
      else
         *mw = *mh = 0;

      if(((BorderBits)borderStyle).fixed /*sizable*/ && isNormal)
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
         if(((BorderBits)borderStyle).fixed /*sizable*/ && isNormal)
            *mw -= 2*CORNER;
      }
   }

   void SetWindowArea(int * x, int * y, MinMaxValue * w, MinMaxValue * h, MinMaxValue * cw, MinMaxValue * ch)
   {
      bool isNormal = (state == normal);
      MinMaxValue aw = 0, ah = 0;

      *x = *y = 0;

      GetDecorationsSize(&aw, &ah);

      // Compute client area start
      if(((BorderBits)borderStyle).deep || ((BorderBits)borderStyle).bevel)
      {
         *x += 2;
         *y += 2;
      }

      if(((BorderBits)borderStyle).fixed /*sizable*/ && isNormal)
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

   void PreShowDecorations(Font captionFont, Surface surface, char * name, bool active, bool moving)
   {
      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         if(rootWindow == this)
         {
            surface.SetBackground({ 0 });

            // Top
            surface.Area(0,0,size.w, bmpTopBorder.bitmap.height);
            // Left
            surface.Area(0,0,8, size.h);
            // Right
            surface.Area(size.w-9, bmpTopBorder.bitmap.height, size.w-1, size.h);
            // Bottom
            surface.Area(0,size.h-9,size.w-1, size.h);
         }
      }
   }

   void ShowDecorations(Font captionFont, Surface surface, char * name, bool active, bool moving)
   {
      bool isNormal = (state == normal);
      int top = 0, border = 0, bottom = 0;
      if(state == minimized)
         top = border = bottom = DEAD_BORDER;
      else if(((BorderBits)borderStyle).fixed /*sizable*/)
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
            deepBottom = (((BorderBits)borderStyle).fixed /*sizable*/ && isNormal) ? bottom : border;
         }

         surface.Bevel(((BorderBits)borderStyle).bevel ? false : true, deepBorder, deepTop,
            size.w - deepBorder - deepBorder, size.h - deepBottom - deepTop);
      }

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         /*
         // Frame for ES_CAPTION windows
         surface.Bevel(false, 0, 0, size.w, size.h);
         surface.SetForeground(activeBorder);
         surface.Rectangle(2, 2, size.w-3, size.h-3);

         // Resizeable frame is 1 pixel thicker
         if(((BorderBits)borderStyle).sizable && isNormal)
            surface.Rectangle(3, 3, size.w - 4, size.h - 4);

         // Caption

         if(active)
            surface.Gradient(gradient, sizeof(gradient) / sizeof(ColorKey), GRADIENT_SMOOTHNESS, GRADIENT_DIRECTION,
               border, top, size.w - border - 1, top + CAPTION - 2);
         else
            surface.Gradient(gradientInactive, sizeof(gradientInactive) / sizeof(ColorKey),
            GRADIENT_SMOOTHNESS, GRADIENT_DIRECTION,
               border, top, size.w - border - 1, top + CAPTION - 2);
         */
         /*
         surface.Blit(bmpTopBorder.bitmap, 0, 0, 0, 0, bmpTopBorder.bitmap.width, bmpTopBorder.bitmap.height);
         surface.Blit(bmpLeftBorder.bitmap, 0, 27, 0, 0, bmpLeftBorder.bitmap.width, bmpLeftBorder.bitmap.height);
         surface.Blit(bmpRightBorder.bitmap, 646-9, 27, 0, 0, bmpRightBorder.bitmap.width, bmpRightBorder.bitmap.height);
         surface.Blit(bmpBottomBorder.bitmap, 0, 27 + 448, 0, 0, bmpBottomBorder.bitmap.width, bmpBottomBorder.bitmap.height);
         */
         surface.alphaWrite = blend;
         // surface.blend = rootWindow != this;

         surface.Blit(bmpTopLeftBorder.bitmap, 0, 0, 0, 0, bmpTopLeftBorder.bitmap.width, bmpTopLeftBorder.bitmap.height);
         surface.Stretch(bmpTopBorder.bitmap, bmpTopLeftBorder.bitmap.width, 0, 0, 0, size.w - 2 * bmpTopLeftBorder.bitmap.width, bmpTopBorder.bitmap.height,
            bmpTopBorder.bitmap.width, bmpTopBorder.bitmap.height);
         surface.Blit(bmpTopRightBorder.bitmap, size.w - bmpTopRightBorder.bitmap.width, 0, 0, 0, bmpTopRightBorder.bitmap.width, bmpTopRightBorder.bitmap.height);

         surface.Stretch(bmpLeftBorder.bitmap, 0, 27, 0, 0, bmpLeftBorder.bitmap.width, size.h - 27 - 9, bmpLeftBorder.bitmap.width, bmpLeftBorder.bitmap.height);
         surface.Stretch(bmpRightBorder.bitmap, size.w-9, 27, 0, 0, bmpRightBorder.bitmap.width, size.h - 27 - 9, bmpLeftBorder.bitmap.width, bmpLeftBorder.bitmap.height);

         surface.Blit(bmpBottomLeftBorder.bitmap, 0, size.h - 9, 0, 0, bmpBottomLeftBorder.bitmap.width, bmpBottomLeftBorder.bitmap.height);
         surface.Stretch(bmpBottomBorder.bitmap, bmpBottomLeftBorder.bitmap.width, size.h - 9, 0, 0, size.w - 2 * bmpBottomLeftBorder.bitmap.width, bmpBottomBorder.bitmap.height,
            bmpBottomBorder.bitmap.width, bmpBottomBorder.bitmap.height);
         surface.Blit(bmpBottomRightBorder.bitmap, size.w - bmpBottomRightBorder.bitmap.width, size.h - 9, 0, 0, bmpBottomRightBorder.bitmap.width, bmpBottomRightBorder.bitmap.height);
         //surface.alphaWrite = DontWrite;
         surface.blend = true;

         surface.SetForeground(activeBorder);
         /*
         if(state != minimized)
            surface.HLine(border, size.w-border-1, top + CAPTION-1);
         */

         surface.SetForeground((active ? TEXT_COLOR : TEXT_INACTIVE));
         surface.TextOpacity(false);
         surface.TextFont(captionFont);
         if(name)
         {
            int buttonsSize = border +
               ((hasMaximize || hasMinimize) ? 60 : 26);
            surface.WriteTextDots(left, border + NAME_OFFSETX, top + NAME_OFFSET,
               size.w - (buttonsSize + border + NAME_OFFSETX /*4*/), name, strlen(name));
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

      if(((BorderBits)borderStyle).fixed && (state != maximized || !parent.menuBar))
      {
         int corner = 0, border = 0, top = 0;
         if(((BorderBits)borderStyle).fixed /*sizable*/ && isNormal)
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
      int insideBorder;
      if(state == minimized)
         top = border = DEAD_BORDER;
      else if(((BorderBits)borderStyle).fixed /*sizable*/)
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
         minimizeButton.anchor = { right = 43 + border, top = top + BUTTON_OFFSET };
         minimizeButton.size = { 15, 15 };
         minimizeButton.bevel = true;
         minimizeButton.bitmap = { skinBitmaps[(state == minimized) ? restore : minimize] };
         minimizeButton.visible = true;
      }
      if(maximizeButton)
      {
         maximizeButton.anchor = { right = 28 + border, top = top + BUTTON_OFFSET };
         maximizeButton.size = { 15, 15 };
         maximizeButton.bevel = true;
         maximizeButton.bitmap = { skinBitmaps[(state == maximized) ? restore : maximize] };
         maximizeButton.visible = true;
      }
      if(closeButton)
      {
         closeButton.anchor = { right = 10 + border, top = top + BUTTON_OFFSET };
         closeButton.size = { 15, 15 };
         closeButton.bevel = true;
         closeButton.bitmap = { skinBitmaps[close] };
         closeButton.visible = true;
      }
   }

   bool IsOpaque()
   {
      return (!drawBehind && opacity == 1.0) && !((BorderBits)borderStyle).fixed;
   }
}
