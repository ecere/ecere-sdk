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
         char s[1024];
         sprintf(s, "File://%08X", scannedImage);
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
         Bitmap scanned;
         File f;
         if(!scanner)
            scanner = GetScanner(true);
         if(scanner && (scanned = scanner.GetBitmap(&f)))
         {
            delete scannedBitmap;
            delete scannedImage;

            scannedImage = f;            
            scannedBitmap = scanned;

            SetImage();
         }
         return true;
      }
   };
}

ScanningTest mainForm {};
