#include <stdio.h>

bool DoubleToString(char * string, double * value)
{
   char * end;
   *value = strtod(string, &end);
   return end > string;
}

char GetOperation()
{
   char operation = 0;
   PrintLn("Chose an operation to perform: +, -, *, /, ^. q to quit.");
   do
   {
      char input[1024];
      gets(input);
      switch(input[0])
      {
         case '+': case '-': case '*': case '/': case '^': case 'q':
            operation = input[0];
            break;
         default:
            PrintLn("Invalid Operation");
      }
   } while(!operation);
   return operation;
}

double GetOperand()
{
   double operand;
   char input[1024];
   gets(input);
   while(!DoubleToString(input, &operand))
   {
      PrintLn("Print enter a valid numeric value");
      gets(input);
   }
   return operand;
}

double ComputeExponent(double base, int power)
{
   double result = 1;
   int c;
   for(c = 0; c < power; c++)
      result *= base;
   return result;
}

double ComputeOperation(char operation, double operand1, double operand2)
{
   switch(operation)
   {
      case '+': return operand1 + operand2;
      case '-': return operand1 - operand2;
      case '*': return operand1 * operand2;
      case '/': return operand1 / operand2;
      case '^': return ComputeExponent(operand1, (int)operand2);
   }
}

class Lab4App : Application
{
   void Main()
   {
      while(true)
      {
         double operand1, operand2;
         char operation = GetOperation();
         if(operation == 'q') break;

         PrintLn("Enter the first operand:");
         operand1 = GetOperand();
         PrintLn("Enter the second operand:");
         operand2 = GetOperand();
         if(operation == '/' && operand2 == 0)
            PrintLn("Cannot divide by 0");
         else
         {
            double result = ComputeOperation(operation, operand1, operand2);
            PrintLn(operand1, " ", operation, " ", operand2, " = ", result);
         }
      }
      system("pause");
   }
}
