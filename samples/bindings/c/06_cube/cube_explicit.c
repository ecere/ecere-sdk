#define MODULE_NAME  "gui"

#include "ecere.h"

static eC_Class * class_CubeWindow;

struct class_members_CubeWindow { eC_Camera camera; eC_Light * light; eC_Cube * cube; };

typedef eC_Instance eC_CubeWindow;

static eC_bool CubeWindow_onLoadGraphics(eC_CubeWindow this)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   eC_DisplaySystem displaySystem = Window_get_displaySystem(this);
   Cube_create(self->cube, displaySystem);
   {
      eC_Transform transform;
      Object_get_transform((eC_Object*)self->cube, &transform);
      transform.scaling = (eC_Vector3Df){ 100, 100, 100 };
      {
         eC_Quaternion orientation;
         Euler_to_Quaternion(&(eC_Euler){ Degrees(50), Degrees(30), Degrees(50) }, &orientation);
         transform.orientation = orientation;
      }
      Object_set_transform((eC_Object*)self->cube, &transform);
   }
   Object_updateTransform((eC_Object*)self->cube);
   return true;
}

static eC_bool CubeWindow_onUnloadGraphics(eC_CubeWindow this)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   eC_DisplaySystem displaySystem = Window_get_displaySystem(this);
   Object_free((eC_Object *)self->cube, displaySystem); // Shouldn't we have a Cube_free() macro casting to base class?
   return true;
}

static void CubeWindow_onResize(eC_CubeWindow this, int w, int h)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   Camera_setup(self->camera, w, h, null);
   Camera_update(self->camera);
}

static void CubeWindow_onRedraw(eC_CubeWindow this, eC_Surface surface)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   eC_Display display = Window_get_display(this);
   Surface_clear(surface, ClearType_depthBuffer);
   Display_setLight(display, 0, self->light);
   Display_setCamera(display, surface, self->camera);
   Display_drawObject(display, (eC_Object*)self->cube);
   Display_setCamera(display, surface, null);
}

static eC_bool CubeWindow_constructor(eC_CubeWindow this)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   Window_set_caption(this, $("My First Ecere/C Bindings App"));
   Window_set_borderStyle(this, BorderStyle_sizable);
   Window_set_background(this, DefinedColor_black);
   Window_set_size(this, &(eC_Size){ 640, 480 });
   Window_set_hasClose(this, true);

   eC_FontResource font = newi(FontResource);
   FontResource_set_faceName(font, "Arial");
   FontResource_set_size(font, 30);

   self->camera = newi(Camera);
   Camera_set_type(self->camera, CameraType_fixed);
   Camera_set_position(self->camera, &(eC_Vector3D){ 0, 0, -300 });
   Camera_set_eulerOrientation(self->camera, &(eC_Euler){ 0, 0, 0 });
   Camera_set_fov(self->camera, Degrees(53));

   self->cube = newcs(Cube);
   self->light = newt0(eC_Light, 1);
   {
      eC_ColorRGB diffuse;
      Color_to_ColorRGB(DefinedColor_lightCoral, &diffuse);
      self->light->diffuse = diffuse;
   }
   {
      eC_Quaternion orientation;
      Euler_to_Quaternion(&(eC_Euler){ Degrees(30), Degrees(10) }, &orientation); // { pitch = 10, yaw = 30 }
      self->light->orientation = orientation;
   }

   Instance_setMethod(this, "OnLoadGraphics", CubeWindow_onLoadGraphics);
   Instance_setMethod(this, "OnUnloadGraphics", CubeWindow_onUnloadGraphics);
   Instance_setMethod(this, "OnResize", CubeWindow_onResize);
   Instance_setMethod(this, "OnRedraw", CubeWindow_onRedraw);
   return true;
}

static void CubeWindow_destructor(eC_CubeWindow this)
{
   struct class_members_CubeWindow * self = IPTR(this, CubeWindow);
   deletei(self->camera);
   delete(self->cube);
   delete(self->light);
}

GUIAPP_INTRO
{
   // do all class registration first.
   class_CubeWindow = registerClass(app, CubeWindow, Window);
   // application code start here.
   GuiApplication_set_driver(app, "OpenGL");
   eC_CubeWindow hello = newi(CubeWindow);

   Application_main(app);

   deletei(hello);
}
ECERE_APP_OUTRO
