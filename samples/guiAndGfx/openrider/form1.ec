import "ecere"
import "game"

#define PREFIX "OpenRider Track\n\n"
#define PREFIX_SIZE 17

define app = ((GuiApplication)__thisModule);

#define ROTATION_RESOLUTION 128

struct Matrix2D {
   double t0,t1;
   double t2,t3;

   //sets the angle of the matrix's forward transformation to the angle specified
   void ToAngle(double radians) {
      t0 = cos(radians);
      t1 = -sin(radians);
      t2 = sin(radians);
      t3 = cos(radians);
   }
   void Scale(double multiplier) {
      t0 *= multiplier;
      t1 *= multiplier;
      t2 *= multiplier;
      t3 *= multiplier;
   }
};

//This function takes src, transforms it at origin sx, sy using the _inverse_ of trans_inv, and places it in dest at dx, dy
void Transform888Bitmap(Bitmap src, Bitmap dest, double sx, double sy, double dx, double dy, Matrix2D trans_inv, ColorAlpha background) {
   int destx,desty;
   int destw=dest.width, desth=dest.height;
   int srcx,srcy;
   int srcw=src.width, srch=src.height;
   uint tt0 = (uint)(trans_inv.t0*65536);
   uint tt1 = (uint)(trans_inv.t1*65536);
   uint tt2 = (uint)(trans_inv.t2*65536);
   uint tt3 = (uint)(trans_inv.t3*65536);
   uint dsrcx, dsrcy;
   uint isx = (uint)(sx*65536);
   uint isy = (uint)(sy*65536);
   uint t0m, t1m, t2m, t3m, t0mi, t2mi;
   ColorAlpha *rp = (ColorAlpha*)dest.picture;
   ColorAlpha *p;
   ColorAlpha *sp = (ColorAlpha*)src.picture;
   ColorAlpha *s;
   t0mi = (uint)(-dx*trans_inv.t0*65536);
   t2mi = (uint)(-dx*trans_inv.t2*65536);
   t1m  = (uint)(-dy*trans_inv.t1*65536);
   t3m  = (uint)(-dy*trans_inv.t3*65536);
   for (desty=0; desty<desth; desty++, t1m+=tt1, t3m+=tt3, rp+=dest.stride) {
      p = rp;
      t0m = t0mi;
      t2m = t2mi;
      for (destx=0; destx<destw; destx++, t0m+=tt0, t2m+=tt2,p++) {
         uint aax, aay;
         ColorAlpha c[4];
         uint dma, dmb, dmc, dmd;
         unsigned short ma,mb,mc,md;
         dsrcx = t0m + t1m + isx;
         dsrcy = t2m + t3m + isy;
         srcx = dsrcx>>16;
         srcy = dsrcy>>16;
         aax = dsrcx & 0xFFFFL;
         aay = dsrcy & 0xFFFFL;
         dmd = (aax*aay)>>16;
         dma = (1UL<<16)-aax-aay+dmd;
         dmb = aax-dmd;
         dmc = aay-dmd;
         ma = (unsigned short)(dma>>8);
         mb = (unsigned short)(dmb>>8);
         mc = (unsigned short)(dmc>>8);
         md = (unsigned short)(dmd>>8);
         s = sp + srcy*src.stride + srcx;

         if (srcx>=0 && srcx<srcw-1 && srcy>=0 && srcy<srch-1) {
            c[0] = s[0];
            c[1] = s[1];
            c[2] = s[src.stride];
            c[3] = s[src.stride+1];
         } else {
            c[0] = background;
            c[1] = background;
            c[2] = background;
            c[3] = background;
            if (srcx>=0 && srcx<srcw && srcy>=0 && srcy<srch)
               c[0] = s[0];
            if (srcx+1>=0 && srcx+1<srcw && srcy>=0 && srcy<srch)
               c[1] = s[1];
            if (srcx>=0 && srcx<srcw && srcy+1>=0 && srcy+1<srch)
               c[2] = s[src.stride];
            if (srcx+1>=0 && srcx+1<srcw && srcy+1>=0 && srcy+1<srch)
               c[3] = s[src.stride+1];
         }
         p->a = (byte)((c[0].a*ma + c[1].a*mb + c[2].a*mc + c[3].a*md) >> 8);
         p->color.b = (byte)((c[0].color.b*ma + c[1].color.b*mb + c[2].color.b*mc + c[3].color.b*md) >> 8);
         p->color.g = (byte)((c[0].color.g*ma + c[1].color.g*mb + c[2].color.g*mc + c[3].color.g*md) >> 8);
         p->color.r = (byte)((c[0].color.r*ma + c[1].color.r*mb + c[2].color.r*mc + c[3].color.r*md) >> 8);
      }
   }
}

