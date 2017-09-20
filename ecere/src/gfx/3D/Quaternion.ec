namespace gfx3D;

import "Display"

public struct Euler
{
   Degrees yaw, pitch, roll;
   property Quaternion
   {
      set
      {
         double y = 2 * ( value.y*value.z + value.w*value.x );
         if(fabs(y) <= 1.0 - 0.000005)
         {
            double x =     2 * ( value.x*value.z - value.w*value.y );
            double z = 1 - 2 * ( value.x*value.x + value.y*value.y );
            Angle yaw = -atan2(x, z);
            Angle pitch = atan2(y, sqrt(x * x + z * z));
            double sYaw = sin( yaw / 2 );
            double cYaw = cos( yaw / 2 );
            double sPitch = sin( pitch / 2 );
            double cPitch = cos( pitch / 2 );
            Quaternion yp = { cPitch * cYaw, sPitch * cYaw, cPitch * sYaw, sPitch * sYaw };
            double rollW = yp.w * value.w + yp.x * value.x + yp.y * value.y + yp.z * value.z;
            double rollZ = yp.w * value.z + yp.x * value.y - yp.y * value.x - yp.z * value.w;

            this.yaw = yaw;
            this.pitch = pitch;
            this.roll = atan2(rollZ, rollW) * 2;
         }
         else
         {
            // 90 degrees pitch case
            double sin45 = sin(Pi/4);
            double yawW = sin45 * value.w + sin45 * value.x;
            double yawY = sin45 * value.y + sin45 * value.z;

            this.yaw = atan2(yawY, yawW) * 2;
            this.pitch = Pi/2;
            this.roll = 0;
         }
      }
      get
      {
         double sYaw   = sin( yaw   / 2 );
         double cYaw   = cos( yaw   / 2 );
         double sPitch = sin( pitch / 2 );
         double cPitch = cos( pitch / 2 );
         double sRoll  = sin( roll  / 2 );
         double cRoll  = cos( roll  / 2 );
         Quaternion yp = { cPitch * cYaw, sPitch * cYaw, cPitch * sYaw, sPitch * sYaw };

         value.w = yp.w * cRoll - yp.z * sRoll;
         value.x = yp.x * cRoll - yp.y * sRoll;
         value.y = yp.y * cRoll + yp.x * sRoll;
         value.z = yp.z * cRoll + yp.w * sRoll;
      }
   };

   void Add(Euler e1, Euler e2)
   {
      yaw   = e1.yaw   + e2.yaw;
      pitch = e1.pitch + e2.pitch;
      roll  = e1.roll  + e2.roll;
   }
};

public struct Quaternion
{
   double w, x, y, z;

   void Identity(void)
   {
      x = y = z = 0;
      w = 1;
   }

   void Normalize(Quaternion source)
   {
      double m = sqrt(source.x * source.x +
                      source.y * source.y +
                      source.z * source.z +
                      source.w * source.w);

      if(m)
      {
         x = (double)(source.x/m);
         y = (double)(source.y/m);
         z = (double)(source.z/m);
         w = (double)(source.w/m);
      }
      else
         w = x = y = z = 0;
   }

   void Multiply(Quaternion q1, Quaternion q2)
   {
      w = q1.w * q2.w - q2.x * q1.x - q1.y * q2.y - q1.z * q2.z;
      x = q1.w * q2.x + q2.w * q1.x + q1.y * q2.z - q1.z * q2.y;
      y = q1.w * q2.y + q2.w * q1.y + q1.z * q2.x - q1.x * q2.z;
      z = q1.w * q2.z + q2.w * q1.z + q1.x * q2.y - q1.y * q2.x;
   }

   void Divide(Quaternion q1, Quaternion q2)
   {
      w =  q2.w * q1.w + q2.x * q1.x + q2.y * q1.y + q2.z * q1.z;
      x =  q2.w * q1.x - q2.x * q1.w + q2.y * q1.z - q2.z * q1.y;
      y =  q2.w * q1.y - q2.x * q1.z - q2.y * q1.w + q2.z * q1.x;
      z =  q2.w * q1.z + q2.x * q1.y - q2.y * q1.x - q2.z * q1.w;
   }

   void RotationAxis(Vector3D axis, Degrees angle)
   {
      double sa = sin( angle / 2 );
      double ca = cos( angle / 2 );

      x = axis.x * sa;
      y = axis.y * sa;
      z = axis.z * sa;
      w = ca;
   }

   void RotationYawPitchRoll(Euler euler)
   {
      Quaternion rotation, result;

      result.Yaw(euler.yaw);
      rotation.Pitch(euler.pitch);
      Multiply(rotation, result);
      rotation.Roll(euler.roll);
      result.Multiply(rotation, this);
      Normalize(result);
   }

   void RotationDirection(Vector3D direction)
   {
      Angle yaw = -atan2(direction.x, direction.z);
      Angle pitch = atan2(direction.y, sqrt(direction.x * direction.x + direction.z * direction.z));
      YawPitch(yaw, pitch);
   }

