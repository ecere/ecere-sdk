#include <stdio.h>

enum KnownColor
{
   black   = 0,
   red     = 0xFF0000,
   green   = 0x00FF00,
   blue    = 0x0000FF,
   yellow  = 0xFFFF00,
   magenta = 0xFF00FF,
   cyan    = 0x00FFFF,
   white   = 0xFFFFFF,
};

char GetOperation()
{
   char operation = 0;
   PrintLn("Chose an operation to perform: +, -. q to quit.");
   do
   {
      char input[1024];
      gets(input);
      switch(input[0])
      {
         case '+': case '-': case 'q':
            operation = input[0];
            break;
         default:
            PrintLn("Invalid Operation");
      }
   } while(!operation);
   return operation;
}

KnownColor GetOperand()
{
   KnownColor operand;
   char input[1024];
   gets(input);
   while(!operand.OnGetDataFromString(input))
   {
      Print("Please enter a known color (black, red, green, blue, yellow, magenta, cyan or white)");
      gets(input);
   }
   return operand;
}

KnownColor ComputeOperation(char operation, KnownColor operand1, KnownColor operand2)
{
   switch(operation)
   {
      case '+': return operand1 + operand2;
      case '-': return operand1 - operand2;
   }
}

class Lab5ColorsApp : Application
{
   void Main()
   {
      while(true)
      {
         KnownColor operand1, operand2;
         char operation = GetOperation();
         if(operation == 'q') break;

         PrintLn("Enter the first operand:");
         operand1 = GetOperand();
         PrintLn("Enter the second operand:");
         operand2 = GetOperand();
         {
            KnownColor result = ComputeOperation(operation, operand1, operand2);
            PrintLn(operand1, " ", operation, " ", operand2, " = ", result);
         }
      }
      system("pause");
   }
}
