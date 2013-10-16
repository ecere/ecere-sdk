public:

struct Vector2D {
   double x,y;

   void Set(double sx, double sy) {
      x = sx;
      y = sy;
   }
   void Add(Vector2D a, Vector2D b) {
      x = a.x+b.x;
      y = a.y+b.y;
   }
   void Sub(Vector2D end, Vector2D start) {
      x = end.x-start.x;
      y = end.y-start.y;
   }
   void Normalize(void) {
      double magnitude=sqrt(x*x+y*y);
   	x/=magnitude;
   	y/=magnitude;
   }
   double Magnitude(void) {
      return sqrt(x*x+y*y);
   }

};

struct Coord2D : Vector2D {};

double DotProduct(Vector2D a, Vector2D b) {
   return a.x*b.x+a.y*b.y;
}

define INF=(1.0/0.0);

struct BallLineReturn {
	double t; //time the ball collided with the line (a value from 0.0 up unless we are backtracing)
	Vector2D s; //unit vector representing slope of line collided with
};

/*
Returns the time of intersection between the path of a moving point and a line
	a is the velocity of the moving point
	b is the vector from start to end of the line
	p is the vector from the moving point to the start point on the line

Returns INF if the point never runs into the line.  Also returns INF
	if both lines are parallel (even if they do overlap).
*/
double LineIntersect(const Vector2D a,const Vector2D b,const Vector2D p)
{
	double d = a.y*b.x - a.x*b.y;
	double t,tb;
	if (d==0.0)
		return INF; //the lines are parallel or one has a zero size
	t  = (b.x*p.y-b.y*p.x)/d;
	if (t>=0.0 /* && t<=1.0 */) //we don't check the range of the time of the ball because we might be backtracing
	{ //the intersection lies on the path of the moving point
		tb = (a.x*p.y-a.y*p.x)/d;
		if (tb>=0.0 && tb<=1.0) //the intersection exists on both line segments
			return t;
	}
	return INF; //the lines intersect somewhere, just not on both line segments
}

/*
Returns the time of intersection between the path of a moving point and a circle
	a is the velocity of the moving point
	r is the radius of the circle
	c is the vector from the moving point to the center of the circle

Returns INF if the point never runs into the circle.  If the point is not moving,
	returns INF unless the point is exactly on the circle, then it returns 0.
*/
double CircleIntersect(const Vector2D a,double r,const Vector2D c)
{
	double qa,qb,qc; //values in the quadratic equation
	double d; //the discriminant, meaning b^2-4ac
	double ds; //the square root of the discriminant
	double tm,tp; //possible results
	#define dp DotProduct
		qa=dp(a,a);
		qb=-2*dp(a,c);
		qc=dp(c,c)-r*r;
	#undef dp
	if (qa==0.0)
	{ //the point is not moving, so it will only be intersecting if it is currently on the circle
		if (qc==0.0)
			return 0.0;
		return INF;
	}
	qa*=2.0;
	d = qb*qb-2*qa*qc;
	if (d<0.0)
		return INF; //the point's path never crosses the circle
	ds=sqrt(d);
	tm=(-qb-ds)/qa;
	tp=(-qb+ds)/qa;
	if (tm<tp && tm>=0.0)
		return tm;
	else if (tp>=0.0)
		return tp;
	else
		return INF; //the point collided with the line only in the past
}

static void ball_line_collide_sub(BallLineReturn ret,double r,const Vector2D a,const Vector2D b,const Vector2D pc,const Vector2D pa,const Vector2D pb)
{
	Vector2D pc1;
	double t_pa,t_pb,t_c0,t_c1;

	//TODO:  Consider |b|=0

	t_pa=LineIntersect(a,b,pa);
	t_pb=LineIntersect(a,b,pb);

   ret.s = b;
	if (t_pa<t_pb && t_pa!=INF)
	{
		ret.t=t_pa;
		goto finalize;
	}
	else if (t_pb!=INF)
	{
		ret.t=t_pb;
		goto finalize;
	}

	t_c0=CircleIntersect(a,r,pc);

	if (t_c0!=INF)
	{
		ret.t=t_c0;
		ret.s.x = a.y*t_c0 - pc.y;
		ret.s.y = pc.x - a.x*t_c0;
		goto finalize;
	}

   pc1.Add(pc, b);
	t_c1=CircleIntersect(a,r,pc1);

	if (t_c1!=INF)
	{
		ret.t=t_c1;
		ret.s.x = a.y*t_c1 - pc1.y;
		ret.s.y = pc1.x - a.x*t_c1;
		goto finalize;
	}

	ret.t=INF;
	return;
finalize:
	//at this point, ret.s should not have a magnitude of 0
   ret.s.Normalize();
}

