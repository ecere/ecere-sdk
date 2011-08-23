import "ecere"
#include <GL/gl.h>

static void SetProjection(int width, int height, double zMin, double zMax)
{
   int left = 0, top = 0, right = width - 1, bottom = height - 1;
   int focalX = (width > height) ? width : height, focalY = focalX;
   glViewport(0, height - bottom - 1, right - left + 1, bottom - top + 1);

   glMatrixMode(GL_PROJECTION);
   glLoadIdentity();
   glFrustum(
      (left   - (left + right) / 2.0f) * zMin / focalX,
      (right  - (left + right) / 2.0f) * zMin / focalX,
      (bottom - (bottom + top) / 2.0f) * zMin / focalY,
      (top    - (bottom + top) / 2.0f) * zMin / focalY,
      zMin, zMax);
}

class Snippet : Window
{
   displayDriver = "OpenGL";
   text = "GL Snippet";
   nativeDecorations = true, borderStyle = sizable, hasClose = true, hasMaximize = true, hasMinimize = true;
   background = 0;
   size = { 640, 480 };

   void OnRedraw(Surface surface)
   {
      float halfWhite[] = {0.5f, 0.5f, 0.5f, 1};
      float black[] = {0, 0, 0, 1};
      float blue[] = {0.3f, 0.2f, 1, 1};
      float ambient[4] = { 0.2f, 0.2f, 0.2f };
      float power = 0;
      float light[] = { -0.810f, -0.585f, 0.468f, 0 };     

      Matrix view
      {
         {
            1, 0, 0, 0,
            0, 0, 1, 0,
            0, -1, 0, 0,
            0, 0, 9000, 1
         }
      };
      Matrix cubeMatrix
      {
         {
            1141.996897, -597.672467, 1529.258222, 0,
            1427.537483, 1281.712735, -565.109902, 0,
            -811.159554, 1414.213593, 1158.455908, 0,
            0, 0, 0, 1
         }
      };
      SetProjection(clientSize.w, clientSize.h, 3, 20000);

      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity();

      // Opposite hand
      glScalef(1.0f,1.0f,-1.0f);

      // View Matrix
      glMultMatrixd(view.array);

      // Setup Lighting (Light in world space)
      #define GL_RESCALE_NORMAL 0x803A
      glEnable(GL_RESCALE_NORMAL); // glEnable(GL_NORMALIZE);
      glEnable(GL_CULL_FACE);
      glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient);
      glShadeModel(GL_SMOOTH);
      glEnable(GL_LIGHTING);
      glEnable(GL_LIGHT0);
      glLightfv(GL_LIGHT0, GL_DIFFUSE, halfWhite);
      glLightfv(GL_LIGHT0, GL_SPECULAR, halfWhite);
      glLightfv(GL_LIGHT0, GL_POSITION, light);

      // Cube matrix
      glMultMatrixd(cubeMatrix.array);

      // Material
      glMaterialfv(GL_FRONT_AND_BACK, GL_DIFFUSE, (float *)&blue);
      glMaterialfv(GL_FRONT_AND_BACK, GL_AMBIENT, (float *)&blue);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SPECULAR, (float *)&blue);
      glMaterialfv(GL_FRONT_AND_BACK, GL_EMISSION, (float *)&black);
      glMaterialfv(GL_FRONT_AND_BACK, GL_SHININESS, &power);

      // The Cube
      glBegin(GL_QUADS);

         glNormal3f(0, -1, 0); glVertex3f(0.5f, -1, -0.5f);
         glNormal3f(0, -1, 0); glVertex3f(0.5f, -1, 0.5f);
         glNormal3f(0, -1, 0); glVertex3f(-0.5f, -1, 0.5f);
         glNormal3f(0, -1, 0); glVertex3f(-0.5f, -1, -0.5f);

         glNormal3f(0, 0, -1); glVertex3f(-0.5f, -1, -0.5f);
         glNormal3f(0, 0, -1); glVertex3f(-0.5f, 0, -0.5f);
         glNormal3f(0, 0, -1); glVertex3f(0.5f, 0, -0.5f);
         glNormal3f(0, 0, -1); glVertex3f(0.5f, -1, -0.5f);

         glNormal3f(0, 1, 0); glVertex3f(0.5f, 0, 0.5f);
         glNormal3f(0, 1, 0); glVertex3f(0.5f, 0, -0.5f);
         glNormal3f(0, 1, 0); glVertex3f(-0.5f, 0, -0.5f);
         glNormal3f(0, 1, 0); glVertex3f(-0.5f, 0, 0.5f);

         glNormal3f(0, 0, 1); glVertex3f(0.5f, -1, 0.5f);
         glNormal3f(0, 0, 1); glVertex3f(0.5f, 0, 0.5f);
         glNormal3f(0, 0, 1); glVertex3f(-0.5f, 0, 0.5f);
         glNormal3f(0, 0, 1); glVertex3f(-0.5f, -1, 0.5f);

         glNormal3f(1, 0, 0); glVertex3f(0.5f, -1, -0.5f);
         glNormal3f(1, 0, 0); glVertex3f(0.5f, 0, -0.5f);
         glNormal3f(1, 0, 0); glVertex3f(0.5f, 0, 0.5f);
         glNormal3f(1, 0, 0); glVertex3f(0.5f, -1, 0.5f);

         glNormal3f(-1, 0, 0); glVertex3f(-0.5f, -1, 0.5f);
         glNormal3f(-1, 0, 0); glVertex3f(-0.5f, 0, 0.5f);
         glNormal3f(-1, 0, 0); glVertex3f(-0.5f, 0, -0.5f);
         glNormal3f(-1, 0, 0); glVertex3f(-0.5f, -1, -0.5f);

      glEnd();
   }
}

Snippet snippet { anchor = { horz = -160, vert = -120 } };
