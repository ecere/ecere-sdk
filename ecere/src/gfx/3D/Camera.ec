namespace gfx3D;

import "Display"

public enum CameraType { fixed, fixedQuaternion, attached, attachedQuaternion, lookAt, lookAtObject };
public enum FovDirection { widest, horizontal, vertical };

public enum ClippingPlane { left, right, top, bottom, near, far };

public class Camera
{
public:
   // Change type to inherited types...
   property CameraType type { set { type = value; } get { return type; } };
   property Vector3D position { set { position = value; } get { value = position; } };
   property Quaternion orientation { set { orientation = value; if(type == attached || type == fixed) eulerOrientation = value; } get { value = orientation; } };
   property Euler eulerOrientation { set { eulerOrientation = value; if(type == attached || type == fixed) orientation = value; } get { value = eulerOrientation; } };
   property Vector3D cPosition { get { value = cPosition; } };
   property Quaternion cOrientation { get { value = cAngle; } };
   property Degrees fov { set { fov = value; } get { return fov; } };
   property float zMin { set { zMin = value; } get { return zMin; } };
   property float zMax { set { zMax = value; } get { return zMax; } };
   property Object target { set { target = value; } get { return target; } };
   property FovDirection fovDirection { set { fovDirection = value; } get { return fovDirection; } };
   property float aspectRatio { set { aspectRatio = value; } get { return aspectRatio; } };
   property Size focal { get { value = { focalX, focalY }; } set { focalX = value.w; focalY = value.h; } };

