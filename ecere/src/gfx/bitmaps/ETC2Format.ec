namespace gfx::bitmaps;

import "Bitmap"

#ifdef ETC2_COMPRESS

static const char * extensions[] = { "etc2", null };

default extern void * etc2Compress(float * pixelData, unsigned int width, unsigned int height,
   unsigned int * size, unsigned int * dw, unsigned int * dh);
default extern void etc2Free(void * data);
default extern void * etc2Alloc(size_t size);

class ETCFormat : BitmapFormat
{
   class_property(extensions) = extensions;

   bool Load(Bitmap bitmap, File f)
   {
      bool result = false;
      int count;
      int i;

      f.Read(&count, sizeof(count), 1);
      bitmap.pixelFormat = pixelFormatETC2RGBA8;
      bitmap.numMipMaps = count > 1 ? count : 0;
      if(bitmap.numMipMaps)
      {
         bitmap.bitmaps = new0 Bitmap[bitmap.numMipMaps];
         bitmap.mipMaps = true;
      }
      for(i = 0; i < count; i++)
      {
         Bitmap mipMap = bitmap;
         if(count > 1)
            bitmap.bitmaps[i] = mipMap = { pixelFormat = pixelFormatETC2RGBA8 };
         f.Read(&mipMap.width, sizeof(mipMap.width), 1);
         f.Read(&mipMap.height, sizeof(mipMap.height), 1);
         f.Read(&mipMap.sizeBytes, sizeof(mipMap.sizeBytes), 1);
         mipMap.picture = etc2Alloc(mipMap.sizeBytes);
         f.Read(mipMap.picture, 1, mipMap.sizeBytes);
      }
      result = true;
      return result;
   }

   bool Save(Bitmap bitmap, const char * fileName, void * options)
   {
      bool result = false;
      Bitmap bmp = bitmap;
      File f = FileOpen(fileName, write);

      if(bitmap.pixelFormat != pixelFormatETC2RGBA8)
         bmp = bitmap.ProcessDD(true, 0, true, 16384, true);

      if(f)
      {
         int count = bitmap.numMipMaps;
         int i;

         if(!count) count = 1;

         f.Write(&count, sizeof(count), 1);
         for(i = 0; i < count; i++)
         {
            Bitmap mipMap = bmp.mipMaps && bmp.bitmaps ? bmp.bitmaps[i] : bmp;

            f.Write(&mipMap.width, sizeof(mipMap.width), 1);
            f.Write(&mipMap.height, sizeof(mipMap.height), 1);
            f.Write(&mipMap.sizeBytes, sizeof(mipMap.sizeBytes), 1);
            f.Write(mipMap.picture, 1, mipMap.sizeBytes);
         }
         delete f;
         result = true;
      }

      if(bmp != bitmap)
         delete bmp;
      return result;
   }
}

#endif
