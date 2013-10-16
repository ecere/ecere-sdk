import "math"

define PI=3.14159265358979323846;
define BOX_TOLERANCE=0.5;

define max_version_code_supported=0;
define version_name="0.0";
   //This string should be no longer than 15 characters

public:

//Coordinates are in units of pixels
//Velocity is in units of pixels per frame
//A frame is defined as 1/LOGICAL_FPS seconds, or one iteration of g_frame()

define LOGICAL_FPS=512;
   //is really 512, but this is for testing
//define DRAWN_FPS=60;

enum GameLineType {regular,speed,slow,decor};
enum GameFloorOrCeiling {floor,ceiling,both};

enum GameVehicleType {none, ball};

struct GameLine {
   double x0,y0,x1,y1;
   GameLineType type;
   GameFloorOrCeiling floor_or_ceiling;
};
class GameVehicle {
   //complicated vehicles that can't be described by a single location/velocity need something
   //  so the camera will center on it.
   Coord2D location;
	Vector2D velocity;
   GameVehicleType type;

   void OnSerialize(IOChannel channel)
   {
      channel.Put(type);
      channel.Put(location);
      channel.Put(velocity);
   }

   void OnUnserialize(IOChannel channel)
   {
      if(!this)
      {
         GameVehicleType vtype;
         channel.Get(vtype);
         if(vtype == ball)
         {
            GameBall::OnUnserialize(class(GameBall), this, channel);
            return;
         }
         else
            this = GameVehicle { };
      }

      if(!type)
         channel.Get(type);
      channel.Get(location);
      channel.Get(velocity);
   }

   virtual void Update(Game game);
};
class GameBall : GameVehicle {
   type = ball;

	double radius;
	double elasticity;
	double angle;
	double angle_velocity;

   void OnSerialize(IOChannel channel)
   {
      GameVehicle::OnSerialize(channel);
      channel.Put(radius);
      channel.Put(elasticity);
      channel.Put(angle);
      channel.Put(angle_velocity);
   }

   void OnUnserialize(IOChannel channel)
   {
      this = GameBall { };
      GameVehicle::OnUnserialize(channel);
      channel.Get(radius);
      channel.Get(elasticity);
      channel.Get(angle);
      channel.Get(angle_velocity);
   }

