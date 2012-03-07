class VariablesApp : Application
{
   void Main()
   {
      int a, b;
      float phi = 1.618f;
      char comma = ',';
      String h = "hello", w = "world";
      PrintLn("The value of a was ", a);
      a = 1234;
      PrintLn("After the assignment, a is now ", a);
      PrintLn("The value of b was ", b);
      b = a;
      PrintLn("After the assignment, b is now ", b);
      PrintLn("phi = ", phi, ", more roughly ", (int)(phi * 10 + 0.5)/10.0f);
      PrintLn(h, comma, " ", w);

      system("pause");
   }
}
