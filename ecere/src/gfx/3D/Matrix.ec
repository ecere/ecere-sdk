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

   void Transpose(const Matrix source)
   {
      int i,j;
      for(i=0; i<4; i++)
         for(j=0; j<4; j++)
            m[j][i] = source.m[i][j];
   }

   void Multiply(const Matrix a, const Matrix b)
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

   void Multiply3x4(const Matrix a, const Matrix b)
   {
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
   }

   void RotationQuaternion(const Quaternion quat)
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
      m[3][0] += tx; m[3][1] += ty; m[3][2] += tz;
   }

   void Scale(double sx, double sy, double sz)
   {
      m[0][0] *= sx; m[1][0] *= sx; m[2][0] *= sx; m[3][0] *= sx;
      m[0][1] *= sy; m[1][1] *= sy; m[2][1] *= sy; m[3][1] *= sy;
      m[0][2] *= sz; m[1][2] *= sz; m[2][2] *= sz; m[3][2] *= sz;
   }

   void Rotate(const Quaternion quat)
   {
      Matrix rmat;
      Matrix mat1;
      rmat.RotationQuaternion(quat);
      mat1.Multiply3x4(this, rmat);
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

   void Inverse(const Matrix source)
   {
      double det = source.Determinant();  // FIXME: Get should be fine with const objects
      // if(Abs(det) < 0.0005)
      if(Abs(det) < 0.00000000000001)
         Identity();
      else
      {
         double invDet = 1.0 / det;
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

               m[j][i] = m3det * sign * invDet;
            }
      }
   }

   void InverseTransposeTransform(const Matrix source)
   {
      Vector3D x { source.array[ 0], source.array[ 1], source.array[ 2] };
      Vector3D y { source.array[ 4], source.array[ 5], source.array[ 6] };
      Vector3D z { source.array[ 8], source.array[ 9], source.array[10] };
      Vector3D t { source.array[12], source.array[13], source.array[14] };
      double ix = 1.0 / (x.x * x.x + x.y * x.y + x.z * x.z); // Inverse of extracted scale^2
      double iy = 1.0 / (y.x * y.x + y.y * y.y + y.z * y.z);
      double iz = 1.0 / (z.x * z.x + z.y * z.y + z.z * z.z);
      array[ 0] = x.x * ix; array[1] = x.y * ix; array[ 2] = x.z * ix; array[ 3] = -ix * (t.x * x.x + t.y * x.y + t.z * x.z);
      array[ 4] = y.x * iy; array[5] = y.y * iy; array[ 6] = y.z * iy; array[ 7] = -iy * (t.x * y.x + t.y * y.y + t.z * y.z);
      array[ 8] = z.x * iz; array[9] = z.y * iz; array[10] = z.z * iz; array[11] = -iz * (t.x * z.x + t.y * z.y + t.z * z.z);
      array[12] = 0;        array[13] = 0;       array[14] = 0;        array[15] = 1;
   }

   void ToEuler(Euler euler)
   {
      /*if(fabs(m[2][1]) <= 1.0 - 0.000005)
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
      */
      euler.FromMatrix(this, yxz);
   }

   property Quaternion
   {
      set { RotationQuaternion(value); }
      get { value.RotationMatrix(this); }
   }

   /*property */bool isIdentity()   // TOFIX: problem with union?
   {
      //get
      {
         return
            fabs(m[0][0] - 1.0) < 0.000001 &&
            fabs(m[1][1] - 1.0) < 0.000001 &&
            fabs(m[2][2] - 1.0) < 0.000001 &&
            fabs(m[3][3] - 1.0) < 0.000001 &&
            fabs(m[0][1] - 0.0) < 0.000001 &&
            fabs(m[0][2] - 0.0) < 0.000001 &&
            fabs(m[0][3] - 0.0) < 0.000001 &&
            fabs(m[1][0] - 0.0) < 0.000001 &&
            fabs(m[1][2] - 0.0) < 0.000001 &&
            fabs(m[1][3] - 0.0) < 0.000001 &&
            fabs(m[2][0] - 0.0) < 0.000001 &&
            fabs(m[2][1] - 0.0) < 0.000001 &&
            fabs(m[2][3] - 0.0) < 0.000001 &&
            fabs(m[3][0] - 0.0) < 0.000001 &&
            fabs(m[3][1] - 0.0) < 0.000001 &&
            fabs(m[3][2] - 0.0) < 0.000001;
      }
   }
private:
   property Vector3D translation
   {
      get { value = { m[3][0], m[3][1], m[3][2] }; }
   }
   void extractScaling(Matrix r, Vector3D scaling)
   {
      Vector3D x { m[0][0], m[0][1], m[0][2] };
      Vector3D y { m[1][0], m[1][1], m[1][2] };
      Vector3D z { m[2][0], m[2][1], m[2][2] };
      Vector3D s
      {
         x = sqrt(x.x * x.x + x.y * x.y + x.z * x.z),
         y = sqrt(y.x * y.x + y.y * y.y + y.z * y.z),
         z =-sqrt(z.x * z.x + z.y * z.y + z.z * z.z)
      };
      Vector3D orth;

      { double ix = 1.0 / s.x; x.x *= ix; x.y *= ix; x.z *= ix; }
      { double iy = 1.0 / s.y; y.x *= iy; y.y *= iy; y.z *= iy; }
      { double iz = 1.0 / s.z; z.x *= iz; z.y *= iz; z.z *= iz; }

      orth.CrossProduct(z, y);
      if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(x.x)) ||
         (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(x.y)) ||
         (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(x.z)))
      {
         x = orth;
         s.x *= -1;
      }

      orth.CrossProduct(x, z);
      if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(y.x)) ||
         (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(y.y)) ||
         (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(y.z)))
      {
         y = orth;
         s.y *= -1;
      }

      orth.CrossProduct(x, y);
      if((Abs(orth.x) > 0.00001 && Sgn(orth.x) != Sgn(z.x)) ||
         (Abs(orth.y) > 0.00001 && Sgn(orth.y) != Sgn(z.y)) ||
         (Abs(orth.z) > 0.00001 && Sgn(orth.z) != Sgn(z.z)))
      {
         z = orth;
         s.z *= -1;
      }

      if(scaling != null)
         scaling = s;
      if(r != null)
      {
         r.m[0][0] = x.x, r.m[0][1] = x.y, r.m[0][2] = x.z, r.m[0][3] = 0;
         r.m[1][0] = y.x, r.m[1][1] = y.y, r.m[1][2] = y.z, r.m[1][3] = 0;
         r.m[2][0] = z.x, r.m[2][1] = z.y, r.m[2][2] = z.z, r.m[2][3] = 0;
         r.m[3][0] =   0, r.m[3][1] =    0, r.m[3][2] =  0, r.m[3][3] = 1;
      }
   }
   property Vector3D scaling
   {
      get { extractScaling(null, value); }
   }
   property Quaternion orientation // This assumes it is a rotation matrix only!
   {
      get { value.RotationMatrix(this); }
   }
};
