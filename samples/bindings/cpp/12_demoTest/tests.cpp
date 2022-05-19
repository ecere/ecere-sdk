#define MODULE_NAME  "Tests"

#include "ecere.hpp"

class TestApp : public Application
{
public:
   void main()
   {
      TArray<double> b { 5.0, 3.2, 1.5 };
      TList<double> a;
      b = { 5.0, 3.2, 1.5 };

      TList<const char *> c { "bgen: ", "Hello", "C++" };
      printLn(c);

      a.add(3.0);
      a.add(4.2);
      a.add(9.5);

      printLn(a);
      // t_args_x<printLn>(a);
      {
         ZString z;
         ZString s = "#";
         // broken: z.concat("#");
         z.concat(s);
         // z.concatx(9);
         // z.concatx("works");
         printLn(z.string);
      }
      {
         ConsoleFile con;
         con.printLn("#works");
         con.print(1, ":1, ", 2, ":2, ", 3, ":3, ", 'x', ":x, ", 4.3, "\n");
      }

      if(sizeof(Point) == sizeof(C(Point)))
         printLn("sizeof(Point) == sizeof(C(Point))");
      else
         printLn("no");

      Transform transform;
      transform.scaling = { 100, 100, 100 };
      transform.orientation = Euler(50, 30, 50);

      printLn(transform);
   }
};

TestApp app;

MAIN_DEFINITION // This handles initialization and defining the application entry point in a cross-platform manner.
