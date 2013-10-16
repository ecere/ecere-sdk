import "ecere"

class MyApp : GuiApplication
{
   driver = "OpenGL";
   // driver = "Direct3D";
};

Camera camera
{
   fixed,
   position = Vector3D { 0, 0, -200 },
   orientation = Euler { 0, 0, 0 },
   fov = 53;
};

Light light
{
   //diffuse = white;
   specular = white;
   orientation = Euler { pitch = 10, yaw = 30 };
};

Light light2
{
   diffuse = white;
   //specular = white;
   orientation = Euler { pitch = 20, yaw = -30 };
};

class FunkaColorCube : Object
{
public:
   bool Create(DisplaySystem displaySystem)
   {
      bool result = false;
      if(this)
      {
         InitializeMesh(displaySystem);

         if(mesh)
         {
            if(mesh.Allocate({ vertices = true, texCoords1 = true, colors = true }, 24, displaySystem))
            {
               Vector3Df vertices[24] =
               {
                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 },

                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 },

                  { -(float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2,-(float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2,-(float)size.z/2 },
                  { -(float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2,-(float)size.y/2, (float)size.z/2 },
                  {  (float)size.x/2, (float)size.y/2, (float)size.z/2 },
                  { -(float)size.x/2, (float)size.y/2, (float)size.z/2 }
               };
               Pointf texCoords[24] =
               {
                  { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
                  { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
                  { 1, 0 }, { 0, 0 }, { 0, 1 }, { 1, 1 },
                  { 0, 0 }, { 1, 0 }, { 1, 1 }, { 0, 1 },
                  { 0, 1 }, { 1, 1 }, { 1, 1 }, { 0, 1 },
                  { 0, 0 }, { 1, 0 }, { 1, 0 }, { 0, 0 }
               };
               ColorRGBAf colors[24] =
               {
                  red, magenta, teal, white,
                  blue, cyan, black, pink,
                  orange, powderBlue, lightGreen, violet,
                  green, gray, lightBlue, blanchedAlmond,
                  purple, forestGreen, slateGray, lavender,
                  yellow, lime, salmon, tomato
               };
               uint16 indices[6][4] =
               {
                  // up, front, down, back, right, left
                  { 17,21,20,16 },
                  { 0,3,2,1 },
                  { 22,18,19,23 },
                  { 5,6,7,4 },
                  { 9,10,14,13 },
                  { 12,15,11,8 }
               };

               int c;

               CopyBytes(mesh.vertices, vertices, sizeof(vertices));
               CopyBytes(mesh.texCoords, texCoords, sizeof(texCoords));
               CopyBytes(mesh.colors, colors, sizeof(colors));

               for(c = 0; c<6; c++)
               {
                  PrimitiveGroup group;
                  group = mesh.AddPrimitiveGroup(quads, 4);
                  if(group)
                  {
                     CopyBytes(group.indices, indices[c], sizeof(indices[c]));
                     mesh.UnlockPrimitiveGroup(group);
                  }
               }
               mesh.ComputeNormals();
               result = true;
               mesh.Unlock(0);
            }
            SetMinMaxRadius(true);
         }
      }
      return result;
   }

   property Vector3Df size { set { size = value; } };

private:
   FunkaColorCube()
   {
      size = { 1,1,1 };
   }

   Vector3Df size;
}

class Test3D : Window
{
   text = "Form1";
   background = black;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 480, 480 };

   //BitmapResource texture { "http://www.ecere.com/images/knot.png", window = this };
   FunkaColorCube cube { };
   Material cubeMat { opacity = 1.0f, diffuse = white, ambient = white, flags = { doubleSided = true, translucent = true } };

   bool OnLoadGraphics()
   {
      cube.Create(displaySystem);
      //cubeMat.baseMap = texture.bitmap;
      cube.mesh.ApplyMaterial(cubeMat);
      cube.mesh.ApplyTranslucency(cube);
      cube.transform.scaling = { 100, 100, 100 };
      cube.transform.position = { 0, 0, 0 };
      cube.transform.orientation = Euler { 50, 50 };
      cube.UpdateTransform();
      return true;
   }

   void OnResize(int w, int h)
   {
      camera.Setup(w, h, null);
   }

   void OnRedraw(Surface surface)
   {
      surface.Clear(depthBuffer);
      camera.Update();
      display.SetLight(0, light);
      display.SetLight(1, light2);
      display.fogDensity = 0;
      display.SetCamera(surface, camera);
      display.DrawObject(cube);
      display.SetCamera(surface, null);
   }
}

Test3D test3D {};
