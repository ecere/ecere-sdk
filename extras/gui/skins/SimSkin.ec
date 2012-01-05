public import "ecere"

//define test = Color { 5, 4, 2 };
define skinMainColor = Color { 0, 71, 128 };
define skinOppositeColor = blue; //Color { 252, 114, 22 };
//define skinBackground = Color { 40, 40, 40 };
//define skinBackground = Color { 185, 201, 215 };
//define skinBackground = Color { 229, 236, 241 };
define skinBackground = Color { 255, 255, 255 };

#define BORDER       2
#define TOP          2
#define BOTTOM       2
#define CORNER       (BORDER * 2)
#define CAPTION      14
#define DEAD_BORDER  2
#define MIN_WIDTH    60
#define MIN_HEIGHT   3
#define BUTTON_OFFSET   0
#define NAME_OFFSET   2
#define NAME_OFFSETX  4

#define SB_WIDTH  16
#define SB_HEIGHT 16

#define MENU_HEIGHT     25
#define STATUS_HEIGHT   18

define skinForeground = skinMainColor;
define skinTextForeground = black;
define evenRowBackground = red; //Color { 80, 70, 60 };

define skinTextColor = skinMainColor;
define skinInactiveTextColor = Color { skinMainColor.r - 20, skinMainColor.g - 20, skinMainColor.b - 20 };

ColorKey skinGradient[3] =
{
   { Color { 40,40,40 }, 0.0f },
   { darkGray, 0.5f },
   { Color { 40,40,40 }, 1.0f },
};

class SimSkin_Window : Window
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
         surface.SetForeground(active ? skinTextColor : skinInactiveTextColor);
         surface.Rectangle(1,1, size.w-2, size.h-2);
         surface.SetBackground(skinBackground);
         surface.Area(2, 2, size.w-3, CAPTION + 1);

         // surface.TextFont(captionFont);
         // surface.WriteText(4,2, name, strlen(name));

         surface.SetForeground((active ? skinTextColor : skinInactiveTextColor));
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
         minimizeButton.anchor = { right = ((maximizeButton && !maximizeButton.disabled) ? 25 + 34 + 4 : 34 + 4) + border, top = top + BUTTON_OFFSET };
         minimizeButton.size = { 20, 10 };
         minimizeButton.foreground = skinForeground;
         minimizeButton.background = skinBackground;
         minimizeButton.bevel = false;
         minimizeButton.OnRedraw = Minimize_OnRedraw;
         minimizeButton.visible = true;
      }
      if(maximizeButton && !maximizeButton.disabled)
      {
         maximizeButton.anchor = { right = 34 + 4 + border, top = top + BUTTON_OFFSET };
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
         closeButton.size = { 34, 10 };
         closeButton.bevel = false;
         closeButton.foreground = skinForeground;
         closeButton.background = skinBackground;
         closeButton.OnRedraw = Close_OnRedraw;
         closeButton.visible = true;
      }
   }

   void OnApplyGraphics()
   {
      /*if(background)
         background = skinBackground;
      foreground = skinForeground;*/
      // Find something better?
   }
}

static void Button::SmallButton_OnRedraw(Surface surface)
{
   surface.SetBackground(parent.active ? background : skinBackground);
   surface.Area(0, 0, clientSize.w - 2, clientSize.w - 1);
   surface.SetForeground(parent.active ? skinTextColor : skinInactiveTextColor);
   surface.VLine(0, clientSize.h - 2, 0);
   surface.VLine(0, clientSize.h - 2, clientSize.w - 1);
   surface.HLine(1, clientSize.w - 2, clientSize.h - 1);
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
   //surface.SetForeground(black);
   surface.DrawLine( 7+7, 2, 12+7, 7);
   surface.DrawLine( 8+7, 2, 13+7, 7);
   surface.DrawLine( 12+7, 2, 7+7, 7);
   surface.DrawLine( 13+7, 2, 8+7, 7);
}

/*class SimSkin_StatusBar : StatusBar
{
   void OnApplyGraphics()
   {
      background = skinBackground;
      foreground = skinForeground;
   }
}*/

/*class SimSkin_FileDialog : FileDialog
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
}*/

#define PUREVTBL(c)     ((int (**)())*(void **)((byte *)class(c).data + 4))

extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics;
extern int __ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw;

static void Dummy()
{
   Window a;
   a.OnApplyGraphics();
   a.OnRedraw(null);
}