   void RotationMatrix(Matrix m)
   {
      double t = m.m[0][0] + m.m[1][1] + m.m[2][2];
      if(t > 0)
      {
         double s = sqrt(t + 1.0) * 2;

         w = 0.25 * s;
         x = ( m.m[2][1] - m.m[1][2] ) / s;
         y = ( m.m[0][2] - m.m[2][0] ) / s;
         z = ( m.m[1][0] - m.m[0][1] ) / s;
      }
      else
      {
         double q[3];
         double s;

         int i = 0,j,k;
         int nxt[3] = {1,2,0};
         if(m.m[1][1] > m.m[0][0]) i = 1;
         if(m.m[2][2] > m.m[i][i]) i = 2;
         j = nxt[i];
         k = nxt[j];
         s = sqrt(m.m[i][i] - (m.m[j][j] + m.m[k][k]) + 1.0) * 2;

         w = (m.m[k][j] - m.m[j][k]) / s;

         q[i] = 0.25 * s;
         q[j] = (m.m[j][i] + m.m[i][j]) / s;
         q[k] = (m.m[k][i] + m.m[i][k]) / s;

         x = q[0];
         y = q[1];
         z = q[2];
      }
   }

   #define DELTA 0

   void Slerp(Quaternion from, Quaternion to, float t)
   {
      double to1[4];
      double omega, cosom, sinom, scale0, scale1;

      cosom = from.x * to.x + from.y * to.y + from.z * to.z + from.w * to.w;

      if ( cosom < 0.0 )
      {
         cosom = -cosom;
         to1[0] = -to.x;
         to1[1] = -to.y;
         to1[2] = -to.z;
         to1[3] = -to.w;
      }
      else
      {
         to1[0] = to.x;
         to1[1] = to.y;
         to1[2] = to.z;
         to1[3] = to.w;
      }

      if ( (1.0 - cosom) > DELTA )
      {
         omega = acos(cosom);
         sinom = sin(omega);
         scale0 = sin((1.0 - t) * omega) / sinom;
         scale1 = sin(t * omega) / sinom;

      }
      else
      {
         scale0 = 1.0 - t;
         scale1 = t;
      }
      x = (double)(scale0 * from.x + scale1 * to1[0]);
      y = (double)(scale0 * from.y + scale1 * to1[1]);
      z = (double)(scale0 * from.z + scale1 * to1[2]);
      w = (double)(scale0 * from.w + scale1 * to1[3]);
   }

   void Yaw(Degrees angle)
   {
      double sa = sin( angle / 2 );
      double ca = cos( angle / 2 );

      x = 0;
      y = (double)sa;
      z = 0;
      w = (double)ca;
   }

   void YawPitch(Degrees yaw, Degrees pitch)
   {
      double sYaw   = sin( yaw / 2 );
      double cYaw   = cos( yaw / 2 );
      double sPitch = sin( pitch / 2 );
      double cPitch = cos( pitch / 2 );

      w = cPitch * cYaw;
      x = sPitch * cYaw;
      y = cPitch * sYaw;
      z = sPitch * sYaw;
   }

   void Pitch(Degrees angle)
   {
      double sa = sin( angle / 2 );
      double ca = cos( angle / 2 );

      x = (double)sa;
      y = 0;
      z = 0;
      w = (double)ca;
   }

   void Roll(Degrees angle)
   {
      double sa = sin( angle / 2 );
      double ca = cos( angle / 2 );

      x = 0;
      y = 0;
      z = (double)sa;
      w = (double)ca;
   }

   void RotatePitch(Degrees pitch)
   {
      Quaternion rotation, result;

      rotation.Pitch(pitch);
      result.Multiply(rotation, this);
      this = result;
   }

   void RotateYaw(Degrees yaw)
   {
      Quaternion rotation, result;
      rotation.Yaw(yaw);
      result.Multiply(rotation, this);
      this = result;
   }

   void RotateRoll(Degrees roll)
   {
      Quaternion rotation, result;

      rotation.Roll(roll);
      result.Multiply(rotation, this);
      this = result;
   }

   void RotateYawPitch(Degrees yaw, Degrees pitch)
   {
      Quaternion rotation, result;
      rotation.YawPitch(yaw, pitch);
      result.Multiply(rotation, this);
      this = result;
   }

   void ToDirection(Vector3D direction)
   {
      /*
      Vector3Df vector { 0,0,1 };
      Matrix mat;
      mat.RotationQuaternion(this);
      direction.Transform(vector, mat);
      */
      direction.x = (double)(    2 * ( x*z - w*y ));
      direction.y = (double)(    2 * ( y*z + w*x ));
      direction.z = (double)(1 - 2 * ( x*x + y*y ));
   }

   void Inverse(Quaternion source)
   {
      this = { -source.w, source.x, source.y, source.z };
   }
};
