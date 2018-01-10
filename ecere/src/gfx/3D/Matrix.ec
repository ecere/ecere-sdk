namespace gfx3D;

import "Display"

public union Matrix
{
   double array[16];
   double m[4][4];

   const char * OnGetString(char * string, void * fieldData, ObjectNotationType * onType)
   {
      bool spacing = false; //true;
      int y, x;
      string[0] = 0;
      strcat(string, spacing ? "{\n" : "{ ");
      for(y = 0; y < 4; y++)
      {
         strcat(string, spacing ? "   { " : "{ ");
         for(x = 0; x < 4; x++)
         {
            char member[256];
            const char * s = m[y][x].OnGetString(member, null, null);
            strcat(string, s);
            if(x < 3) strcat(string, ", ");
         }
         strcat(string, " }");
         if(y < 3) strcat(string, ", ");
         if(spacing) strcat(string, "\n");
      }
      strcat(string, spacing ? "}\n" : " }");
      return string;
   }

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
#if 1
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
#else
      m[0][0]=a.m[0][0]*b.m[0][0] + a.m[0][1]*b.m[1][0] + a.m[0][2]*b.m[2][0];
      m[0][1]=a.m[0][0]*b.m[0][1] + a.m[0][1]*b.m[1][1] + a.m[0][2]*b.m[2][1];
      m[0][2]=a.m[0][0]*b.m[0][2] + a.m[0][1]*b.m[1][2] + a.m[0][2]*b.m[2][2];
      m[0][3]=0;

      m[1][0]=a.m[1][0]*b.m[0][0] + a.m[1][1]*b.m[1][0] + a.m[1][2]*b.m[2][0];
      m[1][1]=a.m[1][0]*b.m[0][1] + a.m[1][1]*b.m[1][1] + a.m[1][2]*b.m[2][1];
      m[1][2]=a.m[1][0]*b.m[0][2] + a.m[1][1]*b.m[1][2] + a.m[1][2]*b.m[2][2];
      m[1][3]=0;

      m[2][0]=a.m[2][0]*b.m[0][0] + a.m[2][1]*b.m[1][0] + a.m[2][2]*b.m[2][0];
      m[2][1]=a.m[2][0]*b.m[0][1] + a.m[2][1]*b.m[1][1] + a.m[2][2]*b.m[2][1];
      m[2][2]=a.m[2][0]*b.m[0][2] + a.m[2][1]*b.m[1][2] + a.m[2][2]*b.m[2][2];
      m[2][3]=0;

      m[3][0]=a.m[3][0]*b.m[0][0] + a.m[3][1]*b.m[1][0] + a.m[3][2]*b.m[2][0] + b.m[3][0];
      m[3][1]=a.m[3][0]*b.m[0][1] + a.m[3][1]*b.m[1][1] + a.m[3][2]*b.m[2][1] + b.m[3][1];
      m[3][2]=a.m[3][0]*b.m[0][2] + a.m[3][1]*b.m[1][2] + a.m[3][2]*b.m[2][2] + b.m[3][2];
      m[3][3]=1;
#endif
   }

   void RotationQuaternion(Quaternion quat)
   {
      double xx = quat.x*quat.x, yy = quat.y*quat.y, zz = quat.z*quat.z;
      double xy = quat.x*quat.y, xz = quat.x*quat.z, yz = quat.y*quat.z;
      double wx = quat.w*quat.x, wy = quat.w*quat.y, wz = quat.w*quat.z;

      m[0][0] = (double) (1 - 2 * ( yy + zz ));
      m[0][1] = (double) (    2 * ( xy - wz ));
      m[0][2] = (double) (    2 * ( xz + wy ));

      m[1][0] = (double) (    2 * ( xy + wz ));
      m[1][1] = (double) (1 - 2 * ( xx + zz ));
      m[1][2] = (double) (    2 * ( yz - wx ));

      m[2][0] = (double) (    2 * ( xz - wy ));
      m[2][1] = (double) (    2 * ( yz + wx ));
      m[2][2] = (double) (1 - 2 * ( xx + yy ));

      m[0][3] = m[1][3] = m[2][3] = 0.0f;
      m[3][0] = m[3][1] = m[3][2] = 0.0f;
      m[3][3] = 1.0f;
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

   void Rotate(Quaternion quat)
   {
      Matrix rmat;
      Matrix mat1;
      rmat.RotationQuaternion(quat);
      mat1.Multiply(this, rmat);
      this = mat1;
   }

   double Determinant(void)
   {
      double result = 0, i = 1;
      int n;
      for(n = 0; n < 4; n++, i *= -1)
      {
         double det;
         double msub3[3][3];
         int di, dj;

         for(di = 0; di < 3; di++)
         {
            for(dj = 0; dj < 3; dj++)
            {
               int si = di + ( ( di >= 0 ) ? 1 : 0 );
               int sj = dj + ( ( dj >= n ) ? 1 : 0 );
               msub3[di][dj] = m[si][sj];
            }
         }
         det = msub3[0][0] * ( msub3[1][1]*msub3[2][2] - msub3[2][1]*msub3[1][2] )
             - msub3[0][1] * ( msub3[1][0]*msub3[2][2] - msub3[2][0]*msub3[1][2] )
             + msub3[0][2] * ( msub3[1][0]*msub3[2][1] - msub3[2][0]*msub3[1][1] );

         result += m[0][n] * det * i;
      }
      return result;
   }

   void Inverse(Matrix source)
   {
      double det = source.Determinant();
      // if(Abs(det) < 0.0005)
      if(Abs(det) < 0.00000000000001)
         Identity();
      else
      {
         int i, j, sign;
         for ( i = 0; i < 4; i++ )
            for ( j = 0; j < 4; j++ )
            {
               int di, dj;
               double msub3[3][3];
               double m3det;

               sign = 1 - ( (i+j) % 2 ) * 2;

               for(di = 0; di < 3; di++)
               {
                  for(dj = 0; dj < 3; dj++)
                  {
                     int si = di + ( ( di >= i ) ? 1 : 0 );
                     int sj = dj + ( ( dj >= j ) ? 1 : 0 );
                     msub3[di][dj] = source.m[si][sj];
                  }
               }
               m3det = msub3[0][0] * ( msub3[1][1]*msub3[2][2] - msub3[2][1]*msub3[1][2] )
                     - msub3[0][1] * ( msub3[1][0]*msub3[2][2] - msub3[2][0]*msub3[1][2] )
                     + msub3[0][2] * ( msub3[1][0]*msub3[2][1] - msub3[2][0]*msub3[1][1] );

               m[j][i] = m3det * sign / det;
            }
      }
   }

   void ToEuler(Euler euler)
   {
      if(fabs(m[2][1]) <= 1.0 - 0.000005)
      {
         euler.yaw   = atan2(-m[2][0], m[2][2]);
         euler.pitch = asin ( m[2][1]);
         euler.roll  = atan2(-m[0][1], m[1][1]);
      }
      else
      {
         euler.yaw = acos(m[0][0]);
         euler.pitch = Pi/2;
         euler.roll = 0;
      }
   }

   property Quaternion
   {
      set { RotationQuaternion(value); }
      get { value.RotationMatrix(this); }
   }
};
