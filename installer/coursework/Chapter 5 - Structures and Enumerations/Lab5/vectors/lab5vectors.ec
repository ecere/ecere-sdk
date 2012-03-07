#include <stdio.h>

struct Vector
{
   float x, y;
};

bool FloatToString(char * string, float * value)
{
   char * end;
   *value = (float)strtod(string, &end);
   return end > string;
}

char GetOperation()
{
   char operation = 0;
   PrintLn("Chose an operation to perform: +, -, *, /, m (module/length). q to quit.");
   do 
   {
      char input[1024];
      gets(input);
      switch(input[0])
      {
         case '+': case '-': case '*': case '/': case 'm': case 'q':
            operation = input[0];
            break;
         default:
            PrintLn("Invalid Operation"); 
      }
   } while(!operation);
   return operation;
}

float GetScalar()
{
   float scalar;
   char input[1024];
   gets(input);
   while(!FloatToString(input, &scalar))
   {
      PrintLn("Print enter a valid numeric value");
      gets(input);
   } 
   return scalar;
}

Vector GetVector()
{
   Vector vector;
   char input[1024];
   gets(input);
   while(!vector.OnGetDataFromString(input))
   {
      PrintLn("Print enter a valid 2D vector value");
      gets(input);
   } 
   return vector;
}

class Lab5VectorApp : Application
{
   void Main()
   {
      while(true)
      {
         Vector vector1, vector2;
         float scalar;
         char operation = GetOperation();
         if(operation == 'q') break;
         
         PrintLn("Enter the first operand:");
         vector1 = GetVector();

         if(operation != 'm')
         {
            PrintLn("Enter the second operand:");
            if(operation == '+' || operation == '-')
               vector2 = GetVector();
            else
               scalar = GetScalar();
         }
         if(operation == '/' && scalar == 0)
            PrintLn("Cannot divide by 0");
         else            
         {
            switch(operation)
            {
               case '+': PrintLn(vector1, " + ", vector2, " = ", Vector { vector1.x + vector2.x, vector1.y + vector2.y }); break;
               case '-': PrintLn(vector1, " - ", vector2, " = ", Vector { vector1.x - vector2.x, vector1.y - vector2.y }); break;
               case '*': PrintLn(vector1, " * ", scalar, " = ", Vector { vector1.x * scalar, vector1.y * scalar }); break;
               case '/': PrintLn(vector1, " / ", scalar, " = ", Vector { vector1.x / scalar, vector1.y / scalar }); break;
               case 'm': PrintLn("|",vector1,"| = ", sqrt(vector1.x * vector1.x + vector2.y * vector2.y)); break;
            }
         }
      }
      system("pause");
   }
}
