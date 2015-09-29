import "mekanopolygon"

define COLORSPRING = orange;
define COLORPOLY   = magenta;
define COLORBOX    = blue;
define COLORCROSS  = lime;

class MekanoDisplay
{
   Surface surface;

public:
   void drawPolygon(Vector2D position, MekanoPolygon polygon)
   {
      List<MekanoPoint> points=polygon.points;
      if(points.count > 1)
      {
         MekanoPoint point1, point2 = null, firstpoint = null;
         Vector2D point_pos1, point_pos2;
         bool first = true;

         surface.foreground = COLORPOLY;

         for(p : points)
         {
            if(first)
            {
               point2 = firstpoint = p;
               first = false;
            }
            else
            {
               point1 = point2;
               point2 = p;
               point_pos1=point1.localPosition;
               point_pos2=point2.localPosition;

               surface.DrawLine((int)(position.x+point_pos1.x), (int)(position.y+point_pos1.y),
                  (int)(position.x+point_pos2.x), (int)(position.y+point_pos2.y));
            }
         }
         point_pos1=point2.localPosition;
         point_pos2=firstpoint.localPosition;
         surface.DrawLine((int)(position.x+point_pos1.x), (int)(position.y+point_pos1.y),
            (int)(position.x+point_pos2.x), (int)(position.y+point_pos2.y));
      }
   }

   void drawBox(Vector2D position, int width)
   {
      surface.foreground = COLORBOX;
      surface.Rectangle(
         (short)position.x-width/2, (short)position.y-width/2,
         (short)position.x+width/2, (short)position.y+width/2);
   }

   void drawCrossHair(Vector2D position, int width)
   {
      surface.foreground = COLORCROSS;
      surface.HLine((short)position.x-width/2, (short)position.x+width/2,
         (short)position.y);
      surface.VLine((short)position.y-width/2, (short)position.y+width/2,
         (short)position.x);
   }

   void drawSpring(Vector2D pos1, Vector2D pos2, int zigs)
   {
      int t;
      float lzig, h = 10.0;
      Vector2D d=pos1;
      Vector2D o;
      Vector2D u, n;
      Vector2D a1, a2;

      surface.foreground = COLORSPRING;

      o.subtract(pos2, pos1);

      u=o.unit;
      n=o.normal;
      lzig=o.length/zigs;

      // a1=u*(lzig*1/4)+n*h;
      {
         Vector2D t1, t2;
         t1.scale(u, lzig*1/4);
         t2.scale(n, h);
         a1.add(t1, t2);
      }

      // a2=u*(lzig*2/4)-n*h*2.0;
      {
         Vector2D t1, t2;
         t1.scale(u, lzig*2/4);
         t2.scale(n, h*2.0f);
         a2.subtract(t1, t2);
      }

      for (t=0; t<zigs; t++)
      {
         Vector2D end;
         end.add(d, a1);
         surface.DrawLine((int)d.x, (int)d.y, (int)end.x, (int)end.y);
         d = end;

         end.add(d, a2);
         surface.DrawLine((int)d.x, (int)d.y, (int)end.x, (int)end.y);
         d = end;

         end.add(d, a1);
         surface.DrawLine((int)d.x, (int)d.y, (int)end.x, (int)end.y);
         d = end;
      }
   }
}