   //support backtracing if ball is within box for line
   void Update(Game game) {
      //TODO:  check for collision with other balls
      uint count;
      double time_left=1.0;
      BallLineReturn soonest = {INF,{0,0}};
      GameLine *soonest_line;
      Vector2D vb,vp;
      BallLineReturn bl_result;
      uint max_collisions_per_frame=16;
      do
      {
         double x0 = location.x - radius;
         double y0 = location.y - radius;
         double x1 = location.x + radius;
         double y1 = location.y + radius;
         uint n=0;
         if (velocity.x<0)
            x0 += velocity.x;
         else
            x1 += velocity.x;
         if (velocity.y<0)
            y0 += velocity.y;
         else
            y1 += velocity.y;
         game.FindLinesInBox(x0,y0,x1,y1, true);
         soonest_line=null;
         for (i:game.linesInBox)
         {
            double t;
            n++;
            //TODO:  check for floor/ceiling/decor
            if (i.type == decor)
               continue;
            vb = {i.x1-i.x0,i.y1-i.y0};
            vp = {i.x0-location.x,i.y0-location.y};

            BallLineCollide(bl_result,radius,velocity,vb,vp);

            t=bl_result.t;
            //TODO:  Find a better way to deal with the teleport problem when ball sits in weird situations
            //  Currently, I'm just filtering out outrageously low negative ts (negative ts don't exactly make sense, but they keep the ball from falling through lines)
            //if (t<=time_left && t<soonest.t) {
            if (t>-100.0 && t<=time_left && t<soonest.t) {
               soonest = bl_result;
               soonest_line=&i;
               //printf("Collide with line %ld Q=(%f,%f,%f,%f) L=(%f,%f,%f,%f)\n", soonest_line-game.lines.array, x0,y0,x1,y1, );
            }
         }
         if (soonest_line)
         {
            Vector2D v_parallel, v_normal;
            Vector2D v_parallel_normalized;
            double dp;
            double elasticity_cur;
            bool clockcont = false; //if positive angle velocity contributes to speed toward parallel of ball velocity

            //printf("COLLIDE! (location=(%f, %f), p = <%f, %f>)\n",location.x, location.y, soonest_line->x0-location.x,soonest_line->y0-location.y);

            //if (soonest.t<0.0)
            //   PrintLn("Negative time ", soonest.t);
            //if (soonest.t>=0.0 && soonest.t<0.01)
            //   PrintLn("Negative time after subtract", soonest.t);

            soonest.t-=0.01; //don't fall all the way in, or we'll have multiple collisions after this

            //compensate for the time taken to get to the collision
            location.x += velocity.x*soonest.t;
            location.y += velocity.y*soonest.t;
            time_left -= soonest.t;

            //decompose into parallel and normal vectors (with relation to line of collision)
            v_parallel = soonest.s;
            dp = DotProduct(velocity, soonest.s);
            v_parallel.x *= dp;
            v_parallel.y *= dp;
            v_normal.Sub(velocity, v_parallel);

            /* //elastic collision:  v' = vp-e*vn;
            v_normal.x *= elasticity;
            v_normal.y *= elasticity;
            velocity.Sub(v_parallel,v_normal);
            */

            if (v_normal.y!=0.0 && v_parallel.x!=0.0) {
               if ((v_normal.y>0 && v_parallel.x>0) || (v_normal.y<0 && v_parallel.x<0))
                  clockcont = true;
            } else {
               if ((v_normal.x<0 && v_parallel.y>0) || (v_normal.x>0 && v_parallel.y<0))
                  clockcont = true;
            }

            //we need a reference to this before v_normal gets zeroed if elasticity_cur is 0.
            v_parallel_normalized = {-v_normal.y, v_normal.x};
            v_parallel_normalized.Normalize();

            elasticity_cur = -elasticity;
            if (soonest_line->type != regular)
               elasticity_cur *= 0.3; //to make speed lines easier to use

            //elastic collision:  multiply the normal by negative elasticity
            v_normal.x *= elasticity_cur;
            v_normal.y *= elasticity_cur;

            //an attempt at the effects of angular velocity and friction
            {
               double gs; //goal velocity squared
               double g; //goal velocity
               double gsfa; //goal velocity contributed by angular velocity
               bool gneg = false; //g is negative
               double dampener = 0.01;

               gs = 3*DotProduct(v_parallel,v_parallel);
               gsfa = 2*angle_velocity*angle_velocity*PI*radius*radius*radius;
               gsfa *= dampener;
               if (angle_velocity<0)
                  gsfa = -gsfa;
               if (clockcont)
                  gs += gsfa;
               else
                  gs -= gsfa;
               gs /= 3+(2*PI*radius*dampener);
               if (gs < 0.0) {
                  gneg = true;
                  gs = -gs;
               }
               g = sqrt(gs);
               if (gneg)
                  g = -g;
               g *= 0.9993; //energy loss
               v_parallel = v_parallel_normalized;
               if (clockcont) {
                  v_parallel.x = -v_parallel.x;
                  v_parallel.y = -v_parallel.y;
               }
               v_parallel.x *= g;
               v_parallel.y *= g;
               if (clockcont)
                  angle_velocity = g/radius;
               else
                  angle_velocity = -g/radius;
            }

            velocity.Add(v_parallel, v_normal);

            //at last, we'll handle speed/slow lines by simply changing the angular velocity
            if (soonest_line->type == slow)
               angle_velocity -= 0.001;
            else if (soonest_line->type == speed)
               angle_velocity += 0.001;
         }
         else
            location.Add(location,velocity);
         if (!max_collisions_per_frame--)
            break;
      } while (soonest_line);
      velocity.Add(velocity, game.gravity);
      angle += angle_velocity;
      if (angle<0 || angle>=2*3.1415926535897932384626)
		   angle = fmod(angle,2*3.1415926535897932384626); //prevents angle from accumulating an insanely high or low value
   }
};

class Game {
public:
   Instance master;
   Array<GameLine> lines {};
   Array<GameLine> linesInBox {};
   Array<uint> linesInBoxIndices {};
   Array<GameVehicle> vehicles {};
   Vector2D gravity;

   uint version_code; //which version of OpenRider to act like

   version_code = max_version_code_supported;

   ~Game() { FreeAll(); }
   void FreeAll(void) {
      for (i:vehicles)
         delete i;
      //we don't need to worry about the other things because they are automatically freed
   }

