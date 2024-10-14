public import "ecere"

public struct ColorARGBd { double a, r, g, b; };

class RTObject
{
   Material material { diffuse = { 40/255.0f, 200/255.0f, 1.0f } };
   Quaternion orientation { 1, 0, 0, 0 };
   Vector3D localLightDirection[3];
   Vector3D localCameraDirection;
   Vector3D size;

   virtual void Compute(RTScene scene);
   virtual bool Render(Camera camera, RTScene scene, const Line ray, ColorARGBd * color, Vector3D intersect, Vector3D vIntersect)
   {
      return false;
   }
   virtual bool IsPointInside(const Vector3D p) { return false; }

   bool WalkTowards(const Line fromL, Vector3D is, double dt, int refineCount, bool backwards)
   {
      Line l;
      double t = 0;
      int refine = 0;
      double refineDT = dt;
      double refineDT10 = refineDT * 10;
      double stopT = MAXDOUBLE;
      bool firstPointInside = false;
      Vector3D halfSize = { size.x / 2, size.y / 2, size.z / 2 };
      if(backwards && IsPointInside(fromL.p0))
      {
         firstPointInside = true;
         l.p0 = fromL.p0;
         l.delta.Scale(fromL.delta, -1);
      }
      else
         l = fromL;

      while(true)
      {
         Vector3D p
         {
            l.p0.x - l.delta.x * t,
            l.p0.y - l.delta.y * t,
            l.p0.z - l.delta.z * t
         };
         if(p.x + refineDT10 < -halfSize.x || p.x - refineDT10 > halfSize.x ||
            p.y + refineDT10 < -halfSize.y || p.y - refineDT10 > halfSize.y ||
            p.z + refineDT10 < -halfSize.z || p.z - refineDT10 > halfSize.z)
         {
            // Print("");
            break;
         }

         if(IsPointInside(p) != firstPointInside)
         {
            refine++;
            stopT = t;
            t -= refineDT;
            refineDT /= 2;
            refineDT10 = refineDT * 10;
         }
         if(t > stopT)
         {
            Vector3D p
            {
               l.p0.x - l.delta.x * stopT,
               l.p0.y - l.delta.y * stopT,
               l.p0.z - l.delta.z * stopT
            };
            is = p;
            return true;
         }
         if(refine == refineCount)
         {
            if(is != null) is = p;
            return true;
         }
         t += refineDT;
      }
      return false;
   }
                             // This should be the local normal?
   void applyColor(RTScene scene, /*const */Vector3D normal, const Vector3D p, const Material mat, ColorARGBd color)
   {
      double r = 0, g = 0, b = 0;
      int lid = 0;

      if(mat == null) mat = this.material;

      for(lt : scene.lights)
      {
         Light * light = lt;
         double l = -normal.DotProduct(localLightDirection[lid]);
         double sl = l;
         bool shadowed = false;

         if(l > 0)
         {
            Line fromLight { };

            fromLight.delta = localLightDirection[lid];
            fromLight.p0.Subtract(p, fromLight.delta);
            if(WalkTowards(fromLight, null, 0.5, 30, false))
               shadowed = true;
         }

         if(l < 0) l = 0;
         if(shadowed) l /= 3;

         r += light->multiplier * light->ambient.r * mat.ambient.r + l * mat.diffuse.r * light->multiplier * light->diffuse.r;
         g += light->multiplier * light->ambient.g * mat.ambient.g + l * mat.diffuse.g * light->multiplier * light->diffuse.g;
         b += light->multiplier * light->ambient.b * mat.ambient.b + l * mat.diffuse.b * light->multiplier * light->diffuse.b;

         if(!shadowed && l > 0)
         {
            double n2 = normal.DotProduct(normal);
            Vector3D R = normal;
            R.Scale(R, 2*sl/n2);
            R.Add(R, localLightDirection[lid]); // R.Subtract(R, localLightDirection[lid]);
            R.Normalize(R);
            l = -R.DotProduct(localCameraDirection);
            if(l < 0) l = 0;

            r += pow(l, mat.power) * light->multiplier * light->specular.r * mat.specular.r;
            g += pow(l, mat.power) * light->multiplier * light->specular.g * mat.specular.g;
            b += pow(l, mat.power) * light->multiplier * light->specular.b * mat.specular.b;
         }

         lid++;
      }
      r += scene.globalAmbient.r * mat.ambient.r;
      g += scene.globalAmbient.g * mat.ambient.g;
      b += scene.globalAmbient.b * mat.ambient.b;

      if(r < 0) r = 0; if(r > 1) r = 1;
      if(g < 0) g = 0; if(g > 1) g = 1;
      if(b < 0) b = 0; if(b > 1) b = 1;

      color = { mat.opacity, r, g, b };
   }
}

public class RTScene
{
   List<RTObject> objects { };
   List<Light *> lights { };
   ColorRGB globalAmbient; globalAmbient = { 0.1, 0.1, 0.1 };

   void Compute()
   {
      for(o : objects)
         o.Compute(this);
   }
   bool Trace(Camera camera, Line ray, ColorARGBd color)
   {
      Vector3D vIntersect;
      double z = MAXDOUBLE;
      bool result = false;
      color = { };

      for(o : objects)
      {
         RTObject obj = o;
         ColorARGBd newColor;

         // TOFIX: &ray here has different behavior?
         if(obj.Render(camera, this, ray, newColor, null, vIntersect) && vIntersect.z < z)
         {
            z = vIntersect.z;
            // TODO: Add blending support here
            color = newColor;
            result = true;
         }
      }
      return result;
   }
}