int angle2index(double angle) {
   int index;
   angle += Pi/ROTATION_RESOLUTION;
   index = (int)(angle*ROTATION_RESOLUTION/(2*Pi));
   index %= ROTATION_RESOLUTION;
   if (index<0)
      index += ROTATION_RESOLUTION;
   return index;
}

/*wheel[i] = {alphaBlend=true};
         wheel[i].Allocate(null, renderwidth, renderwidth, 0, pixelFormat888, false);
         mat.ToAngle(angle);
         mat.Scale(64.0/(double)renderwidth);
         Transform888Bitmap(orig, wheel[i], 31.5, 31.5, ((double)renderwidth-0.5)/2, ((double)renderwidth-0.5)/2, mat, wheel_background);
         angle += angle_change;*/

Bitmap CreateRotatedBitmap(Bitmap original, double scale, double angle, ColorAlpha background) {
   uint renderwidth = (uint)((double)original.width*scale);
   Bitmap ret {alphaBlend = true};
   Matrix2D mat;
   ret.Allocate(null, renderwidth, renderwidth, 0, pixelFormat888, false);
   mat.ToAngle(-angle);
   mat.Scale(1/scale);
   Transform888Bitmap(original, ret, (double)original.width/2-0.5, (double)original.height/2-0.5, ((double)renderwidth-0.5)/2, ((double)renderwidth-0.5)/2, mat, background);
   return ret;
}

enum DrawingTool {browse, pencil, line, eraser};

struct Camera2D {
   double x,y;
   double zoom; //the higher the zoom, the larger things appear
};

static FileFilter fileFilters[] =
{
   { "OpenRider track files (*.ort)", "ort" },
   { "All files", null}
};

static FileType fileTypes[] =
{
   { "OpenRider track files", "ort", always }
};

class Form1 : Window
{
   text = "OpenRider";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   hasMenuBar = true;
   size = { 628, 500 };
   anchor = { horz = -33, vert = -28 };

   bool drawing;
   double lastx, lasty;
   double curx, cury;
   bool navigating;
   double cstartx, cstarty;
   double nx, ny;
   DrawingTool drawingTool; //all tools operated with the left mouse button
   GameLineType gameLineType;
   Camera2D camera[2];
   bool running_b;
   double lastFrameTime;
   running_b = false;
   property bool running {
      set {
         if (!running_b && value)
            lastFrameTime = GetTime();
         running_b = value;
         goItem.checked = value;
         wheelSpinner.started = value;

         centerItem.disabled = value;
         nudgeLeftItem.disabled = value;
         nudgeRightItem.disabled = value;
         nudgeUpItem.disabled = value;
         nudgeDownItem.disabled = value;

         if (!value)
            Update(null);
      }
      get {
         return running_b;
      }
   }

