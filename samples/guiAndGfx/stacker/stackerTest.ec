import "ecere"

class Form1 : Window
{
   text = "Form1";
   background = activeBorder;
   borderStyle = sizable;
   hasMaximize = true;
   hasMinimize = true;
   hasClose = true;
   size = { 640, 480 };

   Stacker column
   {
      this, anchor = { 5,5,5,5 };
      clickThrough = true;
   };
   
   Label prompt { column, font = { "Arial", 14, bold = true }, anchor = { horz = 0, top = 10 }, text = "testing" };
   EditBox query
   {
      column, anchor = { horz = 0, top = 38 };


   };

   Stacker row
   {
      column, size = { 200, 60 }, anchor = { left = 0, right = 0 };
      opacity = 0.0f, clickThrough = true, direction = horizontal;
   };

   Button ok
   {
      row, /*position = { 20, 22 }, */text = "testing";
      isDefault = true;
   };
   Button option
   {
      row, /*position = { 60, 22 }, */text = "testing";
   };
   Button cancel
   {
      row, /*position = { 160, 22 }, */text = "testing";
      //isCancel = true;
   };

}

Form1 form1 {};
