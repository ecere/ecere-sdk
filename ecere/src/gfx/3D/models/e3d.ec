import "e3dRead"
import "e3dWrite"

public class E3DFormat : ObjectFormat
{
   class_property(extension) = "e3d";

   static bool Load(Object object, const char * fileName, DisplaySystem displaySystem, void * options)
   {
      File f = FileOpen(fileName, read);
      if(f)
      {
         readE3D(f, fileName, object, displaySystem, options);
         delete f;
         return true;
      }
      return false;
   }

   bool Save(Object object, const char * fileName, void * options)
   {
      File f = FileOpen(fileName, write);
      if(f)
      {
         E3DWriteContext ctx { }; //, texturesByID = options.texturesByID };

         StripLastDirectory(fileName, ctx.path);

         writeE3D(f, object, ctx);

         delete ctx;
         delete f;
         return true;
      }
      return false;
   }

   static Array<String> listTextures(File modelFile, const String fileName, E3DOptions options)
   {
      Array<String> textures { };
      char path[MAX_LOCATION];
      E3DContext ctx { path = path };

      if(options != null)
      {
         ctx.texturesByID = options.texturesByID;
         ctx.materials = options.materials;
         ctx.texturesQuery = options.texturesQuery;
         ctx.positiveYUp = options.positiveYUp;
         ctx.resolution = options.resolution;
         ctx.compressedTextures = options.compressedTextures;
         ctx.skipTexturesProcessing = options.skipTexturesProcessing;
      }
      else
         ctx.texturesByID = { };

      if(fileName)
         StripLastDirectory(fileName, path);
      else
         path[0] = 0;
      listTexturesReadBlocks(ctx, modelFile, 0, 0, modelFile.GetSize(), null, textures);

      delete ctx;

      return textures;
   }
};
