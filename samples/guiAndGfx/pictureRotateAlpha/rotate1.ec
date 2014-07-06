public import "ecere"

class SimplePlane : Object
{
   void Create(DisplaySystem displaySystem)
   {
      PrimitiveGroup group;
      InitializeMesh(displaySystem);

      mesh.Allocate( { vertices = true, texCoords1 = true, normals = true }, 4, displaySystem);
      group = mesh.AddPrimitiveGroup({ vertexRange = true, primitiveType = quads }, 0);
      group.first = 0;
      group.nVertices = 4;
      mesh.LockPrimitiveGroup(group);
      mesh.vertices[0] = { -0.5f, 0, -.5f };
      mesh.vertices[1] = { -0.5f, 0, .5f };
      mesh.vertices[2] = {  0.5f, 0, .5f };
      mesh.vertices[3] = {  0.5f, 0, -.5f };
      mesh.texCoords[3] = { 1, 1 };
      mesh.texCoords[2] = { 1, 0 };
      mesh.texCoords[1] = { 0, 0 };
      mesh.texCoords[0] = { 0, 1 };
      mesh.normals[0] = { 0, 1, 0 };
      mesh.normals[1] = { 0, 1, 0 };
      mesh.normals[2] = { 0, 1, 0 };
      mesh.normals[3] = { 0, 1, 0 };
      mesh.UnlockPrimitiveGroup(group);
      mesh.Unlock(0);
      SetMinMaxRadius(true);
      UpdateTransform();
   }
}

public class PictureRotate : Window
{
   Degrees angle;
   double zoom;
   BitmapResource image;
   opacity = 0;
   zoom = 1;
   public property BitmapResource image
   {
      set
      {
         delete image;
         AddResource(value);
         RemoveResource(image);
         image = value;
         material.baseMap = image ? image.bitmap : null;
         material.opacity = 0.5f;
         material.flags.translucent = true;
         Update(null);
      }
   }
   public property Degrees angle
   {
      set
      {
         angle = value;
         plane.transform.orientation = Euler { angle, 0, 0 };
         plane.UpdateTransform();
         Update(null);
      }
      get { return angle; }
   }

   public property double zoom
   {
      set
      {
         zoom = value;
         Update(null);
         size = initSize;
      }
      get { return zoom; }
   }

   Camera camera
   {
      type = fixed;
      position = { 0, -275, 0 };
      zMin = 0.1f,
      orientation = Euler { 0, 90, 0 };
   };

   bool OnLoadGraphics()
   {
      int w, h;
      Mesh mesh;
      material.baseMap = image.bitmap;
      plane.Create(displaySystem);
      plane.transform.scaling = { 1, 1, 1 };

      // plane.transform.scaling = { image.bitmap.width, 1.5f, image.bitmap.height };
      //plane.transform.scaling = { Max(image.bitmap.width, image.bitmap.height), 1.5f, Max(image.bitmap.width, image.bitmap.height) };
      //camera.aspectRatio = 1.0f;
      if(!image.bitmap) return false;
      w = image.bitmap.width;
      h = image.bitmap.height;
      camera.position.y = -Max(image.bitmap.height, image.bitmap.height) / sqrt(2);

      plane.UpdateTransform();

      mesh = plane.mesh;
      mesh.Lock(0);
      mesh.vertices[0] = { -w/2.0f, 0, -h/2.0f };
      mesh.vertices[1] = { -w/2.0f, 0, h/2.0f };
      mesh.vertices[2] = {  w/2.0f, 0, h/2.0f };
      mesh.vertices[3] = {  w/2.0f, 0, -h/2.0f };
      mesh.Unlock(0);

      plane.mesh.ApplyMaterial(material);
      plane.mesh.ApplyTranslucency(plane);
      size = initSize;
      return true;
   }

   bool OnResizing(int * w, int * h)
   {
      Size size = initSize;
      Anchor anchor = this.anchor;
      if(image && image.bitmap)
      {
         Bitmap bitmap = image.bitmap;
         double m = Max(bitmap.width, bitmap.height) * zoom * sqrt(2);
         if(!size.w && (!anchor.left.type || !anchor.right.type))
            *w = (int)m;
         if(!size.h && (!anchor.top.type || !anchor.bottom.type))
            *h = (int)m;
      }
      else
      {
         if(!size.w && (!anchor.left.type || !anchor.right.type))
            *w = 80;
         if(!size.h && (!anchor.top.type || !anchor.bottom.type))
            *h = 80;
      }
      return true;
   }

   void OnResize(int width, int height)
   {
      camera.Setup(width, height, null);
   }

   void OnRedraw(Surface surface)
   {
      camera.Update();
      surface.Clear(depthBuffer);
      display.SetCamera(surface, camera);
      display.DrawObject(plane);
      display.SetCamera(surface, null);
   }

   Material material
   {
      emissive = white;
      opacity = 1.0f;
      flags = { translucent = true, noFog = true, doubleSided = true };
   };
   SimplePlane plane { };
}

static Degrees startAngle;
static int startY, startX;
static bool rotating;

PictureRotate pic
{
   displayDriver = "OpenGL",
   background = 0,
   alphaBlend = true,
   moveable = true,
   image = { (((GuiApplication)__thisModule).argc > 1) ? ((GuiApplication)__thisModule).argv[1] : "image.png" };
   angle = 20;

   bool OnLeftButtonDown(int x, int y, Modifiers mods)
   {
      MenuWindowMove(null, mods);
      return true;
   }

   bool OnRightButtonDown(int x, int y, Modifiers mods)
   {
      if(!rotating)
      {
         Capture();
         startAngle = angle;
         startY = y;
         startX = x;
         rotating = true;
      }
      return true;
   }

   bool OnRightButtonUp(int x, int y, Modifiers mods)
   {
      if(rotating)
      {
         rotating = false;
         ReleaseCapture();
      }
      return true;
   }

   bool OnMouseMove(int x, int y, Modifiers mods)
   {
      if(rotating)
      {
         int dx = x-startX, dy = y-startY;
         if(Abs(dx) > Abs(dy))
            property::angle = startAngle + Degrees { dx/2.0 };
         else
            property::angle = startAngle + Degrees { dy/2.0 };
      }
      return true;
   }

      bool OnKeyHit(Key key, unichar ch)
      {
         if(key == escape) Destroy(0);
         else if(key == wheelDown)
            property::zoom /= 1.1;
         else if(key == wheelUp)
            property::zoom *= 1.1;
         return true;
      }
};
