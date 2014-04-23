#ifdef ECERE_STATIC
import static "ecere"
#else
import "ecere"
#endif

import "GradientDesigner"

define app = (GuiApplication)__thisModule;
define gradient = fractalsDesigner.gradientDesigner.gradient;

struct Complex
{
   double a, b;
};

class Buffer
{
   float * pixels;
   Complex * z;
   int width, height;   

   void Allocate(int w, int h)
   {
      width = w;
      height = h;
      pixels = renew pixels float[w * h];
      z = renew z Complex[w * h];
      FillBytes(pixels, 0, w * h * sizeof(float));
      FillBytes(z, 0, w * h * sizeof(Complex));    // renew0 crashes
   }
   void Free()
   {
      delete pixels;
      delete z;
   }
}

class ParallelFractalRenderThread : Thread
{
   FractalRenderThread thread;
   int yStart, yEnd;
   int depth;
   Semaphore go { };
   Semaphore done { };
   bool terminate;
   int minY, maxY;

   void Render(int ns, int ne, int start, int end)
   {
      int x, y;
      int w = thread.buffer.width;
      int h = thread.buffer.height;
      Complex C, C0, d;
      double delta;
      float * buffer = thread.buffer.pixels;
      Complex * bufferZ = thread.buffer.z;
      int bufferPos;
      int power = thread.exponent;
      bool julia = thread.isJulia;
      double logOf2 = log(2);
      double log2logOf2 = log(2*logOf2);
      double logPower = log(power);
      int n = ns;

      if(w > h)
      {
         d.a = thread.range;
         d.b = thread.range * h / w;
      }
      else
      {
         d.b = thread.range;
         d.a = thread.range * w / h;
      }

      C0.a = thread.center.a - d.a/2;
      C0.b = thread.center.b - d.b/2;
      delta = d.a / w;

      if(julia)
         C = thread.juliaPoint;
      else
      {
         C = C0;
         C.b += start * d.b / h;
      }

      minY = MAXINT;
      maxY = MAXINT;
      for( y = start; y <=end && !terminate; y++)
      {
         float * buf;
         bool got = false;
         bufferPos = y * w;
         buf = buffer + bufferPos;         
         for( x = 0; x < w/* && !terminate*/; x++)
         {
            /*int n;
            for(n = ns; n<=ne; n++)
            {*/
               if(*buf >= n)
               {
                  int c;
                  double zm;
                  Complex Z, oldZ;

                  if(n == 0 && julia)
                     Z = Complex { x * delta + C0.a, y * delta + C0.b };
                  else
                     Z = bufferZ[bufferPos];

                  oldZ = Z;
                  for(c = 1; c<power; c++)
                  {
                     Z = { Z.a*oldZ.a - Z.b*oldZ.b, Z.a*oldZ.b + Z.b*oldZ.a };
                  }
                  Z.a += C.a;
                  Z.b += C.b;

                  zm = sqrt(Z.a * Z.a + Z.b * Z.b);
                  if(zm < 2)
                     *buf = n + 1;
                  else if(power == 2)
                     *buf = (float)(n + 1 - log(log(zm)) / logOf2);
                  else
                     *buf = (float)(n + (log2logOf2 - log(log(zm)) / logPower));
                  bufferZ[bufferPos] = Z;
                  got = true;
               }
            //}
            bufferPos++;
            buf++;
            if(!julia) C.a += delta;
         }
         if(got)
         {
            if(minY == MAXINT) minY = y;
            maxY = y;
         }
         if(!julia) 
         {
            C.a = C0.a;
            C.b += delta;
         }
      }
   }

   unsigned int Main()
   {
      while(true)
      {
         go.Wait();
         if(terminate)
            break;
         Render(depth, depth, yStart, yEnd);
         done.Release();
      }
      return 0;
   }
}

define numThreads = 16;

class FractalRenderThread : Thread
{
   Complex center;
   double range;
   int iterations;
   int exponent;
   // Complex juliaPoint { -0.726895347709114071439, 0.188887129043845954792 };
   Complex juliaPoint { 0.37799999117851257000, -0.30700001120567322000 };
   bool isJulia;
   int loop;
   float maxLoops;
   bool useBlack;
   bool doLoop;

   doLoop = true;
   loop = 100;
   useBlack = true;
   maxLoops = 5000;
   float numScales;

   range = 2.5;
   exponent = 2;
   iterations = 100;

   Buffer buffer {};
   Mutex mutex {};
   Fractal fractal;
   bool terminate;
   
   int depth, maxDepth;

