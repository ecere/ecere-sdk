public import "ecere"
public import "ec2"

ConsoleFile console { };

class Form1 : Window
{
   caption = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   clientSize = { 632, 438 };

   Button button1
   {
      this, caption = "Parse", isDefault = true, position = { 184, 144 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         File f = FileOpen("test.ec", read);
         if(f)
         {
            initParser(f, console);
            {
               AST ast = AST::parse();
               if(ast)
                  ast.print({ /*astType = true*/ });
            }
            /*
            {
               ASTExpression exp = ASTExpression::parse();
               exp.print();
               PrintLn("");
               PrintLn(exp.compute());
            }
            */
            delete f;
         }
         return true;
      }
   };
};

Form1 form1 {};
