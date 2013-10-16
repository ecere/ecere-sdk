namespace gui::controls;

import "Window"

class ButtonBits { bool bevel:1, scale:1, offset:1, stayDown:1, checkBox:1, toggle:1, radio:1, keyRepeat:1, bevelOver:1, ellipsis:1, stayUp:1; };

#define CAPTION_DISTANCE   18

public enum ButtonState /*: byte*/ { up, down, over, disabled, upChecked, downChecked, overChecked, disabledChecked };
//use and extend preexisting enum? -> public enum Alignment { left, right, center };
public enum BoxAlignment { center, left, right, top, bottom }; // topLeftCorner, topRightCorner, bottomLeftCorner, bottomRightCorner

public class Button : CommonControl
{
   /*
   private(opacity);
   private(drawBehind);
   */
   public property Percentage opacity
   {
      isset { return (buttonStyle.checkBox || buttonStyle.radio) ? (Window::opacity != 0) : Window::opacity != 1; }
      get { return Window::opacity; }
      set { Window::opacity = value; }
   }
   public property bool drawBehind
   {
      isset { return (buttonStyle.checkBox || buttonStyle.radio) ? (Window::drawBehind != drawBehind) : Window::drawBehind != false; }
      get { return Window::drawBehind; }
      set { Window::drawBehind = value; }
   }
   class_property(icon) = "<:ecere>controls/button.png";

   watch(background)
   {
      Color background = this.background;

      if(colors[down] == colors[up])      colors[down] = background;
      if(colors[over] == colors[up])      colors[over] = background;
      if(colors[disabled] == colors[up])  colors[disabled] = background;
      colors[0] = background;
   };

   watch(foreground)
   {
      Color foreground = this.foreground;

      if(textColor[down] == textColor[up])      textColor[down] = foreground;
      if(textColor[over] == textColor[up])      textColor[over] = foreground;
      if(textColor[disabled] == textColor[up])  textColor[disabled] = foreground;
      textColor[0] = foreground;
   };

   watch(font)
   {
      OnLoadGraphics();
      SetInitSize(initSize);
   };

   watch(caption)
   {
      OnLoadGraphics();
      SetInitSize(initSize);
   };

   ButtonBits buttonStyle;
   ButtonState state;
   BitmapResource bitmaps[ButtonState];
	int captionHeight, captionWidth;
   unichar symbol;
   Color textColor[ButtonState];
   Font font;
   Color colors[ButtonState];
   Alignment alignment;
   BoxAlignment bitmapAlignment;
   struct { bool hint:1, key:1, captured:1, over:1, checked:1; };

   Button()
   {
      background = formColor;
      foreground = black;
      //opacity = 0;
      //drawBehind = true;
      borderStyle = 0;
      bevel = true;
      buttonStyle.offset = true;

      // SetCursor(eInterface_GetCursor(__ecereModule->app, CUR_ARROW));

      alignment = center;
      state = up;
      hint = false;
      textColor[up] = textColor[down] =
      textColor[over] = black;
      textColor[disabled] = Color { 85, 85, 85 };

      colors[up] = formColor;
      colors[down] = formColor;
      colors[over] = formColor;
      colors[disabled] = white;
      colors[upChecked] = Color { 233,229,221 };
      colors[overChecked] = formColor;
      colors[downChecked] = Color { 233,229,221 };
      colors[disabledChecked] = formColor;
   }

   Bitmap GetButtonBitmap()
   {
      ButtonState state = this.state;
      Bitmap buttonBitmap = bitmaps[(int)checked*4 + state].bitmap;
      if(!buttonBitmap) buttonBitmap = bitmaps[(int)checked * 4+up].bitmap;
      if(!buttonBitmap) buttonBitmap = bitmaps[up].bitmap;
      if(!isEnabled && bitmaps[disabled]) buttonBitmap = bitmaps[disabled].bitmap;
      return buttonBitmap;
   }

