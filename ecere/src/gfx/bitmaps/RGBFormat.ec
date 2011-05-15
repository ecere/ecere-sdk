namespace gfx::bitmaps;

import "Display"

static char * extensions[] = { "rgb", null };

class RGBFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      return false;
   }

   bool Save(Bitmap bitmap, char * filename, void * options)
   {
      return false;
   }

   ColorAlpha * LoadPalette(char * fileName, char * type)
   {
      ColorAlpha * result = null;
      File f = FileOpen(fileName, read);
      if(f)
      {
         byte palette[768];
         if(f.Read(palette, 768, 1))
         {
            if((result = new ColorAlpha[256]))
            {
               int c;
               for(c = 0; c<256; c++)
                  result[c] = ColorAlpha { 255, { palette[c*3]<<2, palette[c*3+1]<<2, palette[c*3+2]<<2 } };
            }
         }
         delete f;
      }
      return result;
   }
}
