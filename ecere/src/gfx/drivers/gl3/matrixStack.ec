// Matrix Stack Implementation

#ifndef _GLES
 #define SHADERS
#endif

#if defined(__ANDROID__) || defined(__EMSCRIPTEN__) || defined(__ODROID__)
   #include <GLES/gl.h>
#else
#  if defined(SHADERS)
#     include "gl_core_3_3.h"
#  else
#     include "gl_compat_4_4.h"
#  endif
#endif

import "Display"

#if defined(ECERE_NO3D) || defined(ECERE_VANILLA)
public union Matrix
{
   double array[16];
   double m[4][4];

   void Identity()
   {
      FillBytesBy4(this, 0, sizeof(Matrix) >> 2);
      m[0][0]=m[1][1]=m[2][2]=m[3][3]=1;
   }

   void Transpose(Matrix source)
   {
      int i,j;
      for(i=0; i<4; i++)
         for(j=0; j<4; j++)
            m[j][i] = source.m[i][j];
   }

   void Multiply(Matrix a, Matrix b)
   {
      // We need a full matrix multiplication for the Projection matrix
      m[0][0]=a.m[0][0]*b.m[0][0] + a.m[0][1]*b.m[1][0] + a.m[0][2]*b.m[2][0] + a.m[0][3]*b.m[3][0];
      m[0][1]=a.m[0][0]*b.m[0][1] + a.m[0][1]*b.m[1][1] + a.m[0][2]*b.m[2][1] + a.m[0][3]*b.m[3][1];
      m[0][2]=a.m[0][0]*b.m[0][2] + a.m[0][1]*b.m[1][2] + a.m[0][2]*b.m[2][2] + a.m[0][3]*b.m[3][2];
      m[0][3]=a.m[0][0]*b.m[0][3] + a.m[0][1]*b.m[1][3] + a.m[0][2]*b.m[2][3] + a.m[0][3]*b.m[3][3];

      m[1][0]=a.m[1][0]*b.m[0][0] + a.m[1][1]*b.m[1][0] + a.m[1][2]*b.m[2][0] + a.m[1][3]*b.m[3][0];
      m[1][1]=a.m[1][0]*b.m[0][1] + a.m[1][1]*b.m[1][1] + a.m[1][2]*b.m[2][1] + a.m[1][3]*b.m[3][1];
      m[1][2]=a.m[1][0]*b.m[0][2] + a.m[1][1]*b.m[1][2] + a.m[1][2]*b.m[2][2] + a.m[1][3]*b.m[3][2];
      m[1][3]=a.m[1][0]*b.m[0][3] + a.m[1][1]*b.m[1][3] + a.m[1][2]*b.m[2][3] + a.m[1][3]*b.m[3][3];

      m[2][0]=a.m[2][0]*b.m[0][0] + a.m[2][1]*b.m[1][0] + a.m[2][2]*b.m[2][0] + a.m[2][3]*b.m[3][0];
      m[2][1]=a.m[2][0]*b.m[0][1] + a.m[2][1]*b.m[1][1] + a.m[2][2]*b.m[2][1] + a.m[2][3]*b.m[3][1];
      m[2][2]=a.m[2][0]*b.m[0][2] + a.m[2][1]*b.m[1][2] + a.m[2][2]*b.m[2][2] + a.m[2][3]*b.m[3][2];
      m[2][3]=a.m[2][0]*b.m[0][3] + a.m[2][1]*b.m[1][3] + a.m[2][2]*b.m[2][3] + a.m[2][3]*b.m[3][3];

      m[3][0]=a.m[3][0]*b.m[0][0] + a.m[3][1]*b.m[1][0] + a.m[3][2]*b.m[2][0] + a.m[3][3]*b.m[3][0];
      m[3][1]=a.m[3][0]*b.m[0][1] + a.m[3][1]*b.m[1][1] + a.m[3][2]*b.m[2][1] + a.m[3][3]*b.m[3][1];
      m[3][2]=a.m[3][0]*b.m[0][2] + a.m[3][1]*b.m[1][2] + a.m[3][2]*b.m[2][2] + a.m[3][3]*b.m[3][2];
      m[3][3]=a.m[3][0]*b.m[0][3] + a.m[3][1]*b.m[1][3] + a.m[3][2]*b.m[2][3] + a.m[3][3]*b.m[3][3];
   }
};
#endif

public enum MatrixMode { modelView = 0x1700, projection = 0x1701, texture = 0x1702 };

double nearPlane = 1;

public double glmsGetNearPlane()
{
   return nearPlane;
}

public void glmsSetNearPlane(double value)
{
   nearPlane = value;
}

/*static */Matrix matrixStack[3][32];
/*static */int matrixIndex[3];
/*static */int curStack = 0;

