namespace gfx;

import "Mutex"
import "Display"

String printingDocumentName;

public void SetPrintingDocumentName(String name)
{
   printingDocumentName = name;
}

public class DisplaySystemResPtr : struct
{
   DisplaySystemResPtr prev, next;
   Resource resource;
};

#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
static void FreeTexture(NamedLink texture)
{
   Bitmap bitmap = texture.data;
   bitmap.Free();
   delete bitmap;
   delete texture.name;
}

static void FreeMaterial(Material material)
{
   delete material.name;
}
#endif

public class DisplaySystem
{
public:
   class_no_expansion;
   ~DisplaySystem()
   {
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
      OldLink mesh;

      materials.Free(Material::Free);
      textures.Free(FreeTexture);
      for(mesh = meshes.first; mesh; mesh = mesh.next)
         ((Mesh)mesh.data).Free(0);
      meshes.Free(null);
#endif

      if(driverData)
         driver.DestroyDisplaySystem(this);

      if(driver.displaySystem == this)
         driver.displaySystem = null;
   }

   bool Create(char * driverName, void * window, bool fullScreen)
   {
      bool result = false;
      subclass(DisplayDriver) displayDriver = GetDisplayDriver(driverName);
      if(displayDriver)
      {
         flags.fullScreen = fullScreen;
         this.window = window;
         if(displayDriver.CreateDisplaySystem(this))
            result = true;

         driver = displayDriver;
         if(!result)
         {
            // LogErrorCode(GERR_DISPLAY_INIT_FAILED, driver);
            displayDriver.displaySystem = null;
         }
         else if(!displayDriver.displaySystem)
         {
            displayDriver.displaySystem = this;
         }
      }
      return result;
   }

   Font LoadFont(char * faceName, float size, FontFlags flags)
   {
      Font result = null;
      subclass(DisplayDriver) driver = this ? this.driver : ((subclass(DisplayDriver))class(LFBDisplayDriver));
      char * string = CopyString(faceName);
      char *fonts[32];
      if(string)
      {
         int numFonts = TokenizeWith(string, 32, fonts, ",", true);
         int c;
         for(c = 0; c<numFonts; c++)
         {
            TrimLSpaces(fonts[c],fonts[c]);
            TrimRSpaces(fonts[c],fonts[c]);
            if((result = driver.LoadFont(this, fonts[c], size, flags)))
            {
               break;
            }
         }
         delete string;
      }
      return result;
   }

   void UnloadFont(Font font)
   {
      subclass(DisplayDriver) driver = this ? this.driver : ((subclass(DisplayDriver))class(LFBDisplayDriver));
      driver.UnloadFont(this, font);
   }

   void FontExtent(Font font, byte * text, int len, int * width, int * height)
   {
      if(this && text)
         driver.FontExtent(this, font, text, len, width, height);
      else
      {
         if(width) *width = 0;
         if(height) *height = 0;
      }
   }

   void * LoadResource(Resource resource)
   {
      DisplaySystemResPtr res;
      for(res = resources.first; res; res = res.next)
      {
         Resource existing = res.resource;

         if(existing._class == resource._class)
         {
            if(resource.OnCompare(existing) == 0)
               break;
         }
      }
      if(!res)
      {
         // res = DisplaySystemResPtr { resource = new classof(resource) };
         res = DisplaySystemResPtr { resource = eInstance_New(resource._class) };
         resources.Add(res);

         // This will load e.g. the Bitmap *
         res.resource.Load(resource, this);
      }
      // This would copy e.g. the Bitmap *
      incref res.resource;
      resource.Reference(res.resource);

      return res;
   }

   void UnloadResource(Resource resource, DisplaySystemResPtr res)
   {
      // This would clear e.g. the Bitmap *
      resource.Dereference();
      if(res)
      {
         if(res.resource._refCount == 1)
         {
            delete res.resource;
            resources.Delete(res);
         }
         else
            res.resource._refCount--;
      }
   }

   bool Lock()
   {
      bool result = false;
      mutex.Wait();

      if(!current)
         result = driver.LockSystem(this);
      else
         result = true;
      current++;
      return result;
   }

   void Unlock(void)
   {
      current--;
      if(!current)
         driver.UnlockSystem(this);

      mutex.Release();
   }
#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
   // --- Materials List Management ---

   Material AddNamedMaterial(char * name)
   {
      Material material = materials.FindName(name, false);
      if(!material)
      {
         material = Material { };
         if(material)
         {
            material.name = CopyString(name);
            if(name)
               materials.AddName(material);
            else
               materials.Add(material);
         }
      }
      return material;
   }

   bool AddMaterial(Material material)
   {
      if(material.name)
         materials.AddName(material);
      else
         materials.Add(material);
      return true;
   }

   Material GetMaterial(char * name)
   {
      return materials.FindName(name, false);
   }

   bool RemoveMaterial(Material material)
   {
      delete material.name;
      materials.Delete(material);
      return true;
   }

   void ClearMaterials()
   {
      materials.Free(FreeMaterial);
   }

   // --- Textures List Management ---

   NamedLink AddTexture(char * name, Bitmap bitmap)
   {
      NamedLink item { };
      if(item)
      {
         item.data = bitmap;
         item.name = new char[strlen(name) + 1];
         strcpy(item.name, name);
         textures.AddName(item);
      }
      return item;
   }

   Bitmap GetTexture(char * name)
   {
      return textures.FindNamedLink(name, false);
   }

   bool RemoveTexture(char * name)
   {
      NamedLink item = textures.FindName(name, false);
      if(item)
      {
         FreeTexture(item);
         textures.Delete(item);
         return true;
      }
      return false;
   }

   void ClearTextures()
   {
      textures.Free(FreeTexture);
   }

   // --- Meshes List Management ---

   OldLink AddMesh(Mesh mesh)
   {
      if(this)
      {
         OldLink item { };
         if(item)
         {
            item.data = mesh;
            mesh.displaySystem = this;
            meshes.Add(item);
         }
         return item;
      }
      return null;
   }

   bool RemoveMesh(Mesh mesh)
   {
      OldLink item = meshes.FindLink(mesh);
      if(item)
      {
         mesh.Free(0);
         meshes.Delete(item);
         return true;
      }
      return false;
   }

   void ClearMeshes()
   {
      OldLink mesh;
      for(mesh = meshes.first; mesh; mesh = mesh.next)
         ((Mesh)mesh.data).Free(0);
      meshes.Free(null);
   }
#endif

private:
   subclass(DisplayDriver) driver;
   void * data;
   void * window;
   public PixelFormat pixelFormat;
   public DisplayFlags flags;
   int numDisplays;

   OldList resources;

#if !defined(ECERE_VANILLA) && !defined(ECERE_NO3D)
   // This will all go in resources
   OldList materials;
   OldList textures;
   OldList meshes;
#endif

   void * driverData;
   int current;
   Mutex mutex { };
};