   unsigned int Main()
   {
      int t;
      int c;
      ParallelFractalRenderThread * threads = new ParallelFractalRenderThread[numThreads];
      int yStart = 0;
      for(t = 0; t < numThreads; t++)
      {
         int yEnd;
         if(t == numThreads - 1)
            yEnd = buffer.height - 1;
         else
            yEnd = yStart + buffer.height / numThreads - 1;
         threads[t] = ParallelFractalRenderThread { thread = this, yStart = yStart, yEnd = yEnd, minY = MAXINT, maxY = MAXINT };
         threads[t].Create();
         yStart = yEnd + 1;
      }
      for(c = maxDepth; c<iterations && !terminate; c++)
      {
         int yStart = MAXINT;
         int max = MAXINT;
         mutex.Wait();

         for(t = 0; t < numThreads; t++)
         {
            threads[t].depth = c;
            threads[t].go.Release();
         }
         for(t = 0; t < numThreads; t++)
            threads[t].done.Wait();
         mutex.Release();         

         app.Lock();

         for(t = 0; t < numThreads; t++)
         {
            if(threads[t].minY != MAXINT)
            {
               threads[t].yStart = threads[t].minY;
               threads[t].yEnd = threads[t].maxY;
            }
            else
            {
               threads[t].yStart = threads[t].yEnd + 1;
            }
         }
         /*
         for(t = 0; t < numThreads; t++)
         {
            if(threads[t].minY != MAXINT) { yStart = threads[t].minY; break; }
         }
         for(t = numThreads-1; t >=0 numThreads; t--)
         {
            if(threads[t].maxY != MAXINT) { max = threads[t].maxY; break; }
         }
         for(t = 0; t < numThreads; t++)
         {
            int yEnd;
            if(t == numThreads - 1)
               yEnd = max;
            else
               yEnd = yStart + (max + 1 - yStart) / numThreads - 1;
            threads[t].yStart = yStart;
            threads[t].yEnd = yEnd;
            yStart = yEnd + 1;
         }*/

         if(!terminate)
         {
            if(!(c%25) && c == maxDepth)
               fractal.UpdateDepth((depth < c) ? depth : (c+1), c+1);
            else
            {
               depth = (depth < c) ? depth : (c+1);
               //fractal.params.depthScroll.range = maxDepth;
               //fractal.params.depthLabel.SetText("%d / %d", depth, fractal.params.depthScroll.range-1);
            }
         }
         maxDepth = c + 1;
         app.Unlock();
      }
      for(t = 0; t < numThreads; t++)
      {
         threads[t].terminate = true;
         threads[t].go.Release();
         threads[t].Wait();
      }
      app.Lock();
      if(!terminate)
         fractal.UpdateDepth(Min(depth, iterations), maxDepth);
      app.Unlock();
      return 0;
   }
}

static define numColors = 30000;
static ColorAlpha palette[numColors];

class Fractal : Window
{
   borderStyle = sizable;
   size = Size { 408, 428 };
   hasHorzScroll = true;
   hasVertScroll = true;
   isActiveClient = true;
   hasMaximize = true;
   hasMinimize = true;

   FractalParams params;
   FractalRenderThread thread;

   Point mouse0, mouse1;

   void UpdateDepth(int d, int max)
   {
      params.depthScroll.range = max+1;
      params.depthScroll.thumbPosition = d;
   }

   void Reset()
   {
      if(thread.isJulia)
      {
         thread.range = 3;
         thread.center = Complex { 0, 0 };
      }
      else
      {
         thread.range = 3;
         if(thread.exponent == 2)
            thread.center = { -0.75, 0 }; 
         else
            thread.center = { 0, 0 }; 
      }
      params.UpdateControls();
      Render(true);
   }

   Size imageSize { 400, 400 };
   scrollArea = imageSize;
   Bitmap image {};
   
