// Matrix Stack Implementation
import "Display"
import "defaultShader"

#include "gl123es.h"

namespace gfx::drivers;

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

   void Translate(double tx, double ty, double tz)
   {
      Matrix tmat;
      Matrix mat1;

      FillBytesBy4(tmat, 0, sizeof(Matrix) >> 2);
      tmat.m[0][0]=tmat.m[1][1]=tmat.m[2][2]=tmat.m[3][3]=1;
      tmat.m[3][0]=tx; tmat.m[3][1]=ty; tmat.m[3][2]=tz;
      mat1.Multiply(this, tmat);
      this = mat1;
   }

   void Scale(double sx, double sy, double sz)
   {
      Matrix smat;
      Matrix mat1;
      FillBytesBy4(smat, 0, sizeof(Matrix) >> 2);
      smat.m[0][0]=sx; smat.m[1][1]=sy; smat.m[2][2]=sz; smat.m[3][3]=1;
      mat1.Multiply(this, smat);
      this = mat1;
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
public enum GLMSWhatToGet { modelViewMatrix = 0x0BA6, projectionMatrix = 0x0BA7, textureMatrix = 0x0BA8 };

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
bool stackModified[3];
bool isIdentity[3][32];

public void glmsLoadMatrix(Matrix matrix)
{
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;
   memcpy(matrixStack[curStack][ix].array, matrix.array, sizeof(Matrix));
   stackModified[curStack] = true;
}

public void glmsLoadIdentity()
{
   int ix = matrixIndex[curStack];
   if(!isIdentity[curStack][ix])
   {
      isIdentity[curStack][ix] = true;
      matrixStack[curStack][ix].Identity();
      stackModified[curStack] = true;
   }
}

public void glmsPushMatrix()
{
   int ix = matrixIndex[curStack];
   if(ix + 1 < sizeof(matrixStack[0]) / sizeof(Matrix))
   {
      matrixIndex[curStack] = ix+1;
      memcpy(matrixStack[curStack][ix+1].array, matrixStack[curStack][ix].array, sizeof(Matrix));
      isIdentity[curStack][ix+1] = isIdentity[curStack][ix];
   }
}

public void glmsPopMatrix()
{
   if(matrixIndex[curStack] > 0)
   {
      matrixIndex[curStack]--;
      stackModified[curStack] = true;
   }
}

public void glmsLoadMatrixf(float * i)
{
   double m[16] =
   {
      i[0*4+0], i[0*4+1], i[0*4+2], i[0*4+3],
      i[1*4+0], i[1*4+1], i[1*4+2], i[1*4+3],
      i[2*4+0], i[2*4+1], i[2*4+2], i[2*4+3],
      i[3*4+0], i[3*4+1], i[3*4+2], i[3*4+3]
   };
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;
   memcpy(matrixStack[curStack][ix].array, m, 16*sizeof(double));
   stackModified[curStack] = true;
}

public void glmsLoadMatrixd(double * i)
{
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;
   memcpy(matrixStack[curStack][ix].array, i, sizeof(Matrix));
   stackModified[curStack] = true;
}

public void glmsOrtho(double l, double r, double b, double t, double n, double f )
{
   Matrix m
   { {
      (2 / (r - l)), 0, 0, 0,
      0, (2 / (t - b)), 0, 0,
      0, 0, (-2 / (f - n)), 0,
      (-(r + l) / (r - l)), (-(t + b) / (t - b)), (-(f + n) / (f - n)), 1
   } };
   Matrix res;
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;
   res.Multiply(m, matrixStack[curStack][ix]);
   matrixStack[curStack][ix] = res;
   stackModified[curStack] = true;
}

public void glmsScaled(double a, double b, double c)
{
   Matrix m, r;
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;

   m.Identity();
   m.Scale(a,b,c);
   r.Multiply3x4(m, matrixStack[curStack][ix]);
   matrixStack[curStack][ix] = r;
   stackModified[curStack] = true;
}

public void glmsTranslated( double a, double b, double c)
{
   Matrix m, r;
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;

   m.Identity();
   m.Translate(a,b,c);
   r.Multiply3x4(m, matrixStack[curStack][ix]);
   matrixStack[curStack][ix] = r;
   stackModified[curStack] = true;
}

#if !defined(ECERE_NO3D) && !defined(ECERE_VANILLA)
public void glmsFrustum(double l, double r, double b, double t, double n, double f)
{
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;

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
      res.Multiply(m, matrixStack[curStack][ix]);
      matrixStack[curStack][ix] = res;
      stackModified[curStack] = true;
   }
}

public void glmsRotated( double angle, double x, double y, double z)
{
   Quaternion q;
   Matrix m, r;
   Vector3D n;
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;

   n.Normalize({ -x, -y, -z });
   q.RotationAxis(n, angle);
   m.RotationQuaternion(q);
   r.Multiply3x4(m, matrixStack[curStack][ix]);
   matrixStack[curStack][ix] = r;
   stackModified[curStack] = true;
}

public void glmsMultMatrixd(double * i)
{
   Matrix r;
   int ix = matrixIndex[curStack];
   isIdentity[curStack][ix] = false;

   r.Multiply((Matrix *)i, matrixStack[curStack][ix]);
   matrixStack[curStack][ix] = r;
   stackModified[curStack] = true;
}

public void glmsGetDoublev(GLMSWhatToGet what, double * i)
{
   int ix;
   switch(what)
   {
      case modelViewMatrix:
         ix = MatrixMode::modelView-0x1700;
         memcpy(i, matrixStack[ix][matrixIndex[ix]].array, sizeof(Matrix));
         break;
      case projectionMatrix:
         ix = MatrixMode::projection-0x1700;
         memcpy(i, matrixStack[ix][matrixIndex[ix]].array, sizeof(Matrix));
         break;
      case textureMatrix:
         ix = MatrixMode::texture-0x1700;
         memcpy(i, matrixStack[ix][matrixIndex[ix]].array, sizeof(Matrix));
         break;
   }
}
#endif

public void glmsMatrixMode(MatrixMode mode)
{
   curStack = (mode == modelView) ? 0 : (mode == projection) ? 1 : 2;
}

public void glmsFlushMatrices()
{
   int stack;
   for(stack = 0; stack < 3; stack++)
   {
      if(stackModified[stack])
      {
         int ix = matrixIndex[stack];
         Matrix * matrix = &matrixStack[stack][ix];
         double * dm = matrix->array;
         float m[16] =
         {
            (float)dm[0 ], (float)dm[ 1], (float)dm[ 2], (float)dm[ 3],
            (float)dm[4 ], (float)dm[ 5], (float)dm[ 6], (float)dm[ 7],
            (float)dm[8 ], (float)dm[ 9], (float)dm[10], (float)dm[11],
            (float)dm[12], (float)dm[13], (float)dm[14], (float)dm[15]
         };
#if ENABLE_GL_SHADERS
         if(glCaps_shaders)
            activeShader.updateMatrix((MatrixMode) (0x1700 + stack), m, isIdentity[stack][ix]);
#endif

#if ENABLE_GL_FFP
         if(!glCaps_shaders)
         {
            glMatrixMode(stack + 0x1700);
            glLoadMatrixf(m);
         }
#endif
         stackModified[stack] = false;
      }
   }
#if ENABLE_GL_SHADERS
   if(glCaps_shaders)
      activeShader.activate();
#endif
}