class SimSkin_Button : Button
{/*
   void OnApplyGraphics()
   {
      //background = skinBackground;
      background = Color { (int)70 * 6/10, (int)130* 6/10, (int)180* 6/10 };
      foreground = skinForeground;
   }

   void OnRedraw(Surface surface)
   {
      int isDefault = (int)this.isDefault;
      PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw](this, surface);
      if(bevel || (bevelOver && (buttonState == down || buttonState == over || checked)))
      {
         Color c = steelBlue;
         if(buttonState == down || checked)
         {
            surface.SetForeground(skinMainColor);
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
            
            
            surface.SetForeground(skinMainColor);
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
               //x1 = clientSize.h + CAPTION_DISTANCE;
               x1 = CAPTION_DISTANCE;
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
   */
   #define CAPTION_DISTANCE   18

   void OnRedraw(Surface surface)
   {
      if(isRadio)
      {
         PUREVTBL(Button)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnRedraw](this, surface);
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

         font = fontObject;

         if(bevelOver && checked)
            offset = 1;

         if(!isEnabled)
            state = disabled;

         // Background
         if((bevel || bevelOver) /* && opacity && backColor*/)
         {
            if(!scaleBitmap || !buttonBitmap)
            {
               /*
               surface.SetBackground({(byte)(opacity * 255), backColor});
               //surface.Area(1, 1,clientSize.w-3+offset,clientSize.h-3+offset);
               surface.Area(0, 0,clientSize.w-1,clientSize.h-1);
               */
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
               // surface.SetBackground(activeBorder);
               surface.SetBackground(gainsboro);
            else if(active && !text)
               surface.SetBackground((offset ? activeBorder : Color { 0,0,170 }));
            else
               surface.SetBackground((offset ? activeBorder : white));
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
                  if(bevel || offset)
                     surface.Blit(buttonBitmap,
                        (clientSize.w-buttonBitmap.width) /2 + offset,
                        (clientSize.h-buttonBitmap.height)/2 + offset,
                        0,0,buttonBitmap.width,buttonBitmap.height);
                  else
                     surface.Blit(buttonBitmap,
                        (clientSize.w-buttonBitmap.width)/2,
                        (clientSize.h-buttonBitmap.height)/2,
                        0,0,buttonBitmap.width,buttonBitmap.height);
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
         surface.TextFont(font);
         surface.SetForeground(foreground);
         if(text)
         {
            int tw, th;
            surface.TextExtent(text, strlen(text),&tw, &th);

            if((isRadio || isCheckbox) && !bevelOver)
               WriteCaption(surface, /*clientSize.h +*/ CAPTION_DISTANCE + 3, 
                  (clientSize.h - th - 4)/2);
            else 
            {
               int x, y = (clientSize.h - th - 1)/2 + offset;
               
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
                  if(isCheckbox || ((isRadio || bevelOver) && buttonBitmap))
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
            if(active/* && (text || !(buttonStyle.radio || buttonStyle.checkBox))*/)
            {
               int x1,y1,x2,y2;
               surface.SetForeground(black);
               surface.LineStipple(0x5555);

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
      /*else
      {
         Button::OnRedraw(surface);
      }*/
   }
}

class SimSkin_ScrollBar : ScrollBar
{
   void OnApplyGraphics()
   {
      PUREVTBL(ScrollBar)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics](this);

      //background = { skinBackground.r * 9 / 6, skinBackground.g * 9 / 6, skinBackground.b * 9 / 6 };
/*
      upBtn.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;
      upBtn.bitmap = { (direction == vertical) ? "<:ecere>elements/arrowUp.png" : "<:ecere>elements/arrowLeft.png", monochrome = true };
      downBtn.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;
      downBtn.bitmap = { (direction == vertical) ? "<:ecere>elements/arrowDown.png" : "<:ecere>elements/arrowRight.png", monochrome = true };
      thumb.background = Color {  70 * 6/10, 130* 6/10, 180* 6/10 }; //skinBackground;*/
   }   
}

/*class SimSkin_DropBox : DropBox
{
   void OnApplyGraphics()
   {
      PUREVTBL(DropBox)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics](this);
      button.bitmap = { "<:ecere>elements/arrowDown.png", monochrome = true };
      background = skinBackground;
      foreground = skinForeground;
      selectionColor = skinMainColor;
   }   
}*/

/*class SimSkin_ListBox : ListBox
{
   void OnApplyGraphics()
   {
      PUREVTBL(ListBox)[__ecereVMethodID___ecereNameSpace__ecere__gui__Window_OnApplyGraphics](this);
      background = skinBackground;
      foreground = skinForeground;
      selectionColor = skinMainColor;
   }   
}*/

public class SimSkin : Skin
{
   class_property(name) = "Sim";
   class_property(selectionColor) = (Color)skinMainColor;
   class_property(disabledBackColor) = (Color)Color{ 128,128,128 };
   class_property(disabledFrontColor) = (Color)Color{ 255,255,255 };
   class_property(selectionText)  = (Color)white;

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