   bool selecting;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      if(x >= 0 && y >= 0 && x < clientSize.w && y < clientSize.h)
      {
         x -= Max((clientSize.w - imageSize.w) / 2, 0);
         y -= Max((clientSize.h - imageSize.h) / 2, 0);
         x += scroll.x;
         y += scroll.y;
         if(x >= 0 && y >= 0 && x < imageSize.w && y < imageSize.h)
         {
            mouse0 = mouse1 = Point { x, y };
            Update(null);
            Capture();
            selecting = true;
         }
      }
      return true;
   }

   bool OnLeftButtonUp(int x, int y, Modifiers mods)
   {
      if(selecting)
      {
         Complex C0, d, point;
         int w = image.width;
         int h = image.height;
         int dx = Abs(mouse1.x - mouse0.x);
         int dy = Abs(mouse1.y - mouse0.y);

         if(w > h)
         {
            d.a = thread.range;
            d.b = thread.range * h / w;
         }
         else
         {
            d.b = thread.range;
            d.a = thread.range * w / h;
         }

         C0.a = thread.center.a - d.a/2;
         C0.b = thread.center.b - d.b/2;
         point = Complex { (mouse0.x + mouse1.x) / 2.0 * d.a / w + C0.a, (mouse0.y + mouse1.y) / 2.0 * d.b / h + C0.b };

         if(Abs(x - mouse0.x) > 5 && Abs(y - mouse0.y) > 5)
         {
            thread.center = point;

            if(dx > dy)
               thread.range = d.a * dx / w;
            else
               thread.range = d.b * dy / h;

            Render(true);
            params.UpdateControls();
         }
         else if(!thread.isJulia)
         {
            FractalsDesigner designer = (FractalsDesigner) master;

            // Click for Julia
            designer.julia.thread.juliaPoint = point;
            designer.paramsJulia.UpdateControls();
            designer.julia.Render(true);
         }
         ReleaseCapture();
         selecting = false;
         Update(null);
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      Complex C0, d, point;
      int w = image.width;
      int h = image.height;

      x -= Max((clientSize.w - imageSize.w) / 2, 0);
      y -= Max((clientSize.h - imageSize.h) / 2, 0);
      x += scroll.x;
      y += scroll.y;

      if(w > h)
      {
         d.a = thread.range;
         d.b = thread.range * h / w;
      }
      else
      {
         d.b = thread.range;
         d.a = thread.range * w / h;
      }

      C0.a = thread.center.a - d.a/2;
      C0.b = thread.center.b - d.b/2;

      point = Complex { x * d.a / w + C0.a, y * d.b / h + C0.b };

      thread.range *= 1.5;
      thread.center = point;

      Render(true);
      params.UpdateControls();

      ReleaseCapture();
      selecting = false;
      Update(null);
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(selecting)
      {
         x -= Max((clientSize.w - imageSize.w) / 2, 0);
         y -= Max((clientSize.h - imageSize.h) / 2, 0);
         x += scroll.x;
         y += scroll.y;

         mouse1 = Point { x, y };
         Update(null);
      }
      else
      {
         if(mods.ctrl)
            params.depthScroll.thumbPosition = 
                  (int)((double)x / (double)clientSize.w * (double)(params.depthScroll.range - 1));
         if(mods.shift)
            params.loop.thumbPosition = (int)((double)y / (double)clientSize.h * 512);
      }
      return true;
   }

   void ComputeImage()
   {
      if(this && image.picture)
      {
         int w = image.width, h = image.height;
         int x, y;
         float * cbuffer;
         int max;
         int depth;
         ColorAlpha * picture = (ColorAlpha *)image.picture;

         thread.mutex.Wait();

         cbuffer = thread.buffer.pixels;
         depth = thread.depth + 1;

         //max = depth-1;
         max = numColors-1;

         for(y = 0; y<h; y++)
         {
            int bufferPos = y * w;
            for(x = 0; x<w; x++)
            {
               double i = cbuffer[bufferPos+x];
               if(i >= depth-1)
               {
                  *(picture++) = thread.useBlack ? black : palette[numColors - 1];
               }
               else
               {
                  int index;
                  if(thread.doLoop)
                     index = Min((int)(i * thread.numScales), ((int)(thread.maxLoops * numColors)) - 1) % numColors;
                  else
                     index = Min((int)(i * thread.numScales), numColors - 1);
                  if(index < 0) index = 0;
                  *(picture++) = palette[index];
               }
            }
         }
         thread.mutex.Release();
      }
   }

   void OnRedraw(Surface surface)
   {
      JuliaFractal julia = ((FractalsDesigner)master).julia;
      int x = Max((clientSize.w - imageSize.w) / 2, 0);
      int y = Max((clientSize.h - imageSize.h) / 2, 0);
      int w = imageSize.w;
      int h = imageSize.h;
      surface.Blit(image, x, y, scroll.x, scroll.y, image.width, image.height);
      surface.SetForeground(lime);
      if(selecting)
         surface.Rectangle(x+mouse0.x - scroll.x, y+mouse0.y - scroll.y, x+mouse1.x - scroll.x, y+mouse1.y - scroll.y);
      if(!thread.isJulia && julia)
      {
         Complex juliaPoint = julia.thread.juliaPoint;
         Complex C0, d;
         int w = image.width;
         int h = image.height;
         if(w > h)
         {
            d.a = thread.range;
            d.b = thread.range * h / w;
         }
         else
         {
            d.b = thread.range;
            d.a = thread.range * w / h;
         }
         C0.a = thread.center.a - d.a/2;
         C0.b = thread.center.b - d.b/2;

         x += (int)((juliaPoint.a - C0.a) * w / d.a ) - scroll.x;
         y += (int)((juliaPoint.b - C0.b) * h / d.b ) - scroll.y;

         surface.DrawLine(x - 5, y, x + 5, y);
         surface.DrawLine(x, y - 5, x, y + 5);
      }
   }

   void ResetDepth()
   {
      thread.terminate = true;
      app.Unlock();
      thread.Wait();
      app.Lock();
      image.Free();
      thread.depth = 0;
      thread.maxDepth = 0;
   }

   void Render(bool resetDepth)
   {
      thread.terminate = true;
      app.Unlock();
      thread.Wait();
      app.Lock();

      if(resetDepth)
      {
         int width = imageSize.w;
         int height = imageSize.h;
         thread.buffer.Allocate(width, height);
         image.Free();
         image.Allocate(null, width, height, 0, pixelFormat888, false);
         thread.depth = 0;
         thread.maxDepth = 0;
      }
      thread.terminate = false;
      thread.Create();
   }

   bool OnCreate()
   {
      Render(true);
      params.UpdateControls();
      return true;
   }

   void OnDestroy()
   {
      thread.terminate = true;
      app.Unlock();
      thread.Wait();
      app.Lock();
   }

   void OnScroll(ScrollBarAction action, int position, Key key)
   {
      Update(null);
   }

   OnHScroll = OnScroll;
   OnVScroll = OnScroll;

   menu = Menu { };
   Menu fileMenu { parent = menu, "File", f };

   MenuItem exportItem
   {
      fileMenu, "Export Image...", e, ctrlE;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         bool result = false;
         FileDialog exportDialog = ((FractalsDesigner)master).exportDialog;
         exportDialog.SetText("Export %s image", text);
         if(exportDialog.Modal())
         {
            char * ext = exportDialog.types[exportDialog.fileType].typeExtension;
            if(!ext)
            {
               char extension[MAX_EXTENSION];
               GetExtension(exportDialog.filePath, extension);
               if(!extension[0])
               {
                  ext = "jpg";
                  ChangeExtension(exportDialog.filePath, ext, exportDialog.filePath);
               }
            }
            image.Save(exportDialog.filePath, ext, (void *) bool::true);
         }
         return true;
      }
   };

   MenuItem exportItemFiltered
   {
      fileMenu, "Export Image (filtered half)...", f;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         bool result = false;
         FileDialog exportDialog = ((FractalsDesigner)master).exportDialog;
         exportDialog.SetText("Export %s image", text);
         if(exportDialog.Modal())
         {
            char * ext = exportDialog.types[exportDialog.fileType].typeExtension;
            Bitmap filtered { };
            if(!ext)
            {
               char extension[MAX_EXTENSION];
               GetExtension(exportDialog.filePath, extension);
               if(!extension[0])
               {
                  ext = "jpg";
                  ChangeExtension(exportDialog.filePath, ext, exportDialog.filePath);
               }
            }
            if(filtered.Allocate(null, image.width/2, image.height/2, 0, pixelFormat888, false))
            {
               Surface surface = filtered.GetSurface(0,0,null);
               surface.Filter(image, 0,0,0,0, filtered.width, filtered.height, image.width, image.height);
               filtered.Save(exportDialog.filePath, ext, (void *) bool::true);
               delete surface;
            }
            delete filtered;
         }
         return true;
      }
   };
}

