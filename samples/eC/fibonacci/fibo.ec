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

   Button button1
   {
      this, text = "Start!", position = { 72, 408 };

      bool NotifyClicked(Button button, int x, int y, Modifiers mods)
      {
         int c;
         char string[10000];
         int len = 0;
         uint64 num1 = 0, num2 = 1;
         Time time = GetTime();
         for(c = 0; c < 94; c++)
         {
            uint64 num = num1 + num2;
            char number[100];
            int l;
            sprintf(number, FORMAT64U, num1);
            l = strlen(number);
            memcpy(string + len, number, l);
            len += l;
            if(c < 93) { string[len++] = ','; string[len++] = ' '; }
            if(!((c+1) % 4)) string[len++] = '\n';
            num1 = num2;
            num2 = num;
         }
         string[len] = 0;
         editBox1.contents = string;
         label1.SetText("%.2f ms", Max(0, (GetTime() - time) * 1000));
         return true;
      }
   };
   Label label1 { this, font = { "Tahoma", 14 }, size = { 176, 29 }, position = { 208, 392 } };
   EditBox editBox1 { this, text = "editBox1", size = { 582, 355 }, position = { 24, 24 }, hasVertScroll = true, readOnly = true, true };
}

Form1 form1 {};
