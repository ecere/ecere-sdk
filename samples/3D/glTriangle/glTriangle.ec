#include <GL/gl.h>
import "ecere"

#define GL_MULTISAMPLE_ARB 0x809D

class GLTriangle : Window
{
   text = "Triangle";
   displayDriver = "OpenGL";
   background = activeBorder;
   nativeDecorations = true;
   borderStyle = sizable;
   hasMaximize = true, hasMinimize = true, hasClose = true;
   size = { 640, 480 };

   void OnRedraw(Surface surface)
   {
      glMatrixMode(GL_PROJECTION);
      glLoadIdentity();
      glOrtho(-30, 30, -30, 30, -30, 30);
      glMatrixMode(GL_MODELVIEW);
      glLoadIdentity();
      glTranslatef(-15, -15, 0);
      glShadeModel(GL_SMOOTH);
      glEnable(GL_MULTISAMPLE_ARB);

      glBegin(GL_TRIANGLES);
      glColor3f(1, 0, 0);  glVertex2f(0, 0);
      glColor3f(0, 1, 0);  glVertex2f(30, 0);
      glColor3f(0, 0, 1);  glVertex2f(0, 30);
      glEnd();
   }
}

GLTriangle window {};