class MandelbrotFractal : Fractal
{
   text = "Mandelbrot";
   FractalRenderThread mandelbrotThread { fractal = this, center = { -0.75, 0 }, range = 3 /*, range = 0.049179316033124996, center = { -0.7623287774189061, -0.1281808432395703 }*/ };

   thread = mandelbrotThread;
}

class JuliaFractal : Fractal
{
   text = "Julia";
   FractalRenderThread juliaThread { fractal = this, isJulia = true, range = 3 };
   thread = juliaThread;
}

class FractalParams : Window
{
   text = "Mandelbrot Parameters";
   background = activeBorder;
   borderStyle = fixed;
   tabCycle = true;
   stayOnTop = true;
   size = Size { 206, 506 };

   Fractal fractal;

   Label { labeledWindow = width, parent = this, position = Point { 16, 8 } };
   Label { labeledWindow = height, parent = this, position = Point { 104, 8 } };
   EditBox width
   {
      parent = this, text = "Width", position = Point { 16, 32 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.imageSize.w = atoi(editBox.contents);
         fractal.scrollArea = fractal.imageSize;
         fractal.clientSize = fractal.imageSize;
         fractal.Render(true);
         return true;
      }
   };
   EditBox height
   {
      parent = this, text = "Height", position = Point { 104, 32 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.imageSize.h = atoi(editBox.contents);
         fractal.scrollArea = fractal.imageSize;
         fractal.clientSize = fractal.imageSize;
         fractal.Render(true);
         return true;
      }
   };
   EditBox exponent 
   {
      parent = this, text = "Exponent", position = Point { 16, 88 };

      bool NotifyModified(EditBox editBox)
      {
         FractalsDesigner master = (FractalsDesigner)this.master;

         master.mandelbrot.thread.exponent = master.julia.thread.exponent = atoi(editBox.contents);

         master.paramsJulia.UpdateControls();
         master.julia.Render(true);

         master.paramsMandelbrot.UpdateControls();
         master.mandelbrot.Render(true);
         return true;
      }
   };
   EditBox iterations 
   {
      parent = this, text = "Iterations", position = Point { 104, 88 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.thread.mutex.Wait();
         fractal.thread.iterations = atoi(editBox.contents);
         fractal.thread.depth = fractal.thread.iterations;
         fractal.thread.mutex.Release();
         fractal.Render(false);
         return true;
      }
   };
   ScrollBar depthScroll 
   {
      parent = this, text = "scrollBar1", size = Size { 172, 16 }, position = Point { 16, 120 };

      void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
      {
         if(fractal)
         {
            fractal.thread.depth = position;
            if(action != setRange)
            {
               fractal.ComputeImage();
               fractal.Update(null);
               UpdateDisplay();
            }
            depthLabel.SetText("%d / %d", fractal.thread.depth, scrollBar.range-1);
         }
      }
   };
   EditBox centerX 
   {
      parent = this, text = "X", size = Size { 166, 19 }, position = Point { 16, 192 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.thread.center.a = strtod(editBox.contents, null);
         fractal.Render(true);
         return true;
      }
   };
   EditBox centerY 
   {
      parent = this, text = "Y", size = Size { 166, 19 }, position = Point { 16, 240 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.thread.center.b = strtod(editBox.contents, null);
         fractal.Render(true);
         return true;
      }
   };
   EditBox rangeEdit 
   {
      parent = this, text = "Range", size = Size { 166, 19 }, position = Point { 16, 296 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.thread.range = strtod(editBox.contents, null);
         fractal.Render(true);
         return true;
      }
   };
   Button reset 
   {
      parent = this, text = "Reset", size = Size { 170, 21 }, position = Point { 16, 328 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         fractal.Reset();
         return true;
      }
   };
   Label depthLabel { parent = this, anchor = Anchor { top = 152, right = 16 } };
   Label label1 { labeledWindow = exponent, parent = this, position = Point { 16, 64 } };
   Label label2 { labeledWindow = iterations, parent = this, position = Point { 104, 64 } };
   Label label4 { labeledWindow = rangeEdit, parent = this, position = Point { 16, 272 } };
   Label label5 { labeledWindow = centerY, parent = this, position = Point { 16, 224 } };
   Label label3 { labeledWindow = centerX, parent = this, position = Point { 16, 176 } };

