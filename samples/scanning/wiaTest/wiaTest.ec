import "wia"

class ScanningTest : Window
{
   text = "WIA Scanning Test";
   background = activeBorder;
   borderStyle = fixed;
   hasMinimize = true;
   hasClose = true;
   size = { 360, 500 };

   File scannedImage;
   Bitmap scannedBitmap;

   WiaItem scanner;

   ~ScanningTest()
   {
      delete scannedImage;
      delete scannedBitmap;
   }

   void SetImage()
   {
      Bitmap bmp;
      if(scannedImage)
      {
         char s[20];
         sprintf(s, "File://%p", scannedImage);
         imagePreview.image = { s };
      }
      else
         imagePreview.image = null;

      bmp = imagePreview.image.bitmap;
      if(bmp)
      {
         float ratio = (float)bmp.height / bmp.width;
         if(ratio > 424.0f / 320.0f)
         {
            int w = 424 * bmp.width / bmp.height;
            imagePreview.size = { w, 424 };
         }
         else
         {
            int h = 320 * bmp.height / bmp.width;
            imagePreview.size = { 320, h };
         }
      }
   }

   bool OnPostCreate()
   {
      SetImage();
      scanner = GetScanner(true);
      return true;
   }

   void OnDestroy()
   {
      delete scanner;
   }
   Picture imagePreview { this, text = "Image Preview", borderStyle = deep, size = { 320, 424 }, anchor = { right = 16, top = 16 } };
   Button scan
   {
      this, text = "Scan", size = { 60, 21 }, anchor = { bottom = 8 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         List<Bitmap> scanned;
         if(!scanner)
            scanner = GetScanner(true);
         if(scanner && (scanned = scanner.GetBitmaps()))
         {
            delete scannedBitmap;
            delete scannedImage; // Delete the previous image file if any

            for(i : scanned)
            {
               // Here 'i' is a Bitmap that we could just display ourselves, but we use a pseudo file so we can use the
               // Picture control which works with a BitmapResource (which needs a file name)
               char s[20];
               scannedImage = TempFile { };
               scannedBitmap = i;

               sprintf(s, "File://%p", scannedImage);  // 'File://' lets you use a File pointer as a file name
               i.Save(s, "bmp", null);

               // Take it out of the list because we free the other images (if any), but keep this one in 'scannedBitmap'
               scanned.TakeOut(scannedBitmap);
               // Just use 1 image
               break;
            }
            scanned.Free();
            delete scanned;

            SetImage();
         }
         return true;
      }
   };
}

ScanningTest mainForm {};
