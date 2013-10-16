import "fli.ec"

class FliPlay : Window
{
   Bitmap temp {};
   Bitmap image {};
   Fli animation {};
   Timer timer
   {
      this;

      bool DelayExpired()
      {
         Surface surface;

         animation.PlayFrame(image);

         surface = temp.GetSurface(0,0,null);
         /*
         if(surface)
            surface.Stretch(image, 0,0,0,0, temp.width, temp.height, image.width, image.height);
         */
         if(surface)
            surface.Blit(image, 0,0,0,0, image.width, image.height);
         delete surface;

         if(animation.frame >= animation.numFrames)
            //Destroy(0);
            animation.frame = 0;

         Update(null);
         return true;
      }
   };

   property char * animation
   {
      set
      {
         timer.Stop();
         if(!(animation.Load(value)))
            Logf("Couldn't load animation %s.\n", value);
         else
         {
            image.Allocate(null, animation.width, animation.height, 0, pixelFormat8, true);
            temp.Allocate(null, animation.width, animation.height, 0, pixelFormat888, true);
            if(image)
            {
               animation.PlayFrame(image);
               timer.delay = animation.speed;
               timer.Start();

            }
         }

      }
   }

   /*
   void OnResize(int w, int h)
   {
      Surface surface;
      temp.Free();
      // temp.Allocate(null, w, h, 0, PixelFormatRGBA, false);
      temp.Allocate(null, w, h, 0, PixelFormat888, false);
      surface = temp.GetSurface(0,0,null);
      surface.Stretch(image, 0,0,0,0, temp.width, temp.height,
         image.width, image.height);
      delete surface;
   }
   */

   void OnRedraw(Surface surface)
   {
      if(animation.palUpdate)
      {
         display.SetPalette(animation.palette, false);
         animation.palUpdate = false;
      }
      //surface.Blit(temp, 0,0,0,0,temp.width,temp.height);
      // surface.Blit(image, 0,0,0,0,image.width,image.height);
      surface.Stretch(temp, 0,0,0,0, clientSize.w, clientSize.h, temp.width,temp.height);

      //surface.Stretch(image, 0,0,0,0, clientSize.w, clientSize.h, image.width,image.height);
   }

   void OnDestroy()
   {
      image.Free();
      temp.Free();
   }

   bool OnKeyDown(Key key, unichar ch)
   {
      if(key == escape)
         Destroy(0);
      return true;
   }
}