   ScrollBar loop
   {
      this, borderStyle = deep, clientSize = { 124, 18 }, position = { 10, 376 }, range = 5000;
      text = "Period";

      void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
      {
         if(fractal)
         {
            position = Max(position, 1);
            fractal.thread.loop = position;         
            fractal.thread.numScales = numColors / position;

            loopEdit.Clear();
            loopEdit.SetContents("%d", fractal.thread.loop);

            fractal.ComputeImage();
            fractal.Update(null);
            UpdateDisplay();
         }
      }
   };
   Label lblLoop { this, labeledWindow = loop, position = { 10, 356 } };
   EditBox loopEdit
   {
      this, position = { 60, 356 }, size = { 80, 20 };

      bool OnKeyHit(Key key, unichar ch)
      {
         if((SmartKey)key == enter) { Deactivate(); Activate(); }
         return EditBox::OnKeyHit(key, ch);
      }

      bool NotifyModified(EditBox editBox)
      {
         int value = atoi(editBox.contents);
         if(value != loop.thumbPosition)
            loop.thumbPosition = value;
         return true;
      }
   };
   Button loopCheck
   {
      this, checked = true, isCheckbox = true, position = { 110, 406 }, text = "Loop";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         fractal.thread.doLoop = button.checked;
         fractal.ComputeImage();
         fractal.Update(null);
         UpdateDisplay();
         return true;
      }
   };
   Button useBlack
   {
      this, checked = true, isCheckbox = true, position = { 10, 406 }, text = "Black";

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         fractal.thread.useBlack = button.checked;
         fractal.ComputeImage();
         fractal.Update(null);
         UpdateDisplay();
         return true;
      }
   };

   ScrollBar maxLoop
   {
      this, borderStyle = deep, clientSize = { 124, 18 }, position = { 10, 450 }, range = 5000;
      text = "Max Loops";

      void NotifyScrolling(ScrollBar scrollBar, ScrollBarAction action, int position, Key key)
      {
         if(fractal)
         {
            fractal.thread.maxLoops = position;
            maxLoopEdit.Clear();
            maxLoopEdit.SetContents("%.0f", fractal.thread.maxLoops);
            fractal.ComputeImage();
            fractal.Update(null);
            UpdateDisplay();
         }
      }
   };
   Label lblMaxLoop { this, labeledWindow = maxLoop, position = { 10, 430 } };
   EditBox maxLoopEdit
   {
      this, position = { 70, 430 }, size = { 70, 20 };

      bool OnKeyHit(Key key, unichar ch)
      {
         if((SmartKey)key == enter) { Deactivate(); Activate(); }
         return EditBox::OnKeyHit(key, ch);
      }

      bool NotifyModified(EditBox editBox)
      {
         float value = atof(editBox.contents);
         //if(value != maxLoop.thumbPosition)
         {
            //thumbPosition = value;
            fractal.thread.maxLoops = value;
            fractal.ComputeImage();
            fractal.Update(null);
            UpdateDisplay();
         }
         return true;
      }
   };

   virtual void UpdateControls()
   {
      float maxLoops = fractal.thread.maxLoops;

      exponent.SetContents("%d", fractal.thread.exponent);
      iterations.SetContents("%d", fractal.thread.iterations);
      centerX.SetContents("%.20f", fractal.thread.center.a);
      centerY.SetContents("%.20f", fractal.thread.center.b);
      rangeEdit.SetContents("%.20f", fractal.thread.range);
      width.SetContents("%d", fractal.imageSize.w);
      height.SetContents("%d", fractal.imageSize.h);

      loop.thumbPosition = (int)fractal.thread.loop;
      loopEdit.Clear(); loopEdit.SetContents("%d", fractal.thread.loop);
      maxLoop.thumbPosition = (int)fractal.thread.maxLoops;
      fractal.thread.maxLoops = maxLoops;
      maxLoopEdit.Clear(); maxLoopEdit.SetContents("%f", fractal.thread.maxLoops);
      useBlack.checked = fractal.thread.useBlack;
      loopCheck.checked = fractal.thread.doLoop;
   }

   bool OnCreate()
   {
      width.Activate();
      return true;
   }
}

class FractalParamsJulia : FractalParams
{
   text = "Julia Parameters";
   size = Size { 206, 610 };

   EditBox juliaX 
   {
      parent = this, text = "Xj", size = Size { 166, 19 }, position = Point { 16, 504 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.Render(true);
         fractal.thread.juliaPoint.a = strtod(editBox.contents, null);
         return true;
      }
   };
   EditBox juliaY 
   {
      parent = this, text = "Yj", size = Size { 166, 19 }, position = Point { 16, 552 };

      bool NotifyModified(EditBox editBox)
      {
         fractal.Render(true);
         fractal.thread.juliaPoint.b = strtod(editBox.contents, null);
         return true;
      }
   };
   Label label7 { labeledWindow = juliaY, parent = this, position = Point { 16, 528 } };
   Label label6 { labeledWindow = juliaX, parent = this, position = Point { 16, 480 } };

   void UpdateControls()
   {
      FractalParams::UpdateControls();
      juliaX.SetContents("%.20f", fractal.thread.juliaPoint.a);
      juliaY.SetContents("%.20f", fractal.thread.juliaPoint.b);
   }
}

static FileFilter fractalFilters[] =
{
   { "ECERE Fractal Files (*.frc)", "frc" },
   { "All files", null }
};
static FileType fractalTypes[] =
{
   { "ECERE Fractal", "frc", always },
};

