import "ecere"

class Form1 : Window
{
   Button button1
   {
      caption = "Click Here", foreground = red;
   };

   bool OnCreate(

   void OnCreate()
   {
      MessageBox mb { contents = "Hello, world!!" };
      mb.Modal();
      MessageBox { contents = "Hello, world!!", anchor.bottom = 20 }.Modal();
      MessageBox mb;
      mb = { };
   }
   Button button1
   {
      caption = "Click Here";
      foreground = red;

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         MessageBox { contents = "Hello, world!!" }.Modal();
         return true;
      }
   };


   int a = 10;
   anchor.right = 10;
   caption = "Form1";
   background = formColor;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };
};

Form1 form1 { caption = "My Form" };

struct InventoryItem
{
   float price = 5;
   String name;

   price = 10.0f;
} item, * itemPtr;

class SomeClass
{

}

int a;

typedef int bla;

int SomeFunction(int * p)
{
   int b[3][4] =
   {
      { 1, 0, 0, 0 },
      { 0, 1, 0, 0 },
      { 0, 0, 1, 0 }
   };
   int c, d, e = 4;
   const String name = "Foo";
   b * a;
   bla blo;

   b = ((a + 3) * a) - (3.1415 * 180 / a);
   a = b = 5*(2 + 10);

again:
   switch(a)
   {
      case 0: PrintLn("0"); printf(""); break;
      case 1: PrintLn("1"); printf(""); break;
      case 2: PrintLn("2"); printf(""); break;
      case 3:
         switch(b)
         {
            case 4:
               PrintLn("Cool");
               break;
            case 5:
               PrintLn("Awesome");
               break;
            default:
               PrintLn("Unbelievable");
         }
         break;
   }
   if(!strcmp(name, "Foo"))
      goto again;

   for(c = 0; c < 10; c++)
      PrintLn(c);
   
   if(a) if(b) s; else s2;

   if(a == 4)
//   {
      if(a == 3)
         PrintLn("3!");
//   }
      else
         PrintLn("not 4, nor 3!");
   c = !b || a ^ b == a < b;
   b = 4 << 5 + a[b]->cool("nice") & 32;

   return eC.awesomeness <<= 1;
}

//3 + 4 * 2
//1 * 2 * 3 * 4
//-10 *23