   Timer wheelSpinner {this, 0.015, started=false;
      bool DelayExpired() {
         double t = GetTime();

         this.modifiedDocument = true;

         //game.FrameMulti(LOGICAL_FPS/DRAWN_FPS*2);
         game.FrameMulti((uint)((t-lastFrameTime)*LOGICAL_FPS));
         lastFrameTime = t;

         //let's center the camera on the ball
         {
            Coord2D p = game.vehicles[0].location;
            Vector2D v = game.vehicles[0].velocity;
            //camera.zoom = 1.0;
            camera[1].x = p.x - v.x*5;
            camera[1].y = p.y - v.y*5;
         }
         Update(null);
         return true;
      }
   };

   Bitmap wheel[ROTATION_RESOLUTION];
   Bitmap wheel_orig {alphaBlend=true};

   ColorAlpha wheel_background;
   Surface surface;
   drawing = false;
   navigating = false;
   drawingTool = pencil;
   gameLineType = regular;
   FileDialog fileSaveDialog
   {
      master = this, type = save, text = "Save Track...",
      types = fileTypes, sizeTypes = sizeof(fileTypes),
      filters = fileFilters, sizeFilters = sizeof(fileFilters);
   };
   FileDialog openDialog
   {
      master = this, type = open, text = "Load Track...",
      types = fileTypes, sizeTypes = sizeof(fileTypes),
      filters = fileFilters, sizeFilters = sizeof(fileFilters);
   };
   saveDialog = fileSaveDialog;
   Menu fileMenu {menu, "File", f};
   MenuItem fileNewItem {
         fileMenu, "New", n, Key {n, ctrl = true};

         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if (MessageBox {master=this, text = "OpenRider",
               contents="Are you sure you want to clear the current track and start a new one?",
               type=yesNo}.Modal() != yes)
               return true;
            running = false;
            camera[0] = camera[1] = {0.0,0.0,1.0};
            game.Clear();
            game.ResetBall();
            this.modifiedDocument = false;
            this.fileName = null;
            Update(null);
            return true;
         }
      };
   MenuItem fileOpenItem {
         fileMenu, "Open...", o, Key {o, ctrl = true};

         bool NotifySelect(MenuItem selection, Modifiers mods)
         {
            if (openDialog.Modal() == ok) {
               OnLoadFile(openDialog.filePath);
               /*if (!OnLoadFile(openDialog.filePath))
               {
                  MessageBox {master=this, text = "Error opening file.", contents = "Error opening file."}.Modal();
                  return true;
               }*/
            }
            return true;
         }
      };
   MenuItem fileSaveItem { fileMenu, "Save", s, Key {s, ctrl = true}, NotifySelect=MenuFileSave};
   MenuItem fileSaveAsItem { fileMenu, "Save As...", a, Key {a, ctrl = true}, NotifySelect=MenuFileSaveAs };
   MenuDivider {fileMenu};
   MenuItem exitItem {fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };

   Menu viewMenu {menu, "View", v};
   MenuItem centerItem {viewMenu, "Center on ball", c, tab;
      bool NotifySelect(MenuItem selection, Modifiers mods) {
         if (!running) {
            camera[0].x = game.vehicles[0].location.x;
            camera[0].y = game.vehicles[0].location.y;
            Update(null);
         }
         return true;
      }
   };
   MenuDivider {viewMenu};
   MenuItem zoomInItem {viewMenu, "Zoom in\t+", i;
      bool NotifySelect(MenuItem selection, Modifiers mods) {
         Zoom(1.5, 0);
         return true;
      }
   };
   MenuItem zoomOutItem {viewMenu, "Zoom out\t-", o;
      bool NotifySelect(MenuItem selection, Modifiers mods) {
         Zoom(1/1.5, 0);
         return true;
      }
   };
   MenuDivider {viewMenu};
   MenuItem nudgeLeftItem {viewMenu, "Left", l, left, NotifySelect = NudgeCallback, id=0};
   MenuItem nudgeRightItem {viewMenu, "Right", r, right, NotifySelect = NudgeCallback, id=1};
   MenuItem nudgeUpItem {viewMenu, "Up", u, up, NotifySelect = NudgeCallback, id=2};
   MenuItem nudgeDownItem {viewMenu, "Down", d, down, NotifySelect = NudgeCallback, id=3};

   bool NudgeCallback(MenuItem selection, Modifiers mods) {
      Camera2D *c = camera;
      double nudgeAmount = 20.0 / c->zoom;

      if (running)
         return true;

      if (selection.id == 0)
         c->x -= nudgeAmount;
      else if (selection.id == 1)
         c->x += nudgeAmount;
      else if (selection.id == 2)
         c->y -= nudgeAmount;
      else
         c->y += nudgeAmount;

      Update(null);

      return true;
   }

   Menu toolMenu {menu, "Tool", t};
   MenuItem browseItem {toolMenu, "Browse", b, b, checked=false, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem pencilItem {toolMenu, "Draw", d, d, checked=true, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem lineItem {toolMenu, "Straight line", s, s, checked=false, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem eraserItem {toolMenu, "Eraser", e, e, checked=false, isRadio=true, NotifySelect = MyCustomMenu};
   MenuDivider {toolMenu};
   MenuItem normalItem {toolMenu, "Normal", a, a, checked=true, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem speedItem {toolMenu, "Right accelerator", r, r, checked=false, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem slowItem {toolMenu, "Left accelerator", f, f, checked=false, isRadio=true, NotifySelect = MyCustomMenu};
   MenuItem decorItem {toolMenu, "Decoration", c, c, checked=false, isRadio=true, NotifySelect = MyCustomMenu};

   Menu controlMenu {menu, "Control", c};
   MenuItem goItem {controlMenu, "Go", g, Key {g, ctrl=true}, checked=false, checkable=true;
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         running = selection.checked;
         return true;
      }
   };
   MenuItem resetItem {controlMenu, "Reset Ball", r, Key {r, ctrl=true};
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         this.modifiedDocument = true;
         running = false;
         game.ResetBall();
         Update(null);
         return true;
      }
   };

   bool MyCustomMenu(MenuItem selection, Modifiers mods) {
      if (browseItem.checked)
         drawingTool = browse;
      else if (pencilItem.checked)
         drawingTool = pencil;
      else if (lineItem.checked)
         drawingTool = line;
      else if (eraserItem.checked)
         drawingTool = eraser;

      if (normalItem.checked)
         gameLineType = regular;
      else if (speedItem.checked)
         gameLineType = speed;
      else if (slowItem.checked)
         gameLineType = slow;
      else if (decorItem.checked)
         gameLineType = decor;
      return true;
   }

   bool OnCreate(void)
   {
      camera[0] = {0.0, 0.0, 1.0}; //paused camera
      camera[1] = {0.0, 0.0, 1.0}; //running camera
      app.timerResolution = 300;
      game.Init();
      return true;
   }

   bool OnSaveFile(char * fileName)
   {
      File f = FileOpen(fileName, write);
      unsigned short mv = (unsigned short)game.version_code;
      char vn[16];
      if (!f)
         return false;
      memset(vn, 0, 16);
      strcpy(vn, version_name);
      f.Write(PREFIX, 1, PREFIX_SIZE);
      f.Write(vn, 1, 16);
      f.Put(mv);
      f.Put(camera[0]);
      f.Put(game);
      delete f;
      this.modifiedDocument = false;
      return true;
   }

   void OnLoadFile(char * fileName) {
      File f = FileOpen(fileName, read);
      unsigned short mv;
      char prefix[PREFIX_SIZE];
      char vn[16];

      if (!f) {
         MessageBox {master=this, text="OpenRider", contents="Error loading file."}.Modal();
         return;
      }

      f.Read(prefix, 1, sizeof(prefix));
      if (strncmp(prefix, PREFIX, sizeof(prefix))) {
         MessageBox {master=this, text="OpenRider", contents="This does not appear to be a valid OpenRider track.  Try using an older or newer version of OpenRider."}.Modal();
         delete f;
         return;
      }
      f.Read(vn, 1, 16);
      vn[15] = 0;
      f.Get(mv);

      if (mv > max_version_code_supported) {
         const char *vnp = *vn ? vn : "www.thedailywtf.com";
         const char *message_format = "This track was created by a newer version of OpenRider (version %s).  Continue opening it?";
         char *s = new char[strlen(message_format)+strlen(vnp)];
         DialogResult result;
         sprintf(s, message_format, vnp);
         result = MessageBox {master=this, text="OpenRider", type=yesNo, contents=s}.Modal();
         delete s;
         if (result==no) {
            delete f;
            return;
         }
      }
      f.Get(camera[0]);
      f.Get(game);
      running = false;
      camera[1] = {0,0,1.0};
      this.fileName = openDialog.filePath;
      this.modifiedDocument = false;
      Update(null);
      delete f;
      return;
   }

   bool OnLoadGraphics() {
      uint i;

      wheel_orig.Load(":wheel.png", "png", null);
      if (!wheel_orig) {
         MessageBox {master=this, contents="Wheel image could not be loaded."}.Modal();
         return false;
      }
      #if 1
      wheel_orig.Convert(null, pixelFormat888, null);
      if (wheel_orig.pixelFormat != pixelFormat888) {
         MessageBox {master=this, contents="Wheel image could not be converted."}.Modal();
         return false;
      }

      //let's assume the topleft pixel of the wheel is background
      wheel_background = *(ColorAlpha*)wheel_orig.picture;

      for (i=0; i<ROTATION_RESOLUTION; i++)
         wheel[i] = CreateRotatedBitmap(wheel_orig, 48.0/64.0, (double)i*2*Pi/ROTATION_RESOLUTION, wheel_background);

      for (i=0; i<ROTATION_RESOLUTION; i++)
         wheel[i].MakeDD(displaySystem);
      #else
      wheel_orig.MakeDD(displaySystem);
      for (i=0; i<ROTATION_RESOLUTION; i++)
         wheel[i] = wheel_orig;
      #endif

      return true;
   }

   void OnUnloadGraphics() {
      uint i;
      for (i=0; i<ROTATION_RESOLUTION; i++)
         delete wheel[i];
   }

   void OnRedraw(Surface surface)
   {
      Camera2D *c = &camera[running];
      double x0 = (double)(-clientSize.w) / c->zoom + c->x;
      double y0 = (double)(-clientSize.h) / c->zoom + c->y;
      double x1 = (double)(clientSize.w) / c->zoom + c->x;
      double y1 = (double)(clientSize.h) / c->zoom + c->y;
      this.surface = surface;
      //cameraLabel.SetText("%f, %f, %f", c->x, c->y, c->zoom);
      if (drawing && drawingTool==line)
         game.DrawLine(this, {lastx, lasty, curx, cury, gameLineType, floor});
      game.DrawFrame(x0,y0,x1,y1);
   }

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      Camera2D *c = &camera[running];
      if (drawingTool==browse) {
         if (running)
            return true;
         cstartx = c->x;
         cstarty = c->y;
         nx = (double)x;
         ny = (double)y;
      } else
         this.modifiedDocument = true;
      drawing = true;
      lastx = (double)(x-(clientSize.w>>1))/c->zoom+c->x;
      lasty = (double)(y-(clientSize.h>>1))/c->zoom+c->y;
      Capture();
      dnTimer.Start();
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      Camera2D *c = &camera[running];
      if (drawing && drawingTool==line) {
         curx = (double)(x-(clientSize.w>>1)) / c->zoom + c->x;
         cury = (double)(y-(clientSize.h>>1)) / c->zoom + c->y;
         AddLineToGame(lastx, lasty, curx, cury);
         Update(null);
      }
      drawing = false;
      if (!navigating) {
         ReleaseCapture();
         dnTimer.Stop();
      }
      return true;
   }

   bool OnMiddleButtonDown(int x, int y, Modifiers mods)
   {
      Camera2D *c = &camera[running];
      if (running)
         return true;
      cstartx = c->x;
      cstarty = c->y;
      nx = (double)x;
      ny = (double)y;
      navigating = true;
      dnTimer.Start();
      Capture();
      return true;
   }

   bool OnMiddleButtonUp(int x, int y, Modifiers mods)
   {
      navigating = false;
      if (!drawing) {
         ReleaseCapture();
         dnTimer.Stop();
      }
      return true;
   }

   bool OnKeyHit(Key key, unichar ch)
   {
      if (key.modifiers)
         return true;
      switch((SmartKey)key)
      {
         case space:
            running = !running;
            break;
         case tab:
            if (running) {
               //If the game is running, set the pauseCamera to the current camera
               camera[0] = camera[1];
            } else {
               //Otherwise, center the camera on the ball
               camera[0].x = game.vehicles[0].location.x;
               camera[0].y = game.vehicles[0].location.y;
               Update(null);
            break;
         case wheelDown:
            Zoom(1/1.05, true);
            break;
         case wheelUp:
            Zoom(1.05, true);
            break;
         case minus:
            Zoom(1/1.25, false);
            break;
         case plus:
            Zoom(1.25, false);
            break;
         }
      }
      return true;
   }
   Timer dnTimer {this, 0.03, false;
      bool DelayExpired()
      {
         Camera2D *c = &camera[running];
         bool needUpdate = false;
         int x,y;
         double fx, fy;

         GetMousePosition(&x, &y);
         fx = (double)(x-(clientSize.w>>1))/c->zoom+c->x;
         fy = (double)(y-(clientSize.h>>1))/c->zoom+c->y;
         if (fx==curx && fy==cury)
            return true;
         curx = fx;
         cury = fy;
         if (drawing && drawingTool!=browse) {
            this.modifiedDocument = true;
            if (drawingTool==pencil) {
               AddLineToGame(lastx, lasty, curx, cury);
               lastx = curx;
               lasty = cury;
               needUpdate = true;
            } else if (drawingTool==line) {
               needUpdate = true;
               //game.DrawLine(this, {lastx, lasty, curx, cury, regular, floor});
            } else if (drawingTool==eraser) {
               double screenEraserSize = 8.0;
               double eraserSize = screenEraserSize/c->zoom;
               if (game.EraseAtBox(curx-eraserSize, cury-eraserSize, curx+eraserSize, cury+eraserSize))
                  needUpdate = true;
            }
         }

         if (navigating || (drawing && drawingTool==browse)) {
            double ox = nx-(double)x;
            double oy = ny-(double)y;
            ox /= c->zoom;
            oy /= c->zoom;
            c->x = cstartx + ox;
            c->y = cstarty + oy;
            needUpdate = true;
         }

         if (needUpdate)
            Update(null);
         return true;
      }
   };
   Label cameraLabel { this, size = { 228, 13 }, position = { 384, 24 } };
   Game game {this;
      void DrawBall(GameBall ball) {
         Camera2D *c = &camera[running];
         int x= (int)((ball.location.x-c->x)*c->zoom)+(clientSize.w>>1);
      	int y= (int)((ball.location.y-c->y)*c->zoom)+(clientSize.h>>1);
         int rwidth = (int)(ball.radius*2*c->zoom);
         Bitmap w = wheel[angle2index(ball.angle)];

         if (w) {
            x -= rwidth>>1;
            y -= rwidth>>1;
            if (rwidth == w.width)
               surface.Blit(w, x,y, 0,0, w.width,w.height);
            else
               surface.Filter(w, x,y, 0,0, rwidth,rwidth, w.width,w.height);
         }

         #if 0
         if (!running && fabs(camera.zoom-1.0)>0.01) {
            double newradius = ball.radius*camera.zoom;
            if (fabs(newradius-pause_wheel_radius)>0.01) {
               delete pause_wheel;
               pause_wheel = CreateRotatedBitmap(wheel_orig, newradius*2/(double)wheel_orig.width, ball.angle, wheel_background);
               if (pause_wheel) {
                  pause_wheel.MakeDD(displaySystem);
                  pause_wheel_radius = newradius;
               }
            }
            if (pause_wheel)
               w = pause_wheel;
         }
         if (w) {
            x -= w.width>>1;
            y -= w.height>>1;
            //surface.Stretch(w, x-(rwidth>>1),y-(rwidth>>1), 0,0,rwidth,rwidth,w.width,w.height);
            //This will crash:  surface.Blit(CreateRotatedBitmap(wheel_orig, 21.7331610967957,0,wheel_background), 2147483263, 2147483176,0,0,1390,1390);
            //We will only draw the bitmap if it is visible on the screen.  Otherwise, we might get a crash.
            if (x>-w.width && x<clientSize.w && y>-w.height && y<clientSize.h) {
               surface.Blit(w, x,y,0,0,w.width,w.height);
               surface.Filter(w, x-(rwidth>>1),y-(rwidth>>1), 0,0,rwidth,rwidth,w.width,w.height);
               //surface.Filter(w, x,y,0,0,w.width*2,w.height*2,w.width,w.height);
            }
         }
         #endif
      }

      void DrawLine(GameLine line) {
         Camera2D *c = &camera[running];
         int x0=(int)((line.x0-c->x)*c->zoom)+(clientSize.w>>1);
      	int y0=(int)((line.y0-c->y)*c->zoom)+(clientSize.h>>1);
      	int x1=(int)((line.x1-c->x)*c->zoom)+(clientSize.w>>1);
      	int y1=(int)((line.y1-c->y)*c->zoom)+(clientSize.h>>1);

         /*if (line.floor_or_ceiling == floor) {
            surface.SetForeground(gray);
            DrawThickLine(x0, y0+2, x1, y1+2);
         } else if (line.floor_or_ceiling == ceiling) {
            surface.SetForeground(gray);
            DrawThickLine(x0, y0-2, x1, y1-2);
         }*/

         switch (line.type) {
            case regular:
               surface.SetForeground(black);
               break;
            case decor:
               surface.SetForeground(green);
               break;
            case slow:
               surface.SetForeground(darkGoldenrod);
               break;
            case speed:
               surface.SetForeground(red);
               break;
         }

         DrawThickLine(x0, y0, x1, y1);
      }
   };

   void AddLineToGame(double x0, double y0, double x1, double y1) {
      game.lines.Add({x0,y0,x1,y1,gameLineType,floor});
   }

   void DrawThickLine(int x0, int y0, int x1, int y1) {
      surface.DrawLine(x0,y0,x1,y1);
      surface.DrawLine(x0+1,y0,x1+1,y1);
      surface.DrawLine(x0,y0+1,x1,y1+1);
      surface.DrawLine(x0+1,y0+1,x1+1,y1+1);
   }

   void Zoom(double scale_factor, bool zoomTowardMouse) {
      Camera2D *c = &camera[running];
      if (!running) {
         if (zoomTowardMouse) { //zoom toward mouse
            int x,y;
            GetMousePosition(&x, &y);
            curx = (double)(x-(clientSize.w>>1)) / c->zoom + c->x;
            cury = (double)(y-(clientSize.h>>1)) / c->zoom + c->y;
         } else { //zoom toward ball
            curx = game.vehicles[0].location.x;
            cury = game.vehicles[0].location.y;
         }
         //we want (curx-c->x)*zoom*scale factor to equal (curx-old c->x)*zoom
         c->x = (curx*scale_factor-curx+c->x)/scale_factor;
         c->y = (cury*scale_factor-cury+c->y)/scale_factor;
         c->zoom *= scale_factor;
         Update(null);
      } else
         c->zoom *= scale_factor;
   }
}

Form1 form1 {};
