import "ecere"

class HelloForm : Window
{
   text = "My First eC Application";
   borderStyle = sizable;
   size = { 280, 100 };
   hasClose = true;

   Label label
   {
      this, position = { 10, 10 }, font = { "Arial", 30 }, 
      text = "Hello, World!!"
   };
};

HelloForm hello { };