   void OnRedraw(Surface surface)
   {
      ButtonState state = this.state;
      Bitmap buttonBitmap = GetButtonBitmap();
      char * text = this.text;
      int offset = (state == down && buttonStyle.offset) ? 1 : 0;
      Color backColor = colors[(int)checked*4 + state];
      int isDefault = this.isDefault;
      int tw = 0, th = 0;
      int bw = 0, bh = 0;

      if(!backColor) backColor = colors[up];

      font = fontObject;
      surface.TextFont(font);
      if(text)
         surface.TextExtent(text, strlen(text),&tw, &th);

      if(buttonStyle.bevelOver && checked)
         offset = 1;

      if(!isEnabled)
      {
         if(bitmaps[disabled]) buttonBitmap = bitmaps[disabled].bitmap;
         state = disabled;
      }

      if(buttonBitmap && buttonStyle.bevelOver && !buttonStyle.checkBox && !buttonStyle.radio && text)
         isDefault = 0;

      // Background
      if((buttonStyle.bevel || buttonStyle.bevelOver) /* && opacity && backColor*/)
      {
         if(!buttonStyle.scale || !buttonBitmap)
         {
            surface.SetBackground({(byte)(opacity * 255), backColor});
            //surface.Area(1, 1,clientSize.w-3+offset,clientSize.h-3+offset);
            surface.Area(0, 0,clientSize.w-1,clientSize.h-1);
         }
      }

      // Checkbox
      if(buttonStyle.checkBox && !buttonBitmap)
      {
         int height = 16;
         int start = (clientSize.h - height) / 2;

         if(!isEnabled)
            // surface.SetBackground(formColor);
            surface.SetBackground(gainsboro);
         else if(active && !text)
            surface.SetBackground((offset ? formColor : Color { 0,0,170 }));
         else
            surface.SetBackground((offset ? formColor : background /*white*/));
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
               surface.SetForeground(foreground /*black*/);
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
         if(buttonStyle.radio || buttonStyle.checkBox)
         {
            int x = 0, y = (clientSize.h-buttonBitmap.height)/2;
            if(buttonStyle.bevelOver && text)
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
            if(buttonStyle.scale)
            {
               if(buttonStyle.bevel || buttonStyle.offset)
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
      if(buttonStyle.bevel ||
         (buttonStyle.bevelOver &&
            (state == down || state == over || checked)))
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

            if(buttonStyle.bevel)
            {
               surface.SetForeground(black);
               surface.HLine( isDefault, clientSize.w-1 - isDefault, clientSize.h-1 - isDefault);
               surface.VLine( isDefault, clientSize.h-2 - isDefault, clientSize.w-1 - isDefault);
            }
         }
      }

      // Text
      surface.TextOpacity(false);
      surface.SetForeground((textColor[state] ? textColor[state] : textColor[up]));
      if(text)
      {
         if((buttonStyle.radio || buttonStyle.checkBox) && !(buttonStyle.bevelOver))
            WriteCaption(surface, /*clientSize.h +*/ CAPTION_DISTANCE + 3,
               (clientSize.h - th - 4)/2);
         else
         {
            int x, y;

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

            if(buttonStyle.ellipsis)
            {
               int width = clientSize.w - 2*6;
               int x = 6 + offset;

               surface.WriteTextDots(alignment, x, y, width, text, strlen(text));
            }
            else
            {
               int width;
               x = 6 + offset;
               width = clientSize.w - 2 * 6;
               if(bitmapAlignment == left || bitmapAlignment == right)
               {
                  if(bitmapAlignment == left)
                     x += bw + 4;
                  width -= bw + 4;
               }
               if(buttonStyle.checkBox || ((buttonStyle.radio /*|| buttonStyle.bevelOver*/) && buttonBitmap))
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
      if(!(buttonStyle.bevelOver) && !isRemote)
      {
         if(active/* && (text || !(buttonStyle.radio || buttonStyle.checkBox))*/)
         {
            int x1,y1,x2,y2;
            surface.SetForeground(black);
            surface.LineStipple(0x5555);

            if((buttonStyle.radio || buttonStyle.checkBox) && text)
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

               if(buttonStyle.radio || buttonStyle.checkBox)
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

   /*
   void TVisionOnRedraw(Window window,Surface surface)
   {
      Button * button = (Button *)window->data;
      int state = this.state;
      int tw, th;

      int offset = (buttonStyle.bevel && state == down) ? textCellW : 0;

      if(clientSize.h <= textCellH || clientSize.w <= 2*textCellW) offset = 0;

      if(!isEnabled)
         state = disabled;

      surface.TextOpacity(false);
      surface.SetForeground((active ? white : black) );

      surface.SetBackground(GREEN);
      // Background
      if(buttonStyle.bevel)
      {
         if(state == down)
         {
            if(clientSize.h > textCellH && clientSize.w > 2*textCellW)
               surface.Area(textCellW,0,clientSize.w-textCellW,clientSize.h-textCellH-1);
            else if(!window->background)
               surface.Area(0,0,clientSize.w-1,clientSize.h-1);
         }
         else
         {
            if(clientSize.h > textCellH && clientSize.w > 2*textCellW)
            {
               surface.Area(0,0,clientSize.w-2*textCellW,clientSize.h-textCellH-1);
               surface.SetForeground(black);
               eSurface_DrawingChar(surface, 223);
               surface.HLine(textCellW,clientSize.w-textCellW,window->h-textCellH);
               if(clientSize.h>32)
               {
                  eSurface_DrawingChar(surface, 219);
                  surface.VLine(1,clientSize.h-textCellH,clientSize.w-textCellW);
               }
               eSurface_DrawingChar(surface, 220);
               surface.HLine(clientSize.w - textCellW, clientSize.w - textCellW, 0);
            }
            else if(!window->background)
               surface.Area(0,0,clientSize.w-1,clientSize.h-1);
         }
      }

      surface.SetForeground(((active || state == down) ? ((BITwindow->buttonStyle, ES_DEFAULT)) ? LT_RED : white) : ((BITwindow->buttonStyle, ES_DEFAULT)) ? LT_CYAN : textColor[state])) );

      if(buttonStyle.checkBox)
         surface.WriteText(0,0, checked ? "[\373]" : "[ ] = 3);
      if(buttonStyle.radio)
         surface.WriteText(0,0, checked ? "(\007)" : "( ) = 3);

      if(text)
         surface.TextExtent(text,strlen(text),&tw, &th);

      if(buttonStyle.radio || buttonStyle.checkBox)
         surface.SetForeground(((state == down) ? ((BITwindow->buttonStyle, ES_DEFAULT)) ? LT_RED : white) : ((BITwindow->buttonStyle, ES_DEFAULT)) ? LT_CYAN : textColor[state])));

      if(buttonStyle.radio || buttonStyle.checkBox)
         WriteCaption(surface, 4*textCellW, (clientSize.h - th - 2)/2);
      else if(!text)
      {
         if(symbol)
         {
            tw = textCellW; th = textCellH;
            surface.WriteTextf((clientSize.w - tw)/2 + offset, (clientSize.h - th - 2)/2 + offset.%c = symbol);
         }
      }
      else
         WriteCaption(surface,(clientSize.w - tw)/2 + offset,(clientSize.h - th - 2)/2 + offset);
   }
   */

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(!mods.isSideEffect)
         return NotifyMouseMove(master, this, x,y, mods);
      return true;
   }

   bool OnActivate(bool active, Window swap, bool * goOnWithActivation, bool direct)
   {
      //eSystem_Logf("%s %s\n = text, active ? "Activated" : "Deactivated;
      if(!active)
      {
         if(!buttonStyle.toggle)
         {
            if(captured)
            {
               captured = false;
               ReleaseCapture();
            }
            if(hint && NotifyReleased(master, this, 0, 0, 0))
            {
               state = up;
               hint = false;
               key = false;
            }
         }
      }
      Update(null);
      return true;
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= 0 && y >= 0 && x < size.w && y < size.h)
      {
         if(buttonStyle.toggle)
         {
            state = (state == down) ? up : down;
            if(NotifyPushed(master, this, x,y, mods) &&
               NotifyClicked(master, this, x,y, mods))
               Update(null);
         }
         else
         {
            if(key || Capture())
            {
               Window master = this.master;
               if(!key)
                  captured = true;
               if(NotifyPushed(master, this, x,y, mods))
               {
                  hint = true;
                  if(!buttonStyle.stayUp)
                     state = down;
                  Update(null);
               }
            }
         }
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(!(buttonStyle.toggle))
      {
         bool releasedResult;
         if(captured)
         {
            captured = false;
            ReleaseCapture();
         }

         releasedResult = NotifyReleased(master, this, x,y, mods);
         if(hint)
         {
            if(x >= 0 && y >= 0 && x < size.w && y < size.h)
            {
               if(buttonStyle.checkBox)
                  property::checked = !checked;
               else if(buttonStyle.radio)
                  property::checked = true;

               // state = mods ? up : over;
               // TESTING THIS OUT:
               state = over ? over : up;
               hint = false;
               Update(null);
               if(releasedResult)
               {
                  if(NotifyClicked(master, this, x,y, mods))
                     return true;
                  else
                     return false;
               }
            }
            else
            {
               state = up;
               hint = false;
               Update(null);
            }
         }
      }
      return true;
   }

   bool OnLeftDoubleClick(int x, int y, Modifiers mods)
   {
      return NotifyDoubleClick(master, this, x,y, mods);
   }

   bool OnMouseOver(int x, int y, Modifiers mods)
   {
      over = true;
      if(!key)
      {
         if(!(buttonStyle.toggle || buttonStyle.stayUp))
         {
            if(!hint)
               state = over;
            else
            {
               state = down;
            }
         }
         else
         {
            if(state != down)
               state = over;
         }

         if(NotifyMouseOver(master, this, x,y, mods))
            Update(null);
      }
      return true;
   }

   void OnMouseCaptureLost()
   {
      if(captured)
      {
         captured = false;
         if(hint)
         {
            state = up;
            hint = false;
            Update(null);
         }
      }
   }

   bool OnMouseLeave(Modifiers mods)
   {
      if(!key)
      {
         if( (!buttonStyle.stayDown || !hint) /*&&  !buttonStyle.toggle */)
         {
            if(!(buttonStyle.toggle) || state == over)
               state = up;
         }

         if(NotifyMouseLeave(master, this, mods))
            Update(null);
      }
      over = false;
      return true;
   }

   bool OnLoadGraphics()
   {
      font = fontObject;
      if(text)
         display.FontExtent(font,text,strlen(text), &captionWidth, &captionHeight);
      else
      {
         display.FontExtent(font," ", 1, &captionWidth, &captionHeight);
         captionWidth = 80;
      }
      if(bitmapAlignment != center && !buttonStyle.checkBox && !buttonStyle.radio && !buttonStyle.scale)
      {
         Bitmap buttonBitmap = GetButtonBitmap();
         if(buttonBitmap)
         {
            if(bitmapAlignment == left || bitmapAlignment == right)
               captionWidth += buttonBitmap.width + 4;
            else
               captionHeight += buttonBitmap.height + 4;
         }
      }
      return true;
   }

   bool OnResizing(int *width, int *height)
   {
      if(buttonStyle.checkBox || buttonStyle.radio || buttonStyle.bevelOver)
      {
         Bitmap bitmap0 = bitmaps[0] ? bitmaps[0].bitmap : null;
         if(!*width && bitmap0) *width = bitmap0.width;
         if(!*height && bitmap0) *height = bitmap0.height;

         *height = Max(*height, captionHeight + 2);
         if(text)
         {
            if(guiApp.textMode)
               *width = Max(*width, /**height + */captionWidth + CAPTION_DISTANCE + 16);
            else
               *width = Max(*width, /**height + */captionWidth + CAPTION_DISTANCE + 8);
         }
         else
         {
            *width = Max(*width, *height);
            if(guiApp.textMode)
               *width = Max(*width, 32);
         }
      }
      else
      {
         if(!caption && bitmap && bitmap.bitmap)
         {
            if(!*width)
               *width = bitmap.bitmap.width;
            if(!*height)
               *height = bitmap.bitmap.height;
         }
         else if(guiApp.textMode && buttonStyle.bevel)
         {
            if(!*width)
               *width = Max(*width, captionWidth + 8);
            if(!*height)
               *height = Max(*height, captionHeight + 16);
         }
         else
         {
            if(!*width)
               *width = Max(*width, captionWidth + /*4*/12);
            if(!*height)
               *height = Max(*height, captionHeight + /*6*/ 8);
         }
      }
      return true;
   }


   bool OnKeyUp(Key key, unichar character)
   {
      if(key == space || key.code == enter || key.code == keyPadEnter || (key == hotKey && !buttonStyle.keyRepeat))
      {
         if(this.key)
         {
            this.key = false;
            /*return */OnLeftButtonUp(0,0, key.modifiers);
            if(key == hotKey)
               return false;
         }
      }
      return true;
   }

   bool OnKeyDown(Key key, unichar character)
   {
      if(!key.alt && !key.ctrl)
      {
         switch(key.code)
         {
            case hotKey:
               if(buttonStyle.keyRepeat) break;
            case space:
            case defaultKey:
               this.key = true;
               OnLeftButtonDown(0,0, key.modifiers);
               if(key.code == hotKey)
                  return true;
               else
                  return false;
            case escape:
               if(this.key)
               {
                  OnActivate(false, null, null, true);
                  return false;
               }
               break;
         }
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar character)
   {
      switch(key)
      {
         case left: case up:
            if(parent.CycleChildren(false, false, false, !(buttonStyle.bevelOver && buttonStyle.radio)))
            {
               if(buttonStyle.bevelOver && buttonStyle.radio)
               {
                  Button b = (Button)parent.activeChild;
                  if(b && b != this && eClass_IsDerived(b._class, class(Button)) && b.buttonStyle.radio && b.buttonStyle.bevelOver)
                  {
                     b.OnLeftButtonDown(0,0,(Modifiers)key);   // Casting Key to Modifiers is bad
                     b.OnLeftButtonUp(0,0,(Modifiers)key);
                  }
               }
               return false;
            }
            break;
         case right: case down:
            if(parent.CycleChildren(true, false, false, !(buttonStyle.bevelOver && buttonStyle.radio)))
            {
               if(buttonStyle.bevelOver && buttonStyle.radio)
               {
                  Button b = (Button)parent.activeChild;
                  if(b && b != this && eClass_IsDerived(b._class, class(Button)) && b.buttonStyle.radio && b.buttonStyle.bevelOver)
                  {
                     b.OnLeftButtonDown(0,0,(Modifiers)key);
                     b.OnLeftButtonUp(0,0,(Modifiers)key);
                  }
               }
               return false;
            }
            break;
         case hotKey:
            if(buttonStyle.keyRepeat)
            {
               this.key = true;
               OnLeftButtonDown(0,0, key.modifiers);
               this.key = false;
               /*return */OnLeftButtonUp(0,0, key.modifiers);
               return false;
            }
            break;
      }
      return true;
   }
public:
   void SetColor(ButtonState state, Color value)
   {
      colors[state] = value;
   }

   void SetTextColor(ButtonState state, Color value)
   {
      textColor[state] = value;
   }

   void RemoveRadio()
   {
      if(buttonStyle.radio)
      {
         RemoveResource(bitmaps[up]);
         RemoveResource(bitmaps[down]);
         RemoveResource(bitmaps[disabled]);
         RemoveResource(bitmaps[upChecked]);
         RemoveResource(bitmaps[downChecked]);
         RemoveResource(bitmaps[disabledChecked]);

         bitmaps[up] = null;
         bitmaps[down] = null;
         bitmaps[disabled] = null;
         bitmaps[upChecked] = null;
         bitmaps[downChecked] = null;
         bitmaps[disabledChecked] = null;
      }
      buttonStyle.radio = false;
   }

   // Notifications
   virtual bool Window::NotifyClicked(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyDoubleClick(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyPushed(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyReleased(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyMouseMove(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyMouseOver(Button button, int x, int y, Modifiers mods);
   virtual bool Window::NotifyMouseLeave(Button button, Modifiers mods);

   // Properties
   property bool isRadio
   {
      property_category $"Behavior"
      set
      {
         if(value)
         {
            if(!bitmaps[up])
            {
               RemoveResource(bitmaps[up]);
               RemoveResource(bitmaps[down]);
               RemoveResource(bitmaps[disabled]);
               RemoveResource(bitmaps[upChecked]);
               RemoveResource(bitmaps[downChecked]);
               RemoveResource(bitmaps[disabledChecked]);

               bitmaps[up] = BitmapResource { };
               bitmaps[down] = BitmapResource { };
               bitmaps[disabled] = BitmapResource { };
               bitmaps[upChecked] = BitmapResource { };
               bitmaps[downChecked] = BitmapResource { };
               bitmaps[disabledChecked] = BitmapResource { };
               bitmaps[up].fileName = "<:ecere>elements/optionBoxUp.png";
               bitmaps[down].fileName = "<:ecere>elements/optionBoxDown.png";
               bitmaps[disabled].fileName = "<:ecere>elements/optionBoxDisabled.png";
               bitmaps[upChecked].fileName = "<:ecere>elements/optionBoxSelectedUp.png";
               bitmaps[downChecked].fileName = "<:ecere>elements/optionBoxSelectedDown.png";
               bitmaps[disabledChecked].fileName = "<:ecere>elements/optionBoxDisabledSelected.png";

               AddResource(bitmaps[up]);
               AddResource(bitmaps[down]);
               AddResource(bitmaps[disabled]);
               AddResource(bitmaps[upChecked]);
               AddResource(bitmaps[downChecked]);
               AddResource(bitmaps[disabledChecked]);
            }

            buttonStyle.radio = true;
            buttonStyle.checkBox = false;
            buttonStyle.bevel = false;
            opacity = 0;
            drawBehind = true;
         }
         else
         {
            RemoveRadio();
         }
         OnLoadGraphics();

         SetInitSize(initSize);
      }
      get { return buttonStyle.radio; }
   };
   property bool isCheckbox
   {
      property_category $"Behavior"
      set
      {
         if(value)
         {
            buttonStyle.checkBox = true;
            background = white;
            RemoveRadio();
            buttonStyle.radio = false;
            buttonStyle.bevel = false;
            opacity = 0;
            drawBehind = true;
         }
         else
            buttonStyle.checkBox = false;
         OnLoadGraphics();

         SetInitSize(initSize);
      }
      get { return buttonStyle.checkBox; }
   };
   property bool bevel
   {
      property_category $"Behavior"
      set
      {
         if(value)
         {
            buttonStyle.bevel = true;
            RemoveRadio();
            buttonStyle.checkBox = false;
            buttonStyle.radio = false;
            buttonStyle.bevelOver = false;
            opacity = 1;
            drawBehind = false;
         }
         else
         {
            buttonStyle.bevel = false;
            opacity = 0;
            drawBehind = true;
         }
      }
      get { return buttonStyle.bevel; }
   };
   property bool bevelOver
   {
      property_category $"Behavior"
      set
      {
         if(value)
         {
            buttonStyle.bevelOver = true;
            buttonStyle.offset = true;
            buttonStyle.bevel = false;
         }
         else
         {
            buttonStyle.bevelOver = false;
            buttonStyle.offset = false;
         }
      }
      get { return buttonStyle.bevelOver; }
   };
   property bool toggle { property_category $"Behavior" set { buttonStyle.toggle = value; } get { return buttonStyle.toggle; } };
   property bool checked
   {
      property_category $"Appearance"
      set
      {
         if(buttonStyle.toggle)
         {
            state = value ? down : up;
         }
         else
         {
            if(buttonStyle.radio && value)
            {
               Window parent = this.parent;
               if(parent)
               {
                  Window otherWindow;
                  for(otherWindow = parent.firstChild; otherWindow; otherWindow = otherWindow.next)
                  {
                     if(otherWindow != this && eClass_IsDerived(otherWindow._class, _class))
                     {
                        Button otherButton = (Button)otherWindow;
                        if(otherButton.buttonStyle.radio)
                           otherButton.checked = false;
                     }
                  }
               }
            }
            checked = value;
         }
         Update(null);
      }
      get { return buttonStyle.toggle ? (state == down) : checked; }
   };
   property Alignment alignment { property_category $"Appearance" set { alignment = value; } get { return alignment; } };
   property BitmapResource bitmap
   {
      property_category $"Appearance"
      set
      {
         AddResource(value);
         RemoveResource(bitmaps[up]);
         bitmaps[up] = value;

         RemoveResource(bitmaps[over]);
         RemoveResource(bitmaps[down]);
         RemoveResource(bitmaps[disabled]);
         RemoveResource(bitmaps[upChecked]);
         RemoveResource(bitmaps[overChecked]);
         RemoveResource(bitmaps[downChecked]);
         RemoveResource(bitmaps[disabledChecked]);

         bitmaps[over] = null;
         bitmaps[down] = null;
         bitmaps[disabled] = null;
         bitmaps[upChecked] = null;
         bitmaps[overChecked] = null;
         bitmaps[downChecked] = null;
         bitmaps[disabledChecked] = null;

         /*
         if(buttonStyle.radio && !value)
         {
            AddResource((bitmaps[up] = BitmapResource { fileName = "<:ecere>elements/optionBox.png" }));
            AddResource((bitmaps[down] = BitmapResource { fileName = "<:ecere>elements/optionBox.png" }));
            AddResource((bitmaps[disabled] = BitmapResource { fileName = "<:ecere>elements/optionBoxDisabled.png" }));
            AddResource((bitmaps[upChecked] = BitmapResource { fileName = "<:ecere>elements/optionBoxSelected.png" }));
            AddResource((bitmaps[downChecked] = BitmapResource { fileName = "<:ecere>elements/optionBoxSelected.png" }));
            AddResource((bitmaps[disabledChecked] = BitmapResource { fileName = "<:ecere>elements/optionBoxDisabledSelected.png" }));
         }
         else */if(!bitmaps[disabled])
         {
            bitmaps[disabled] = BitmapResource { fileName = bitmap.fileName, grayed = true };
            AddResource(bitmaps[disabled]);
         }
      }
      get { return bitmaps[up]; }
   };
   property bool stayUp { property_category $"Behavior" set { buttonStyle.stayUp = value; } get { return buttonStyle.stayUp; } };
   property bool scaleBitmap { property_category $"Appearance" set { buttonStyle.scale = value; } get { return buttonStyle.scale; } };
   property bool keyRepeat { property_category $"Behavior" set { buttonStyle.keyRepeat = value; } get { return buttonStyle.keyRepeat; } };
   property unichar symbol { property_category $"Appearance" set { this.symbol = value; } get { return symbol; } };
   property bool ellipsis { property_category $"Appearance" set { buttonStyle.ellipsis = value; } get { return buttonStyle.ellipsis; } };
   property bool stayDown { property_category $"Behavior" set { buttonStyle.stayDown = value; } get { return buttonStyle.stayDown; } };
   property bool offset { property_category $"Behavior" set { buttonStyle.offset = value; } get { return buttonStyle.offset; } };

   property ButtonState buttonState { get { return state; } set { state = value; } };
   property BoxAlignment bitmapAlignment { property_category $"Appearance" set { bitmapAlignment = value; } get { return bitmapAlignment; } };
};