static FileFilter imageFilters[] =
{
   {
      "Image Files (*.jpg, *.jpeg, *.bmp, *.pcx, *.png, *.gif)",
      "jpg, jpeg, bmp, pcx, png, gif"
   },
   { "All files", null }
};
static FileType imageTypes[] =
{
   { "Based on extension", null,  always },
   { "JPG Image",          "jpg", always },
   { "BMP Image",          "bmp", always },
   { "PCX Image",          "pcx", always },
   { "PNG Image",          "png", always },
   { "GIF Image",          "gif", always }
};

#define FRC_RECOGNITION { 'e', 'F', 'R', 'C', 11, 12, 3, 0 }
static byte frcRecognition[] = FRC_RECOGNITION;

class FractalsDesigner : Window
{
   text = "Ecere Fractals Explorer";
   background = dimGray;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   hasMenuBar = true;
   menu = Menu {  };
   size = Size { 1000, 600 };
   state = maximized;
   isDocument = true;
   hasHorzScroll = true;
   hasVertScroll = true;

   Menu fileMenu { menu, "File", f };
   MandelbrotFractal mandelbrot { this, position = Point { 10, 10 }, params = paramsMandelbrot };
   FractalParams paramsMandelbrot { this, anchor = Anchor { right = 260, top = 10 }, fractal = mandelbrot };
   JuliaFractal julia { this, position = Point { 420, 10 }, params = paramsJulia };
   FractalParamsJulia paramsJulia { this, anchor = Anchor { right = 10, top = 10 }, fractal = julia };
   GradientDesigner gradientDesigner
   {
      this, anchor = { left = 10, bottom = 10 }, stayOnTop = true;
      void NotifyUpdate()
      {
         PaletteGradient(palette, numColors, gradient.keys._, gradient.keys.size, gradient.smoothness);

         mandelbrot.ComputeImage();
         julia.ComputeImage();
         mandelbrot.Update(null);
         julia.Update(null);
         UpdateDisplay();
      }
   };
   bool LoadFractals(char * fileName)
   {
      File f = FileOpen(fileName, read);
      if(f)
      {
         static byte frcRead[8];
         mandelbrot.ResetDepth();
         julia.ResetDepth();

         // First attempt to treat this as an archive file
         if(f.Read(frcRead, sizeof(frcRead), 1) == 1 &&
            !strncmp(frcRead, frcRecognition, sizeof(frcRecognition)))
         {
            TempFile bufferZ;

            mandelbrot.thread.terminate = true;
            julia.thread.terminate = true;
            app.Unlock();
            mandelbrot.thread.Wait();
            julia.thread.Wait();
            app.Lock();

            // New binary format
            f.Get(mandelbrot.imageSize);
            f.Get(mandelbrot.thread.exponent);
            f.Get(mandelbrot.thread.iterations);
            f.Get(mandelbrot.thread.center);
            f.Get(mandelbrot.thread.range);
            f.Get(mandelbrot.thread.depth);
            f.Get(mandelbrot.thread.maxDepth);
            f.Get(bufferZ);
            mandelbrot.thread.buffer.Allocate(mandelbrot.imageSize.w, mandelbrot.imageSize.h);
            if(bufferZ)
            {
               bufferZ.Read(mandelbrot.thread.buffer.z, sizeof(Complex), mandelbrot.thread.buffer.width * mandelbrot.thread.buffer.height);
               bufferZ.Read(mandelbrot.thread.buffer.pixels, sizeof(float), mandelbrot.thread.buffer.width * mandelbrot.thread.buffer.height);
            }
            delete bufferZ;

            f.Get(julia.imageSize);
            f.Get(julia.thread.exponent);
            f.Get(julia.thread.iterations);
            f.Get(julia.thread.center);
            f.Get(julia.thread.range);
            f.Get(julia.thread.depth);
            f.Get(julia.thread.maxDepth);
            //julia.thread.iterations = julia.thread.maxDepth;
            f.Get(bufferZ);
            julia.thread.buffer.Allocate(julia.imageSize.w, julia.imageSize.h);
            if(bufferZ)
            {
               bufferZ.Read(julia.thread.buffer.z, sizeof(Complex), julia.thread.buffer.width * julia.thread.buffer.height);
               bufferZ.Read(julia.thread.buffer.pixels, sizeof(float), julia.thread.buffer.width * julia.thread.buffer.height);
            }
            delete bufferZ;

            f.Get(julia.thread.juliaPoint);

            f.Get(gradient.smoothness);
            {
               int size;
               f.Get(size);
               if(size)
               {
                  gradient.keys.size = size;
                  f.Read(gradient.keys._, sizeof(ColorKey), gradient.keys.size);
               }
            }
            {
               int loop = 0;
               f.Get(loop);
               if(loop)
               {
                  mandelbrot.thread.loop = loop;
                  f.Get(mandelbrot.thread.maxLoops);
                  if(mandelbrot.thread.maxLoops < 0.00001) mandelbrot.thread.maxLoops = 4999;
                  f.Get(mandelbrot.thread.useBlack);
                  f.Get(mandelbrot.thread.doLoop);
               }
               loop = 0;
               f.Get(loop);
               if(loop)
               {
                  julia.thread.loop = loop;
                  f.Get(julia.thread.maxLoops);
                  if(julia.thread.maxLoops < 0.00001) julia.thread.maxLoops = 4999;
                  f.Get(julia.thread.useBlack);
                  f.Get(julia.thread.doLoop);
               }
               else
               {
                  julia.thread.loop = mandelbrot.thread.loop;
                  julia.thread.maxLoops = mandelbrot.thread.maxLoops;
                  julia.thread.useBlack = mandelbrot.thread.useBlack;
                  julia.thread.doLoop = mandelbrot.thread.doLoop;
               }
            }

            gradientDesigner.UpdateHandles();

            mandelbrot.clientSize = mandelbrot.imageSize;
            julia.clientSize = julia.imageSize;

            mandelbrot.params.UpdateControls();
            julia.params.UpdateControls();

            mandelbrot.image.Free();
            mandelbrot.image.Allocate(null, mandelbrot.imageSize.w, mandelbrot.imageSize.h, 0, pixelFormat888, false);
            mandelbrot.ComputeImage();

            julia.image.Free();
            julia.image.Allocate(null, julia.imageSize.w, julia.imageSize.h, 0, pixelFormat888, false);
            julia.ComputeImage();

            julia.thread.terminate = false;
            julia.thread.Create();

            mandelbrot.thread.terminate = false;
            mandelbrot.thread.Create();
         }
         else
         {
            // Old ASCII Format
            f.Seek(0, start);

            mandelbrot.imageSize.w = f.GetValue();
            mandelbrot.imageSize.h = f.GetValue();
            mandelbrot.thread.exponent = f.GetValue();
            mandelbrot.thread.iterations = f.GetValue();
            mandelbrot.thread.center.a = f.GetDouble();
            mandelbrot.thread.center.b = f.GetDouble();
            mandelbrot.thread.range = f.GetDouble();

            julia.imageSize.w = f.GetValue();
            julia.imageSize.h = f.GetValue();
            julia.thread.exponent = f.GetValue();
            julia.thread.iterations = f.GetValue();
            julia.thread.center.a = f.GetDouble();
            julia.thread.center.b = f.GetDouble();
            julia.thread.range = f.GetDouble();

            julia.thread.juliaPoint.a = f.GetDouble();
            julia.thread.juliaPoint.b = f.GetDouble();

            {
               int size = f.GetValue();
               if(size)
               {
                  int c;
                  gradient.keys.size = size;
                  for(c = 0; c < gradient.keys.size; c++)
                  {
                     gradient.keys._[c].percent = f.GetFloat();
                     gradient.keys._[c].color.a = 255;
                     gradient.keys._[c].color.color.r = (byte)f.GetValue();
                     gradient.keys._[c].color.color.g = (byte)f.GetValue();
                     gradient.keys._[c].color.color.b = (byte)f.GetValue();
                  }
                  gradient.smoothness = f.GetFloat();
                  {
                     int loop = 0;
                     loop = f.GetValue();
                     if(loop)
                     {
                        mandelbrot.thread.loop = loop;
                        mandelbrot.thread.maxLoops = f.GetFloat();
                        mandelbrot.thread.useBlack = f.GetValue();
                        mandelbrot.thread.doLoop = f.GetValue();
                     }
                     loop = f.GetValue();
                     if(loop)
                     {
                        julia.thread.loop = loop;
                        julia.thread.maxLoops = f.GetFloat();
                        julia.thread.useBlack = f.GetValue();
                        julia.thread.doLoop = f.GetValue();
                     }
                     else
                     {
                        julia.thread.loop = mandelbrot.thread.loop;
                        julia.thread.maxLoops = mandelbrot.thread.maxLoops;
                        julia.thread.useBlack = mandelbrot.thread.useBlack;
                        julia.thread.doLoop = mandelbrot.thread.doLoop;
                     }
                  }
               }
            }

            gradientDesigner.UpdateHandles();

            paramsJulia.UpdateControls();
            paramsMandelbrot.UpdateControls();

            julia.scrollArea = julia.imageSize;
            julia.clientSize = julia.imageSize;

            mandelbrot.scrollArea = mandelbrot.imageSize;
            mandelbrot.clientSize = mandelbrot.imageSize;

            julia.Render(true);
            mandelbrot.Render(true);
         }
         delete f;

         this.fileName = fileName;
         return true;
      }
      return false;
   }
   MenuItem openItem
   {
      fileMenu, "Open", o, ctrlO;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         if(openDialog.Modal() == ok)
         {
            if(LoadFractals(openDialog.filePath))
            {
            }
         }
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuPlacement { fileMenu, "Export Image...", e };
   MenuPlacement { fileMenu, "Export Image (filtered half)...", f };
   MenuDivider { fileMenu };
   MenuItem saveItemData
   {
      fileMenu, "Save (with data)";
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         return MenuFileSave(selection, mods);
      }
   };
   MenuItem saveItemAsData
   {
      fileMenu, "Save As (with data)...";
      
      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         return MenuFileSaveAs(selection, mods);
      }
   };
   MenuDivider { fileMenu };
   MenuItem saveItem
   {
      fileMenu, "Save", s, ctrlS;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         saveASCII = true;
         MenuFileSave(selection, mods);
         saveASCII = false;
         return true;
      }
   };
   MenuItem saveItemAs
   {
      fileMenu, "Save As...", a;

      bool NotifySelect(MenuItem selection, Modifiers mods)
      {
         saveASCII = true;
         MenuFileSaveAs(selection, mods);
         saveASCII = false;
         return true;
      }
   };
   MenuDivider { fileMenu };
   MenuItem exitItem { fileMenu, "Exit", x, altF4, NotifySelect = MenuFileExit };

   FileDialog exportDialog
   {
      master = this, type = save,
      filters = imageFilters, sizeFilters = sizeof(imageFilters),
      types = imageTypes, sizeTypes = sizeof(imageTypes)
   };
   FileDialog mySaveDialog
   {
      master = this, type = save, text = "Save Fractals Settings...",
      types = fractalTypes, sizeTypes = sizeof(fractalTypes), filters = fractalFilters, sizeFilters = sizeof(fractalFilters)
   };
   
   FileDialog openDialog
   {
      master = this, type = open, text = "Load Fractals Settings...",
      types = fractalTypes, sizeTypes = sizeof(fractalTypes), filters = fractalFilters, sizeFilters = sizeof(fractalFilters)
   };
   bool saveASCII;

   saveDialog = mySaveDialog;
   
   bool OnSaveFile(char * fileName)
   {
      File f = FileOpen(fileName, write);
      if(f)
      {
         if(!saveASCII)
         {
            TempFile bufferZ { };
            f.Write(frcRecognition, sizeof(frcRecognition), 1);
            f.Put(mandelbrot.imageSize);
            f.Put(mandelbrot.thread.exponent);
            f.Put(mandelbrot.thread.iterations);
            f.Put(mandelbrot.thread.center);
            f.Put(mandelbrot.thread.range);
            f.Put(mandelbrot.thread.depth);
            f.Put(mandelbrot.thread.maxDepth);

            bufferZ.Write(mandelbrot.thread.buffer.z, sizeof(Complex), mandelbrot.thread.buffer.width * mandelbrot.thread.buffer.height);
            bufferZ.Write(mandelbrot.thread.buffer.pixels, sizeof(float), mandelbrot.thread.buffer.width * mandelbrot.thread.buffer.height);
            f.Put(bufferZ);
            bufferZ.Truncate(0);
            bufferZ.Seek(0, start);

            f.Put(julia.imageSize);
            f.Put(julia.thread.exponent);
            f.Put(julia.thread.iterations);
            f.Put(julia.thread.center);
            f.Put(julia.thread.range);
            f.Put(julia.thread.depth);
            f.Put(julia.thread.maxDepth);

            bufferZ.Write(julia.thread.buffer.z, sizeof(Complex), julia.thread.buffer.width * julia.thread.buffer.height);
            bufferZ.Write(julia.thread.buffer.pixels, sizeof(float), julia.thread.buffer.width * julia.thread.buffer.height);
            f.Put(bufferZ);

            f.Put(julia.thread.juliaPoint);

            f.Put(gradient.smoothness);
            { int size = gradient.keys.size; f.Put(size); }
            f.Write(gradient.keys._, sizeof(ColorKey), gradient.keys.size);

            f.Put(mandelbrot.thread.loop);
            f.Put(mandelbrot.thread.maxLoops);
            f.Put(mandelbrot.thread.useBlack);
            f.Put(mandelbrot.thread.doLoop);

            f.Put(julia.thread.loop);
            f.Put(julia.thread.maxLoops);
            f.Put(julia.thread.useBlack);
            f.Put(julia.thread.doLoop);

            delete bufferZ;
         }
         else
         {
            int c;
            f.Printf("%d\n",  mandelbrot.imageSize.w);
            f.Printf("%d\n",  mandelbrot.imageSize.h);
            f.Printf("%d\n",  mandelbrot.thread.exponent);
            f.Printf("%d\n",  mandelbrot.thread.iterations);
            f.Printf("%.20f\n",  mandelbrot.thread.center.a);
            f.Printf("%.20f\n",  mandelbrot.thread.center.b);
            f.Printf("%.20f\n",  mandelbrot.thread.range);

            f.Printf("%d\n",  julia.imageSize.w);
            f.Printf("%d\n",  julia.imageSize.h);
            f.Printf("%d\n",  julia.thread.exponent);
            f.Printf("%d\n",  julia.thread.iterations);
            f.Printf("%.20f\n",  julia.thread.center.a);
            f.Printf("%.20f\n",  julia.thread.center.b);
            f.Printf("%.20f\n",  julia.thread.range);

            f.Printf("%.20f\n",  julia.thread.juliaPoint.a);
            f.Printf("%.20f\n",  julia.thread.juliaPoint.b);

            f.Printf("%d\n", gradient.keys.size);
            for(c = 0; c < gradient.keys.size; c++)
            {
               f.Printf("%.20f\n", gradient.keys._[c].percent);
               f.Printf("%d\n", gradient.keys._[c].color.color.r);
               f.Printf("%d\n", gradient.keys._[c].color.color.g);
               f.Printf("%d\n", gradient.keys._[c].color.color.b);
            }
            f.Printf("%.20f\n", gradient.smoothness);

            f.Printf("%d\n", mandelbrot.thread.loop);
            f.Printf("%.20f\n", mandelbrot.thread.maxLoops);
            f.Printf("%d\n", mandelbrot.thread.useBlack);
            f.Printf("%d\n", mandelbrot.thread.doLoop);

            f.Printf("%d\n", julia.thread.loop);
            f.Printf("%.20f\n", julia.thread.maxLoops);
            f.Printf("%d\n", julia.thread.useBlack);
            f.Printf("%d\n", julia.thread.doLoop);
         }
         delete f;
      }           
      return true;
   }

   bool OnPostCreate()
   {
      if(app.argc > 1)
         LoadFractals(app.argv[1]);
      mandelbrot.Activate();
      return true;
   }
}

FractalsDesigner fractalsDesigner { };