static void LoadCurMatrix()
{
   double * i = matrixStack[curStack][matrixIndex[curStack]].array;
   float m[16] =
   {
      (float)i[0],(float)i[1],(float)i[2],(float)i[3],
      (float)i[4],(float)i[5],(float)i[6],(float)i[7],
      (float)i[8],(float)i[9],(float)i[10],(float)i[11],
      (float)i[12],(float)i[13],(float)i[14],(float)i[15]
   };

#ifdef SHADERS
   shader_LoadMatrixf((MatrixMode) (0x1700 + curStack), m);
#else
   glLoadMatrixf(m);
#endif
}

public void glmsLoadMatrix(Matrix matrix)
{
   float m[16] =
   {
      (float)matrix.m[0][0], (float)matrix.m[0][1], (float)matrix.m[0][2], (float)matrix.m[0][3],
      (float)matrix.m[1][0], (float)matrix.m[1][1], (float)matrix.m[1][2], (float)matrix.m[1][3],
      (float)matrix.m[2][0], (float)matrix.m[2][1], (float)matrix.m[2][2], (float)matrix.m[2][3],
      (float)matrix.m[3][0], (float)matrix.m[3][1], (float)matrix.m[3][2], (float)matrix.m[3][3]
   };
#ifdef SHADERS
      shader_LoadMatrixf((MatrixMode) (0x1700 + curStack), m);
#else
      glLoadMatrixf(m);
#endif
}

public void glmsLoadIdentity()
{
   matrixStack[curStack][matrixIndex[curStack]].Identity();
   LoadCurMatrix();
}

public void glmsPushMatrix()
{
   if(matrixIndex[curStack] + 1 < sizeof(matrixStack[0]) / sizeof(Matrix))
   {
      matrixIndex[curStack]++;
      memcpy(matrixStack[curStack][matrixIndex[curStack]].array, matrixStack[curStack][matrixIndex[curStack]-1].array, sizeof(Matrix));
   }
}

public void glmsPopMatrix()
{
   if(matrixIndex[curStack] > 0)
   {
      matrixIndex[curStack]--;
      LoadCurMatrix();
   }
}

public void glmsLoadMatrixd(double * i)
{
   memcpy(matrixStack[curStack][matrixIndex[curStack]].array, i, sizeof(Matrix));
   LoadCurMatrix();
}

public void glmsOrtho( double l, double r, double b, double t, double n, double f )
{
   Matrix m
   { {
      (2 / (r - l)), 0, 0, 0,
      0, (2 / (t - b)), 0, 0,
      0, 0, (-2 / (f - n)), 0,
      (-(r + l) / (r - l)), (-(t + b) / (t - b)), (-(f + n) / (f - n)), 1
   } };
   Matrix res;
   res.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = res;
   LoadCurMatrix();
}

public void glmsFrustum( double l, double r, double b, double t, double n, double f )
{
   nearPlane = n;
   n = 1;
   l /= nearPlane;
   r /= nearPlane;
   b /= nearPlane;
   t /= nearPlane;
   f /= nearPlane;
   {
      double A = ((r + l) / (r - l));
      double B = ((t + b) / (t - b));
      double C = (-(f + n) / (f - n));
      double D = (-2*f*n/(f-n));
      Matrix m
      { {
         (2.0*n / (r - l)), 0, 0, 0,
         0, (2.0*n / (t - b)), 0, 0,
         A, B,             C,-1,
         0, 0,             D, 0
      } };
      Matrix res;
      res.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
      matrixStack[curStack][matrixIndex[curStack]] = res;
      LoadCurMatrix();
   }
}

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
public void glmsRotated( double a, double b, double c, double d )
{
   Quaternion q;
   Matrix m, r;

   q.RotationAxis({(float)b,(float)c,(float)-d}, a );
   m.RotationQuaternion(q);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}
public void glmsScaled( double a, double b, double c )
{
   Matrix m, r;

   m.Identity();
   m.Scale(a,b,c);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}

public void glmsTranslated( double a, double b, double c )
{
   Matrix m, r;

   m.Identity();
   m.Translate(a,b,c);
   r.Multiply(m, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}

public void glmsMultMatrixd( double * i )
{
   Matrix r;
   r.Multiply((Matrix *)i, matrixStack[curStack][matrixIndex[curStack]]);
   matrixStack[curStack][matrixIndex[curStack]] = r;
   LoadCurMatrix();
}
#endif

public void glmsMatrixMode(MatrixMode mode)
{
   curStack = (mode == modelView) ? 0 : (mode == projection) ? 1 : 2;
#ifndef SHADERS
   glMatrixMode(mode);
#endif
}
