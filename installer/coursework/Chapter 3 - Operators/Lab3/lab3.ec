bool IsGreaterThan10(int value)
{
   PrintLn("IsGreaterThan10!");
   return value > 10;
}

class OperatorsApp : Application
{
   void Main()
   {
      PrintLn(" *** Question 4 *** ");
      {
         int a = 12, b = 7, c;
         c = b - a + 23;
         PrintLn(c);
      }
      PrintLn(" *** Question 6 *** ");
      {
         int result = 5 + 3 * 4;
         PrintLn(result);
      }
      PrintLn(" *** Question 7 *** ");
      {
         int result = (5 + 3) * 4;
         PrintLn(result);
      }
      PrintLn(" *** Question 8 *** ");
      {
         int result = 17 / 4;
         PrintLn(result);
      }
      PrintLn(" *** Question 9 *** ");
      {
         int result = 17 % 4;
         PrintLn(result);
      }
      PrintLn(" *** Question 10 *** ");
      {
         float result = 17 / 4.0f;
         PrintLn(result);
      }

      PrintLn(" *** Question 13 *** ");
      {
         int a = 7, b = 24;
         int result = a++ * 4 - --b / 6;
         PrintLn(result);
      }
      PrintLn(" *** Question 19 *** ");
      {
         int a = 10;
         PrintLn(a = 5);
         PrintLn(a);
      }
      PrintLn(" *** Question 20 *** ");
      {
         int a = 10;
         PrintLn(a == 5);
         PrintLn(a);
      }
      PrintLn(" *** Question 21 *** ");
      {
         int a = 7, b = 7;
         a = (b == 7) + 7;
         PrintLn("a = ", a, ", b = ", b);
      }
      PrintLn(" *** Question 25 *** ");
      {
         int a = 7, b = 9, c = 0;
         PrintLn("a) ", a > 2 && a < 8);
         PrintLn("b) ", a < 6 || b > 8);
         PrintLn("c) ", a >= 7 && b < 10);
         PrintLn("d) ", a && b && c);
         PrintLn("e) ", a || c);
         PrintLn("f) ", !a);
         PrintLn("g) ", !b || !c);
         PrintLn("h) ", !!c);
         PrintLn("i) ", !(a > 5 && b == 9));
         PrintLn("j) ", (c = 5) || (a = 0));
         // We need to reset c because j) modified it
         c = 0;
         PrintLn("k) ", !(c > 7 || b <= 9) && !c);
      }
      PrintLn(" *** Question 26 *** ");
      {
         int a = 3, b = 8, c = 9;
         PrintLn(a >= 3 || b < 8 && c != 9);
      }
      PrintLn(" *** Question 28 *** ");
      {
         int a = 7, b = 11, c = 17;
         PrintLn("a) ", a > 6 && IsGreaterThan10(b), ", a = ", a);
         PrintLn("b) ", IsGreaterThan10(a) && (a = 12), ", a = ", a);
         a = 7;
         PrintLn("c) ", (a = 12) && IsGreaterThan10(a), ", a = ", a);
         a = 7;
         PrintLn("d) ", (a = 0) && IsGreaterThan10(a), ", a = ", a);
         a = 7;
         PrintLn("e) ", (c == 12) || IsGreaterThan10(b), ", a = ", a);
         PrintLn("f) ", (b > 8 && a < 4) || IsGreaterThan10(c), ", a = ", a);
         PrintLn("g) ", (c < 16 || b % 2) && IsGreaterThan10(a), ", a = ", a);
         PrintLn("h) ", c - b < a && (a = 12) && IsGreaterThan10(a), ", a = ", a);
         a = 7;
         PrintLn("i) ", (c > 15 && (b = 7)) || IsGreaterThan10(b) || (a = 5), ", a = ", a);
         a = 7; b = 11;
         PrintLn("j) ", b = (a = (c = 12) + (a = 12) + IsGreaterThan10(b) * 12), ", a = ", a);
      }

      PrintLn(" *** Question 29 *** ");
      {
         byte a = 0x5B, b = 0x83;

         // Print/PrintLn are missing a nice way to display in hexadecimal, so we're using printf for that purpose
         printf("a) 0x%02X\n", a & b);
         printf("b) 0x%02X\n", a | b);
         printf("c) 0x%02X\n", a ^ b);
         {
            // There is an eC compiler bug (mantis #108) that prevents a simple cast from working here:
            // printf(" 0x%02X\n", (byte)~a);  // This works in C and should work in eC once the bug is fixed.
            byte result = ~a;
            printf("d) 0x%02X\n", result);
         }
         printf("e) 0x%02X\n", (a & b) ^ b);
         printf("f) 0x%02X\n", a ^ a);
         printf("g) 0x%02X\n", a << 1);
         printf("h) 0x%02X\n", b >> 5);
         printf("i) 0x%02X\n", (a & 0x10) >> 4);
         PrintLn("j) ", (b & 0x0F) == 3);
      }

      PrintLn(" *** Question 31 *** ");
      {
         byte a = 0x05;
         a |= 0x20;
         printf(" 0x%02X\n", a);
      }
      PrintLn(" *** Question 32 *** ");
      {
         byte a = 0x25, b = 0x37;
         a &= 0xF0;
         b &= 0xF0;
         printf("a = 0x%02X, b = 0x%02X\n", a, b);
      }
      PrintLn(" *** Question 33 *** ");
      {
         byte a = 0x25, b = 0x37;
         a &= ~0x0F;
         b &= ~0x0F;
         printf("a = 0x%02X, b = 0x%02X\n", a, b);
      }
      PrintLn(" *** Question 34 *** ");
      {
         byte a = 0x20;
         PrintLn(a & 0x20 == 0x20);
      }
      PrintLn(" *** Question 35 *** ");
      {
         byte a = 0x20;
         PrintLn((a & 0x20) == 0x20);
      }

      system("pause");
   }
}