void BallLineCollide(BallLineReturn ret,double r,const Vector2D a,const Vector2D b,const Vector2D pc)
{
	Vector2D pa,pb,p;
	Vector2D a2; //copy of 'a' that can be reversed for backtracing
	char backtracing=0;
   //printf("Colliding %f, <%f,%f>, <%f,%f>, <%f,%f>\n", r, a.x, a.y, b.x, b.y, pc.x, pc.y);

	//TODO:  Consider |b|=0

	//initialize some vectors
   a2 = a;
   p.x = b.y;
   p.y = -b.x;
   p.Normalize();
	p.x*=r;
	p.y*=r;
   pa.Sub(pc,p);
   pb.Add(pc,p);
	p.x*=2.0;
	p.y*=2.0;

	//Find out if the ball is inside the line (and thus if we need to backtrace)
	{

		double dist_ca,dist_cb;
		double b_squared,p_squared,v_dot_b,v_dot_p;
		double pcx=pc.x,pcy=pc.y;

		dist_ca=pcx*pcx+pcy*pcy;
		pcx+=b.x;
		pcy+=b.y;
		dist_cb=pcx*pcx+pcy*pcy;
		if (dist_ca<r*r || dist_cb<r*r)
			backtracing=1;
		else
		{
			b_squared=b.x*b.x+b.y*b.y;
			p_squared=p.x*p.x+p.y*p.y;
			v_dot_b=-pa.x*b.x-pa.y*b.y;
			v_dot_p=-pa.x*p.x-pa.y*p.y;
			if (0.0<v_dot_b && v_dot_b<b_squared)
				if (0.0<v_dot_p && v_dot_p<p_squared)
					backtracing=1;
		}
	}
	if (backtracing)
	{
		a2.x=-a2.x;
		a2.y=-a2.y;
	}
	ball_line_collide_sub(ret,r,a2,b,pc,pa,pb);
	if (backtracing)
		ret.t=-ret.t;
   //printf("Result:  %f, <%f,%f>\n", ret.t, ret.s.x, ret.s.y);
}

//Tests to see if the line really is in the box (rather than just comparing bounding rectangles)
bool LineReallyInBox(double l0x, double l0y, double l1x, double l1y, double r0x, double r0y, double r1x, double r1y)
{
   double j,k,m,n,p,q;
   double tmp;
   #define swap(a,b) {tmp=a; a=b; b=tmp;}
   if (r0x>r1x)
      swap(r0x, r1x);
   if (r0y>r1y)
      swap(r0y, r1y);
   j = l1y-l0y;
   k = l1x-l0x;
   m = r0x-l0x;
   n = r1x-l0x;
   p = r0y-l0y;
   q = r1y-l0y;
   if (j<0)
      swap(n,m);
   if (k<0)
      swap(p,q);
   if (j*m<=k*q && j*n>=k*p) {
      //The infinite-length line parallel to the line in question intersects, but we need to
      // make sure that the line terminated at the given points actually makes it to the rectangle
      //We do that by checking for intersection of the box of the line and the rectangle
      if (l0x>l1x)
         swap(l0x, l1x);
      if (l0y>l1y)
         swap(l0y, l1y);
      if (l0x<=r1x && l0y<=r1y && r0x<=l1x && r0y<=l1y)
         return true;
      return false;
   }
   return false;
   #undef swap
}
