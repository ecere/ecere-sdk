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
      }
      return true;
   }

   bool Save(Object object, const char * fileName, void * options)
   {
      File f = FileOpen(fileName, write);
      if(f)
      {
         //char path[MAX_LOCATION];
         // E3DContext ctx { path = path, texturesByID = options.texturesByID };
         StripLastDirectory(fileName, e3dModelsPath);

         writeE3D(f, /*fileName, */object/*, options*/);
         delete f;
      }
      return true;
   }
};
