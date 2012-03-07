int ShowDistance(int d, String units)
{
   // printf("The distance is %d %s.\n", d, units);
   PrintLn("The distance is ", d, " ", units, ".");
   return d;
}

class VariablesApp : Application
{
   void Main()
   {
      PrintLn("The function returned: ", ShowDistance(54, "feet"));
      system("pause");
   }
}