   void OnUnserialize(IOChannel channel)
   {
      FreeAll();

      channel.Get(gravity);
      channel.Get(lines);
      channel.Get(vehicles);
   }

   void OnSerialize(IOChannel channel)
   {
      channel.Put(gravity);
      channel.Put(lines);
      channel.Put(vehicles);
   }

   void Init(void) {
      gravity = {0, 0.002};
      Clear();
      ResetBall();
   }
   void Clear(void) {
      lines.size = 0;
      version_code = max_version_code_supported;
   }
   void ResetBall(void) {
      for (i:vehicles)
         delete i;
      vehicles.size = 1;

      vehicles[0] = GameBall {
         location = {-300+32,-200+32};
         velocity = {0.0, 0.0};
         radius = 24.0;
         elasticity = 0.3; //if this is 0, the ball rolls the wrong way for some reason
         angle = 0.0;
         angle_velocity = 0.0;
      };
   }
   void Frame(void)
   {
      for (i:vehicles)
      {
         GameVehicle v = i;
         v.Update(this);
      }
   }
   void FrameMulti(uint count) {
      while (count--)
         Frame();
   }
   //parameters are the camera's field of vision or bigger
   void DrawFrame(double x0, double y0, double x1, double y1) {
      FindLinesInBox(x0,y0,x1,y1, true);
      for (i:linesInBox)
         DrawLine(master, i);
   	for (i:vehicles) {
         if (i.type==ball)
   		   DrawBall(master, (GameBall)i);
      }
   }

   void AddLineSeries(double c_array[],uint count) {
      double *c=c_array;
      if (count<2)
      	return;
      count--;
      for (;count--;c+=2)
         lines.Add({c[0],c[1],c[2],c[3],regular,floor});
   }

   //returns true if any lines were erased
   bool EraseAtBox(double x0, double y0, double x1, double y1) {
      uint erasures = 0;
      FindLinesInBox(x0,y0,x1,y1, false);
      //the linesInBoxIndices array is assumed to be sorted
      for (i:linesInBoxIndices) {
         uint r = i-erasures;
         //FindLinesInBox only gives us an estimate of lines in the box, so we will do a finer check here
         if (!LineReallyInBox(lines[i].x0, lines[i].y0, lines[i].x1, lines[i].y1, x0,y0,x1,y1))
            continue;
         //lines.Remove((IteratorPointer)(lines.array+i-erasures));
         memmove(lines.array+r, lines.array+r+1, (lines.size-r-1)*sizeof(*lines.array));
         erasures++;
      }
      lines.size -= erasures;
      return !!erasures;
   }

   //used for efficiency, not for precision
   //This only checks for lines in box by looking at the bounding boxes of lines in question
   void FindLinesInBox(double x0, double y0, double x1, double y1, bool tolerance) {
      #define Swap(a,b) {tmp=a;a=b;b=tmp;}
      double tmp;
      if (x0>x1)
         Swap(x0,x1);
      if (y0>y1)
         Swap(y0,y1);
      if (tolerance) {
         x0 -= BOX_TOLERANCE;
         y0 -= BOX_TOLERANCE;
         x1 += BOX_TOLERANCE;
         y1 += BOX_TOLERANCE;
      }
      linesInBox.minAllocSize = lines.count;
      linesInBoxIndices.minAllocSize = lines.count;
      linesInBox.RemoveAll();
      linesInBoxIndices.RemoveAll();
      for (i:lines) {
         double lx0=i.x0,ly0=i.y0,lx1=i.x1,ly1=i.y1;
         if (lx0>lx1)
            Swap(lx0,lx1);
         if (ly0>ly1)
            Swap(ly0,ly1);
         if (lx0>x1 || ly0>y1 || x0>lx1 || y0>ly1)
            continue;
         linesInBox.Add(i);
         linesInBoxIndices.Add(&i - lines.array);
      }
      #undef Swap
   }

   virtual void Instance::DrawLine(GameLine line);
   virtual void Instance::DrawBall(GameBall ball);
}

/*void g_init(void);
void g_uninit(void);
void g_frame(void);
void g_frame_multi(uint count);
void g_draw_frame(void);

void g_add_line(double x0,double y0,double x1,double y1,char type,char floor_or_ceiling);
*/