   void Setup(int width, int height, const Point origin)
   {
      if(this)
      {
         Quaternion quat;

         float aspectRatio = this.aspectRatio;
         float l, r, t, b;

         if(!aspectRatio)
            aspectRatio = (float)width/height;

         this.width = width;
         this.height = height;
         if(origin != null)
            this.origin = origin;
         else
         {
            this.origin.x = width/2;
            this.origin.y = height/2;
         }

         l = this.origin.x - 0;
         r = this.origin.x - width;
         t = 0 - this.origin.y;
         b = height - this.origin.y;

         if(fovDirection == horizontal || (fovDirection == widest && width * aspectRatio > height))
         {
            focalX = (float)((width / 2) / tan(fov/2));
            focalY = focalX * height / width;
            focalY *= aspectRatio;
            fovX = fov;
         }
         else
         {
            focalY = (float)((height / 2) / tan(fov/2));
            focalX = focalY * width / height;
            focalX /= aspectRatio;
            fovY = fov;
         }

         fovX = atan((width / 2)  / focalX) * 2;
         fovY = atan((height / 2) / focalY) * 2;

         fovLeft   = atan(l / focalX);
         fovRight  = atan(r / focalX);
         fovTop    = atan(t / focalY);
         fovBottom = atan(b / focalY);

         // Compute Clipping Planes
         {
            Vector3D normal, point = {0,0,0};

            // --- Left ---
            quat.Yaw(fovLeft - Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[left].FromPointNormal(normal, point);

            // --- Right ---
            quat.Yaw(fovRight + Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[right].FromPointNormal(normal, point);

            // --- Top ---
            quat.Pitch(fovTop + Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[top].FromPointNormal(normal, point);

            // --- Bottom ---
            quat.Pitch(fovBottom - Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[bottom].FromPointNormal(normal, point);

            // --- Near ---
            normal.x = 0; normal.y = 0; normal.z = 1;
            point.z = zMin;
            viewClippingPlanes[near].FromPointNormal(normal, point);

            // --- Far ---
            normal.x = 0; normal.y = 0; normal.z = -1;
            point.z = zMax;
            viewClippingPlanes[far].FromPointNormal(normal, point);
         }

         needUpdate = true;
      }
   }

   void SetupVR(int width, int height, const Matrix prjMatrix)
   {
      if(this)
      {
         Quaternion quat;
         float aspectRatio = this.aspectRatio;
         double A = prjMatrix.m[2][0];
         double B = prjMatrix.m[2][1];
         //double C = prjMatrix.m[2][2];
         //double D = prjMatrix.m[3][2];
         double n = zMin;
         //double f = zMax;
         double r_l = 1.0 / (prjMatrix.m[0][0] / (2*n));
         double t_b = 1.0 / (prjMatrix.m[1][1] / (2*n));
         double rpl = A * r_l;
         double tpb = B * t_b;
         double l = (rpl - r_l) / 2;
         double b = (tpb - t_b) / 2;
         double r = rpl - l;
         double t = tpb - b;
         float focalX, focalY;

         if(!aspectRatio)
            aspectRatio = (float)width/height;

         this.width = width;
         this.height = height;

         focalX = (float)((width * zMin)  /  r_l);
         focalY = (float)((height * zMin) / -t_b);

         origin.x = (int)( l * width );
         origin.y = (int)(-t * height);

         l = this.origin.x - 0;
         r = this.origin.x - width;
         t = 0 - this.origin.y;
         b = height - this.origin.y;

         fovX = atan((width / 2)  / focalX) * 2;
         fovY = atan((height / 2) / focalY) * 2;

         fovLeft   = atan(-l);
         fovRight  = atan(-r);
         fovTop    = atan(t);
         fovBottom = atan(b);


         // Compute Clipping Planes
         {
            Vector3D normal, point = {0,0,0};

            // --- Left ---
            quat.Yaw(fovLeft - Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[left].FromPointNormal(normal, point);

            // --- Right ---
            quat.Yaw(fovRight + Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[right].FromPointNormal(normal, point);

            // --- Top ---
            quat.Pitch(fovTop + Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[top].FromPointNormal(normal, point);

            // --- Bottom ---
            quat.Pitch(fovBottom - Pi/2);
            quat.ToDirection(normal);
            viewClippingPlanes[bottom].FromPointNormal(normal, point);

            // --- Near ---
            normal.x = 0; normal.y = 0; normal.z = 1;
            point.z = zMin;
            viewClippingPlanes[near].FromPointNormal(normal, point);

            // --- Far ---
            normal.x = 0; normal.y = 0; normal.z = -1;
            point.z = zMax;
            viewClippingPlanes[far].FromPointNormal(normal, point);
         }

         needUpdate = true;
      }
   }

   void AdjustPosition(Vector3D position)
   {
      ClippingPlane c;
      Matrix transpose = viewMatrix;

      cPosition = position;

      transpose.m[0][3] = cPosition.x;
      transpose.m[1][3] = cPosition.y;
      transpose.m[2][3] = cPosition.z;
      inverseTranspose.Inverse(transpose);

      for(c = 0; c<ClippingPlane::enumSize; c++)
         worldClippingPlanes[c].MultMatrix(viewClippingPlanes[c], inverseTranspose);
   }

   void AdjustAngle(Quaternion angle)
   {
      cAngle = angle;

      inverseMatrix.RotationQuaternion(angle);
      viewMatrix.Transpose(inverseMatrix);

      AdjustPosition(cPosition);
   }

   bool Update()
   {
      bool result = false;
      if(this)
      {
         Matrix matrix;
         Transform * target = this.target ? &this.target.transform : null;
         Vector3D oldPosition = cPosition, newPosition;

         switch(this.type)
         {
            case fixed:
            case fixedQuaternion:
            {
               newPosition = position;
               toAngle = orientation;
               break;
            }
            case attached:
            {
               toAngle = { 1,0,0,0 };
               if(target)
               {
                  Euler euler;
                  Euler eulerTarget = this.target.eulerOrientation;

                  euler.Add(eulerOrientation, eulerTarget);

                  // Logf("yaw = %f, pitch = %f\n", eulerCamera.yaw, eulerCamera.pitch);

                  toAngle = euler;
               }
               else
                  toAngle = orientation;

               matrix.RotationQuaternion(toAngle);
               newPosition.MultMatrix(position, matrix);
               if(target)
                  newPosition.Add(newPosition, target->position);
               break;
            }
            case attachedQuaternion:
            {
               toAngle = { 1,0,0,0 };
               if(target)
               {
                  /*if(type == attached)
                  {
                     Euler eulerCamera = orientation, eulerTarget = target->orientation, euler;

                     euler.Add(eulerCamera, eulerTarget);

                     // Logf("yaw = %f, pitch = %f\n", eulerCamera.yaw, eulerCamera.pitch);

                     toAngle = euler;
                  }
                  else if(type == attachedQuaternion)*/
                     toAngle.Multiply(orientation, target->orientation);
               }
               else
                  toAngle = orientation;

               matrix.RotationQuaternion(toAngle);
               newPosition.MultMatrix(position, matrix);
               if(target)
                  newPosition.Add(newPosition, target->position);
               break;
            }
            case lookAt:
            {
               Quaternion result;
               Vector3D direction;
               newPosition = position;
               if(target)
               {
                  direction.Subtract(target->position, position);
                  toAngle.RotationDirection(direction);
               }
               else
               {
                  Vector3D position { 0, 0, 0 };
                  direction.Subtract(position, this.position);
                  toAngle.RotationDirection(direction);
               }
               result.Multiply(orientation, toAngle);
               toAngle = result;
               break;
            }
            case lookAtObject:
            {
               Object cameraObject = this.cameraObject;
               toAngle = cameraObject.transform.orientation;
               if(cameraObject.flags.root || !cameraObject.parent)
                  newPosition = cameraObject.transform.position;
               else
                  newPosition.MultMatrix(cameraObject.transform.position, cameraObject.parent.matrix);
               break;
            }
         }

         if(cAngle.w != toAngle.w || cAngle.x != toAngle.x ||
            cAngle.y != toAngle.y || cAngle.z != toAngle.z ||
            needUpdate)
         {
            cPosition = newPosition;
            if(slerpAmount && slerpPosition < 1.0)
            {
               Quaternion angle;
               slerpPosition += slerpAmount;
               slerpPosition = Min(slerpPosition, 1.0);
               angle.Slerp(fromAngle, toAngle, slerpPosition);
               AdjustAngle(angle);
            }
            else
               AdjustAngle(toAngle);

            result = true;
            this.needUpdate = false;
         }
         else if(newPosition.x != oldPosition.x || newPosition.y != oldPosition.y || newPosition.z != oldPosition.z)
         {
            AdjustPosition(newPosition);
            result = true;
         }
      }
      return result;
   }

   bool SphereVisible(Vector3D center, float radius)
   {
      // TURN BACK ON
      /*
      if(wLeftNormal.DotProduct(center) + wLeftD < -radius)
         return false;
      if(wRightNormal.DotProduct(center) + wRightD < -radius)
         return false;
      if(wTopNormal.DotProduct(center) + wTopD < -radius)
         return false;
      if(wBottomNormal.DotProduct(center) + wBottomD < -radius)
         return false;
      if(wNearNormal.DotProduct(center) + wNearD < -radius)
         return false;
   /-*   if(wFarNormal.DotProduct(center) + wFarD < -radius)
         return false;*/
      return true;
   }


   bool PointsVisible(Vector3D * points, int numPoints, double threshold)
   {
      ClippingPlane p;
      int c;
      for(p = 0; p < 6; p+=2)
      {
         bool out1a = true, out2a = true;
         bool out1b = true, out2b = true;
         Plane * plane = &worldClippingPlanes[p];
         for(c = 0; c<numPoints; c++)
         {
            double dot =
               plane->a * points[c].x +
               plane->b * points[c].y +
               plane->c * points[c].z;
            if(dot + plane->d > 0)
            {
               out1a = out1b = false;
               break;
            }
            else if(dot + plane->d > -threshold)
               out1a = false;
         }

         plane = &worldClippingPlanes[p+1];
         for(c = 0; c<numPoints; c++)
         {
            double dot =
               plane->a * points[c].x +
               plane->b * points[c].y +
               plane->c * points[c].z;
            if(dot + plane->d > 0)
            {
               out2a = out2b = false;
               break;
            }
            else if(dot + plane->d > -threshold)
               out2a = false;
         }

         if((out1a && !out2b) || (out2a && !out1b))
            return false;
      }
      return true;
   }

/*
   bool PointsVisible(Vector3D * origPoints, int numPoints, double threshold)
   {
      Plane * planes = worldClippingPlanes;
      static byte goodPoints[50];
      static Vector3D points[50];
      static Vector3D newPoints[50];
      bool outside = false;
      int p;
      int i;
      int c = 0;
      int n = numPoints;

      for(c = 0; c<numPoints; c++)
         points[c] = origPoints[c];

      for(p = 0; p < 6; p++)
      {
         Plane * plane = &planes[p];
         int i;
         int numGoodPoints = 0;

         memset(goodPoints, 0, n);
	      for(i = 0; i < n; i++)
         {
            double dot = plane->normal.DotProduct(points[i]);
            double distance = dot + plane->d;
		      if(distance > -threshold)
            {
               numGoodPoints++;
               goodPoints[i] = 1;
            }
	      }
         if(!numGoodPoints)
         {
            outside = true;
            break;
         }

         if(numGoodPoints < n)
         {
            // Clip the polygon
            int newN = 0;
            int lastGood = -1;
            int j;

            for(j = 0; j<n; )
            {
               if(goodPoints[j])
               {
                  newPoints[newN++] = points[j];
                  lastGood = j++;
               }
               else
               {
                  Line edge;
                  int next;

                  if(lastGood == -1)
                     for(lastGood = n-1; !goodPoints[lastGood]; lastGood--);

                  edge.p0 = points[lastGood];
                  edge.delta.Subtract(points[j], edge.p0);
                  plane->IntersectLine(edge, newPoints[newN++]);

                  for(next = j+1; next != j; next++)
                  {
                     if(next == n) next = 0;
                     if(goodPoints[next])
                     {
                        int prev = next - 1;
                        if(prev < 0) prev = n-1;

                        edge.p0 = points[prev];
                        edge.delta.Subtract(points[next], edge.p0);
                        plane->IntersectLine(edge, newPoints[newN++]);
                        break;
                     }
                  }
                  if(next <= j)
                     break;
                  else
                     j = next;
               }
            }
            // Use the new points
            memcpy(points, newPoints, newN * sizeof(Vector3D));
            n = newN;
         }
      }
      return !outside;
   }
*/

   void TransformPoint(Vector3D dest, Vector3D src)
   {
      Vector3D vector { src.x - cPosition.x, src.y - cPosition.y, src.z - cPosition.z };
      dest.MultMatrix(vector, viewMatrix);
   }

   void TransformNormal(Vector3D dest, Vector3D src)
   {
      dest.MultMatrix(src, viewMatrix);
   }

   void TransformMatrix(Matrix dest, Matrix src)
   {
      Matrix matrix = src;
      matrix.m[3][0] -= cPosition.x;
      matrix.m[3][1] -= cPosition.y;
      matrix.m[3][2] -= cPosition.z;
      dest.Multiply(matrix, viewMatrix);
   }

   void RotatePitch(Degrees amount, Degrees min, Degrees max)
   {
      if(type == fixedQuaternion)
      {
         orientation.RotatePitch(amount);
      }
      else
      {
         Euler euler = eulerOrientation;
         euler.pitch += amount;
         if(min || max)
         {
            euler.pitch = Min(euler.pitch, max);
            euler.pitch = Max(euler.pitch, min);
         }
         eulerOrientation = euler;
         orientation = euler;
      }
   }

   void RotateYaw(Degrees amount, Degrees min, Degrees max)
   {
      if(type == fixedQuaternion)
      {
         orientation.RotateYaw(amount);
      }
      else
      {
         Euler euler = eulerOrientation;
         euler.yaw += amount;
         if(min || max)
         {
            euler.yaw = Min(euler.yaw, max);
            euler.yaw = Max(euler.yaw, min);
         }
         eulerOrientation = euler;
         orientation = euler;
      }
   }

   void RotateRoll(Degrees amount, Degrees min, Degrees max)
   {
      if(type == fixedQuaternion)
      {
         orientation.RotateRoll(amount);
      }
      else
      {
         Euler euler = eulerOrientation;
         euler.roll += amount;
         if(min || max)
         {
            euler.roll = Min(euler.roll, max);
            euler.roll = Max(euler.roll, min);
         }
         eulerOrientation = euler;
         orientation = euler;
      }
   }

   void Slerp(float amount)
   {
      fromAngle = cAngle;
      slerpAmount = amount;
      slerpPosition = 0;
   }

   void Move(Vector3D direction)
   {
      Matrix matrix;

      switch(type)
      {
         case fixedQuaternion:
         case fixed:
         {
            Vector3D offset;
            matrix.RotationQuaternion(orientation);
            offset.MultMatrix(direction, matrix);
            position.Add(position, offset);
            break;
         }
         case attachedQuaternion:
         case attached:
         case lookAt:
         {
            position.Add(position, direction);
            break;
         }
      }
   }

   bool Project(Vector3D vector, Vector3D point)
   {
      if(vector.z >= zMin)
      {
         //float floatZ;
         point.x = (vector.x*focalX/vector.z);
         point.y = (vector.y*focalY/vector.z);
         point.z = (((zMax * zMin / -vector.z) + zMax) / (zMax - zMin));
         //floatZ = ((((float)zMax * (float)zMin / -(float)vector.z) + (float)zMax) / ((float)zMax - (float)zMin));
         point.x += origin.x;
         point.y += origin.y;
         return (point.x >= 0 && point.y >= 0 &&
                 point.x < width && point.y < height);
      }
      return false;
   }

   void Unproject(Vector3D point, Vector3D vector)
   {
      vector.z = (zMax * zMin / (zMax - (double)point.z * (zMax-zMin)));
      vector.y = ((point.y - origin.y) * (double)vector.z / focalY);
      vector.x = ((point.x - origin.x) * (double)vector.z / focalX);
   }

   bool ProjectSize(Vector3D vector, Point point)
   {
      if(vector.z >= zMin)
      {
         point.x = (int)((double)vector.x*(double)focalX/(double)vector.z);
         point.y = (int)((double)vector.y*(double)focalY/(double)vector.z);
         return true;
      }
      return false;
   }

   void Untransform(Vector3D src, Vector3D result)
   {
      result.MultMatrix(src, inverseMatrix);
      result.x += cPosition.x;
      result.y += cPosition.y;
      result.z += cPosition.z;
   }

   public void setViewMatrix(Matrix value)
   {
      viewMatrix = value;
   }

   public void setCPosition(Vector3D value)
   {
      cPosition = value;
   }

private:
   Camera()
   {
      needUpdate = true;
      type = fixed;
      orientation.w = 1;
      aspectRatio = 0;
      fov = Pi/2;
      zMin = 5;//0.1f;
      zMax = 10000;
   }

   CameraType type;
   FovDirection fovDirection;
   Object cameraObject;
   Object target;
   public Vector3D position;
   Quaternion orientation;
   Euler eulerOrientation;
   float aspectRatio;
   Degrees fov;
   float zMin, zMax;

   // Read only
   Vector3D cPosition;
   Quaternion cAngle;
   Angle fovLeft, fovRight, fovTop, fovBottom;
   float focalX, focalY;
   Angle fovX, fovY;

   float slerpAmount, slerpPosition;
   Matrix inverseTranspose, inverseMatrix;
   Quaternion fromAngle, toAngle;
   bool needUpdate;
   Matrix viewMatrix;
   int width, height;
   Point origin;
   Plane viewClippingPlanes[ClippingPlane], worldClippingPlanes[ClippingPlane];
};
